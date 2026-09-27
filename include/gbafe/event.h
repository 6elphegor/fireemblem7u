#pragma once

#include "global.h"
#include "proc.h"

typedef uintptr_t EventScr;

#define NUM_BACKGROUNDS 0x5B

enum event_evbit_idx {
    EVENT_FLAG_UNITCAM = 1 << 0,
    EVENT_FLAG_TEXTSKIPPED = 1 << 1,
    EVENT_FLAG_SKIPPED = 1 << 2,
    EVENT_FLAG_DISABLESKIP = 1 << 3,
    EVENT_FLAG_DISABLETEXTSKIP = 1 << 4,
    EVENT_FLAG_ENDMAPMAIN = 1 << 5,
    EVENT_FLAG_NOAUTOCLEAR = 1 << 6,
    EVENT_FLAG_NOSKIPTALK = 1 << 7,
    EVENT_FLAG_SLOWTALK = 1 << 8,
};

struct EventProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ EventScr const * script_start;
    /* 30 */ EventScr const * script;
    /* 34 */ EventScr const * script_return;     // script_start of the calling script (0 if none)
    /* 38 */ EventScr const * script_return_pc;  // script position of the calling script

    /* 3C */ void (* skip_func)(void);
    /* 40 */ void (* idle_func)(struct EventProc * proc);
    /* 44 */ struct UnitDefinition const * unit_info;
    /* 48 */ int talk_auto_msg;
    /* 4C */ s8 background;
    /* 4D */ bool unk_4D;
    /* 4E */ u8 unk_4E;
    /* 4F */ u8 map_change_param;
    /* 50 */ u16 sleep_duration;
    /* 52 */ s16 unk_52;

    STRUCT_PAD(0x54, 0x55);

    /* 55 */ u8 pid_param; // TODO: what is this exactly?
    /* 56 */ u16 ignore_count;
    /* 58 */ int unk_58;
    /* 5C */ u16 iid_param;
    /* 5E */ u16 flags;

    STRUCT_PAD(0x60, 0x68);

    /* 68 */ s8 text_speed;
};

enum event_func_ret_idx {
    EVENT_CMDRET_CONTINUE,
    EVENT_CMDRET_JUMPED,
    EVENT_CMDRET_YIELD,
    EVENT_CMDRET_REPEAT,
};

#define EVT_CMD_ARGV(scr) ((const s16 *)(scr) + 1)

#define SCR_LO16(script_word) (((script_word) & 0x0000FFFF) >> 0)
#define SCR_HI16(script_word) (((script_word) & 0xFFFF0000) >> 16)

#define SCR_LO16_SIGN(script_word) (SCR_LO16(script_word) & 0x8000 ? -1 : SCR_LO16(script_word))
#define SCR_HI16_SIGN(script_word) (SCR_HI16(script_word) & 0x8000 ? -1 : SCR_HI16(script_word))

#define LO8(half) (((half) & 0x00FF) >> 0)
#define HI8(half) (((half) & 0xFF00) >> 8)

