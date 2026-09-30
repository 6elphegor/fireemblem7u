"""Sprites of the Petal tome's spell effect (src/mod/claude_petal.c): petals
in 8 rotations, small (8x8, tiles 0-7) and large (16x16, tiles 64 + 2k),
and two sparkles (8x8, tiles 8 and 9), as the spell's OBJ tiles
(SpellFx_RegisterObjGfx: a 256x32 sheet, 2D mapping, 32 tiles a row) and
palette (OBJ palette 2).

    python3 mod/claude/art/petalfx.py OUTDIR
"""
import math
import os
import sys

import numpy as np
from PIL import Image

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from common import SS, downsample, gba, to_rgb

PAL = [gba(c) for c in [
    (0x00, 0x00, 0x00),  # 0 transparent
    (0x70, 0x20, 0x18),  # 1 outline
    (0xB0, 0x48, 0x30),  # 2 coral dark
    (0xD8, 0x68, 0x48),  # 3 coral (Claude)
    (0xF0, 0x98, 0x70),  # 4 coral light
    (0xF8, 0xD0, 0xA8),  # 5 highlight
    (0xF8, 0xF8, 0xF0),  # 6 white
    (0xF8, 0xD8, 0x60),  # 7 gold
    (0xE8, 0xA0, 0x30),  # 8 gold dark
] + [(0, 0, 0)] * 7]


def petal(size, angle):
    """A teardrop petal, rotated; lit from the upper left."""
    n = size
    xs = (np.arange(n * SS) + 0.5) / SS - n / 2
    X, Y = np.meshgrid(xs, xs)
    a = math.radians(angle)
    u = X * math.cos(a) + Y * math.sin(a)       # along the petal
    v = -X * math.sin(a) + Y * math.cos(a)      # across
    half = n * 0.44
    t = np.clip((u + half) / (2 * half), 0, 1)  # 0 at the base, 1 at the tip
    # narrow at the base, widest past the middle, a round tip
    width = n * (0.36 if n > 8 else 0.5) * np.sin(np.pi * np.clip(t, 0, 1)) ** 0.7 * (0.3 + 0.7 * t)
    inside = (np.abs(u) <= half) & (np.abs(v) <= width) & (t > 0.02)
    m = downsample(inside, n, n)
    out = np.zeros((n, n), dtype=np.int32)
    px = (np.arange(n) + 0.5) - n / 2
    PX, PY = np.meshgrid(px, px)
    pu = PX * math.cos(a) + PY * math.sin(a)
    pv = -PX * math.sin(a) + PY * math.cos(a)
    lit = -(PX + PY) / n
    tone = np.where(lit > 0.15, 4, np.where(lit < -0.2, 2, 3))
    tone = np.where((np.abs(pv) < 0.6) & (pu > -half * 0.5), 5 if n > 8 else 4, tone)
    out[m] = tone[m]
    # outline on the silhouette
    pad = np.pad(m, 1)
    edge = m & ~(pad[:-2, 1:-1] & pad[2:, 1:-1] & pad[1:-1, :-2] & pad[1:-1, 2:])
    out[edge] = 1 if n > 8 else 2
    return out


def sparkle(big):
    s = np.zeros((8, 8), dtype=np.int32)
    if big:
        s[3:5, 1:7] = 7
        s[1:7, 3:5] = 7
        s[3:5, 3:5] = 6
        s[2, 2] = s[2, 5] = s[5, 2] = s[5, 5] = 8
    else:
        s[3:5, 3:5] = 6
        s[2, 3:5] = s[5, 3:5] = s[3:5, 2] = s[3:5, 5] = 7
    return s


def main():
    out = sys.argv[1]
    sheet = np.zeros((32, 256), dtype=np.int32)
    for k in range(8):
        sheet[0:8, k * 8:k * 8 + 8] = petal(8, k * 45)
        sheet[16:32, k * 16:k * 16 + 16] = petal(16, k * 45)  # tile 64 + 2k
    sheet[0:8, 64:72] = sparkle(False)   # tile 8
    sheet[0:8, 72:80] = sparkle(True)    # tile 9
    im = Image.fromarray(sheet.astype(np.uint8), mode='P')
    flat = []
    for c in PAL:
        flat += list(c)
    im.putpalette(flat + [0] * (768 - len(flat)))
    im.save(os.path.join(out, 'petalfx.png'), bits=4)
    with open(os.path.join(out, 'petalfx_pal.gbapal'), 'wb') as f:
        for r, g, b in PAL:
            f.write(((r >> 3) | ((g >> 3) << 5) | ((b >> 3) << 10)).to_bytes(2, 'little'))
    rgb = to_rgb(sheet[:, :128], PAL, bg=(0x80, 0xA0, 0x80))
    Image.fromarray(rgb).resize((128 * 6, 32 * 6), Image.NEAREST).save(os.path.join(out, 'preview_petalfx.png'))


if __name__ == '__main__':
    main()
