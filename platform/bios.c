/*
 * The GBA BIOS calls in portable C, for the host build.
 *
 * Results match the real BIOS: the arithmetic (Div, Sqrt, ArcTan, ArcTan2)
 * follows the BIOS's own algorithms as GBATEK and mGBA's HLE BIOS
 * (src/gba/bios.c) describe them, and the affine set-ups use the BIOS's
 * 256-entry sine table and integer math (mGBA's HLE uses floats there and
 * can be one unit off).  Decompression reproduces the BIOS's write widths:
 * the *Vram variants write halfwords, so a back-reference into the
 * halfword being assembled reads what memory held before (as on hardware).
 *
 * Pointers are host pointers.  Where the BIOS ignores the low address bits
 * (word and halfword transfers), so does this code.
 */
#include <math.h>
#include <stdlib.h>
#include <string.h>

#include "bios.h"

struct BiosHooks gBiosHooks;
struct BiosMemory gBiosMemory;

/* ---- unaligned-safe little-endian memory access ---- */

static inline u16 ld16(const void *p)
{
    const u8 *b = p;
    return (u16)(b[0] | (b[1] << 8));
}

static inline u32 ld32(const void *p)
{
    const u8 *b = p;
    return (u32)b[0] | ((u32)b[1] << 8) | ((u32)b[2] << 16) | ((u32)b[3] << 24);
}

static inline void st16(void *p, u16 v)
{
    u8 *b = p;
    b[0] = (u8)v;
    b[1] = (u8)(v >> 8);
}

static inline void st32(void *p, u32 v)
{
    u8 *b = p;
    b[0] = (u8)v;
    b[1] = (u8)(v >> 8);
    b[2] = (u8)(v >> 16);
    b[3] = (u8)(v >> 24);
}

#define ALIGN_DOWN(p, n) ((void *)((uintptr_t)(p) & ~(uintptr_t)((n) - 1)))

/* Arithmetic shift right of a signed value (C leaves it to the compiler). */
static inline s32 asr(s32 v, int n)
{
    return v < 0 ? ~(~v >> n) : v >> n;
}

/* 32-bit multiply that wraps like the ARM's MUL. */
static inline s32 mul(s32 a, s32 b)
{
    return (s32)((u32)a * (u32)b);
}

/* ---- swi 0-5: reset, halt, waits ---- */

void SoftReset(u32 resetFlags)
{
    (void)resetFlags; /* the BIOS ignores r0 here; the game's wrapper clears IME first */
    if (gBiosHooks.soft_reset)
        gBiosHooks.soft_reset();
    abort();
}

void RegisterRamReset(u32 flags)
{
    struct BiosMemory *m = &gBiosMemory;
    u8 *io = m->io;

    if (io)
        st16(io + 0x000, 0x0080); /* DISPCNT: forced blank, always */
    if ((flags & RESET_EWRAM) && m->ewram)
        memset(m->ewram, 0, 0x40000);
    if ((flags & RESET_IWRAM) && m->iwram)
        memset(m->iwram, 0, 0x8000 - 0x200); /* stacks and IRQ vector stay */
    if ((flags & RESET_PALETTE) && m->pal)
        memset(m->pal, 0, 0x400);
    if ((flags & RESET_VRAM) && m->vram)
        memset(m->vram, 0, 0x18000);
    if ((flags & RESET_OAM) && m->oam)
        memset(m->oam, 0, 0x400);
    if (!io)
        return;
    if (flags & RESET_SIO_REGS) {
        st16(io + 0x128, 0);      /* SIOCNT */
        st16(io + 0x134, 0x8000); /* RCNT: general purpose mode */
        st16(io + 0x12A, 0);      /* SIOMLT_SEND */
        st16(io + 0x140, 0);      /* JOYCNT */
        st32(io + 0x150, 0);      /* JOY_RECV */
        st32(io + 0x154, 0);      /* JOY_TRANS */
    }
    if (flags & RESET_SOUND_REGS) {
        memset(io + 0x60, 0, 0x84 - 0x60); /* SOUND1CNT_L .. SOUNDCNT_H */
        st16(io + 0x84, 0);                /* SOUNDCNT_X */
        st16(io + 0x88, 0x200);            /* SOUNDBIAS */
        memset(io + 0x90, 0, 0x10);        /* wave RAM */
    }
    if (flags & RESET_REGS) {
        int i;
        st16(io + 0x004, 0); /* DISPSTAT */
        st16(io + 0x006, 0); /* VCOUNT */
        for (i = 0x008; i < 0x020; i += 2) /* BGxCNT, BGxHOFS/VOFS */
            st16(io + i, 0);
        for (i = 0; i < 2; i++) { /* BG2 and BG3 affine: identity */
            u8 *r = io + 0x20 + i * 0x10;
            st16(r + 0, 0x100);
            st16(r + 2, 0);
            st16(r + 4, 0);
            st16(r + 6, 0x100);
            st32(r + 8, 0);
            st32(r + 12, 0);
        }
        for (i = 0x040; i < 0x056; i += 2) /* windows, mosaic, blending */
            st16(io + i, 0);
        for (i = 0x0B0; i < 0x0E0; i += 2) /* DMA 0-3 */
            st16(io + i, 0);
        for (i = 0x100; i < 0x110; i += 2) /* timers */
            st16(io + i, 0);
        st16(io + 0x200, 0);      /* IE */
        st16(io + 0x202, 0);      /* IF (written 0xFFFF: acknowledges everything) */
        st16(io + 0x204, 0);      /* WAITCNT */
        st16(io + 0x208, 0);      /* IME */
    }
}

