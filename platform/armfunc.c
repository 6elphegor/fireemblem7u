/*
 * C versions of the handwritten code in asm/crt0.s and asm/veneers.s, for
 * the host build.  Compiled like the game's C (game headers, gnu89,
 * -funsigned-char; platform/platform.mk), since it uses the game's
 * variables.
 *
 * Each function does what the ARM code does, derived from the instructions
 * (asm/crt0.s): the same loop counts (do-while loops that run once for a
 * count of 0), the same unsigned byte loads and 32-bit sums, the same
 * truncations.  The ARM code reaches the game's variables by fixed
 * addresses; here they are the game's symbols.
 *
 *   crt0.s                       here
 *   ColorFadeTick                ColorFadeTick (via ColorFadeTick_thm)
 *   ClearOam, Checksum32,
 *   TmFillRect, TmCopyRect,
 *   TmApplyTsa                   the same, and the _thm veneers (veneers.s)
 *   PutOamHi, PutOamLo, DrawGlyph,
 *   DecodeString, MapFloodCoreStep,
 *   MapFloodCore                 the same (InitRamFuncs points gRamFunc_* at
 *                                them on the GBA after copying them to IWRAM;
 *                                see docs/port-platform.md for the host)
 *   sub_080009FC                 the start-up EWRAM clear
 *   IrqMain                      platform/irq.c
 *   _entry (crt0)                platform/host.c (main)
 *
 * Not ported: the unnamed ARM routine at 0x080005FC (a second glyph drawer
 * nothing refers to).
 */
#include "gbafe.h"

#undef ColorFadeTick
#undef ClearOam
#undef Checksum32
#undef TmApplyTsa
#undef TmCopyRect
#undef TmFillRect
#undef DrawGlyph
#undef DecodeString
#undef PutOamHi
#undef PutOamLo
#undef MapFloodCoreStep
#undef MapFloodCore

extern s8 gFadeComponentStep[0x20];
extern s8 gFadeComponents[0x600];
extern const unsigned int gMsgHuffmanTable[];
extern const unsigned int * const gMsgHuffmanTableRoot;

void ColorFadeTick(void);
void ClearOam(void * oam, int count);
u32 Checksum32(void const * buf, int size);
void TmApplyTsa(u16 * tm, u8 const * tsa, u16 tileref);
void TmCopyRect(u16 const * src, u16 * dst, int width, int height);
void TmFillRect(u16 * tm, int width, int height, u16 tileref);
void DrawGlyph(u16 const * cvtLut, void * chr, u32 const * glyph, int offset);
void DecodeString(char const * src, char * dst);
void PutOamHi(int x, int y, u16 const * oam_list, int oam2);
void PutOamLo(int x, int y, u16 const * oam_list, int oam2);
void MapFloodCoreStep(int connect, int x, int y);
void MapFloodCore(void);
void sub_080009FC(void);

static u16 ld16(void const * p)
{
    u8 const * b = p;
    return (u16) (b[0] | (b[1] << 8));
}

static void st16(void * p, u16 v)
{
    u8 * b = p;
    b[0] = (u8) v;
    b[1] = (u8) (v >> 8);
}

static u32 ld32(void const * p)
{
    u8 const * b = p;
    return b[0] | (b[1] << 8) | (b[2] << 16) | ((u32) b[3] << 24);
}

static void st32(void * p, u32 v)
{
    u8 * b = p;
    b[0] = (u8) v;
    b[1] = (u8) (v >> 8);
    b[2] = (u8) (v >> 16);
    b[3] = (u8) (v >> 24);
}

static int clamp_component(int v)
{
    v -= 0x20;
    if (v < 0)
        v = 0;
    if (v >= 0x20)
        v = 0x1F;
    return v;
}

