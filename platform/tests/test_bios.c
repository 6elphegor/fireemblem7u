/*
 * Unit tests for platform/bios.c: known values, properties, hand-made
 * compressed streams.  No ROM needed.  (test_lz77.c decompresses the game's
 * data; tools/biosref.c compares with mGBA's HLE BIOS.)
 */
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "bios.h"
#include "test.h"

#define A4 __attribute__((aligned(4))) /* the BIOS reads the header as a word */

static void test_div(void)
{
    static const struct { int n, d, q, r; } t[] = {
        { 7, 2, 3, 1 },          { -7, 2, -3, -1 },   { 7, -2, -3, 1 },
        { -7, -2, 3, -1 },       { 0, 5, 0, 0 },      { 100, 10, 10, 0 },
        { 0x7FFFFFFF, 1, 0x7FFFFFFF, 0 },             { -0x7FFFFFFF - 1, 1, -0x7FFFFFFF - 1, 0 },
        { -0x7FFFFFFF - 1, -1, -0x7FFFFFFF - 1, 0 },  /* ARM's wrap, no trap */
        { 12345678, 1000, 12345, 678 },
        { 5, 0, 1, 5 },          { -5, 0, -1, -5 },   { 0, 0, 1, 0 }, /* hangs on hardware */
    };
    size_t i;
    for (i = 0; i < sizeof t / sizeof t[0]; i++) {
        CHECK_EQ(Div(t[i].n, t[i].d), t[i].q, "Div(%d, %d)", t[i].n, t[i].d);
        CHECK_EQ(DivRem(t[i].n, t[i].d), t[i].r, "DivRem(%d, %d)", t[i].n, t[i].d);
        CHECK_EQ(DivArm(t[i].d, t[i].n), t[i].q, "DivArm(%d, %d)", t[i].d, t[i].n);
        CHECK_EQ(DivArmRem(t[i].d, t[i].n), t[i].r, "DivArmRem(%d, %d)", t[i].d, t[i].n);
    }
}

static u32 isqrt(u32 x)
{
    u64 r = (u64)sqrt((double)x);
    while (r * r > x)
        r--;
    while ((r + 1) * (r + 1) <= x)
        r++;
    return (u32)r;
}

static void test_sqrt(void)
{
    u32 x, n, seed = 1;
    long bad = 0;
    for (x = 0; x < (1u << 22); x++)
        bad += Sqrt(x) != isqrt(x);
    for (n = 1; n < 65536; n++) {
        u32 s = n * n;
        bad += Sqrt(s - 1) != n - 1;
        bad += Sqrt(s) != n;
        bad += Sqrt(s + 1) != n;
    }
    for (n = 0; n < 2000000; n++) {
        seed = seed * 1664525 + 1013904223;
        bad += Sqrt(seed) != isqrt(seed);
    }
    bad += Sqrt(0xFFFFFFFF) != 0xFFFF;
    CHECK(bad == 0, "Sqrt: %ld results differ from floor(sqrt(x))", bad);
}

static void test_arctan(void)
{
    int x, y, worst = 0;
    CHECK_EQ(ArcTan2(1, 0), 0, "ArcTan2(1, 0)");
    CHECK_EQ(ArcTan2(0, 1), 0x4000, "ArcTan2(0, 1)");
    CHECK_EQ(ArcTan2(-1, 0), 0x8000, "ArcTan2(-1, 0)");
    CHECK_EQ(ArcTan2(0, -1), 0xC000, "ArcTan2(0, -1)");
    CHECK_EQ(ArcTan2(0, 0), 0, "ArcTan2(0, 0)");
    CHECK_EQ(ArcTan2(-5, 0), 0x8000, "ArcTan2(-5, 0)");
    CHECK_EQ(ArcTan(0), 0, "ArcTan(0)");
    /* the BIOS polynomial is within a few units of the true angle */
    for (y = -300; y <= 300; y += 3)
        for (x = -300; x <= 300; x += 3) {
            double t = atan2(y, x) * 65536.0 / (2 * M_PI);
            int want = (int)lround(t) & 0xFFFF, got = ArcTan2((s16)x, (s16)y);
            int d = abs(((got - want + 0x8000) & 0xFFFF) - 0x8000);
            if (d > worst)
                worst = d;
        }
    CHECK(worst <= 4, "ArcTan2 is %d units from atan2", worst);
    /* symmetric in the quadrants */
    CHECK_EQ(ArcTan2(100, 100), 0x2000 + (s16)(ArcTan2(100, 100) - 0x2000), "ArcTan2 diag");
    { int m = (u16)(ArcTan2(-100, 37) + ArcTan2(100, 37)); CHECK(m >= 0x7FFF && m <= 0x8001, "ArcTan2 mirror %#x", m); }
}

