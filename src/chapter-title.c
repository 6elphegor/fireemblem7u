#include "gbafe.h"

EWRAM_DATA struct ChapTitleSt gChapTitleSt = {};

void PutChapterTitlePalette(int config, int pal_bank)
{
    const u16 * pal;

    if (config & 8)
    {
        ApplyPalette(Pal_08402230, pal_bank);
        return;
    }

    pal = (config & 1) ? Pal_083FE2F8 : Pal_083FE438;

    if (config & 0x10)
        pal += 0x20;

    if (config & 0x20)
        pal += 0x40;

    if (config & 0x40)
        pal += 0x60;

    if (config & 0x80)
        pal += 0x80;

    if (config & 0x2)
        pal += 0x10;

    ApplyPalette(pal, pal_bank);
}
int GetChapterTitleGlyphOffset(int glyph)
{
    int sum = 0;
    const struct ChapTitleGlyph * info = gChapTitleGlyphs;

    for (; glyph != 0; glyph--)
    {
        sum += info->offset;
        info++;
    }

    return sum;
}

int GetChapterTitleGlyph(const char * str)
{
    char buf[0x20];

    if ((u8)(*str - 'A') <= 'Z' - 'A')
        return *str - 'A';

    if ((u8)(*str - 'a') <= 'z' - 'a')
        return *str - 'a' + 26;

    if ((u8)(*str - '0') <= 9)
        return *str - '0' + 52;

    if (*str == '-')
        return 0x3E;

    if (*str == '\'')
        return 0x3F;

    if (*str == ':')
        return 0x40;

    if (*str == '.')
        return 0x41;

    if (*str == ' ')
        return 0x80;

    sprintf(buf, "none chapter message = %c", *str);
    return -1;
}

void DrawChapterTitleGlyph(u8 * src, u8 * dst, int glyph, int x)
{
    int ix, iy;
    int off = GetChapterTitleGlyphOffset(glyph);
    int src_x = off & 0xFF;
    int src_y = (off >> 8) * 16;
    const struct ChapTitleGlyph * info = &gChapTitleGlyphs[glyph];

    for (iy = info->y_start; iy < info->y_end; iy++)
    {
        for (ix = 0; ix < info->width; ix++)
        {
            int sx = src_x + ix;
            int dx = x + ix;
            u32 pixel = *(u32 *)(src + ((sx >> 3) << 5) + (((src_y + iy) >> 3) << 10) + (((src_y + iy) & 7) << 2)) & (0xF << ((sx & 7) * 4));

            if (pixel != 0)
                *(u32 *)(dst + ((dx >> 3) << 5) + ((iy >> 3) << 10) + ((iy & 7) << 2)) |= (pixel >> ((sx & 7) * 4)) << ((dx & 7) * 4);
        }
    }
}

int GetChapterTitleTextX(const char * str)
{
    u8 b = 0, a = 0;

    for (; *str != 0 && *str != 0x1F; str++)
    {
        int glyph = GetChapterTitleGlyph(str);
        const struct ChapTitleGlyph * info;

        if (glyph == 0x80)
        {
            if (a > b)
            {
                a = a + 3;
                b = a;
            }
            else
            {
                b = b + 3;
                a = b;
            }
            continue;
        }

        info = &gChapTitleGlyphs[glyph];

        if (a - info->kern_a > b - info->kern_b)
            b = a;
        else
            a = b;

        a += info->advance_a - 1;
        b += info->advance_b - 1;
    }

    return (0xC0 - ((a + b) >> 1)) >> 1;
}

const char * GetChapterTitleStr(int titleId)
{
    const char * str;

    if (titleId < 0)
        titleId = 0x4A;

    switch (titleId)
    {
    case 0x4A:
        str = DecodeMsg(0x5D2);
        break;

    case 0x4B:
        str = DecodeMsg(0x5D3);
        break;

    case 0x4C:
        str = DecodeMsg(0x5D4);
        break;

    default:
        str = DecodeMsg(GetChapterInfo(titleId & 0x7F)->msg_chapter_title[(titleId >> 7) & 1]);
        break;
    }

    return str;
}

void PutChapterTitleGfx(int chr, u32 titleId)
{
    const char * str = GetChapterTitleStr(titleId);
    u8 * dst = (u8 *)VRAM + chr * TILE_SIZE_4BPP;
    u8 b = GetChapterTitleTextX(str);
    u8 a = b;

    gChapTitleSt.chr_str = OAM2_CHR(chr);
    CpuFastFill(0, dst, 0x800);
    Decompress(Img_ChapterTitleFont, gBuf);

    for (; *str != 0 && *str != 0x1F; str++)
    {
        int glyph = GetChapterTitleGlyph(str);
        const struct ChapTitleGlyph * info;

        if (glyph == 0x80)
        {
            if (a > b)
                b = a + 3;
            else
                b = b + 3;

            a = b;
            continue;
        }

        info = &gChapTitleGlyphs[glyph];

        if (a - info->kern_a > b - info->kern_b)
            b = a;
        else
            a = b;

        DrawChapterTitleGlyph(gBuf, dst, glyph, a);

        a += info->advance_a - 1;
        b += info->advance_b - 1;
    }
}


void PutChapterTitleBG(int chr)
{
    gChapTitleSt.chr_bg = OAM2_CHR(chr);
    Decompress(Img_ChapterTitleBG, (void *)BG_VRAM + chr * TILE_SIZE_4BPP);
}

void PutChapterTitleUnkBG(int chr)
{
    gChapTitleSt.chr_bg = OAM2_CHR(chr);
    Decompress(Img_ChapterTitle_08401C2C, (void *)BG_VRAM + chr * TILE_SIZE_4BPP);
}

void PutChapterTitleNameTsa(u16 * tm, int pal)
{
    int i;
    int tile = TILEREF(gChapTitleSt.chr_str, pal);

    for (i = 0; i < 0x40; i++)
        *tm++ = tile++;
}

void PutChapterTitleBgTsa(u16 * tm, int pal)
{
    int i;
    int tile = TILEREF(gChapTitleSt.chr_bg, pal);

    for (i = 0; i < 0x80; i++)
        *tm++ = tile++;
}

void PutChapterTitleBgUnkTsa(u16 * tm, int pal)
{
    TmApplyTsa(tm, Tsa_ChapterTitle_0840213C, TILEREF(gChapTitleSt.chr_bg, pal));
}

int GetChapterTitle(struct PlaySt * playst)
{
    if (playst == NULL)
        return 0x4A;

    if (playst->chapterStateBits & PLAY_FLAG_COMPLETE)
        return 0x4B;

    if (playst->chapterModeIndex == 3)
        return playst->chapterIndex | 0x80;

    return playst->chapterIndex;
}


void CopyChrPixel(u8 * src, u8 * dst, int srcX, int srcY, int dstX, int dstY)
{
    u32 * srcLine = (u32 *) (src + (srcX >> 3) * 0x20 + (srcY >> 3) * 0x400 + (srcY & 7) * 4);
    int shift = (srcX & 7) * 4;
    u32 pixel = *srcLine & (0xF << shift);

    if (pixel != 0)
    {
        u32 * dstLine = (u32 *) (dst + (dstX >> 3) * 0x20 + (dstY >> 3) * 0x400 + (dstY & 7) * 4);
        *dstLine |= (pixel >> shift) << ((dstX & 7) * 4);
    }
}
