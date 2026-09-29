#include "gbafe.h"

#include "gbafe/bmshop.h"
#include "gbafe/bmarena.h"

// FE8U: uiarena.c (compiled at -O0 in FE7)

int GetGold(void);
void Proc_Mark(ProcPtr proc, u8 mark);

extern struct ProcCmd CONST_DATA ProcScr_Mu[];
extern const struct ProcCmd gProcScr_ArenaUiMain[];
extern const struct ProcCmd gProcScr_ArenaUiResults[];
extern EventScr CONST_DATA EventScr_SuspendPrompt[];
extern int CONST_DATA gMid_Lv;

extern u8 Img_ArenaBuildingFront[];
extern u8 Tsa_ArenaBuildingFront[];
extern u16 Pal_ArenaBuildingFront[];

void StartArenaDialogue(int msgId, ProcPtr proc);
void DrawArenaOpponentDetailsText(ProcPtr proc);
void ArenaUi_Init(ProcPtr proc);

s8 sub_080B2624(ProcPtr proc)
{
    struct MusicPlayerInfo * info = gMPlayTable[gSongTable[0x47].ms].info;

    if ((info->status & 0xFFFF) == 0 && (info->status & 0x80000000) == 0)
        return 0;
    else
        return 1;
}

void StartArenaScreen(void)
{
    ArenaBegin(gActiveUnit);
    Proc_Start(gProcScr_ArenaUiMain, PROC_TREE_3);
}

void StartArenaResultsScreen(void)
{
    ProcPtr proc = Proc_Start(gProcScr_ArenaUiResults, PROC_TREE_3);
}

void ArenaUi_Init(ProcPtr proc)
{
    Proc_ForEach(ProcScr_Mu, (ProcFunc) HideMu);

    InitShopScreenConfig();

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 2;
    gDispIo.bg2_ct.priority = 0;
    gDispIo.bg3_ct.priority = 3;

    InitTalk(0x200, 2, 0);
    InitFaces();
    StartTalkFace(0xE2, 0x20, 8, 3, 1);

    Decompress(Tsa_ShopWindows, gBuf);
    TmApplyTsa_thm(gBg1Tm, gBuf, 0x1000);
    TmFillRect_thm(gBg1Tm + 0x100, 0x1E, 0xC, 0);

    EnableBgSync(BG1_SYNC_BIT);

    StartUiGoldBox(proc);

    SetWinEnable(1, 1, 0);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWin1Layers(1, 1, 0, 1, 1);
    SetWOutLayers(1, 1, 0, 1, 1);

    SetWin0Box(88, 72, 240, 152);
    SetWin1Box(0, 8, 240, 56);

    gDispIo.win_ct.win0_enable_blend = 0;
    gDispIo.win_ct.win1_enable_blend = 1;
    gDispIo.win_ct.wout_enable_blend = 0;

    SetBlendConfig(3, 0, 0, 8);

    SetBlendTargetA(0, 0, 0, 1, 0);
    SetBlendTargetB(0, 0, 0, 0, 0);

    Decompress(Img_ArenaBuildingFront, (void *) VRAM + GetBgChrOffset(3));
    TmApplyTsa_thm(gBg3Tm, Tsa_ArenaBuildingFront, 0xC000);
    ApplyPalettes(Pal_ArenaBuildingFront, 0xC, 4);

    EnableBgSync(BG3_SYNC_BIT);
}

void sub_080B2A50(ProcPtr proc)
{
    UpdateUnitFromBattle(gArenaSt.player, &gBattleActor);
    StartMu(gActiveUnit);
    MU_SetDefaultFacing_Auto();
}

void ArenaUi_WelcomeDialogue(ProcPtr proc)
{
    if (UNIT_ARENA_LEVEL(gArenaSt.player) < 5)
        StartArenaDialogue(0x3F, proc);
    else
        StartArenaDialogue(0x40, proc);
}

void ArenaUi_WagerGoldDialogue(ProcPtr proc)
{
    SetTalkNumber(ArenaGetMatchupGoldValue());
    StartArenaDialogue(0x41, proc);
}

void ArenaUi_CheckConfirmation(ProcPtr proc)
{
    switch (GetTalkChoiceResult()) {
    case 0:
    case 2:
    default:
        StartArenaDialogue(0x43, proc);
        Proc_Goto(proc, 2);
        break;

    case 1:
        if (ArenaGetMatchupGoldValue() <= (int) GetGold())
            break;
        else
        {
            StartArenaDialogue(0x49, proc);
            Proc_Goto(proc, 2);
        }
        break;
    }
}