// Palettes 31..0, colors 15..0: each component byte (unsigned) plus the
// palette's signed step, stored back as a byte; the color is taken from the
// untruncated sum minus 0x20, clamped to 0..31.
void ColorFadeTick(void)
{
    int pal, color;

    for (pal = 0x1F; pal >= 0; pal--)
    {
        int step = gFadeComponentStep[pal];

        if (step == 0)
            continue;

        for (color = 15; color >= 0; color--)
        {
            u8 * c = (u8 *) gFadeComponents + (pal * 16 + color) * 3;
            int r = c[0] + step;
            int g = c[1] + step;
            int b = c[2] + step;

            c[0] = (u8) r;
            c[1] = (u8) g;
            c[2] = (u8) b;

            gPal[pal * 16 + color] = (u16) (clamp_component(r) + (clamp_component(g) << 5) + (clamp_component(b) << 10));
        }
    }
}

// Hides 16 OAM entries per step (attribute word 0 = 0xA0: y = 160, the
// rest 0), count >> 4 steps, at least one.
void ClearOam(void * oam, int count)
{
    u8 * p = oam;
    int n = (int) (((u32) count >> 4) - 1);

    do
    {
        int i;

        for (i = 0; i < 16; i++)
            st32(p + i * 8, 0xA0);
        p += 0x80;
    }
    while (--n >= 0);
}

// Sum and xor of the halfwords: (sum & 0xFFFF) + (xor << 16).
u32 Checksum32(void const * buf, int size)
{
    u8 const * p = buf;
    u32 sum = 0, x = 0;
    int n = size - 2;

    do
    {
        u16 h = ld16(p);

        sum += h;
        x ^= h;
        p += 2;
        n -= 2;
    }
    while (n >= 0);

    return (sum & 0xFFFF) + (x << 16);
}

// (width + 1) x (height + 1) entries of a 32-wide tilemap.
void TmFillRect(u16 * tm, int width, int height, u16 tileref)
{
    u8 * row = (u8 *) tm;
    int y = height;

    do
    {
        u8 * p = row;
        int x = width;

        do
        {
            st16(p, tileref);
            p += 2;
        }
        while (--x >= 0);

        row += 0x40;
    }
    while (--y >= 0);
}

// width x height entries between two 32-wide tilemaps; nothing if either is
// 0 or negative.
void TmCopyRect(u16 const * src, u16 * dst, int width, int height)
{
    u8 const * s = (u8 const *) src;
    u8 * d = (u8 *) dst;
    int skip, y;

    if (width <= 0 || height <= 0)
        return;

    skip = 0x40 - width * 2;
    y = height - 1;

    do
    {
        int x = width - 1;

        do
        {
            st16(d, ld16(s));
            s += 2;
            d += 2;
        }
        while (--x >= 0);

        s += skip;
        d += skip;
    }
    while (--y >= 0);
}

// A TSA block (width - 1, height - 1, then the entries bottom row first)
// into a 32-wide tilemap, adding tileref to each entry.
void TmApplyTsa(u16 * tm, u8 const * tsa, u16 tileref)
{
    int w = tsa[0];
    int h = tsa[1];
    u8 * d = (u8 *) tm + (h << 6);
    u8 const * s = tsa + 2;
    int y = h;

    do
    {
        int x = w;

        do
        {
            st16(d, (u16) (ld16(s) + tileref));
            d += 2;
            s += 2;
        }
        while (--x >= 0);

        d -= w * 2;
        d -= 0x42;
    }
    while (--y >= 0);
}

