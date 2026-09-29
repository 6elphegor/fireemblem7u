#include "gbafe.h"
#include "gbafe/bksel.h"
#include "gbafe/playerphase.h"
#include "gbafe/prep_sallycursor.h"
#include "gbafe/bmmind.h"
#include "gbafe/bmshop.h"
#include "gbafe/bmtrap.h"
#include "gbafe/sio_core.h"
#include "gbafe/unitlistscreen.h"
#include "gbafe/cgtext.h"

void BackToUnitMenu_CamWatch();
void BackToUnitMenu_RestartMenu();
void NewPrepScreenTraineePromotionManager();
void PrepAtMenuExists();
void PrepScreenMenuExists();
void PrepScreenTraineePromotionManagerExists();
void PrepUnitSwapProcExits();
void ResetUnitSpriteHover();
void StartChapterStatusScreen_FromPrep();
void TalkOpen_InitBlend();
void TalkOpen_OnEnd();
void TalkOpen_OnIdle();
void TalkOpen_PutTalkBubble();
extern const struct ProcCmd gProcScr_ADJUSTSFROMXI[];
void sub_0807CC38();
void sub_0808A92C();

void Arena_PlayArenaSong();
void Arena_PlayResultSong();
void LAUnitDeaths_EndMu();
void LAUnitDeaths_FindNextAndStart();
void LAUnitDeaths_Init();
void LAUnitDeaths_OnEnd();
extern const struct ProcCmd ProcScr_08CC5760[];
void sub_08099684();
void sub_08099728();
void sub_08099858();
void sub_080998B4();
void sub_080998D8();
void sub_08099928();
void sub_0809A9A8();
void sub_0809AB38();
void sub_0809AB7C();
void sub_0809ABC0();
void sub_0809AC20();
void sub_0809AC7C();
void sub_0809AC9C();
void sub_0809ACFC();
void sub_0809AD20();
void sub_0809AD64();
void sub_0809ADC0();
void sub_0809ADE4();
void sub_0809AE40();
void sub_0809AE84();
void sub_0809AEA0();
void sub_0809C12C();
void sub_0809C154();
void sub_0809C3F4();
void sub_0809C41C();
void sub_0809C44C();

SECTION(".rodata.08B90B9C")
const struct ProcCmd gProcScr_TalkOpen[] = {
    PROC_MARK(5),
    PROC_SET_END_CB(TalkOpen_OnEnd),
    PROC_CALL(TalkOpen_InitBlend),
    PROC_REPEAT(TalkOpen_PutTalkBubble),
    PROC_REPEAT(TalkOpen_OnIdle),
    PROC_END,
};

SECTION(".rodata.08B93374")
const struct ProcCmd ProcScr_PlayerPhase[] = {
    PROC_19,
    PROC_MARK(2),
    PROC_SLEEP(0),
    PROC_LABEL(0),
    PROC_CALL(PlayerPhase_Suspend),
    PROC_CALL(RefreshEntityMaps),
    PROC_CALL(RenderMap),
    PROC_CALL(RefreshUnitSprites),
    PROC_CALL(PlayerPhase_HandleAutoEnd),
    PROC_CALL(StartMapSongBgm),
    PROC_LABEL(9),
    PROC_CALL(StartMapWindows),
    PROC_CALL(ResetUnitSpriteHover),
    PROC_REPEAT(PlayerPhase_IdleLoop),
    PROC_LABEL(1),
    PROC_CALL(EndPlayerPhaseSideWindows),
    PROC_WHILE(IsMapFadeActive),
    PROC_CALL(SetAllUnitNotBackSprite),
    PROC_CALL(RefreshUnitSprites),
    PROC_CALL(PlayerPhase_InitUnitMovementSelect),
    PROC_SLEEP(1),
    PROC_REPEAT(PlayerPhase_RangeDisplayIdle),
    PROC_CALL(PlayerPhase_DisplayUnitMovement),
    PROC_REPEAT(PlayerPhase_WaitForUnitMovement),
    PROC_LABEL(2),
    PROC_REPEAT(PlayerPhase_ApplyUnitMovement),
    PROC_LABEL(7),
    PROC_WHILE_EXISTS(ProcScr_CamMove),
    PROC_CALL_2(PlayerPhase_PrepareAction),
    PROC_CALL_2(DoAction),
    PROC_CALL_2(HandlePostActionTraps),
    PROC_CALL_2(RunPotentialWaitEvents),
    PROC_CALL_2(EnsureCameraOntoActiveUnitPosition),
    PROC_CALL(PlayerPhase_FinishAction),
    PROC_GOTO(0),
    PROC_LABEL(4),
    PROC_WHILE(IsMapFadeActive),
    PROC_GOTO(1),
    PROC_LABEL(5),
    PROC_CALL(PlayerPhase_ReReadGameSaveGfx),
    PROC_LABEL(10),
    PROC_START_CHILD_BLOCKING(gProcScr_ADJUSTSFROMXI),
    PROC_GOTO(9),
    PROC_LABEL(6),
    PROC_CALL(PlayerPhase_ResumeRangeDisplay),
    PROC_GOTO(1),
    PROC_LABEL(8),
    PROC_SLEEP(0),
    PROC_CALL(EndAllMus),
    PROC_GOTO(0),
    PROC_LABEL(11),
    PROC_CALL(EndPlayerPhaseSideWindows),
    PROC_WHILE(IsMapFadeActive),
    PROC_CALL(DisplayActiveUnitEffectRange),
    PROC_REPEAT(PlayerPhase_RangeDisplayIdle),
    PROC_GOTO(9),
    PROC_LABEL(12),
    PROC_CALL(PlayerPhase_DisplayDangerZone),
    PROC_REPEAT(PlayerPhase_RangeDisplayIdle),
    PROC_GOTO(9),
    PROC_LABEL(3),
    PROC_WHILE(IsMapFadeActive),
    PROC_END,
};