void Halt(void)
{
    if (gBiosHooks.halt)
        gBiosHooks.halt();
}

void Stop(void)
{
    if (gBiosHooks.stop)
        gBiosHooks.stop();
}

void IntrWait(u32 discard, u32 flags)
{
    if (gBiosHooks.intr_wait)
        gBiosHooks.intr_wait(discard, flags);
}

void VBlankIntrWait(void)
{
    if (gBiosHooks.vblank_intr_wait)
        gBiosHooks.vblank_intr_wait();
    else
        IntrWait(1, 1);
}

/* ---- swi 6-10: arithmetic ---- */

/* Division by zero hangs the real BIOS (for |num| > 1); like mGBA, return
 * +-1 and the numerator as the remainder instead. */
static void divide(s32 num, s32 denom, s32 *quot, s32 *rem)
{
    if (denom == 0) {
        *quot = num < 0 ? -1 : 1;
        *rem = num;
    } else if (denom == -1 && num == INT32_MIN) {
        *quot = INT32_MIN;
        *rem = 0;
    } else {
        *quot = num / denom; /* C99: truncates toward zero, like the BIOS */
        *rem = num % denom;  /* sign of the numerator */
    }
}

int Div(int num, int denom)
{
    s32 q, r;
    divide(num, denom, &q, &r);
    return q;
}

int DivRem(int num, int denom)
{
    s32 q, r;
    divide(num, denom, &q, &r);
    return r;
}

int DivArm(int denom, int num)
{
    return Div(num, denom);
}

int DivArmRem(int denom, int num)
{
    return DivRem(num, denom);
}

/* The BIOS's iterative square root (Newton steps with a shift-and-subtract
 * division), which gives floor(sqrt(num)) for every input. */
u16 Sqrt(u32 num)
{
    u32 bound = 1, upper = num;

    if (num == 0)
        return 0;
    while (bound < upper) {
        upper >>= 1;
        bound <<= 1;
    }
    for (;;) {
        u32 lower = bound, accum = 0, old;
        upper = num;
        for (;;) {
            u32 prev = lower;
            if (lower <= upper >> 1)
                lower <<= 1;
            if (prev >= upper >> 1)
                break;
        }
        for (;;) {
            accum <<= 1;
            if (upper >= lower) {
                accum++;
                upper -= lower;
            }
            if (lower == bound)
                break;
            lower >>= 1;
        }
        old = bound;
        bound = (bound + accum) >> 1;
        if (bound >= old)
            return (u16)old;
    }
}

/* arctan(tan) for tan in [-1, 1] (1.14 fixed point): the BIOS's odd
 * polynomial, evaluated in 14-bit steps.  Result: 0x2000 = 45 degrees. */
static s32 arctan(s32 i)
{
    s32 a = -asr(mul(i, i), 14);
    s32 b = asr(mul(0xA9, a), 14) + 0x390;
    b = asr(mul(b, a), 14) + 0x91C;
    b = asr(mul(b, a), 14) + 0xFB6;
    b = asr(mul(b, a), 14) + 0x16AA;
    b = asr(mul(b, a), 14) + 0x2081;
    b = asr(mul(b, a), 14) + 0x3651;
    b = asr(mul(b, a), 14) + 0xA2F9;
    return (s16)asr(mul(i, b), 16);
}

s16 ArcTan(s16 tan)
{
    return (s16)arctan(tan);
}

