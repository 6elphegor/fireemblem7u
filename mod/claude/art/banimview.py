"""Render a battle animation's frames from its sheets and OAM data, to check
the format (and, later, our own animation).

    python3 mod/claude/art/banimview.py banim/BanimScr_058_magm_mg1.s graphics/banim/058_magm_mg1 OUT.png
"""
import re
import struct
import sys

from PIL import Image

SIZES = {  # (shape, size) -> (w, h)
    (0, 0): (8, 8), (0, 1): (16, 16), (0, 2): (32, 32), (0, 3): (64, 64),
    (1, 0): (16, 8), (1, 1): (32, 8), (1, 2): (32, 16), (1, 3): (64, 32),
    (2, 0): (8, 16), (2, 1): (8, 32), (2, 2): (16, 32), (2, 3): (32, 64),
}


def frames_of(script):
    """[(num, sheet index, oam offset)] in order of first use."""
    out, seen, sheets = [], set(), []
    for line in open(script):
        m = re.match(r'\s*banim_frame\s+(\S+),\s*(\S+),\s*(\S+),\s*(\S+)', line)
        if not m:
            continue
        sheet, oam = m.group(3), int(m.group(4), 0)
        if sheet not in sheets:
            sheets.append(sheet)
        key = (sheet, oam)
        if key in seen:
            continue
        seen.add(key)
        num = int(m.group(2), 0)
        idx = int(re.search(r'Sheet(\d+)$', sheet).group(1))
        out.append((num, idx, oam))
    return out


def sprites(oam, off):
    out = []
    while True:
        h, a, b, c = struct.unpack_from('<IHhh', oam, off)
        off += 12
        if h == 1:
            return out
        if h & 0xFFFF0000 == 0xFFFF0000:
            continue  # affine parameters
        attr0, attr1 = h & 0xFFFF, h >> 16
        shape, size = attr0 >> 14, attr1 >> 14
        hflip, vflip = bool(attr1 & 0x1000), bool(attr1 & 0x2000)
        out.append((SIZES[(shape, size)], a & 0x3FF, b, c, hflip, vflip))


def render(sheet, sp, W=240, H=160, ox=120, oy=100):
    im = Image.new('RGBA', (W, H), (0, 0, 0, 0))
    for (w, h), tile, x, y, hf, vf in sp:
        tx, ty = (tile % 32) * 8, (tile // 32) * 8
        piece = sheet.crop((tx, ty, tx + w, ty + h))
        if hf:
            piece = piece.transpose(Image.FLIP_LEFT_RIGHT)
        if vf:
            piece = piece.transpose(Image.FLIP_TOP_BOTTOM)
        im.alpha_composite(piece, (ox + x, oy + y))
    return im


def main():
    script, gdir, out = sys.argv[1:4]
    oam = open(gdir + '/oam_r.bin', 'rb').read()
    frames = frames_of(script)
    sheets = {}
    tiles = []
    for num, idx, off in frames:
        if idx not in sheets:
            s = Image.open('%s/sheet_%d.png' % (gdir, idx)).convert('RGBA')
            px = s.load()
            bg = px[0, 0]
            # color 0 transparent
            p = Image.open('%s/sheet_%d.png' % (gdir, idx))
            idxs = p.load()
            for yy in range(s.height):
                for xx in range(s.width):
                    if idxs[xx, yy] == 0:
                        px[xx, yy] = (0, 0, 0, 0)
            sheets[idx] = s
        tiles.append(render(sheets[idx], sprites(oam, off)))
    cols = 8
    rows = (len(tiles) + cols - 1) // cols
    sheet = Image.new('RGB', (cols * 120, rows * 110), (160, 200, 168))
    for i, t in enumerate(tiles):
        crop = t.crop((60, 10, 180, 120))
        sheet.paste(crop, ((i % cols) * 120, (i // cols) * 110), crop)
    sheet.resize((sheet.width * 2, sheet.height * 2), Image.NEAREST).save(out)
    print(len(frames), 'frames')


if __name__ == '__main__':
    main()
