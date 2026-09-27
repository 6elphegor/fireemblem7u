#pragma once

#include "global.h"

struct Unit;

void DoItemHealStaffAction(ProcPtr proc);
void DoItemRestoreStaffAction(ProcPtr proc);
void ExecBarrierStaff(ProcPtr proc);
void GetRescueStaffTargetPosition(struct Unit * unit, struct Unit * target, int * xOut, int * yOut);
void DoItemRescueStaffAction(ProcPtr proc);
s8 PostWarpStaff_ExecTrap(ProcPtr proc);
int PostWarpStaff_RefreshMap(void);
void ExecWarpStaff(ProcPtr proc);
void DoItemAttackStaffAction(ProcPtr proc);
void DoItemFortifyStaffAction(ProcPtr proc);
void ExecUnlockStaff(ProcPtr proc);
void ExecHammerne(ProcPtr proc);
void ExecLatona(ProcPtr proc);
void ExecVulneraryItem(ProcPtr proc, int amount);
void ExecElixirItem(ProcPtr proc);
void ExecPureWaterItem(ProcPtr proc);
void ExecTorchItem(ProcPtr proc);
void ExecAntitoxinItem(ProcPtr proc);
void ExecKeyItem(void);
void GenerateItemPromotionBattle(struct Unit * unit, int itemIdx, s8 unk);
void DoItemPromoteAction(void);
void GeneratePromotionBattle(struct Unit * unit, int item);
int ApplyItemStatBoost(struct Unit * unit, int itemIdx);
void DoItemStatBoostAction(ProcPtr proc);
void ExecMine(ProcPtr proc);
void ExecLightRune(ProcPtr proc);
void ExecTorchStaff(ProcPtr proc);
void ExecDanceRing(ProcPtr proc);
void DoItemAction(ProcPtr proc);
void ApplyStatusChange(void);
