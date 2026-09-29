/*
 * Scanline renderer for the GBA picture: see ppu.h.
 *
 * Each line is drawn in three steps: the layers into line buffers (four
 * backgrounds, the sprite layer with its priority and semi-transparency per
 * pixel, the OBJ window mask), the window control of every pixel, then per
 * pixel the two topmost visible layers and the color effect between them.
 *
 * The rules are GBATEK's.  Where hardware details matter to the picture
 * (sprite tile address wrapping, the transparent-pixel priority quirk of
 * overlapping sprites, the per-line sprite time budget, the delay before a
 * background enabled mid-frame shows, mosaic at the edges of sprites and
 * affine layers), the renderer does what mGBA 0.10's software renderer does,
 * since that is what it is verified against (platform/tools/ppucapture.c).
 * With PPU_COLOR_MGBA it also does mGBA's color arithmetic on 8-bit
 * channels, so both outputs can be compared bit for bit.
 */
#include <string.h>

#include "ppu.h"

#define W PPU_WIDTH
#define H PPU_HEIGHT

enum { ENABLED_MAX = 4 };

/* line buffer pixel: OPAQUE | BGR555 */
#define OPAQUE 0x80000000u

enum {
    REG_DISPCNT = 0x00, REG_BG0CNT = 0x08, REG_BG0HOFS = 0x10, REG_BG2PA = 0x20,
    REG_BG2X = 0x28, REG_BG2Y = 0x2C, REG_BG3PA = 0x30, REG_BG3X = 0x38, REG_BG3Y = 0x3C,
    REG_WIN0H = 0x40, REG_WIN1H = 0x42, REG_WIN0V = 0x44, REG_WIN1V = 0x46,
    REG_WININ = 0x48, REG_WINOUT = 0x4A, REG_MOSAIC = 0x4C, REG_BLDCNT = 0x50,
    REG_BLDALPHA = 0x52, REG_BLDY = 0x54,
};

struct Line {
    uint32_t bg[4][W];     /* OPAQUE | color, 0: transparent */
    uint32_t obj[W];       /* OPAQUE | color of the sprite layer */
    uint8_t objPrio[W];    /* its priority; 4: no sprite pixel */
    uint8_t objSemi[W];    /* semi-transparent sprite */
    uint8_t objWin[W];     /* covered by an OBJ window sprite */
    uint8_t win[W];        /* window control bits (0x3F: everything) */
};

static inline uint16_t rd16(const uint8_t *p, uint32_t off)
{
    return (uint16_t)(p[off] | (p[off + 1] << 8));
}

static inline uint16_t io16(const struct Ppu *ppu, uint32_t off)
{
    return rd16(ppu->io, off);
}

static inline uint16_t pal16(const struct Ppu *ppu, uint32_t index)
{
    return rd16(ppu->pal, (index & 0x1FF) * 2) & 0x7FFF;
}

/* 28-bit signed reference point register */
static int32_t io_ref(const struct Ppu *ppu, uint32_t off)
{
    uint32_t v = rd16(ppu->io, off) | ((uint32_t)rd16(ppu->io, off + 2) << 16);
    return (int32_t)(v << 4) >> 4;
}

void ppu_init(struct Ppu *ppu, const uint8_t *io, const uint8_t *pal, const uint8_t *vram,
              const uint8_t *oam, uint32_t *fb)
{
    memset(ppu, 0, sizeof *ppu);
    ppu->io = io;
    ppu->pal = pal;
    ppu->vram = vram;
    ppu->oam = oam;
    ppu->fb = fb;
}

void ppu_io_written(struct Ppu *ppu, uint32_t offset)
{
    offset &= ~1u;
    if (offset >= REG_BG2X && offset < REG_BG2X + 8)
        ppu->reload |= 1 << ((offset - REG_BG2X) >> 2);
    else if (offset >= REG_BG3X && offset < REG_BG3X + 8)
        ppu->reload |= 4 << ((offset - REG_BG3X) >> 2);
}

/* ---- backgrounds ---- */