// sub_800A604
// void LoadUnitCore(struct UnitDefinition * udef, );
// FakeLoadUnit
// sub_0800A71C
// sub_0800A7A0
// sub_0800A7BC
// sub_0800A7CC
// ParsePopupInstAndGetLen
// GeneratePopupText
// sub_0800AA18
// sub_0800AA4C
// PopupProc_MaybeSetVolume
// PopupProc_PlaySound
// PopupProc_MaybeResetVolume
// PopupIconUpdateProc_Loop
// sub_0800AB38
// PopupProc_WaitForPress
// sub_0800ACC4
// sub_800ACC4
// sub_0800AD28
// SetPopupNumber
// NewPopup_Simple
// NewPopupCore
// sub_800AD50
// sub_0800ADB8
// sub_0800ADD0
void Event_FadeOutOfBackgroundTalk(struct EventProc * proc);
void Event_FadeOutOfSkip(struct EventProc * proc);
// sub_800ADAC
// sub_800ADC0
// sub_800ADDC
// sub_0800AE50
// sub_0800AE8C
ProcPtr StartEvent();
// StartEventLocking
// StartEventInternal
// sub_0800B0F0
// sub_800B040
// sub_0800B110
// sub_0800B130
// sub_0800B180
// sub_0800B198
// Event_IsSkipAllowed
// Event_DarkenThenFunc
// EventDarkenThenFunc_OnInit
// EventDarkenThenFunc_OnLoop
// EventDarkenThenFunc_StartDarken
// EventDarkenThenFunc_StepDarken
// Event_BeginSkip
// Event_MainLoop
// Event_WaitForFaceEnd
// EvtCmd_Sleep
// EvtCmd_SleepFast
// EvtCmd_SleepText
// EvtCmd_Background
// EvtCmd_BackgroundLynModeDeath
// EvtCmd_BackgroundRandom
// EvtCmd_BackgroundMore
// EvtCmd_ClearTalk
// EvtCmd_ClearSkip
// EvtCmd_ClearSkipFadeToPrep
// EvtCmd_FadeFromOpening
void DisplayBackground(int background);
void DisplayBackgroundNoClear(int background);
// EventStartTalk
// EvtCmd_Talk
// EvtCmd_TalkOpaque
// EvtCmd_TalkByMode
// sub_800B994
// EvtCmd_TalkMore
// EvtCmd_TalkMoreByMode
// EvtCmd_TalkAuto
// Event14_TalkContinue
// EvtCmd_TalkGeneric
// EvtCmd_TalkByTactRank
// EvtCmd_TalkByTactGender
// EvtCmd_TalkMoreByTactGender
// sub_800BBF8
// sub_800BC48
// sub_800BC98
// sub_800BCE4
// EventEndTalk
// Event20
// EvtCmd_CameraPosition
// sub_800BE6C
// EvtCmd_CameraLeader
// CanDisplayUnitMovement
// EvtCmd_MovePosition
// EvtCmd_MovePositionSpeed
// EvtCmd_MovePid
// EvtCmd_MovePidSpeed
// EvtCmd_MovePidOneStepSpeed
// EvtCmd_MovePidScript
// EvtCmd_MovePositionScript
// EvtCmd_MovePidNextTo
// EvtCmd_MoveLeader
// EvtCmd_MovePidByFaction_PositionSpeed_Script
// EvtCmd_MovePidByFaction_Script_Script
// EvtCmd_MovePositionInstant
// EvtCmd_MovePidInstant
// EvtCmd_SavePositionPid
// EvtCmd_MovePidToSavedPosition
// TryMoveUnit
// TryMoveUnitDisplayed
// DisplayMovement
// nullsub_26
// WaitForMu_OnLoop
// Event30_LoadUnit
// Event31_LoadUnit
// EvtCmd_LoadUnitsFiltered
// EvtCmd_LoadUnitsParty
// EvtCmd_LoadUnitsPartyIfScenario
// EvtCmd_LoadUnitsByMode
// EvtCmd_LoadUnitsPartyByMode
// GetNextAvailableBlueUnitId
// UnitInfoRequiresNoMovement
// EventUnitLoadWait
// EventUnitLoadAliveWait
// EventLoadUnitsAsParty
// EvtCmd_LoadUnit
// EventMovementWait
// EvtCmd_WaitForMovement
// EvtCmd_UnitCameraOn
// EvtCmd_UnitCameraOff
// Event3C_ASMC1
// Event3D_ASMC2
// Event3E_ASMC3
// Event3F_ASMC4
// Event40_ASMC5
// Event41_Halt
// Event42_Nop
// EventGotoLabel
// Event43_Goto
// EvtCmd_GotoIfnAlive
// EvtCmd_GotoIfnInTeam
// sub_800D478
// sub_800D484
// sub_800D4A0
// sub_800D4AC
// EvtCmd_GotoIfySkip
// EvtCmd_GotoIfySkipText
// sub_800D510
// sub_800D57C
// sub_800D5E8
// EvtCmd_GotoIfyEliwoodMode
// EvtCmd_GotoIfyHectorMode
// EvtCmd_GotoIfyDifficulty
// sub_800D704
// sub_800D724
// sub_800D744
// EvtCmd_GotoIfnDeadAndFlagOnce
// EvtCmd_GotoIfyTurnCountReached
// EvtCmd_GotoIfxDeployed
// EvtCmd_Jump
// sub_800D834
// sub_800D840
// sub_800D858
// sub_800D864
// EvtCmd_GiveItem
// EvtCmd_GiveItemToPid
// EvtCmd_GiveItemToLeader
// EventGiveItem
// EvtCmd_MapChange
// EvtCmd_MapChangeWithAutoWaterShadows
// EvtCmd_MapChangeInstant
// EvtCmd_MapChangeInstantNoRender
// EvtCmd_ReRenderMap
// EvtCmd_MapChangePosition
// EvtCmd_SetFaction
// EvtCmd_FlashCursorPosition
// EvtCmd_FlashCursorPid
// EventFlashCursorWait
// EventFlashCursor_OnInit
// EventFlashCursor_OnLoop
// EvtCmd_PutCursor
// EventCursor_Loop
// EvtCmd_ClearCursors
// EventIsPidBlueForDisable
// EvtCmd_RemovePosition
// EvtCmd_RemovePid
// EvtCmd_RemovePositionDisplayed
// EvtCmd_RemovePidDisplayed
// EventRemoveDisplayedWait
// EvtCmd_HidePosition
// EvtCmd_HidePid
// EvtCmd_DisablePid
// EvtCmd_EnablePid
// EvtCmd_SetState
// EvtCmd_ClearState
// EventSetUnitAi
// EvtCmd_SetAiPid
// EvtCmd_SetAiPosition
// sub_800E23C
// sub_800E24C
// EvtCmd_PlayBgm
// EvtCmd_PlaySongExt
// EvtCmd_OverrideBgm
// EvtCmd_RestoreBgm
// EvtCmd_FadeBgmIn
// EvtCmd_FadeBgmOut
// EvtCmd_LowerBgmVolume
// EvtCmd_RestoreBgmVolume
// EvtCmd_PlaySe
// EventEndBattleMap
// EvtCmd_NextChapter
// Event80_CompleteGame
// EvtCmd_EndLynCampaign
// EvtCmd_SetMap
// EvtCmd_SetMapId
// Event_EndSkip
// EvtCmd_NoSkip
// EvtCmd_NoSkipTalk
// EvtCmd_NoSkipTalkSlow
// EvtCmd_YesSkip
// EvtCmd_SilentSkip
// EvtCmd_NoSkipUnlessNewGamePlus
// EvtCmd_NoSkipTalkSlowUnlessNewGamePlus
// EvtCmd_NoSkipSlowUnlessNewGamePlus
// sub_800E6D4
// sub_800E6F8
// EvtCmd_LynModeDeathFadeToBlack
// sub_800E750
// sub_800E774
// Event90_800E798
// sub_800E7A4
// Event93
// sub_800E7D8
// EvtCmd_GiveGold
// EvtCmd_FightScript
// EventScriptedBattleWait
// EventScriptedBattleWaitB
// EvtCmd_SetNoReloadGfx
// EvtCmd_OnSkipFunc
// EvtCmd_ClearOnSkipFunc
// EvtCmd_SetWeatherWithFade
// EvtCmd_SetWeather
// EventWeatherChangeWithFade_SetWeather
// EvtCmd_SetVision
// sub_800EB0C
// EvtCmd_BreakItemSeal
// sub_800EB3C
// Event00_
// Event01
void EventClearTalkDisplayed(struct EventProc * proc);
void ClearTalk(void);
// nullsub_27
// nullsub_28
bool IsEventRunning();
// sub_800EC40
// sub_0800ED4C
void sub_0800ED68();
ProcPtr sub_0800ED78(int msg);
// CallMapSupportEvent
// sub_0800EDAC
// CallSupportViewerEvent
// sub_0800EDE0
// sub_800ED10
// sub_0800EE28
// StartPopup_800EE4C
// StartPopup_800EE90
// StartPopup_800EEB0
// StartStoleItemPopup
// sub_0800EF3C
// StartGiveItem
// GiveItem_DoPopup
// GiveItem_DoGiveItem
// sub_0800EFCC
// sub_0800EFE8
// sub_800EF1C
// sub_0800F028
// sub_0800F044
// sub_0800F06C
void sub_0800F08C();
int GetChapterAllyUnitCount(void);
// InitPlayerUnitPositionsForPrepScreen
// SyncUnitDeploymentState
// AssignUnitToFreeDeploySlot
// nullsub_29
// sub_800F188
// Event_SetExitMap
// Event_SetEnterMap
// sub_800F224
// sub_0800F324
// sub_800F23C
// sub_800F250
// sub_800F264
// sub_0800F36C
// sub_0800F3D4
// sub_800F324
// sub_800F330
// sub_800F384
// sub_0800F494
// sub_800F3F8
// sub_0800F540
// sub_0800F560
// nullsub_13
// nullsub_14
// sub_0800F5B4
// nullsub_15
// nullsub_16
// EventFaceDeamonDelete
// sub_0800F61C
// sub_0800F65C
// sub_0800F67C
// sub_800F5A8
// sub_0800F6B8
// sub_0800F730
// sub_0800F770
// sub_0800F7B8
// sub_800F708
// sub_800F710
// sub_800F72C
// sub_800F734
// sub_0800F844
// sub_0800F884
// sub_0800F8C4
// sub_0800F904
// sub_0800F944
// sub_0800F998
// sub_0800F9B0
// sub_800F93C
// sub_0800FA50
// sub_800F9DC
// sub_0800FAF0
// sub_800FA74
// sub_800FA84
// sub_800FA94
// sub_800FAA0
// EvtCmd_MenuOverrideDisable
// sub_800FAE4
// EvtCmd_BoxTalk
// EvtCmd_BoxTalkByTactGender
// sub_0800FD34
// EvtCmd_TutorialCursorsTargetMove
// EvtCmd_TutorialCursors
// sub_800FC88
// sub_800FCBC
// sub_800FD04
// sub_800FD78
// sub_0800FD7C
// EventCD_Warp
// sub_0800FE18
// sub_0800FE80
// sub_800FF38
// sub_800FF74
// sub_801001C
// sub_8010028
// sub_801006C
// sub_801009C
// sub_80100F0
// sub_801012C
// nullsub_30
// sub_80101C8
// sub_8010230
// nullsub_31
// sub_80102DC
// sub_8010310
// EventStartCgTalk
// EvtCmd_CgTalk
// sub_0800FFD0
// sub_08010010
// sub_80104B8
// EvtCmd_CgBackground
// sub_080100D0
// sub_8010550
// sub_80105A8
// sub_8010600
// sub_080101CC
// nullsub_32
// sub_08010464
// sub_0801048C
// sub_08010508
// sub_08010590
// sub_0801060C
// sub_8010ACC
// sub_08010690
// sub_080107A4
// sub_0801080C
// sub_08010860
// sub_8010D88
// sub_8010DC4
// sub_080109C4
// sub_8010EA0
// sub_08010A9C
// sub_08010AF8
// sub_8010F74
// sub_08010BE8
// sub_08010C94
// sub_08010CE0
// sub_08010D58
// sub_08010D98
// sub_08010DC4
// sub_08010DF8
// sub_8011298
// sub_08010F0C
// sub_08010FBC
// sub_8011458
// sub_08011054
// sub_0801109C
// sub_080110B8

