/*
 * ppurender: render dumps written by ppucapture -D with platform/ppu.c and
 * compare them with mGBA's frame stored in the dump.
 *
 *   ppurender [-m] [-o PPM] DUMP...
 *     -m      hardware color math (default: mGBA's, to compare exactly)
 *     -o PPM  write the last dump's picture (the per-line render) as a PPM
 *
 * Each dump is rendered twice: with the state of line 0 for the whole frame
 * (a plain snapshot), and with each line's I/O registers and palette (VRAM
 * and OAM stay the line-0 copy; lines where mGBA saw them change are
 * flagged, and may differ).
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "ppu.h"

#define W PPU_WIDTH
#define H PPU_HEIGHT

struct Dump {
    uint8_t io[H][0x400], pal[H][0x400], flags[H];
    uint8_t vram[0x18000], oam[0x400];
    uint32_t frame[W * H];
};

static int load(const char *path, struct Dump *d)
{
    FILE *f = fopen(path, "rb");
    char magic[8];
    int ok = 1, y;
    if (!f)
        return 0;
    ok &= fread(magic, 1, 8, f) == 8 && !memcmp(magic, "FE7PPU1", 8);
    ok &= fread(d->io[0], 1, 0x400, f) == 0x400;
    ok &= fread(d->pal[0], 1, 0x400, f) == 0x400;
    ok &= fread(d->vram, 1, sizeof d->vram, f) == sizeof d->vram;
    ok &= fread(d->oam, 1, sizeof d->oam, f) == sizeof d->oam;
    d->flags[0] = 0;
    for (y = 1; y < H && ok; y++) {
        ok &= fread(d->io[y], 1, 0x400, f) == 0x400;
        ok &= fread(d->pal[y], 1, 0x400, f) == 0x400;
        ok &= fread(&d->flags[y], 1, 1, f) == 1;
    }
    for (y = 0; y < W * H && ok; y++) {
        uint8_t b[4];
        ok &= fread(b, 1, 4, f) == 4;
        d->frame[y] = b[0] | (b[1] << 8) | ((uint32_t)b[2] << 16);
    }
    fclose(f);
    return ok;
}

struct Replay {
    struct Dump *d;
    uint8_t io[0x400], pal[0x400];
};

static void perLine(struct Ppu *ppu, int y, void *user)
{
    struct Replay *r = user;
    memcpy(r->io, r->d->io[y], 0x400);
    memcpy(r->pal, r->d->pal[y], 0x400);
    if (r->d->flags[y] & 1) {
        ppu_io_written(ppu, 0x28);
        ppu_io_written(ppu, 0x2C);
        ppu_io_written(ppu, 0x38);
        ppu_io_written(ppu, 0x3C);
    }
}

static long diff(const uint32_t *a, const uint32_t *b, int *firstLine)
{
    long n = 0;
    *firstLine = -1;
    for (int i = 0; i < W * H; i++)
        if ((a[i] ^ b[i]) & 0xFFFFFF) {
            if (*firstLine < 0)
                *firstLine = i / W;
            n++;
        }
    return n;
}

static void writePpm(const char *path, const uint32_t *fb)
{
    FILE *f = fopen(path, "wb");
    if (!f)
        return;
    fprintf(f, "P6\n%d %d\n255\n", W, H);
    for (int i = 0; i < W * H; i++) {
        uint8_t c[3] = { fb[i], fb[i] >> 8, fb[i] >> 16 };
        fwrite(c, 1, 3, f);
    }
    fclose(f);
}

int main(int argc, char **argv)
{
    static struct Dump d;
    static struct Replay r;
    static uint32_t fb[W * H];
    const char *png = NULL;
    int hardware = 0, i, files = 0, sameLine = 0, sameSnap = 0, memChanged = 0;
    struct Ppu ppu;

    for (i = 1; i < argc && argv[i][0] == '-'; i++) {
        if (!strcmp(argv[i], "-m"))
            hardware = 1;
        else if (!strcmp(argv[i], "-o") && i + 1 < argc)
            png = argv[++i];
    }
    for (; i < argc; i++) {
        long nSnap, nLine;
        int y, lSnap, lLine, mem = 0, regs = 0;
        if (!load(argv[i], &d)) {
            fprintf(stderr, "ppurender: can't read %s\n", argv[i]);
            return 2;
        }
        files++;
        for (y = 1; y < H; y++) {
            mem |= d.flags[y] & 6;
            regs |= memcmp(d.io[y], d.io[0], 0x56) != 0 || memcmp(d.pal[y], d.pal[0], 0x400) != 0;
        }
        r.d = &d;
        memcpy(r.io, d.io[0], 0x400);
        memcpy(r.pal, d.pal[0], 0x400);
        ppu_init(&ppu, r.io, r.pal, d.vram, d.oam, fb);
        ppu.colorMath = hardware ? PPU_COLOR_HARDWARE : PPU_COLOR_MGBA;
        ppu_render_frame(&ppu, NULL, NULL);
        nSnap = diff(fb, d.frame, &lSnap);
        ppu_render_frame(&ppu, perLine, &r);
        nLine = diff(fb, d.frame, &lLine);
        if (getenv("PPURENDER_LINES"))
            for (y = 0; y < H; y++) {
                int n = 0, first = -1;
                for (int x = 0; x < W; x++)
                    if ((fb[y * W + x] ^ d.frame[y * W + x]) & 0xFFFFFF) {
                        if (first < 0)
                            first = x;
                        n++;
                    }
                if (n)
                    printf("  line %d: %d px from x %d (mgba %06X here %06X)\n", y, n, first,
                           d.frame[y * W + first], fb[y * W + first]);
            }
        sameSnap += nSnap == 0;
        sameLine += nLine == 0;
        memChanged += mem != 0;
        printf("%s: snapshot %ld px (from line %d), per-line %ld px (from line %d)%s%s\n", argv[i],
               nSnap, lSnap, nLine, lLine, regs ? ", registers/palette change between lines" : "",
               mem ? ", VRAM/OAM change between lines" : "");
        if (png)
            writePpm(png, fb);
    }
    printf("ppurender: %d dumps; identical to mGBA: %d from the snapshot, %d with per-line state "
           "(%d dumps change VRAM/OAM mid-frame)\n", files, sameSnap, sameLine, memChanged);
    return 0;
}
