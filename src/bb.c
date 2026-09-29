#include "gbafe.h"
#include "gbafe/bb.h"

// Scrolling subtitle help at the bottom of the map screen (FE8U: bb.c)

void sub_08019B40(void);

extern u8 CONST_DATA Pal_SubtitleHelpText[];
extern u8 CONST_DATA Img_SubtitleHelpToggle[];
extern u8 CONST_DATA Pal_SubtitleHelpToggle[];

CONST_DATA u16 gSubtitleHelpTextChrLut[] = {
    0, 4, 8, 0xC, 0x10, 0x14, 0x18, 0x44,
    0x48, 0x4C, 0x50, 0x54, 0x58,
};

CONST_DATA u8 gSubtitleHelpDarkenerBldyLut[] = {
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 1, 2, 3, 4,
    5, 6, 7, 7, 7, 7, 7, 7,
    7, 7, 7, 7, 7, 7, 7, 7,
    0, 0,
};

CONST_DATA struct ProcCmd ProcScr_SubtitleHelpDarkener[] = {
    PROC_END_DUPLICATES,
    PROC_CALL(SubtitleHelpDarkener_Init),
    PROC_REPEAT(SubtitleHelpDarkener_FadeIn),
    PROC_REPEAT(SubtitleHelpDarkener_FadeOut),
    PROC_END,
};

CONST_DATA u8 gSubtitleHelpYLut[] = {
    0x90, 0x91, 0x92, 0x94, 0x96, 0x99, 0x9C, 0,
};

CONST_DATA struct ProcCmd ProcScr_SubtitleHelp[] = {
    PROC_19,
    PROC_19,
    PROC_SET_END_CB(SubtitleHelp_OnEnd),
    PROC_YIELD,
    PROC_CALL(SubtitleHelp_Init),
    PROC_REPEAT(SubtitleHelp_Loop),
    PROC_BLOCK,
};

CONST_DATA u8 gSubtitleHelpToggleYLut[] = {
    0x8E, 0x8F, 0x90, 0x92, 0x94, 0x97, 0x9A, 0,
};

CONST_DATA struct ProcCmd ProcScr_SubtitleHelpToggle[] = {
    PROC_19,
    PROC_19,
    PROC_YIELD,
    PROC_CALL(sub_080325A0),
    PROC_REPEAT(SubtitleHelpToggle_Loop),
    PROC_CALL(SubtitleHelp_OnEnd),
    PROC_SLEEP(8),
    PROC_END,
};

void PutSubtitleHelpText(struct SubtitleHelpProc * proc, int y)
{
    int i;

    for (i = 0; i < 9; i++)
    {
        int x = (i * 32) - 32 + proc->textOffset;
        int index = (proc->textNum + i) % proc->textCount;

        PutSprite(2, x, y, Sprite_32x16, 0x4240 + gSubtitleHelpTextChrLut[index]);
    }

    return;
}

void InitSubtitleHelpText(struct SubtitleHelpProc * proc)
{
    const char * iter;
    int line;
    int width;

    iter = proc->string;

    InitSpriteTextFont(&proc->font, OBJ_VRAM0 + 0x4800, 0x14);
    SetTextFontGlyphs(1);

    ApplyPalette(Pal_SubtitleHelpText, 0x14);

    for (line = 0; line < 2; line++)
    {
        InitSpriteText(proc->text + line);

        SpriteText_DrawBackgroundExt(proc->text + line, 0);
        Text_SetColor(proc->text + line, 0);
    }

    line = 0;

    if (iter != 0)
    {
        while (*iter > 1)
        {
            iter = Text_DrawCharacter(proc->text + line, iter);

            if (Text_GetCursor(proc->text + line) > 0xE0)
            {
                iter -= 1;
                line++;

                GetCharTextLen(iter, &width);

                Text_SetCursor(proc->text + line, (Text_GetCursor(proc->text) - width) - 0xC0);
            }
        }

        proc->textCount = ((GetStringTextLen(proc->string) + 16) >> 5) + 1;
        proc->textNum = proc->textCount - 1;
    }

    SetTextFont(0);

    return;
}

void SubtitleHelpDarkenerOnHBlank(void)
{
    u16 vcount = REG_VCOUNT;

    if ((vcount < 140) || (vcount > 160))
    {
        REG_BLDCNT = *(u16 *) (&gDispIo.blend_ct);
        REG_BLDALPHA = *(u16 *) (&gDispIo.blend_coef_a);
        REG_BLDY = gDispIo.blend_y;
    }
    else
    {
        int bldy;

        bldy = gSubtitleHelpDarkenerBldyLut[vcount - 128];
        bldy = bldy - gBmSt.alt_blend_a_ca;

        if (bldy < 0)
            bldy = 0;

        REG_BLDCNT =
            BLDCNT_EFFECT_DARKEN |
            BLDCNT_TGT1_BG2 |
            BLDCNT_TGT1_BG3 |
            BLDCNT_TGT1_BD;

        REG_BLDY = bldy;
    }

    return;
}

