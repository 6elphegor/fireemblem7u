#pragma once

#include "global.h"
#include "proc.h"

// StartEventFromInfo
// SetEventInfoFlag
// SearchAvailableEvent
// SearchNextAvailableEvent
// sub_8078980
// EvCheck01_AFEV
// sub_80789AC
// sub_0807821C
// sub_8078A8C
// EvCheck02_TURN
// EvCheck03_CHAR
// EvCheck04_CHARASM
// EvCheck05_LOCA
// EvCheck06_VILL
// EvCheck07_CHES
// sub_8078D3C
// sub_8078D80
// EvCheck0A_SHOP
// EvCheck0B_AREA
// EvCheck0C_
// EvCheck0D_
// EvCheck0E_
// EventInfoCheckTalk
// CheckActiveUnitArea
// CheckAnyBlueUnitArea
// CheckAnyBlueUnitArea1
// CheckAnyBlueUnitArea2
// CheckAnyBlueUnitArea3
// CheckAnyBlueUnitArea4
// CheckAnyBlueUnitArea5
// CheckAnyBlueUnitArea6
// CheckAnyBlueUnitArea7
// CheckAnyRedUnitArea
bool CheckAvailableTurnEvent(void);
void StartAvailableTurnEvents(void);
// CheckForCharacterEvents
// StartCharacterEvent
// StartSupportTalk
// StartSupportViewerTalk
// GetSupportTalkSong
// GetAvailableTileEventCommand
// StartAvailableTileEvent
// sub_08078DFC
// sub_08078E10
// sub_80795FC
// sub_08078E54
// sub_8079688
// IsThereClosedChestAt
// StartAvailableChestTileEvent
// IsThereClosedDoorAt
// StartAvailableDoorTileEvent
// sub_08078F68
// sub_8079754
// ShouldCallEndEvent
// MaybeCallEndEvent_
// sub_08078FC8
// sub_08079004
// sub_0807905C
// sub_8079884
// sub_080790B8
// sub_080790BC
// sub_8079890
s8 sub_080790C4(void);
bool sub_08079104(void);
// CheckForWaitEvents
// RunWaitEvents
// CheckWin
// MaybeCallEndEvent
// sub_080791F0
// sub_08079214
// sub_08079280
// sub_080792C4
// sub_08079320
// sub_08079368
// sub_080793B0
// CheckBattleTalk
// StartBattleTalk
// CheckBattleDefeatTalk
// sub_08079568
// DisplayDefeatTalkForPid
// sub_08079704
// sub_8079F04
// nullsub_61
// nullsub_62
// sub_8079F10
// nullsub_63
// sub_8079F18
// sub_8079F1C
// nullsub_64
// nullsub_65
// nullsub_66
// nullsub_67
// nullsub_68
// SetChapterFlag
// CheckChapterFlag
// ClearChapterFlag
void ResetChapterFlags(void);
// SetPermanentFlag
// CheckPermanentFlag
// ClearPermanentFlag
void ResetPermanentFlags(void);
void SetFlag(int flag);
bool CheckFlag(int);
void ClearFlag(int flag);
u8 * GetPermanentFlagBits(void);
int GetPermanentFlagBitsSize(void);
u8 * GetChapterFlagBits(void);
int GetChapterFlagBitsSize(void);
// CheckDifficultMode
// sub_08079954
// sub_08079990
// sub_080799C8
// sub_08079A14
// CallEndEvent
// sub_08079A5C
// sub_08079A90
// sub_08079A9C
// sub_807A284
// sub_807A2E4
// sub_807A344
// sub_807A3A4
// sub_807A3DC
// sub_807A414
// sub_807A44C
// sub_807A494
// sub_807A4D0
// sub_807A4D4
// sub_807A4D8
// sub_807A4DC
// sub_807A4E0
// sub_807A4E4
// sub_807A4E8
// sub_807A4EC
// sub_807A4F0
// sub_807A4F4
// sub_807A4F8
// sub_807A4FC
// sub_807A500
// sub_807A504
// sub_807A508
// sub_807A50C
// sub_807A510
// sub_807A514
// sub_807A518
// sub_807A51C
// sub_807A520
// sub_807A524
// sub_08079AB4
// sub_807A564
// sub_08079AF4
// sub_08079B1C
// sub_08079B5C
// sub_08079BAC
// sub_807A648
// sub_807A654
// sub_807A670
// sub_08079C08
// sub_807A698
// sub_08079C30
// sub_08079C48
// sub_08079C64
// sub_08079CCC
s8 IsPidBlueDeployed(u8 pid);
// sub_08079D20
// sub_807A7A4
s8 IsPidBlue(u8 pid);
// sub_08079D7C
// sub_08079D8C
// sub_08079D9C
// sub_08079DAC
// sub_08079DBC
// sub_08079DCC
// sub_807A850
// sub_807A860
// sub_807A870
// sub_807A880
// sub_807A890
// sub_08079E2C
// sub_08079E3C
// sub_08079E4C
// sub_08079E5C
// sub_08079E6C
// sub_08079E7C
// sub_08079E8C
// sub_08079E9C
// sub_08079EAC
// sub_08079EBC
// sub_08079ECC
// sub_08079EDC
// sub_08079EEC
// sub_08079EFC
// sub_08079F0C
// sub_807A990
// sub_807A9C0
// sub_807A9D0
// sub_807A9E0
// AreAnyEnemyUnitsAlive
// GetAliveEnemyAmount
void sub_807AA5C(void);
// IsCharDeadAsNonPlayerUnit
// sub_0807A03C
// sub_0807A078
// sub_0807A0AC
// sub_0807A0BC
// sub_0807A0CC
// sub_0807A0DC
// sub_0807A0EC
// sub_0807A0FC
// sub_807AB80
// sub_0807A11C
// sub_0807A12C
// sub_0807A13C
// sub_807ABC0
// sub_807ABD0
// sub_807ABE0
// sub_0807A17C
// sub_0807A18C
// sub_0807A19C
// sub_0807A1AC
// sub_0807A1BC
// sub_0807A1D0
// sub_0807A1E4
// sub_0807A1F8
// sub_0807A20C
// sub_0807A220
// sub_0807A234
// sub_0807A278
// sub_0807A2B4
// sub_0807A2C8
// sub_0807A2DC
// sub_0807A2F0
bool sub_0807A304(void);
// sub_0807A318
// sub_807ADA8
// sub_807ADC4
// sub_807ADE0
// sub_807ADFC
// sub_0807A3A4
// sub_0807A3B8
bool IsTactFemale(void);
// sub_0807A3D8
// IsTutorialDisabled: returns int (eventinfo.c), but eventscr2.c needs a bool prototype to match
// GmUnitFadeExists
// sub_0807A408
// sub_0807A420
// sub_0807A434
// sub_807AEC4
// sub_0807A454
// sub_0807A47C
// sub_0807A49C
// sub_807AF24
// sub_807AF30
// sub_807AF3C
// ShinningEventCursor
// TutorialCursor_Init
// TutorialCursor_Loop
// StartTutorialCursors
// TutorialCursorWatcher_Init
// TutorialCursorWatcher_Loop
// StartTutorialCursorWatcher
// HideAllAlliesExceptLeader
void HideAllUnits(void);
// sub_0807A868
// sub_0807A890
// sub_0807A8B8
// sub_0807A938
// ImmediateDisplayMap
// sub_807B400
// TryLockParentProc
// TryUnlockParentProc
// sub_0807A9D4
// sub_0807AA04
// sub_0807AA24
// sub_0807AA4C
// sub_0807AA74
// sub_807B534
// sub_807B558

