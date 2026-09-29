/*
 * biosref: compare platform/bios.c with mGBA's HLE BIOS (libmgba, MPL-2.0,
 * linked, not vendored), call by call, on many inputs.
 *
 *   biosref ROM
 *
 * The ROM is only loaded so the emulated machine is complete; the LZ77 part
 * decompresses every LZ77 blob listed in data/graphics.txt from it, into
 * EWRAM (LZ77UnCompWram) and VRAM (LZ77UnCompVram) in mGBA and here.
 *
 * mGBA computes BgAffineSet/ObjAffineSet with floating point sin/cos; the
 * real BIOS (and platform/bios.c) uses a 256-entry sine table, so those may
 * differ by a unit: they are counted, not failed.
 */
#include <mgba/core/core.h>
#include <mgba/core/config.h>
#include <mgba/core/log.h>
#include <mgba/gba/core.h>
#include <mgba/internal/arm/arm.h>
#include <mgba/internal/gba/gba.h>
#include <mgba/internal/gba/bios.h>
#include <mgba-util/vfs.h>

#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "bios.h"

static void quietLog(struct mLogger *l, int cat, enum mLogLevel lvl, const char *fmt, va_list ap)
{
    (void)l; (void)cat; (void)lvl; (void)fmt; (void)ap;
}
static struct mLogger quiet = { .log = quietLog };

static struct mCore *core;
static struct ARMCore *cpu;
static struct GBA *gba;

static uint32_t swi(int n, uint32_t r0, uint32_t r1, uint32_t r2, uint32_t r3)
{
    cpu->gprs[0] = r0;
    cpu->gprs[1] = r1;
    cpu->gprs[2] = r2;
    cpu->gprs[3] = r3;
    GBASwi16(cpu, n);
    return cpu->gprs[0];
}

static uint32_t rng = 12345;
static uint32_t next(void)
{
    rng ^= rng << 13;
    rng ^= rng >> 17;
    rng ^= rng << 5;
    return rng;
}

static long fails;
#define FAIL(...) do { if (fails++ < 20) { printf("FAIL: "); printf(__VA_ARGS__); printf("\n"); } } while (0)

static void arith(void)
{
    long n = 0;
    int x, y;
    for (y = -1024; y <= 1024; y++)
        for (x = -1024; x <= 1024; x++, n++) {
            uint16_t m = (uint16_t)swi(0x0A, (uint32_t)x, (uint32_t)y, 0, 0);
            uint16_t p = ArcTan2((s16)x, (s16)y);
            if (m != p)
                FAIL("ArcTan2(%d, %d): mGBA %04X, here %04X", x, y, m, p);
        }
    for (int i = 0; i < 4000000; i++, n++) {
        s16 sx = (s16)next(), sy = (s16)next();
        if (i & 1) { /* near the octant boundaries */
            sy = (s16)(sx + (int)(next() % 7) - 3);
            if (next() & 1)
                sy = (s16)-sy;
        }
        uint16_t m = (uint16_t)swi(0x0A, (uint32_t)(int32_t)sx, (uint32_t)(int32_t)sy, 0, 0);
        uint16_t p = ArcTan2(sx, sy);
        if (m != p)
            FAIL("ArcTan2(%d, %d): mGBA %04X, here %04X", sx, sy, m, p);
    }
    for (x = -0x4000; x <= 0x4000; x++, n++) { /* ArcTan's domain: tan in [-1, 1] */
        s16 m = (s16)swi(0x09, (uint32_t)x, 0, 0, 0);
        if (m != ArcTan((s16)x))
            FAIL("ArcTan(%d): mGBA %d, here %d", x, m, ArcTan((s16)x));
    }
    for (int i = 0; i < 4000000; i++, n++) {
        uint32_t v = next() >> (next() & 31);
        uint16_t m = (uint16_t)swi(0x08, v, 0, 0, 0);
        if (m != Sqrt(v))
            FAIL("Sqrt(%u): mGBA %u, here %u", v, m, Sqrt(v));
    }
    for (int i = 0; i < 2000000; i++, n++) {
        int32_t a = (int32_t)next() >> (next() & 31), b = (int32_t)next() >> (next() & 31);
        if (!b)
            b = 1;
        int32_t q = (int32_t)swi(0x06, (uint32_t)a, (uint32_t)b, 0, 0);
        int32_t r = (int32_t)cpu->gprs[1];
        if (q != Div(a, b) || r != DivRem(a, b))
            FAIL("Div(%d, %d): mGBA %d r %d, here %d r %d", a, b, q, r, Div(a, b), DivRem(a, b));
        q = (int32_t)swi(0x07, (uint32_t)b, (uint32_t)a, 0, 0);
        if (q != DivArm(b, a))
            FAIL("DivArm(%d, %d)", b, a);
    }
    printf("arithmetic: %ld calls (ArcTan2, ArcTan, Sqrt, Div, DivArm)\n", n);
}

