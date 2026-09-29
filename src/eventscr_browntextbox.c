#include "gbafe.h"

struct BrownTextBoxProc {
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x30);
    /* 30 */ int x;
    /* 34 */ int y;
    /* 38 */ u32 chr;
    /* 3C */ int pal;
    /* 40 */ int textId;
    /* 44 */ int width;
    /* 48 */ u16 oam0Attr;
    /* 4A */ STRUCT_PAD(0x4A, 0x4C);
    /* 4C */ s16 blendVal;
};

extern u16 CONST_DATA Sprite_8x8[];
extern u16 CONST_DATA Sprite_16x8[];
extern u16 CONST_DATA Sprite_32x16[];

extern u16 CONST_DATA Pal_BrownTextBox[];
extern u8 CONST_DATA Img_BrownTextBox[];

#define EVT_ARG_U16(proc, n) EVT_HALF((proc)->script, n)

void BrownTextBoxFadeIn_Init(struct BrownTextBoxProc * proc);
void BrownTextBoxFadeIn_Loop(struct BrownTextBoxProc * proc);
void BrownTextBoxFadeOut_End(void);
void BrownTextBoxFadeOut_Init(struct BrownTextBoxProc * proc);
void BrownTextBoxFadeOut_Loop(struct BrownTextBoxProc * proc);
void BrownTextBox_Loop(struct BrownTextBoxProc * proc);
void BrownTextBox_OnEnd(void);