struct ProcEventSnowStormfx {
    PROC_HEADER;

    /* 2C */ int paluse_duration;
    /* 30 */ int timer;
    /* 34 */ int bg_offset;

    STRUCT_PAD(0x38, 0x3C);

    /* 3C */ int x, y;
};

void EventSnowStormfx_Init(struct ProcEventSnowStormfx * proc);
void EventSnowStormfx_Loop1(struct ProcEventSnowStormfx * proc);
void EventSnowStormfx_Loop2(struct ProcEventSnowStormfx * proc);
void EventSnowStormfx_Loop3(struct ProcEventSnowStormfx * proc);
void EventSnowStormfx_End(struct ProcEventSnowStormfx * proc);
int EventDF_SnowStormfx(struct EventProc * proc);

// sub_80117DC
// sub_80118A8
// sub_8011900
// sub_8011954
// sub_80119C4
// EventE1

struct ProcEventThunderfx {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x30);

    /* 30 */ int unk30;

    STRUCT_PAD(0x34, 0x3C);

    /* 3C */ int x, y;
};

void EventThunderfx_Init(struct ProcEventThunderfx * proc);
void EventThunderfx_End(struct ProcEventThunderfx * proc);
int EventE2_Thunderfx(struct EventProc * proc);
bool EventThunderfxExists(void);