static uint8_t *ewram(void) { return (uint8_t *)gba->memory.wram; }
static uint8_t *vram(void) { return (uint8_t *)gba->video.vram; }

static void affine(void)
{
    long n = 0, diffBg = 0, diffObj = 0, worst = 0;
    for (int i = 0; i < 200000; i++, n++) {
        struct BgAffineSrcData s = {
            (s32)(next() % 0x100000) - 0x80000, (s32)(next() % 0x100000) - 0x80000,
            (s16)(next() % 480 - 240), (s16)(next() % 320 - 160),
            (s16)(next() % 0x400 - 0x200), (s16)(next() % 0x400 - 0x200), (u16)next(),
        };
        struct BgAffineDstData d, m;
        memcpy(ewram(), &s, sizeof s);
        swi(0x0E, 0x02000000, 0x02000100, 1, 0);
        memcpy(&m, ewram() + 0x100, sizeof m);
        BgAffineSet(&s, &d, 1);
        if (memcmp(&m, &d, sizeof d)) {
            long e = labs((long)m.pa - d.pa);
            if (labs((long)m.pb - d.pb) > e) e = labs((long)m.pb - d.pb);
            if (labs((long)m.pc - d.pc) > e) e = labs((long)m.pc - d.pc);
            if (labs((long)m.pd - d.pd) > e) e = labs((long)m.pd - d.pd);
            if (e > worst)
                worst = e;
            diffBg++;
        }
        struct ObjAffineSrcData o = { (s16)(next() % 0x400 - 0x200), (s16)(next() % 0x400 - 0x200), (u16)next() };
        s16 om[4], pm[4];
        memcpy(ewram(), &o, sizeof o);
        swi(0x0F, 0x02000000, 0x02000100, 1, 2);
        memcpy(om, ewram() + 0x100, sizeof om);
        ObjAffineSet(&o, pm, 1, 2);
        if (memcmp(om, pm, sizeof pm)) {
            for (int k = 0; k < 4; k++)
                if (labs((long)om[k] - pm[k]) > worst)
                    worst = labs((long)om[k] - pm[k]);
            diffObj++;
        }
    }
    printf("affine (%s): %ld random inputs; BgAffineSet differs from mGBA on %ld, "
           "ObjAffineSet on %ld; largest matrix difference %ld\n",
           gBiosAffineMgba ? "gBiosAffineMgba" : "BIOS sine table", n, diffBg, diffObj, worst);
    if (gBiosAffineMgba && (diffBg || diffObj))
        FAIL("gBiosAffineMgba doesn't reproduce mGBA");
}

static void decompress(const char *manifestPath, const uint8_t *rom, long romSize)
{
    FILE *f = fopen(manifestPath, "r");
    char line[1024];
    long n = 0, bytes = 0;
    static uint8_t mine[0x40000];
    if (!f) {
        printf("lz77: no %s, skipped\n", manifestPath);
        return;
    }
    while (fgets(line, sizeof line, f)) {
        unsigned addr, size;
        char format[64], name[512], rest[512] = "";
        if (line[0] == '#' || sscanf(line, "%x %x %63s %511s %511[^\n]", &addr, &size, format, name, rest) < 4)
            continue;
        if (!strncmp(rest, "raw", 3) || (long)(addr - 0x08000000) >= romSize)
            continue;
        const uint8_t *src = rom + (addr - 0x08000000);
        uint32_t len = BiosUnCompSize(src);
        if (len > 0x20000)
            continue;
        for (int v = 0; v < 2; v++) {
            if (v && len > 0x10000)
                continue;
            uint8_t *dst = v ? vram() : ewram();
            memset(dst, 0x5A, len + 16);
            swi(v ? 0x12 : 0x11, addr, v ? 0x06000000 : 0x02000000, 0, 0);
            memset(mine, 0x5A, len + 16);
            LZ77UnComp(src, mine, v);
            if (memcmp(dst, mine, len + 16))
                FAIL("%s: LZ77UnComp%s differs from mGBA", name, v ? "Vram" : "Wram");
            n++;
            bytes += len;
        }
    }
    fclose(f);
    printf("lz77: %ld decompressions (%ld bytes) of the game's blobs, Wram and Vram\n", n, bytes);
}

