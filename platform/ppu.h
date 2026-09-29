/*
 * A scanline renderer for the GBA's picture (platform/ppu.c).
 *
 * Input: the I/O registers (0x04000000, 0x400 bytes), palette RAM (1 KiB),
 * VRAM (96 KiB) and OAM (1 KiB) as plain byte arrays, read as they are when
 * each line is drawn.  Output: a 240x160 framebuffer of 32-bit pixels,
 * 0x00BBGGRR (red in the low byte; the layout of mGBA's color_t), each
 * 5-bit channel c widened to 8 bits as c << 3 | c >> 2.
 *
 * Covered: modes 0-5 (text and affine backgrounds, the three bitmap modes),
 * mosaic, regular and affine sprites (double size, 1D/2D tile mapping,
 * semi-transparent and OBJ-window sprites, the per-line sprite time limit),
 * windows 0/1/OBJ, alpha blending, brightness up/down, forced blank.
 *
 * Per-line changes: ppu_render_line() reads the registers at the time it is
 * called, so a caller that changes them between lines (HBlank DMA, HBlank
 * or VCount interrupts) calls it once per line with the changes applied in
 * between; ppu_render_frame() does that with a hook.  The affine
 * backgrounds' internal reference point is the one piece of state: it is
 * loaded from BGxX/BGxY at line 0 and advanced by BGxPB/BGxPD every line;
 * a write to BG2X/BG2Y/BG3X/BG3Y in the middle of a frame reloads it, so the
 * caller reports such writes with ppu_io_written().
 */
#ifndef PLATFORM_PPU_H
#define PLATFORM_PPU_H

#include <stdint.h>

#define PPU_WIDTH 240
#define PPU_HEIGHT 160

enum PpuColorMath {
    PPU_COLOR_HARDWARE, /* blending on 5-bit channels, as the GBA does */
    PPU_COLOR_MGBA,     /* mGBA's 8-bit arithmetic (for comparing with it pixel for pixel) */
};

struct Ppu {
    /* inputs, set by the caller (ppu_init) */
    const uint8_t *io;   /* 0x400 */
    const uint8_t *pal;  /* 0x400 */
    const uint8_t *vram; /* 0x18000 */
    const uint8_t *oam;  /* 0x400 */
    uint32_t *fb;        /* PPU_WIDTH * PPU_HEIGHT */
    int colorMath;       /* enum PpuColorMath */

    /* internal state */
    int32_t affX[2], affY[2]; /* BG2/BG3 reference point for the next line (.8 fixed) */
    uint8_t reload;           /* BG2X, BG2Y, BG3X, BG3Y written since the last line (bits 0-3) */
    int8_t bgState[4];        /* background enable delay (see ppu.c) */
};

void ppu_init(struct Ppu *ppu, const uint8_t *io, const uint8_t *pal, const uint8_t *vram,
              const uint8_t *oam, uint32_t *fb);

/* Draw line y (0-159) into fb.  Line 0 starts a frame: the affine
 * reference points are loaded from the registers. */
void ppu_render_line(struct Ppu *ppu, int y);

/* The register at `offset` (from 0x04000000) was written.  Only the affine
 * reference points (0x28-0x2F, 0x38-0x3F) need this; it may be called for
 * any register, before or after the new value is in io. */
void ppu_io_written(struct Ppu *ppu, uint32_t offset);

/* Draw a whole frame; `hook` (may be NULL) runs before each line and may
 * change the inputs (and must call ppu_io_written for BGxX/BGxY writes). */
typedef void (*PpuLineHook)(struct Ppu *ppu, int y, void *user);
void ppu_render_frame(struct Ppu *ppu, PpuLineHook hook, void *user);

#endif