enum
{
    BGPAL_NINIANDISP = 0x0F,
    OBPAL_NINIANDISP = 0x05,
    OBCHR_NINIANDISP = 0x40,
};

struct ProcNinianAppear {
    PROC_HEADER;

    /* 2C */ int unk2C;
    /* 30 */ int timer;

    STRUCT_PAD(0x34, 0x3C);

    /* 3C */ int x, y;
    /* 44 */ ProcPtr approc[8];
};

void NinianAppear_Init(struct ProcNinianAppear * proc);
void NinianDisp_FadeIn_Unused(struct ProcNinianAppear * proc);
void NinianDisp_FadeOut_Unused(struct ProcNinianAppear * proc);
void NinianDisp_AnimLoopEnd_Unused(struct ProcNinianAppear * proc);
void NinianAppear_Anim1(struct ProcNinianAppear * proc);
void NinianAppear_LoopAnim1(struct ProcNinianAppear * proc);
void NinianAppear_EndAnim1(struct ProcNinianAppear * proc);
void NinianAppear_Anim2(struct ProcNinianAppear * proc);
void NinianAppear_LoadUnit(struct ProcNinianAppear * proc);
void NinianAppear_End(struct ProcNinianAppear * proc);
int EventE4_NinianDisplay(struct EventProc * proc);

struct ProcScreenFlashing {
    PROC_HEADER;
    int duration;
    int mask;
    int speed_fadein;
    int speed_fadeout;
    int timer;
    int r, b, g;
};

