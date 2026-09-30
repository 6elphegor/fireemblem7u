#include "gbafe.h"

void m4aMPlayImmInit(struct MusicPlayerInfo * mplayInfo);
void MPlayPanpotControl(struct MusicPlayerInfo * mplayInfo, u16 trackBits, s8 pan);
void FadeBgmOut(int speed);

extern void (* CONST_DATA gDecompressFuncLut[])(void const * src, void * dst);

extern struct PalFadeSt sPalFadeSt[0x20];
extern struct Text sPutStringText;

struct Proc08B928DC;
struct ProcSpacialSeTest;
struct PalFadeProc;
void PalFade_OnLoop(struct PalFadeProc * proc);
void SpacialSeTest_OnInit(struct ProcSpacialSeTest * proc);
void SpacialSeTest_OnLoop(struct ProcSpacialSeTest * proc);
void sub_08013964(struct Proc08B928DC * proc);
void sub_0801396C(struct Proc08B928DC * proc);

void (* CONST_DATA gDecompressFuncLut[])(void const * src, void * dst) = {
    UnpackRaw,
    UnpackRaw,
    LZ77UnCompVram,
    LZ77UnCompWram,
    HuffUnComp,
    HuffUnComp,
    RLUnCompVram,
    RLUnCompWram,
};