/* Text (tiled, scrolling) background. */
static void draw_text_bg(const struct Ppu *ppu, int b, int y, uint32_t *out)
{
    uint16_t cnt = io16(ppu, REG_BG0CNT + 2 * b);
    uint16_t mos = io16(ppu, REG_MOSAIC);
    int hofs = io16(ppu, REG_BG0HOFS + 4 * b) & 0x1FF;
    int vofs = io16(ppu, REG_BG0HOFS + 4 * b + 2) & 0x1FF;
    uint32_t charBase = ((cnt >> 2) & 3) * 0x4000u;
    uint32_t screenBase = ((cnt >> 8) & 0x1F) * 0x800u;
    int is8 = (cnt >> 7) & 1, size = cnt >> 14;
    int mosH = 1, inY, x;

    if (cnt & 0x40) {
        int mosV = ((mos >> 4) & 0xF) + 1;
        y -= y % mosV;
        mosH = (mos & 0xF) + 1;
    }
    inY = y + vofs;
    for (x = 0; x < W; x++) {
        int px = (x - x % mosH + hofs) & 0x1FF;
        uint32_t map = screenBase + (((inY >> 3) & 0x1F) * 32 + ((px >> 3) & 0x1F)) * 2;
        uint16_t entry;
        int row, col;
        uint32_t addr;
        unsigned color;

        if ((size & 1) && (px & 0x100))
            map += 0x800;
        if (inY & 0x100) {
            if (size == 2)
                map += 0x800;
            else if (size == 3)
                map += 0x1000;
        }
        if (map >= 0x10000)
            continue;
        entry = rd16(ppu->vram, map);
        row = inY & 7;
        col = px & 7;
        if (entry & 0x800)
            row = 7 - row;
        if (entry & 0x400)
            col = 7 - col;
        if (!is8) {
            addr = charBase + (entry & 0x3FF) * 32u + row * 4 + (col >> 1);
            if (addr >= 0x10000) /* backgrounds can't reach sprite VRAM */
                continue;
            color = (ppu->vram[addr] >> ((col & 1) * 4)) & 0xF;
            if (color)
                out[x] = OPAQUE | pal16(ppu, (entry >> 12) * 16 + color);
        } else {
            addr = charBase + (entry & 0x3FF) * 64u + row * 8 + col;
            if (addr >= 0x10000)
                continue;
            color = ppu->vram[addr];
            if (color)
                out[x] = OPAQUE | pal16(ppu, color);
        }
    }
}

/* Mosaic set-up shared by the affine and bitmap layers: the start point of
 * the line and the horizontal sample spacing, as mGBA computes them. */
struct AffineWalk {
    int32_t x, y, pa, pc;
    int mosaic, wait, spacing;
};

static void affine_begin(const struct Ppu *ppu, int bg, int y, struct AffineWalk *w)
{
    uint32_t r = REG_BG2PA + (bg - 2) * 0x10;
    uint16_t cnt = io16(ppu, REG_BG0CNT + 2 * bg);
    uint16_t mos = io16(ppu, REG_MOSAIC);
    int32_t pb = (int16_t)io16(ppu, r + 2), pd = (int16_t)io16(ppu, r + 6);

    w->pa = (int16_t)io16(ppu, r);
    w->pc = (int16_t)io16(ppu, r + 4);
    /* one step before pixel 0: the loops advance before sampling */
    w->x = ppu->affX[bg - 2] - w->pa;
    w->y = ppu->affY[bg - 2] - w->pc;
    w->mosaic = (cnt >> 6) & 1;
    w->wait = 0;
    w->spacing = 0;
    if (w->mosaic) {
        int mosV = ((mos >> 4) & 0xF) + 1;
        /* vertical mosaic: back to the first line of the block */
        w->x -= (y % mosV) * pb;
        w->y -= (y % mosV) * pd;
        w->spacing = mos & 0xF; /* pixels that repeat the sample */
    }
}

