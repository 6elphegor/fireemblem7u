/*
 * Unit tests for platform/ppu.c on small hand-made scenes.  (The comparison
 * with mGBA on the game itself is platform/tools/ppucompare.py.)
 */
#include <string.h>

#include "ppu.h"
#include "test.h"

static uint8_t io[0x400], pal[0x400], vram[0x18000], oam[0x400];
static uint32_t fb[PPU_WIDTH * PPU_HEIGHT];
static struct Ppu ppu;

static void w16(uint8_t *p, uint32_t off, uint16_t v)
{
    p[off] = (uint8_t)v;
    p[off + 1] = (uint8_t)(v >> 8);
}

static void w32(uint8_t *p, uint32_t off, uint32_t v)
{
    w16(p, off, (uint16_t)v);
    w16(p, off + 2, (uint16_t)(v >> 16));
}

/* 5-bit color -> the framebuffer's 0x00BBGGRR */
static uint32_t rgb(int r, int g, int b)
{
    return (uint32_t)((r << 3) | (r >> 2)) | (uint32_t)((g << 3) | (g >> 2)) << 8 |
           (uint32_t)((b << 3) | (b >> 2)) << 16;
}

static uint16_t c555(int r, int g, int b)
{
    return (uint16_t)(r | (g << 5) | (b << 10));
}

static uint32_t px(int x, int y)
{
    return fb[y * PPU_WIDTH + x];
}

static void reset(void)
{
    memset(io, 0, sizeof io);
    memset(pal, 0, sizeof pal);
    memset(vram, 0, sizeof vram);
    memset(oam, 0, sizeof oam);
    w16(io, 0x20, 0x100); /* identity affine matrices */
    w16(io, 0x26, 0x100);
    w16(io, 0x30, 0x100);
    w16(io, 0x36, 0x100);
    for (int i = 0; i < 128; i++)
        w16(oam, i * 8, 0x200); /* all sprites hidden */
    ppu_init(&ppu, io, pal, vram, oam, fb);
}

/* 4bpp tile `t` at char base `base`, every pixel color `c` */
static void solid_tile(uint32_t base, int t, int c)
{
    memset(vram + base + t * 32, c | (c << 4), 32);
}

/* the whole 32x32 screen block at `sbb` holds `entry` */
static void fill_map(int sbb, uint16_t entry)
{
    for (int i = 0; i < 1024; i++)
        w16(vram, sbb * 0x800 + i * 2, entry);
}

static void test_backdrop(void)
{
    reset();
    w16(pal, 0, c555(3, 7, 31));
    ppu_render_frame(&ppu, NULL, NULL);
    CHECK_EQ(px(0, 0), rgb(3, 7, 31), "backdrop");
    CHECK_EQ(px(239, 159), rgb(3, 7, 31), "backdrop corner");
    w16(io, 0, 0x80);
    ppu_render_frame(&ppu, NULL, NULL);
    CHECK_EQ(px(100, 100), 0xFFFFFF, "forced blank is white");
}

static void test_text_bg(void)
{
    reset();
    w16(pal, 2, c555(31, 0, 0));      /* color 1 */
    w16(pal, 0x20 + 4, c555(0, 31, 0)); /* palette 1, color 2 */
    solid_tile(0, 1, 1);
    /* tile 2: left half color 2, right half transparent */
    for (int r = 0; r < 8; r++)
        w32(vram, 64 + r * 4, 0x00002222);
    fill_map(8, 1);                   /* BG0: tile 1 everywhere */
    w16(vram, 8 * 0x800 + (2 * 32 + 3) * 2, 0x1002); /* (3,2): tile 2, palette 1 */
    w16(io, 0x08, 8 << 8);            /* BG0CNT: map block 8, char block 0 */
    w16(io, 0x00, 0x0100);            /* mode 0, BG0 */
    ppu_render_frame(&ppu, NULL, NULL);
    CHECK_EQ(px(0, 0), rgb(31, 0, 0), "text BG pixel");
    CHECK_EQ(px(24, 16), rgb(0, 31, 0), "tile 2 left half");
    CHECK_EQ(px(28, 16), 0, "tile 2 right half transparent: backdrop (black)");
    /* horizontal flip */
    w16(vram, 8 * 0x800 + (2 * 32 + 3) * 2, 0x1402);
    ppu_render_frame(&ppu, NULL, NULL);
    CHECK_EQ(px(24, 16), 0, "hflip: left transparent");
    CHECK_EQ(px(31, 16), rgb(0, 31, 0), "hflip: right colored");
    /* scrolling by (5, 3) */
    w16(io, 0x10, 5);
    w16(io, 0x12, 3);
    ppu_render_frame(&ppu, NULL, NULL);
    CHECK_EQ(px(24 - 5 + 7, 16 - 3), rgb(0, 31, 0), "scrolled");
    /* 512-pixel wide map wraps into the next screen block */
    w16(io, 0x10, 256);
    w16(io, 0x12, 0);
    w16(io, 0x08, (8 << 8) | 0x4000);
    fill_map(9, 0);
    ppu_render_frame(&ppu, NULL, NULL);
    CHECK_EQ(px(0, 0), 0, "size 1: x 256 is in the second screen block");
}

