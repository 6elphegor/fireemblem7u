"""The flower character's map sprites: standing (SMS, 16x32, 3 frames) and
moving (MMS, 32x32, 15 frames), plus its own map palette.

Map sprites share the faction palettes (OBJ palettes 12-15); the flower's
color indices are chosen so that it reads in every one of them (a green
flower as an NPC, red as an enemy, grey once it has moved), and on the
player's side it gets its own palette in OBJ palette 11 (src/mod/claude.c):
entries 0-5 are kept for what the game puts there (Pal_MapSpritePurple),
6-15 are the flower's coral, lavender and white.

Layout of the moving sheet (graphics/unit_icon/move/*.png): 15 frames of
32x32 stacked: 0-3 walking left (right is the mirror), 4-7 down, 8-11 up,
12-14 selected.  Standing sheet: 3 frames of 16x32 stacked (the idle bob).

    python3 mod/claude/art/mapsprite.py OUTDIR
"""

import math
import os
import sys

import numpy as np
from PIL import Image

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from common import SS, capsule, downsample, gba, to_rgb

# indices shared by all the palettes (see the table in the docstring)
# in the faction banks: 6 light skin, 7-10 the faction ramp (dark to light),
# 11 an accent, 12 yellow, 13 shadow, 14 white, 15 outline
JEANS, PET_D, LAV, PET_M, PET_L, HAND, GOLD, SHADOW, FACE, OUTLINE = 6, 7, 8, 9, 10, 11, 12, 13, 14, 15
LAV_M = LAV_L = LAV_D = LAV

# OBJ palette 11 on the player's side: 0-5 as Pal_MapSpritePurple
PAL = [gba(c) for c in [
    (0xA8, 0xD0, 0xA0), (0xF8, 0xF8, 0xF8), (0x98, 0xD0, 0xF8), (0x60, 0xA0, 0xF8),
    (0x20, 0x78, 0xC8), (0x10, 0x48, 0xA0),
    (0xD8, 0xD0, 0xC8),  # 6  embroidery (the analav)
    (0xA8, 0x40, 0x28),  # 7  petal dark
    (0x2C, 0x26, 0x34),  # 8  the black habit
    (0xD8, 0x68, 0x48),  # 9  petal (Claude coral)
    (0xF0, 0x98, 0x70),  # 10 petal light
    (0xC0, 0x60, 0x48),  # 11 mitten hands
    (0xE8, 0xB8, 0x40),  # 12 gold
    (0x80, 0x88, 0x70),  # 13 shadow (as the faction palettes)
    (0xF8, 0xF8, 0xF8),  # 14 face
    (0x40, 0x38, 0x38),  # 15 outline (as the faction palettes)
]]

L2 = np.array([-0.6, -0.8])


def canvas(w, h):
    xs = (np.arange(w * SS) + 0.5) / SS
    ys = (np.arange(h * SS) + 0.5) / SS
    return np.meshgrid(xs, ys)