CONST_DATA struct ProcCmd ProcScr_08B928DC[] = {
    PROC_YIELD,
    PROC_CALL(sub_08013964),
    PROC_REPEAT(sub_0801396C),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_SpacialSeTest[] = {
    PROC_CALL(LockGame),
    PROC_CALL(SpacialSeTest_OnInit),
    PROC_REPEAT(SpacialSeTest_OnLoop),
};

CONST_DATA struct ProcCmd ProcScr_PalFade[] = {
    PROC_MARK(10),
    PROC_REPEAT(PalFade_OnLoop),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_FadeToBlack[] = {
    PROC_CALL(FadeToBlack_OnInit),
    PROC_YIELD,
    PROC_REPEAT(FadeToCommon_OnLoop),
    PROC_BLOCK,
};

CONST_DATA struct ProcCmd ProcScr_FadeFromBlack[] = {
    PROC_CALL(FadeFromBlack_OnInit),
    PROC_YIELD,
    PROC_REPEAT(FadeFromCommon_OnLoop),
    PROC_BLOCK,
};

CONST_DATA struct ProcCmd ProcScr_FadeToWhite[] = {
    PROC_CALL(FadeToWhite_OnInit),
    PROC_YIELD,
    PROC_REPEAT(FadeToCommon_OnLoop),
    PROC_BLOCK,
};

CONST_DATA struct ProcCmd ProcScr_FadeFromWhite[] = {
    PROC_CALL(FadeFromWhite_OnInit),
    PROC_YIELD,
    PROC_REPEAT(FadeFromCommon_OnLoop),
    PROC_BLOCK,
};

CONST_DATA struct ProcCmd ProcScr_FadeCore[] = {
    PROC_MARK(10),
    PROC_CALL(FadeCore_Init),
    PROC_YIELD,
    PROC_CALL(FadeCore_Tick),
    PROC_REPEAT(FadeCore_Loop),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_TemporaryLock[] = {
    PROC_YIELD,
    PROC_REPEAT(TemporaryLock_OnLoop),
    PROC_END,
};

CONST_DATA char SJisZero[] = "０";

CONST_DATA char SJisDash[] = "ー";

CONST_DATA char AsciiZero = '0';

CONST_DATA char AsciiDash = '-';

CONST_DATA struct ProcCmd ProcScr_PaletteAnimator[] = {
    PROC_REPEAT(PaletteAnimator_Loop),
};

CONST_DATA struct ProcCmd ProcScr_CallDelayed[] = {
    PROC_REPEAT(CallDelayed_OnLoop),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_CallDelayedArg[] = {
    PROC_REPEAT(CallDelayedArg_OnLoop),
    PROC_END,
};

CONST_DATA u16 Pal_AllBlack[] = {
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
};

CONST_DATA u16 Pal_AllWhite[] = {
    0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF,
    0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF,
};

CONST_DATA u16 Pal_AllRed[] = {
    0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F,
    0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F,
};

CONST_DATA u16 Pal_AllGreen[] = {
    0x3E0, 0x3E0, 0x3E0, 0x3E0, 0x3E0, 0x3E0, 0x3E0, 0x3E0,
    0x3E0, 0x3E0, 0x3E0, 0x3E0, 0x3E0, 0x3E0, 0x3E0, 0x3E0,
};

CONST_DATA u16 Pal_AllBlue[] = {
    0x7C00, 0x7C00, 0x7C00, 0x7C00, 0x7C00, 0x7C00, 0x7C00, 0x7C00,
    0x7C00, 0x7C00, 0x7C00, 0x7C00, 0x7C00, 0x7C00, 0x7C00, 0x7C00,
};

CONST_DATA u16 Pal_AllYellow[] = {
    0x7FE, 0x7FE, 0x7FE, 0x7FE, 0x7FE, 0x7FE, 0x7FE, 0x7FE,
    0x7FE, 0x7FE, 0x7FE, 0x7FE, 0x7FE, 0x7FE, 0x7FE, 0x7FE,
};

CONST_DATA struct ProcCmd ProcScr_PartialGameLock[] = {
    PROC_REPEAT(PartialGameLock_OnLoop),
    PROC_END,
};

int Interpolate(int method, int lo, int hi, int x, int x_max)
{
    int deno, dx, base, ret;
#if !NONMATCHING
    register int _deno asm("r0");
#endif

    if (0 == x_max)
        return hi;

    switch (method) {
    case INTERPOLATE_LINEAR:
        deno = (hi - lo) * x;
        ret = lo + Div(deno, x_max);
        break;

    case INTERPOLATE_SQUARE:
#if NONMATCHING
        deno = x * x * (hi - lo);
#else
        _deno = x * x;
        deno = _deno * (hi - lo);
#endif
        ret = lo + Div(deno, x_max * x_max);
        break;

    case INTERPOLATE_CUBIC:
        deno = x * x * x * (hi - lo);
        ret = lo + Div(deno,  x_max * x_max * x_max);
        break;

    case INTERPOLATE_POW4:
        deno = x * x * x * x * (hi - lo);
        ret = lo + Div(deno, x_max * x_max * x_max * x_max);
        break;

    case INTERPOLATE_RSQUARE:
        dx = x_max - x;
        deno = dx * dx * (hi - lo);
        ret = lo + (hi - lo) - Div(deno, x_max * x_max);
        break;

    case INTERPOLATE_RCUBIC:
        dx = x_max - x;
        deno = dx * dx * dx * (hi - lo);
        ret = lo + (hi - lo) - Div(deno, x_max * x_max * x_max);
        break;

    default:
        ret = 0;
    }

    return ret;
}

void sub_080130B0(void)
{
}

bool StringEquals(char const * str1, char const * str2)
{
    while (!!(*str1 | *str2))
        if (*str1++ != *str2++)
            return FALSE;

    return TRUE;
}

void StringCopy(char * dst, char const * src)
{
    while ('\0' != *src)
        *dst++ = *src++;

    *dst = *src;
}

void UnpackRaw(void const * src, void * dst)
{
    int size = GetDataSize(src) - 4;

    if (0 != size % 32)
        CpuCopy16(src + 4, dst, size);
    else
        CpuFastCopy(src + 4, dst, size);
}

void DecompressViaGenericBuf(void const * src, void * dst)
{
    LZ77UnCompWram(src, gBuf);
    CpuFastCopy(gBuf, dst, GetDataSize(src));
}

void Decompress(void const * src, void * dst)
{
    int is_wram;
    struct TileMapArr const * tsa = src;

    if ((((u32) dst) - VRAM) < VRAM_SIZE)
        is_wram = FALSE;
    else
        is_wram = TRUE;

    gDecompressFuncLut[is_wram + ((tsa->type & 0xF0) >> 3)](src, dst);
}

int GetDataSize(void const * data)
{
    struct TileMapArr const * tsa = data;
    return tsa->size;
}

void sub_080131B0(struct Struct08013180 * buf, int arg_1, int arg_2)
{
    buf->dst = (u8 *) arg_2;

    arg_1 = (arg_1 & 0xFFE0) >> 5;
    arg_2 = (arg_2 & 0xFFE0) >> 5;

    buf->unk_04 = arg_2 - arg_1;
}

int sub_080131C8(struct Struct08013180 * unk, u8 * src)
{
    int size, old;

    Decompress(src, unk->dst);

    size = GetDataSize(src);

    unk->dst += size;

    old = unk->unk_04;
    unk->unk_04 += size / 0x20;

    return old;
}

int sub_080131F8(struct Struct08013180 * buf, int arg_1)
{
    int old;

    buf->dst += arg_1 << 5;

    old = buf->unk_04;
    buf->unk_04 += arg_1;

    return old;
}

void Register2dChrMove(u8 const * src, u8 * dst, int width, int height)
{
    int i, line_size = width * CHR_SIZE;

    if (height <= 0)
        return;

    for (i = height; i != 0; --i) {
        RegisterDataMove(src, dst, line_size);

        src += line_size;
        dst += CHR_SIZE * 0x20;
    }
}

void Copy2dChr(void const * src, u8 * dst, int width, int height)
{
    int i, line_size = width * CHR_SIZE;

    if (height <= 0)
        return;

    for (i = height; i != 0; --i) {
        CpuFastCopy(src, dst, line_size);

        src += line_size;
        dst += CHR_SIZE * 0x20;
    }
}

void ApplyBitmap(u8 const * src, void * dst, int width, int height)
{
    int i, line_size;

    if (height <= 0)
        return;

    line_size = 8 * 8 * width;

    for (i = height; i != 0; --i) {
        ApplyBitmapLine(src, dst, width);

        src += line_size;
        dst += CHR_SIZE * width;
    }
}

void ApplyBitmapLine(u8 const * src, void * dst, int width)
{
    int i;

    if (width <= 0)
        return;

    for (i = width; i != 0; i--) {
        ApplyBitmapTile(src, dst, width);

        src += 8;
        dst += CHR_SIZE;
    }
}

void ApplyBitmapTile(u8 const * src, u32 * dst, int width)
{
    int i;

    for (i = 0; i < 8; ++i) {
        u32 value = 0;

        value |= src[7];

        value <<= 4;
        value |= src[6];

        value <<= 4;
        value |= src[5];

        value <<= 4;
        value |= src[4];

        value <<= 4;
        value |= src[3];

        value <<= 4;
        value |= src[2];

        value <<= 4;
        value |= src[1];

        value <<= 4;
        value |= src[0];

        *dst++ = value;
        src += width * 8;
    }
}

void PutAppliedBitmap(u16 * tm, int tileref, int width, int height)
{
    int ix, iy;

    for (iy = 0; iy < height; ++iy)
        for (ix = 0; ix < width; ++ix)
            tm[TM_OFFSET(ix, iy)] = tileref++;
}

void PutDigits(u16 * tm, u8 const * src, int tileref, int len)
{
    int i;

    for (i = 0; i < len; ++i)
        tm[-i] = 0;

    while (*src != ' ')
    {
        *tm-- = tileref + *src - '0';
        src--;
    }
}

void sub_08013380(struct Unk_08013380 * unk, int value)
{
    unk->unk_4C = value;
}

void sub_08013388(struct Unk_08013380 * unk)
{
    unk->unk_4C++;
    unk->unk_4C &= 0x7FFF;
}

void sub_0801339C(struct Unk_08013380 * unk)
{
    unk->unk_4C--;
}

void sub_080133A8(s16 * array)
{
    int i;

    for (i = DISPLAY_HEIGHT - 1; i >= 0; --i) {
        *array++ = DISPLAY_WIDTH;
        *array++ = -1;
    }
}

#define _SWAP(a, b) \
do {                \
    tmp = a;        \
    a = b;          \
    b = tmp;        \
} while (0)

void sub_080133C8(s16 * buf, int x1, int y1, int x2, int y2)
{
    int val1, val2;
    int tmp;

    if (y1 > y2) {
        _SWAP(x2, x1);
        _SWAP(y2, y1);
    }

    val1 = ((x2 - x1) << 0x10) / (y2 - y1);
    val2 = x1 << 0x10;

    if (y2 > DISPLAY_HEIGHT)
        y2 = DISPLAY_HEIGHT;

    if (y1 < 0) {
        val2 += val1 * -y1;
        y1 = 0;
    }

    for (; y1 < y2; y1++) {
#if NONMATCHING
        int val = val2 >> 0x10;
#else
        register int val asm("r3") = val2 >> 0x10;
#endif
        LIMIT_AREA(val, 0, 240);

        if (buf[2 * y1 + 0] > val)
            buf[2 * y1 + 0] = val;

        if (buf[2 * y1 + 1] < val)
            buf[2 * y1 + 1] = val;
#if !NONMATCHING
        asm(""::"r"(buf + 2 * y1));
#endif

        val2 += val1;
    }
}

#undef _SWAP

struct Vec2 * sub_08013450(int arg_0)
{
    #define BUF ((struct Vec2 *) gBuf)

    int r2;
    int sb;
    int sp_00;

    sp_00 = arg_0;

    if (sp_00 > 80)
        sp_00 = 80;

    r2 = arg_0;

    for (sb = 0; r2 >= sb; ++sb)
    {
        u16 sp_18, r4, r3, r1;

        sp_18 = sp_00 + sb;

        if (sp_18 < DISPLAY_HEIGHT)
            BUF[sp_00 + sb].y = r2;

        r4 = sp_00 - sb;

        if (r4 < DISPLAY_HEIGHT)
            BUF[sp_00 - sb].y = r2;

        r3 = sp_00 + r2;

        if (r3 < DISPLAY_HEIGHT)
            BUF[sp_00 + r2].y = sb;

        r1 = sp_00 - r2;

        if (r1 < DISPLAY_HEIGHT)
            BUF[sp_00 - r2].y = sb;

        if (sp_18 < DISPLAY_HEIGHT)
            BUF[sp_00 + sb].x = -r2;

        if (r4 < DISPLAY_HEIGHT)
            BUF[sp_00 - sb].x = -r2;

        if (r3 < DISPLAY_HEIGHT)
            BUF[sp_00 + r2].x = -sb;

        if (r1 < DISPLAY_HEIGHT)
            BUF[sp_00 - r2].x = -sb;

        arg_0 = arg_0 - (sb * 2 - 1);

        if (arg_0 < 0)
        {
            arg_0 = arg_0 + (r2 - 1) * 2;
            r2--;
        }
    }

    return BUF;

    #undef BUF
}

void DarkenPals(int reduction)
{
    u16 * buf = (u16 *) gBuf;

    int i;

    for (i = 0; i < 0x200; ++i)
    {
        int color = gPal[i];

        if ((color & 0x001F) >= RGB(reduction, 0, 0))
            color -= RGB(reduction, 0, 0);
        else
            color = color & 0xFFE0;

        if ((color & 0x03E0) >= RGB(0, reduction, 0))
            color -= RGB(0, reduction, 0);
        else
            color = color & 0xFC1F;

        if ((color & 0x7C00) >= RGB(0, 0, reduction))
            color -= RGB(0, 0, reduction);
        else
            color = color & 0x03FF;

        buf[i] = color;
    }

    DisablePalSync();
    RegisterDataMove(buf, (void *) PLTT, 0x400);
}

void sub_08013600(void)
{
    return;
}

void sub_08013604(char const * _str)
{
    char str[] = "@@LWFOVDBK@@";
    sub_08013604(str);
}

struct PalFadeSt * GetPalFadeSt(void)
{
    return (void *) sPalFadeSt;
}

void SetPalFadeStClkEnd1(int end)
{
    GetPalFadeSt()[0].clock_end = end;
}

void SetPalFadeStClkEnd2(int end)
{
    GetPalFadeSt()[1].clock_end = end;
}

void SetPalFadeStClkEnd3(int end)
{
    GetPalFadeSt()[2].clock_end = end;
}

int GetPalFadeStClkEnd1(void)
{
    return GetPalFadeSt()[0].clock_end;
}

int GetPalFadeStClkEnd2(void)
{
    return GetPalFadeSt()[1].clock_end;
}

int GetPalFadeStClkEnd3(void)
{
    return GetPalFadeSt()[2].clock_end;
}

void SetPalFadeStClkEnd(int end1, int end2, int end3)
{
    SetPalFadeStClkEnd1(end1);
    SetPalFadeStClkEnd2(end2);
    SetPalFadeStClkEnd3(end3);
}

void ArchiveCurrentPalettes(void)
{
    int i, j;
    u16 * dst = (void *) GetPalFadeSt();
    u16 * src = gPal;

    for (i = 0; i < 32; i++) {
        for (j = 0; j < 16; j++)
            dst[j] = *src++;

#if PLATFORM_GBA
        dst += 24;
#else
        dst += sizeof(struct PalFadeSt) / sizeof(u16); // 0x30 bytes on the GBA, 0x38 on a host
#endif
    }

    SetPalFadeStClkEnd1(0x100);
    SetPalFadeStClkEnd2(0x100);
    SetPalFadeStClkEnd3(0x100);
}

void ArchivePalette(int index)
{
    int i;
    struct PalFadeSt * dst = GetPalFadeSt();
    u16 * src = &gPal[PAL_OFFSET(index)];

    for (i = 0; i < 16; i++)
        dst[index].from_colors[i] = *src++;
}

// FAKEMATCH (found by an Opus 5.5 agent): the scaled term pinned to r0 and a
// barrier on the sum give the original "adds r1, r1, r0".
// FE8U port; only the red-channel sum differs: the original emits "adds r1, r1, r0" (result in
// the masked-color register), this gives "adds r0, r0, r1"
void WriteFadedPaletteFromArchive(int a1, int a2, int a3, u32 mask)
{
    int i, j;
    struct PalFadeSt *st;
    u16 *buffer = gPal;

    SetPalFadeStClkEnd1(a1);
    SetPalFadeStClkEnd2(a2);
    SetPalFadeStClkEnd3(a3);

    st = GetPalFadeSt();

    if (a1 > 0x100) {
        a1 -= 0x100;

        for (i = 0; i < 0x20; i++) {
            if ((1 << i) & mask) {
                for (j = 0; j < 0x10; j++) {
#if NONMATCHING
                    int t = st[i].from_colors[j] & 0x1F;
                    buffer[0x10 * i + j] = (t + (((0x1F - t) * a1) >> 8)) & 0x1F;
#else
                    u8 r __attribute__((unused)) = st[i].from_colors[j] & 0x1F;
                    int t = st[i].from_colors[j] & 0x1F;
                    register int p asm("r0") = ((0x1F - t) * a1) >> 8;
                    int sum = t + p;

                    asm("" : "+r"(sum));
                    buffer[0x10 * i + j] = sum & 0x1F;
#endif
                }
            }
        }
    } else {
        for (i = 0; i < 0x20; i++) {
            if ((1 << i) & mask) {
                for (j = 0; j < 0x10; j++) {
                    u8 r __attribute__((unused)) = st[i].from_colors[j] & 0x1F;
                    buffer[0x10 * i + j] = (((st[i].from_colors[j] & 0x1F) * a1) >> 8) & 0x1F;
                }
            }
        }
    }

    if (a2 > 0x100) {
        a2 -= 0x100;

        for (i = 0; i < 0x20; i++) {
            if ((1 << i) & mask) {
                for (j = 0; j < 0x10; j++) {
                    u16 g = st[i].from_colors[j] & 0x3E0;
                    buffer[0x10 * i + j] |= 0x3E0 & (g + ((0x3E0 - g) * a2 >> 8));
                }
            }
        }
    } else {
        for (i = 0; i < 0x20; i++) {
            if ((1 << i) & mask) {
                for (j = 0; j < 0x10; j++) {
                    u16 g = st[i].from_colors[j] & 0x3E0;
                    buffer[0x10 * i + j] |= 0x3E0 & (g * a2 >> 8);
                }
            }
        }
    }

    if (a3 > 0x100) {
        a3 -= 0x100;

        for (i = 0; i < 0x20; i++) {
            if ((1 << i) & mask) {
                for (j = 0; j < 0x10; j++) {
                    u16 b = st[i].from_colors[j] & 0x7C00;
                    buffer[0x10 * i + j] |= 0x7C00 & (b + ((0x7C00 - b) * a3 >> 8));
                }
            }
        }
    } else {
        for (i = 0; i < 0x20; i++) {
            if ((1 << i) & mask) {
                for (j = 0; j < 0x10; j++) {
                    u16 b = st[i].from_colors[j] & 0x7C00;
                    buffer[0x10 * i + j] |= 0x7C00 & (b * a3 >> 8);
                }
            }
        }
    }

    EnablePalSync();
}

struct Proc08B928DC {
    PROC_HEADER;

    int unk2C, unk30, unk34, unk38, unk3C, unk40, unk44, unk48, unk4C;
};
PROC_SIZE_CHECK(struct Proc08B928DC);

void sub_08013964(struct Proc08B928DC * proc)
{
    proc->unk44 = 0;
}

void sub_0801396C(struct Proc08B928DC * proc)
{
    int val = proc->unk44 + proc->unk48;

    proc->unk44 = val;

    WriteFadedPaletteFromArchive(
        (proc->unk2C * (0x100 - val) + proc->unk38 * val) / 0x100,
        (proc->unk30 * (0x100 - val) + proc->unk3C * val) / 0x100,
        (proc->unk34 * (0x100 - val) + proc->unk40 * val) / 0x100,
        proc->unk4C
    );

    if (proc->unk44 == 0x100)
        Proc_Break(proc);
}

void sub_080139D8(int a, int b, int c, int d, int e, int f, int g, int h, ProcPtr parent)
{
    struct Proc08B928DC * proc = Proc_Start(ProcScr_08B928DC, parent);

    proc->unk2C = a;
    proc->unk30 = b;
    proc->unk34 = c;
    proc->unk38 = d;
    proc->unk3C = e;
    proc->unk40 = f;
    proc->unk48 = h;
    proc->unk4C = g;
}

bool sub_08013A1C(void)
{
    if (Proc_Find(ProcScr_08B928DC) != NULL)
        return TRUE;

    return FALSE;
}

struct ProcSpacialSeTest {
    PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x64);
    /* 64 */ short unk64;
    /* 66 */ short unk66;
};
PROC_SIZE_CHECK(struct ProcSpacialSeTest);

void SpacialSeTest_OnInit(struct ProcSpacialSeTest * proc)
{
    proc->unk64 = 0;
    proc->unk66 = 90;
}

void SpacialSeTest_OnLoop(struct ProcSpacialSeTest * proc)
{
    int location = 0;

    if (gpKeySt->pressed & A_BUTTON)
        proc->unk66++;

    if (((proc->unk64++) & 0x0F) == 0)
    {
        if (gpKeySt->held & DPAD_LEFT)
            location = -proc->unk66;

        if (gpKeySt->held & DPAD_RIGHT)
            location = +proc->unk66;

        PlaySeSpacial(0x9A, location);
    }
}

void StartSpacialSeTest(void)
{
    Proc_Start(ProcScr_SpacialSeTest, PROC_TREE_3);
}

void sub_08013AC4(void)
{
    return;
}

void StartPalFadeToBlack(int palid, int duration, ProcPtr parent)
{
    StartPalFade(Pal_AllBlack, palid, duration, parent);
}

void StartPalFadeToWhite(int palid, int duration, ProcPtr parent)
{
    StartPalFade(Pal_AllWhite, palid, duration, parent);
}

struct PalFadeProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ struct PalFadeSt * st;
};
PROC_SIZE_CHECK(struct PalFadeProc);

struct PalFadeSt * StartPalFade(u16 const * colors, int pal, int duration, ProcPtr parent)
{
    struct PalFadeSt * st = sPalFadeSt + pal;
    struct PalFadeProc * proc = Proc_Start(ProcScr_PalFade, parent);

    CpuCopy16(gPal + PAL_OFFSET(pal), st->from_colors, sizeof(st->from_colors));

    st->pal = gPal + PAL_OFFSET(pal);
    st->to_colors = colors;
    st->clock = 0;
    st->clock_end = duration;
    st->clock_stop = duration + 1;

    proc->st = st;
    return st;
}

void EndPalFade(void)
{
    Proc_EndEach(ProcScr_PalFade);
}

void SetPalFadeStop(struct PalFadeSt * st, int val)
{
    st->clock_stop = val;
}

void PalFade_OnLoop(struct PalFadeProc * proc)
{
    int i;

    u16 const * from_colors = proc->st->from_colors;
    u16 const * to_colors = proc->st->to_colors;

    u16 * pal = proc->st->pal;

    if (proc->st->clock == proc->st->clock_stop || proc->st->clock > proc->st->clock_end)
    {
        Proc_End(proc);
        return;
    }

    for (i = 0; i < 0x10; ++i)
    {
        int red_a   = from_colors[i] & 0x001F;
        int green_a = from_colors[i] & 0x03E0;
        int blue_a  = from_colors[i] & 0x7C00;

        int red_b   = to_colors[i] & 0x001F;
        int green_b = to_colors[i] & 0x03E0;
        int blue_b  = to_colors[i] & 0x7C00;

        int red   = Interpolate(INTERPOLATE_LINEAR, red_a,   red_b,   proc->st->clock, proc->st->clock_end);
        int green = Interpolate(INTERPOLATE_LINEAR, green_a, green_b, proc->st->clock, proc->st->clock_end);
        int blue  = Interpolate(INTERPOLATE_LINEAR, blue_a,  blue_b,  proc->st->clock, proc->st->clock_end);

        pal[i] = (blue & 0x7C00) | (green & 0x03E0) | (red & 0x001F);
    }

    EnablePalSync();
    proc->st->clock++;
}

void SetBlackPal(int palid)
{
    CpuCopy16(Pal_AllBlack, gPal + PAL_OFFSET(palid), 0x20);
}

void SetWhitePal(int palid)
{
    CpuCopy16(Pal_AllWhite, gPal + PAL_OFFSET(palid), 0x20);
}

void SetAllBlackPals(void)
{
    int i;

    for (i = 0; i < 0x20; ++i)
        SetBlackPal(i);
}

void SetAllWhitePals(void)
{
    int i;

    for (i = 0; i < 0x20; ++i)
        SetBlackPal(i);
}

void FadeToBlack_OnInit(struct Proc * proc)
{
    gDispIo.win_ct.win0_enable_blend = 1;
    gDispIo.win_ct.win1_enable_blend = 1;
    gDispIo.win_ct.wobj_enable_blend = 1;
    gDispIo.win_ct.wout_enable_blend = 1;

    SetBlendConfig(3, 0, 0, 0);

    SetBlendTargetA(1, 1, 1, 1, 1);
    SetBlendBackdropA(1);

    proc->unk64 = 0x10;
    proc->unk66 = 0;
}

void FadeToCommon_OnLoop(struct Proc * proc)
{
    if (gDispIo.blend_y == 0x10)
    {
        Proc_End(proc);
        return;
    }

    proc->unk66 += proc->unk64;

    if (proc->unk66 >= 0x100)
        proc->unk66 = 0x100;

    gDispIo.blend_y = proc->unk66 >> 4;
}

void FadeFromBlack_OnInit(struct Proc * proc)
{
    gDispIo.win_ct.win0_enable_blend = 1;
    gDispIo.win_ct.win1_enable_blend = 1;
    gDispIo.win_ct.wobj_enable_blend = 1;
    gDispIo.win_ct.wout_enable_blend = 1;

    SetBlendConfig(3, 0, 0, 0x10);

    SetBlendTargetA(1, 1, 1, 1, 1);
    SetBlendTargetB(1, 1, 1, 1, 1);
    SetBlendBackdropA(1);

    proc->unk64 = 0x10;
    proc->unk66 = 0x100;
}

void FadeFromCommon_OnLoop(struct Proc * proc)
{
    if (gDispIo.blend_y == 0) {
        Proc_End(proc);
        return;
    }

    proc->unk66 -= proc->unk64;

    if (proc->unk66 <= 0)
        proc->unk66 = 0;

    gDispIo.blend_y = proc->unk66 >> 4;
}

void FadeToWhite_OnInit(struct Proc * proc)
{
    FadeToBlack_OnInit(proc);
    SetBlendConfig(2, 0, 0, 0);
}

void FadeFromWhite_OnInit(struct Proc * proc)
{
    FadeFromBlack_OnInit(proc);
    SetBlendConfig(2, 0, 0, 0x10);
}

bool FadeExists(void)
{
    if (!Proc_Find(ProcScr_FadeFromBlack) &&
        !Proc_Find(ProcScr_FadeToBlack) &&
        !Proc_Find(ProcScr_FadeFromWhite) &&
        !Proc_Find(ProcScr_FadeToWhite)) {
        return FALSE;
    }

    return TRUE;
}

void StartFadeToBlack(int q4_speed)
{
    struct Proc * proc = Proc_Start(ProcScr_FadeToBlack, PROC_TREE_3);
    proc->unk64 = q4_speed;
}

void StartFadeFromBlack(int q4_speed)
{
    struct Proc * proc = Proc_Start(ProcScr_FadeFromBlack, PROC_TREE_3);
    proc->unk64 = q4_speed;
}

void StartLockingFadeToBlack(int q4_speed, ProcPtr parent)
{
    struct Proc * proc = Proc_StartBlocking(ProcScr_FadeToBlack, parent);
    proc->unk64 = q4_speed;
}

void StartLockingFadeFromBlack(int q4_speed, ProcPtr parent)
{
    struct Proc * proc = Proc_StartBlocking(ProcScr_FadeFromBlack, parent);
    proc->unk64 = q4_speed;
}

void StartLockingFadeToWhite(int q4_speed, ProcPtr parent)
{
    struct Proc * proc = Proc_StartBlocking(ProcScr_FadeToWhite, parent);
    proc->unk64 = q4_speed;
}

void StartLockingFadeFromWhite(int q4_speed, ProcPtr parent)
{
    struct Proc * proc = Proc_StartBlocking(ProcScr_FadeFromWhite, parent);
    proc->unk64 = q4_speed;
}

void StartMidFadeToBlack(void)
{
    StartFadeToBlack(0x10);
}

void StartSlowFadeToBlack(void)
{
    StartFadeToBlack(0x04);
}

void StartFastFadeToBlack(void)
{
    StartFadeToBlack(0x40);
}

void StartMidFadeFromBlack(void)
{
    StartFadeFromBlack(0x10);
}

void StartSlowFadeFromBlack(void)
{
    StartFadeFromBlack(0x04);
}

void StartFastFadeFromBlack(void)
{
    StartFadeFromBlack(0x40);
}

void StartMidLockingFadeToBlack(ProcPtr parent)
{
    StartLockingFadeToBlack(0x10, parent);
}

void StartSlowLockingFadeToBlack(ProcPtr parent)
{
    StartLockingFadeToBlack(0x04, parent);
}

void StartFastLockingFadeToBlack(ProcPtr parent)
{
    StartLockingFadeToBlack(0x40, parent);
}

void StartMidLockingFadeFromBlack(ProcPtr parent)
{
    StartLockingFadeFromBlack(0x10, parent);
}

void StartSlowLockingFadeFromBlack(ProcPtr parent)
{
    StartLockingFadeFromBlack(0x04, parent);
}

void StartFastLockingFadeFromBlack(ProcPtr parent)
{
    StartLockingFadeFromBlack(0x40, parent);
}

void StartSlowLockingFadeToWhite(ProcPtr parent)
{
    StartLockingFadeToWhite(0x04, parent);
}

void StartSlowLockingFadeFromWhite(ProcPtr parent)
{
    StartLockingFadeFromWhite(0x04, parent);
}

void sub_08014060(ProcPtr parent)
{
    StartFadeCore(1, 0x04, parent, sub_080143E0);
}

void sub_08014078(ProcPtr parent)
{
    StartFadeCore(1, 0x08, parent, sub_080143E0);
}

void sub_08014090(ProcPtr parent)
{
    StartFadeCore(1, 0x10, parent, sub_080143E0);
}

void sub_080140A8(ProcPtr parent)
{
    StartFadeCore(1, 0x20, parent, sub_080143E0);
}

void sub_080140C0(ProcPtr parent)
{
    StartFadeCore(1, 0x40, parent, sub_080143E0);
}

void sub_080140D8(ProcPtr parent)
{
    StartFadeCore(0, 0x08, parent, NULL);
}

void sub_080140EC(ProcPtr parent)
{
    StartFadeCore(0, 0x10, parent, NULL);
}

void sub_08014100(ProcPtr parent)
{
    StartFadeCore(0, 0x20, parent, NULL);
}

void sub_08014114(ProcPtr parent)
{
    StartFadeCore(0, 0x40, parent, NULL);
}

void sub_08014128(ProcPtr parent)
{
    StartFadeCore(3, 0x04, parent, sub_080143E0);
}

void sub_08014140(ProcPtr parent)
{
    StartFadeCore(3, 0x08, parent, sub_080143E0);
}

void sub_08014158(ProcPtr parent)
{
    StartFadeCore(3, 0x10, parent, sub_080143E0);
}

void sub_08014170(ProcPtr parent)
{
    StartFadeCore(3, 0x20, parent, sub_080143E0);
}

void sub_08014188(ProcPtr parent)
{
    StartFadeCore(3, 0x40, parent, sub_080143E0);
}

void FadeInBlackSpeed04(ProcPtr parent)
{
    StartFadeCore(2, 0x04, parent, NULL);
}

void FadeInBlackSpeed08(ProcPtr parent)
{
    StartFadeCore(2, 0x08, parent, NULL);
}

void FadeInBlackSpeed08Unk(ProcPtr parent)
{
    StartFadeCore(2, 0x08, parent, NULL);
    sub_080143A0();
}

void FadeInBlackSpeed10(ProcPtr parent)
{
    StartFadeCore(2, 0x10, parent, NULL);
}

void FadeInBlackSpeed20(ProcPtr parent)
{
    StartFadeCore(2, 0x20, parent, NULL);
}

void FadeInBlackSpeed40(ProcPtr parent)
{
    StartFadeCore(2, 0x40, parent, NULL);
}

void sub_0801421C(ProcPtr parent)
{
    StartFadeCore(6, 0x10, parent, NULL);
}

void sub_08014230(ProcPtr parent)
{
    StartFadeCore(7, 0x10, parent, NULL);
}

void sub_08014244(ProcPtr parent)
{
    StartFadeCore(6, 0x08, parent, NULL);
}

void sub_08014258(ProcPtr parent)
{
    StartFadeCore(4, 0x04, parent, NULL);
}

void sub_0801426C(ProcPtr parent)
{
    StartFadeCore(4, 0x08, parent, NULL);
}

void sub_08014280(ProcPtr parent)
{
    StartFadeCore(7, 0x08, parent, sub_08014450);
}

void WaitForFade(ProcPtr proc)
{
    if (!FadeExists())
        Proc_Break(proc);
}

void sub_080142B4(ProcPtr parent, void * func)
{
    StartFadeCore(3, 0x40, parent, func);
}

struct FadeKindEnt {
    ProcPtr (* spawn_proc)(const struct ProcCmd * script, ProcPtr parent);
    void (* setup_color_fade)(s8 component_step);
    int unit;
};
GBA_SIZE_CHECK(struct FadeKindEnt, 0xC);

struct FadeKindEnt const gFadeKindTable[] =
{
    { Proc_Start,         ColorFadeSetupFromBlack,        +1 },
    { Proc_Start,         ColorFadeSetupFromColorToBlack, -1 },
    { Proc_StartBlocking, ColorFadeSetupFromBlack,        +1 },
    { Proc_StartBlocking, ColorFadeSetupFromColorToBlack, -1 },
    { Proc_Start,         ColorFadeSetupFromWhite,        -1 },
    { Proc_Start,         ColorFadeSetupFromColorToWhite, +1 },
    { Proc_StartBlocking, ColorFadeSetupFromWhite,        -1 },
    { Proc_StartBlocking, ColorFadeSetupFromColorToWhite, +1 },
};

void StartFadeCore(int kind, int speed, ProcPtr parent, void * end_callback)
{
    ProcPtr (* spawn_proc)(struct ProcCmd const * scr, ProcPtr parent);
    void (* setup_color_fade)(s8 component_step);

    struct FadeCoreProc * proc;
    int component_step;

    spawn_proc = gFadeKindTable[kind].spawn_proc;
    proc = spawn_proc(ProcScr_FadeCore, parent);

    proc->speed = speed;
    proc->on_end = end_callback;

    component_step = proc->speed >> 4;

    if (component_step == 0)
        component_step = 1;

    setup_color_fade = (void *) gFadeKindTable[kind].setup_color_fade;
    setup_color_fade(component_step * gFadeKindTable[kind].unit);
}

void FadeCoreEndEach(void)
{
    Proc_EndEach(ProcScr_FadeCore);
}

void FadeCore_Init(struct FadeCoreProc * proc)
{
    proc->looper = 0;
    proc->counter = 0;
    proc->on_end = NULL;
}

void FadeCore_Loop(struct FadeCoreProc * proc)
{
    if (!FadeCore_Tick(proc)) {
        if (proc->on_end)
            proc->on_end();

        Proc_Break(proc);
    }
}

bool FadeCore_Tick(struct FadeCoreProc * proc)
{
    proc->looper += proc->speed;
    proc->counter += proc->speed;

    if (proc->looper < 0x10)
    {
        if (proc->counter != proc->speed)
            return TRUE;
    }
    else
    {
        proc->looper = proc->looper - 0x10;
    }

    ColorFadeTick();
    SetBackdropColor(0);

    if (proc->counter >= 0x200)
        return FALSE;

    return TRUE;
}

void sub_080143A0(void)
{
    sub_08002338(0x10, 0x10, 0);
    sub_080143C4();
}

void sub_080143B4(int a, int b)
{
    sub_08002338(a, b, 0);
    sub_080143C4();
}

void sub_080143C4(void)
{
    struct FadeCoreProc * proc = Proc_Find(ProcScr_FadeCore);

    if (proc)
        proc->on_end = NULL;
}

void sub_080143E0(void)
{
    SetBlendDarken(0x10);
    SetBlendTargetA(1, 1, 1, 1, 1);
    SetBlendBackdropA(1);
    SetBackdropColor(0);
    SetDispEnable(0, 0, 0, 0, 0);
}

void sub_08014450(void)
{
    SetBlendBrighten(0x10);

    SetBlendTargetA(1, 1, 1, 1, 1);
    SetBlendBackdropA(1);
}

void StartTemporaryLock(ProcPtr proc, int duration)
{
    struct Proc * gproc;

    gproc = Proc_StartBlocking(ProcScr_TemporaryLock, proc);
    gproc->unk58 = duration;
}

void TemporaryLock_OnLoop(struct Proc * proc)
{
    if (proc->unk58 == 0)
    {
        Proc_Break(proc);
        return;
    }
    proc->unk58--;
}

int NumberToStringSJis(int number, char * buf)
{
    int numOff, numStart;

    numOff = 0;

    if (number == 0)
    {
        *buf++ = SJisZero[0];
        *buf++ = SJisZero[1];
        *buf++ = '\0';

        return 1;
    }

    if (number < 0)
    {
        buf[0] = SJisDash[0];
        buf[1] = SJisDash[1];

        number = -number;
        numOff = 2;
    }

    if (number > 99999)
        numOff += 10;
    else if (number > 9999)
        numOff += 8;
    else if (number > 999)
        numOff += 6;
    else if (number > 99)
        numOff += 4;
    else if (number > 9)
        numOff += 2;

    numStart = numOff;

    while (number > 0)
    {
        int rem = DivRem(number, 10);

        buf[numOff]   = SJisZero[0];
        buf[numOff+1] = SJisZero[1] + rem;

        number = Div(number, 10);
        numOff -= 2;
    }

    *(buf + numStart + 2) = '\0';
    return (numStart >> 1) + 1;
}

int NumberToStringAscii(int number, char * buf)
{
    int numOff, numStart;

    numOff = 0;

    if (number == 0)
    {
        buf[0] = AsciiZero;
        buf[1] = '\0';

        return 1;
    }

    if (number < 0)
    {
        *buf++ = AsciiDash;
        number = -number;
    }

    if (number > 99999)
        numOff = 5;
    else if (number > 9999)
        numOff = 4;
    else if (number > 999)
        numOff = 3;
    else if (number > 99)
        numOff = 2;
    else if (number > 9)
        numOff = 1;

    numStart = numOff;

    while (number > 0)
    {
        int rem = DivRem(number, 10);

        buf[numOff] = AsciiZero + rem;

        number = Div(number, 10);
        numOff -= 1;
    }

    *(buf + numStart + 1) = '\0';
    return numStart + 1;
}

struct Text * PutStringCentered(u16 * tm, int color, int width, char const * str)
{
    struct Text * const text = &sPutStringText;

    InitText(text, width);

    Text_SetCursor(text, (width * 8 - GetStringTextLen(str) - 1) / 2);
    Text_SetColor(text, color);
    Text_DrawString(text, str);

    PutText(text, tm);

    EnableBgSync(BG0_SYNC_BIT);

    return text;
}

struct Text * PutString(u16 * tm, int color, char const * str)
{
    struct Text * const text = &sPutStringText;

    InitText(text, (GetStringTextLen(str) + 7) / 8);

    Text_SetColor(text, color);
    Text_DrawString(text, str);

    PutText(text, tm);

    return text;
}

void DeleteAllPaletteAnimator(void)
{
    Proc_EndEach(ProcScr_PaletteAnimator);
}

ProcPtr StartPaletteAnimatorExt(u16 const * colors, int pal_offset, int pal_size, int interval, ProcPtr parent)
{
    struct ProcPaletteAnimator * proc;

    proc = Proc_Start(ProcScr_PaletteAnimator, parent);

    proc->colors = colors;
    proc->palOffset = pal_offset;
    proc->colorCount = pal_size / 2;
    proc->clock = interval;
    proc->clock_end = interval;
    proc->counter = 0;
    proc->reverseOrder = 0;

    return proc;
}

void StartPaletteAnimatorReverse(u16 const * colors, int pal_offset, int pal_size, int interval, ProcPtr parent)
{
    struct ProcPaletteAnimator * proc;
    proc = StartPaletteAnimatorExt(colors, pal_offset, pal_size, interval, parent);
    proc->reverseOrder = FALSE;
}

void StartPaletteAnimatorNormal(u16 const * colors, int pal_offset, int pal_size, int interval, ProcPtr parent)
{
    struct ProcPaletteAnimator * proc;
    proc = StartPaletteAnimatorExt(colors, pal_offset, pal_size, interval, parent);
    proc->reverseOrder = TRUE;
}

void PaletteAnimator_Loop(struct ProcPaletteAnimator * proc)
{
    int colornum;

    proc->clock++;

    if (proc->clock < proc->clock_end)
        return;

    proc->clock = 0;

    colornum = DivRem(proc->counter, proc->colorCount);

    if (proc->reverseOrder)
        colornum = proc->colorCount - colornum - 1;

    ApplyPaletteExt(proc->colors + colornum, proc->palOffset, 2 * proc->colorCount - 2 * colornum);

    if (colornum > 0)
        ApplyPaletteExt(proc->colors, proc->palOffset + 2 * proc->colorCount - 2 * colornum, 2 * colornum);

    proc->counter++;
}

void sub_080147BC(u16 * tm, int x, int y, u16 tileref, int width, int height)
{
    int ix, iy;

    for (iy = y; iy < y + height; ++iy)
    {
        for (ix = x; ix < x + width; ++ix, ++tileref)
        {
            if ((ix >= 0 && ix < 0x20) && (iy >= 0 && iy < 0x20))
                tm[TM_OFFSET(ix, iy)] = tileref;
        }
    }
}

void sub_08014824(u16 * tm, int x, int y, u16 tileref, int width, int height, u16 const * src, bool hflip)
{
    int ix, iy;

    u16 const * src_1 = src;

    if (hflip)
    {
        for (iy = 0; iy < height; ++iy)
        {
            for (ix = 0; ix < width; ++ix)
            {
                if ((x + ix >= 0 && x + ix < 0x20) && (y + iy >= 0 && y + iy < 0x20))
                {
                    *(tm + (x + ix) + ((y + iy) * 0x20)) = (*(src_1 + (width - 1 - ix) + (iy * 0x20)) + tileref) ^ TILE_HFLIP;
                }
            }
        }
    }
    else
    {
        for (iy = 0; iy < height; ++iy)
        {
            for (ix = 0; ix < width; ++ix)
            {
                if ((x + ix >= 0 && x + ix < 0x20) && (y + iy >= 0 && y + iy < 0x20))
                {
                    *(tm + (x + ix) + ((y + iy) * 0x20)) = *(src_1 + ix + (iy * 0x20)) + tileref;
                }
            }
        }
    }
}

void sub_080148FC(u16 * tm, int x, int y, u16 tileref, int width, int height, u16 const * src, int arg_7)
{
    int ix, iy;

    u16 const * src_1 = src;

    int r4 = Div(0x20, width);
    int r6 = Div(arg_7, r4);
    int r0 = DivRem(arg_7, r4);

    src_1 = src_1 + (width * r0) + (r6 * height) * 32;

    for (iy = 0; iy < height; ++iy)
    {
        for (ix = 0; ix < width; ++ix)
        {
            if ((x + ix >= 0 && x + ix < 0x20) && (y + iy >= 0 && y + iy < 0x20))
            {
                *(tm + (x + ix) + ((y + iy) * 32)) = *(src_1 + ix + (iy * 32)) + tileref;
            }
        }
    }
}

void sub_080149A8(u16 * tm, int x, int y, u16 tileref, int width, int height, u8 const * src, int arg_7)
{
    int ix, iy;
    int r0, r5;

    u16 const * src_1 = (u16 const *) src;

    u16 r9 = *src + 1;

    src_1 = src_1 + 1;

    r5 = Div(r9, width);
    r0 = Div(arg_7, r5);

    src_1 = src_1 + width * (arg_7 - r5 * r0) + ((r0 * height) * 0x20);

    for (iy = 0; iy < height; ++iy)
    {
        for (ix = 0; ix < width; ++ix)
        {
            if ((x + ix >= 0 && x + ix < 0x20) && (y + iy >= 0 && y + iy < 0x20))
            {
                *(tm + (x + ix) + ((y + iy) * 32)) = *(src_1 + ix + (r9 * (height - iy - 1))) + tileref;
            }
        }
    }
}

void sub_08014A68(u16 * tm, int x, int y, u32 const * arg_3, u16 tileref)
{
    s16 iy, ix;

    u16 const * r2 = ((u16 const *) arg_3) + 1;

    s16 r9 = 0xFF & (((u32 const *) arg_3)[0] >> 0);
    s16 r3 = 0xFF & (((u32 const *) arg_3)[0] >> 8);

    for (iy = r3; iy >= 0; --iy)
    {
        if ((y + iy >= 0 && y + iy < 0x20))
        {
            u16 * r1 = x + (y + iy) * 32 + tm;

            for (ix = r9; ix >= 0; --ix, r2++, r1++)
            {
                if (x + ix >= 0 && x + ix < 0x20)
                    *(r1) = *r2 + tileref;
            }
        }
    }
}

void CallDelayed_OnLoop(struct CallDelayedProc * proc)
{
    proc->clock--;

    if (proc->clock == -1)
    {
        void (* func)(void) = (void (*)(void)) proc->func;

        func();
        Proc_Break(proc);
    }
}

void CallDelayedArg_OnLoop(struct CallDelayedProc * proc)
{
    proc->clock--;

    if (proc->clock == -1)
    {
        void (* func)(intptr_t) = (void (*)(intptr_t)) proc->func;

        func(proc->arg);
        Proc_Break(proc);
    }
}

void CallDelayed(void (* func)(void), int delay)
{
    struct CallDelayedProc * proc = Proc_Start(ProcScr_CallDelayed, PROC_TREE_3);

    proc->func = func;
    proc->clock = delay;
}

void CallDelayedArg(void (* func)(intptr_t), intptr_t arg, int delay)
{
    struct CallDelayedProc * proc = Proc_Start(ProcScr_CallDelayedArg, PROC_TREE_3);

    proc->func = func;
    proc->arg = arg;
    proc->clock = delay;
}

void sub_08014B70(u8 * out, int size)
{
    while (size > 0)
    {
        *out++ = 0;
        size--;
    }
}

void sub_08014B84(u8 * out, int size, int value)
{
    while (size > 0)
    {
        *out++ = value;
        size--;
    }
}

void sub_08014B94(u16 * out, int size, int value)
{
    while (size > 0)
    {
        *out++ = value;
        size--;
    }
}

void StartPartialGameLock(ProcPtr proc)
{
    struct Proc * gproc;

    gproc = Proc_StartBlocking(ProcScr_PartialGameLock, proc);
    gproc->unk64 = GetGameLock();
}

void PartialGameLock_OnLoop(struct Proc * proc)
{
    if (GetGameLock() == proc->unk64)
        Proc_Break(proc);
}

void VramCopy(u8 const * src, u8 * dst, int size)
{
    if ((size & 0x1F) != 0)
        CpuCopy16(src, dst, size);
    else
        CpuFastCopy(src, dst, size);
}

void VramCopyInRaw(u8 const * src, u8 * dst, int width, int height)
{
    int i, line_size = width * CHR_SIZE;

    for (i = 0; i < height; ++i)
    {
        VramCopy(src, dst, line_size);

        src += line_size;
        dst += 0x20 * CHR_SIZE;
    }
}

void PutTmLinear(u16 const * src, u16 * dst, int size, u16 tileref)
{
    while (size > 0)
    {
        *dst++ = *src++ + tileref;
        size -= 2;
    }
}

u16 * GetTmOffsetById(int bgid, int x, int y)
{
    switch (bgid) {
    case 0:
        return gBg0Tm + TM_OFFSET(x, y);

    case 1:
        return gBg1Tm + TM_OFFSET(x, y);

    case 2:
        return gBg2Tm + TM_OFFSET(x, y);

    case 3:
        return gBg3Tm + TM_OFFSET(x, y);

    default:
        return NULL;
    }
}

void sub_08014CD0(void)
{
    if (gDispIo.bg0_ct.color_depth == 0)
        sub_08014B94((u16 *) (VRAM + GetBgChrOffset(0)), 0x10, 0);

    if (gDispIo.bg1_ct.color_depth == 0)
        sub_08014B94((u16 *) (VRAM + GetBgChrOffset(1)), 0x10, 0);

    if (gDispIo.bg2_ct.color_depth == 0)
        sub_08014B94((u16 *) (VRAM + GetBgChrOffset(2)), 0x10, 0);

    if (gDispIo.bg3_ct.color_depth == 0)
        sub_08014B94((u16 *) (VRAM + GetBgChrOffset(3)), 0x10, 0);
}

int Screen2Pan(int x)
{
    if (x < 0)
        return -0x60;

    if (x >= DISPLAY_WIDTH)
        return +0x5F;

    return Div(0xC0 * x, DISPLAY_WIDTH) - 0x60;
}

void PlaySeSpacial(int song, int x)
{
    struct MusicPlayerInfo * info;

    PlaySoundEffect(song);

    info = gMPlayTable[gSongTable[song].ms].info;

    m4aMPlayImmInit(info);
    MPlayPanpotControl(info, 0xFFFF, Screen2Pan(x));
}

void PlaySeDelayed(int song, int delay)
{
    CallDelayedArg(PlaySeFunc, song, delay);
}

void PlaySeFunc(intptr_t song)
{
    PlaySoundEffect(song);
}

void _StartBgm(short song)
{
    StartBgm(song, NULL);
}

void _FadeBgmOut(short speed)
{
    FadeBgmOut(speed);
}

void sub_08014E38(int palid)
{
    int i;

    u16 * pal = gPal + palid * 0x10;

    for (i = 0; i < 0x10; ++i)
    {
        int red   = ((pal[i] & (0x1F))       / 4) * 3;
        int green = ((pal[i] & (0x1F << 5))  / 4) * 3;
        int blue  = ((pal[i] & (0x1F << 10)) / 4) * 3;

        pal[i] = (red & (0x1F)) | (green & (0x1F << 5)) | (blue & (0x1F << 10));
    }
}

void MemCpy(void const * _src, void * _dst, int size)
{
    u8 const * src = _src;
    u8 * dst = _dst;
    while (size != 0)
    {
        *dst = *src;

        dst++;
        src++;

        size--;
    }
}

void PutDrawTextCentered(struct Text * text, int x, int y, char const * str, int width)
{
    int off;

    off = GetStringTextLen(str);
    off = (width * 8 - off) >> 1;

    Text_SetCursor(text, off);
    Text_DrawString(text, str);

    PutText(text, gBg0Tm + TM_OFFSET(x, y));
}