struct ProcEventQuakeHandler {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x4C);

    /* 4C */ s8 quake_type;
};

struct ProcEventQuakefx {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x4C);

    /* 4C */ s16 timer;
};

void EventQuakefxHorizon_ViolentLoop(struct Proc * procfx);
void EventQuakefxHorizon_SlightLoop(struct Proc * procfx);
void EventQuakefxVeritical_Loop(struct Proc * procfx);
void StartEventVeriticalQuakefx(ProcPtr parent);
void StartEventHorizontalQuakefxViolently(ProcPtr parent);
void StartEventHorizontalQuakefxSlightly(ProcPtr parent);
void StartEventHorizontalQuakefxViolentlyNoSound(ProcPtr parent);
void StartEventHorizontalQuakefxSlightlyNoSound(ProcPtr parent);
void EndEventHorizontalQuakefx(ProcPtr parent);
void EndEventVerticalQuakefx(ProcPtr parent);
void EventQuakefx_Init(struct ProcEventQuakefx * procfx);
void EventQuakefx_Loop(struct ProcEventQuakefx * procfx);
void StartEventQuakefx(ProcPtr proc);
void EndEventQuakefx(ProcPtr proc);

void SetFlag_145(void);
void ClearFlag_145(void);
// DragonGatefx_DistortionHandler
// DragonGatefx_DrawLight
// DragonGatefx_DrawDragon
// DragonGatefx_MergeDragon
// sub_0807B0D4
// DragonGatefxSetHBlank
// DragonGatefx_End
// EventCall_StartDragonGatefx
// DrawDragonGateDragonfx
void EndDragonGatefx(ProcPtr);
// DragonSpriteBlinking_Init
// DragonSpriteBlinking_Loop
// StartDragonSpriteBlinking
// EndDragonSpriteBlinking
// PutDragonGateFlame
// sub_0807B2F8
// DragonFlamefx_Handler
// DragonFlamefx_Init
// DragonFlamefx_Rotation
// DragonFlamefx_EndRing
// DragonFlamefx_RefrainBlendAlpha
// sub_0807B578
// sub_0807B60C
// sub_0807B694
// sub_0807B6FC
// StartDragonFlamefx
// EndDragonFlamefx
// DragonFlamefxFlashingOut
// sub_0807B7B4
// DeadDragonFlame_Init
// DeadDragonFlame_Rotation
// DeadDragonFlamefx_Loop_B
// sub_0807B9F0
// sub_0807BA1C
// sub_0807BB18
// DeadDragonFlamefx_Loop_C
// StartDeadDragonFlamefx
void sub_0807BBF8(const char *);
// CandleFlameFx_ScanlineEffect
// StartCandleFlameFx
// EndCandleFlamePaletteFx
// ZephielEpilogue_Init
// ZephielEpilogue_EnableBg2
// ZephielEpilogue_LoadNewCg
// ZephielEpilogue_Loop_BlendCgs
// ZephielEpilogue_End
// StartZephielJahnEpilogueCg

