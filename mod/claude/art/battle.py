"""The flower character's battle animation: frames, sheets, OAM, palette and
script.

Character design by thebes (Theia Vogel).  The flower is drawn as a puppet
(head of petals with the ^ ^ face, lavender capelet and top, jeans, brown
shoes, coral mitten hands and cat tail), posed per frame, facing left (the
right-hand unit); the left-hand unit's OAM is the mirror (tools/banim.py
format, docs in CONTRIBUTING "Battle animation scripts").  The timeline is
the Mage's (banim 058): the same modes, durations and commands (attack
start, spell, hit, sounds), each frame replaced by one of ours.

    python3 mod/claude/art/battle.py OUTDIR
writes OUTDIR/banim_flower_sheet_N.png, banim_flower.{oam_r,oam_l}.bin,
banim_flower_pal.bin (4 banks), BanimScr_flower.s and preview images.
"""

import math
import os
import re
import struct
import sys

import numpy as np
from PIL import Image

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from common import SS, capsule, disc, downsample, gba, grid, to_rgb

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))))

W, H = 112, 96          # frame canvas
OX, OY = 56, 64         # the animation's origin on the canvas

PAL = [gba(c) for c in [
    (0x98, 0xC8, 0xA8),  # 0  transparent
    (0x28, 0x10, 0x18),  # 1  outline, shadow, features
    (0x70, 0x20, 0x18),  # 2  petal deep
    (0xA8, 0x40, 0x28),  # 3  petal shadow
    (0xD8, 0x68, 0x48),  # 4  petal (Claude coral)
    (0xF0, 0x90, 0x68),  # 5  petal light
    (0xF8, 0xF8, 0xF0),  # 6  face
    (0xC8, 0xC0, 0xC8),  # 7  face shade
    (0x14, 0x10, 0x18),  # 8  robe deep (the schema's black)
    (0x28, 0x22, 0x30),  # 9  robe
    (0x44, 0x3C, 0x50),  # 10 robe light
    (0xE0, 0xB0, 0x40),  # 11 gold
    (0xE8, 0xE4, 0xDC),  # 12 embroidery
    (0xA0, 0x98, 0x98),  # 13 embroidery shade
    (0x40, 0x28, 0x20),  # 14 shoes
    (0xF8, 0xF0, 0xC8),  # 15 glow (fluff)
]]
OUTLINE, FACE, FACE_SH = 1, 6, 7
PETAL = [2, 3, 4, 5]
LAV = [8, 9, 10]
GOLD, EMB, EMB_SH, SHOES, GLOW = 11, 12, 13, 14, 15

# the capelet's colors per faction bank (player, enemy, NPC, arena/other)
BANKS = [
    None,
    [(0x30, 0x0C, 0x10), (0x58, 0x18, 0x20), (0x80, 0x30, 0x38)],
    [(0x10, 0x24, 0x14), (0x20, 0x40, 0x28), (0x38, 0x60, 0x40)],
    [(0x20, 0x20, 0x24), (0x40, 0x40, 0x48), (0x60, 0x60, 0x68)],
]

L3 = np.array([-0.55, -0.65, 0.52])
L3 /= np.linalg.norm(L3)

# labels, back to front
(SHADOW, TAIL, ARM_FAR, LEG_FAR, LEG_NEAR, SHOE, TORSO, CAPE, PET_BACK, PET_FRONT,
 FACE_L, ARM_NEAR, HAND, GLOW_L) = range(1, 15)

# (angle, length): the portrait's ring (mod/claude/art/portrait.py), uneven
PETALS = [(-88, 0.95), (-57, 1.02), (-34, 0.9), (-3, 1.03), (26, 0.97), (64, 0.82),
          (88, 1.02), (122, 0.95), (147, 1.04), (184, 0.93), (213, 1.02), (238, 0.96)]