// The sprite list: a count, then 3 halfwords per sprite; x and y are added
// to the attributes (with the ARM code's masks: y's high byte ORed into
// attribute 0's), oam2 to attribute 2.  The entries go to *put, which
// advances by 8 per sprite.
static void PutOam(u16 ** put, int x, int y, u16 const * oam_list, int oam2)
{
    u8 const * in = (u8 const *) oam_list;
    u8 * out = (u8 *) *put;
    u32 count = ld16(in);
    u32 xy;

    if (count == 0)
        return;

    in += 2;
    *put = (u16 *) (out + count * 8);

    xy = ((u32) x & 0xFFFF) | ((u32) y << 16);

    do
    {
        u32 a0 = ld16(in), a1 = ld16(in + 2), a2 = ld16(in + 4);

        st16(out, (u16) (((a0 | (xy >> 16)) & 0xFF00) | ((a0 + (xy >> 16)) & 0xFF)));
        st16(out + 2, (u16) (((a1 | xy) & 0xFE00) | ((a1 + xy) & 0x1FF)));
        st16(out + 4, (u16) (a2 + oam2));

        in += 6;
        out += 8;
    }
    while (--count != 0);
}

void PutOamHi(int x, int y, u16 const * oam_list, int oam2)
{
    PutOam(&gOamHiPutIt, x, y, oam_list, oam2);
}

void PutOamLo(int x, int y, u16 const * oam_list, int oam2)
{
    PutOam(&gOamLoPutIt, x, y, oam_list, oam2);
}

// 16 rows of a 2bpp glyph (one word, 16 pixels), shifted right by `offset`
// pixels (the word times 4^offset), converted 4 pixels at a time through
// cvtLut (a byte of 2bpp -> a halfword of 4bpp) and ORed into this tile's
// row and the next tile's (+0x40).
void DrawGlyph(u16 const * cvtLut, void * chr, u32 const * glyph, int offset)
{
    static const u32 mul[8] = { 1, 4, 0x10, 0x40, 0x100, 0x400, 0x1000, 0x4000 };
    u8 * out = chr;
    u8 const * in = (u8 const *) glyph;
    int row;

    for (row = 0; row < 16; row++)
    {
        u32 bits = ld32(in);

        if (bits != 0)
        {
            u32 v = bits * mul[offset];

            st32(out, ld32(out) | cvtLut[v & 0xFF] | ((u32) cvtLut[(v >> 8) & 0xFF] << 16));
            st32(out + 0x40, ld32(out + 0x40) | cvtLut[(v >> 16) & 0xFF] | ((u32) cvtLut[v >> 24] << 16));
        }

        out += 4;
        in += 4;
    }
}

// Huffman-decodes a message: bits from the low end of each byte; a node
// word holds the left (bit 0) and right (bit 1) child indexes into
// gMsgHuffmanTable; a leaf (bit 31 set) holds one or two characters.  Ends
// after writing a 0 character.
void DecodeString(char const * src, char * dst)
{
    u8 const * in = (u8 const *) src;
    u8 * out = (u8 *) dst;
    u8 const * table = (u8 const *) gMsgHuffmanTable;
    u8 const * root = (u8 const *) gMsgHuffmanTableRoot;
    int bits = 0;
    u32 cur = 0;

    for (;;)
    {
        u8 const * node = root;
        u32 leaf;

        for (;;)
        {
            u32 child;

            if (--bits < 0)
            {
                cur = *in++;
                bits = 7;
            }

            child = (cur & 1) ? ld16(node + 2) : ld16(node);
            node = table + child * 4;
            cur >>= 1;

            leaf = ld32(node);
            if (leaf & 0x80000000)
                break;
        }

        if (leaf & 0xFF00)
        {
            out[0] = (u8) leaf;
            out[1] = (u8) (leaf >> 8);
            out += 2;
            continue;
        }

        out[0] = (u8) leaf;
        if ((leaf & 0xFF) == 0)
            return;
        out += 1;
    }
}