struct ProcEventAnimfx
{
    PROC_HEADER;
    STRUCT_PAD(0x29, 0x4C);

    /* 4C */ s16 timer;

    STRUCT_PAD(0x4E, 0x58);

    /* 58 */ int bg2_offset;
};

void QuintessenceFx_ParallelWorker(struct ProcEventAnimfx * proc);
void QuintFxBg2_Init(struct ProcEventAnimfx * proc);
void QuintFxBg2_Loop(struct ProcEventAnimfx * proc);
void QuintessenceFx_Init_Main(struct ProcEventAnimfx * proc);
void QuintessenceFx_Loop_A(struct ProcEventAnimfx * proc);
void QuintessenceFx_ResetBlend(struct ProcEventAnimfx * proc);
void QuintessenceFx_Loop_B(struct ProcEventAnimfx * proc);
void QuintessenceFx_Loop_C(struct ProcEventAnimfx * proc);
void QuintessenceFx_OnEnd(void);
void StartQuintessenceStealEffect(struct Proc * parent);
void QuintessenceFx_Goto_B(void);
void QuintessenceFx_Goto_C(void);
void EndQuintessenceStealEffect(void);

struct ProcUnitTornOut {
    PROC_HEADER;
    STRUCT_PAD(0x29, 0x4C);

    /* 4C */ s16 counter;

    STRUCT_PAD(0x4E, 0x54);

    /* 54 */ struct Unit * unit;
};

void UnitTornOut_Init(struct ProcUnitTornOut * proc);
void UnitTornOut_Loop(struct ProcUnitTornOut * proc);
void StartUnitTornOut(struct Unit * unit, ProcPtr parent);