CONST_DATA struct ProcCmd ProcScr_BrownTextBox[] = {
    PROC_YIELD,
    PROC_SET_END_CB(BrownTextBox_OnEnd),
    PROC_REPEAT(BrownTextBox_Loop),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_BrownTextBoxFadeIn[] = {
    PROC_CALL(BrownTextBoxFadeIn_Init),
    PROC_REPEAT(BrownTextBoxFadeIn_Loop),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_BrownTextBoxFadeOut[] = {
    PROC_CALL(BrownTextBoxFadeOut_Init),
    PROC_REPEAT(BrownTextBoxFadeOut_Loop),
    PROC_CALL(BrownTextBoxFadeOut_End),
    PROC_END,
};

void BrownTextBox_Loop(struct BrownTextBoxProc * proc)
{
    int i;

    int oam2A = (((proc->chr + 0x400) & 0x0001FFFF) / CHR_SIZE) | OAM2_PAL((proc->pal + 1));
    int oam2B = ((proc->chr & 0x0001FFFF) / CHR_SIZE) | OAM2_PAL(proc->pal);

    PutSpriteExt(4, proc->x, proc->y + proc->oam0Attr, Sprite_16x8, oam2B);
    PutSpriteExt(4, proc->x + (proc->width - 2) * 8, proc->y + proc->oam0Attr, Sprite_16x8, oam2B + 4);
    PutSpriteExt(4, proc->x, proc->y + 24 + proc->oam0Attr, Sprite_16x8, oam2B + 0xd);
    PutSpriteExt(4, proc->x + (proc->width - 2) * 8, proc->y + 24 + proc->oam0Attr, Sprite_16x8, oam2B + 0x11);

    PutSpriteExt(4, proc->x, proc->y + 8 + proc->oam0Attr, Sprite_8x8, oam2B + 6);
    PutSpriteExt(4, proc->x, proc->y + 16 + proc->oam0Attr, Sprite_8x8, oam2B + 11);
    PutSpriteExt(4, proc->x + (proc->width - 1) * 8, proc->y + 8 + proc->oam0Attr, Sprite_8x8, oam2B + 10);
    PutSpriteExt(4, proc->x + (proc->width - 1) * 8, proc->y + 16 + proc->oam0Attr, Sprite_8x8, oam2B + 12);

    for (i = 2; i < proc->width - 2; i += 2)
    {
        PutSpriteExt(4, proc->x + i * 8, proc->y + proc->oam0Attr, Sprite_16x8, oam2B + 2);
    }

    for (; i < proc->width - 1; i++)
    {
        PutSpriteExt(4, proc->x + i * 8, proc->y + proc->oam0Attr, Sprite_8x8, oam2B + 2);
    }

    for (i = 2; i < proc->width - 2; i += 2)
    {
        PutSpriteExt(4, proc->x + i * 8, proc->y + 24 + proc->oam0Attr, Sprite_16x8, oam2B + 15);
    }

    for (i = 1; i < proc->width - 2; i += 2)
    {
        PutSpriteExt(4, proc->x + i * 8, proc->y + 8 + proc->oam0Attr, Sprite_16x8, oam2B + 8);
        PutSpriteExt(4, proc->x + i * 8, proc->y + 16 + proc->oam0Attr, Sprite_16x8, oam2B + 8);
    }

    for (; i < proc->width - 1; i++)
    {
        PutSpriteExt(4, proc->x + i * 8, proc->y + 8 + proc->oam0Attr, Sprite_8x8, oam2B + 8);
        PutSpriteExt(4, proc->x + i * 8, proc->y + 16 + proc->oam0Attr, Sprite_8x8, oam2B + 8);
    }

    for (i = 0; i < 3; i++)
    {
        PutSpriteExt(0, proc->x + 8 + (i * 32), proc->y + 8 + proc->oam0Attr, Sprite_32x16, oam2A + i * 4);
    }
}

void BrownTextBox_OnEnd(void)
{
    return;
}

void BrownTextBox_SetBlend(struct BrownTextBoxProc * proc, s8 doBlend)
{
    if (!proc)
        return;

    if (doBlend)
        proc->oam0Attr = OAM0_BLEND;
    else
        proc->oam0Attr = 0;
}

void BrownTextBoxFadeIn_Init(struct BrownTextBoxProc * proc)
{
    proc->blendVal = 0;

    SetBlendAlpha(0, 0x10);

    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(1, 1, 1, 1, 1);

    SetBlendBackdropA(1);
    SetBlendBackdropB(1);

    BrownTextBox_SetBlend(Proc_Find(ProcScr_BrownTextBox), 1);
}

void BrownTextBoxFadeIn_Loop(struct BrownTextBoxProc * proc)
{
    int blendVal;

    proc->blendVal++;
    blendVal = proc->blendVal;

    SetBlendAlpha(blendVal, 0x10 - blendVal);

    if (blendVal == 0x10)
    {
        Proc_Break(proc);
        SetBlendNone();

        BrownTextBox_SetBlend(Proc_Find(ProcScr_BrownTextBox), 0);
    }
}

void BrownTextBoxFadeOut_Init(struct BrownTextBoxProc * proc)
{
    proc->blendVal = 0;

    SetBlendAlpha(0x10, 0);

    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(1, 1, 1, 1, 1);

    SetBlendBackdropA(1);
    SetBlendBackdropB(1);

    BrownTextBox_SetBlend(Proc_Find(ProcScr_BrownTextBox), 1);
}

void BrownTextBoxFadeOut_Loop(struct BrownTextBoxProc * proc)
{
    int blendVal;

    proc->blendVal++;
    blendVal = proc->blendVal;

    SetBlendAlpha(0x10 - blendVal, blendVal);

    if (blendVal == 0x10)
    {
        Proc_End(Proc_Find(ProcScr_BrownTextBox));
        Proc_Break(proc);
    }
}

void BrownTextBoxFadeOut_End(void)
{
    SetBlendNone();
}

void StartBrownTextBoxCore(int x, int y, int textId, int chr, int pal, ProcPtr parent)
{
    struct Font font;
    struct Text text;

    int r6 = 0;
    int r4;

    struct BrownTextBoxProc * proc = Proc_Start(ProcScr_BrownTextBox, parent);
    char const * str = DecodeMsg(textId);

    proc->x = x;
    proc->y = y;
    proc->chr = chr;
    proc->pal = pal;
    proc->textId = textId;
    proc->oam0Attr = r6;

    Proc_StartBlocking(ProcScr_BrownTextBoxFadeIn, parent);

    ApplyPalette(Pal_BrownTextBox, proc->pal + 0x10);
    ApplyPalette(Pal_Text, proc->pal + 0x11);
    Decompress(Img_BrownTextBox, (void *) (0x06010000 + proc->chr));

    r6 = GetStringTextLen(str);

    r4 = r6 / 8;
    r6 = r4 + 5;

    proc->width = r6;

    if (proc->x < 0)
        proc->x = 8;

    if (proc->x + proc->width * 8 > 0xF0)
        proc->x = 0xE8 - proc->width * 8;

    InitSpriteTextFont(&font, (void *) (proc->chr + 0x06010400), proc->pal + 0x12);
    SetTextFont(&font);
    InitSpriteText(&text);
    SpriteText_DrawBackgroundExt(&text, 0);
    SetTextFontGlyphs(0);

    Text_InsertDrawString(&text, GetStringTextCenteredPos((r4 + 3) * 8, str), 0, str);

    SetTextFont(NULL);
}

int EvtCmd_BrownTextBox(struct EventProc * proc)
{
    int msg = proc->script[1];
    int x = SCR_LO16_SIGN(proc->script[2]);
    u16 y_raw = EVT_ARG_U16(proc, 5);
    int y = y_raw & 0x8000 ? -1 : y_raw;

    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    StartBrownTextBoxCore(x, y, msg, 0x5000, 9, proc);
    return EVENT_CMDRET_YIELD;
}

int EvtCmd_EndBrownTextBox(struct EventProc * proc)
{
    if (proc->flags & EVENT_FLAG_SKIPPED)
    {
        Proc_End(Proc_Find(ProcScr_BrownTextBox));
        return EVENT_CMDRET_CONTINUE;
    }

    if (proc->unk_4D)
        Proc_End(Proc_Find(ProcScr_BrownTextBox));
    else
        Proc_StartBlocking(ProcScr_BrownTextBoxFadeOut, proc);

    return EVENT_CMDRET_YIELD;
}