static void test_priority_and_window(void)
{
    reset();
    w16(pal, 2, c555(31, 0, 0));
    w16(pal, 4, c555(0, 0, 31));
    solid_tile(0, 1, 1);
    solid_tile(0, 2, 2);
    fill_map(8, 1);
    fill_map(9, 2);
    w16(io, 0x08, (8 << 8) | 1); /* BG0: priority 1 */
    w16(io, 0x0A, (9 << 8) | 0); /* BG1: priority 0 */
    w16(io, 0x00, 0x0300);
    ppu_render_frame(&ppu, NULL, NULL);
    CHECK_EQ(px(50, 50), rgb(0, 0, 31), "BG1 (priority 0) on top");
    w16(io, 0x0A, (9 << 8) | 1); /* same priority: lower number wins */
    ppu_render_frame(&ppu, NULL, NULL);
    CHECK_EQ(px(50, 50), rgb(31, 0, 0), "equal priority: BG0 on top");
    /* window 0 (10,20)-(30,40) shows only BG1; outside only BG0 */
    w16(io, 0x40, (10 << 8) | 30);
    w16(io, 0x44, (20 << 8) | 40);
    w16(io, 0x48, 0x02);
    w16(io, 0x4A, 0x01);
    w16(io, 0x00, 0x2300);
    ppu_render_frame(&ppu, NULL, NULL);
    CHECK_EQ(px(10, 20), rgb(0, 0, 31), "inside window 0");
    CHECK_EQ(px(29, 39), rgb(0, 0, 31), "inside window 0, last pixel");
    CHECK_EQ(px(30, 39), rgb(31, 0, 0), "right of window 0");
    CHECK_EQ(px(10, 40), rgb(31, 0, 0), "below window 0");
    /* a window whose right edge is left of its left edge wraps around */
    w16(io, 0x40, (200 << 8) | 20);
    ppu_render_frame(&ppu, NULL, NULL);
    CHECK_EQ(px(5, 25), rgb(0, 0, 31), "wrapped window, left part");
    CHECK_EQ(px(210, 25), rgb(0, 0, 31), "wrapped window, right part");
    CHECK_EQ(px(100, 25), rgb(31, 0, 0), "wrapped window, middle");
}

static void test_effects(void)
{
    reset();
    w16(pal, 2, c555(20, 10, 0));
    w16(pal, 4, c555(4, 10, 30));
    solid_tile(0, 1, 1);
    solid_tile(0, 2, 2);
    fill_map(8, 1);
    fill_map(9, 2);
    w16(io, 0x08, (8 << 8) | 0);
    w16(io, 0x0A, (9 << 8) | 1);
    w16(io, 0x00, 0x0300);
    w16(io, 0x50, 0x0201 | (1 << 6)); /* alpha: BG0 over BG1 */
    w16(io, 0x52, 0x0808);
    ppu_render_frame(&ppu, NULL, NULL);
    CHECK_EQ(px(0, 0), rgb(12, 10, 15), "alpha 8/8");
    w16(io, 0x52, 0x1F1F); /* coefficients above 16 count as 16, the sum saturates */
    ppu_render_frame(&ppu, NULL, NULL);
    CHECK_EQ(px(0, 0), rgb(24, 20, 30), "alpha 16/16 saturates");
    w16(io, 0x50, 0x0001 | (2 << 6)); /* brighten BG0 */
    w16(io, 0x54, 8);
    ppu_render_frame(&ppu, NULL, NULL);
    CHECK_EQ(px(0, 0), rgb(20 + 11 * 8 / 16, 10 + 21 * 8 / 16, 31 * 8 / 16), "brighten 8");
    w16(io, 0x50, 0x0001 | (3 << 6)); /* darken */
    w16(io, 0x54, 5);
    ppu_render_frame(&ppu, NULL, NULL);
    CHECK_EQ(px(0, 0), rgb(20 - 20 * 5 / 16, 10 - 10 * 5 / 16, 0), "darken 5");
    /* the window can switch the effect off */
    w16(io, 0x48, 0x03);            /* window 0: BG0, BG1, no effect */
    w16(io, 0x4A, 0x23);
    w16(io, 0x40, (0 << 8) | 100);
    w16(io, 0x44, (0 << 8) | 160);
    w16(io, 0x00, 0x2300);
    ppu_render_frame(&ppu, NULL, NULL);
    CHECK_EQ(px(50, 0), rgb(20, 10, 0), "no effect inside the window");
    CHECK_EQ(px(150, 0), rgb(20 - 20 * 5 / 16, 10 - 10 * 5 / 16, 0), "effect outside");
}

