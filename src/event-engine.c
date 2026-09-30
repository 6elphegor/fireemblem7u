#include "gbafe.h"

bool sub_08079954(struct Unit * unit);
bool sub_08079A14(struct Unit * unit);

struct EventProc;
struct EventDarkenThenFuncProc;
int Event14_TalkContinue(struct EventProc * proc);
int Event20(struct EventProc * proc);
int Event43_Goto(struct EventProc * proc);
int EventCD_Warp(struct EventProc * proc);
void EventDarkenThenFunc_OnInit(struct EventDarkenThenFuncProc * proc);
void EventDarkenThenFunc_OnLoop(struct EventDarkenThenFuncProc * proc);
int EventEA_StartMixPalette(struct EventProc * proc);
int EventEB_EndMixPalette(struct EventProc * proc);
int EvtCmd_Background(struct EventProc * proc);
int EvtCmd_BackgroundLynModeDeath(struct EventProc * proc);
int EvtCmd_BackgroundMore(struct EventProc * proc);
int EvtCmd_BackgroundRandom(struct EventProc * proc);
int EvtCmd_BgFade(struct EventProc * proc);
int EvtCmd_BgFadeIn(struct EventProc * proc);
int EvtCmd_BgFadeToMap(struct EventProc * proc);
int EvtCmd_BoxTalk(struct EventProc * proc);
int EvtCmd_BoxTalkByTactGender(struct EventProc * proc);
int EvtCmd_BrownTextBox(struct EventProc * proc);
int EvtCmd_CameraLeader(struct EventProc * proc);
int EvtCmd_CameraPid(struct EventProc * proc);
int EvtCmd_CameraPosition(struct EventProc * proc);
int EvtCmd_CgBackground(struct EventProc * proc);
int EvtCmd_CgTalk(struct EventProc * proc);
int EvtCmd_ClearCursors(struct EventProc * proc);
int EvtCmd_ClearMenuOverrides(struct EventProc * proc);
int EvtCmd_ClearSkip(struct EventProc * proc);
int EvtCmd_ClearSkipFadeToPrep(struct EventProc * proc);
int EvtCmd_ClearState(struct EventProc * proc);
int EvtCmd_ClearTalk(struct EventProc * proc);
int EvtCmd_ClearTalkBubble(struct EventProc * proc);
int EvtCmd_DisablePid(struct EventProc * proc);
int EvtCmd_EnablePid(struct EventProc * proc);
int EvtCmd_EndBrownTextBox(struct EventProc * proc);
int EvtCmd_FadeFromOpening(struct EventProc * proc);
int EvtCmd_FlashCursorPid(struct EventProc * proc);
int EvtCmd_FlashCursorPosition(struct EventProc * proc);
int EvtCmd_GiveItem(struct EventProc * proc);
int EvtCmd_GiveItemToLeader(struct EventProc * proc);
int EvtCmd_GiveItemToPid(struct EventProc * proc);
int EvtCmd_GotoIfnAlive(struct EventProc * proc);
int EvtCmd_GotoIfnDeadAndFlagOnce(struct EventProc * proc);
int EvtCmd_GotoIfnFlag(struct EventProc * proc);
int EvtCmd_GotoIfnFunc(struct EventProc * proc);
int EvtCmd_GotoIfnInTeam(struct EventProc * proc);
int EvtCmd_GotoIfnTalkYes(struct EventProc * proc);
int EvtCmd_GotoIfnTalkYes2(struct EventProc * proc);
int EvtCmd_GotoIfnTutorial(struct EventProc * proc);
int EvtCmd_GotoIfxDeployed(struct EventProc * proc);
int EvtCmd_GotoIfyActive(struct EventProc * proc);
int EvtCmd_GotoIfyDifficulty(struct EventProc * proc);
int EvtCmd_GotoIfyEliwoodMode(struct EventProc * proc);
int EvtCmd_GotoIfyFunc(struct EventProc * proc);
int EvtCmd_GotoIfyHectorMode(struct EventProc * proc);
int EvtCmd_GotoIfySkip(struct EventProc * proc);
int EvtCmd_GotoIfySkipText(struct EventProc * proc);
int EvtCmd_GotoIfyTurnCountReached(struct EventProc * proc);
int EvtCmd_HidePid(struct EventProc * proc);
int EvtCmd_HidePosition(struct EventProc * proc);
int EvtCmd_Jump(struct EventProc * proc);
int EvtCmd_LoadUnits(struct EventProc * proc);
int EvtCmd_LoadUnitsAlive(struct EventProc * proc);
int EvtCmd_LoadUnitsByMode(struct EventProc * proc);
int EvtCmd_LoadUnitsFiltered(struct EventProc * proc);
int EvtCmd_LoadUnitsParty(struct EventProc * proc);
int EvtCmd_LoadUnitsPartyByMode(struct EventProc * proc);
int EvtCmd_LoadUnitsPartyIfScenario(struct EventProc * proc);
int EvtCmd_MapChange(struct EventProc * proc);
int EvtCmd_MapChangeInstant(struct EventProc * proc);
int EvtCmd_MapChangeInstantNoRender(struct EventProc * proc);
int EvtCmd_MapChangePosition(struct EventProc * proc);
int EvtCmd_MapChangeWithAutoWaterShadows(struct EventProc * proc);
int EvtCmd_MenuOverrideDisable(struct EventProc * proc);
int EvtCmd_MenuOverrideEnable(struct EventProc * proc);
int EvtCmd_MenuOverrideHide(struct EventProc * proc);
int EvtCmd_MoveLeader(struct EventProc * proc);
int EvtCmd_MovePid(struct EventProc * proc);
int EvtCmd_MovePidByFaction_PositionSpeed_Script(struct EventProc * proc);
int EvtCmd_MovePidByFaction_Script_Script(struct EventProc * proc);
int EvtCmd_MovePidInstant(struct EventProc * proc);
int EvtCmd_MovePidNextTo(struct EventProc * proc);
int EvtCmd_MovePidOneStepSpeed(struct EventProc * proc);
int EvtCmd_MovePidScript(struct EventProc * proc);
int EvtCmd_MovePidSpeed(struct EventProc * proc);
int EvtCmd_MovePidToSavedPosition(struct EventProc * proc);
int EvtCmd_MovePosition(struct EventProc * proc);
int EvtCmd_MovePositionInstant(struct EventProc * proc);
int EvtCmd_MovePositionScript(struct EventProc * proc);
int EvtCmd_MovePositionSpeed(struct EventProc * proc);
int EvtCmd_PaletteFadeFromBlack(struct EventProc * proc);
int EvtCmd_PaletteFadeToBlack(struct EventProc * proc);
int EvtCmd_PutCursor(struct EventProc * proc);
int EvtCmd_ReRenderMap(struct EventProc * proc);
int EvtCmd_RemovePid(struct EventProc * proc);
int EvtCmd_RemovePidDisplayed(struct EventProc * proc);
int EvtCmd_RemovePosition(struct EventProc * proc);
int EvtCmd_RemovePositionDisplayed(struct EventProc * proc);
int EvtCmd_SavePositionPid(struct EventProc * proc);
int EvtCmd_SetAiPid(struct EventProc * proc);
int EvtCmd_SetAiPosition(struct EventProc * proc);
int EvtCmd_SetFaction(struct EventProc * proc);
int EvtCmd_SetFightScriptOverride(struct EventProc * proc);
int EvtCmd_SetKeyIgnore(struct EventProc * proc);
int EvtCmd_SetState(struct EventProc * proc);
int EvtCmd_SkipNIfnFunc(struct EventProc * proc);
int EvtCmd_SkipNIfyFunc(struct EventProc * proc);
int EvtCmd_Sleep(struct EventProc * proc);
int EvtCmd_SleepFast(struct EventProc * proc);
int EvtCmd_SleepText(struct EventProc * proc);
int EvtCmd_Talk(struct EventProc * proc);
int EvtCmd_TalkAuto(struct EventProc * proc);
int EvtCmd_TalkByFlag(struct EventProc * proc);
int EvtCmd_TalkByFunc(struct EventProc * proc);
int EvtCmd_TalkByMode(struct EventProc * proc);
int EvtCmd_TalkByTactGender(struct EventProc * proc);
int EvtCmd_TalkByTactRank(struct EventProc * proc);
int EvtCmd_TalkGeneric(struct EventProc * proc);
int EvtCmd_TalkMore(struct EventProc * proc);
int EvtCmd_TalkMoreByFlag(struct EventProc * proc);
int EvtCmd_TalkMoreByFunc(struct EventProc * proc);
int EvtCmd_TalkMoreByMode(struct EventProc * proc);
int EvtCmd_TalkMoreByTactGender(struct EventProc * proc);
int EvtCmd_TalkMoreGeneric(struct EventProc * proc);
int EvtCmd_TalkOpaque(struct EventProc * proc);
int EvtCmd_TalkSetFuncBroken(struct EventProc * proc);
int EvtCmd_TutorialCursors(struct EventProc * proc);
int EvtCmd_TutorialCursorsTargetMove(struct EventProc * proc);
int EvtCmd_WarpLoadUnits(struct EventProc * proc);
int sub_0800F36C(struct EventProc * proc);
int sub_0800F3D4(struct EventProc * proc);
int sub_0800F418(struct EventProc * proc);
int sub_0800F424(struct EventProc * proc);
int sub_0800F478(struct EventProc * proc);
int sub_0800F494(struct EventProc * proc);
int sub_0800F4EC(struct EventProc * proc);
int sub_0800F540(struct EventProc * proc);
int sub_0800F560(struct EventProc * proc);
int sub_0800F5B4(struct EventProc * proc);
int sub_0800F61C(struct EventProc * proc);
int sub_0800F65C(struct EventProc * proc);
int sub_0800F67C(struct EventProc * proc);
int sub_0800F69C(struct EventProc * proc);
int sub_0800F6B8(struct EventProc * proc);
int sub_0800F730(struct EventProc * proc);
int sub_0800F770(struct EventProc * proc);
int sub_0800F7B8(struct EventProc * proc);
int sub_0800F804(struct EventProc * proc);
int sub_0800F828(struct EventProc * proc);
int sub_0800F844(struct EventProc * proc);
int sub_0800F884(struct EventProc * proc);
int sub_0800F8C4(struct EventProc * proc);
int sub_0800F904(struct EventProc * proc);
int sub_0800F944(struct EventProc * proc);
int sub_0800F998(struct EventProc * proc);
int sub_0800FA30(struct EventProc * proc);
int sub_0800FAD0(struct EventProc * proc);
int sub_0800FD34(struct EventProc * proc);
int sub_0800FD7C(struct EventProc * proc);
int sub_0800FE18(struct EventProc * proc);
int sub_0800FE80(struct EventProc * proc);
int sub_0800FFD0(struct EventProc * proc);
int sub_08010010(struct EventProc * proc);
int sub_08010048(struct EventProc * proc);
int sub_080100D0(struct EventProc * proc);
int sub_08011D30(struct EventProc * proc);