def draw(w, h, P):
    """A figure in a w x h cell; P: head center, facing, step, rot..."""
    X, Y = canvas(w, h)
    lab = np.zeros((h, w), dtype=np.int32)
    col = np.zeros((h, w), dtype=np.int32)

    def put(mask, label, tone):
        m = downsample(mask, w, h)
        lab[m] = label
        col[m] = tone
        return m

    cx, feet = P['cx'], P['feet']
    face = P['face']            # 'left', 'down', 'up'
    step = P.get('step', 0)     # -1, 0, 1: which leg is forward
    bob = P.get('bob', 0)
    # shadow
    put(((X - cx) / 5.5) ** 2 + ((Y - feet - 0.5) / 1.3) ** 2 <= 1, 1, SHADOW)
    # the robe falls to the feet; it sways with the step
    hip_y = feet - 5 + bob
    sway = step * 0.6
    skirt = (Y >= hip_y - 2) & (Y <= feet) & \
            (np.abs(X - cx - sway * (Y - hip_y) / 5.0) <= 2.4 + (Y - hip_y + 2) * 0.35)
    put(skirt, 2, LAV)
    # tail (behind; to the right when facing left or down)
    if face in ('left', 'down'):
        tx = cx + 3.5
        put(capsule(X, Y, tx - 1, hip_y - 1, tx + 2, hip_y - 4, 0.7, 0.7)[0] |
            capsule(X, Y, tx + 2, hip_y - 4, tx + 1.5, hip_y - 7 + bob, 0.7, 0.7)[0], 4, PET_M)
    # body: the black habit, the analav a white line down the front
    top = hip_y - 6
    body = capsule(X, Y, cx, top + 1, cx, hip_y, 2.8, 2.8)[0]
    m = put(body, 5, LAV)
    Yp = np.arange(h)[:, None] + 0.5
    Xp = np.arange(w)[None, :] + 0.5
    if face != 'up':
        ax = cx - (0.8 if face == 'left' else 0)
        front = ((lab == 5) | (lab == 2)) & (np.abs(Xp - ax) < 0.6) & (Yp > top + 1)
        col[front] = JEANS            # (index 6: the embroidery white)
    # arms (mitten hands, coral)
    if face == 'left':
        put(capsule(X, Y, cx - 1, top + 2, cx - 3 - step * 0.8, top + 4.5, 0.9, 0.9)[0], 6, LAV_D)
        put(((X - (cx - 3.4 - step * 0.8)) ** 2 + (Y - (top + 5)) ** 2) <= 1.3, 7, HAND)
    else:
        for s in (-1, 1):
            put(capsule(X, Y, cx + s * 2.2, top + 2, cx + s * 3.2, top + 4.5 + s * step * 0.6, 0.9, 0.9)[0], 6, LAV_D)
            put(((X - (cx + s * 3.3)) ** 2 + (Y - (top + 5 + s * step * 0.6)) ** 2) <= 1.3, 7, HAND)

    # head: petals and face
    hx, hy = cx + (-0.6 if face == 'left' else 0), top - 5.5 + bob * 0.5
    rot = P.get('rot', 0)
    for k, (a0, lk) in enumerate(((-88, 1.0), (-57, 1.05), (-34, 0.9), (-3, 1.05), (26, 1.0), (64, 0.85),
                                  (88, 1.03), (122, 0.95), (147, 1.05), (184, 0.95), (213, 1.05), (238, 0.95))):
        a = math.radians(a0 + rot)
        dx, dy = math.cos(a), math.sin(a)
        L = 7.2 * lk
        inside, t, s = capsule(X, Y, hx + dx * 2, hy + dy * 2, hx + dx * L, hy + dy * L, 0.9, 1.8)
        facing = (-dy * L2[0] + dx * L2[1])
        tone = PET_L if (dx * L2[0] + dy * L2[1]) > 0.4 else (PET_D if (dx * L2[0] + dy * L2[1]) < -0.5 else PET_M)
        put(inside, 20 + k, tone)
    if face != 'up':
        fx = hx - (0.8 if face == 'left' else 0)
        put(((X - fx) ** 2 + (Y - hy) ** 2) <= 3.1 ** 2, 40, FACE)
    else:
        put(((X - hx) ** 2 + (Y - hy) ** 2) <= 2.6 ** 2, 40, PET_D)
    # the cap: a black dome on the head
    put((((X - hx) / 2.8) ** 2 + ((Y - (hy - 2.6)) / 1.9) ** 2 <= 1) & (Y <= hy - 1.9), 41, LAV)

    # outline on the silhouette; dark petal edges between petals
    pad = np.pad(lab, 1)
    for dy, dx in ((0, 1), (0, -1), (1, 0), (-1, 0)):
        n = pad[1 + dy:h + 1 + dy, 1 + dx:w + 1 + dx]
        edge = (lab > 1) & (n != lab) & ((n <= 1) | (lab > n))
        between = edge & (lab >= 20) & (lab < 40) & (n >= 20) & (n < 40)
        col[edge & ~between] = OUTLINE
        col[between] = PET_D
    # the face, as far as a few pixels allow: ^ ^ and a w
    if face != 'up':
        fx = hx - (0.8 if face == 'left' else 0)
        ix, iy = int(fx), int(hy)
        if face == 'left':
            col[iy - 1, ix - 2] = col[iy - 1, ix] = OUTLINE
            col[iy + 1, ix - 1] = OUTLINE
        else:
            col[iy - 1, ix - 2] = col[iy - 1, ix + 1] = OUTLINE
            col[iy + 1, ix - 1] = col[iy + 1, ix] = OUTLINE
    # the cap's gold cross
    col[int(hy - 5), int(hx)] = GOLD
    return col