void SubtitleHelpDarkener_Init(void)
{
    gBmSt.alt_blend_a_ca = 8;
    SetOnHBlankA(SubtitleHelpDarkenerOnHBlank);

    return;
}

void SubtitleHelpDarkener_FadeIn(void)
{
    if (gBmSt.alt_blend_a_ca != 0)
        gBmSt.alt_blend_a_ca--;
}

void SubtitleHelpDarkener_FadeOut(struct SubtitleHelpProc * proc)
{
    gBmSt.alt_blend_a_ca++;

    if (gBmSt.alt_blend_a_ca == 8)
    {
        SetOnHBlankA(0);
        Proc_Break(proc);
    }

    return;
}

void SubtitleHelp_Init(struct SubtitleHelpProc * proc)
{
    proc->textOffset = 31;
    proc->textShowCnt = 6;

    Proc_Start(ProcScr_SubtitleHelpDarkener, PROC_TREE_3);

    return;
}

void SubtitleHelp_OnEnd(void)
{
    gBmSt.camera_max.y -= 16;

    CameraMove_801622C(0);

    Proc_BreakEach(ProcScr_SubtitleHelpDarkener);

    return;
}

void SubtitleHelp_Loop(struct SubtitleHelpProc * proc)
{
    PutSubtitleHelpText(proc, gSubtitleHelpYLut[proc->textShowCnt]);

    if (proc->textShowCnt != 0)
        proc->textShowCnt--;

    proc->textOffset--;

    if (proc->textOffset < 0)
    {
        proc->textOffset = 31;
        proc->textNum++;
    }

    return;
}

void StartSubtitleHelp(ProcPtr parent, const char * string)
{
    if (gPlaySt.cfgNoSubtitleHelp != 1)
    {
        struct SubtitleHelpProc * proc = Proc_Start(ProcScr_SubtitleHelp, parent);

        proc->string = string;

        InitSubtitleHelpText(proc);

        sub_08019B40();

        gBmSt.camera_max.y += 16;
    }

    return;
}

void sub_080325A0(struct SubtitleHelpProc * proc)
{
    proc->textOffset = 0;
    proc->textShowCnt = 6;

    Decompress(Img_SubtitleHelpToggle, OBJ_VRAM0 + 0x5000);
    ApplyPalette(Pal_SubtitleHelpToggle, 0x15);

    Proc_Start(ProcScr_SubtitleHelpDarkener, PROC_TREE_3);

    PlaySoundEffect(0x38A);

    gPlaySt.cfgController = 1 - gPlaySt.cfgController;
}

void sub_0803261C(int y)
{
    int pal = 0;

    if (gPlaySt.cfgController)
        pal = 5;

    PutSprite(2, 0x38, y, Sprite_32x16, (pal << 12) + 0x280);
    PutSprite(2, 0x58, y, Sprite_32x16, (pal << 12) + 0x284);
    PutSprite(2, 0x78, y, Sprite_32x16, (pal << 12) + 0x288);
    PutSprite(2, 0x98, y, Sprite_16x16, (pal << 12) + 0x28C);
    PutSprite(2, 0xA8, y, Sprite_8x16, (pal << 12) + 0x28E);

    if (!gPlaySt.cfgController)
    {
        PutSprite(2, 0xB0, y, Sprite_16x16, (pal << 12) + 0x28F);
    }
    else
    {
        PutSprite(2, 0xB0, y, Sprite_16x16, (pal << 12) + 0x292);
        PutSprite(2, 0xC0, y, Sprite_8x16, (pal << 12) + 0x294);
    }
}

void SubtitleHelpToggle_Loop(struct SubtitleHelpProc * proc)
{
    sub_0803261C(gSubtitleHelpToggleYLut[proc->textShowCnt]);

    if (proc->textShowCnt != 0)
        proc->textShowCnt--;

    if (proc->textOffset < 30)
        proc->textOffset++;

    if (proc->textOffset == 30 && !(gpKeySt->held & SELECT_BUTTON))
        Proc_Break(proc);
}

void StartSubtitleHelpToggle(ProcPtr parent)
{
    struct SubtitleHelpProc * proc = Proc_StartBlocking(ProcScr_SubtitleHelpToggle, parent);

    proc->string = NULL;

    InitSubtitleHelpText(proc);

    sub_08019B40();

    gBmSt.camera_max.y += 16;
}

void EndSubtitleHelp(void)
{
    Proc_EndEach(ProcScr_SubtitleHelp);
    return;
}

bool IsSubtitleHelpActive(void)
{
    return Proc_Find(ProcScr_SubtitleHelp) != 0;
}

void sub_080327C4(ProcPtr parent, const char * string)
{
    struct SubtitleHelpProc * proc;

    proc = Proc_Find(ProcScr_SubtitleHelp);
    if (proc == 0)
        proc = Proc_Start(ProcScr_SubtitleHelp, parent);

    proc->string = string;

    InitSubtitleHelpText(proc);

    proc->textOffset = 31;

    return;
}