void ScreenFlash_Init(struct ProcScreenFlashing * proc);
void ScreenFlash_FadeIn(struct ProcScreenFlashing * proc);
void ScreenFlash_FadeOut(struct ProcScreenFlashing * proc);
void StartScreenFlashing(int mask, int duration, int speed_fadein, int speed_fadeout, int r, int g, int b, ProcPtr parent);
int EventE3_ScreenFlashing(struct EventProc * proc);

struct ProcEventFade {
    PROC_HEADER;
    STRUCT_PAD(0x29, 0x30);

    /* 30 */ u32 mask;
    /* 34 */ int speed, timer;
    /* 3C */ int r0, g0, b0;
    /* 48 */ int r1, g1, b1;
};

void EventFadefx_Init(struct ProcEventFade * proc);
void EventFadefx_Loop(struct ProcEventFade * proc);
void NewEventFadefx(u32 mask, int speed, int r, int g, int b, ProcPtr parent);
int EventE5_FadeSteps(struct EventProc * proc);
int EventE6_StartFade(struct EventProc * proc);
int EventE7_EndFade(struct EventProc * proc);

struct EventSpriteAnimConf {
    /* 00 */ const u16 * pal;
    /* 04 */ const u8  * img;
    /* 08 */ const u8  * ap_conf;
    /* 0C */ u16 oam0, oam2;
    /* 10 */ u8 pal_bank, pal_size;

    /* 12 */ u8 _pad_[2];
};

struct ProcEventSpriteAnim {
    PROC_HEADER;

    /* 2C */ int x, y;
    /* 34 */ ProcPtr approc;
    /* 38 */ const struct EventSpriteAnimConf * priv;
};

void EventSpriteAnim_Init(struct ProcEventSpriteAnim * proc);
void EventSpriteAnim_Loop(struct ProcEventSpriteAnim * proc);
void EventSpriteAnim_End(struct ProcEventSpriteAnim * proc);
int EventE8_StartSpriteAnim(struct EventProc * proc);
int EventE9_EndEventSpriteAnim(void);
bool EventSpriteAnimExists(void);

// EventEA_StartMixPalette
// EventEB_EndMixPalette
void EventLoadUnit(int pid, int jid, int x_load, int y_load, int x_move, int y_move, int faction_id, void * unk);
// sub_08011DAC
void sub_08011E28(ProcPtr proc);
void sub_08011F10(ProcPtr proc);
// EvtCmd_WarpLoadUnits

extern u32 CONST_DATA gUnk_08BFFE88;
// ??? gUnk_08BFFE8C
// ??? gUnk_08BFFE90
// ??? gUnk_08BFFEF0
// ??? gUnk_08BFFEF8
// ??? gUnk_08BFFF30
// ??? gUnk_08BFFF58
extern struct ProcCmd ProcScr_UnkEvt[];
// ??? gUnk_08C00018
// ??? gEventCmdTable
// ??? gUnk_08C0003C
// ??? gUnk_08C0024C

struct BackgroundInfo
{
    u8 const * img;
    u8 const * tsa;
    u16 const * pal;
};

extern struct BackgroundInfo gBackgroundTable[];

// ??? gUnk_08C00C18
// ??? gUnk_08C00C28
// ??? gUnk_08C00C48
// ??? gUnk_08C00C60
// ??? gUnk_08C00C88
// ??? gUnk_08C00CC8
// ??? gUnk_08C00CE8
// ??? gUnk_08C00CF8
// ??? gUnk_08C00D20
// ??? gUnk_08C00D44
// ??? gUnk_08C00D84
// ??? gUnk_08C00DC4
// ??? gUnk_08C00DEC
// ??? gUnk_08C00E24
// ??? gUnk_08C00E5C
// ??? gUnk_08C00E9C
// ??? gUnk_08C00EDC
// ??? gUnk_08C00F1C
// ??? gUnk_08C00F5C
// ??? gUnk_08C00F7C
// ??? gUnk_08C00FAC
// ??? gUnk_08C00FC4
// ??? gUnk_08C00FE0
// ??? gUnk_08C00FF8
// ??? gUnk_08C01004
// ??? gUnk_08C01020
// ??? gUnk_08C01094
// ??? gUnk_08C010BC
// ??? gUnk_08C010EC
// ??? gUnk_08C01124
// ??? gUnk_08C01144
// ??? gUnk_08C0115C
// ??? gUnk_08C0117C
// ??? gUnk_08C011CC
// ??? gUnk_08C01224
// ??? ProcScr_EventSnowStormfx
// ??? ProcScr_08C012BC
extern struct BmBgxConf CONST_DATA  BmBgfxConf_IceCrystal[];
// ??? gUnk_08DBAD14
// ??? gUnk_08DC0390