// One neighbour of the flood fill's current entry.  Unsigned byte math as
// in the ARM code; the cost stored is truncated to a byte.
void MapFloodCoreStep(int connect, int x, int y)
{
    struct MovMapFillStateExt * src = gMovMapFillState.src;
    u8 sx = (u8) src->xPos, sy = (u8) src->yPos;
    u32 cost;

    x += sx;
    y += sy;

    cost = (u8) gWorkingTerrainMoveCosts[(u8) gBmMapTerrain[y][x]] + (u32) (u8) gWorkingBmMap[sy][sx];

    if (cost >= (u8) gWorkingBmMap[y][x])
        return;

    if (gMovMapFillState.hasUnit)
    {
        u8 unit = gBmMapUnit[y][x];

        if (unit != 0 && ((gMovMapFillState.unitId ^ unit) & 0x80))
            return;
    }

    if (cost > gMovMapFillState.movement)
        return;

    {
        u8 * d = (u8 *) gMovMapFillState.dst;

        d[0] = (u8) x;
        d[1] = (u8) y;
        d[2] = (u8) connect;
        d[3] = (u8) cost;
        gMovMapFillState.dst++;
    }

    gWorkingBmMap[y][x] = (u8) cost;
}

// Breadth-first flood between the two entry pools; an entry's connexion
// (the direction it was reached from, 5 = the start) decides which
// neighbours are tried; 4 ends a pool.
void MapFloodCore(void)
{
    int flip = 0;

    for (;;)
    {
        flip ^= 1;

        if (flip)
        {
            gMovMapFillState.src = gMovMapFillStPool1;
            gMovMapFillState.dst = gMovMapFillStPool2;
        }
        else
        {
            gMovMapFillState.src = gMovMapFillStPool2;
            gMovMapFillState.dst = gMovMapFillStPool1;
        }

        if (gMovMapFillState.src->connexion == 4)
            return;

        for (;;)
        {
            switch (gMovMapFillState.src->connexion)
            {
            case 0:
                MapFloodCoreStep(3, 0, -1);
                MapFloodCoreStep(2, 0, 1);
                MapFloodCoreStep(0, -1, 0);
                break;

            case 1:
                MapFloodCoreStep(3, 0, -1);
                MapFloodCoreStep(2, 0, 1);
                MapFloodCoreStep(1, 1, 0);
                break;

            case 2:
                MapFloodCoreStep(2, 0, 1);
                MapFloodCoreStep(0, -1, 0);
                MapFloodCoreStep(1, 1, 0);
                break;

            case 3:
                MapFloodCoreStep(3, 0, -1);
                MapFloodCoreStep(0, -1, 0);
                MapFloodCoreStep(1, 1, 0);
                break;

            case 4:
                goto next_pool;

            default: // 5: the start
                MapFloodCoreStep(3, 0, -1);
                MapFloodCoreStep(2, 0, 1);
                MapFloodCoreStep(0, -1, 0);
                MapFloodCoreStep(1, 1, 0);
                break;
            }

            gMovMapFillState.dst->connexion = 4;
            gMovMapFillState.src++;
        }

    next_pool:;
    }
}

// asm/veneers.s: Thumb-to-ARM veneers; on the host just the functions.
void ClearOam_thm(void * oam, int count) { ClearOam(oam, count); }
void TmApplyTsa_thm(u16 * tm, u8 const * tsa, u16 tileref) { TmApplyTsa(tm, tsa, tileref); }
void TmFillRect_thm(u16 * tm, int width, int height, u16 tileref) { TmFillRect(tm, width, height, tileref); }
void ColorFadeTick_thm(void) { ColorFadeTick(); }
void TmCopyRect_thm(u16 const * src, u16 * dst, int width, int height) { TmCopyRect(src, dst, width, height); }
u32 Checksum32_thm(void const * buf, int size) { return Checksum32(buf, size); }

// crt0.s: clear EWRAM (CpuFastSet fill of 0x40000 bytes at 0x02000000),
// keeping the two soft reset flags (hardware.c) that live there.
void sub_080009FC(void)
{
    u32 a = sub_08002C0C();
    u32 b = sub_08002C24();
    u32 zero = 0;

    CpuFastSet(&zero, (void *) EWRAM_START, CPU_FAST_SET_SRC_FIXED | (0x40000 / 4));

    if (gHostEwramClearHook)
        gHostEwramClearHook();

    sub_08002C3C(a);
    sub_08002C58(b);
}
