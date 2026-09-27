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

struct EpilogueProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ char const * str;
    /* 30 */ struct Text * text;
    /* 34 */ int const * msgs;
    /* 38 */ void const * const * data;
    /* 3C */ u16 speed;
    /* 3E */ s16 part;
    /* 40 */ s16 cg;
    /* 42 */ u16 delay;
    /* 44 */ s16 timer;
    /* 46 */ s16 unk_46;
    /* 48 */ STRUCT_PAD(0x48, 0x4A);
    /* 4A */ s16 lastRow;
    /* 4C */ s16 unk_4c;
    /* 4E */ s16 unk_4e;
    /* 50 */ s8 skippable;
    /* 51 */ s8 unk_51;
};

extern struct ProcCmd CONST_DATA ProcScr_EpilogueCg[];
extern struct ProcCmd CONST_DATA ProcScr_EpilogueScroll[];
extern struct ProcCmd CONST_DATA ProcScr_EpilogueText[];
extern u16 Pal_EpilogueText[];
extern void const * const gEpilogueEndScroll[];
extern int const gEpilogueEndMsgs[];

void ClearEpilogueTexts(void);
void EpilogueText_Center(struct Text * text, char const * str);
void sub_080B6C14(void);
void sub_080B6C8C(void);
void sub_080B6D64(void);
void sub_080B6DD4(void);
void sub_080B7408(struct EpilogueProc * proc);
void sub_080B74B4(ProcPtr proc);

struct CGDataEnt {
    /* 00 */ u8 isSplit;
    /* 04 */ void const * img;
    /* 08 */ u8 const * tsa;
    /* 0C */ u16 const * pal;
};

struct CGDataEnt const * GetCG(int idx);
int CountDigits(int number);
void sub_080010F4(u16 const * src, int a, int b, int c);
void EpiloguePutBgRow(int idx, void const * img, u8 const * tsa);
void InitBoxDialogue(void * vram_dst, int pal);
void StartBoxDialogueSimple(int x, int y, int msg, ProcPtr parent);

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
void sub_080B6DD4(void)
{
    sub_080B6C8C();
    sub_080B6D64();
}

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

void EpilogueScroll_Init(struct EpilogueProc * proc)
{
    int i;

    proc->timer = 0;
    proc->lastRow = -1;

    sub_080010F4(*proc->data, 0, 0x100, 0x20);
    proc->data++;

    for (i = 0; i < 10; i++)
    {
        EpiloguePutBgRow(i, proc->data[0], proc->data[1]);
        proc->data += 2;
    }
}

ASM_FUNC("asm/nonmatching/code_080B7380.s");

ProcPtr StartEpilogueScroll(void const * const * data, int speed, ProcPtr parent)
{
    struct EpilogueProc * proc = Proc_Start(ProcScr_EpilogueScroll, parent);

    proc->data = data;
    proc->speed = speed;

    return proc;
}

void sub_080B7408(struct EpilogueProc * proc)
{
    int i, j;
    int m = 0xF0;

    for (i = 0; i < 10; i++)
    {
        int y = i * 24 - proc->unk_46 + 0xA0;

        if (y < 0)
        {
            int r = (-y) % m;

            if (r < 0x18)
                y = 0x100 - r;
            else
                y = m - r;
        }

        y &= 0xFF;

        if (y > 0x9F)
        {
            if (y <= 0xE8)
                continue;
        }

        for (j = 0; j < 7; j++)
            PutSpriteExt(4, 8 + j * 0x20, y + 0x400, Sprite_32x16,
                (((u32) (i * 0x800 + 0x1000) & 0x1FFFF) >> 5) + 0xA400 + j * 4);
    }
}

ASM_FUNC("asm/nonmatching/code_080B74B4.s");
void EpilogueText_Init(struct EpilogueProc * proc)
{
    ClearEpilogueTexts();

    ApplyPalette(Pal_EpilogueText, 0x1A);

    proc->timer = proc->delay;

    proc->str = DecodeMsg(*proc->msgs);
    proc->str = MsgExpand();

    proc->text = &gEpilogueFontSt.texts[0];

    SetTextFontGlyphs(1);
    EpilogueText_Center(proc->text, proc->str);

    SetBlendConfig(0, 0x10, 0, 0);
    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(1, 1, 1, 1, 1);
    gDispIo.blend_ct.target2_enable_bd = 1;

    StartParallelWorker(sub_080B74B4, proc);
}

ASM_FUNC("asm/nonmatching/code_080B75D8.s");

ASM_FUNC("asm/nonmatching/code_080B766C.s");

void EpilogueText_Next(struct EpilogueProc * proc)
{
    EndAllProcChildren(proc);

    if (*proc->msgs++ != 0)
        Proc_Goto(proc, 0);
}

ProcPtr StartEpilogueText(int const * msgs, int delay, ProcPtr parent)
{
    struct EpilogueProc * proc = Proc_Start(ProcScr_EpilogueText, parent);

    proc->msgs = msgs;
    proc->delay = delay;

    return proc;
}

bool IsEpilogueTextActive(void)
{
    if (Proc_Find(ProcScr_EpilogueText) != NULL)
        return TRUE;

    return FALSE;
}

void Epilogue_Init(struct EpilogueProc * proc)
{
    InitBgs(NULL);

    CpuFastFill(0, (void *) VRAM, 0x20);

    gDispIo.disp_ct.mode = 0;

    SetBlendConfig(0, 0x10, 0, 0);

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 1;
    gDispIo.bg2_ct.priority = 2;
    gDispIo.bg3_ct.priority = 3;

    SetBgOffset(3, 0, 0);

    SetWinEnable(0, 0, 0);

    CpuFastFill(0, gPal, 0x400);

    InitEpilogueTexts();
    SetOnHBlankA(NULL);

    proc->unk_4c = 0;
    proc->unk_4e = 0;

    sub_080B6DD4();
}