static void test_cpuset(void)
{
    u32 src32[16], dst32[20];
    u16 src16[16], dst16[20];
    int i;
    for (i = 0; i < 16; i++) {
        src32[i] = 0x11111111u * (u32)i + 0x01020304;
        src16[i] = (u16)(0x1111 * i + 0x0102);
    }

    memset(dst16, 0xEE, sizeof dst16);
    CpuSet(src16, dst16, 5);
    CHECK(!memcmp(dst16, src16, 10) && dst16[5] == 0xEEEE, "CpuSet copy16");
    memset(dst16, 0xEE, sizeof dst16);
    CpuSet(src16 + 3, dst16, 7 | CPU_SET_SRC_FIXED);
    for (i = 0; i < 7; i++)
        CHECK_EQ(dst16[i], src16[3], "CpuSet fill16 [%d]", i);
    CHECK_EQ(dst16[7], 0xEEEE, "CpuSet fill16 end");

    memset(dst32, 0xEE, sizeof dst32);
    CpuSet(src32, dst32, 3 | CPU_SET_32BIT);
    CHECK(!memcmp(dst32, src32, 12) && dst32[3] == 0xEEEEEEEE, "CpuSet copy32");
    memset(dst32, 0xEE, sizeof dst32);
    CpuSet(src32 + 1, dst32, 4 | CPU_SET_32BIT | CPU_SET_SRC_FIXED);
    CHECK(dst32[0] == src32[1] && dst32[3] == src32[1] && dst32[4] == 0xEEEEEEEE, "CpuSet fill32");
    memset(dst32, 0xEE, sizeof dst32);
    CpuSet(src32, dst32, 0 | CPU_SET_32BIT);
    CHECK_EQ(dst32[0], 0xEEEEEEEE, "CpuSet count 0");
    /* bits above the 21-bit count are ignored */
    memset(dst16, 0xEE, sizeof dst16);
    CpuSet(src16, dst16, 2 | 0x00E00000);
    CHECK(dst16[1] == src16[1] && dst16[2] == 0xEEEE, "CpuSet count mask");
    /* misaligned pointers: the BIOS drops the low bits */
    memset(dst32, 0xEE, sizeof dst32);
    CpuSet((u8 *)src32 + 2, (u8 *)dst32 + 3, 1 | CPU_SET_32BIT);
    CHECK_EQ(dst32[0], src32[0], "CpuSet aligns");

    /* CpuFastSet: whole blocks of 8 words */
    memset(dst32, 0xEE, sizeof dst32);
    CpuFastSet(src32, dst32, 3);
    CHECK(!memcmp(dst32, src32, 32) && dst32[8] == 0xEEEEEEEE, "CpuFastSet rounds 3 up to 8");
    memset(dst32, 0xEE, sizeof dst32);
    CpuFastSet(src32 + 2, dst32, 9 | CPU_FAST_SET_SRC_FIXED);
    CHECK(dst32[15] == src32[2] && dst32[16] == 0xEEEEEEEE, "CpuFastSet fill rounds 9 up to 16");
    memset(dst32, 0xEE, sizeof dst32);
    CpuFastSet(src32, dst32, 0);
    CHECK_EQ(dst32[0], 0xEEEEEEEE, "CpuFastSet count 0");
}