/* random RL streams, and LZ77 streams with short distances (the VRAM case) */
static void synthetic(void)
{
    static uint8_t mine[0x10000];
    long n = 0;
    for (int i = 0; i < 20000; i++, n++) {
        uint8_t *src = ewram() + 0x20000;
        uint32_t size = 1 + next() % 3000, have = 0;
        int p = 4;
        src[0] = 0x30;
        src[1] = size;
        src[2] = size >> 8;
        src[3] = 0;
        while (have < size) {
            if (next() & 1) {
                int len = 3 + next() % 128;
                src[p++] = 0x80 | (len - 3);
                src[p++] = next();
                have += len;
            } else {
                int len = 1 + next() % 128;
                src[p++] = len - 1;
                for (int k = 0; k < len; k++)
                    src[p++] = next();
                have += len;
            }
        }
        int v = i & 1;
        uint8_t *dst = v ? vram() : ewram();
        memset(dst, 0x5A, size + 8);
        swi(v ? 0x15 : 0x14, 0x02020000, v ? 0x06000000 : 0x02000000, 0, 0);
        memset(mine, 0x5A, size + 8);
        RLUnComp(src, mine, v);
        if (memcmp(dst, mine, size + 8))
            FAIL("RL stream %d (size %u, %s) differs", i, size, v ? "Vram" : "Wram");
    }
    for (int i = 0; i < 20000; i++, n++) {
        uint8_t *src = ewram() + 0x20000;
        uint32_t size = 1 + next() % 3000, have = 0;
        int p = 4;
        src[0] = 0x10;
        src[1] = size;
        src[2] = size >> 8;
        src[3] = 0;
        while (have < size) {
            int flagAt = p++;
            src[flagAt] = 0;
            for (int t = 0; t < 8 && have < size; t++) {
                if (have >= 4 && (next() & 1)) {
                    int len = 3 + next() % 16, disp = next() % (have < 4 ? have : 4);
                    src[flagAt] |= 0x80 >> t;
                    src[p++] = ((len - 3) << 4) | (disp >> 8);
                    src[p++] = disp;
                    have += len;
                } else {
                    src[p++] = next();
                    have++;
                }
            }
        }
        int v = i & 1;
        uint8_t *dst = v ? vram() : ewram();
        memset(dst, 0x5A, size + 32);
        swi(v ? 0x12 : 0x11, 0x02020000, v ? 0x06000000 : 0x02000000, 0, 0);
        memset(mine, 0x5A, size + 32);
        LZ77UnComp(src, mine, v);
        if (memcmp(dst, mine, size + 32))
            FAIL("LZ77 stream %d (size %u, %s) differs", i, size, v ? "Vram" : "Wram");
    }
    printf("synthetic: %ld random RL and short-distance LZ77 streams\n", n);
}

int main(int argc, char **argv)
{
    if (argc < 2) {
        fprintf(stderr, "usage: biosref ROM [data/graphics.txt]\n");
        return 2;
    }
    mLogSetDefaultLogger(&quiet);
    core = GBACoreCreate();
    if (!core || !core->init(core))
        return 2;
    mCoreInitConfig(core, NULL);
    mCoreConfigSetDefaultIntValue(&core->config, "useBios", 0);
    mCoreConfigSetDefaultIntValue(&core->config, "skipBios", 1);
    mCoreLoadForeignConfig(core, &core->config);
    struct VFile *vf = VFileOpen(argv[1], O_RDONLY);
    if (!vf || !core->loadROM(core, vf))
        return 2;
    core->reset(core);
    cpu = core->cpu;
    gba = core->board;

    FILE *f = fopen(argv[1], "rb");
    fseek(f, 0, SEEK_END);
    long romSize = ftell(f);
    fseek(f, 0, SEEK_SET);
    uint8_t *rom = malloc(romSize);
    if (fread(rom, 1, romSize, f) != (size_t)romSize)
        return 2;
    fclose(f);

    arith();
    affine();
    gBiosAffineMgba = 1;
    affine();
    gBiosAffineMgba = 0;
    decompress(argc > 2 ? argv[2] : "data/graphics.txt", rom, romSize);
    synthetic();
    printf("biosref: %ld differences\n", fails);
    core->deinit(core);
    return fails != 0;
}
