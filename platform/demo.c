/*
 * A stand-in for the game: exercises the platform layer the way the game
 * does, without the game.
 *
 * AgbMain here writes a scene through the gba headers (REG_*, VRAM, PLTT,
 * OAM, DmaCopy32/DmaFill32, the interrupt table): a checkered text
 * background, a 16x16 sprite that moves (its OAM entry uploaded by DMA in
 * the VBlank handler), an HBlank handler that shifts the background line by
 * line (a wave), an HBlank DMA that writes the backdrop color line by line
 * (a gradient), a VCount handler, and a quiet tone to HostAudioSubmit.  It then waits in VBlankIntrWait like
 * the game's main loop.
 *
 *   build/platform/demo [host options]          in a window (Esc quits)
 *   build/platform/demo --check [host options]  after the run, check the
 *       handlers' counts and the last frame (`make platform-test` runs
 *       `--check --headless --frames 120`, and with an input script,
 *       which also checks that each frame's keys reach the game in it)
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "gba/gba.h"
#include "platform.h"

void (*gIrqFuncs[14])(void);

static u32 sFrame;
static long sVBlanks, sHBlanks, sVCounts;
static u16 sGradient[228];
static u32 sOamBuf[2] ALIGNED(4);
static long sVCountMismatch;
static u16 sKeysSeen[4096]; /* KEYINPUT (1 = pressed) in each frame's VBlank handler */

#define MAP_BASE 31 /* screen block: VRAM + 0xF800 */
#define SPRITE_COLOR 0x03FF /* yellow */

static s16 wave(u32 line)
{
    /* a triangle wave, 32 lines long, -8..7 */
    u32 t = line & 31;
    return (s16)(t < 16 ? t - 8 : 23 - t);
}

static void HBlankHandler(void)
{
    /* set up the next line (VCOUNT is the line just drawn) */
    u16 next = (u16)(REG_VCOUNT + 1);
    sHBlanks++;
    if (next >= 228)
        next = 0;
    REG_BG0HOFS = (u16)wave(next + sFrame);
}

static void VCountHandler(void)
{
    sVCounts++;
    if (REG_VCOUNT != 80)
        sVCountMismatch++;
}

static void VBlankHandler(void)
{
    u16 x, y;

    if (sVBlanks < 4096)
        sKeysSeen[sVBlanks] = (u16)(~REG_KEYINPUT & 0x3FF);
    sVBlanks++;
    sFrame++;

    /* the sprite: a Lissajous-ish walk, uploaded by an immediate DMA */
    x = (u16)(40 + (sFrame * 3) % 160);
    y = (u16)(40 + (sFrame * 2) % 80);
    sOamBuf[0] = (u32)(y & 0xFF) | (u32)((x & 0x1FF) | 0x4000) << 16; /* 16x16 square */
    sOamBuf[1] = 0; /* tile 0, palette 0, priority 0 */
    DmaCopy32(3, sOamBuf, (void *)OAM, 8);

    /* audio: a quiet 440 Hz square wave, one frame's worth (13379 Hz / 59.73) */
    {
        static s16 buf[224 * 2];
        static u32 phase;
        int i;
        for (i = 0; i < 224; i++, phase += 440) {
            s16 v = (s16)(((phase / (13379 / 2)) & 1) ? 1500 : -1500);
            buf[2 * i] = buf[2 * i + 1] = v;
        }
        HostAudioSubmit(buf, 224);
    }

    /* line 0's backdrop and the wave; the HBlank DMA does lines 1.. */
    ((u16 *)BG_PLTT)[0] = sGradient[0];
    REG_BG0HOFS = (u16)wave(sFrame);
    DmaStop(0);
    DmaSet(0, &sGradient[1], (void *)BG_PLTT,
           ((DMA_ENABLE | DMA_START_HBLANK | DMA_REPEAT | DMA_16BIT | DMA_SRC_INC | DMA_DEST_RELOAD) << 16) | 1);
}

static void setup(void)
{
    u16 *pal = (u16 *)BG_PLTT, *objPal = (u16 *)OBJ_PLTT;
    u32 tile[8], *chr;
    u16 *map = (u16 *)BG_SCREEN_ADDR(MAP_BASE);
    int i, row;

    REG_DISPCNT = DISPCNT_FORCED_BLANK;

    /* palettes */
    pal[1] = 0x7C00; /* blue */
    pal[2] = 0x001F; /* red */
    objPal[1] = SPRITE_COLOR;
    for (i = 0; i < 228; i++)
        sGradient[i] = (u16)((i * 31 / 159) << 5); /* black to green */

    /* BG tiles: 0 = color 1 with a transparent diagonal, 1 = color 2 */
    for (row = 0; row < 8; row++)
        tile[row] = 0x11111111u & ~(0xFu << (4 * row));
    CpuCopy32(tile, (void *)BG_CHAR_ADDR(0), 32);
    DmaFill32(3, 0x22222222, (void *)(BG_CHAR_ADDR(0) + 32), 32);

    /* a checkerboard map */
    for (i = 0; i < 32 * 32; i++)
        map[i] = (u16)(((i & 1) ^ ((i >> 5) & 1)));

    /* the sprite: a filled 16x16 (4 tiles, 1D mapping) with a hole */
    chr = (u32 *)OBJ_VRAM0;
    for (i = 0; i < 32; i++)
        chr[i] = (i == 0) ? 0x11111110u : 0x11111111u;

    /* hide the other sprites */
    for (i = 1; i < 128; i++)
        ((u32 *)OAM)[i * 2] = 0x200; /* affine off, disabled */

    REG_BG0CNT = BGCNT_PRIORITY(1) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(MAP_BASE) | BGCNT_16COLOR | BGCNT_TXT256x256;
    REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;

    gIrqFuncs[0] = VBlankHandler;
    gIrqFuncs[1] = HBlankHandler;
    gIrqFuncs[2] = VCountHandler;
    REG_DISPSTAT = DISPSTAT_VBLANK_INTR | DISPSTAT_HBLANK_INTR | DISPSTAT_VCOUNT_INTR | (80 << 8);
    REG_IE = INTR_FLAG_VBLANK | INTR_FLAG_HBLANK | INTR_FLAG_VCOUNT;
    REG_IME = 1;

    REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON | DISPCNT_OBJ_ON;
}