struct ProcFlameBreathfx {
    PROC_HEADER;

    /* 2C */ int x, y;

    STRUCT_PAD(0x34, 0x4C);

    /* 4C */ s16 timer;

    STRUCT_PAD(0x50, 0x58);

    /* 58 */ int type;

    STRUCT_PAD(0x5C, 0x64);

    /* 64 */ s16 bg_offset;
};

// sub_0807C378
// sub_0807C38C
// sub_0807C3A0
void sub_0807C3A0(struct ProcFlameBreathfx * proc);

void sub_0807C41C(struct ProcFlameBreathfx * proc);
void FlameBreathfx_Loop_A(struct ProcFlameBreathfx * proc);
void FlameBreathfx_Loop_B(struct ProcFlameBreathfx * proc);
void FlameBreathfx_Loop_C(struct ProcFlameBreathfx * proc);
void sub_0807C66C(struct ProcFlameBreathfx * proc);
void StartFlameBreathfx(int type, int x, int y, ProcPtr parent);

struct ProcIceCrystal {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x4C);

    /* 4C */ s16 timer;

    STRUCT_PAD(0x4E, 0x58);

    /* 58 */ int bg2_offset;
};

void IceCrystalfx_Start(struct ProcIceCrystal * proc);
void IceCrystalfx_ResetPalette(struct ProcIceCrystal * proc);
void IceCrystalfx_RefrainPalette(struct ProcIceCrystal * proc);
void IceCrystalfx_Paluse(struct ProcIceCrystal * proc);
// StartLoadIceCrystal
// sub_0807C8B4
// sub_0807C8FC
// sub_0807C96C
// sub_0807C9B0
// sub_0807CA04
// sub_0807CA44
// sub_0807CAC0
// sub_0807CB28
// sub_807D5B0
// sub_0807CBE4
// sub_807D698
// sub_0807CC38
// sub_0807CC5C
// EventWorldFlush_Loop_A
// WorldFlushReload
// EventWorldFlush_Loop_B
// EventWorldFlush_OnEnd
// sub_807D938
// sub_0807CEC8
// sub_0807CED8
// sub_0807CEE8
// sub_0807CEFC
// sub_0807CF10
// sub_0807CF2C
// sub_807D9E8
// sub_0807CF7C
// sub_0807CFA8
// sub_0807CFBC
// sub_807DA48
// sub_807DA64
// sub_807DA74
// sub_807DA84
// sub_807DA94
// sub_807DAA8
// sub_807DAC4
// sub_807DAD4
// sub_0807CFF4
// sub_807DB20
// sub_807DB3C
// sub_0807D094
// sub_807DBB0
// sub_0807D0B8
// sub_0807D170
// sub_807DC9C
// sub_0807D18C
// sub_807DD0C
// sub_0807D1E0
// sub_0807D1F8
// sub_0807D210
// sub_807DD84
// sub_807DDAC
// sub_807DDBC
// sub_807DDCC
// sub_0807D240
// nullsub_69
// sub_807DE0C
// sub_0807D26C
// sub_0807D29C
// sub_807DE80
// sub_807DEA4
// sub_0807D2B0
// sub_807DEFC
// sub_0807D2EC
// sub_0807D324
// sub_0807D368
// sub_0807D3BC
// sub_0807D3D4
// sub_807E018
// sub_807E038
// sub_807E050
// sub_807E074
// sub_807E090
// sub_0807D424
// sub_807E0C4
// sub_0807D448
// sub_0807D4C0
// sub_807E178
// sub_0807D4EC
// sub_807E1C4
// sub_0807D528
// sub_807E27C
// sub_807E2A0
// sub_807E2CC
// sub_0807D5BC
// sub_0807D60C
// sub_0807D644
// sub_0807D688
// sub_0807D6B4
// nullsub_70
// sub_0807D6E0
// sub_0807D6F4
// sub_0807D710
// sub_0807D770
// sub_0807D78C
// sub_0807D7B4
// sub_0807D7E0
// sub_0807D80C
// sub_807E574
// sub_0807D840
// sub_807E5D4
// sub_0807D890
// sub_0807D8D4
// EventCall_SwingSwordfx
// EventCall_NinianReturnToHuman
// EventCall_HideNinianDragonSMS
// EventCall_NinianDragonTrembling
// EventCall_PutFallNinian
// sub_807E734
// sub_807E750
// sub_0807D9E4
// sub_0807DA14
// sub_0807DA68
// sub_0807DA8C
// sub_0807DAA8
// sub_0807DAC4
// nullsub_20
// sub_0807DB74
// sub_807E934
// sub_0807DBA0
// sub_0807DBF4
// sub_0807DC14
// sub_0807DC30
// sub_0807DC5C
// sub_0807DD94
// sub_807EB80
// sub_0807DDEC
// sub_0807DE1C
// sub_0807DEA8
// Finial_EventLoadAllies1
// Finial_EventLoadAllies2
// Finial_EventLoadAllies3
// Finial_EventLoadAllies4
// sub_807EF5C
// sub_0807E1AC
// sub_0807E1C0
// sub_0807E348
// sub_0807E3B0
// sub_0807E3DC
// sub_0807E3FC
// ForceDisplayDragonSprite