void ArenaUi_ConfirmWager(ProcPtr proc)
{
    int gold = GetGold();
    gold -= ArenaGetMatchupGoldValue();
    SetGold(gold);

    PlaySoundEffect(0xB9);
    DisplayGoldBoxText(gBg0Tm + TM_OFFSET_(27, 6));
    DrawArenaOpponentDetailsText(proc);
}

void ArenaUi_InstructionsDialogue(ProcPtr proc)
{
    StartArenaDialogue(0x44, proc);
}

void ArenaUi_GoodLuckDialogue(ProcPtr proc)
{
    StartArenaDialogue(0x42, proc);
}

void ArenaUi_FadeOutBgm(ProcPtr proc)
{
    FadeBgmOut(-1);
}

void ArenaUi_StartArenaBattle(ProcPtr proc)
{
    Proc_Mark(proc, 7);

    ClearTalk();

    Proc_EndEach(gProcScr_GoldBox);

    gActionSt.id = 0x16;
    gActiveUnit->state |= 0x40;

    PidStatsAddBattleAmt(gActiveUnit);
    EndAllMus();

    gActionSt.extra = 0;

    BattleGenerateArena(gActiveUnit);

    BeginBattleAnimations();
}

void ArenaUiResults_Init_A(ProcPtr proc)
{
    StartPartialGameLock(proc);
}

void sub_080B2C78(ProcPtr proc)
{
    ArenaUi_Init(proc);
}

void ArenaUi_ResultsDialogue(ProcPtr proc)
{
    int gold = GetGold();

    switch (ArenaGetResult()) {
    case 1:
        SetTalkNumber(ArenaGetMatchupGoldValue() * 2);
        StartArenaDialogue(0x45, proc);
        gold += ArenaGetMatchupGoldValue() * 2;
        SetGold(gold);
        break;

    case 2:
        StartArenaDialogue(0x46, proc);
        break;

    case 3:
        StartArenaDialogue(0x48, proc);
        gold += ArenaGetMatchupGoldValue();
        SetGold(gold);
        break;

    case 4:
        StartArenaDialogue(0x47, proc);
        break;
    }
}

void ArenaUi_ShowGoldBoxOnVictoryOrDraw(ProcPtr proc)
{
    switch (ArenaGetResult()) {
    case 1:
    case 3:
        DisplayGoldBoxText(gBg0Tm + TM_OFFSET_(27, 6));
        PlaySoundEffect(0xB9);
        StartTemporaryLock(proc, 60);
        break;

    case 2:
        break;

    case 4:
        break;
    }
}

void ArenaUi_OnEnd(ProcPtr proc)
{
    Proc_EndEach(gProcScr_GoldBox);
    Proc_ForEach(ProcScr_Mu, (ProcFunc) ShowMu);
}

void StartArenaDialogue(int msgId, ProcPtr proc)
{
    SetInitTalkTextFont();
    ClearTalkText();

    StartTalkExt(8, 2, DecodeMsg(msgId), proc);
    SetTalkPrintColor(0);

    SetTalkFlag(1);
    SetTalkFlag(2);
    SetTalkFlag(4);

    SetActiveTalkFace(1);
}

void DrawArenaOpponentDetailsText(ProcPtr proc)
{
    DrawUiFrame2(7, 9, 0x10, 6, 0);
    SetTextFont(0);
    InitSystemTextFont();

    PutString(gBg0Tm + TM_OFFSET_(8, 10), 0, DecodeMsg(gMid_Lv));
    PutNumber(gBg0Tm + TM_OFFSET_(12, 10), 2, gArenaSt.opponent->level);
    PutString(gBg0Tm + TM_OFFSET_(8, 12), 0, DecodeMsg(gArenaSt.opponent->pCharacterData->nameTextId));
    PutString(gBg0Tm + TM_OFFSET_(15, 10), 0, DecodeMsg(gArenaSt.opponent->pClassData->nameTextId));
    PutString(gBg0Tm + TM_OFFSET_(15, 12), 0, GetItemName(gArenaSt.opponent_weapon));
}

void Arena_PlayResultSong(ProcPtr proc)
{
    switch (ArenaGetResult()) {
    case 1:
        if (!gPlaySt.cfgDisableBgm)
            StartBgmCore(0x2D, 0);
        break;

    default:
        if (!gPlaySt.cfgDisableBgm)
            StartBgmCore(0x47, 0);

        Proc_End(proc);
        break;
    }
}

