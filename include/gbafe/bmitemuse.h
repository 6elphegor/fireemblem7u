#pragma once

#include "global.h"
#include "proc.h"

struct Unit;
struct SelectTarget;
struct SpriteAnim;

struct WarpSelectProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 pad_29[0x4A - 0x29];
    /* 4A */ s16 prevWarpAllowed;
    /* 4C */ u8 pad_4C[0x54 - 0x4C];
    /* 54 */ struct SpriteAnim * ap;
};

extern struct Unit gStatGainSimUnit;

extern u8 CONST_DATA gItemUseJidList_HeroCrest[];
extern u8 CONST_DATA gItemUseJidList_KnightCrest[];
extern u8 CONST_DATA gItemUseJidList_OrionsBolt[];
extern u8 CONST_DATA gItemUseJidList_ElysianWhip[];
extern u8 CONST_DATA gItemUseJidList_GuidingRing[];
extern u8 CONST_DATA gItemUseJidList_EarthSeal[];
extern u8 CONST_DATA gItemUseJidList_HeavenSeal[];
extern u8 CONST_DATA gItemUseJidList_HeavenSealHector[];
extern u8 CONST_DATA gItemUseJidList_OceanSeal[];
extern u8 CONST_DATA gItemUseJidList_FellContract[];

extern struct ProcCmd CONST_DATA gProcScr_SquareSelectWarp[];
extern struct ProcCmd CONST_DATA gProcScr_SquareSelectTorch[];
extern struct ProcCmd CONST_DATA gProcScr_BackToUnitMenu[];

extern u16 CONST_DATA gSpriteAnim_WarpCursor[];

extern u8 CONST_DATA gSelectInfo_OffensiveStaff[];
extern u8 CONST_DATA gSelectInfo_Barrier[];
extern u8 CONST_DATA gSelectInfo_Restore[];
extern u8 CONST_DATA gSelectInfo_Heal[];
extern u8 CONST_DATA gSelectInfo_PutTrap[];
extern u8 CONST_DATA gSelectInfo_WarpUnit[];
extern u8 CONST_DATA gSelectInfo_Repair[];
extern u8 CONST_DATA gMenuInfo_RepairItems[];

s8 CanUnitUseItem(struct Unit * unit, int item);
int GetItemCantUseMsgid(struct Unit * unit, int item);
void DoItemUse(struct Unit * unit, int item);
s8 HasSelectTarget(struct Unit * unit, void (*func)(struct Unit *));
s8 CanUnitUseHealItem(struct Unit * unit);
s8 sub_08027304(struct Unit * unit);
s8 CanUnitUsePureWaterItem(struct Unit * unit);
s8 CanUnitUseTorchItem(struct Unit * unit);
s8 CanUnitUseAntitoxinItem(struct Unit * unit);
s8 CanUnitUseChestKeyItem(struct Unit * unit);
s8 CanUnitUseDoorKeyItem(struct Unit * unit);
s8 CanUnitOpenBridge(struct Unit * unit);
s8 CanUnitUseLockpickItem(struct Unit * unit);
s8 CanUnitUsePromotionItem(struct Unit * unit, int item);
s8 CanUnitUseStatGainItem(struct Unit * unit, int item);
void SetStaffUseAction(struct Unit * unit);
void SetItemUseAction(struct Unit * unit);
u8 StaffSelectOnSelect(ProcPtr proc, struct SelectTarget * target);
void DoUseRescueStaff(struct Unit * unit, void (*func)(struct Unit *));
void DoUseSpecialDance(struct Unit * unit, void (*func)(struct Unit *), int msg);
void WarpSelect_OnInit(struct WarpSelectProc * proc);
void WarpSelect_OnIdle(struct WarpSelectProc * proc);
void WarpSelect_OnConfirm(struct WarpSelectProc * proc);
void WarpSelect_OnCancel(struct WarpSelectProc * proc);
void WarpSelect_OnEnd(struct WarpSelectProc * proc);
u8 WarpOnSelectTarget(ProcPtr proc, struct SelectTarget * target);
void DoUseWarpStaff(struct Unit * unit);
u8 OnSelectPutTrap(ProcPtr proc, struct SelectTarget * target);
void DoUsePutTrap(struct Unit * unit, void (*func)(struct Unit *), int msg);
u8 RepairSelectOnSelect(ProcPtr proc, struct SelectTarget * target);
void DoUseRepairStaff(struct Unit * unit);
u8 RepairSelectOnChange(ProcPtr proc, struct SelectTarget * target);
void RepairSelectOnInit(ProcPtr proc);
void DoUseHealStaff(struct Unit * unit, void (*func)(struct Unit *));
void DoUseRestoreStaff(struct Unit * unit, void (*func)(struct Unit *));
void DoUseBarrierStaff(struct Unit * unit);
void DoUseAttackStaff(struct Unit * unit, void (*func)(struct Unit *));
void SubtitleMapSelect_End(ProcPtr proc);
int sub_08027E68(struct Unit * unit);
void sub_08027E9C(void);
void TorchSelect_OnInit(struct WarpSelectProc * proc);
void TorchSelect_OnIdle(struct WarpSelectProc * proc);
void DoUseTorchStaff(struct Unit * unit);
s8 CanUnitUseItemPrepScreen(struct Unit * unit, int item);

// Declarations of functions from other modules not yet in their headers.
void StartSubtitleHelp(ProcPtr parent, char const * str);
void HideMoveRangeGraphics(void);
void DisplayMoveRangeGraphics(int config);
void FillWarpRangeMap(struct Unit * unit, struct Unit * target);
void HandlePlayerMapCursor(void);
ProcPtr NewTargetSelection_Specialized(void const * info, u8 (*onSelect)(ProcPtr, struct SelectTarget *));
ProcPtr StartMapSelect(void const * info);
void EndTargetSelection(ProcPtr proc);
void ChangeActiveUnitFacing(int x, int y);
ProcPtr StartMenu(void const * info);
void StartEquipInfoWindow(ProcPtr parent, struct Unit * unit, int x, int y);
void UpdateMenuItemPanel(int slot);
void MenuFrozenHelpBox(ProcPtr menu, int msg);
void DrawItemMenuLineLong(struct Text * text, int item, s8 isUsable, u16 * tm);
int GetOffensiveStaffAccuracy(struct Unit * actor, struct Unit * target);
void StartUnitInventoryInfoWindow(ProcPtr parent);
void RefreshHammerneUnitInfoWindow(struct Unit * unit);
void sub_08031E5C(ProcPtr parent);
void RefreshUnitHpStatusInfoWindow(struct Unit * unit);
void sub_08031EF0(ProcPtr parent);
void RefreshUnitResChangeInfoWindow(struct Unit * unit);
void sub_08031F5C(ProcPtr parent);
void RefreshUnitStaffOffenseInfoWindow(struct Unit * unit, int hit);
struct ItemStatBonuses const * GetItemBonuses(int item);
bool IsThereClosedDoorAt(int x, int y);
