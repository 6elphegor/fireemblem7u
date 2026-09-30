#pragma once

#include "global.h"
#include "proc.h"
#include "bmmenu.h"

struct Unit;
struct SpriteAnim;

struct WarpSelectProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 pad_29[0x4A - 0x29];
    /* 4A */ s16 prevWarpAllowed;
    /* 4C */ u8 pad_4C[0x54 - 0x4C];
    /* 54 */ struct SpriteAnim * ap;
};
PROC_SIZE_CHECK(struct WarpSelectProc);

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

extern const struct ProcCmd gProcScr_SquareSelectWarp[];
extern const struct ProcCmd gProcScr_SquareSelectTorch[];

extern u16 CONST_DATA gSpriteAnim_WarpCursor[];

extern const struct SelectInfo gSelectInfo_OffensiveStaff;
extern const struct SelectInfo gSelectInfo_Barrier;
extern const struct SelectInfo gSelectInfo_Restore;
extern const struct SelectInfo gSelectInfo_Heal;
extern const struct SelectInfo gSelectInfo_PutTrap;
extern const struct SelectInfo gSelectInfo_WarpUnit;
extern const struct SelectInfo gSelectInfo_Repair;
extern const struct MenuDef gMenuInfo_RepairItems;

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
void FillWarpRangeMap(struct Unit * unit, struct Unit * target);
void HandlePlayerMapCursor(void);
void DrawItemMenuLineLong(struct Text * text, int item, bool isUsable, u16 * mapOut);
int GetOffensiveStaffAccuracy(struct Unit * actor, struct Unit * target);
void RefreshHammerneUnitInfoWindow(struct Unit * unit);
void StartUnitHpStatusInfoWindow(ProcPtr parent);
void RefreshUnitHpStatusInfoWindow(struct Unit * unit);
void StartUnitResChangeInfoWindow(ProcPtr parent);
void RefreshUnitResChangeInfoWindow(struct Unit * unit);
void StartUnitStaffOffenseInfoWindow(ProcPtr parent);
void RefreshUnitStaffOffenseInfoWindow(struct Unit * unit, int hit);
struct ItemStatBonuses const * GetItemBonuses(int item);
