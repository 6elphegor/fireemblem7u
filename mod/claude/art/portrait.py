"""The flower character's portrait: face sheet, mouth frames, mini portrait,
palette, and a preview.

Character design by thebes (Theia Vogel): a coral starburst head of rounded
petals with dark outlines, a round white face with ^ ^ eyes and a "w" mouth,
a lavender long-sleeve top and a coral cat tail.  Rendered in the manner of
FE7's portraits: the head fills the frame, materials are lit from the upper
left with 3-4 tone bands, inner lines use a dark tone of the material and
near-black is kept for the silhouette.

Layout (src/face.c, Sprite_Face96x80, PutFaceEyeSprite, FaceMouth_Loop):
the 256x32 face sheet holds the 64x80 face in three strips plus the 16x32
shoulders, the closed (chr 24) and half-closed (chr 88) eye patches and the
default mouth (chr 28); the mouth image holds six 32x16 patches: smiling
talk frames (chr 0, 8, 16 = idle) and normal ones (24, 32, 40 = idle).

    python3 mod/claude/art/portrait.py OUTDIR
"""

import math
import os
import sys

import numpy as np
from PIL import Image

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from common import SS, capsule, disc, downsample, gba, grid, save_indexed, to_rgb

W, H = 96, 80          # whole portrait with the shoulder strips
MX = 16                # main 64x80 area starts here
CX, CY = 48.0, 30.0    # head center
X_EYES, Y_EYES = 4, 2  # FaceInfo: eye patch at main (8*(x-2), 8*y), 32x16
X_MOUTH, Y_MOUTH = 4, 4

PAL = [gba(c) for c in [
    (0x98, 0xC8, 0xA8),  # 0  transparent (backdrop in previews)
    (0x28, 0x10, 0x18),  # 1  outline, features
    (0x70, 0x20, 0x18),  # 2  petal deep
    (0xA8, 0x40, 0x28),  # 3  petal shadow
    (0xD8, 0x68, 0x48),  # 4  petal (Claude coral)
    (0xF0, 0x90, 0x68),  # 5  petal light
    (0xF8, 0xC8, 0x88),  # 6  petal highlight (warm, toward yellow)
    (0xF8, 0xF8, 0xF0),  # 7  face
    (0xD8, 0xD0, 0xD0),  # 8  face shade
    (0xA0, 0x90, 0xA0),  # 9  face deep shade
    (0xF0, 0x70, 0x78),  # 10 blush, mouth inside
    (0x40, 0x28, 0x68),  # 11 shirt deep
    (0x68, 0x50, 0x98),  # 12 shirt shadow
    (0x90, 0x78, 0xC0),  # 13 shirt
    (0xB8, 0xA0, 0xE0),  # 14 shirt light
    (0xE8, 0xB8, 0x40),  # 15 gold (trim, brooch)
]]
OUTLINE, FACE, FACE_SHADE, FACE_DEEP, BLUSH = 1, 7, 8, 9, 10
PETAL = [2, 3, 4, 5, 6]
SHIRT = [11, 12, 13, 14]
GOLD = 15

L3 = np.array([-0.55, -0.65, 0.52])
L3 /= np.linalg.norm(L3)

# (angle deg, length, tip radius, bend): the front ring, a little irregular
FRONT = [
    (-90, 27.0, 5.5, 0.12), (-61, 27.8, 4.8, -0.10), (-29, 28.2, 5.4, 0.05),
    (1, 28.6, 5.0, -0.08), (31, 27.2, 5.3, 0.10), (59, 27.9, 4.9, -0.04),
    (90, 28.2, 5.6, 0.06), (121, 27.4, 5.0, -0.10), (149, 28.3, 5.3, 0.08),
    (180, 28.8, 5.1, -0.04), (211, 27.3, 5.4, 0.09), (239, 27.1, 4.9, -0.11),
]
BACK = [(a + 15, l - 7.0, r * 0.62, -b) for (a, l, r, b) in FRONT]
PETAL_BASE = 1.9
FACE_R = 15.0

