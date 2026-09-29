#include "gbafe.h"

u16 GetDialogueBoxConfig(void);
void InitBoxDialogue(void * vram_dst, int pal);
ProcPtr StartTalkMsg(int x, int y, int id);

struct ProcEvent_08CA7994
{
    PROC_HEADER;
    STRUCT_PAD(0x29, 0x4C);

    /* 4C */ s16 timer;
};
PROC_SIZE_CHECK(struct ProcEvent_08CA7994);

void IsTalkActive(ProcPtr proc);
void sub_0807C8B4(ProcPtr proc);
void sub_0807C8FC(void);
void sub_0807C96C(ProcPtr proc);
void sub_0807C9B0(void);
void sub_0807CA04(void);
void sub_0807CA44(ProcPtr proc);
void sub_0807CAC0(ProcPtr proc);
void sub_0807CB28(ProcPtr proc);
void sub_0807CB3C(struct ProcEvent_08CA7994 * proc);
void sub_0807CBE4(struct ProcEvent_08CA7994 * proc);
void sub_0807CC14(void);

CONST_DATA struct ProcCmd ProcScr_08CA78DC[] = {
    PROC_YIELD,
    PROC_CALL(LockBmDisplay),
    PROC_CALL(sub_0807CB28),
    PROC_YIELD,
    PROC_CALL(sub_0807C96C),
    PROC_CALL(sub_0807C9B0),
    PROC_CALL(StartMidFadeFromBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(sub_0807CA04),
    PROC_WHILE(IsTalkActive),
    PROC_CALL(StartMidFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(sub_0807CA44),
    PROC_YIELD,
    PROC_LABEL(0),
    PROC_CALL(sub_0807CAC0),
    PROC_YIELD,
    PROC_CALL(sub_0807C8B4),
    PROC_YIELD,
    PROC_YIELD,
    PROC_CALL(sub_0807C8FC),
    PROC_CALL(UnlockBmDisplay),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_08CA7994[] = {
    PROC_YIELD,
    PROC_CALL(sub_0807CB3C),
    PROC_SLEEP(16),
    PROC_REPEAT(sub_0807CBE4),
    PROC_CALL(sub_0807CC14),
    PROC_END,
};

void sub_0807C8B4(ProcPtr proc)
{
    InitBoxDialogue((void *) 0x06013000, 0xE);
    StartBoxDialogueExt(0, -4, 0xFCC, (void *) 0x06013000, 0xE, proc);
    SetDialogueBoxConfig((u16) (GetDialogueBoxConfig() | 0x1B0));
}

void sub_0807C8FC(void)
{
    int i;

    SetBlendDarken(0x10);

    if (GetTalkChoiceResult() == 1)
    {
        for (i = 1; i < 0x40; i++)
        {
            struct Unit * unit = GetUnit(i);

            if (UNIT_IS_VALID(unit) && (UNIT_CATTRIBUTES(unit) & CA_SUPPLY))
            {
                unit->state &= ~(US_UNSELECTABLE | US_NOT_DEPLOYED);
                return;
            }
        }
    }
}

void sub_0807C96C(ProcPtr proc)
{
    switch (gPlaySt.chapterIndex)
    {
    case 0x11:
        if (CheckFlag(0x6A))
            return;

        break;

    case 0x14:
        if (!CheckFlag(0x6A))
            return;

        break;
    }

    Proc_Goto(proc, 0);
}

void sub_0807C9B0(void)
{
    SetBlendDarken(0x10);
    SetBlendTargetA(1, 1, 1, 1, 1);

    DisplayBackground(0x1C);

    ArchiveCurrentPalettes();
    WriteFadedPaletteFromArchive(0xC0, 0xC0, 0xC0, 0xF00);
}

void sub_0807CA04(void)
{
    InitTalk(0x80, 2, TRUE);

    if (gPlaySt.chapterModeIndex == CHAPTER_MODE_ELIWOOD)
        StartTalkMsg(1, 1, 0xFC9);

    if (gPlaySt.chapterModeIndex == CHAPTER_MODE_HECTOR)
        StartTalkMsg(1, 1, 0xFCA);
}

void sub_0807CA44(ProcPtr proc)
{
    ClearTalk();
    InitBgs(NULL);

    SetBlendConfig(BLEND_EFFECT_NONE, 0, 0, 0x10);

    ApplySystemObjectsGraphics();

    InitBoxDialogue((void *) 0x06013000, 0xE);
    StartBoxDialogueExt(0, 0, 0xFCB, (void *) 0x06013000, 0xE, proc);
    SetDialogueBoxConfig((u16) (GetDialogueBoxConfig() | 0x110));
}

void sub_0807CAC0(ProcPtr proc)
{
    InitBgs(NULL);

    SetBlendConfig(BLEND_EFFECT_NONE, 0, 0, 0x10);

    ApplySystemObjectsGraphics();

    if (!(gPlaySt.chapterStateBits & PLAY_FLAG_EXTRA_MAP) && CheckFlag(0x90))
    {
        Proc_StartBlocking(ProcScr_08CA7994, proc);
        ClearFlag(0x90);
    }
}

void sub_0807CB28(ProcPtr proc)
{
    StartBgmVolumeChange(0x100, 0x90, 10, proc);
}

void sub_0807CB3C(struct ProcEvent_08CA7994 * proc)
{
    struct Unit * unit = GetUnitFromCharId(0x28);
    u16 * tm;
    char const * str;

    UnpackUiWindowFrameGraphics();
    ResetText();

    DrawUiFrame2(7, 8, 0x11, 4, 0);

    if (!gPlaySt.cfgDisableSoundEffects)
        m4aSongNumStart(0x37B);

    str = DecodeMsg(0x12CE);
    tm = gBg0Tm + TM_OFFSET(1, 9);
    PutDrawText(NULL, tm + 7, 0, 0, 0x10, str);
    PutNumber(tm + 20, 2, unit->level);
    PutDrawText(NULL, tm + 21, 0, 0, 8, DecodeMsg(0x12CF));

    proc->timer = 120;

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);
}

void sub_0807CBE4(struct ProcEvent_08CA7994 * proc)
{
    if (--proc->timer == 0 || (gpKeySt->pressed & (A_BUTTON | B_BUTTON)))
        Proc_Break(proc);
}

void sub_0807CC14(void)
{
    TmFill(gBg1Tm, 0);
    TmFill(gBg0Tm, 0);
    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);
}

void sub_0807CC38(ProcPtr proc)
{
    if (HasConvoyAccess_(1))
        Proc_StartBlocking(ProcScr_08CA78DC, proc);
}