static void draw_affine_bg(const struct Ppu *ppu, int bg, int y, uint32_t *out)
{
    uint16_t cnt = io16(ppu, REG_BG0CNT + 2 * bg);
    uint32_t charBase = ((cnt >> 2) & 3) * 0x4000u;
    uint32_t screenBase = ((cnt >> 8) & 0x1F) * 0x800u;
    int size = cnt >> 14, wrap = (cnt >> 13) & 1;
    int32_t mask = (0x8000 << size) - 1; /* .8 fixed point */
    struct AffineWalk w;
    unsigned pixel = 0;
    int x;

    affine_begin(ppu, bg, y, &w);
    /* mGBA mosaics affine layers only from a size of 3 pixels up */
    if (ppu->colorMath == PPU_COLOR_MGBA && w.spacing <= 1)
        w.spacing = 0;
    for (x = 0; x < W; x++) {
        int32_t lx, ly;
        w.x += w.pa;
        w.y += w.pc;
        if (w.spacing && w.wait) {
            w.wait--;
        } else {
            uint32_t map, addr;
            if (wrap) {
                lx = w.x & mask;
                ly = w.y & mask;
            } else {
                if ((w.x | w.y) & ~mask)
                    continue; /* outside: transparent (and the next pixel samples again) */
                lx = w.x;
                ly = w.y;
            }
            map = screenBase + (uint32_t)(lx >> 11) + ((uint32_t)((ly >> 7) & 0x7F0) << size);
            pixel = 0;
            if (map < 0x10000) {
                addr = charBase + ppu->vram[map] * 64u + ((ly & 0x700) >> 5) + ((lx & 0x700) >> 8);
                if (addr < 0x10000)
                    pixel = ppu->vram[addr];
            }
            w.wait = w.spacing;
        }
        if (pixel)
            out[x] = OPAQUE | pal16(ppu, pixel);
    }
}

/* Modes 3-5: BG2 as a bitmap, through the affine transformation. */
static void draw_bitmap_bg(const struct Ppu *ppu, int mode, int y, uint32_t *out)
{
    uint16_t dispcnt = io16(ppu, REG_DISPCNT);
    uint32_t frame = (mode != 3 && (dispcnt & 0x10)) ? 0xA000 : 0;
    int bw = mode == 5 ? 160 : 240, bh = mode == 5 ? 128 : 160;
    struct AffineWalk w;
    uint32_t color = 0;
    int x;

    affine_begin(ppu, 2, y, &w);
    for (x = 0; x < W; x++) {
        w.x += w.pa;
        w.y += w.pc;
        if ((w.x < 0 || w.y < 0 || (w.x >> 8) >= bw || (w.y >> 8) >= bh) && !w.wait)
            continue;
        if (!w.wait) {
            uint32_t i = (uint32_t)((w.x >> 8) + (w.y >> 8) * bw);
            if (mode == 4) {
                uint8_t index = ppu->vram[frame + i];
                color = index ? OPAQUE | pal16(ppu, index) : 0;
            } else {
                color = OPAQUE | (rd16(ppu->vram, frame + i * 2) & 0x7FFF);
            }
            w.wait = w.spacing;
        } else {
            w.wait--;
        }
        if (color)
            out[x] = color;
    }
}

/* ---- sprites ---- */

static const uint8_t sObjSize[16][2] = {
    { 8, 8 },  { 16, 16 }, { 32, 32 }, { 64, 64 },
    { 16, 8 }, { 32, 8 },  { 32, 16 }, { 64, 32 },
    { 8, 16 }, { 8, 32 },  { 16, 32 }, { 32, 64 },
    { 0, 0 },  { 0, 0 },   { 0, 0 },   { 0, 0 },
};

struct Sprite {
    const struct Ppu *ppu;
    struct Line *line;
    int is8, prio, semi, objwin;
    uint32_t charBase, maskLo, maskHi, stride;
    unsigned palBase;
};

/* Color index of texel (lx, ly) of the sprite: OBJ VRAM is 32 KiB, and
 * with 2D mapping each row of tiles wraps within its 1 KiB. */