static void test_affine(void)
{
    struct BgAffineSrcData bs;
    struct BgAffineDstData bd;
    struct ObjAffineSrcData os[2];
    s16 om[8];
    u16 oam[32];
    int angle, worst = 0;

    /* identity */
    bs = (struct BgAffineSrcData){ 0x1000, 0x2000, 10, 20, 0x100, 0x100, 0 };
    BgAffineSet(&bs, &bd, 1);
    CHECK(bd.pa == 0x100 && bd.pb == 0 && bd.pc == 0 && bd.pd == 0x100, "BgAffineSet identity matrix");
    CHECK(bd.dx == 0x1000 - 10 * 0x100 && bd.dy == 0x2000 - 20 * 0x100, "BgAffineSet identity origin %X %X", bd.dx, bd.dy);
    /* a quarter turn, scale 2 (0x80) in x */
    bs = (struct BgAffineSrcData){ 0x4000, 0x4000, 120, 80, 0x80, 0x100, 0x4000 };
    BgAffineSet(&bs, &bd, 1);
    CHECK(bd.pa == 0 && bd.pb == -0x80 && bd.pc == 0x100 && bd.pd == 0, "BgAffineSet 90 degrees: %d %d %d %d", bd.pa, bd.pb, bd.pc, bd.pd);
    CHECK(bd.dx == 0x4000 + 80 * 0x80 && bd.dy == 0x4000 - 120 * 0x100, "BgAffineSet 90 degrees origin");
    /* the low 8 bits of the angle are ignored */
    bs.alpha = 0x40FF;
    BgAffineSet(&bs, &bd, 1);
    CHECK(bd.pa == 0 && bd.pb == -0x80, "BgAffineSet angle fraction");

    os[0] = (struct ObjAffineSrcData){ 0x100, 0x100, 0 };
    os[1] = (struct ObjAffineSrcData){ 0x200, 0x100, 0x8000 };
    ObjAffineSet(os, om, 2, 2);
    CHECK(om[0] == 0x100 && om[1] == 0 && om[2] == 0 && om[3] == 0x100, "ObjAffineSet identity");
    CHECK(om[4] == -0x200 && om[5] == 0 && om[6] == 0 && om[7] == -0x100, "ObjAffineSet half turn");
    memset(oam, 0xAA, sizeof oam);
    ObjAffineSet(os + 1, oam + 3, 1, 8); /* into OAM's fourth halfwords */
    CHECK(oam[3] == 0xFE00 && oam[7] == 0 && oam[11] == 0 && oam[15] == 0xFF00 && oam[4] == 0xAAAA, "ObjAffineSet OAM stride");

    /* against the exact values: within one unit */
    for (angle = 0; angle < 256; angle++) {
        double t = angle * 2 * M_PI / 256;
        int k;
        os[0] = (struct ObjAffineSrcData){ 0x135, -0xB0, (u16)(angle << 8) };
        ObjAffineSet(os, om, 1, 2);
        double want[4] = { 0x135 * cos(t), -0x135 * sin(t), -0xB0 * sin(t), -0xB0 * cos(t) };
        for (k = 0; k < 4; k++) {
            int d = (int)ceil(fabs(om[k] - want[k]) - 0.01);
            if (d > worst)
                worst = d;
        }
    }
    CHECK(worst <= 1, "ObjAffineSet is %d units from the exact matrix", worst);
}

static void test_lz77(void)
{
    /* "abcabcabcX" + a copy with distance 1 */
    static const u8 A4 lz[] = {
        0x10, 13, 0, 0,
        0x10, 'a', 'b', 'c', 0x30, 0x02, 'X', 'Y', 'Z', 'W',
        0x80, 0x00, 0x00,
    };
    u8 out[32], vout[32];
    memset(out, 0xEE, sizeof out);
    CHECK_EQ(LZ77UnComp(lz, out, 0), 13, "LZ77 size");
    CHECK(!memcmp(out, "abcabcabcXYZW\xEE", 14), "LZ77UnCompWram: %.13s", out);
    /* 13 + a 3-byte copy: the second block's copy is completed (overrun) */
    static const u8 A4 lz2[] = { 0x10, 5, 0, 0, 0x10, 'a', 'b', 'c', 0x00, 0x00 };
    memset(out, 0xEE, sizeof out);
    LZ77UnCompWram(lz2, out);
    CHECK(!memcmp(out, "abcccc\xEE", 7), "LZ77 overrun: %.7s", out);

    /* distance 1 in VRAM: the byte before is still waiting for its pair */
    static const u8 A4 lz3[] = { 0x10, 6, 0, 0, 0x20, 'a', 'b', 0x10, 0x00 };
    memset(out, 0xEE, sizeof out);
    memset(vout, 0x55, sizeof vout);
    LZ77UnCompWram(lz3, out);
    LZ77UnCompVram(lz3, vout);
    CHECK(!memcmp(out, "abbbbb\xEE", 7), "LZ77 distance 1 (WRAM): %.6s", out);
    /* offset 2 copies 'b' (offset 1, in memory) but is pending; offset 3
     * copies offset 2, not in memory yet: the old 0x55, and so on */
    CHECK(vout[0] == 'a' && vout[1] == 'b' && vout[2] == 'b' && vout[3] == 0x55 && vout[4] == 0x55 && vout[5] == 0x55,
          "LZ77 distance 1 (VRAM): %02X %02X %02X %02X %02X %02X", vout[0], vout[1], vout[2], vout[3], vout[4], vout[5]);
    /* odd size in VRAM: the last byte is never written */
    static const u8 A4 lz4[] = { 0x10, 3, 0, 0, 0x00, 'x', 'y', 'z' };
    memset(vout, 0x55, sizeof vout);
    LZ77UnCompVram(lz4, vout);
    CHECK(vout[0] == 'x' && vout[1] == 'y' && vout[2] == 0x55, "LZ77 VRAM odd size");
}