def standing():
    frames = []
    for bob, rot in ((0, 0), (1, 5), (0, 10)):
        frames.append(draw(16, 32, dict(cx=8, feet=29, face='down', bob=bob, rot=rot)))
    return np.concatenate(frames, axis=0)


def moving():
    frames = []
    for i in range(4):   # left
        frames.append(draw(32, 32, dict(cx=16, feet=29, face='left', step=(1, 0, -1, 0)[i], bob=(0, 1, 0, 1)[i], rot=i * 7)))
    for i in range(4):   # down
        frames.append(draw(32, 32, dict(cx=16, feet=29, face='down', step=(1, 0, -1, 0)[i], bob=(0, 1, 0, 1)[i], rot=i * 7)))
    for i in range(4):   # up
        frames.append(draw(32, 32, dict(cx=16, feet=29, face='up', step=(1, 0, -1, 0)[i], bob=(0, 1, 0, 1)[i], rot=i * 7)))
    for i in range(3):   # selected: a happy hop
        frames.append(draw(32, 32, dict(cx=16, feet=29 - (0, 1, 2)[i], face='down', rot=i * 10)))
    return np.concatenate(frames, axis=0)


def faction_palettes():
    """The four faction banks (graphics/unit_icon/map_sprite_pal.gbapal) and
    ours, for previews."""
    root = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))))
    d = open(os.path.join(root, 'graphics/unit_icon/map_sprite_pal.gbapal'), 'rb').read()
    banks = []
    for b in range(4):
        cols = [int.from_bytes(d[b * 32 + 2 * i:b * 32 + 2 * i + 2], 'little') for i in range(16)]
        banks.append([((c & 31) << 3, ((c >> 5) & 31) << 3, ((c >> 10) & 31) << 3) for c in cols])
    return banks


def save(path, img):
    im = Image.fromarray(img.astype(np.uint8), mode='P')
    flat = []
    for c in PAL:
        flat += list(c)
    im.putpalette(flat + [0] * (768 - len(flat)))
    im.save(path, bits=4)


def main():
    out = sys.argv[1]
    os.makedirs(out, exist_ok=True)
    sms, mms = standing(), moving()
    save(os.path.join(out, 'map_flower_wait.png'), sms)
    save(os.path.join(out, 'map_flower_move.png'), mms)
    with open(os.path.join(out, 'map_flower_pal.gbapal'), 'wb') as f:
        for r, g, b in PAL:
            f.write(((r >> 3) | ((g >> 3) << 5) | ((b >> 3) << 10)).to_bytes(2, 'little'))
    # preview: moving frames in a row, in our palette and the four factions
    row = np.concatenate([mms[i * 32:(i + 1) * 32] for i in range(15)] + [np.pad(sms[0:32], ((0, 0), (8, 8)))], axis=1)
    rows = [to_rgb(row, PAL, bg=(0x80, 0xA0, 0x80))]
    for bank in faction_palettes():
        rows.append(to_rgb(row, bank, bg=(0x80, 0xA0, 0x80)))
    prev = np.concatenate(rows, axis=0)
    Image.fromarray(prev).resize((prev.shape[1] * 3, prev.shape[0] * 3), Image.NEAREST).save(
        os.path.join(out, 'preview_map.png'))


if __name__ == '__main__':
    main()