void AgbMain(void)
{
    setup();
    for (;;)
        VBlankIntrWait();
}

/* ---- the headless check ---- */

#define CHECK_FRAMES 120
/* the last frame's hash at CHECK_FRAMES frames (mGBA color math) */
#define CHECK_HASH 0xe331db1a3a4e63adULL

static u32 widen(u16 c)
{
    u32 r = c & 31, g = (c >> 5) & 31, b = (c >> 10) & 31;
    r = r << 3 | r >> 2;
    g = g << 3 | g >> 2;
    b = b << 3 | b >> 2;
    return r | g << 8 | b << 16;
}

static int check(void)
{
    long n = gHostFrameCount;
    int fails = 0, y, x;
    u64 hash = HostFrameHash(gHostFrame);
    u32 spriteX, spriteY;

#define FAIL(...) (fails++, fprintf(stderr, "demo: FAIL: " __VA_ARGS__), fputc('\n', stderr))
    if (sVBlanks != n)
        FAIL("%ld VBlank interrupts in %ld frames", sVBlanks, n);
    if (sHBlanks != 228 * n)
        FAIL("%ld HBlank interrupts in %ld frames (want %ld)", sHBlanks, n, 228 * n);
    if (sVCounts != n || sVCountMismatch)
        FAIL("%ld VCount interrupts in %ld frames, %ld at the wrong line", sVCounts, n, sVCountMismatch);

    /* the last picture was drawn with sFrame == n - 1 (the VBlank handler
     * of frame n-1 ran after it): the sprite where that frame's handler
     * before put it, the gradient in the backdrop, the wave in the rows */
    spriteX = 40 + ((n - 1) * 3) % 160;
    spriteY = 40 + ((n - 1) * 2) % 80;
    if ((gHostFrame[(spriteY + 8) * PPU_WIDTH + spriteX + 8] & 0xFFFFFF) != widen(SPRITE_COLOR))
        FAIL("no sprite at (%u, %u)", spriteX, spriteY);
    if ((gHostFrame[spriteY * PPU_WIDTH + spriteX] & 0xFFFFFF) == widen(SPRITE_COLOR))
        FAIL("the sprite's transparent pixel isn't");

    /* each line: the backdrop shows through tile 0's diagonal; its color is
     * the gradient's, and where it shows moves with the wave */
    for (y = 0; y < PPU_HEIGHT; y++) {
        u32 want = widen(sGradient[y]);
        int hofs = wave(y + (n - 1)), found = -1;
        for (x = 0; x < PPU_WIDTH && found < 0; x++)
            if ((gHostFrame[y * PPU_WIDTH + x] & 0xFFFFFF) == want)
                found = x;
        if (found < 0) {
            FAIL("line %d: no backdrop pixel", y);
            continue;
        }
        /* the first backdrop pixel on the line: map x = found + hofs, in a
         * tile-0 column of this row, at column (y & 7) of the tile */
        {
            int mx = (found + hofs) & 255;
            int tileCol = mx >> 3, tileRow = (y >> 3) & 31; /* VOFS 0 */
            int tileIdx = (tileCol & 1) ^ (tileRow & 1);
            if (tileIdx != 0 || (mx & 7) != (y & 7))
                FAIL("line %d: backdrop at x=%d, not where HOFS %d puts it", y, found, hofs);
        }
    }

    /* with an input script: each frame's keys reached the game in that frame */
    if (gHostOptions.input) {
        struct HostScript *script = HostScriptLoad(gHostOptions.input);
        long f, bad = 0;
        for (f = 0; script && f < n && f < 4096; f++)
            if (sKeysSeen[f] != HostScriptKeys(script, f) && bad++ == 0)
                FAIL("frame %ld: keys %03X, the script's %03X", f, sKeysSeen[f], HostScriptKeys(script, f));
        if (!script)
            FAIL("can't read %s", gHostOptions.input);
    }

    printf("demo: %ld frames, %ld HBlank / %ld VBlank / %ld VCount interrupts, last frame %016llx\n",
           n, sHBlanks, sVBlanks, sVCounts, (unsigned long long)hash);
    if (n == CHECK_FRAMES && !gHostOptions.hardwareColor && hash != CHECK_HASH)
        FAIL("frame hash %016llx, want %016llx", (unsigned long long)hash, (unsigned long long)CHECK_HASH);
    if (!fails)
        printf("demo: OK\n");
    return fails ? 1 : 0;
#undef FAIL
}

int main(int argc, char **argv)
{
    int i, j, doCheck = 0, status;

    for (i = j = 1; i < argc; i++) {
        if (strcmp(argv[i], "--check") == 0)
            doCheck = 1;
        else
            argv[j++] = argv[i];
    }
    argc = j;

    status = HostMain(argc, argv);
    if (status == 0 && doCheck)
        status = check();
    return status;
}