static void test_sprites(void)
{
    reset();
    w16(pal, 0x200 + 2, c555(31, 31, 0)); /* OBJ palette 0, color 1 */
    w16(pal, 0x200 + 0x20 + 2, c555(0, 31, 31));
    /* OBJ tile 0: column 0 colored, the rest transparent */
    for (int r = 0; r < 8; r++)
        w32(vram, 0x10000 + r * 4, 0x00000001);
    w16(oam, 0, 20);                    /* y 20, square */
    w16(oam, 2, 10);                    /* x 10, 8x8 */
    w16(oam, 4, 0);
    w16(io, 0x00, 0x1040);              /* OBJ on, 1D mapping */
    ppu_render_frame(&ppu, NULL, NULL);
    CHECK_EQ(px(10, 20), rgb(31, 31, 0), "sprite pixel");
    CHECK_EQ(px(11, 20), 0, "sprite transparent pixel");
    CHECK_EQ(px(10, 28), 0, "below the sprite");
    w16(oam, 2, 10 | 0x1000);           /* hflip */
    ppu_render_frame(&ppu, NULL, NULL);
    CHECK_EQ(px(17, 27), rgb(31, 31, 0), "hflip sprite");
    w16(oam, 2, 0x1FF);                 /* x = -1: column 0 is off screen */
    ppu_render_frame(&ppu, NULL, NULL);
    CHECK_EQ(px(0, 20), 0, "sprite at x -1");
    /* sprite 1 overlaps sprite 0 with lower priority: sprite 0 stays on top */
    w16(oam, 2, 10);
    w16(oam, 8, 20);
    w16(oam, 10, 10);
    w16(oam, 12, 0x1000 | 0x0400);      /* palette 1, priority 1 */
    ppu_render_frame(&ppu, NULL, NULL);
    CHECK_EQ(px(10, 20), rgb(31, 31, 0), "lower OAM index wins");
    /* affine, double size: identity matrix 0, sprite 32x32 box, 16x16 texture */
    reset();
    w16(pal, 0x200 + 2, c555(31, 31, 0));
    memset(vram + 0x10000, 0x11, 4 * 32); /* tiles 0-3 solid: a 16x16 sprite in 1D */
    w16(oam, 6, 0x100);                   /* matrix 0: pa */
    w16(oam, 30, 0x100);                  /* pd */
    w16(oam, 0, 40 | 0x100 | 0x200);      /* y 40, affine, double size */
    w16(oam, 2, 50 | 0x4000);             /* x 50, size 1 (16x16) */
    w16(oam, 4, 0);
    w16(io, 0x00, 0x1040);
    ppu_render_frame(&ppu, NULL, NULL);
    CHECK_EQ(px(58, 48), rgb(31, 31, 0), "double-size affine sprite: texture starts 8 in");
    CHECK_EQ(px(57, 48), 0, "double-size: border transparent");
    CHECK_EQ(px(73, 63), rgb(31, 31, 0), "double-size: texture ends at 16+8-1");
    CHECK_EQ(px(74, 63), 0, "double-size: right border");
}