def band(v, cuts, tones):
    out = np.full(v.shape, tones[0])
    for c, t in zip(cuts, tones[1:]):
        out = np.where(v > c, t, out)
    return out


def px_center(a):
    return a.reshape(H, SS, W, SS)[:, SS // 2, :, SS // 2]


class Canvas:
    def __init__(self):
        self.X, self.Y = grid(W, H, -OX, -OY)
        self.labels = np.zeros((H, W), dtype=np.int32)
        self.color = np.zeros((H, W), dtype=np.int32)
        self.Xp, self.Yp = np.meshgrid(np.arange(W) + 0.5 - OX, np.arange(H) + 0.5 - OY)

    def put(self, mask_ss, label, tone):
        m = downsample(mask_ss, W, H)
        self.labels[m] = label
        self.color[m] = tone[m] if isinstance(tone, np.ndarray) else tone
        return m

    def limb(self, pts, r, label, tones):
        """A limb through the points, a cylinder lit from the upper left."""
        X, Y = self.X, self.Y
        mask = np.zeros(X.shape, dtype=bool)
        lit = np.full(X.shape, -1.0)
        for (ax, ay), (bx, by) in zip(pts, pts[1:]):
            m, t, s = capsule(X, Y, ax, ay, bx, by, r, r)
            d = np.array([bx - ax, by - ay], dtype=float)
            d /= max(np.linalg.norm(d), 1e-6)
            sn = np.clip(s / r, -1, 1)
            N = np.stack([-d[1] * sn, d[0] * sn, np.sqrt(np.clip(1 - sn * sn, 0, 1))], axis=-1)
            lit = np.where(m, N @ L3, lit)
            mask |= m
        cuts = [0.1, 0.55][:len(tones) - 1]
        return self.put(mask, label, band(px_center(lit), cuts, tones))

    def blob(self, cx, cy, rx, ry, label, tones, cuts=(0.2, 0.6)):
        X, Y = self.X, self.Y
        u, v = (X - cx) / rx, (Y - cy) / ry
        inside = u * u + v * v <= 1
        N = np.stack([u, v, np.sqrt(np.clip(1 - u * u - v * v, 0, 1)) + 0.3], axis=-1)
        N /= np.linalg.norm(N, axis=-1, keepdims=True)
        return self.put(inside, label, band(px_center(N @ L3), list(cuts)[:len(tones) - 1], tones))


def bezier(p, n=24):
    p = [np.array(q, dtype=float) for q in p]
    return [tuple(((1 - t) ** 3) * p[0] + 3 * ((1 - t) ** 2) * t * p[1]
                  + 3 * (1 - t) * t * t * p[2] + t ** 3 * p[3]) for t in np.linspace(0, 1, n)]


def draw(pose):
    """One frame: an index image (H, W), origin at (OX, OY)."""
    c = Canvas()
    P = dict(STAND)
    P.update(pose)
    bx, by = P['dx'], P['dy']           # whole body (hops, dodges)
    cr = P['crouch']
    lean = P['lean']

    # shadow on the ground (stays on the ground)
    c.put(((c.X - P['dx'] * 0.5) / 11.0) ** 2 + ((c.Y - 15.0) / 2.2) ** 2 <= 1, SHADOW, OUTLINE)

    hip = (bx + 1 + lean * 0.3, by + 3 + cr)
    sh_y = by - 5 + cr * 1.5
    neck = (bx + lean, sh_y - 3)

    # tail: from behind the hips, curling up behind
    ph = P['tail']
    tail = bezier([(hip[0] + 3, hip[1] - 1), (hip[0] + 11, hip[1] + 2 + ph),
                   (hip[0] + 15 + ph * 0.5, hip[1] - 9), (hip[0] + 11, hip[1] - 13 - ph)])
    c.limb(tail, 1.3, TAIL, [PETAL[1], PETAL[2], PETAL[3]])

    # far arm (behind)
    sfar = (bx + 4 + lean, sh_y + 1)
    c.limb([sfar, P['far'][0], P['far'][1]], 1.7, ARM_FAR, [LAV[0], LAV[1]])
    c.blob(P['far'][1][0], P['far'][1][1], 2.1, 2.1, HAND, [PETAL[1], PETAL[2]])

    # the robe falls to the ground; the shoes peek out at the front
    gy = 13 + by
    for fx in (5, -4):
        c.limb([(bx + fx + 0.5, gy + 0.6), (bx + fx - 2.8, gy + 1.0)], 1.5, SHOE, [SHOES, SHOES])
    X, Y = c.X, c.Y
    top_y = hip[1] - 3
    frac = np.clip((Y - top_y) / max(gy - top_y, 1), 0, 1)
    cxr = hip[0] - lean * 0.3 * frac
    skirt = (Y >= top_y) & (Y <= gy + 0.3) & (np.abs(X - cxr - 0.5) <= 5.5 + frac * 4.5)
    side = (X - cxr) / (5.5 + frac * 4.5 + 1e-3)
    tone = np.where(side < -0.35, LAV[2], np.where(side > 0.45, LAV[0], LAV[1]))
    c.put(skirt, LEG_NEAR, px_center(tone))

    # torso: the black habit
    c.limb([(neck[0] + 0.5, sh_y + 1), (hip[0], hip[1] - 1)], 4.8, TORSO, [LAV[0], LAV[1], LAV[2]])
    # the mantle over the shoulders, falling wide
    cape_c = (neck[0] + 0.5, sh_y + 2.5)
    c.blob(cape_c[0], cape_c[1], 8.5, 6.0, CAPE, [LAV[0], LAV[1], LAV[2]], cuts=(0.25, 0.62))
    # the analav: a white band down the front, a cross on it, gold edges
    ax0 = neck[0] - 1.0
    band = ((c.labels == CAPE) | (c.labels == TORSO) | (c.labels == LEG_NEAR)) & \
           (np.abs(c.Xp - (ax0 + (c.Yp - sh_y) * -lean * 0.04)) < 1.1) & (c.Yp > sh_y - 1)
    c.color[band] = EMB
    edge = ((c.labels == CAPE) | (c.labels == TORSO) | (c.labels == LEG_NEAR)) & \
           (np.abs(np.abs(c.Xp - ax0) - 1.7) < 0.5) & (c.Yp > sh_y - 1)
    c.color[edge] = GOLD
    cxi, cyi = int(round(ax0 + OX)), int(round(sh_y + 5 + OY))
    for (x, y) in ((0, -1), (0, 0), (0, 1), (0, 2), (-1, 0), (1, 0)):
        if band[cyi + y, cxi + x]:
            c.color[cyi + y, cxi + x] = OUTLINE

    # petals: back ring then front ring, around the head center
    hx, hy = neck[0] + P['head_dx'] - 1, sh_y - 15 + P['head_dy']
    rot = P['rot']
    sc = P['pscale']
    X, Y = c.X, c.Y
    for ring, label, length, rt, off in ((1, PET_FRONT, 14.5, 3.1, 0),):
        for k, (a0, lk) in enumerate(PETALS):
            a = math.radians(a0 + off + rot)
            dx, dy = math.cos(a), math.sin(a)
            L = length * lk * sc
            inside, t, s = capsule(X, Y, hx + dx * 5.0, hy + dy * 5.0, hx + dx * L, hy + dy * L, 1.4, rt * sc)
            nx, ny = -dy, dx
            facing = np.sign(nx * L3[0] + ny * L3[1])
            lit = 0.52 + 0.35 * (dx * -L3[0] + dy * -L3[1]) * 0.6
            tone = np.full(X.shape, PETAL[2] if ring else PETAL[1])
            tone = np.where(s * facing < -0.9, PETAL[1] if ring else PETAL[0], tone)
            if ring:
                tone = np.where((s * facing > 0.5) & (t > 0.3), PETAL[3], tone)
                tone = np.where(t < 0.2, PETAL[1], tone)
                if lit < 0.45:
                    tone = np.where(tone == PETAL[2], PETAL[1], tone)
            c.put(inside, label * 100 + k, px_center(tone))
    # face, turned a little toward the enemy (left)
    fx, fy = hx - 1.0, hy + 0.5
    c.blob(fx, fy, 7.6, 7.6, FACE_L * 100, [FACE_SH, FACE], cuts=(0.22,))
    # the cap: a black dome on the head, a white rim
    dome = (((X - fx) / 7.0) ** 2 + ((Y - (fy - 4.5)) / 5.5) ** 2 <= 1) & (Y <= fy - 2.5)
    c.put(dome, FACE_L * 100 + 50, LAV[1])

    # near arm (in front)
    snear = (bx - 4 + lean, sh_y + 1)
    c.limb([snear, P['near'][0], P['near'][1]], 1.8, ARM_NEAR, [LAV[1], LAV[2]])
    c.blob(P['near'][1][0], P['near'][1][1], 2.2, 2.2, HAND + 100, [PETAL[2], PETAL[3]])

    # outlines: each boundary on its front side
    lab = c.labels
    ring_of = np.where(lab // 100 == PET_FRONT, 2, np.where(lab // 100 == PET_BACK, 1, 0))
    pad = np.pad(lab, 1)
    padr = np.pad(ring_of, 1)
    col = c.color
    for dy, dx in ((0, 1), (0, -1), (1, 0), (-1, 0)):
        n = pad[1 + dy:H + 1 + dy, 1 + dx:W + 1 + dx]
        nr = padr[1 + dy:H + 1 + dy, 1 + dx:W + 1 + dx]
        front = (lab != 0) & (lab != SHADOW) & (n != lab) & ((n == 0) | (lab > n))
        same_ring = (ring_of > 0) & (ring_of == nr)
        col[front & same_ring] = PETAL[0]
        col[front & ~same_ring] = OUTLINE

    # features: ^ ^ and w, or closed eyes for effort
    ix, iy = int(round(fx + OX)), int(round(fy + OY))
    def stamp(pat, x0, y0, colors={'#': OUTLINE, 'm': PETAL[2]}):
        for j, row in enumerate(pat):
            for i, ch in enumerate(row):
                if ch in colors:
                    col[y0 + j, x0 + i] = colors[ch]
    # the cap's rim and its gold cross
    rim = (lab == FACE_L * 100 + 50) & (c.Yp > fy - 4.0)
    col[rim] = EMB
    col[iy - 12, ix] = col[iy - 11, ix] = col[iy - 11, ix - 1] = col[iy - 11, ix + 1] = GOLD
    # ^ ^ and w, or closed eyes for effort; a blush
    eyes = {'happy': [".#.", "#.#"], 'closed': ["...", "###"]}[P['eyes']]
    stamp(eyes, ix - 5, iy - 2)
    stamp(eyes, ix + 2, iy - 2)
    mouth = {'w': ["#.#.#", ".#.#."], 'o': [".###.", ".#m#.", "..#.."]}[P['mouth']]
    stamp(mouth, ix - 2, iy + 1)
    col[iy, ix - 5] = col[iy, ix + 4] = PETAL[3]

    # magic glow
    if P['glow']:
        gx, gy2, gr = P['glow']
        rr = np.hypot(c.Xp - gx, c.Yp - gy2)
        col[rr <= gr + 1.2] = EMB_SH
        col[rr <= gr + 0.4] = EMB
        col[rr <= gr * 0.55] = GLOW
        lab[rr <= gr + 1.2] = GLOW_L
        # sparkles
        for k in range(6):
            a = math.radians(k * 60 + rot * 2)
            sx, sy = gx + math.cos(a) * (gr + 3.5), gy2 + math.sin(a) * (gr + 3.5)
            ix2, iy2 = int(round(sx + OX)), int(round(sy + OY))
            if 0 <= iy2 < H and 0 <= ix2 < W:
                col[iy2, ix2] = GLOW
    if P['halo']:
        rr = np.hypot(c.Xp - hx, c.Yp - hy)
        hal = (np.abs(rr - P['halo']) < 0.6) & (lab == 0)
        col[hal] = GOLD
        for k in range(12):
            a = math.radians(k * 30 + 15 + rot)
            sx, sy = hx + math.cos(a) * (P['halo'] + 2.5), hy + math.sin(a) * (P['halo'] + 2.5)
            ix2, iy2 = int(round(sx + OX)), int(round(sy + OY))
            if 0 <= iy2 < H and 0 <= ix2 < W and lab[iy2, ix2] == 0:
                col[iy2, ix2] = GLOW
    return col


# --- poses ---------------------------------------------------------------------

STAND = dict(dx=0, dy=0, crouch=0, lean=0, head_dx=0, head_dy=0, rot=0, pscale=1.0,
             near=((-6, 1), (-6.5, 5)), far=((6, 1), (6.5, 5)), tail=0,
             eyes='happy', mouth='w', glow=None, halo=0)

V_ARMS = dict(near=((-9, -7), (-12, -12)), far=((9, -7), (12, -12)))
THRUST = dict(lean=-2, head_dx=-1, near=((-9, -6), (-14, -8)), far=((8, -2), (10, 2)))

POSES = {
    0: {},
    1: dict(crouch=1, lean=1, near=((-5, 2), (-3, 6)), far=((7, 2), (8, 5)), tail=1),
    2: dict(crouch=0.5, near=((-8, -3), (-11, -7)), far=((8, -3), (11, -7)), rot=5, tail=2),
    3: dict(**V_ARMS, rot=10, tail=2),
    4: dict(**V_ARMS, rot=20, pscale=1.03, eyes='closed', glow=(-13, -13, 1.2)),
    5: dict(**V_ARMS, rot=35, pscale=1.05, eyes='closed', glow=(-13, -13, 2.2), tail=1),
    6: dict(**V_ARMS, rot=50, pscale=1.07, eyes='closed', glow=(-13, -13, 3.2), tail=0),
    7: dict(**V_ARMS, rot=65, pscale=1.08, eyes='closed', glow=(-13, -13, 4.0), tail=-1),
    8: dict(**THRUST, rot=80, pscale=1.12, mouth='o', glow=(-17, -9, 5.0), tail=-2),
    9: dict(**THRUST, rot=84, pscale=1.1, mouth='o', glow=(-17, -9, 3.5), tail=-2),
    10: dict(**THRUST, rot=87, pscale=1.07, mouth='o', glow=(-17, -9, 2.0), tail=-1),
    11: dict(**THRUST, rot=89, pscale=1.04, glow=(-17, -9, 1.0), tail=0),
    39: dict(**THRUST, rot=90, pscale=1.02, tail=0),
    12: dict(**THRUST, rot=90, tail=1),
    13: dict(**THRUST, rot=92, tail=2),
    14: dict(**THRUST, rot=90, tail=2),
    15: dict(**THRUST, rot=88, tail=1),
    16: dict(**THRUST, rot=90, tail=0),
    17: dict(**THRUST, rot=91, tail=-1),
    18: dict(**THRUST, rot=90, tail=0),
    19: dict(lean=-1, near=((-7, -1), (-9, 3)), far=((7, 0), (8, 4)), rot=90, tail=1),
    20: dict(near=((-6, 1), (-7, 5)), rot=90, tail=0),
    # critical: a hop and a full spin, then the petals flare
    21: dict(crouch=2.5, lean=1, near=((-5, 3), (-3, 7)), far=((7, 3), (8, 6)), tail=2),
    22: dict(dy=-4, **V_ARMS, rot=15, tail=3),
    23: dict(dy=-8, near=((-10, -5), (-14, -8)), far=((10, -5), (14, -8)), rot=40, tail=3),
    24: dict(dy=-9, near=((-10, -5), (-14, -8)), far=((10, -5), (14, -8)), rot=70, eyes='closed', tail=2),
    25: dict(dy=-6, **V_ARMS, rot=100, pscale=1.12, eyes='closed', tail=1),
    26: dict(dy=-1, crouch=1.5, **V_ARMS, rot=125, pscale=1.2, tail=0),
    34: dict(**V_ARMS, rot=140, pscale=1.3, halo=21, glow=(-13, -13, 2.5)),
    35: dict(**V_ARMS, rot=150, pscale=1.22, halo=19, glow=(-13, -13, 3.5)),
    36: dict(**V_ARMS, rot=160, pscale=1.28, halo=22, eyes='closed', glow=(-13, -13, 4.2)),
    37: dict(**V_ARMS, rot=170, pscale=1.15, halo=20, glow=(-13, -13, 3.0)),
    38: dict(**V_ARMS, rot=180, pscale=1.05, glow=(-13, -13, 1.8)),
    # dodge: lean back and step away
    27: dict(dx=7, lean=2, head_dx=2, near=((-3, -3), (-6, -7)), far=((9, 0), (11, 3)), tail=3),
    28: dict(dx=12, lean=3, head_dx=3, near=((0, -3), (-3, -7)), far=((13, 0), (15, 3)), tail=4),
    # unused by the Mage's modes we keep, kept for completeness
    29: {}, 31: dict(**THRUST, rot=90), 32: dict(**THRUST, rot=90, tail=1), 33: dict(dx=7, lean=2),
}


def pose_for(num):
    p = dict(POSES[num])
    # absolute arm points are relative to the body; move them with dx/dy
    for arm in ('near', 'far'):
        if arm in p:
            (ex, ey), (hx, hy) = p[arm]
        else:
            (ex, ey), (hx, hy) = STAND[arm]
        ox, oy = p.get('dx', 0), p.get('dy', 0) + p.get('crouch', 0) * 1.5
        p[arm] = ((ex + ox, ey + oy), (hx + ox, hy + oy))
    if 'glow' in p and p['glow']:
        gx, gy, gr = p['glow']
        p['glow'] = (gx + p.get('dx', 0), gy + p.get('dy', 0), gr)
    return p


# --- sheets and OAM -------------------------------------------------------------

SHAPES = {  # (w, h) in tiles -> (shape, size)
    (1, 1): (0, 0), (2, 2): (0, 1), (4, 4): (0, 2), (8, 8): (0, 3),
    (2, 1): (1, 0), (4, 1): (1, 1), (4, 2): (1, 2), (8, 4): (1, 3),
    (1, 2): (2, 0), (1, 4): (2, 1), (2, 4): (2, 2), (4, 8): (2, 3),
}


def pieces(img):
    """Cover the frame's non-empty 8x8 tiles with OBJ shapes: [(tx, ty, tw, th)]
    in tiles relative to the canvas.  Greedy: largest shape first, placed at
    the first uncovered tile, trimmed to few empty tiles."""
    th, tw = H // 8, W // 8
    tiles = img.reshape(th, 8, tw, 8).any(axis=(1, 3))
    covered = np.zeros_like(tiles)
    out = []
    order = sorted(SHAPES, key=lambda s: -s[0] * s[1])
    for ty in range(th):
        for tx in range(tw):
            if not tiles[ty, tx] or covered[ty, tx]:
                continue
            best = None
            for (w, h) in order:
                if tx + w > tw or ty + h > th:
                    continue
                region = tiles[ty:ty + h, tx:tx + w]
                cov = covered[ty:ty + h, tx:tx + w]
                useful = (region & ~cov).sum()
                if cov.any():
                    continue
                # prefer big shapes that are mostly full
                if useful >= 0.6 * w * h or (w, h) == (1, 1):
                    best = (w, h)
                    break
            w, h = best
            covered[ty:ty + h, tx:tx + w] = True
            out.append((tx, ty, w, h))
    return out


class SheetPacker:
    """256x64 4bpp sheets (32x8 tiles), shelf-packed; one frame per sheet."""

    def __init__(self):
        self.sheets = []
        self._new()

    def _new(self):
        self.sheets.append(np.zeros((64, 256), dtype=np.int32))
        self.used = np.zeros((8, 32), dtype=bool)

    def _find(self, w, h):
        for ty in range(8 - h + 1):
            for tx in range(32 - w + 1):
                if not self.used[ty:ty + h, tx:tx + w].any():
                    return tx, ty
        return None

    def place_frame(self, img, parts):
        """Place a frame's pieces in one sheet; returns (sheet, [(tile index,
        piece)])."""
        for attempt in (0, 1):
            saved = self.used.copy()
            spots = []
            for (tx, ty, w, h) in sorted(parts, key=lambda p: -p[2] * p[3]):
                at = self._find(w, h)
                if at is None:
                    break
                self.used[at[1]:at[1] + h, at[0]:at[0] + w] = True
                spots.append((at, (tx, ty, w, h)))
            else:
                sheet = self.sheets[-1]
                out = []
                for (sx, sy), (tx, ty, w, h) in spots:
                    sheet[sy * 8:(sy + h) * 8, sx * 8:(sx + w) * 8] = img[ty * 8:(ty + h) * 8, tx * 8:(tx + w) * 8]
                    out.append((sy * 32 + sx, (tx, ty, w, h)))
                return len(self.sheets) - 1, out
            self.used = saved
            if attempt == 0:
                self._new()
        sys.exit('battle: a frame does not fit in one sheet')


def oam_entries(placed, mirror):
    out = b''
    for tile, (tx, ty, w, h) in placed:
        shape, size = SHAPES[(w, h)]
        x, y = tx * 8 - OX, ty * 8 - OY
        attr0, attr1 = shape << 14, size << 14
        if mirror:
            attr1 |= 0x1000
            x = -x - w * 8
        # struct AnimSpriteData: 12 bytes (u32 header, u16 oam2, s16 x, s16 y, pad)
        out += struct.pack('<IHhhH', attr0 | (attr1 << 16), tile, x, y, 0)
    return out + struct.pack('<IHhhH', 1, 0, 0, 0, 0)


def verify(frames, frame_at, sheets, oam_r, oam_l):
    """Decode every frame back from its sheet and OAM, the way the game reads
    them (12-byte records, header 1 ends a frame), and require the drawn
    image, pixel for pixel; the left side must be its mirror."""
    size_of = {v: k for k, v in SHAPES.items()}
    for n, img in frames.items():
        sheet, off = frame_at[n]
        for oam, mirror in ((oam_r, False), (oam_l, True)):
            out = np.zeros_like(img)
            o = off
            while True:
                h, tile, x, y, _ = struct.unpack_from('<IHhhH', oam, o)
                o += 12
                if h == 1:
                    break
                attr0, attr1 = h & 0xFFFF, h >> 16
                w, hh = size_of[(attr0 >> 14, attr1 >> 14)]
                if bool(attr1 & 0x1000) != mirror:
                    sys.exit(f'battle: frame {n}: flip bit wrong')
                if mirror:
                    x = -x - w * 8
                sx, sy = (tile % 32) * 8, (tile // 32) * 8
                out[y + OY:y + OY + hh * 8, x + OX:x + OX + w * 8] = sheets[sheet][sy:sy + hh * 8, sx:sx + w * 8]
            if not np.array_equal(out, img):
                sys.exit(f'battle: frame {n} does not decode to its image ({"L" if mirror else "R"})')


# --- script ---------------------------------------------------------------------

def write_script(path, frame_at):
    """Our script: the Mage's (banim 058) with each frame replaced."""
    src = open(os.path.join(ROOT, 'banim/BanimScr_058_magm_mg1.s')).read()
    body = src.split('banim_script BanimScr_058_magm_mg1', 1)[1].split('banim_modes', 1)[0]

    def frame(m):
        dur, num = m.group(1), int(m.group(2))
        sheet, off = frame_at[num]
        return f'banim_frame {dur}, {num}, Img_Banim_Flower_Sheet{sheet}, {off:#x}'
    body = re.sub(r'banim_frame (\d+), (\d+), \w+, 0x[0-9a-f]+', frame, body)
    # command 0x47 (71) starts the Mage's cloak flapping (NewEfxMantBatabata):
    # it hides the caster and draws a cloak from fixed tiles of the Mage's
    # sheets, so the flower's script leaves it out
    body = re.sub(r'\n\s*banim_cmd 0x47\n', '\n', body)
    with open(path, 'w') as f:
        f.write('@ Battle animation script of the flower character (mod/claude/art/battle.py):\n'
                '@ the Mage\'s timeline (banim 058) with the flower\'s frames.\n\n'
                '\t.include "banim_script.inc"\n\n'
                '\tbanim_script BanimScr_Flower\n' + body + 'banim_modes BanimModes_Flower\n')


def write_pal(path):
    banks = []
    for b in BANKS:
        pal = list(PAL)
        if b:
            for i, c in zip(LAV, b):
                pal[i] = gba(c)
        banks += pal
    with open(path, 'wb') as f:
        for r, g, b in banks:
            f.write(((r >> 3) | ((g >> 3) << 5) | ((b >> 3) << 10)).to_bytes(2, 'little'))


def main():
    out = sys.argv[1]
    os.makedirs(out, exist_ok=True)
    nums = sorted(POSES)
    packer = SheetPacker()
    oam_r, oam_l = b'', b''
    frame_at = {}
    frames = {}
    for n in nums:
        img = draw(pose_for(n))
        frames[n] = img
        parts = pieces(img != 0)
        sheet, placed = packer.place_frame(img, parts)
        frame_at[n] = (sheet, len(oam_r))
        oam_r += oam_entries(placed, False)
        oam_l += oam_entries(placed, True)
    verify(frames, frame_at, packer.sheets, oam_r, oam_l)
    for i, s in enumerate(packer.sheets):
        im = Image.fromarray(s.astype(np.uint8), mode='P')
        flat = []
        for c in PAL:
            flat += list(c)
        im.putpalette(flat + [0] * (768 - len(flat)))
        im.save(os.path.join(out, f'banim_flower_sheet_{i}.png'), bits=4)
    open(os.path.join(out, 'banim_flower.oam_r.bin'), 'wb').write(oam_r)
    open(os.path.join(out, 'banim_flower.oam_l.bin'), 'wb').write(oam_l)
    write_pal(os.path.join(out, 'banim_flower_pal.bin'))
    write_script(os.path.join(out, 'BanimScr_Flower.s'), frame_at)
    # preview: every frame on a backdrop, 2x
    cols = 8
    rows = (len(nums) + cols - 1) // cols
    sheet = np.zeros((rows * H, cols * W), dtype=np.int32)
    for i, n in enumerate(nums):
        sheet[(i // cols) * H:(i // cols + 1) * H, (i % cols) * W:(i % cols + 1) * W] = frames[n]
    rgb = to_rgb(sheet, PAL)
    Image.fromarray(rgb).resize((rgb.shape[1] * 2, rgb.shape[0] * 2), Image.NEAREST).save(
        os.path.join(out, 'preview_battle.png'))
    print(f'{len(nums)} frames, {len(packer.sheets)} sheets, oam {len(oam_r):#x} bytes')


if __name__ == '__main__':
    main()