extern struct BmBgxConf CONST_DATA BmBgfxConf_EventThunder[];
extern struct ProcCmd CONST_DATA ProcScr_EventThunderfx[];
extern struct BmBgxConf CONST_DATA BmBgfxConf_NinianDisp[];
extern struct ProcCmd CONST_DATA ProcScr_NinianAppearfx[];
extern struct ProcCmd CONST_DATA ProcScr_ScreenFlashing[];
extern struct ProcCmd CONST_DATA ProcScr_EventFadefx[];
extern struct ProcCmd CONST_DATA ProcScr_EventSpriteAnim[];
extern struct ProcCmd CONST_DATA ProcScr_Event_08B92414[];

struct EventCmdInfo {
    int (* func)(struct EventProc * proc);
    int length; // in words
};

extern struct EventCmdInfo CONST_DATA gEventCmdTable[];

/* ---- event-engine.c (0x0800A618-0x0800B4C8) ---- */

enum popup_opcode_index {
    POPUP_OP_END,              /* 00 */
    POPUP_OP_SPACE,            /* 01 */
    POPUP_OP_ITEM_NAME,        /* 02 */
    POPUP_OP_ITEM_STR_CAP,     /* 03 */
    POPUP_OP_ITEM_STR,         /* 04 */
    POPUP_OP_UNIT_NAME,        /* 05 */
    POPUP_OP_MSG,              /* 06 */
    POPUP_OP_STR,              /* 07 */
    POPUP_OP_COLOR,            /* 08 */
    POPUP_OP_ITEM_ICON,        /* 09 */
    POPUP_OP_WTYPE_ICON,       /* 0A */
    POPUP_OP_NUM,              /* 0B */
    POPUP_OP_SOUND,            /* 0C */
};

struct PopupInstruction {
    u8 opcode;
    u32 data;
};

struct PopupProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ struct PopupInstruction const * inst;
    /* 30 */ int clock;
    /* 34 */ s8 x_tile_param;
    /* 35 */ s8 y_tile_param;
    /* 36 */ u8 window_kind;
    /* 37 */ u8 x_tile;
    /* 38 */ u8 y_tile;
    /* 39 */ u8 x_tile_size;
    /* 3A */ u8 y_tile_size;
    /* 3B */ u8 text_color;
    /* 3C */ STRUCT_PAD(0x3C, 0x3E);
    /* 3E */ u16 icon;
    /* 40 */ u16 icon_chr;
    /* 42 */ u8 icon_pal;
    /* 43 */ STRUCT_PAD(0x43, 0x44);
    /* 44 */ u8 icon_x;
    /* 45 */ STRUCT_PAD(0x45, 0x46);
    /* 46 */ u16 x_gfx_size;
    /* 48 */ u16 song;
};

struct PopupIconUpdateProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ int x;
    /* 30 */ int y;
    /* 34 */ STRUCT_PAD(0x34, 0x4A);
    /* 4A */ u16 oam2;
};

extern struct Unit * gPopupUnit;
extern u16 gPopupItem;
extern u32 gPopupNumber;

extern struct ProcCmd CONST_DATA ProcScr_Popup[];
extern struct ProcCmd CONST_DATA ProcScr_PopupUpdateIcon[];

