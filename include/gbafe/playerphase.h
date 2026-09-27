#pragma once

#include "global.h"
#include "proc.h"

// playerphase.c (FE8U names noted where ours differ)

enum {
    PLAYER_SELECT_NOUNIT = 0,
    PLAYER_SELECT_TURNENDED = 1,
    PLAYER_SELECT_CONTROL = 2,
    PLAYER_SELECT_NOCONTROL = 3,
    PLAYER_SELECT_4 = 4,
};

enum {
    LIMITVIEW_BLUE = (1 << 0),
    LIMITVIEW_RED = (1 << 1),
    LIMITVIEW_GREEN = (1 << 2),
    LIMITVIEW_UNK = (1 << 4),
};

struct MoveLimitViewProc {
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x4A);
    /* 4A */ u16 flags;
    /* 4C */ s16 unk_4C;
};

extern struct ProcCmd ProcScr_PlayerPhase[];
extern struct ProcCmd ProcScr_SALLYCURSOR[];
extern struct ProcCmd gProcScr_EventEngine[];
extern struct ProcCmd sProcScr_MoveLimitView[];
extern u8 * gOpenLimitViewImgLut[];
extern u8 const Img_LimitViewSquare[];     // FE8U: gUnknown_08A02EB4
extern u16 const Pal_LimitViewBlue[];      // FE8U: gUnknown_08A02F34
extern u16 const Pal_LimitViewRed[];       // FE8U: gUnknown_08A02F94
extern u16 const Pal_LimitViewGreen[];     // FE8U: gUnknown_08A02FF4
extern struct MenuDef const gMapMenuDef;

void PlayerPhase_Suspend(void);
void HandlePlayerMapCursor(void);                               // HandlePlayerCursorMovement
bool CanShowUnitStatScreen(struct Unit * unit);
void PlayerPhase_IdleLoop(ProcPtr proc);                        // PlayerPhase_MainIdle
void DisplayUnitEffectRange(struct Unit * unit);
void PlayerPhase_InitUnitMovementSelect(void);
void DisplayActiveUnitEffectRange(ProcPtr proc);
void PlayerPhase_DisplayDangerZone(void);
void PlayerPhase_RangeDisplayIdle(ProcPtr proc);
void PlayerPhase_CancelAction(ProcPtr proc);
void PlayerPhase_BackToMove(ProcPtr proc);
s8 PlayerPhase_PrepareAction(ProcPtr proc);
bool TryMakeCantoUnit(ProcPtr proc);
bool RunPotentialWaitEvents(void);
bool EnsureCameraOntoActiveUnitPosition(ProcPtr proc);
void PlayerPhase_FinishAction(ProcPtr proc);
void sub_0801CD50(void);                                        // sub_801D404
void sub_0801CD80(ProcPtr proc);                                // sub_801D434
void PlayerPhase_ApplyUnitMovement(ProcPtr proc);
int GetPlayerSelectKind(struct Unit * unit);
bool CanMoveActiveUnitTo(int x, int y);
void PlayerPhase_DisplayUnitMovement(void);
void PlayerPhase_WaitForUnitMovement(ProcPtr proc);
void PlayerPhase_ResumeRangeDisplay(ProcPtr proc);
void PlayerPhase_ReReadGameSaveGfx(void);
void MoveLimitViewChange_OnInit(struct MoveLimitViewProc * proc);
void MoveLimitViewChange_OnLoop(struct MoveLimitViewProc * proc);
void MoveLimitView_OnInit(ProcPtr proc);
void MoveLimitView_OnLoop(struct MoveLimitViewProc * proc);
void MoveLimitView_OnEnd(struct MoveLimitViewProc * proc);
void DisplayMoveRangeGraphics(int config);
void HideMoveRangeGraphics(void);
bool TrySetCursorOn(int unitId);
void TrySwitchViewedUnit(int x, int y);
void PlayerPhase_HandleAutoEnd(ProcPtr proc);

// defined elsewhere
struct MenuProc * StartAdjustedMenu(const struct MenuDef * def, int xSubject, int xTileLeft, int xTileRight); // StartOrphanMenuAdjusted
void EndPlayerPhaseSideWindows(void);
void UnitBeginAction(struct Unit * unit);
void UnitBeginCantoAction(struct Unit * unit);
void PidStatsAddActAmt(int pid);
int GetUnitWeaponUsabilityBits(struct Unit * unit);
int GetCombinedEnemyWeaponUsabilityBits(void);
void RefreshBMapGraphics(void);
bool CanActiveUnitStillMove(void);                            // CanUnitMove
bool CheckForWaitEvents(void);
void RunWaitEvents(void);
bool ShouldCallEndEvent(void);
void MaybeCallEndEvent_(void);
void GetMovementScriptFromPath(void);
void MU_SetDefaultFacing_Auto(void);                            // SetAutoMuDefaultFacing
bool MuExistsActive(void);
void SetAutoMuMoveScript(u8 const * script);
bool sub_08026064(int x, int y);                               // IsUnitSpriteHoverEnabledAt
void sub_0802FEF4(int arg);                                     // PathArrowDisp_Init
void sub_0803030C(void);                                        // DrawUpdatedPathArrow
bool sub_0803077C(int pid);                                    // CanCharacterBePrepMoved
void sub_08032770(ProcPtr proc);
bool sub_0806C040(void);                                       // MuExists
void sub_08078FC8(void);                                        // TryCallSelectEvents
s8 sub_08079004(void);                                          // StartAfterUnitMovedEvent
s8 sub_0807905C(void);                                          // StartDestSelectedEvent
void sub_080790C0(void);                                        // sub_80832CC
void sub_080A3284(void);                                        // StartMinimapPlayerPhase
bool IsMapFadeActive(void);                                     // DoesBMXFADEExist
void StartMapFade(bool locksGame);                              // NewBMXFADE