/* Angle of (x, y), 0x10000 = a full turn, counterclockwise from +x. */
u16 ArcTan2(s16 sx, s16 sy)
{
    s32 x = sx, y = sy, r;

    if (y == 0)
        return x >= 0 ? 0 : 0x8000;
    if (x == 0)
        return y >= 0 ? 0x4000 : 0xC000;
    if (y >= 0) {
        if (x >= 0) {
            if (x >= y)
                return (u16)arctan(y * 0x4000 / x);
        } else if (-x >= y) {
            return (u16)(arctan(y * 0x4000 / x) + 0x8000);
        }
        r = 0x4000 - arctan(x * 0x4000 / y);
    } else {
        if (x <= 0) {
            if (-x > -y)
                return (u16)(arctan(y * 0x4000 / x) + 0x8000);
        } else if (x >= -y) {
            return (u16)(arctan(y * 0x4000 / x) + 0x10000);
        }
        r = 0xC000 - arctan(x * 0x4000 / y);
    }
    return (u16)r;
}

/* ---- swi 11-12: memory copy and fill ---- */

void CpuSet(const void *src, void *dest, u32 control)
{
    u32 count = control & 0x1FFFFF;
    int fill = (control & CPU_SET_SRC_FIXED) != 0;

    if (control & CPU_SET_32BIT) {
        const u8 *s = ALIGN_DOWN(src, 4);
        u8 *d = ALIGN_DOWN(dest, 4);
        u32 v = ld32(s);
        for (; count; count--, d += 4) {
            if (!fill) {
                v = ld32(s);
                s += 4;
            }
            st32(d, v);
        }
    } else {
        const u8 *s = ALIGN_DOWN(src, 2);
        u8 *d = ALIGN_DOWN(dest, 2);
        u16 v = ld16(s);
        for (; count; count--, d += 2) {
            if (!fill) {
                v = ld16(s);
                s += 2;
            }
            st16(d, v);
        }
    }
}

/* Words, in blocks of 8: the count is rounded up to a multiple of 8. */
void CpuFastSet(const void *src, void *dest, u32 control)
{
    u32 count = ((control & 0x1FFFFF) + 7) & ~7u;
    const u8 *s = ALIGN_DOWN(src, 4);
    u8 *d = ALIGN_DOWN(dest, 4);

    if (control & CPU_FAST_SET_SRC_FIXED) {
        u32 v = ld32(s);
        for (; count; count--, d += 4)
            st32(d, v);
    } else {
        for (; count; count--, s += 4, d += 4)
            st32(d, ld32(s));
    }
}

/* ---- swi 14-15: affine parameters ---- */

/* sin(i * 2pi / 256) in 1.14, the BIOS's table (its first quarter). */
static const u16 sSinQuarter[65] = {
    0x0000, 0x0192, 0x0323, 0x04B5, 0x0645, 0x07D5, 0x0964, 0x0AF1,
    0x0C7C, 0x0E05, 0x0F8C, 0x1111, 0x1294, 0x1413, 0x158F, 0x1708,
    0x187D, 0x19EF, 0x1B5D, 0x1CC6, 0x1E2B, 0x1F8B, 0x20E7, 0x223D,
    0x238E, 0x24DA, 0x261F, 0x275F, 0x2899, 0x29CD, 0x2AFA, 0x2C21,
    0x2D41, 0x2E5A, 0x2F6B, 0x3076, 0x3179, 0x3274, 0x3367, 0x3453,
    0x3536, 0x3612, 0x36E5, 0x37AF, 0x3871, 0x392A, 0x39DA, 0x3A82,
    0x3B20, 0x3BB6, 0x3C42, 0x3CC5, 0x3D3E, 0x3DAE, 0x3E14, 0x3E71,
    0x3EC5, 0x3F0E, 0x3F4E, 0x3F84, 0x3FB1, 0x3FD3, 0x3FEC, 0x3FFB,
    0x4000,
};

static s32 bios_sin(u32 angle) /* angle: 0-255 */
{
    angle &= 0xFF;
    if (angle < 0x40)
        return sSinQuarter[angle];
    if (angle < 0x80)
        return sSinQuarter[0x80 - angle];
    if (angle < 0xC0)
        return -(s32)sSinQuarter[angle - 0x80];
    return -(s32)sSinQuarter[0x100 - angle];
}

int gBiosAffineMgba;

/* mGBA's HLE BgAffineSet/ObjAffineSet, in single precision (gBiosAffineMgba). */
static void mgba_matrix(s32 sx16, s32 sy16, u32 alpha, float m[4])
{
    float sx = sx16 / 256.f, sy = sy16 / 256.f;
    float theta = (float)((alpha >> 8) / 128.f * 3.14159265358979323846); /* (a double product) */
    float cs = cosf(theta), sn = sinf(theta);
    m[0] = cs * sx;
    m[1] = sn * -sx;
    m[2] = sn * sy;
    m[3] = cs * sy;
}