struct ProcEventDragonsSpritefx {
    PROC_HEADER;

    /* 2C */ struct ProcSpriteAnim * approc[3];
    /* 38 */ s16 x_1[3];
    /* 3E */ s16 y_1[3];
    /* 44 */ s16 x_2[3];
    /* 4A */ s16 y_2[3];
    /* 50 */ s16 speed[3];
    /* 56 */ s16 progress[3];
    /* 5C */ u16 oam0[3];
    /* 62 */ u8 facing[3];

    STRUCT_PAD(0x65, 0x6A);

    /* 6A */ u8 kind;
    /* 6B */ u8 timer;
};

enum fire_dragon_sprite_action_idx {
    FIREDRAGONSPRIT_ACTION_NORMAL = 0,
    FIREDRAGONSPRIT_ACTION_BARK,
    FIREDRAGONSPRIT_ACTION_FELL,
    FIREDRAGONSPRIT_ACTION_FADEOUT,
    FIREDRAGONSPRIT_ACTION_RESTAND,
};

struct ProcDragonFlameImpact {
    PROC_HEADER;

    /* 2C */ int x, y;

    STRUCT_PAD(0x34, 0x4C);

    /* 4C */ s16 timer;
};

void EventDragonsSpritefx_Init(struct ProcEventDragonsSpritefx * proc);
void EventDragonsSpritefx_End(struct ProcEventDragonsSpritefx * proc);
void EventDragonsSpritefx_Loop(struct ProcEventDragonsSpritefx * proc);
void StartEventDragonsSpriteDeamon(int kind, ProcPtr parent);
void EndEventDragonsSpritefx(void);
void PutFireDragonSpritefx(int index, int ap_idx, int x, int y, int action, int speed);
void RemoveFireDragonSpritefx(int idx);
void sub_0807E7D4(int idx);
void EventCall_PutFireDragonSprite(ProcPtr proc);
void Move2ndFireDragon(void);
void Move3rdFireDragon(void);
void ReputFireDragonSprite(ProcPtr proc);
void FireDragonSpriteRetreated(void);
void sub_0807E8F4(void);
void sub_0807E914(ProcPtr proc);
void sub_0807E95C(void);
void sub_0807E97C(void);
void sub_0807E99C(ProcPtr proc);
void sub_0807E9D0(ProcPtr proc);
void StartEventDragonsSpriteMovefx(ProcPtr proc);
void DragonFlameImpact_Init(struct ProcDragonFlameImpact * proc);
void DragonFlameImpact_Loop(struct ProcDragonFlameImpact * proc);
void DragonFlameImpact_End(struct ProcDragonFlameImpact * proc);
void StartDragonFlameImpact(ProcPtr parent);
void EndDragonFlameImpact(void);