static void test_semi_transparent(void)
{
    reset();
    w16(pal, 2, c555(0, 0, 16));
    solid_tile(0, 1, 1);
    fill_map(8, 1);
    w16(io, 0x08, (8 << 8) | 1);
    w16(pal, 0x200 + 2, c555(16, 0, 0));
    memset(vram + 0x10000, 0x11, 32);
    w16(oam, 0, 0 | 0x0400);              /* semi-transparent, y 0 */
    w16(oam, 2, 0);
    w16(oam, 4, 0);
    w16(io, 0x00, 0x1140);
    w16(io, 0x50, 0x0100);                /* effect none, BG0 is a second target */
    w16(io, 0x52, 0x0808);
    ppu_render_frame(&ppu, NULL, NULL);
    CHECK_EQ(px(0, 0), rgb(8, 0, 8), "semi-transparent sprite blends with effect none");
    w16(io, 0x50, 0x0000);                /* no second target: plain */
    ppu_render_frame(&ppu, NULL, NULL);
    CHECK_EQ(px(0, 0), rgb(16, 0, 0), "no second target");
}

static void test_affine_bg(void)
{
    reset();
    w16(pal, 2, c555(31, 0, 0));
    w16(pal, 4, c555(0, 31, 0));
    /* 8bpp tiles: tile 1 color 1, tile 2 color 2 */
    memset(vram + 64, 1, 64);
    memset(vram + 128, 2, 64);
    /* 128x128 map at block 8: tile 1, tile 2 at (1, 0) */
    memset(vram + 8 * 0x800, 1, 256);
    vram[8 * 0x800 + 1] = 2;
    w16(io, 0x0C, 8 << 8);                /* BG2: 128x128, no wrap */
    w16(io, 0x00, 0x0402);                /* mode 2, BG2 */
    ppu_render_frame(&ppu, NULL, NULL);
    CHECK_EQ(px(0, 0), rgb(31, 0, 0), "affine BG tile 1");
    CHECK_EQ(px(8, 0), rgb(0, 31, 0), "affine BG tile 2");
    CHECK_EQ(px(128, 0), 0, "outside the 128x128 map: transparent");
    w16(io, 0x0C, (8 << 8) | 0x2000);     /* wrap */
    ppu_render_frame(&ppu, NULL, NULL);
    CHECK_EQ(px(136, 0), rgb(0, 31, 0), "wrapped");
    /* scale x2 (pa = 0x80): screen x 16 is texture x 8 */
    w16(io, 0x20, 0x80);
    ppu_render_frame(&ppu, NULL, NULL);
    CHECK_EQ(px(15, 0), rgb(31, 0, 0), "scaled: x 15");
    CHECK_EQ(px(16, 0), rgb(0, 31, 0), "scaled: x 16");
    /* reference point x = 8.0: shifted left by 8 texels */
    w16(io, 0x20, 0x100);
    w32(io, 0x28, 8 << 8);
    ppu_render_frame(&ppu, NULL, NULL);
    CHECK_EQ(px(0, 0), rgb(0, 31, 0), "reference point");
    /* rotation by 90 degrees: pb = -1 (x steps down lines), pc = 1 */
    w32(io, 0x28, 0);
    w16(io, 0x20, 0);
    w16(io, 0x22, 0x100);   /* pb: next line adds 1 to x */
    w16(io, 0x24, 0x100);   /* pc: next pixel adds 1 to y */
    w16(io, 0x26, 0);
    ppu_render_frame(&ppu, NULL, NULL);
    CHECK_EQ(px(0, 8), rgb(0, 31, 0), "rotated: line 8 reads texture x 8");
    CHECK_EQ(px(8, 0), rgb(31, 0, 0), "rotated: pixel 8 reads texture y 8");
}

static void test_mosaic(void)
{
    reset();
    for (int c = 1; c < 16; c++)
        w16(pal, c * 2, c555(c, c, c));
    /* tile 1: column i has color i + 1 */
    for (int r = 0; r < 8; r++)
        w32(vram + 0, 32 + r * 4, 0x87654321);
    fill_map(8, 1);
    w16(io, 0x08, (8 << 8) | 0x40);      /* mosaic */
    w16(io, 0x4C, 0x0003);               /* 4 pixels wide */
    w16(io, 0x00, 0x0100);
    ppu_render_frame(&ppu, NULL, NULL);
    CHECK_EQ(px(0, 0), rgb(1, 1, 1), "mosaic x 0");
    CHECK_EQ(px(3, 0), rgb(1, 1, 1), "mosaic x 3 repeats x 0");
    CHECK_EQ(px(4, 0), rgb(5, 5, 5), "mosaic x 4");
    CHECK_EQ(px(7, 0), rgb(5, 5, 5), "mosaic x 7");
}