static void bg_affine_mgba(const struct BgAffineSrcData *src, struct BgAffineDstData *dest)
{
    float m[4], ox = src->texX / 256.f, oy = src->texY / 256.f, cx = src->scrX, cy = src->scrY;
    float rx, ry;
    mgba_matrix(src->sx, src->sy, src->alpha, m);
    rx = ox - (m[0] * cx + m[1] * cy);
    ry = oy - (m[2] * cx + m[3] * cy);
    dest->pa = (s16)(s32)(m[0] * 256);
    dest->pb = (s16)(s32)(m[1] * 256);
    dest->pc = (s16)(s32)(m[2] * 256);
    dest->pd = (s16)(s32)(m[3] * 256);
    dest->dx = (s32)(rx * 256);
    dest->dy = (s32)(ry * 256);
}

/* Only the top 8 bits of the angle count. */
void BgAffineSet(struct BgAffineSrcData *src, struct BgAffineDstData *dest, s32 count)
{
    for (; count > 0; count--, src++, dest++) {
        if (gBiosAffineMgba) {
            bg_affine_mgba(src, dest);
            continue;
        }
        {
        u32 angle = src->alpha >> 8;
        s32 sn = bios_sin(angle), cs = bios_sin(angle + 0x40);
        s32 sx = src->sx, sy = src->sy;
        s32 a = asr(sx * cs, 14), b = asr(sx * sn, 14);
        s32 c = asr(sy * sn, 14), d = asr(sy * cs, 14);
        s32 dx = src->scrX, dy = src->scrY;

        dest->pa = (s16)a;
        dest->pb = (s16)-b;
        dest->pc = (s16)c;
        dest->pd = (s16)d;
        /* the texture coordinate of the screen's top left corner (32-bit wrap) */
        dest->dx = (s32)((u32)src->texX - (u32)(dx * a) + (u32)(dy * b));
        dest->dy = (s32)((u32)src->texY - (u32)(dx * c) - (u32)(dy * d));
        }
    }
}

/* `offset`: bytes between the four results (2: an array, 8: OAM). */
void ObjAffineSet(struct ObjAffineSrcData *src, void *dest, s32 count, s32 offset)
{
    u8 *d = dest;

    for (; count > 0; count--, src++) {
        u32 angle = src->rotation >> 8;
        s32 sn = bios_sin(angle), cs = bios_sin(angle + 0x40);
        s32 sx = src->xScale, sy = src->yScale;

        if (gBiosAffineMgba) {
            float m[4];
            int k;
            mgba_matrix(sx, sy, src->rotation, m);
            for (k = 0; k < 4; k++, d += offset)
                st16(d, (u16)(s32)(m[k] * 256));
            continue;
        }
        st16(d, (u16)asr(sx * cs, 14));
        d += offset;
        st16(d, (u16)-asr(sx * sn, 14));
        d += offset;
        st16(d, (u16)asr(sy * sn, 14));
        d += offset;
        st16(d, (u16)asr(sy * cs, 14));
        d += offset;
    }
}

/* ---- swi 17-21: decompression ---- */

u32 BiosUnCompSize(const void *src)
{
    return ld32(ALIGN_DOWN(src, 4)) >> 8;
}

/* Output through 8-bit writes (WRAM) or 16-bit writes (VRAM, which ignores
 * byte writes): the VRAM variants keep the low byte until the high one
 * comes, and write nothing for a final odd byte. */
struct out {
    u8 *p;
    int vram;
    u8 low;
};

static inline void put(struct out *o, u8 v)
{
    if (!o->vram) {
        *o->p = v;
    } else if (((uintptr_t)o->p & 1) == 0) {
        o->low = v;
    } else {
        o->p[-1] = o->low;
        o->p[0] = v;
    }
    o->p++;
}

u32 LZ77UnComp(const void *src, void *dest, int vram)
{
    const u8 *s = src;
    u32 size = ld32(ALIGN_DOWN(s, 4)) >> 8; /* (the BIOS doesn't check the 0x10 tag) */
    s32 remaining = (s32)size;
    struct out o = { dest, vram, 0 };

    s += 4;
    while (remaining > 0) {
        u8 flags = *s++;
        int i;
        for (i = 0; i < 8 && remaining > 0; i++, flags <<= 1) {
            if (flags & 0x80) {
                u32 block = (u32)(s[0] << 8) | s[1];
                u32 len = (block >> 12) + 3;
                const u8 *from = o.p - (block & 0xFFF) - 1;
                s += 2;
                /* a copy that runs past the size is completed, as on hardware */
                remaining -= (s32)len;
                /* (VRAM: a byte still waiting for its halfword isn't in
                 * memory yet, so a copy from it reads the old contents) */
                while (len--)
                    put(&o, *from++);
            } else {
                put(&o, *s++);
                remaining--;
            }
        }
    }
    return size;
}