static unsigned sprite_texel(const struct Sprite *s, int lx, int ly)
{
    uint32_t xBase, yBase, addr;
    uint16_t data;
    if (!s->is8) {
        xBase = (uint32_t)(lx & ~7) * 4 + ((lx >> 1) & 2);
        yBase = (uint32_t)(ly & ~7) * s->stride + (ly & 7) * 4 + s->maskHi;
    } else {
        xBase = (uint32_t)(lx & ~7) * 8 + (lx & 6);
        yBase = (uint32_t)(ly & ~7) * s->stride + (ly & 7) * 8 + s->maskHi;
    }
    addr = (yBase + ((xBase + s->charBase) & s->maskLo)) & 0x7FFE;
    data = rd16(s->ppu->vram, 0x10000 + addr);
    if (!s->is8)
        return (data >> ((lx & 3) * 4)) & 0xF;
    return (data >> ((lx & 1) * 8)) & 0xFF;
}

static void sprite_pixel(const struct Sprite *s, int x, unsigned texel)
{
    struct Line *l = s->line;
    if (s->objwin) {
        if (texel)
            l->objWin[x] = 1;
        return;
    }
    /* A sprite of better priority than what the layer holds takes the
     * pixel; where it is transparent it still lends the pixel its priority
     * (and semi-transparency) and keeps the color. */
    if (l->objPrio[x] > s->prio) {
        if (texel) {
            l->obj[x] = OPAQUE | pal16(s->ppu, 0x100 + s->palBase + texel);
            l->objPrio[x] = (uint8_t)s->prio;
            l->objSemi[x] = (uint8_t)s->semi;
        } else if (l->obj[x]) {
            l->objPrio[x] = (uint8_t)s->prio;
            l->objSemi[x] = (uint8_t)s->semi;
        }
    }
}

