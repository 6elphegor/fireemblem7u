#include "gbafe.h"

// FE7 epilogue (character epithets over CG backgrounds; no FE8 counterpart)

struct EpilogueFontSt {
    /* 00 */ struct Font font;
    /* 18 */ struct Text texts[10];
};

struct EpilogueCgProc {
    /* 00 */ PROC_HEADER;
    /* 2A */ STRUCT_PAD(0x2A, 0x3E);
    /* 3E */ s16 part;
    /* 40 */ s16 cg;
};

extern struct EpilogueFontSt gEpilogueFontSt;

struct CGDataEnt {
    /* 00 */ u8 isSplit;
    /* 04 */ void const * img;
    /* 08 */ u8 const * tsa;
    /* 0C */ u16 const * pal;
};

struct CGDataEnt const * GetCG(int idx);
int CountDigits(int number);
void sub_080010F4(u16 const * src, int a, int b, int c);

ASM_FUNC("asm/nonmatching/code_080B6C14.s");
ASM_FUNC("asm/nonmatching/code_080B6C8C.s");
int CountEpilogueLines(char const * str)
{
    int lines = 0;

    for (;;)
    {
        if (*str == 0)
            return lines + 3;

        if (*str == 1)
        {
            str++;
            lines++;
            continue;
        }

        str++;
    }
}

ASM_FUNC("asm/nonmatching/code_080B6D64.s");
ASM_FUNC("asm/nonmatching/code_080B6DD4.s");
void InitEpilogueTexts(void)
{
    int i;

    InitSpriteTextFont(&gEpilogueFontSt.font, (u8 *) (VRAM + 0x11000), 10);
    SetTextFont(&gEpilogueFontSt.font);

    for (i = 0; i < 10; i++)
    {
        InitSpriteText(&gEpilogueFontSt.texts[i]);
        SpriteText_DrawBackgroundExt(&gEpilogueFontSt.texts[i], 0);
    }

    SetTextFont(NULL);
}

void ClearEpilogueTexts(void)
{
    int i;

    SetTextFont(&gEpilogueFontSt.font);

    for (i = 0; i < 10; i++)
        SpriteText_DrawBackgroundExt(&gEpilogueFontSt.texts[i], 0);

    SetTextFont(NULL);
}

void ClearEpilogueText(int idx)
{
    SetTextFont(&gEpilogueFontSt.font);
    SpriteText_DrawBackgroundExt(&gEpilogueFontSt.texts[idx], 0);
    SetTextFont(NULL);
}

void EpilogueText_Center(struct Text * text, char const * str)
{
    int width = 0;
    int w = 0;

    for (;;)
    {
        switch (*str)
        {
        case 0:
        case 1:
            Text_SetCursor(text, (0xE0 - width) / 2);
            return;

        case 4:
        case 5:
            str++;
            continue;

        default:
            str = GetCharTextLen(str, &w);
            width += w;
            continue;
        }
    }
}

void EpilogueText_DrawStats(struct Text * text, int battles, int wins, int losses)
{
    char buf[0x10];

    Text_SetCursor(text, 0x40);
    Text_SetColor(text, 3);
    DecodeMsgInBuffer(0x12AB, buf);
    Text_DrawString(text, buf);
    Text_SetColor(text, 2);
    Text_SetCursor(text, CountDigits(battles) * 8 + 0x40);
    Text_DrawNumber(text, battles);

    Text_SetCursor(text, 0x68);
    Text_SetColor(text, 3);
    DecodeMsgInBuffer(0x12AC, buf);
    Text_DrawString(text, buf);
    Text_SetColor(text, 2);
    Text_SetCursor(text, CountDigits(wins) * 8 + 0x68);
    Text_DrawNumber(text, wins);

    Text_SetCursor(text, 0x90);
    Text_SetColor(text, 3);
    DecodeMsgInBuffer(0x12AD, buf);
    Text_DrawString(text, buf);
    Text_SetColor(text, 2);
    Text_SetCursor(text, CountDigits(losses) * 8 + 0x90);
    Text_DrawNumber(text, losses);
}