void Arena_PlayArenaSong(ProcPtr proc)
{
    StartBgmExt(0x47, 0, 0);
}

void CallSuspendPromptEvent(void)
{
    StartEvent(EventScr_SuspendPrompt);
}

s8 sub_080B2F40(ProcPtr proc)
{
    switch (GetTalkChoiceResult()) {
    case 1:
        return 1;

    case 2:
        return 0;

    case 0:
    default:
        return 0;
    }
}

void WriteSuspendPlayerIdle(void)
{
    gActionSt.suspend_point = 0;
    WriteSuspendSave(3);
}

void sub_080B2F94(ProcPtr proc)
{
    SetNextGameAction(0);
    EventEndBattleMap(proc);
}


extern const struct ProcCmd gProcScr_ArenaUiResultBgm[];

SECTION(".rodata.08CE729C")
const struct ProcCmd gProcScr_ArenaUiMain[] = {
    PROC_CALL(LockGame),
    PROC_SLEEP(1),
    PROC_CALL_ARG(_FadeBgmOut, -1),
    PROC_CALL(StartMidFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(LockBmDisplay),
    PROC_CALL_ARG(_StartBgm, 71),
    PROC_CALL(ArenaUi_Init),
    PROC_CALL(FadeInBlackSpeed20),
    PROC_SLEEP(1),
    PROC_CALL(ArenaUi_WelcomeDialogue),
    PROC_SLEEP(1),
    PROC_CALL(ArenaUi_WagerGoldDialogue),
    PROC_SLEEP(1),
    PROC_CALL(ArenaUi_CheckConfirmation),
    PROC_SLEEP(1),
    PROC_CALL(ArenaUi_ConfirmWager),
    PROC_SLEEP(1),
    PROC_CALL(ArenaUi_InstructionsDialogue),
    PROC_SLEEP(1),
    PROC_CALL(ArenaUi_GoodLuckDialogue),
    PROC_SLEEP(1),
    PROC_LABEL(0),
    PROC_CALL_ARG(_FadeBgmOut, 2),
    PROC_CALL(sub_08014170),
    PROC_SLEEP(1),
    PROC_CALL(ArenaUi_StartArenaBattle),
    PROC_SLEEP(1),
    PROC_CALL(UnlockGame),
    PROC_CALL(UnlockBmDisplay),
    PROC_JUMP(gProcScr_ArenaUiResults),
    PROC_LABEL(2),
    PROC_SLEEP(1),
    PROC_CALL(sub_08014170),
    PROC_SLEEP(1),
    PROC_CALL(ArenaUi_OnEnd),
    PROC_CALL(ClearTalk),
    PROC_CALL(UnlockBmDisplay),
    PROC_CALL(RefreshBMapGraphics),
    PROC_CALL(StartMapSongBgm),
    PROC_CALL(StartMidFadeFromBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(UnlockGame),
    PROC_END,
};

SECTION(".rodata.08CE73FC")
const struct ProcCmd gProcScr_ArenaUiResults[] = {
    PROC_LABEL(1),
    PROC_CALL(ArenaUiResults_Init_A),
    PROC_CALL(LockGame),
    PROC_CALL(LockBmDisplay),
    PROC_SLEEP(0),
    PROC_START_CHILD(gProcScr_ArenaUiResultBgm),
    PROC_CALL(ArenaUi_Init),
    PROC_CALL(FadeInBlackSpeed20),
    PROC_SLEEP(0),
    PROC_CALL(ArenaUi_ResultsDialogue),
    PROC_SLEEP(0),
    PROC_CALL(ArenaUi_ShowGoldBoxOnVictoryOrDraw),
    PROC_SLEEP(0),
    PROC_LABEL(2),
    PROC_SLEEP(1),
    PROC_END_EACH(gProcScr_ArenaUiResultBgm),
    PROC_SLEEP(0),
    PROC_CALL_ARG(_FadeBgmOut, 2),
    PROC_CALL(sub_08014170),
    PROC_SLEEP(0),
    PROC_CALL(sub_080B2A50),
    PROC_CALL(ArenaUi_OnEnd),
    PROC_CALL(ClearTalk),
    PROC_CALL(UnlockBmDisplay),
    PROC_CALL(RefreshBMapGraphics),
    PROC_CALL(StartMapSongBgm),
    PROC_CALL(StartMidFadeFromBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(UnlockGame),
    PROC_END,
};
