"""Shared drawing helpers for the flower character's pixel art.

Everything is drawn at the GBA's native resolution from geometry: shapes are
sampled 4x4 per pixel and a pixel belongs to a shape when at least half of it
is covered (no anti-aliasing: GBA art is hard-edged).  Colors are GBA 5-bit
(multiples of 8).
"""

import math

import numpy as np
from PIL import Image

SS = 4  # supersampling per axis


def gba(rgb):
    """Round an (r, g, b) triple to the GBA's 5-bit channels."""
    return tuple((c >> 3) << 3 for c in rgb)


def grid(w, h, x0=0.0, y0=0.0):
    """Sample coordinates (x, y), shape (h*SS, w*SS), pixel centers of subsamples."""
    xs = x0 + (np.arange(w * SS) + 0.5) / SS
    ys = y0 + (np.arange(h * SS) + 0.5) / SS
    return np.meshgrid(xs, ys)


def downsample(mask, w, h, thresh=0.5):
    """Coverage of a supersampled boolean mask -> per-pixel boolean."""
    cov = mask.reshape(h, SS, w, SS).mean(axis=(1, 3))
    return cov >= thresh


def capsule(X, Y, ax, ay, bx, by, r0, r1):
    """Tapered capsule from (ax, ay) radius r0 to (bx, by) radius r1.

    Returns (inside mask, t along the axis 0..1, signed side offset)."""
    dx, dy = bx - ax, by - ay
    L2 = dx * dx + dy * dy
    t = np.clip(((X - ax) * dx + (Y - ay) * dy) / L2, 0.0, 1.0)
    px, py = ax + t * dx, ay + t * dy
    ex, ey = X - px, Y - py
    d = np.hypot(ex, ey)
    r = r0 + (r1 - r0) * t
    side = (ex * -dy + ey * dx) / math.sqrt(L2)
    return d <= r, t, side


def disc(X, Y, cx, cy, r):
    return (X - cx) ** 2 + (Y - cy) ** 2 <= r * r


def outline(labels, empty=0, keep=()):
    """Pixels of a non-empty label that touch a different label (4-neighbour)
    or the empty background.  `keep`: labels that never become outline."""
    h, w = labels.shape
    out = np.zeros_like(labels, dtype=bool)
    pad = np.pad(labels, 1, constant_values=empty)
    c = pad[1:-1, 1:-1]
    for dy, dx in ((0, 1), (0, -1), (1, 0), (-1, 0)):
        n = pad[1 + dy:h + 1 + dy, 1 + dx:w + 1 + dx]
        out |= (c != empty) & (n != c)
    for k in keep:
        out &= labels != k
    return out


def save_indexed(path, idx, palette, scale=1):
    """Write an indexed PNG (palette: list of up to 16 (r, g, b))."""
    im = Image.fromarray(idx.astype(np.uint8), mode='P')
    pal = []
    for c in palette:
        pal += list(c)
    pal += [0] * (768 - len(pal))
    im.putpalette(pal)
    if scale != 1:
        im = im.resize((im.width * scale, im.height * scale), Image.NEAREST)
    im.save(path, bits=4 if scale == 1 else 8, optimize=False)
    return im


def to_rgb(idx, palette, bg=None):
    pal = np.array(palette, dtype=np.uint8)
    rgb = pal[idx]
    if bg is not None:
        rgb[idx == 0] = bg
    return rgb