static void draw_sprite(const struct Ppu *ppu, struct Line *line, const uint8_t *o, int y, int w, int h)
{
    uint16_t a0 = rd16(o, 0), a1 = rd16(o, 2), a2 = rd16(o, 4);
    uint16_t dispcnt = io16(ppu, REG_DISPCNT), mos = io16(ppu, REG_MOSAIC);
    int oneD = (dispcnt >> 6) & 1, mode = (a0 >> 10) & 3;
    int x = (int32_t)((uint32_t)a1 << 23) >> 23;
    int ySpr = a0 & 0xFF, tile = a2 & 0x3FF;
    int inY = y - ySpr, outX, condition, inX, mosH = 1;
    struct Sprite s;
    unsigned align;

    if ((dispcnt & 7) >= 3 && tile < 512)
        return; /* bitmap modes use the lower half of sprite VRAM */
    s.ppu = ppu;
    s.line = line;
    s.is8 = (a0 >> 13) & 1;
    s.prio = (a2 >> 10) & 3;
    s.semi = mode == 1;
    s.objwin = mode == 2;
    s.palBase = s.is8 ? 0 : (a2 >> 12) * 16u;
    align = s.is8 && !oneD;
    s.charBase = (tile & ~align) * 0x20u;
    s.maskLo = oneD ? 0x7FFE : 0x3FE;
    s.maskHi = oneD ? 0 : s.charBase & 0x7C00;
    s.stride = oneD ? (uint32_t)(w >> !s.is8) : 0x80;

    if (a0 & 0x100) {
        /* affine */
        int dbl = (a0 >> 9) & 1, tw = w << dbl, th = h << dbl;
        const uint8_t *m = ppu->oam + ((a1 >> 9) & 0x1F) * 32;
        int32_t pa = (int16_t)rd16(m, 6), pb = (int16_t)rd16(m, 14);
        int32_t pc = (int16_t)rd16(m, 22), pd = (int16_t)rd16(m, 30);
        int32_t xAcc, yAcc;
        int lx, ly;

        if (inY < 0)
            inY += 256;
        outX = x >= 0 ? x : 0;
        condition = x + tw;
        inX = outX - x;
        if (condition > W)
            condition = W;
        if (a0 & 0x1000) {
            mosH = (mos >> 8 & 0xF) + 1;
            if (condition != W && condition % mosH)
                condition += mosH - condition % mosH;
        }
        /* texture coordinates one pixel before outX (.8 fixed point) */
        xAcc = pa * (inX - 1 - (tw >> 1)) + pb * (inY - (th >> 1)) + (w << 7);
        yAcc = pc * (inX - 1 - (tw >> 1)) + pd * (inY - (th >> 1)) + (h << 7);
        /* skip ahead to where the line enters the sprite (mGBA's clipping) */
        if (pa) {
            int32_t n = 0;
            if ((xAcc >> 8) < 0)
                n = (-xAcc - 1) / pa;
            else if ((xAcc >> 8) >= w)
                n = ((w << 8) - xAcc) / pa;
            xAcc += pa * n;
            yAcc += pc * n;
            outX += n;
            inX += n;
        }
        if (pc) {
            int32_t n = 0;
            if ((yAcc >> 8) < 0)
                n = (-yAcc - 1) / pc;
            else if ((yAcc >> 8) >= h)
                n = ((h << 8) - yAcc) / pc;
            xAcc += pa * n;
            yAcc += pc * n;
            outX += n;
            inX += n;
        }
        if (outX < 0 || outX >= condition)
            return;
        if (mosH > 1 && !s.objwin) {
            lx = xAcc >> 8;
            ly = yAcc >> 8;
            for (; outX < condition; outX++, inX++) {
                xAcc += pa;
                yAcc += pc;
                if (outX % mosH == 0) {
                    lx = xAcc >> 8;
                    ly = yAcc >> 8;
                }
                if ((lx & ~(w - 1)) || (ly & ~(h - 1)))
                    continue;
                sprite_pixel(&s, outX, sprite_texel(&s, lx, ly));
            }
        } else {
            for (; outX < condition; outX++, inX++) {
                xAcc += pa;
                yAcc += pc;
                lx = xAcc >> 8;
                ly = yAcc >> 8;
                if ((lx & ~(w - 1)) || (ly & ~(h - 1)))
                    break; /* the line has left the sprite */
                sprite_pixel(&s, outX, sprite_texel(&s, lx, ly));
            }
        }
    } else {
        int step = 1;
        outX = x >= 0 ? x : 0;
        condition = x + w;
        if (a0 & 0x1000) {
            mosH = (mos >> 8 & 0xF) + 1;
            if (condition % mosH)
                condition += mosH - condition % mosH;
        }
        if (ySpr + h - 256 >= 0)
            inY += 256;
        if (a1 & 0x2000)
            inY = h - inY - 1;
        if (condition > W)
            condition = W;
        inX = outX - x;
        if (a1 & 0x1000) {
            inX = w - inX - 1;
            step = -1;
        }
        for (; outX < condition; outX++, inX += step) {
            int lx = inX;
            if (mosH > 1 && !s.objwin) {
                lx = inX - step * (outX % mosH);
                if (lx < 0)
                    lx = 0;
                else if (lx > w - 1)
                    lx = w - 1;
            }
            sprite_pixel(&s, outX, sprite_texel(&s, lx, inY));
        }
    }
}