ASM_FUNC("asm/nonmatching/code_080B6FB8.s");
ASM_FUNC("asm/nonmatching/code_080B70B4.s");
void DarkenPalettesHalf(void)
{
    int i;
    u16 * pal = gPal;

    for (i = 0; i < 0x80; i++)
    {
        *pal = (((*pal & 0x1F) >> 1) & 0x1F) + (((*pal & 0x3E0) >> 1) & 0x3E0) + (((*pal & 0x7C00) >> 1) & 0x7C00);
        pal++;
    }

    EnablePalSync();
}

void EpilogueCopyPalettes(u16 const * src, int count)
{
    int i;
    u16 * dst = gPal;

    for (i = 0; i < count * 0x10; i++)
        *dst++ = *src++;

    EnablePalSync();
}

void EpilogueCg_Init(struct EpilogueCgProc * proc)
{
    struct CGDataEnt const * cg = GetCG(proc->cg);

    SetBgOffset(3, 0, 0);
    sub_080010F4(cg->pal, 0, 0x100, 0x20);
    TmApplyTsa_thm(gBg3Tm, cg->tsa, 0);
    EnableBgSync(BG3_SYNC_BIT);

    proc->part = 0;
}

void EpilogueCg_Loop(struct EpilogueCgProc * proc)
{
    struct CGDataEnt const * cg = GetCG(proc->cg);

    Decompress(((u8 const * const *) cg->img)[proc->part], (void *) (VRAM + 0x8000 + proc->part * 0x800));

    if (++proc->part == 10)
        Proc_Break(proc);
}

ASM_FUNC("asm/nonmatching/code_080B72A8.s");
ASM_FUNC("asm/nonmatching/code_080B72D8.s");
ASM_FUNC("asm/nonmatching/code_080B7334.s");
ASM_FUNC("asm/nonmatching/code_080B7380.s");
ASM_FUNC("asm/nonmatching/code_080B73EC.s");
ASM_FUNC("asm/nonmatching/code_080B7408.s");
ASM_FUNC("asm/nonmatching/code_080B74B4.s");
ASM_FUNC("asm/nonmatching/code_080B7530.s");
ASM_FUNC("asm/nonmatching/code_080B75D8.s");
ASM_FUNC("asm/nonmatching/code_080B766C.s");
ASM_FUNC("asm/nonmatching/code_080B76B8.s");
ASM_FUNC("asm/nonmatching/code_080B76D8.s");
ASM_FUNC("asm/nonmatching/code_080B76F8.s");
ASM_FUNC("asm/nonmatching/code_080B7714.s");
ASM_FUNC("asm/nonmatching/code_080B77DC.s");
ASM_FUNC("asm/nonmatching/code_080B7810.s");
ASM_FUNC("asm/nonmatching/code_080B78DC.s");
ASM_FUNC("asm/nonmatching/code_080B7A0C.s");
ASM_FUNC("asm/nonmatching/code_080B7A24.s");
ASM_FUNC("asm/nonmatching/code_080B7B18.s");
ASM_FUNC("asm/nonmatching/code_080B7B74.s");
ASM_FUNC("asm/nonmatching/code_080B7BC8.s");
ASM_FUNC("asm/nonmatching/code_080B7BDC.s");
ASM_FUNC("asm/nonmatching/code_080B7C28.s");
ASM_FUNC("asm/nonmatching/code_080B7C3C.s");
ASM_FUNC("asm/nonmatching/code_080B7C54.s");
ASM_FUNC("asm/nonmatching/code_080B7C5C.s");
ASM_FUNC("asm/nonmatching/code_080B7CD0.s");
ASM_FUNC("asm/nonmatching/code_080B7D0C.s");
ASM_FUNC("asm/nonmatching/code_080B7D88.s");
ASM_FUNC("asm/nonmatching/code_080B7DAC.s");
ASM_FUNC("asm/nonmatching/code_080B7E20.s");
ASM_FUNC("asm/nonmatching/code_080B7E3C.s");