void LoadUnitCore(struct UnitDefinition const * def, struct EventProc * proc);
void FakeLoadUnit(struct UnitDefinition const * def, struct Unit * unit);
void sub_0800A71C(struct UnitDefinition const * def, struct Unit * unit, struct EventProc * proc, bool move);
bool sub_0800A7A0(void);
int sub_0800A7BC(void);
int sub_0800A7CC(void);
int ParsePopupInstAndGetLen(struct PopupProc * proc);
void GeneratePopupText(struct PopupInstruction const * inst, struct Text text);
void PopupProc_Init(struct PopupProc * proc);
void PopupProc_PrepareGfx(struct PopupProc * proc);
void PopupProc_MaybeSetVolume(struct PopupProc * proc);
void PopupProc_PlaySound(struct PopupProc * proc);
void PopupProc_MaybeResetVolume(struct PopupProc * proc);
void PopupIconUpdateProc_Loop(struct PopupIconUpdateProc * proc);
void PopupProc_GfxDraw(struct PopupProc * proc);
void PopupProc_WaitForPress(struct PopupProc * proc);
void PopupProc_GfxClear(struct PopupProc * proc);
void sub_0800AD1C(struct Unit * unit); // SetPopupUnit
void sub_0800AD28(u16 item); // SetPopupItem
void SetPopupNumber(u32 num);
ProcPtr NewPopup_Simple(struct PopupInstruction const * inst, int clock, int window_kind, ProcPtr parent);
ProcPtr NewPopupCore(struct PopupInstruction const * inst, int clock, int window_kind, int icon_chr, int icon_pal, ProcPtr parent);
void EndPopups(void);
void sub_0800ADB8(void);
void sub_0800ADD0(ProcPtr proc);
void sub_0800AE04(struct EventProc * proc);
void sub_0800AE18(ProcPtr proc);
void sub_0800AE34(ProcPtr proc);
void sub_0800AE50(void);
void sub_0800AE8C(ProcPtr proc);
void EventForceSlowTextSpeed(struct EventProc * proc);
void sub_0800AF20(struct EventProc * proc);
ProcPtr sub_0800AF68(EventScr const * script, ProcPtr parent); // StartEventLocking
ProcPtr StartEventInternal(EventScr const * script, ProcPtr parent);
void sub_0800B0F0(struct EventProc * proc);
void sub_0800B104(void);
void sub_0800B110(struct EventProc * proc);
void sub_0800B130(struct EventProc * proc);
void sub_0800B180(struct EventProc * proc);
void sub_0800B198(struct EventProc * proc);
bool Event_IsSkipAllowed(struct EventProc * proc);
void Event_DarkenThenFunc(void (* func)(ProcPtr arg), ProcPtr arg);
void Event_BeginSkip(struct EventProc * proc);
void Event_MainLoop(struct EventProc * proc);
void Event_WaitForFaceEnd(struct EventProc * proc);
/* ---- end event-engine.c ---- */


/* ---- eventscr.c (0x0800B90C-0x0800D01C) ---- */
void EventStartTalk(struct EventProc * proc, int msg, bool init);
void EventEndTalk(struct EventProc * proc);
bool CanDisplayUnitMovement(struct EventProc * proc, int x, int y);
void TryMoveUnit(struct Unit * unit, int x, int y, u8 move_closest);
bool TryMoveUnitDisplayed(struct EventProc * proc, struct Unit * unit, int x, int y, u16 speed);
bool DisplayMovement(struct EventProc * proc, struct Unit * unit, u8 const * move_script, u16 speed);
int GetNextAvailableBlueUnitId(int uid);
bool UnitInfoRequiresNoMovement(struct UnitDefinition const * def);

/* ---- end eventscr.c ---- */


/* ---- eventscr2.c (0x0800D01C-0x0800E330) ---- */
void EventUnitLoadWait(struct EventProc * proc);
void EventUnitLoadAliveWait(struct EventProc * proc);
void EventLoadUnitsAsParty(struct EventProc * proc);
int EvtCmd_LoadUnit(struct EventProc * proc);
void EventMovementWait(struct EventProc * proc);
int EvtCmd_WaitForMovement(struct EventProc * proc);
int EvtCmd_UnitCameraOn(struct EventProc * proc);
int EvtCmd_UnitCameraOff(struct EventProc * proc);
int Event3C_ASMC1(struct EventProc * proc);
int Event3D_ASMC2(struct EventProc * proc);
int Event3E_ASMC3(struct EventProc * proc);
int Event3F_ASMC4(struct EventProc * proc);
int Event40_ASMC5(struct EventProc * proc);
int EvtCmd_Stop(struct EventProc * proc);
int EvtCmd_Label(struct EventProc * proc);
int EventGotoLabel(struct EventProc * proc, int label);

int EvtCmd_GotoIfyFlag(struct EventProc * proc);
int EventGiveItem(struct Unit * unit, u16 iid, struct EventProc * proc);
void EventFlashCursorWait(struct EventProc * proc);
void EventRemoveDisplayedWait(struct EventProc * proc);
bool EventIsPidBlueForDisable(u8 pid);
void EventSetUnitAi(struct Unit * unit, u8 ai1, u8 ai2, int unused);
/* ---- end eventscr2.c ---- */


/* ---- eventscr3.c (0x0800E330-0x0800EC40) ---- */

struct EventWeatherChangeProc {
    /* 00 */ PROC_HEADER;
    STRUCT_PAD(0x29, 0x64);
    /* 64 */ s16 weather;
};