CONST_DATA u8 gUnk_08B90C9C[] = {
    0, 0, 0, 0,
};

CONST_DATA struct ProcCmd ProcScr_Popup[] = {
    PROC_SET_END_CB(PopupProc_GfxClear),
    PROC_CALL(PopupProc_Init),
    PROC_SLEEP(10),
    PROC_CALL(PopupProc_PrepareGfx),
    PROC_CALL(PopupProc_MaybeSetVolume),
    PROC_YIELD,
    PROC_CALL(PopupProc_PlaySound),
    PROC_CALL(PopupProc_GfxDraw),
    PROC_REPEAT(PopupProc_WaitForPress),
    PROC_CALL(PopupProc_MaybeResetVolume),
    PROC_YIELD,
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_PopupUpdateIcon[] = {
    PROC_REPEAT(PopupIconUpdateProc_Loop),
};

CONST_DATA struct ProcCmd ProcScr_EventFadeOutOfBackgroundTalk[] = {
    PROC_CALL(sub_0800AE18),
    PROC_YIELD,
    PROC_CALL(sub_0800AE50),
    PROC_SLEEP(1),
    PROC_CALL(sub_0800AE34),
    PROC_YIELD,
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_08B90D40[] = {
    PROC_CALL(sub_0800AE18),
    PROC_YIELD,
    PROC_CALL(sub_0800AE50),
    PROC_SLEEP(1),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_EventFadeOutOfSkip[] = {
    PROC_YIELD,
    PROC_CALL(sub_0800AE8C),
    PROC_YIELD,
    PROC_END,
};

CONST_DATA struct ProcCmd gProcScr_EventEngine[] = {
    PROC_MARK(6),
    PROC_SET_END_CB(sub_0800B104),
    PROC_CALL(sub_0800B0F0),
    PROC_LABEL(0),
    PROC_REPEAT(Event_MainLoop),
    PROC_REPEAT(Event_WaitForFaceEnd),
    PROC_YIELD,
    PROC_CALL(sub_0800B110),
    PROC_YIELD,
    PROC_CALL(sub_0800B130),
    PROC_CALL(sub_0800B180),
    PROC_END,
    PROC_MARK(6),
    PROC_LABEL(0),
    PROC_REPEAT(Event_MainLoop),
    PROC_REPEAT(Event_WaitForFaceEnd),
    PROC_SLEEP(1),
    PROC_SLEEP(1),
    PROC_CALL(sub_0800B130),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_EventDarkenThenFunc[] = {
    PROC_CALL(EventDarkenThenFunc_OnInit),
    PROC_YIELD,
    PROC_REPEAT(EventDarkenThenFunc_OnLoop),
    PROC_END,
};

CONST_DATA struct EventCmdInfo gEventCmdTable[] = {
    { Event00_, 1 },
    { Event01, 1 },
    { EvtCmd_Sleep, 1 },
    { EvtCmd_SleepFast, 1 },
    { EvtCmd_SleepText, 1 },
    { EvtCmd_Background, 1 },
    { EvtCmd_BackgroundRandom, 1 },
    { EvtCmd_BackgroundMore, 1 },
    { EvtCmd_BackgroundLynModeDeath, 1 },
    { EvtCmd_ClearTalk, 1 },
    { EvtCmd_ClearSkip, 1 },
    { EvtCmd_ClearSkipFadeToPrep, 1 },
    { EvtCmd_FadeFromOpening, 1 },
    { EvtCmd_Talk, 2 },
    { EvtCmd_TalkOpaque, 2 },
    { EvtCmd_TalkByMode, 3 },
    { EvtCmd_TalkSetFuncBroken, 2 },
    { EvtCmd_TalkMore, 2 },
    { EvtCmd_TalkMoreByMode, 3 },
    { EvtCmd_TalkAuto, 1 },
    { Event14_TalkContinue, 1 },
    { EvtCmd_TalkGeneric, 2 },
    { EvtCmd_TalkMoreGeneric, 2 },
    { EvtCmd_TalkByTactRank, 2 },
    { EvtCmd_TalkByTactGender, 3 },
    { EvtCmd_TalkMoreByTactGender, 3 },
    { EvtCmd_TalkByFlag, 4 },
    { EvtCmd_TalkMoreByFlag, 4 },
    { EvtCmd_TalkByFunc, 4 },
    { EvtCmd_TalkMoreByFunc, 4 },
    { EvtCmd_ClearTalkBubble, 1 },
    { EvtCmd_CameraPosition, 1 },
    { EvtCmd_CameraPid, 1 },
    { EvtCmd_CameraLeader, 1 },
    { Event20, 1 },
    { EvtCmd_MovePosition, 3 },
    { EvtCmd_MovePositionSpeed, 4 },
    { EvtCmd_MovePositionScript, 3 },
    { EvtCmd_MovePid, 3 },
    { EvtCmd_MovePidSpeed, 4 },
    { EvtCmd_MovePidScript, 3 },
    { EvtCmd_MovePidNextTo, 3 },
    { EvtCmd_MoveLeader, 2 },
    { EvtCmd_MovePidByFaction_PositionSpeed_Script, 4 },
    { EvtCmd_MovePidByFaction_Script_Script, 4 },
    { EvtCmd_MovePidOneStepSpeed, 3 },
    { EvtCmd_MovePositionInstant, 3 },
    { EvtCmd_MovePidInstant, 3 },
    { EvtCmd_SavePositionPid, 3 },
    { EvtCmd_MovePidToSavedPosition, 3 },
    { EvtCmd_LoadUnits, 2 },
    { EvtCmd_LoadUnitsAlive, 2 },
    { EvtCmd_LoadUnitsFiltered, 3 },
    { EvtCmd_LoadUnitsByMode, 5 },
    { EvtCmd_LoadUnitsParty, 2 },
    { EvtCmd_LoadUnitsPartyIfScenario, 3 },
    { EvtCmd_LoadUnitsPartyByMode, 5 },
    { EvtCmd_LoadUnit, 3 },
    { EvtCmd_WarpLoadUnits, 2 },
    { EvtCmd_WaitForMovement, 1 },
    { EvtCmd_UnitCameraOn, 1 },
    { EvtCmd_UnitCameraOff, 1 },
    { Event3C_ASMC1, 2 },
    { Event3D_ASMC2, 2 },
    { Event3E_ASMC3, 2 },
    { Event3F_ASMC4, 2 },
    { Event40_ASMC5, 2 },
    { EvtCmd_Stop, 1 },
    { EvtCmd_Label, 2 },
    { Event43_Goto, 2 },
    { EvtCmd_GotoIfnAlive, 3 },
    { EvtCmd_GotoIfnInTeam, 3 },
    { EvtCmd_GotoIfyFunc, 3 },
    { EvtCmd_GotoIfnFunc, 3 },
    { EvtCmd_GotoIfySkip, 2 },
    { EvtCmd_GotoIfySkipText, 2 },
    { EvtCmd_GotoIfyFlag, 3 },
    { EvtCmd_GotoIfnFlag, 3 },
    { EvtCmd_GotoIfyActive, 3 },
    { EvtCmd_GotoIfyEliwoodMode, 2 },
    { EvtCmd_GotoIfyHectorMode, 2 },
    { EvtCmd_GotoIfyDifficulty, 2 },
    { EvtCmd_GotoIfnTalkYes, 2 },
    { EvtCmd_GotoIfnTalkYes2, 2 },
    { EvtCmd_GotoIfnTutorial, 2 },
    { EvtCmd_GotoIfnDeadAndFlagOnce, 4 },
    { EvtCmd_GotoIfyTurnCountReached, 2 },
    { EvtCmd_GotoIfxDeployed, 3 },
    { EvtCmd_Jump, 2 },
    { EvtCmd_SkipNIfyFunc, 2 },
    { EvtCmd_SkipNIfnFunc, 2 },
    { EvtCmd_GiveItem, 2 },
    { EvtCmd_GiveItemToPid, 3 },
    { EvtCmd_GiveItemToLeader, 2 },
    { EvtCmd_GiveGold, 2 },
    { EvtCmd_MapChange, 1 },
    { EvtCmd_MapChangePosition, 1 },
    { EvtCmd_MapChangeInstant, 1 },
    { EvtCmd_MapChangeInstantNoRender, 1 },
    { EvtCmd_ReRenderMap, 1 },
    { EvtCmd_MapChangeWithAutoWaterShadows, 1 },
    { EvtCmd_SetFaction, 3 },
    { EvtCmd_FlashCursorPosition, 2 },
    { EvtCmd_FlashCursorPid, 2 },
    { EvtCmd_PutCursor, 2 },
    { EvtCmd_ClearCursors, 1 },
    { EvtCmd_RemovePosition, 2 },
    { EvtCmd_RemovePid, 2 },
    { EvtCmd_RemovePositionDisplayed, 2 },
    { EvtCmd_RemovePidDisplayed, 2 },
    { EvtCmd_HidePosition, 2 },
    { EvtCmd_HidePid, 2 },
    { EvtCmd_DisablePid, 2 },
    { EvtCmd_EnablePid, 2 },
    { EvtCmd_SetState, 3 },
    { EvtCmd_ClearState, 3 },
    { EvtCmd_SetAiPid, 3 },
    { EvtCmd_SetAiPosition, 3 },
    { EvtCmd_SetFlag, 1 },
    { EvtCmd_ClearFlag, 1 },
    { EvtCmd_PlayBgm, 1 },
    { EvtCmd_OverrideBgm, 1 },
    { EvtCmd_RestoreBgm, 1 },
    { EvtCmd_FadeBgmIn, 2 },
    { EvtCmd_FadeBgmOut, 1 },
    { EvtCmd_LowerBgmVolume, 1 },
    { EvtCmd_RestoreBgmVolume, 1 },
    { EvtCmd_PlaySe, 1 },
    { EvtCmd_PlaySongExt, 2 },
    { EvtCmd_NextChapter, 1 },
    { Event80_CompleteGame, 1 },
    { EvtCmd_EndLynCampaign, 1 },
    { EvtCmd_SetMap, 4 },
    { EvtCmd_SetMapId, 1 },
    { EvtCmd_NoSkip, 1 },
    { EvtCmd_NoSkipTalk, 1 },
    { EvtCmd_NoSkipTalkSlow, 1 },
    { EvtCmd_YesSkip, 1 },
    { EvtCmd_SilentSkip, 1 },
    { EvtCmd_NoSkipUnlessNewGamePlus, 1 },
    { EvtCmd_NoSkipTalkSlowUnlessNewGamePlus, 1 },
    { EvtCmd_NoSkipSlowUnlessNewGamePlus, 1 },
    { EvtCmd_FadeToBlack, 1 },
    { EvtCmd_FadeFromBlack, 1 },
    { EvtCmd_FadeToWhite, 1 },
    { EvtCmd_FadeFromWhite, 1 },
    { EvtCmd_ExitMap, 1 },
    { EvtCmd_EnterMap, 1 },
    { EvtCmd_LynModeDeathFadeToBlack, 1 },
    { sub_0800E8A4, 4 },
    { sub_0800E8CC, 4 },
    { EvtCmd_FightScript, 5 },
    { EvtCmd_SetNoReloadGfx, 1 },
    { EvtCmd_OnSkipFunc, 2 },
    { EvtCmd_ClearOnSkipFunc, 1 },
    { EvtCmd_SetWeatherWithFade, 1 },
    { EvtCmd_SetWeather, 1 },
    { EvtCmd_SetVision, 1 },
    { EvtCmd_SetVisionInstant, 1 },
    { EvtCmd_BreakItemSeal, 4 },
    { EvtCmd_EnqueueEvent, 2 },
    { EvtCmd_SetKeyIgnore, 2 },
    { EvtCmd_SetFightScriptOverride, 2 },
    { EvtCmd_ClearMenuOverrides, 1 },
    { EvtCmd_MenuOverrideHide, 2 },
    { EvtCmd_MenuOverrideDisable, 2 },
    { EvtCmd_MenuOverrideEnable, 2 },
    { EvtCmd_BoxTalk, 3 },
    { EvtCmd_BoxTalkByTactGender, 4 },
    { sub_0800FD34, 1 },
    { EvtCmd_TutorialCursorsTargetMove, 1 },
    { EvtCmd_TutorialCursors, 2 },
    { sub_0800F36C, 4 },
    { sub_0800F3D4, 1 },
    { sub_0800F418, 1 },
    { sub_0800F424, 2 },
    { sub_0800F478, 1 },
    { sub_0800F560, 5 },
    { sub_0800F5B4, 4 },
    { sub_0800F61C, 2 },
    { sub_0800F65C, 1 },
    { sub_0800F67C, 1 },
    { sub_0800F69C, 1 },
    { sub_0800F6B8, 5 },
    { sub_0800F730, 3 },
    { sub_0800F770, 4 },
    { sub_0800F7B8, 3 },
    { sub_0800F804, 1 },
    { sub_0800F828, 2 },
    { sub_0800F9B0, 5 },
    { sub_0800FA30, 2 },
    { sub_0800FA50, 5 },
    { sub_0800FAD0, 2 },
    { sub_0800FAF0, 4 },
    { sub_0800F844, 3 },
    { sub_0800F884, 3 },
    { sub_0800F8C4, 3 },
    { sub_0800F904, 3 },
    { sub_0800F944, 4 },
    { sub_0800F998, 1 },
    { sub_0800F494, 4 },
    { sub_0800F4EC, 2 },
    { sub_0800F540, 1 },
    { sub_0800FD7C, 2 },
    { EventCD_Warp, 3 },
    { sub_0800FE18, 3 },
    { sub_0800FE80, 3 },
    { EvtCmd_CgTalk, 3 },
    { sub_0800FFD0, 4 },
    { sub_08010010, 3 },
    { sub_08010048, 1 },
    { EvtCmd_CgBackground, 1 },
    { sub_080100D0, 1 },
    { EvtCmd_PaletteFadeFromBlack, 1 },
    { EvtCmd_PaletteFadeToBlack, 1 },
    { EvtCmd_BrownTextBox, 3 },
    { EvtCmd_EndBrownTextBox, 1 },
    { EvtCmd_BgFadeIn, 3 },
    { EvtCmd_BgFade, 3 },
    { EvtCmd_BgFadeToMap, 2 },
    { EventDF_SnowStormfx, 2 },
    { EventE2_Thunderfx, 3 },
    { EventE3_ScreenFlashing, 5 },
    { EventE4_NinianDisplay, 3 },
    { EventE5_FadeSteps, 4 },
    { EventE6_StartFade, 1 },
    { EventE7_EndFade, 1 },
    { EventE8_StartSpriteAnim, 3 },
    { (int (*)(struct EventProc *)) EventE9_EndEventSpriteAnim, 1 },
    { EventEA_StartMixPalette, 4 },
    { EventEB_EndMixPalette, 1 },
    { sub_08011D30, 1 },
};

void LoadUnitCore(struct UnitDefinition const * def, struct EventProc * proc)
{
    struct Unit * unit;

    if (UnitInfoRequiresNoMovement(def))
        return;

    if (def->faction_id != FACTION_ID_BLUE)
    {
        int faction = FACTION_BLUE;

        unit = GetUnitFromCharIdAndFaction(def->pid, FACTION_BLUE);

        if (unit == NULL)
            goto load;

        switch (def->faction_id)
        {
        case FACTION_ID_BLUE:
            faction = FACTION_BLUE;
            break;

        case FACTION_ID_RED:
            faction = FACTION_RED;
            break;

        case FACTION_ID_GREEN:
            faction = FACTION_GREEN;
            break;
        }

        UnitChangeFaction(unit, faction);
    }

    unit = GetUnitFromCharId(def->pid);

    if (unit == NULL)
    {
    load:
        unit = LoadUnit(def);
        unit->state |= US_BIT22;
    }
    else
    {
        if (sub_08079954(unit))
        {
            UnitLoadItemsFromDefinition(unit, def);
            unit->state &= ~US_BIT16;
        }

        if (!sub_08079A14(unit) && (unit->state & US_DEAD))
            return;
    }

    unit->xPos = def->x_load;
    unit->yPos = def->y_load;

    if ((gPlaySt.chapterStateBits & PLAY_FLAG_HARD) && gPlaySt.chapterModeIndex == 3 && def->faction_id == FACTION_ID_RED)
        UnitApplyBonusLevels(unit, GetChapterInfo(gPlaySt.chapterIndex)->hard_bonus_levels);

    sub_0800A71C(def, unit, proc, TRUE);
    RefreshEntityMaps();
}

void FakeLoadUnit(struct UnitDefinition const * def, struct Unit * unit)
{
    sub_0800A71C(def, unit, NULL, FALSE);
    RefreshEntityMaps();
}

void sub_0800A71C(struct UnitDefinition const * def, struct Unit * unit, struct EventProc * proc, bool move)
{
    if (unit == NULL)
        return;

    if (move)
    {
        if (proc != NULL)
        {
            int hidden = unit->state & US_UNDER_A_ROOF;

            if (!hidden)
            {
                u32 pos_load, pos_move;

                TryMoveUnit(unit, def->x_load, def->y_load, FALSE);
                RefreshUnitSprites();

                pos_load = *(u16 const *) &def->x_load;
                pos_move = *(u16 const *) &def->x_move;

                if ((pos_load & 0xFFFF) != (pos_move & 0xFFFF))
                    TryMoveUnitDisplayed(proc, unit, def->x_move, def->y_move, hidden);

                return;
            }
        }

        TryMoveUnit(unit, def->x_move, def->y_move, TRUE);
        RefreshUnitSprites();
    }
    else
    {
        TryMoveUnit(unit, def->x_move, def->y_move, TRUE);
        RefreshUnitSprites();
    }
}

bool sub_0800A7A0(void)
{
    if (gpKeySt->held & R_BUTTON)
        return TRUE;

    return FALSE;
}

extern int gUnk_03000100;

int sub_0800A7BC(void)
{
    gUnk_03000100 = 0;
    return 1;
}

int sub_0800A7CC(void)
{
    return gUnk_08B90C9C[gUnk_03000100++];
}

int ParsePopupInstAndGetLen(struct PopupProc * proc)
{
    char str[0x10];
    int len = 0;
    struct PopupInstruction const * inst;

    for (inst = proc->inst; inst->opcode != POPUP_OP_END; inst++)
    {
        switch (inst->opcode)
        {
        case POPUP_OP_SOUND:
            proc->song = inst->data;
            break;

        case POPUP_OP_NUM:
            len += NumberToStringAscii(gPopupNumber, str) * 8;
            break;

        case POPUP_OP_ITEM_ICON:
            proc->icon_x = len;
            proc->icon = GetItemIconId(gPopupItem);
            ApplyIconPalette(0, proc->icon_pal);
            len += 0x10;
            break;

        case POPUP_OP_WTYPE_ICON:
            proc->icon_x = len;
            proc->icon = gPopupItem + 0x70;
            ApplyIconPalette(1, proc->icon_pal);
            len += 0x10;
            break;

        case POPUP_OP_MSG:
            len += GetStringTextLen(DecodeMsg(inst->data));
            break;

        case POPUP_OP_STR:
            len += GetStringTextLen((char const *) inst->data);
            break;

        case POPUP_OP_UNIT_NAME:
            len += GetStringTextLen(DecodeMsg(gPopupUnit->pCharacterData->nameTextId));
            break;

        case POPUP_OP_ITEM_NAME:
            len += GetStringTextLen(GetItemName(gPopupItem));
            break;

        case POPUP_OP_ITEM_STR_CAP:
            len += GetStringTextLen(GetItemNameWithArticle(gPopupItem, TRUE));
            break;

        case POPUP_OP_ITEM_STR:
            len += GetStringTextLen(GetItemNameWithArticle(gPopupItem, FALSE));
            break;

        case POPUP_OP_SPACE:
            len += inst->data;
            break;

        case POPUP_OP_COLOR:
        default:
            break;
        }
    }

    return len;
}

void GeneratePopupText(struct PopupInstruction const * inst, struct Text text)
{
    char str[0x10];

    for (; inst->opcode != POPUP_OP_END; inst++)
    {
        switch (inst->opcode)
        {
        case POPUP_OP_NUM:
            NumberToStringAscii(gPopupNumber, str);
            Text_DrawString(&text, str);
            break;

        case POPUP_OP_WTYPE_ICON:
        case POPUP_OP_ITEM_ICON:
            Text_Skip(&text, 0x10);
            break;

        case POPUP_OP_COLOR:
            Text_SetColor(&text, inst->data);
            break;

        case POPUP_OP_MSG:
            Text_DrawString(&text, DecodeMsg(inst->data));
            break;

        case POPUP_OP_STR:
            Text_DrawString(&text, (char const *) inst->data);
            break;

        case POPUP_OP_UNIT_NAME:
            Text_DrawString(&text, DecodeMsg(gPopupUnit->pCharacterData->nameTextId));
            break;

        case POPUP_OP_ITEM_NAME:
            Text_DrawString(&text, GetItemName(gPopupItem));
            break;

        case POPUP_OP_ITEM_STR_CAP:
            Text_DrawString(&text, GetItemNameWithArticle(gPopupItem, TRUE));
            break;

        case POPUP_OP_ITEM_STR:
            Text_DrawString(&text, GetItemNameWithArticle(gPopupItem, FALSE));
            break;

        case POPUP_OP_SPACE:
            Text_Skip(&text, inst->data);

        default:
            break;
        }
    }

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);
}

void PopupProc_Init(struct PopupProc * proc)
{
    proc->x_tile_param = -1;
    proc->y_tile_param = -1;
    proc->text_color = TEXT_COLOR_SYSTEM_WHITE;
    proc->icon = -1;
    proc->icon_x = 0;
    proc->song = 0;
}

void PopupProc_PrepareGfx(struct PopupProc * proc)
{
    InitTextFont(NULL, (void *) BG_VRAM + 0x2000 + GetBgChrOffset(0), 0x100, 0);
    ClearIcons();
    UnpackUiWindowFrameGraphics();

    SetBlendNone();
    SetWinEnable(0, 0, 0);

    proc->x_gfx_size = ParsePopupInstAndGetLen(proc);
}

void PopupProc_MaybeSetVolume(struct PopupProc * proc)
{
    if (proc->song != 0)
        StartBgmVolumeChange(0x100, 0x80, 0x10, proc);
}

void PopupProc_PlaySound(struct PopupProc * proc)
{
    if (proc->song != 0)
        PlaySoundEffect(proc->song);
}

void PopupProc_MaybeResetVolume(struct PopupProc * proc)
{
    if (proc->song != 0)
        StartBgmVolumeChange(0x80, 0x100, 0x10, proc);
}

void PopupIconUpdateProc_Loop(struct PopupIconUpdateProc * proc)
{
    PutOamHiRam(proc->x, proc->y, Sprite_16x16, proc->oam2);
}

void PopupProc_GfxDraw(struct PopupProc * proc)
{
    struct Text text;
    int icon_pos;
    int tile_len;
    int x, y;
    int width;

    u32 len;

    len = ParsePopupInstAndGetLen(proc);
    proc->x_gfx_size = len;
    tile_len = (len << 0x10) >> 0x13;

    if ((len & 7) != 0)
        tile_len++;

    icon_pos = (tile_len * 8 - proc->x_gfx_size) >> 1;

    if (proc->x_tile_param == -1)
        x = ((0x1E - tile_len) >> 1) - 1;
    else
        x = proc->x_tile_param;

    if (proc->y_tile_param != -1)
        y = proc->y_tile_param;
    else
        y = 8;

    width = tile_len + 2;
    DrawUiFrame2(x, y, width, 4, proc->window_kind);

    proc->x_tile = x;
    proc->y_tile = y;
    proc->x_tile_size = width;
    proc->y_tile_size = 3;
    proc->icon_x += icon_pos;

    InitText(&text, tile_len);
    Text_SetColor(&text, proc->text_color);
    Text_SetCursor(&text, icon_pos);
    GeneratePopupText(proc->inst, text);

    if (proc->icon != 0xFFFF)
        PutIconObjImg(proc->icon, proc->icon_chr);

    PutText(&text, gBg0Tm + TM_OFFSET(x + 1, y + 1));
    ResetText();

    if (proc->icon != 0xFFFF)
    {
        struct PopupIconUpdateProc * child = Proc_Start(ProcScr_PopupUpdateIcon, proc);

        child->x = (proc->x_tile + 1) * 8 + proc->icon_x;
        child->y = (proc->y_tile + 1) * 8;
        child->oam2 = proc->icon_chr | (proc->icon_pal & 0xF) << 0xC;
    }
}

void PopupProc_WaitForPress(struct PopupProc * proc)
{
    if (proc->clock < 0)
    {
        if (gpKeySt->pressed != 0)
        {
            Proc_Break(proc);
            return;
        }
    }
    else if (proc->clock != 0)
    {
        proc->clock--;

        if (proc->clock == 0)
            Proc_Break(proc);
    }
}

void PopupProc_GfxClear(struct PopupProc * proc)
{
    TmFillRect_thm(gBg0Tm + TM_OFFSET(proc->x_tile, proc->y_tile), proc->x_tile_size, proc->y_tile_size, 0);
    TmFillRect_thm(gBg1Tm + TM_OFFSET(proc->x_tile, proc->y_tile), proc->x_tile_size, proc->y_tile_size, 0);
    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);
}

void SetPopupUnit(struct Unit * unit)
{
    gPopupUnit = unit;
}

void SetPopupItem(u16 item)
{
    gPopupItem = item;
}

void SetPopupNumber(u32 num)
{
    gPopupNumber = num;
}

ProcPtr NewPopup_Simple(struct PopupInstruction const * inst, int clock, int window_kind, ProcPtr parent)
{
    return NewPopupCore(inst, clock, window_kind, 0x240, 4, parent);
}

ProcPtr NewPopupCore(struct PopupInstruction const * inst, int clock, int window_kind, int icon_chr, int icon_pal, ProcPtr parent)
{
    struct PopupProc * proc;

    if (parent != NULL)
        proc = Proc_StartBlocking(ProcScr_Popup, parent);
    else
        proc = Proc_Start(ProcScr_Popup, PROC_TREE_3);

    proc->clock = clock;
    proc->inst = inst;
    proc->window_kind = window_kind;
    proc->icon_chr = icon_chr;
    proc->icon_pal = icon_pal + 0x10;

    return proc;
}

void EndPopups(void)
{
    Proc_EndEach(ProcScr_Popup);
}

int EvtCmd_NoSkip(struct EventProc * proc);
int EvtCmd_NoSkipTalk(struct EventProc * proc);
int EvtCmd_NoSkipTalkSlow(struct EventProc * proc);
int EvtCmd_SilentSkip(struct EventProc * proc);
int EvtCmd_NoSkipUnlessNewGamePlus(struct EventProc * proc);
int EvtCmd_NoSkipTalkSlowUnlessNewGamePlus(struct EventProc * proc);
int EvtCmd_NoSkipSlowUnlessNewGamePlus(struct EventProc * proc);

bool FaceExists(void);
bool GetZero();
bool IsMapFadeActive(void);
void EndMapMain(void);
void sub_080143E0(void);
void SetMuMaxWalkSpeed(void);
bool IsWorldMapActive(void);

extern u8 gEventQueueCount;
extern EventScr const * gEventQueue[];

extern struct ProcCmd CONST_DATA ProcScr_SubtitleHelpDarkener[];

void sub_0800ADD0(ProcPtr proc);

void sub_0800ADB8(void)
{
    Proc_ForEach(ProcScr_UnkEvt, sub_0800ADD0);
}

void sub_0800ADD0(ProcPtr proc)
{
    EvtCmd_NoSkip(proc);
}

void Event_FadeOutOfBackgroundTalk(struct EventProc * proc)
{
    Proc_StartBlocking(ProcScr_EventFadeOutOfBackgroundTalk, proc);
}

void Event_FadeOutOfSkip(struct EventProc * proc)
{
    Proc_StartBlocking(ProcScr_EventFadeOutOfSkip, proc);
}

void sub_0800AE04(struct EventProc * proc)
{
    Proc_StartBlocking(ProcScr_08B90D40, proc);
}

void sub_0800AE18(ProcPtr proc)
{
    struct EventProc * parent = ((struct Proc *) proc)->proc_parent;

    if ((parent->flags & EVENT_FLAG_SKIPPED) == 0)
        StartMidLockingFadeToBlack(proc);
}

void sub_0800AE34(ProcPtr proc)
{
    struct EventProc * parent = ((struct Proc *) proc)->proc_parent;

    if ((parent->flags & EVENT_FLAG_SKIPPED) == 0)
        StartMidLockingFadeFromBlack(proc);
}

void sub_0800AE50(void)
{
    RefreshBMapGraphics();
    UnlockBmDisplay();
    ReleaseMus();

    TmFill(gBg0Tm, 0);
    TmFill(gBg1Tm, 0);
    EnableBgSync(BG0_SYNC_BIT);
    EnableBgSync(BG1_SYNC_BIT);

    ClearTalk();
}

void sub_0800AE8C(ProcPtr proc)
{
    struct EventProc * parent = ((struct Proc *) proc)->proc_parent;

    TmFill(gBg0Tm, 0);
    TmFill(gBg1Tm, 0);
    EnableBgSync(BG0_SYNC_BIT);
    EnableBgSync(BG1_SYNC_BIT);

    ClearTalk();
    RefreshBMapGraphics();

    if ((parent->flags & EVENT_FLAG_SKIPPED) != 0)
    {
        if (parent->unk_4D)
            StartLockingFadeFromBlack(0x20, proc);
    }
    else
    {
        StartMidLockingFadeFromBlack(proc);
    }
}

void EventForceSlowTextSpeed(struct EventProc * proc)
{
    if (proc->text_speed == -1)
    {
        proc->text_speed = gPlaySt.cfgTextSpeed;
        gPlaySt.cfgTextSpeed = 1;
    }
}

void sub_0800AF20(struct EventProc * proc)
{
    if (proc->text_speed != -1)
    {
        gPlaySt.cfgTextSpeed = proc->text_speed;
        proc->text_speed = -1;
    }
}

ProcPtr StartEvent(EventScr const * script)
{
    return StartEventInternal(script, PROC_TREE_3);
}

ProcPtr StartEventLocking(EventScr const * script, ProcPtr parent)
{
    return StartEventInternal(script, parent);
}

ProcPtr StartEventInternal(EventScr const * script, ProcPtr parent)
{
    struct EventProc * proc = Proc_Find(ProcScr_UnkEvt);

    if (proc != NULL)
    {
        gEventQueue[gEventQueueCount] = script;
        gEventQueueCount++;

        return proc;
    }

    gEventQueueCount = 0;
    gEventQueue[0] = NULL;

    if ((intptr_t) parent < 8)
        proc = Proc_Start(ProcScr_UnkEvt, parent);
    else
        proc = Proc_StartBlocking(ProcScr_UnkEvt, parent);

    proc->script_start = script;
    proc->script = script;
    proc->script_return = NULL;
    proc->script_return_pc = NULL;
    proc->idle_func = NULL;
    proc->skip_func = NULL;
    proc->talk_auto_msg = 0;
    proc->flags = EVENT_FLAG_UNITCAM;
    proc->sleep_duration = 0;
    proc->unk_4E = 0;
    proc->ignore_count = 0;
    proc->background = -1;
    proc->text_speed = -1;

    if (gDispIo.blend_ct.effect == BLEND_EFFECT_DARKEN && gDispIo.blend_y == 0x10)
        proc->unk_4D = TRUE;
    else
        proc->unk_4D = FALSE;

    BmMapFill(gBmMapOther, 0);

    switch (proc->script[0])
    {
    case 0x8A:
        proc->script++;
        EvtCmd_SilentSkip(proc);
        break;

    case 0x86:
        proc->script++;
        EvtCmd_NoSkip(proc);
        break;

    case 0x87:
        proc->script++;
        EvtCmd_NoSkipTalk(proc);
        break;

    case 0x88:
        proc->script++;
        EvtCmd_NoSkipTalkSlow(proc);
        break;

    case 0x8B:
        proc->script++;
        EvtCmd_NoSkipUnlessNewGamePlus(proc);
        break;

    case 0x8C:
        proc->script++;
        EvtCmd_NoSkipTalkSlowUnlessNewGamePlus(proc);
        break;

    case 0x8D:
        proc->script++;
        EvtCmd_NoSkipSlowUnlessNewGamePlus(proc);
        break;
    }

    return proc;
}

void sub_0800B0F0(struct EventProc * proc)
{
    LockGame();
    proc->idle_func = NULL;
}

void sub_0800B104(void)
{
    UnlockGame();
}

void sub_0800B110(struct EventProc * proc)
{
    if ((proc->flags & EVENT_FLAG_DISABLETEXTSKIP) == 0)
    {
        SetTextFont(NULL);
        InitSystemTextFont();
        UnpackUiWindowFrameGraphics();
    }
}

void sub_0800B130(struct EventProc * proc)
{
    proc->flags &= ~EVENT_FLAG_SKIPPED;

    if (gEventQueueCount != 0)
    {
        gEventQueueCount--;

        proc->idle_func = NULL;
        proc->script_start = gEventQueue[gEventQueueCount];
        proc->script = gEventQueue[gEventQueueCount];

        Proc_Goto(proc, 0);
    }
}

void sub_0800B180(struct EventProc * proc)
{
    if ((proc->flags & EVENT_FLAG_DISABLESKIP) != 0)
        EndMapMain();
}

void sub_0800B198(struct EventProc * proc)
{
    sub_080143E0();
    Proc_EndEach(gProcScr_TalkOpen);

    if (proc->background == -1)
        SetMuMaxWalkSpeed();
}

bool Event_IsSkipAllowed(struct EventProc * proc)
{
    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
        return FALSE;

    if ((proc->flags & EVENT_FLAG_NOAUTOCLEAR) != 0)
        return FALSE;

    if (IsBattleDeamonActive())
        return FALSE;

    return TRUE;
}

struct EventDarkenThenFuncProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ STRUCT_PAD(0x2C, 0x4C);
    /* 4C */ ProcPtr arg;
    /* 50 */ void (* func)(ProcPtr arg);
    /* 54 */ STRUCT_PAD(0x54, 0x64);
    /* 64 */ u16 speed;
    /* 66 */ s16 counter;
};
PROC_SIZE_CHECK(struct EventDarkenThenFuncProc);

void EventDarkenThenFunc_StartDarken(struct EventDarkenThenFuncProc * proc);
void EventDarkenThenFunc_StepDarken(struct EventDarkenThenFuncProc * proc);

void Event_DarkenThenFunc(void (* func)(ProcPtr arg), ProcPtr arg)
{
    struct EventDarkenThenFuncProc * proc = Proc_StartBlocking(ProcScr_EventDarkenThenFunc, arg);

    proc->func = func;
    proc->arg = arg;
}

void EventDarkenThenFunc_OnInit(struct EventDarkenThenFuncProc * proc)
{
    EventDarkenThenFunc_StartDarken(proc);
    proc->speed = 0x40;
}

void EventDarkenThenFunc_OnLoop(struct EventDarkenThenFuncProc * proc)
{
    void (* func)(ProcPtr arg) = proc->func;

    EventDarkenThenFunc_StepDarken(proc);

    if (gDispIo.blend_y == 0x10)
    {
        func(proc->arg);
        Proc_Break(proc);
    }
}

void EventDarkenThenFunc_StartDarken(struct EventDarkenThenFuncProc * proc)
{
    gDispIo.win_ct.win0_enable_blend = 1;
    gDispIo.win_ct.win1_enable_blend = 1;
    gDispIo.win_ct.wobj_enable_blend = 1;
    gDispIo.win_ct.wout_enable_blend = 1;

    SetBlendDarken(0);
    SetBlendTargetA(1, 1, 1, 1, 1);
    SetBlendBackdropA(1);

    proc->speed = 0x10;
    proc->counter = 0;
}

void EventDarkenThenFunc_StepDarken(struct EventDarkenThenFuncProc * proc)
{
    if (gDispIo.blend_y == 0x10)
    {
        Proc_End(proc);
        return;
    }

    proc->counter += proc->speed;

    if (proc->counter > 0xFF)
        proc->counter = 0x100;

    gDispIo.blend_y = (u16) proc->counter >> 4;
}

void Event_BeginSkip(struct EventProc * proc)
{
    proc->sleep_duration = 0;

    if (proc->skip_func != NULL)
        proc->skip_func();

    proc->flags |= EVENT_FLAG_SKIPPED;

    if (!GetZero())
    {
        if (IsWorldMapActive())
        {
            sub_0800B198(proc);
        }
        else if ((proc->flags & EVENT_FLAG_ENDMAPMAIN) == 0)
        {
            if (proc->unk_4D)
                sub_0800B198(proc);
            else
                Event_DarkenThenFunc((void (*)(ProcPtr)) sub_0800B198, proc);
        }

        proc->unk_4D = TRUE;
    }

    Proc_BlockEachMarked(5);

    if (proc->idle_func != NULL)
        proc->idle_func(proc);
}

void Event_MainLoop(struct EventProc * proc)
{
    if (Proc_Find(ProcScr_SubtitleHelpDarkener))
        return;

    if (IsSubtitleHelpActive())
        return;

    if (IsMapFadeActive())
        return;

    if (Event_IsSkipAllowed(proc) && (gpKeySt->pressed & START_BUTTON))
    {
        Event_BeginSkip(proc);
        return;
    }

    if (proc->sleep_duration != 0)
    {
        proc->sleep_duration--;

        if (proc->unk_4E && (gPlaySt.cfgGameSpeed || (gpKeySt->held & A_BUTTON)))
        {
            if (proc->sleep_duration != 0)
            {
                proc->sleep_duration--;

                if (proc->sleep_duration != 0)
                {
                    proc->sleep_duration--;

                    if (proc->sleep_duration != 0)
                        proc->sleep_duration--;
                }
            }
        }

        return;
    }

    if (proc->idle_func != NULL)
    {
        proc->idle_func(proc);
        return;
    }

    while (TRUE)
    {
        u16 cmd = *(u16 const *) proc->script;
        int ret;

        if (proc->ignore_count != 0)
        {
            proc->ignore_count--;
            ret = EVENT_CMDRET_CONTINUE;
        }
        else
        {
            ret = gEventCmdTable[cmd].func(proc);
        }

        if (ret == EVENT_CMDRET_JUMPED)
            continue;

        if (ret == EVENT_CMDRET_REPEAT)
            return;

        proc->script += gEventCmdTable[cmd].length;

        if (ret == EVENT_CMDRET_YIELD)
            return;
    }
}

void Event_WaitForFaceEnd(struct EventProc * proc)
{
    if ((proc->flags & EVENT_FLAG_DISABLETEXTSKIP) != 0 || !FaceExists())
        Proc_Break(proc);
}