static void draw_sprites(const struct Ppu *ppu, struct Line *line, int y)
{
    uint16_t dispcnt = io16(ppu, REG_DISPCNT), mos = io16(ppu, REG_MOSAIC);
    int cycles = (dispcnt & 0x20) ? 954 : 1210; /* the line's sprite time budget */
    int mosV = ((mos >> 12) & 0xF) + 1;
    int i;

    for (i = 0; i < 128; i++) {
        const uint8_t *o = ppu->oam + i * 8;
        uint16_t a0 = rd16(o, 0), a1 = rd16(o, 2);
        int w = sObjSize[(a0 >> 14) * 4 + (a1 >> 14)][0];
        int h = sObjSize[(a0 >> 14) * 4 + (a1 >> 14)][1];
        int cost = w, ySpr = a0 & 0xFF, xSpr = a1 & 0x1FF, endY, localY;

        if (!(a0 & 0x100) && (a0 & 0x200))
            continue; /* hidden */
        if (a0 & 0x100) {
            int dbl = (a0 >> 9) & 1;
            cost = 10 + (w << dbl) * 2;
            endY = ySpr + (h << dbl);
            if (xSpr >= W && xSpr + (w << dbl) < 512)
                continue;
        } else {
            endY = ySpr + h;
            if (xSpr >= W && xSpr + w < 512)
                continue;
        }
        if (ySpr >= H && endY < 228)
            continue;
        if ((y < ySpr && (endY - 256 < 0 || y >= endY - 256)) || y >= endY)
            continue; /* not on this line */
        localY = y;
        if ((a0 & 0x1000) && mosV > 1) {
            localY = y - y % mosV;
            if (localY < ySpr && ySpr < H)
                localY = ySpr;
            if (localY >= (endY & 0xFF))
                localY = endY - 1;
        }
        if (w)
            draw_sprite(ppu, line, o, localY, w, h);
        cycles -= cost;
        if (cycles <= 0)
            break;
    }
}

/* ---- windows ---- */

static void window_bounds(uint16_t reg, int limit, int *start, int *end)
{
    *end = reg & 0xFF;
    *start = reg >> 8;
    if (*start > limit && *start > *end)
        *start = 0;
    if (*end > limit) {
        *end = limit;
        if (*start > limit)
            *start = limit;
    }
}

static void apply_window(const struct Ppu *ppu, struct Line *line, int n, int y)
{
    int hs, he, vs, ve, x;
    uint8_t ctl = (io16(ppu, REG_WININ) >> (8 * n)) & 0x3F;
    window_bounds(io16(ppu, REG_WIN0H + 2 * n), W, &hs, &he);
    window_bounds(io16(ppu, REG_WIN0V + 2 * n), H, &vs, &ve);
    if (ve >= vs ? (y < vs || y >= ve) : (y >= ve && y < vs))
        return;
    if (he < hs) {
        for (x = 0; x < he; x++)
            line->win[x] = ctl;
        for (x = hs; x < W; x++)
            line->win[x] = ctl;
    } else {
        for (x = hs; x < he; x++)
            line->win[x] = ctl;
    }
}

/* ---- color effects ---- */

struct Rgb {
    int r, g, b;
};

/* 5 bits to 8: c << 3 | c >> 2 (0 -> 0, 31 -> 255), as mGBA does too */
static inline int expand5(int c)
{
    return (c << 3) | (c >> 2);
}

/* Channels to compute with: 5-bit, or mGBA's 8-bit ones. */
static struct Rgb unpack(const struct Ppu *ppu, uint32_t c)
{
    struct Rgb v = { (int)(c & 0x1F), (int)((c >> 5) & 0x1F), (int)((c >> 10) & 0x1F) };
    if (ppu->colorMath == PPU_COLOR_MGBA) {
        v.r = expand5(v.r);
        v.g = expand5(v.g);
        v.b = expand5(v.b);
    }
    return v;
}

static uint32_t pack(const struct Ppu *ppu, struct Rgb v)
{
    if (ppu->colorMath != PPU_COLOR_MGBA) {
        v.r = expand5(v.r);
        v.g = expand5(v.g);
        v.b = expand5(v.b);
    }
    return (uint32_t)v.r | ((uint32_t)v.g << 8) | ((uint32_t)v.b << 16);
}

static int blend1(int a, int ea, int b, int eb, int max)
{
    int v = (a * ea + b * eb) / 16;
    return v > max ? max : v;
}

static uint32_t effect_alpha(const struct Ppu *ppu, uint32_t top, uint32_t below, int eva, int evb)
{
    int max = ppu->colorMath == PPU_COLOR_MGBA ? 255 : 31;
    struct Rgb a = unpack(ppu, top), b = unpack(ppu, below), v;
    v.r = blend1(a.r, eva, b.r, evb, max);
    v.g = blend1(a.g, eva, b.g, evb, max);
    v.b = blend1(a.b, eva, b.b, evb, max);
    return pack(ppu, v);
}

