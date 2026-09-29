#include "gbafe.h"
#include "gbafe/sio_core.h"

// Link arena misc (FE8U: sio_main2.c)

extern const struct ProcCmd ProcScr_HOLD[];
extern struct Text gSioTexts[];
extern struct Text gUnk_Sio_0203DA88[];
extern struct SioSaveConf gSioSaveConfig;
extern u16 gSioList_085A93F0[];
extern int gKeyInputSequenceTimer;
extern int gTargetKeyInSeqIndex;
extern int gCurrentKeyInSeqIndex;
extern u16 gKeyInputSequenceBuffer[];


void SioHold_Loop(struct ProcSioHold * proc)
{
    if (proc->y < proc->y_max && proc->y > proc->y_min)
        DisplayFrozenUiHand(proc->x, proc->y);
}

ProcPtr StartSioHold(ProcPtr parent, int x, int y, int y_max, int y_min)
{
    struct ProcSioHold * proc;
    proc = Proc_Start(ProcScr_HOLD, parent);
    proc->x = x;
    proc->y = y;
    proc->y_max = y_max;
    proc->y_min = y_min;
    return proc;
}

void EndSioHold(void)
{
    Proc_EndEach(ProcScr_HOLD);
}

void sub_0803DBC8(ProcPtr proc, int num)
{
    ((struct Proc *)proc)->y += num;
}

void ClearSioBG(void)
{
    SetBgOffset(BG_0, 0, 0);
    SetBgOffset(BG_1, 0, 0);
    SetBgOffset(BG_2, 0, 0);
    SetBgOffset(BG_3, 0, 0);

    TmFill(gBg0Tm, 0);
    TmFill(gBg1Tm, 0);
    TmFill(gBg2Tm, 0);

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);
}

void sub_0803DC28(void)
{
    SetBgOffset(BG_0, 0, 0);
    SetBgOffset(BG_1, 0, 0);
    SetBgOffset(BG_2, 0, 0);
    SetBgOffset(BG_3, 0, 0);

    TmFill(gBg0Tm, 0);
    TmFill(gBg1Tm, 0);
    TmFill(gBg2Tm, 0);
    TmFill(gBg3Tm, 0);

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);
}

void PutSioText(int msg, int text_idx)
{
    struct Text * text = &gSioTexts[text_idx];

    ClearText(text);

    if (msg < 0)
    {
        PutText(text, gBg2Tm + TM_OFFSET(1, text_idx * 2 + 0x10));
    }
    else
    {
        Text_DrawString(text, DecodeMsg(msg));
        PutText(text, gBg2Tm + TM_OFFSET(1, text_idx * 2 + 0x10));
        EnableBgSync(BG2_SYNC_BIT);
    }
}

void sub_0803DCF0(void)
{
    int i;
    for (i = 0; i < 6; i++)
        InitText(&gUnk_Sio_0203DA88[i], 12);

    for (i = 0; i < 11; i++)
        InitText(&gLinkArenaSt.texts[i], 12);

    for (i = 0; i < 2; i++)
        InitText(&gSioTexts[i], 24);
}

void sub_0803DD40(struct Unit * unit)
{
    int i;
    u8 item_list[] = {
        ITEM_SWORD_IRON,
        ITEM_LANCE_IRON,
        ITEM_AXE_IRON,
        ITEM_BOW_IRON,
        ITEM_NONE,
        ITEM_ANIMA_FIRE,
        ITEM_LIGHT_LIGHTNING,
        ITEM_DARK_FLUX,
    };

    for (i = 0; i < UNIT_ITEM_COUNT; i++)
        unit->items[i] = 0;

    for (i = 0; i < 8; i++)
    {
        if (i == 4)
            continue;

        if (unit->ranks[i] == 0)
            continue;

        UnitAddItem(unit, item_list[i] | (0xFF << 8));
    }
}

void SioPlaySoundEffect(int idx)
{
    u16 sfx_list[] = { 0x38C, 0x38B, 0x38A, 0x386 };
    PlaySoundEffect(sfx_list[idx]);
}

void sub_0803DDD0(void)
{
    ReadMultiArenaSaveConfig(&gSioSaveConfig);
    gSioSaveConfig._unk3_ = true;
    WriteMultiArenaSaveConfig(&gSioSaveConfig);
}

bool IsKeyInputSequenceComplete(const u16 * list)
{
    if (gpKeySt->pressed == 0)
    {
        if (++gKeyInputSequenceTimer >= 60)
        {
            gTargetKeyInSeqIndex = gKeyInputSequenceTimer = 0;
        }
        return false;
    }

    gKeyInputSequenceTimer = 0;
    gKeyInputSequenceBuffer[gCurrentKeyInSeqIndex] = gpKeySt->pressed;

    if (gKeyInputSequenceBuffer[gCurrentKeyInSeqIndex] == list[gTargetKeyInSeqIndex])
    {
        gTargetKeyInSeqIndex = gTargetKeyInSeqIndex + 1;

        if (list[gTargetKeyInSeqIndex] == 0xFFFF)
            return true;
    }
    else
    {
        gTargetKeyInSeqIndex = 0;
    }

    gCurrentKeyInSeqIndex = (gCurrentKeyInSeqIndex + 1) & 0xF;
    return false;
}

bool sub_0803DE80(void)
{
    return IsKeyInputSequenceComplete(gSioList_085A93F0);
}


SECTION(".rodata.08B98BC4")
const struct ProcCmd ProcScr_HOLD[] = {
    PROC_19,
    PROC_REPEAT(SioHold_Loop),
    PROC_END,
};