void EventCall_FireDragonScreamingInPain(ProcPtr proc);
void EventCall_FireDragonFellWeakly(ProcPtr proc);
void EventCall_FireDragonFadeOut(ProcPtr proc);
void EventCall_FinalFireDragonReStandUp(ProcPtr proc);

struct ProcEventCutscene
{
    PROC_HEADER;
    STRUCT_PAD(0x29, 0x4C);
    s16 unk_4C;
};

void sub_0807EC30(struct ProcEventCutscene * proc);
void sub_0807ECA8(struct ProcEventCutscene * proc);
// sub_0807ED2C
// ForceCenteredDragon
// sub_807FB34
// IsStartButtonHeld
// IsSelectButtonHeld
// sub_807FB68
// IsBButtonHeld
// sub_807FB80
// sub_807FB98
// sub_807FBB0
// sub_807FBCC
// sub_807FBE8
bool GetLynModeDeathFlag(void);
void SetLynModeDeathFlag(void);
// IsDorcasRecruited
// IsSerraRecruited
// IsErkRecruited
// IsChapterInOccupationsShadow
// IsChapterBeyondTheBorders
// IsChapterBloodOfPride
// IsChapterNightOfFarewells
// IsAnyLordInCombat
// IsNinoRecruited
// IsRathRecruited
// IsHectorInCombat
// sub_0807EF90
void TransferLynModeUnits(void);
void SetPostLynModeChapter(void);
// LoadOneYearLaterCg
// sub_807FF4C
// sub_807FF5C
// sub_807FF6C
// sub_807FF7C
// sub_807FF8C
// NilsEpilogueIntro_Init
// NilsEpilogueIntro_CopyBg3ToBg1
// NilsEpilogueIntro_LoadCg
// NilsEpilogueIntro_Loop_BlendCg
// NilsEpilogueIntro_ClearBg1Bg2
// NilsEpilogueIntro_ReloadCg
// StartNilsEpilogueIntro
// NilsEpilogueOutro_Init
// NilsEpilogueOutro_LoadNilsInDragonsGate
// NilsEpilogueOutro_Loop_BlendCgs
// NilsEpilogueOutro_ClearBg0
// NilsEpilogueOutro_FadeNilsToWhite
// NilsEpilogueOutro_FadeDragonsGateToBlack
// StartNilsEpilogueOutro
// sub_0807F6C8

extern struct ProcCmd ProcScr_EventHorizontalQuakefx[];
extern struct ProcCmd ProcScr_EventVerticalQuakefx[];
extern struct ProcCmd ProcScr_EventQuakefx[];
extern struct ProcCmd ProcScr_DragonGatefx[];
extern struct ProcCmd ProcScr_DragonSpriteBlinking[];
extern struct ProcCmd ProcScr_DragonFlamefx[];
extern struct ProcCmd ProcScr_DeadDragonFlamefx[];
extern struct ProcCmd ProcScr_ZephielEpilogue[];
extern struct ProcCmd ProcScr_QuintessenceFxBg2Scroll[];
extern struct ProcCmd ProcScr_QuintessenceFx[];
extern struct ProcCmd ProcScr_UnitTornOut[];
extern struct ProcCmd ProcScr_FlameBreathfx[];
extern struct ProcCmd ProcScr_IceCrystalfx[];
// ??? gUnk_08D6FB5C
// ??? gUnk_08D6FC14
// ??? gUnk_08D6FC44
// ??? gUnk_08D80D24
// ??? gUnk_08D80D2E
// ??? gUnk_08D837E8
// ??? ProcScr_08D837F8
// ??? gUnk_08D87684
extern struct ProcCmd ProcScr_EventDragonsSpritefx[];
// ??? ProcScr_DragonFlameImpact
// ??? ProcScr_08CBFCB4
extern EventScr EventScr_DeathQuoteOnEnd[];
// ??? ProcScr_NilsEpilogueIntro
// ??? ProcScr_NilsEpilogueOutro
extern EventScr gUnk_08CC1B1C[];
extern EventScr gUnk_08CC1B50[];
extern EventScr gUnk_08CC1B84[];
extern EventScr gUnk_08CC1BF0[];