static uint32_t effect_brightness(const struct Ppu *ppu, uint32_t c, int evy, int up)
{
    int max = ppu->colorMath == PPU_COLOR_MGBA ? 255 : 31;
    struct Rgb v = unpack(ppu, c);
    if (up) {
        v.r += (max - v.r) * evy / 16;
        v.g += (max - v.g) * evy / 16;
        v.b += (max - v.b) * evy / 16;
    } else if (ppu->colorMath == PPU_COLOR_MGBA) {
        /* mGBA darkens green and blue in place in the packed word, which
         * rounds the amount taken away up instead of down */
        v.r -= v.r * evy / 16;
        v.g -= (v.g * evy + 15) / 16;
        v.b -= (v.b * evy + 15) / 16;
    } else {
        v.r -= v.r * evy / 16;
        v.g -= v.g * evy / 16;
        v.b -= v.b * evy / 16;
    }
    return pack(ppu, v);
}

/* ---- the line ---- */

static void update_bg_enable(struct Ppu *ppu, int y, uint16_t dispcnt)
{
    /* A background switched on in the middle of a frame shows three lines
     * later (two in the bitmap modes); switched off, it goes at once.  At
     * the start of a frame the enable bits count as they are. */
    int b;
    for (b = 0; b < 4; b++) {
        int active = (dispcnt >> (8 + b)) & 1, was = ppu->bgState[b];
        if (y == 0)
            ppu->bgState[b] = active ? ENABLED_MAX : 0;
        else if (!active) {
            if (was > 0 && was < ENABLED_MAX)
                ppu->bgState[b] = 0;
            else if (was == ENABLED_MAX)
                ppu->bgState[b] = -2;
        } else if (!was) {
            ppu->bgState[b] = (dispcnt & 7) > 2 ? 2 : 1;
        } else if (was < 0) {
            ppu->bgState[b] = ENABLED_MAX;
        }
    }
}