SECTION(".rodata.08B93DDC")
const struct ProcCmd gProcScr_BackToUnitMenu[] = {
    PROC_CALL(LockGame),
    PROC_CALL(BackToUnitMenu_CamWatch),
    PROC_WHILE_EXISTS(ProcScr_CamMove),
    PROC_CALL(BackToUnitMenu_RestartMenu),
    PROC_CALL(UnlockGame),
    PROC_END,
};

SECTION(".rodata.08B96460")
const struct ProcCmd ProcScr_SALLYCURSOR[] = {
    PROC_19,
    PROC_SLEEP(8),
    PROC_CALL(InitPrepScreenUnitsAndCamera),
    PROC_SLEEP(1),
    PROC_CALL(PrepScreenProc_UpdateBgm),
    PROC_SLEEP(8),
    PROC_CALL(NewPrepScreenTraineePromotionManager),
    PROC_WHILE(PrepScreenTraineePromotionManagerExists),
    PROC_LABEL(2),
    PROC_CALL(StartPrepAtMenu),
    PROC_WHILE(PrepAtMenuExists),
    PROC_SLEEP(0),
    PROC_CALL(InitPrepScreenCursorPosition),
    PROC_GOTO(50),
    PROC_LABEL(51),
    PROC_CALL(StartMidFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(StartPrepAtMenu),
    PROC_WHILE(PrepAtMenuExists),
    PROC_SLEEP(0),
    PROC_LABEL(50),
    PROC_CALL(RefreshBMapGraphics),
    PROC_CALL(RefreshEntityMaps),
    PROC_CALL(RenderMap),
    PROC_CALL(RefreshUnitSprites),
    PROC_CALL(PrepScreenProc_InitMapMenu),
    PROC_CALL(PrepScreenProc_DimMapImmediate),
    PROC_CALL(StartMidFadeFromBlack),
    PROC_REPEAT(WaitForFade),
    PROC_GOTO(61),
    PROC_LABEL(0),
    PROC_CALL(sub_08030570),
    PROC_WHILE(sub_08013A1C),
    PROC_CALL(PrepScreenProc_StartMapMenu),
    PROC_LABEL(61),
    PROC_CALL(EnablePrepScreenMenu),
    PROC_WHILE(PrepScreenMenuExists),
    PROC_CALL(PrepScreenProc_StartBrightenMap),
    PROC_WHILE(sub_08013A1C),
    PROC_LABEL(9),
    PROC_WHILE(IsSubtitleHelpActive),
    PROC_CALL(RefreshEntityMaps),
    PROC_CALL(RenderMap),
    PROC_CALL(RefreshUnitSprites),
    PROC_CALL(StartMapWindows),
    PROC_REPEAT(PrepScreenProc_SetupMapIdle),
    PROC_REPEAT(PrepScreenProc_MapIdle),
    PROC_LABEL(1),
    PROC_CALL(HideMoveRangeGraphics),
    PROC_CALL(EndPlayerPhaseSideWindows),
    PROC_CALL(DisplayActiveUnitEffectRange),
    PROC_REPEAT(PrepScreenProc_MapMovementLoop),
    PROC_GOTO(9),
    PROC_LABEL(53),
    PROC_CALL(PrepScreenProc_SetCameraOnSupply),
    PROC_WHILE_EXISTS(ProcScr_CamMove),
    PROC_CALL(SALLYCURSOR_DeploySupplyUnit),
    PROC_GOTO(52),
    PROC_LABEL(54),
    PROC_CALL(PrepScreenProc_SetCameraOnSupply),
    PROC_WHILE_EXISTS(ProcScr_CamMove),
    PROC_CALL(SALLYCURSOR_RemoveSupplyUnit),
    PROC_GOTO(52),
    PROC_LABEL(52),
    PROC_CALL(InitMapChangeGraphicsIfFog),
    PROC_SLEEP(0),
    PROC_CALL(DisplayMapChangeIfFog),
    PROC_SLEEP(60),
    PROC_GOTO(0),
    PROC_LABEL(5),
    PROC_CALL(RefreshBMapGraphics),
    PROC_START_CHILD_BLOCKING(gProcScr_ADJUSTSFROMXI),
    PROC_GOTO(9),
    PROC_LABEL(6),
    PROC_CALL(sub_080310A8),
    PROC_GOTO(1),
    PROC_LABEL(3),
    PROC_CALL(EndPlayerPhaseSideWindows),
    PROC_CALL(PrepScreen_StartUnitSwap),
    PROC_WHILE_EXISTS(ProcScr_CamMove),
    PROC_REPEAT(PrepScreen_UnitSwapIdle),
    PROC_CALL(HideMoveRangeGraphics),
    PROC_CALL(PrepScreen_StartUnitSwapAnim),
    PROC_WHILE_EXISTS(ProcScr_CamMove),
    PROC_WHILE(PrepUnitSwapProcExits),
    PROC_CALL(InitMapChangeGraphicsIfFog),
    PROC_CALL(RefreshEntityMaps),
    PROC_CALL(RefreshUnitSprites),
    PROC_SLEEP(0),
    PROC_CALL(DisplayMapChangeIfFog),
    PROC_GOTO(9),
    PROC_LABEL(4),
    PROC_CALL(HideMoveRangeGraphics),
    PROC_WHILE_EXISTS(ProcScr_CamMove),
    PROC_CALL(sub_08030DFC),
    PROC_SLEEP(0),
    PROC_GOTO(9),
    PROC_LABEL(11),
    PROC_GOTO(1),
    PROC_LABEL(57),
    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(LockBmDisplay),
    PROC_CALL(EndPrepScreenMenu_),
    PROC_CALL(PrepScreenProc_StartConfigMenu),
    PROC_SLEEP(0),
    PROC_CALL(UnlockBmDisplay),
    PROC_GOTO(62),
    PROC_LABEL(56),
    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(LockBmDisplay),
    PROC_CALL(EndPrepScreenMenu_),
    PROC_CALL(StartChapterStatusScreen_FromPrep),
    PROC_SLEEP(0),
    PROC_CALL(UnlockBmDisplay),
    PROC_GOTO(62),
    PROC_LABEL(59),
    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(LockBmDisplay),
    PROC_CALL(EndPrepScreenMenu_),
    PROC_CALL(StartPrepSaveScreen),
    PROC_SLEEP(0),
    PROC_CALL(UnlockBmDisplay),
    PROC_CALL(sub_08031148),
    PROC_GOTO(62),
    PROC_LABEL(55),
    PROC_CALL(StartMidFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(PrepScreenProc_Cleanup),
    PROC_CALL(sub_0807CC38),
    PROC_SLEEP(0),
    PROC_CALL(SyncUnitDeploymentState),
    PROC_CALL(EndPrepScreen),
    PROC_BLOCK,
    PROC_LABEL(62),
    PROC_CALL(RefreshBMapGraphics),
    PROC_CALL(RefreshEntityMaps),
    PROC_CALL(RenderMap),
    PROC_CALL(RefreshUnitSprites),
    PROC_CALL(PrepScreenProc_StartMapMenu),
    PROC_CALL(PrepScreenProc_DimMapImmediate),
    PROC_CALL(StartFastFadeFromBlack),
    PROC_REPEAT(WaitForFade),
    PROC_GOTO(61),
    PROC_LABEL(60),
    PROC_CALL(StartMidFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(HideMoveRangeGraphics),
    PROC_CALL(LockBmDisplay),
    PROC_CALL(PrepScreenProc_StartShopScreen),
    PROC_SLEEP(0),
    PROC_CALL(UnlockBmDisplay),
    PROC_CALL(RefreshBMapGraphics),
    PROC_CALL(RefreshEntityMaps),
    PROC_CALL(RenderMap),
    PROC_CALL(RefreshUnitSprites),
    PROC_CALL(PrepScreenProc_UpdateBgm),
    PROC_CALL(StartMidFadeFromBlack),
    PROC_REPEAT(WaitForFade),
    PROC_GOTO(9),
    PROC_LABEL(58),
    PROC_SLEEP(0),
    PROC_CALL(PrepScreenProc_StartMapMenu),
    PROC_GOTO(61),
    PROC_END,
};

SECTION(".rodata.08B96D5C")
const struct ProcCmd gProcScr_BKSEL[] = {
    PROC_19,
    PROC_SET_END_CB(BattleForecast_OnEnd),
    PROC_CALL(ClearUi),
    PROC_SLEEP(0),
    PROC_CALL(BattleForecast_Init),
    PROC_LABEL(0),
    PROC_WHILE(Bksel_WaitMapEventEngine),
    PROC_CALL(BattleForecast_OnNewBattle),
    PROC_REPEAT(BattleForecast_LoopSlideIn),
    PROC_REPEAT(BattleForecast_LoopDisplay),
    PROC_REPEAT(BattleForecast_LoopSlideOut),
    PROC_GOTO(0),
    PROC_LABEL(1),
    PROC_REPEAT(BattleForecast_LoopSlideOut),
    PROC_END,
};

SECTION(".rodata.08B98B38")
const struct ProcCmd ProcScr_SIOCON[] = {
    PROC_19,
    PROC_19,
    PROC_CALL(SioInit),
    PROC_REPEAT(SioPollingMsgAndAck),
    PROC_END,
};

SECTION(".rodata.08B98B60")
const struct ProcCmd ProcScr_SIOVSYNC[] = {
    PROC_19,
    PROC_19,
    PROC_SLEEP(0),
    PROC_REPEAT(SioVsync_Loop),
    PROC_END,
};

SECTION(".rodata.08B98B88")
const struct ProcCmd ProcScr_SIOMAIN[] = {
    PROC_19,
    PROC_19,
    PROC_REPEAT(SioMain_Loop),
    PROC_END,
};

SECTION(".rodata.08CC32A4")
const struct ProcCmd ProcScr_UnitListScreen_PrepMenu[] = {
    PROC_19,
    PROC_SLEEP(1),
    PROC_CALL(UnitList_Init),
    PROC_CALL(StartMidFadeFromBlack),
    PROC_REPEAT(WaitForFade),
    PROC_LABEL(1),
    PROC_REPEAT(sub_0808A508),
    PROC_CALL(StartMidFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(UnitList_OnEnd),
    PROC_GOTO(4),
    PROC_LABEL(2),
    PROC_CALL(UnitList_StartPageChange),
    PROC_REPEAT(sub_0808A770),
    PROC_REPEAT(sub_0808A92C),
    PROC_GOTO(1),
    PROC_LABEL(3),
    PROC_CALL(UnitList_StartStatScreen),
    PROC_SLEEP(1),
    PROC_CALL(UnitList_ResetFromStatScreen),
    PROC_SLEEP(1),
    PROC_CALL(UnitList_ResetDispFromStatScreen),
    PROC_GOTO(1),
    PROC_LABEL(4),
    PROC_END,
};

SECTION(".rodata.08CE7280")
const struct ProcCmd gProcScr_GoldBox[] = {
    PROC_REPEAT(GoldBox_OnLoop),
    PROC_END,
};

SECTION(".rodata.08B99CD8")
const struct ProcCmd gUnk_08B99CD8[] = {
    PROC_CALL(LAUnitDeaths_Init),
    PROC_LABEL(0),
    PROC_CALL(LAUnitDeaths_FindNextAndStart),
    PROC_SLEEP(32),
    PROC_CALL(LAUnitDeaths_EndMu),
    PROC_GOTO(0),
    PROC_LABEL(1),
    PROC_CALL(LAUnitDeaths_OnEnd),
    PROC_END,
};

SECTION(".rodata.08CC5134")
const struct ProcCmd gUnk_08CC5134[] = {
    PROC_SLEEP(0),
    PROC_CALL(sub_08099684),
    PROC_CALL(sub_08099728),
    PROC_CALL_ARG(NewFadeIn, 8),
    PROC_WHILE(FadeInExists),
    PROC_SLEEP(30),
    PROC_CALL(sub_08099858),
    PROC_CALL(sub_08099928),
    PROC_SLEEP(0),
    PROC_REPEAT(sub_080998D8),
    PROC_LABEL(0),
    PROC_CALL_ARG(NewFadeOut, 8),
    PROC_WHILE(FadeOutExists),
    PROC_CALL(sub_080998B4),
    PROC_END,
};

SECTION(".rodata.08CC55A8")
const struct ProcCmd gUnk_08CC55A8[] = {
    PROC_SLEEP(0),
    PROC_CALL(sub_0809A9A8),
    PROC_CALL_ARG(NewFadeIn, 8),
    PROC_WHILE(FadeInExists),
    PROC_CALL(sub_0809AB38),
    PROC_WHILE(sub_808FFFC),
    PROC_WHILE(MusicProc4Exists),
    PROC_CALL(sub_0809AD64),
    PROC_LABEL(0),
    PROC_CALL(sub_808F2A0),
    PROC_CALL(sub_0809AE84),
    PROC_WHILE(CgTextExists),
    PROC_START_CHILD_BLOCKING(ProcScr_08CC5760),
    PROC_SLEEP(16),
    PROC_WHILE(MusicProc4Exists),
    PROC_CALL(sub_0809AB7C),
    PROC_SLEEP(0),
    PROC_CALL(sub_0809AD20),
    PROC_WHILE(sub_808FFFC),
    PROC_CALL(sub_0809ADC0),
    PROC_LABEL(2),
    PROC_CALL(sub_808F2A0),
    PROC_WHILE(CgTextExists),
    PROC_CALL(sub_0809AE40),
    PROC_WHILE(sub_808FFFC),
    PROC_GOTO(5),
    PROC_LABEL(1),
    PROC_CALL(sub_808F2A0),
    PROC_WHILE(CgTextExists),
    PROC_CALL(sub_0809ADE4),
    PROC_WHILE(sub_808FFFC),
    PROC_GOTO(5),
    PROC_LABEL(3),
    PROC_CALL_ARG(NewFadeIn, 8),
    PROC_WHILE(FadeInExists),
    PROC_CALL(sub_0809ABC0),
    PROC_WHILE(CgTextExists),
    PROC_GOTO(5),
    PROC_LABEL(4),
    PROC_CALL_ARG(NewFadeIn, 8),
    PROC_WHILE(FadeInExists),
    PROC_CALL(sub_0809AC20),
    PROC_WHILE(CgTextExists),
    PROC_SLEEP(30),
    PROC_CALL(sub_0809AC7C),
    PROC_SLEEP(8),
    PROC_CALL(sub_0809AC9C),
    PROC_WHILE(CgTextExists),
    PROC_GOTO(5),
    PROC_LABEL(5),
    PROC_CALL(sub_0809AEA0),
    PROC_CALL_ARG(NewFadeOut, 8),
    PROC_WHILE(FadeOutExists),
    PROC_CALL(sub_0809ACFC),
    PROC_END,
};

SECTION(".rodata.08CC58E4")
const struct ProcCmd gUnk_08CC58E4[] = {
    PROC_SLEEP(0),
    PROC_CALL(sub_0809C12C),
    PROC_CALL(sub_0809C154),
    PROC_CALL_ARG(NewFadeIn, 8),
    PROC_WHILE(FadeInExists),
    PROC_CALL(sub_0809C41C),
    PROC_REPEAT(sub_0809C44C),
    PROC_CALL_ARG(NewFadeOut, 8),
    PROC_WHILE(FadeOutExists),
    PROC_CALL(sub_0809C3F4),
    PROC_END,
};

SECTION(".rodata.08CE74EC")
const struct ProcCmd gProcScr_ArenaUiResultBgm[] = {
    PROC_CALL(Arena_PlayResultSong),
    PROC_SLEEP(210),
    PROC_CALL(Arena_PlayArenaSong),
    PROC_END,
};