void LZ77UnCompWram(const void *src, void *dest)
{
    LZ77UnComp(src, dest, 0);
}

void LZ77UnCompVram(const void *src, void *dest)
{
    LZ77UnComp(src, dest, 1);
}

/* The output is padded with zeros to a multiple of 4 bytes, and the VRAM
 * variant drops a final odd byte (as mGBA's HLE BIOS does). */
u32 RLUnComp(const void *src, void *dest, int vram)
{
    const u8 *s = src;
    u32 size = ld32(ALIGN_DOWN(s, 4)) >> 8;
    s32 remaining = (s32)size;
    int padding = (int)((4 - size) & 3);
    struct out o = { dest, vram, 0 };

    s += 4;
    while (remaining > 0) {
        u8 head = *s++;
        int n;
        if (head & 0x80) {
            u8 v = *s++;
            for (n = (head & 0x7F) + 3; n && remaining; n--, remaining--)
                put(&o, v);
        } else {
            for (n = (head & 0x7F) + 1; n && remaining; n--, remaining--)
                put(&o, *s++);
        }
    }
    if (vram) {
        if ((uintptr_t)o.p & 1) { /* the pending odd byte is dropped */
            o.p++;
            padding--;
        }
        for (; padding > 0; padding -= 2) {
            put(&o, 0);
            put(&o, 0);
        }
    } else {
        while (padding-- > 0)
            put(&o, 0);
    }
    return size;
}

void RLUnCompWram(const void *src, void *dest)
{
    RLUnComp(src, dest, 0);
}

void RLUnCompVram(const void *src, void *dest)
{
    RLUnComp(src, dest, 1);
}

/* Huffman (4- or 8-bit symbols), written as words. */
void HuffUnComp(const void *srcp, void *dest)
{
    const u8 *src = ALIGN_DOWN(srcp, 4);
    u32 header = ld32(src);
    s32 remaining = (s32)(header >> 8);
    u32 bits = header & 0xF;
    const u8 *tree = src + 5, *node;
    const u8 *s;
    u8 *d = ALIGN_DOWN(dest, 4);
    u32 block = 0;
    u32 seen = 0;

    if (bits == 0)
        bits = 8;
    if (32 % bits || bits == 1)
        return; /* odd widths: unsupported (unused by any game data here) */
    s = src + 5 + (src[4] << 1) + 1;
    node = tree;
    while (remaining > 0) {
        u32 stream = ld32(s);
        int n;
        s += 4;
        for (n = 32; n > 0 && remaining > 0; n--, stream <<= 1) {
            /* children of the node at `node`: a pair at (node & ~1) + offset * 2 + 2 */
            const u8 *next = (const u8 *)ALIGN_DOWN(node, 2) + (*node & 0x3F) * 2 + 2;
            u32 sym;
            if (stream & 0x80000000) {
                if (!(*node & 0x40)) {
                    node = next + 1;
                    continue;
                }
                sym = next[1];
            } else {
                if (!(*node & 0x80)) {
                    node = next;
                    continue;
                }
                sym = next[0];
            }
            block |= (sym & ((1u << bits) - 1)) << seen;
            seen += bits;
            node = tree;
            if (seen == 32) {
                st32(d, block);
                d += 4;
                remaining -= 4;
                block = 0;
                seen = 0;
            }
        }
    }
}

/* ---- the rest ---- */

/* SOUNDBIAS's level (bits 0-9) ramps to 0 or to 0x200 (the BIOS steps it
 * gradually; here it is set at once).  Needs gBiosMemory.io. */
static void set_sound_bias(u16 level)
{
    u8 *io = gBiosMemory.io;
    u16 v;
    if (!io)
        return;
    v = (u16)(io[0x88] | io[0x89] << 8);
    v = (u16)((v & ~0x3FF) | level);
    io[0x88] = (u8)v;
    io[0x89] = (u8)(v >> 8);
}

void SoundBiasReset(void)
{
    set_sound_bias(0);
}

void SoundBiasSet(void)
{
    set_sound_bias(0x200);
}

/* No link cable: the transfer always fails. */
int MultiBoot(struct MultiBootParam *mp)
{
    (void)mp;
    return 1;
}
