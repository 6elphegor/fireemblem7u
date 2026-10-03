"""Sprites of the flower's tome spell (src/mod/claude_petal.c): a dandelion
clock gone to seed, whose seeds drift to the target.  The spell's OBJ tiles
(SpellFx_RegisterObjGfx: a 256x32 sheet, 2D mapping, 32 tiles a row) and
palette (OBJ palette 2):

  tiles 0-7      small seeds, 8x8, 8 tilts
  tiles 8, 9     fluff tufts, 8x8 (the burst)
  tiles 64 + 2k  large seeds, 16x16, 8 tilts (rows 2-3)
  tiles 16 + 4f  the clock, 32x32, 4 stages: full, two thinning, bare stem

    python3 mod/claude/art/dandelionfx.py OUTDIR
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
    (0x50, 0x48, 0x40),  # 1 dark (the clock's heart)
    (0x80, 0x58, 0x34),  # 2 seed
    (0x98, 0x98, 0x78),  # 3 stem
    (0xB8, 0xB8, 0xB0),  # 4 fluff shade
    (0xD8, 0xD8, 0xD0),  # 5 fluff
    (0xF8, 0xF8, 0xF0),  # 6 fluff bright
    (0xF8, 0xF0, 0xC8),  # 7 warm glint
    (0x60, 0x80, 0x48),  # 8 stalk green
] + [(0, 0, 0)] * 7]


def segment(img, x0, y0, x1, y1, c, w=0.6, n=None):
    """Draw a line by supersampled distance (thin, for filaments)."""
    h, wd = img.shape
    xs = (np.arange(wd * SS) + 0.5) / SS
    ys = (np.arange(h * SS) + 0.5) / SS
    X, Y = np.meshgrid(xs, ys)
    dx, dy = x1 - x0, y1 - y0
    L2 = dx * dx + dy * dy or 1e-6
    t = np.clip(((X - x0) * dx + (Y - y0) * dy) / L2, 0, 1)
    d = np.hypot(X - (x0 + t * dx), Y - (y0 + t * dy))
    m = downsample(d <= w, wd, h, 0.3)
    img[m] = c


def seed(size, angle):
    """A dandelion seed: a fan of fine filaments over a thin stem with the
    seed at its foot; tilted by angle (degrees, 0 = upright)."""
    img = np.zeros((size, size), dtype=np.int32)
    k = size / 16.0
    a = math.radians(angle)
    ca, sa = math.cos(a), math.sin(a)

    def P(x, y):  # rotate about the center
        cx = cy = size / 2
        x, y = x - cx, y - cy
        return cx + x * ca - y * sa, cy + x * sa + y * ca

    top = (size / 2, size * 0.30)
    foot = (size / 2, size * 0.92)
    segment(img, *P(*foot), *P(*top), 3, 0.45 * max(k, 0.8))
    # the parachute: filaments fanning up from the stem's top
    for j in range(-4, 5):
        th = math.radians(j * 19)
        r = size * (0.30 if j % 2 else 0.26)
        x1 = top[0] + math.sin(th) * r
        y1 = top[1] - math.cos(th) * r * 0.75
        segment(img, *P(*top), *P(x1, y1), 5 if abs(j) > 2 else 6, 0.4 * max(k, 0.8))
    # the seed
    fx, fy = P(*foot)
    sx, sy = P(foot[0], foot[1] - size * 0.12)
    segment(img, fx, fy, sx, sy, 2, 0.7 * max(k, 0.8))
    return img


def clock(stage):
    """The clock, 32x32: a round, see-through sphere of seeds on its stalk,
    the parachutes making a bright rim; stage 0 full, 1 and 2 thinning (the
    seeds gone from the side the wind took), 3 the bare head."""
    img = np.zeros((32, 32), dtype=np.int32)
    cx, cy, R = 16.0, 13.0, 11.0
    segment(img, cx, cy + 1.5, cx + 1, 31.5, 8, 0.7)
    rng = np.random.default_rng(7)
    n = 160
    # points over a sphere, seen from the front: (x, y, z)
    z = rng.uniform(-1, 1, n)
    th = rng.uniform(0, 2 * math.pi, n)
    xy = np.sqrt(1 - z * z)
    for i in np.argsort(z):              # back to front
        x, y = xy[i] * math.cos(th[i]), xy[i] * math.sin(th[i])
        gone = (stage == 1 and x > 0.3) or (stage == 2 and x > -0.35) or stage == 3
        if gone:
            continue
        x1, y1 = cx + x * R, cy + y * R
        lit = -0.6 * x - 0.7 * y + 0.4 * z[i]
        shade = 6 if lit > 0.25 else (5 if lit > -0.3 else 4)
        if z[i] > -0.2:                   # the stems in front show, faint
            segment(img, cx, cy, cx + x * R * 0.8, cy + y * R * 0.8, 4, 0.25)
        img[int(y1), int(x1)] = shade     # the parachute
        if 0 <= int(y1) + 1 < 32 and lit > 0.4:
            img[int(y1), min(int(x1) + 1, 31)] = 5
    # the heart: a small dark point, larger once bare
    img[int(cy), int(cx)] = 1
    if stage == 3:
        for (x, y) in ((-1, 0), (1, 0), (0, -1), (0, 1)):
            img[int(cy) + y, int(cx) + x] = 1
    return img


def tuft(big):
    t = np.zeros((8, 8), dtype=np.int32)
    pts = [(3, 3), (4, 3), (3, 4), (4, 4)] if not big else [(2, 3), (3, 2), (4, 3), (3, 4), (3, 3), (5, 4), (4, 5), (2, 5)]
    for x, y in pts:
        t[y, x] = 6 if (x + y) % 2 else 5
    if big:
        t[1, 3] = t[3, 6] = t[6, 2] = 4
    return t


def main():
    out = sys.argv[1]
    sheet = np.zeros((32, 256), dtype=np.int32)
    for k in range(8):
        tilt = (k - 3.5) * 14          # -49..49 degrees
        sheet[0:8, k * 8:k * 8 + 8] = seed(8, tilt)
        sheet[16:32, k * 16:k * 16 + 16] = seed(16, tilt)
    sheet[0:8, 64:72] = tuft(False)
    sheet[0:8, 72:80] = tuft(True)
    for f in range(4):
        sheet[0:32, 128 + f * 32:160 + f * 32] = clock(f)
    im = Image.fromarray(sheet.astype(np.uint8), mode='P')
    flat = []
    for c in PAL:
        flat += list(c)
    im.putpalette(flat + [0] * (768 - len(flat)))
    im.save(os.path.join(out, 'dandelionfx.png'), bits=4)
    with open(os.path.join(out, 'dandelionfx_pal.gbapal'), 'wb') as f:
        for r, g, b in PAL:
            f.write(((r >> 3) | ((g >> 3) << 5) | ((b >> 3) << 10)).to_bytes(2, 'little'))
    rgb = to_rgb(sheet, PAL, bg=(0x50, 0x68, 0x58))
    Image.fromarray(rgb).resize((256 * 4, 32 * 4), Image.NEAREST).save(os.path.join(out, 'preview_dandelionfx.png'))


if __name__ == '__main__':
    main()