# labels (a higher label is in front)
BG, L_TAIL, L_SHIRT, L_BACK0, L_FRONT0, L_FACE = 0, 1, 2, 20, 40, 90


def px_center(a):
    """Per-pixel value of a supersampled array (sampled at the pixel center)."""
    h, w = a.shape[0] // SS, a.shape[1] // SS
    return a.reshape(h, SS, w, SS)[:, SS // 2, :, SS // 2]


def band(v, cuts, tones):
    """Quantize v by ascending cuts into tones (len(tones) == len(cuts) + 1)."""
    out = np.full(v.shape, tones[0])
    for c, t in zip(cuts, tones[1:]):
        out = np.where(v > c, t, out)
    return out


def petal(X, Y, ang, length, rt, bend, cx=CX, cy=CY, base=PETAL_BASE, r0=8.0):
    """A petal as two capsule segments (a slight bend), with lighting.
    Returns (inside, lit, t along 0..1, s across -1..1)."""
    a = math.radians(ang)
    dx, dy = math.cos(a), math.sin(a)
    mid = r0 + (length - r0) * 0.55
    a2 = a + bend
    ax, ay = cx + dx * r0, cy + dy * r0
    mx, my = cx + dx * mid, cy + dy * mid
    tx = mx + math.cos(a2) * (length - mid)
    ty = my + math.sin(a2) * (length - mid)
    rm = base + (rt - base) * 0.62
    in1, t1, s1 = capsule(X, Y, ax, ay, mx, my, base, rm)
    in2, t2, s2 = capsule(X, Y, mx, my, tx, ty, rm, rt)
    inside = in1 | in2
    use2 = in2 & ~(in1 & (t1 < 0.999))
    t = np.where(use2, 0.55 + 0.45 * t2, 0.55 * t1)
    side = np.where(use2, s2, s1)
    r = np.where(use2, rm + (rt - rm) * t2, base + (rm - base) * t1)
    s = np.clip(side / np.maximum(r, 1e-3), -1, 1)
    # surface normal: half cylinder across the petal, tilted back at the base
    # a flat petal, cupped a little at the edges and tilted back at the base
    nx, ny = -math.sin(a), math.cos(a)
    cup = 0.5 * s * np.abs(s)
    tilt = 0.5 * (1 - t) ** 2 - 0.15 * t
    N = np.stack([nx * cup + dx * tilt, ny * cup + dy * tilt, np.ones_like(s)], axis=-1)
    N /= np.linalg.norm(N, axis=-1, keepdims=True)
    lit_side = np.sign(nx * L3[0] + ny * L3[1]) * s  # > 0: the half facing the light
    return inside, N @ L3, t, lit_side


def ellipsoid_lit(X, Y, cx, cy, rx, ry, flat=0.0):
    u, v = (X - cx) / rx, (Y - cy) / ry
    N = np.stack([u, v, np.sqrt(np.clip(1 - u * u - v * v, 0, 1)) + flat], axis=-1)
    N /= np.linalg.norm(N, axis=-1, keepdims=True)
    return N @ L3, (u * u + v * v) <= 1


def draw_base():
    X, Y = grid(W, H)
    labels = np.zeros((H, W), dtype=np.int32)
    color = np.zeros((H, W), dtype=np.int32)
    Xp, Yp = np.meshgrid(np.arange(W) + 0.5, np.arange(H) + 0.5)

    def put(mask_ss, label, tone_px):
        m = downsample(mask_ss, W, H)
        labels[m] = label
        color[m] = tone_px[m]
        return m

    # tail: behind the body, curling up past the right shoulder
    ts = np.linspace(0, 1, 48)
    P = [np.array(p, dtype=float) for p in [(76, 84), (97, 72), (95, 50), (85, 47)]]
    curve = [((1 - t) ** 3) * P[0] + 3 * ((1 - t) ** 2) * t * P[1]
             + 3 * (1 - t) * t * t * P[2] + t ** 3 * P[3] for t in ts]
    tail = np.zeros(X.shape, dtype=bool)
    tail_lit = np.full(X.shape, -1.0)
    for i in range(len(curve) - 1):
        (ax, ay), (bx, by) = curve[i], curve[i + 1]
        r = 3.6 - 1.4 * ts[i]
        m, t, s = capsule(X, Y, ax, ay, bx, by, r, r)
        d = np.array([bx - ax, by - ay])
        d /= np.linalg.norm(d)
        sn = np.clip(s / r, -1, 1)
        N = np.stack([-d[1] * sn, d[0] * sn, np.sqrt(np.clip(1 - sn * sn, 0, 1))], axis=-1)
        tail_lit = np.where(m, N @ L3, tail_lit)
        tail |= m
    put(tail, L_TAIL, band(px_center(tail_lit), [-0.1, 0.3, 0.72], PETAL[1:5]))

    # shirt: rounded shoulders, a collar, sleeves set off by seams
    sh = capsule(X, Y, 27.0, 67.0, 69.0, 67.0, 13.0, 13.0)[0]
    chest = (Y >= 70) & (np.abs(X - CX) <= 33.6)
    neck = (Y >= 50) & (Y < 68) & (np.abs(X - CX) <= np.minimum(17 + (Y - 50) * 1.2, 26))
    lit, _ = ellipsoid_lit(X, Y, CX, 86, 42, 32)
    tone = band(px_center(lit), [-0.05, 0.35, 0.72], SHIRT)
    # occlusion under the head: a collar shadow
    r_head = np.hypot(Xp - CX, Yp - (CY + 2))
    tone = np.where(r_head < 33.0, SHIRT[1], tone)
    tone = np.where(r_head < 31.0, SHIRT[0], tone)
    # sleeve seams and chest folds
    for x0, x1, y0, y1 in ((64, 62, 73, 80),):
        tt = np.clip((Yp - y0) / (y1 - y0), 0, 1)
        fold = (np.abs(Xp - (x0 + (x1 - x0) * tt)) < 0.6) & (Yp >= y0)
        tone = np.where(fold, SHIRT[1], tone)
    put(sh | chest | neck, L_SHIRT, tone)

    # back ring of petals, then the front ring
    for k, (ang, length, rt, bend) in enumerate(BACK):
        inside, lit, t, s = petal(X, Y, ang, length, rt, bend)
        tl = band(px_center(lit), [0.45, 0.6], PETAL[0:3])
        tl = np.where(px_center(t) < 0.3, PETAL[0], tl)
        put(inside, L_BACK0 + k, tl)
    for k, (ang, length, rt, bend) in enumerate(FRONT):
        inside, lit, t, s = petal(X, Y, ang, length, rt, bend)
        lp, tp, sp = px_center(lit), px_center(t), px_center(s)
        tl = band(lp, [0.4, 0.53, 0.64], PETAL[1:5])
        up = {PETAL[1]: PETAL[2], PETAL[2]: PETAL[3], PETAL[3]: PETAL[4], PETAL[4]: PETAL[4]}
        down = {PETAL[1]: PETAL[0], PETAL[2]: PETAL[1], PETAL[3]: PETAL[2], PETAL[4]: PETAL[3]}
        lift = np.vectorize(lambda v: up.get(v, v))(tl)
        drop = np.vectorize(lambda v: down.get(v, v))(tl)
        # the shaded half of the petal one tone down
        tl = np.where(sp < -0.2, drop, tl)
        # a crease down the middle with a lit edge beside it
        crease = (np.abs(sp) < 0.17) & (tp > 0.14) & (tp < 0.78)
        tl = np.where(crease, drop, tl)
        tl = np.where((sp > 0.17) & (sp < 0.5) & (tp > 0.3) & (tp < 0.8), lift, tl)
        # the base in the face's shadow
        tl = np.where(tp < 0.18, PETAL[1], tl)
        tl = np.where(tp < 0.09, PETAL[0], tl)
        put(inside, L_FRONT0 + k, tl)

    # face: a lit disc, shaded toward the lower right
    lit, _ = ellipsoid_lit(X, Y, CX, CY, FACE_R, FACE_R, flat=0.6)
    put(disc(X, Y, CX, CY, FACE_R), L_FACE,
        band(px_center(lit), [0.12, 0.42], [FACE_DEEP, FACE_SHADE, FACE]))

    # outlines: each boundary is drawn on its front side; near-black on the
    # silhouette, around the face and between rings, a dark tone of the
    # material between petals of one ring and on the shirt against the tail
    pad = np.pad(labels, 1, constant_values=BG)
    kind = np.zeros((H, W), dtype=np.int32)  # 2 dark, 1 inner
    ring = np.where(labels >= L_FRONT0, 2, np.where(labels >= L_BACK0, 1, 0))
    padr = np.pad(ring, 1)
    for dy, dx in ((0, 1), (0, -1), (1, 0), (-1, 0)):
        n = pad[1 + dy:H + 1 + dy, 1 + dx:W + 1 + dx]
        nr = padr[1 + dy:H + 1 + dy, 1 + dx:W + 1 + dx]
        front = (labels != BG) & (n != labels) & ((n == BG) | (labels > n))
        same_ring = (ring > 0) & (ring == nr) & (labels != L_FACE)
        inner = front & (same_ring | ((labels == L_SHIRT) & (n == L_TAIL)))
        dark = front & ~inner
        kind = np.where(dark, 2, np.maximum(kind, np.where(inner, 1, 0)))
    color[kind == 2] = OUTLINE
    color[(kind == 1) & (labels >= L_BACK0)] = PETAL[0]
    color[(kind == 1) & (labels == L_SHIRT)] = SHIRT[0]

    # rim light on the upper-left petal tips
    for k, (ang, length, rt, bend) in enumerate(FRONT):
        if -160 <= ((ang + 180) % 360) - 180 <= -40:
            a = math.radians(ang)
            tx = CX + math.cos(a) * (length - 2.0) - 1.0
            ty = CY + math.sin(a) * (length - 2.0) - 1.0
            m = (labels == L_FRONT0 + k) & (color != OUTLINE) & (np.hypot(Xp - tx, Yp - ty) < 0.9)
            color[m] = PETAL[4]
    color = clean(color, labels)
    ornaments(color, labels, Xp, Yp)
    return color


def ornaments(color, labels, Xp, Yp):
    """The robe's finery, drawn on the cleaned image so its fine pattern
    stays, after FE7's noble mages: a capelet over the shoulders, trimmed
    in gold with gold studs along the hem and coral lining at its front
    opening, fastened at the throat by a gold brooch holding a small coral
    starburst; under it a lighter tunic with a coral stole; a gold collar
    ring shows between the lower petals."""
    robe = (labels == L_SHIRT) & (color != OUTLINE)
    lit, _ = ellipsoid_lit(Xp, Yp, CX, 86, 42, 32)
    r_head = np.hypot(Xp - CX, Yp - (CY + 2))
    shade = r_head < 32.0

    def paint(mask, c):
        m = mask & robe
        color[m] = c if np.isscalar(c) else c[m]

    # tunic: the base robe tones, one step lighter than the capelet
    tunic_tone = band(lit, [0.05, 0.4], [FACE_DEEP, FACE_SHADE, FACE])
    cape_tone = band(lit, [0.0, 0.4, 0.7], SHIRT)
    # capelet: down to a curved hem, open at the front in a V
    hem = 75.0 - 0.012 * (Xp - CX) ** 2 + 0.0 * Xp
    opening = np.abs(Xp - CX) < 4.0 + (Yp - 62.0) * 0.95
    vee = robe & opening & (Yp > 62)
    cape = robe & (Yp < hem) & ~vee
    top = robe & ~cape & ~vee               # the lavender top below the capelet
    tunic = vee | top                        # what the capelet's edges border
    top_tone = band(lit, [0.1, 0.45], SHIRT[1:4])
    color[top & ~shade] = top_tone[top & ~shade]
    color[vee & ~shade] = tunic_tone[vee & ~shade]
    color[cape & ~shade] = cape_tone[cape & ~shade]
    # coral stole down the tunic
    stole = vee & (np.abs(Xp - (CX + 0.5)) < 2.6) & (Yp > 68)
    color[stole] = np.where(lit[stole] > 0.35, PETAL[2], PETAL[1])
    edge = vee & (np.abs(np.abs(Xp - (CX + 0.5)) - 3.1) < 0.55) & (Yp > 68)
    color[edge] = GOLD
    dots = stole & (np.abs(Xp - (CX + 0.5)) < 0.6) & ((np.floor(Yp) % 3) == 0)
    color[dots] = FACE
    # capelet trim: gold piping on the hem and the opening, coral lining
    # turned out along the opening
    inside_edge = np.zeros_like(cape)
    h, w = cape.shape
    for dy, dx in ((0, 1), (0, -1), (1, 0), (-1, 0)):
        sh = np.zeros_like(cape)
        ys = slice(max(dy, 0), h + min(dy, 0))
        yd = slice(max(-dy, 0), h + min(-dy, 0))
        xs = slice(max(dx, 0), w + min(dx, 0))
        xd = slice(max(-dx, 0), w + min(-dx, 0))
        sh[yd, xd] = tunic[ys, xs]
        inside_edge |= cape & sh
    color[inside_edge] = GOLD
    lining = cape & ~inside_edge & ~opening & (np.abs(Xp - CX) < 4.0 + (Yp - 62.0) * 0.95 + 1.8) & (Yp > 62)
    color[lining] = PETAL[2]
    # studs along the hem
    near_hem = cape & (Yp > hem - 2.2) & ~inside_edge
    stud = near_hem & ((np.floor(Xp) % 6) == 0) & (Yp > hem - 1.6)
    color[stud] = GOLD
    # shoulder seams of the capelet
    for fx, k in ((25.0, 0.4), (71.0, -0.4)):
        x = fx + (Yp - 66) * k
        m = cape & (np.abs(Xp - x) < 0.55) & (Yp > 64) & (Yp < hem - 1)
        color[m] = SHIRT[0]
    # collar ring, showing between the lower petals
    paint((r_head > 30.4) & (r_head < 31.6) & (Yp > 50), GOLD)
    paint((r_head >= 31.6) & (r_head < 32.4) & (Yp > 50), PETAL[1])
    # brooch at the throat: a gold disc with a coral starburst
    bx0, by0 = CX, 67.5
    rb = np.hypot(Xp - bx0, Yp - by0)
    on = labels == L_SHIRT
    color[(rb <= 4.4) & on] = OUTLINE
    color[(rb <= 3.6) & on] = GOLD
    color[(rb <= 3.6) & (rb > 2.6) & (Xp - bx0 + Yp - by0 > 1.5) & on] = PETAL[1]
    star = [
        "#.#.#",
        ".###.",
        "##o##",
        ".###.",
        "#.#.#",
    ]
    cxi, cyi = int(bx0), int(by0)
    for j, row in enumerate(star):
        for i, ch in enumerate(row):
            y, x = cyi - 2 + j, cxi - 2 + i
            if ch == '#':
                color[y, x] = PETAL[1]
            elif ch == 'o':
                color[y, x] = PETAL[4]


def clean(color, labels):
    """Pixel-art cleanup: a lone pixel whose same-material neighbours all
    differ from it, 3 or more of them agreeing, takes their color."""
    c = color.copy()
    for y in range(1, c.shape[0] - 1):
        for x in range(1, c.shape[1] - 1):
            if c[y, x] == OUTLINE:
                continue
            nb = [(y - 1, x), (y + 1, x), (y, x - 1), (y, x + 1)]
            same = [c[p] for p in nb if labels[p] == labels[y, x] and c[p] != OUTLINE]
            if len(same) >= 3 and all(v != c[y, x] for v in same):
                vals, cnt = np.unique(same, return_counts=True)
                if cnt.max() >= 3:
                    c[y, x] = vals[cnt.argmax()]
    return c


# Features: '#' outline, 'm' blush / mouth inside, '.' unchanged
EYE_OPEN = [
    "..##..",
    ".####.",
    "##..##",
    "#....#",
]
EYE_HALF = [
    "......",
    "......",
    ".####.",
    "##..##",
]
EYE_CLOSED = [
    "......",
    "......",
    "......",
    "######",
]
MOUTH_W = [
    "#..#..#",
    "#..#..#",
    ".##.##.",
]
MOUTH_W_HALF = [
    "#..#..#",
    "#mm#mm#",
    ".##.##.",
]
MOUTH_W_OPEN = [
    "#.....#",
    "#mmmmm#",
    "#mmmmm#",
    ".#####.",
]
MOUTH_SMILE = [
    "#...#...#",
    "#...#...#",
    ".###.###.",
]
MOUTH_SMILE_HALF = [
    "#...#...#",
    "#mmm#mmm#",
    ".###.###.",
]
MOUTH_SMILE_OPEN = [
    "#.......#",
    "#mmmmmmm#",
    "#mmmmmmm#",
    ".#######.",
]
BLUSH_PAT = ["mm.mm"]

EYE_L = (38, 24)    # top-left of each eye (portrait coordinates)
EYE_R = (52, 24)
MOUTH_C = (48, 33)  # top center of the mouth
BLUSH_L = (35, 31)
BLUSH_R = (56, 31)


def stamp(img, pat, x0, y0):
    for j, row in enumerate(pat):
        for i, ch in enumerate(row):
            if ch == '#':
                img[y0 + j, x0 + i] = OUTLINE
            elif ch == 'm':
                img[y0 + j, x0 + i] = BLUSH


def with_features(base, eyes=EYE_OPEN, mouth=MOUTH_W):
    img = base.copy()
    stamp(img, BLUSH_PAT, *BLUSH_L)
    stamp(img, BLUSH_PAT, *BLUSH_R)
    stamp(img, eyes, *EYE_L)
    stamp(img, [r[::-1] for r in eyes], *EYE_R)
    stamp(img, mouth, MOUTH_C[0] - len(mouth[0]) // 2, MOUTH_C[1])
    return img


def patch(img, xt, yt):
    """The 32x16 patch at FaceInfo tile position (x, y)."""
    x = MX + 8 * (xt - 2)
    y = 8 * yt
    return img[y:y + 16, x:x + 32]


def build_sheet(base):
    full = with_features(base)
    main = full[:, MX:MX + 64]
    sheet = np.zeros((32, 256), dtype=np.int32)
    sheet[:, 0:64] = main[0:32]
    sheet[:, 64:128] = main[32:64]
    sheet[0:16, 128:160] = main[64:80, 0:32]
    sheet[16:32, 128:160] = main[64:80, 32:64]
    sheet[:, 160:176] = full[48:80, 0:16]
    sheet[:, 176:192] = full[48:80, 80:96]
    sheet[0:16, 192:224] = patch(with_features(base, eyes=EYE_CLOSED), X_EYES, Y_EYES)
    sheet[16:32, 192:224] = patch(with_features(base, eyes=EYE_HALF), X_EYES, Y_EYES)
    sheet[0:16, 224:256] = patch(full, X_MOUTH, Y_MOUTH)
    return sheet


def build_mouths(base):
    frames = [MOUTH_SMILE_OPEN, MOUTH_SMILE_HALF, MOUTH_SMILE,
              MOUTH_W_OPEN, MOUTH_W_HALF, MOUTH_W]
    out = np.zeros((96, 32), dtype=np.int32)
    for k, m in enumerate(frames):
        out[16 * k:16 * k + 16] = patch(with_features(base, mouth=m), X_MOUTH, Y_MOUTH)
    return out


def build_chibi():
    """32x32 mini portrait: the head, closer."""
    n = 32
    X, Y = grid(n, n)
    cx, cy = 16.0, 16.0
    labels = np.zeros((n, n), dtype=np.int32)
    color = np.zeros((n, n), dtype=np.int32)
    for k, (ang, length, rt, bend) in enumerate(BACK):
        inside, lit, t, s = petal(X, Y, ang, length * 0.56, rt * 0.55, bend, cx, cy, 1.6, 4.0)
        m = downsample(inside, n, n)
        labels[m] = L_BACK0 + k
        color[m] = band(px_center(lit), [0.2, 0.6], PETAL[0:3])[m]
    for k, (ang, length, rt, bend) in enumerate(FRONT):
        inside, lit, t, s = petal(X, Y, ang, length * 0.56, rt * 0.6, bend, cx, cy, 1.6, 4.0)
        m = downsample(inside, n, n)
        labels[m] = L_FRONT0 + k
        color[m] = band(px_center(lit), [-0.1, 0.35, 0.7], PETAL[1:5])[m]
    fm = downsample(disc(X, Y, cx, cy, 7.6), n, n)
    labels[fm] = L_FACE
    color[fm] = FACE
    pad = np.pad(labels, 1)
    for dy, dx in ((0, 1), (0, -1), (1, 0), (-1, 0)):
        nb = pad[1 + dy:n + 1 + dy, 1 + dx:n + 1 + dx]
        e = (labels != 0) & (nb != labels) & ((nb == 0) | (labels > nb))
        dark = e & ((nb == 0) | (labels == L_FACE) | ((labels >= L_FRONT0) & (nb < L_FRONT0)))
        color[dark] = OUTLINE
        color[e & ~dark] = PETAL[0]
    for (x, y) in [(12, 14), (18, 14)]:
        color[y + 1, x] = color[y, x + 1] = color[y + 1, x + 2] = OUTLINE
    for x, y in [(13, 18), (14, 19), (15, 18), (16, 19), (17, 18)]:
        color[y, x] = OUTLINE
    color[17, 11] = color[17, 20] = BLUSH
    return color


def write_gbapal(path):
    with open(path, 'wb') as f:
        for r, g, b in PAL:
            v = (r >> 3) | ((g >> 3) << 5) | ((b >> 3) << 10)
            f.write(v.to_bytes(2, 'little'))


def preview(base, path):
    states = [
        with_features(base),
        with_features(base, mouth=MOUTH_W_OPEN),
        with_features(base, eyes=EYE_CLOSED),
        with_features(base, mouth=MOUTH_SMILE_OPEN),
    ]
    row = np.concatenate([np.pad(s, ((4, 4), (4, 4))) for s in states], axis=1)
    rgb = to_rgb(row, PAL)
    Image.fromarray(rgb).resize((rgb.shape[1] * 4, rgb.shape[0] * 4), Image.NEAREST).save(path)


def main():
    out = sys.argv[1]
    os.makedirs(out, exist_ok=True)
    base = draw_base()
    save_indexed(os.path.join(out, 'claude_face.png'), build_sheet(base), PAL)
    save_indexed(os.path.join(out, 'claude_mouth.png'), build_mouths(base), PAL)
    chibi = build_chibi()
    save_indexed(os.path.join(out, 'claude_chibi.png'), chibi, PAL)
    write_gbapal(os.path.join(out, 'claude_pal.gbapal'))
    preview(base, os.path.join(out, 'preview_portrait.png'))
    Image.fromarray(to_rgb(chibi, PAL)).resize((128, 128), Image.NEAREST).save(
        os.path.join(out, 'preview_chibi.png'))


if __name__ == '__main__':
    main()