static void test_rl(void)
{
    /* 5 x 'A', then "xyz" raw: 8 bytes; then 2 more: padding to 12 */
    static const u8 A4 rl[] = { 0x30, 10, 0, 0, 0x82, 'A', 0x02, 'x', 'y', 'z', 0x81, 'Q' };
    u8 out[32], vout[32];
    memset(out, 0xEE, sizeof out);
    memset(vout, 0xEE, sizeof vout);
    CHECK_EQ(RLUnComp(rl, out, 0), 10, "RL size");
    RLUnCompVram(rl, vout);
    CHECK(!memcmp(out, "AAAAAxyzQQ\0\0\xEE", 13), "RLUnCompWram");
    CHECK(!memcmp(vout, "AAAAAxyzQQ\0\0\xEE", 13), "RLUnCompVram");
    /* 7 bytes: WRAM writes 7 + 1 pad; VRAM drops the odd 7th (halfword writes) */
    static const u8 A4 rl2[] = { 0x30, 7, 0, 0, 0x84, 'B' };
    memset(out, 0xEE, sizeof out);
    memset(vout, 0xEE, sizeof vout);
    RLUnCompWram(rl2, out);
    RLUnCompVram(rl2, vout);
    CHECK(!memcmp(out, "BBBBBBB\0\xEE", 9), "RL pad WRAM");
    CHECK(!memcmp(vout, "BBBBBB\xEE\xEE", 8), "RL pad VRAM");
}

static void test_huff(void)
{
    /* 8-bit symbols, codes a = 0, b = 10, c = 11.  Node byte: bits 0-5
     * offset, bit 7 / bit 6: the left / right child is a leaf; the
     * children of a node at address P are at (P & ~1) + offset * 2 + 2. */
    u32 words[8];
    u8 *src = (u8 *)words, out[16];
    memset(words, 0, sizeof words);
    src[0] = 0x28;
    src[1] = 8;      /* 8 bytes out */
    src[4] = 3;      /* tree table: (3 + 1) * 2 bytes from src+4, data at src+12 */
    src[5] = 0x80;   /* root: left leaf, children at src+6 */
    src[6] = 'a';
    src[7] = 0xC0;   /* right: a node whose children (src+8, src+9) are leaves */
    src[8] = 'b';
    src[9] = 'c';
    /* "abcaabca": 0 10 11 0 0 10 11 0, most significant bit first */
    words[3] = 0x59600000;
    memset(out, 0xEE, sizeof out);
    HuffUnComp(src, out);
    CHECK(!memcmp(out, "abcaabca\xEE", 9), "HuffUnComp: %.8s", out);
}

static int hookCalls;
static void hook_intr(u32 discard, u32 flags)
{
    hookCalls += (discard == 1 && flags == 1) ? 1 : 100;
}

static void test_misc(void)
{
    static u8 ewram[0x40000], iwram[0x8000], pal[0x400], vram[0x18000], oam[0x400], io[0x400];
    memset(ewram, 1, sizeof ewram);
    memset(iwram, 1, sizeof iwram);
    memset(pal, 1, sizeof pal);
    memset(vram, 1, sizeof vram);
    memset(oam, 1, sizeof oam);
    memset(io, 1, sizeof io);
    gBiosMemory = (struct BiosMemory){ ewram, iwram, pal, vram, oam, io };
    RegisterRamReset(RESET_IWRAM | RESET_VRAM | RESET_REGS);
    CHECK(ewram[0] == 1 && iwram[0] == 0 && iwram[0x7DFF] == 0 && iwram[0x7E00] == 1, "RegisterRamReset IWRAM");
    CHECK(vram[0x17FFF] == 0 && pal[0] == 1 && oam[0] == 1, "RegisterRamReset VRAM only");
    CHECK(io[0] == 0x80 && io[1] == 0 && io[8] == 0 && io[0x20] == 0 && io[0x21] == 1 && io[0x26] == 0 && io[0x27] == 1, "RegisterRamReset registers");
    CHECK(io[0x60] == 1, "RegisterRamReset keeps sound registers");
    memset(&gBiosMemory, 0, sizeof gBiosMemory);

    gBiosHooks.intr_wait = hook_intr;
    VBlankIntrWait();
    CHECK_EQ(hookCalls, 1, "VBlankIntrWait -> IntrWait(1, 1)");
    memset(&gBiosHooks, 0, sizeof gBiosHooks);
    VBlankIntrWait(); /* no hooks: returns */
    CHECK_EQ(MultiBoot(NULL), 1, "MultiBoot fails");
}

int main(void)
{
    test_div();
    test_sqrt();
    test_arctan();
    test_cpuset();
    test_affine();
    test_lz77();
    test_rl();
    test_huff();
    test_misc();
    return test_report("test_bios");
}