int EvtCmd_SetFlag(struct EventProc * proc);
int EvtCmd_ClearFlag(struct EventProc * proc);
int EvtCmd_PlayBgm(struct EventProc * proc);
int EvtCmd_PlaySongExt(struct EventProc * proc);
int EvtCmd_OverrideBgm(struct EventProc * proc);
int EvtCmd_RestoreBgm(struct EventProc * proc);
int EvtCmd_FadeBgmIn(struct EventProc * proc);
int EvtCmd_FadeBgmOut(struct EventProc * proc);
int EvtCmd_LowerBgmVolume(struct EventProc * proc);
int EvtCmd_RestoreBgmVolume(struct EventProc * proc);
int EvtCmd_PlaySe(struct EventProc * proc);
int EventEndBattleMap(struct EventProc * proc);
int EvtCmd_NextChapter(struct EventProc * proc);
int Event80_CompleteGame(struct EventProc * proc);
int EvtCmd_EndLynCampaign(struct EventProc * proc);
int EvtCmd_SetMap(struct EventProc * proc);
int EvtCmd_SetMapId(struct EventProc * proc);
void Event_EndSkip(struct EventProc * proc);
int EvtCmd_NoSkip(struct EventProc * proc);
int EvtCmd_NoSkipTalk(struct EventProc * proc);
int EvtCmd_NoSkipTalkSlow(struct EventProc * proc);
int EvtCmd_YesSkip(struct EventProc * proc);
int EvtCmd_SilentSkip(struct EventProc * proc);
int EvtCmd_NoSkipUnlessNewGamePlus(struct EventProc * proc);
int EvtCmd_NoSkipTalkSlowUnlessNewGamePlus(struct EventProc * proc);
int EvtCmd_NoSkipSlowUnlessNewGamePlus(struct EventProc * proc);
int EvtCmd_FadeToBlack(struct EventProc * proc);
int EvtCmd_FadeFromBlack(struct EventProc * proc);
int EvtCmd_LynModeDeathFadeToBlack(struct EventProc * proc);
int EvtCmd_FadeToWhite(struct EventProc * proc);
int EvtCmd_FadeFromWhite(struct EventProc * proc);
int EvtCmd_ExitMap(struct EventProc * proc);
int EvtCmd_EnterMap(struct EventProc * proc);
int sub_0800E8A4(struct EventProc * proc);
int sub_0800E8CC(struct EventProc * proc);
int EvtCmd_GiveGold(struct EventProc * proc);
int EvtCmd_FightScript(struct EventProc * proc);
void EventScriptedBattleWait(struct EventProc * proc);
void EventScriptedBattleWaitB(struct EventProc * proc);
int EvtCmd_SetNoReloadGfx(struct EventProc * proc);
int EvtCmd_OnSkipFunc(struct EventProc * proc);
int EvtCmd_ClearOnSkipFunc(struct EventProc * proc);
int EvtCmd_SetWeatherWithFade(struct EventProc * proc);
int EvtCmd_SetWeather(struct EventProc * proc);
void EventWeatherChangeWithFade_SetWeather(struct EventWeatherChangeProc * proc);
int EvtCmd_SetVision(struct EventProc * proc);
int EvtCmd_SetVisionInstant(struct EventProc * proc);
int EvtCmd_BreakItemSeal(struct EventProc * proc);
int EvtCmd_EnqueueEvent(struct EventProc * proc);

/* ---- end eventscr3.c ---- */


/* ---- eventscr4.c (0x0800EC40-0x0800F9B0) ---- */
int Event00_(struct EventProc * proc);
int Event01(struct EventProc * proc);
bool sub_0800ED34(void);
void sub_0800ED4C(void);
ProcPtr CallMapSupportEvent(int msg, int song);
void sub_0800EDAC(struct EventProc * proc);
ProcPtr CallSupportViewerEvent(int msg);
void sub_0800EDE0(u16 item, ProcPtr parent);
void sub_0800EE04(u16 item, ProcPtr parent);
void sub_0800EE28(u16 item, ProcPtr parent);
void StartPopup_800EE4C(int num, ProcPtr parent);
void StartPopup_800EE90(int num, ProcPtr parent);
void StartPopup_800EEB0(struct Unit * unit, u16 item, ProcPtr parent);
void StartStoleItemPopup(u16 item, ProcPtr parent);
void sub_0800EF3C(ProcPtr parent);
void StartGiveItem(struct Unit * unit, u16 item, ProcPtr parent);
void sub_0800EFCC(u16 iid);
void sub_0800EFE8(u16 pid, u16 iid);
void sub_0800F010(int gold);
void sub_0800F028(u8 param);
void sub_0800F044(u16 iid, u8 param);
void sub_0800F06C(int gold, u8 param);
void InitPlayerUnitPositionsForPrepScreen(void);
void SyncUnitDeploymentState(void);
void AssignUnitToFreeDeploySlot(struct Unit * unit);
void sub_0800F27C(void);
void Event_SetExitMap(struct EventProc * proc);
void Event_SetEnterMap(struct EventProc * proc);

/* ---- end eventscr4.c ---- */