void Epilogue_SkipWatcher(struct EpilogueProc * proc)
{
    if (proc->skippable != 0 && (gpKeySt->pressed & START_BUTTON))
    {
        proc->skippable = 0;
        Proc_Goto(proc, 0x32);
    }
}

void Epilogue_InitMain(struct EpilogueProc * proc)
{
    struct GlobalSaveInfo info;

    proc->timer = 0;
    proc->unk_46 = 0;
    proc->cg = 0;
    proc->part = 0;

    ApplyPalette(Pal_EpilogueText, 0x1A);

    SetOnHBlankA(sub_080B6C14);

    SetBlendConfig(0, 0x10, 0, 0);
    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(1, 1, 1, 1, 1);
    gDispIo.blend_ct.target2_enable_bd = 1;

    ClearEpilogueTexts();

    StartParallelWorker(sub_080B7408, proc);

    proc->unk_51 = 0;

    if (ReadGlobalSaveInfo(&info) && (*((u8 *) &info + 0xE) & 3))
        proc->unk_51 = 1;

    proc->skippable = 0;

    StartParallelWorker(Epilogue_SkipWatcher, proc);
}

ASM_FUNC("asm/nonmatching/code_080B78DC.s");
void sub_080B7A0C(struct EpilogueProc * proc)
{
    proc->timer = 0;
    proc->unk_46 = 0;
    SetOnHBlankA(NULL);
}

ASM_FUNC("asm/nonmatching/code_080B7A24.s");
void sub_080B7B18(struct EpilogueProc * proc)
{
    proc->timer++;
    SetBlendConfig(0, 0x10 - (proc->timer >> 2), proc->timer >> 2, 0);

    if ((proc->timer >> 2) == 0x10)
    {
        EndAllProcChildren(proc);
        StartParallelWorker(Epilogue_SkipWatcher, proc);
        Proc_Break(proc);
    }
}

ASM_FUNC("asm/nonmatching/code_080B7B74.s");

void sub_080B7BC8(struct EpilogueProc * proc)
{
    StartEpilogueText(gEpilogueEndMsgs, 8, proc);
}

void sub_080B7BDC(struct EpilogueProc * proc)
{
    proc->timer++;
    if ((proc->timer & 1) == 0)
        sub_080010F4(gEpilogueEndScroll[0], 0, 0x100, (proc->timer >> 1) + 0x20);

    if ((proc->timer >> 1) == 0x20)
    {
        proc->skippable = 0;
        Proc_Break(proc);
    }
}

void sub_080B7C28(struct EpilogueProc * proc)
{
    EndAllProcChildren(proc);
    SetOnHBlankA(NULL);
    WipeAllPalette();
}

void sub_080B7C3C(struct EpilogueProc * proc)
{
    if (proc->unk_51)
        proc->skippable = 1;
}

void sub_080B7C54(struct EpilogueProc * proc)
{
    proc->skippable = 0;
}

void sub_080B7C5C(struct EpilogueProc * proc)
{
    InitBgs(NULL);
    SetBlendConfig(0, 0x10, 0, 0);
    Decompress(Img_OneYearLater, (void *) (VRAM + 0x800));
    ApplyPaletteExt(Pal_OneYearLater, 0xA0, 0x20);
    PutCompressedTsa(gBg0Tm, Tsa_OneYearLater, 0x5040);
    EnableBgSync(BG0_SYNC_BIT);
    proc->timer = 0;
}

void sub_080B7CD0(struct EpilogueProc * proc)
{
    if (++proc->timer == 0x3C)
        Proc_Break(proc);
    else if (gpKeySt->pressed & START_BUTTON)
        Proc_Break(proc);
}

void sub_080B7D0C(struct EpilogueProc * proc)
{
    SetNextGameAction(0xC);
    InitBgs(NULL);
    SetBlendConfig(0, 0x10, 0, 0);
    ApplySystemObjectsGraphics();
    SetDispEnable(1, 1, 1, 1, 1);
    InitBoxDialogue(NULL, -1);
    StartBoxDialogueSimple(0, -4, 0x9F3, proc);
    SetDialogueBoxConfig(0x190);
}

void sub_080B7D88(struct EpilogueProc * proc)
{
    if (GetTalkChoiceResult() == 2)
        Proc_Goto(proc, 1);
    else
        Proc_Goto(proc, 0);
}

void sub_080B7DAC(struct EpilogueProc * proc)
{
    InitBgs(NULL);
    SetBlendConfig(0, 0x10, 0, 0);
    ApplySystemObjectsGraphics();
    SetDispEnable(1, 1, 1, 1, 1);
    InitBoxDialogue(NULL, -1);
    StartBoxDialogueSimple(0, -4, 0x9F5, proc);
    SetDialogueBoxConfig(0x190);
}

void sub_080B7E20(void)
{
    if (GetTalkChoiceResult() == 2)
        SetNextGameAction(5);
    else
        SetNextGameAction(0xC);
}

void sub_080B7E3C(struct EpilogueProc * proc)
{
    InitBgs(NULL);
    SetBlendConfig(0, 0x10, 0, 0);
    ApplySystemObjectsGraphics();
    SetDispEnable(1, 1, 1, 1, 1);
    InitBoxDialogue(NULL, -1);
    StartBoxDialogueSimple(0, -4, 0x9F4, proc);
    SetDialogueBoxConfig(0x110);
}