static void test_bitmap(void)
{
    reset();
    w16(vram, (10 * 240 + 20) * 2, c555(1, 2, 3));
    w16(io, 0x00, 0x0403);               /* mode 3 */
    ppu_render_frame(&ppu, NULL, NULL);
    CHECK_EQ(px(20, 10), rgb(1, 2, 3), "mode 3 pixel");
    w16(pal, 9 * 2, c555(9, 9, 9));
    vram[0xA000 + 5 * 240 + 6] = 9;
    w16(io, 0x00, 0x0414);               /* mode 4, second frame */
    ppu_render_frame(&ppu, NULL, NULL);
    CHECK_EQ(px(6, 5), rgb(9, 9, 9), "mode 4 frame 1 pixel");
    CHECK_EQ(px(7, 5), 0, "mode 4 index 0 is transparent");
}

/* per-line changes through the hook */
static void hook_text(struct Ppu *p, int y, void *user)
{
    (void)p;
    (void)user;
    if (y == 80)
        w16(io, 0x10, 4);      /* BG0HOFS */
    if (y == 100)
        w16(io, 0x00, 0x0300); /* switch BG1 on mid-frame */
}

static void hook_affine(struct Ppu *p, int y, void *user)
{
    (void)user;
    if (y == 120) {
        w32(io, 0x28, 0);      /* BG2X */
        ppu_io_written(p, 0x28);
    }
}

static void test_per_line(void)
{
    reset();
    for (int c = 1; c < 16; c++)
        w16(pal, c * 2, c555(c, c, c));
    for (int r = 0; r < 8; r++)
        w32(vram, 32 + r * 4, 0x87654321);
    solid_tile(0, 2, 15);
    fill_map(8, 1);
    fill_map(9, 2);
    w16(io, 0x08, (8 << 8) | 1);
    w16(io, 0x0A, (9 << 8) | 0);
    w16(io, 0x00, 0x0100);
    ppu_render_frame(&ppu, hook_text, NULL);
    CHECK_EQ(px(0, 79), rgb(1, 1, 1), "before the scroll change");
    CHECK_EQ(px(0, 80), rgb(5, 5, 5), "after the scroll change");
    CHECK_EQ(px(0, 102), rgb(5, 5, 5), "BG1 enabled at line 100: not yet at 102");
    CHECK_EQ(px(0, 103), rgb(15, 15, 15), "... shows at line 103");

    /* affine reference point: advanced by pb/pd each line, reloaded on write */
    reset();
    for (int c = 1; c < 16; c++)
        w16(pal, c * 2, c555(c, c, c));
    for (int t = 0; t < 16; t++)
        memset(vram + t * 64, t, 64);
    for (int i = 0; i < 256; i++)
        vram[8 * 0x800 + i] = (uint8_t)(i % 16);
    w16(io, 0x0C, (8 << 8) | 0x2000);
    w16(io, 0x00, 0x0402);
    w16(io, 0x22, 0x100);   /* pb: x moves one texel per line */
    w32(io, 0x28, 8 << 8);
    ppu_render_frame(&ppu, hook_affine, NULL);
    /* line y starts at texture x 8 + y; line 120 restarts at 0 */
    CHECK_EQ(px(0, 0), rgb(1, 1, 1), "affine line 0: tile 1");
    CHECK_EQ(px(0, 8), rgb(2, 2, 2), "affine line 8: x 16, tile 2");
    CHECK_EQ(px(0, 119), rgb((8 + 119) / 8 % 16, (8 + 119) / 8 % 16, (8 + 119) / 8 % 16), "affine line 119");
    CHECK_EQ(px(0, 120), 0, "affine line 120: reloaded to x 0 (tile 0: transparent)");
    CHECK_EQ(px(0, 128), rgb(1, 1, 1), "affine line 128: x 8");
}

int main(void)
{
    test_backdrop();
    test_text_bg();
    test_priority_and_window();
    test_effects();
    test_sprites();
    test_semi_transparent();
    test_affine_bg();
    test_mosaic();
    test_bitmap();
    test_per_line();
    return test_report("test_ppu");
}