void ppu_render_line(struct Ppu *ppu, int y)
{
    struct Line line;
    uint32_t *row = ppu->fb + y * W;
    uint16_t dispcnt = io16(ppu, REG_DISPCNT);
    uint16_t bldcnt = io16(ppu, REG_BLDCNT), bldalpha = io16(ppu, REG_BLDALPHA);
    int mode = dispcnt & 7, effect = (bldcnt >> 6) & 3;
    int eva = bldalpha & 0x1F, evb = (bldalpha >> 8) & 0x1F, evy = io16(ppu, REG_BLDY) & 0x1F;
    int show[4] = { 0, 0, 0, 0 }, prio[4];
    uint32_t backdrop;
    int b, x;

    if (y == 0 || (ppu->reload & 1))
        ppu->affX[0] = io_ref(ppu, REG_BG2X);
    if (y == 0 || (ppu->reload & 2))
        ppu->affY[0] = io_ref(ppu, REG_BG2Y);
    if (y == 0 || (ppu->reload & 4))
        ppu->affX[1] = io_ref(ppu, REG_BG3X);
    if (y == 0 || (ppu->reload & 8))
        ppu->affY[1] = io_ref(ppu, REG_BG3Y);
    ppu->reload = 0;

    if (dispcnt & 0x80) { /* forced blank: white */
        for (x = 0; x < W; x++)
            row[x] = 0xFFFFFF;
        return;
    }
    update_bg_enable(ppu, y, dispcnt);

    if (eva > 16)
        eva = 16;
    if (evb > 16)
        evb = 16;
    if (evy > 16)
        evy = 16;

    memset(line.bg, 0, sizeof line.bg);
    memset(line.obj, 0, sizeof line.obj);
    memset(line.objPrio, 4, sizeof line.objPrio);
    memset(line.objSemi, 0, sizeof line.objSemi);
    memset(line.objWin, 0, sizeof line.objWin);

    for (b = 0; b < 4; b++) {
        int affine = (mode == 1 && b == 2) || (mode == 2 && b >= 2);
        int text = mode == 0 || (mode == 1 && b < 2);
        int bitmap = mode >= 3 && mode <= 5 && b == 2;
        prio[b] = io16(ppu, REG_BG0CNT + 2 * b) & 3;
        if (ppu->bgState[b] != ENABLED_MAX || !(affine || text || bitmap))
            continue;
        show[b] = 1;
        if (text)
            draw_text_bg(ppu, b, y, line.bg[b]);
        else if (affine)
            draw_affine_bg(ppu, b, y, line.bg[b]);
        else
            draw_bitmap_bg(ppu, mode, y, line.bg[b]);
    }
    if (dispcnt & 0x1000)
        draw_sprites(ppu, &line, y);

    /* window control of every pixel */
    if (dispcnt & 0xE000) {
        uint16_t winout = io16(ppu, REG_WINOUT);
        for (x = 0; x < W; x++)
            line.win[x] = (dispcnt & 0x8000) && line.objWin[x] ? (winout >> 8) & 0x3F : winout & 0x3F;
        if (dispcnt & 0x4000)
            apply_window(ppu, &line, 1, y);
        if (dispcnt & 0x2000)
            apply_window(ppu, &line, 0, y);
    } else {
        memset(line.win, 0x3F, sizeof line.win);
    }

    backdrop = pal16(ppu, 0);
    for (x = 0; x < W; x++) {
        /* the two topmost layers: 0-3 backgrounds, 4 sprites, 5 backdrop */
        int layer[2], n = 0, p, ctl = line.win[x];
        uint32_t color[2];
        uint32_t out;
        for (p = 0; p < 4 && n < 2; p++) {
            if (line.objPrio[x] == p && line.obj[x] && (ctl & 0x10)) {
                layer[n] = 4;
                color[n++] = line.obj[x];
            }
            for (b = 0; b < 4 && n < 2; b++)
                if (show[b] && prio[b] == p && (line.bg[b][x] & OPAQUE) && (ctl & (1 << b))) {
                    layer[n] = b;
                    color[n++] = line.bg[b][x];
                }
        }
        while (n < 2) {
            layer[n] = 5;
            color[n++] = backdrop;
        }

        out = 0xFFFFFFFF;
        {
            int semi = layer[0] == 4 && line.objSemi[x];
            int first = semi || ((bldcnt >> layer[0]) & 1);
            int second = (bldcnt >> (8 + layer[1])) & 1;
            if (semi && second) {
                /* semi-transparent sprites blend whatever BLDCNT and the window say */
                out = effect_alpha(ppu, color[0], color[1], eva, evb);
            } else if ((ctl & 0x20) && first) {
                if (effect == 1 && second && !semi)
                    out = effect_alpha(ppu, color[0], color[1], eva, evb);
                else if (effect >= 2)
                    out = effect_brightness(ppu, color[0], evy, effect == 2);
            }
        }
        if (out == 0xFFFFFFFF) {
            struct Rgb v = unpack(ppu, color[0]);
            out = pack(ppu, v);
        }
        row[x] = out;
    }

    /* next line's affine reference point */
    if (mode != 0) {
        if (ppu->bgState[2] == ENABLED_MAX) {
            ppu->affX[0] += (int16_t)io16(ppu, REG_BG2PA + 2);
            ppu->affY[0] += (int16_t)io16(ppu, REG_BG2PA + 6);
        }
        if (ppu->bgState[3] == ENABLED_MAX) {
            ppu->affX[1] += (int16_t)io16(ppu, REG_BG3PA + 2);
            ppu->affY[1] += (int16_t)io16(ppu, REG_BG3PA + 6);
        }
    }
    for (b = 0; b < 4; b++)
        if (ppu->bgState[b] != 0 && ppu->bgState[b] < ENABLED_MAX)
            ppu->bgState[b]++;
}

void ppu_render_frame(struct Ppu *ppu, PpuLineHook hook, void *user)
{
    int y;
    for (y = 0; y < H; y++) {
        if (hook)
            hook(ppu, y, user);
        ppu_render_line(ppu, y);
    }
}
