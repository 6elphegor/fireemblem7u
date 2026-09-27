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
ASM_FUNC("asm/nonmatching/code_080820CC.s");

ASM_FUNC("asm/nonmatching/code_080820E8.s");

ASM_FUNC("asm/nonmatching/code_08082168.s");

ASM_FUNC("asm/nonmatching/code_08082224.s");

ASM_FUNC("asm/nonmatching/code_080822A4.s");


void PutChapterTitleGfx(int chr, u32 titleId);
ASM_FUNC("asm/nonmatching/code_08082308.s");


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

int GetChapterTitle(struct PlaySt * playst);
ASM_FUNC("asm/nonmatching/code_080824A4.s");

