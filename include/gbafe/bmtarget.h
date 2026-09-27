#pragma once

#include "global.h"

struct Unit;

struct SelectTarget {
    /* 00 */ s8 x;
    /* 01 */ s8 y;
    /* 02 */ s8 uid;
    /* 03 */ s8 extra;
    /* 04 */ struct SelectTarget * next;
    /* 08 */ struct SelectTarget * prev;
};

// target list (0x0804B1xx)
void BeginTargetList(int x, int y);
void EnlistTarget(int x, int y, int uid, int extra);
int CountTargets(void);
struct SelectTarget * GetTarget(int n);

// bmtarget
extern struct Unit * gSubjectUnit;

void ForEachUnitInMovement(void (*func)(struct Unit * unit));
void ForEachUnitInRange(void (*func)(struct Unit * unit));
void ForEachPosInRange(void (*func)(int x, int y));
void ForEachAdjacentUnit(int x, int y, void (*func)(struct Unit * unit));
void ForEachAdjacentPosition(int x, int y, void (*func)(int x, int y));
void ForEachPosIn12Range(int x, int y, void (*func)(int x, int y));
void ForEachUnitInMagBy2Range(void (*func)(struct Unit * unit));
void TryAddTrapsToTargetList(void);
void AddUnitToTargetListIfNotAllied(struct Unit * unit);
void ListAttackTargetsForWeapon(struct Unit * unit, int item);
void TryAddUnitToTradeTargetList(struct Unit * unit);
void MakeTradeTargetList(struct Unit * unit);
void TryAddUnitToRescueTargetList(struct Unit * unit);
void MakeRescueTargetList(struct Unit * unit);
void TryAddToDropTargetList(int x, int y);
void MakeDropTargetList(struct Unit * unit);
void TryAddRescuedUnitToTakeTargetList(struct Unit * unit);
void MakeTakeTargetList(struct Unit * unit);
void TryAddUnitToGiveTargetList(struct Unit * unit);
void MakeGiveTargetList(struct Unit * unit);
void TryAddUnitToTalkTargetList(struct Unit * unit);
void MakeTalkTargetList(struct Unit * unit);
void MakeTargetListForSupport(struct Unit * unit);
void AddUnitToTargetListIfAllied(struct Unit * unit);
void FillBallistaRangeMaybe(struct Unit * unit);
void TryAddClosedDoorToTargetList(int x, int y);
void TryAddBridgeToTargetList(int x, int y);
void MakeTargetListForDoorAndBridges(struct Unit * unit, int terrain);
void MakeTerrainHealTargetList(int faction);
void MakePoisonDamageTargetList(int faction);
void TryAddUnitToRefreshTargetList(struct Unit * unit);
void MakeTargetListForRefresh(struct Unit * unit);
void AddAsTarget_IfCanStealFrom(struct Unit * unit);
void MakeTargetListForSteal(struct Unit * unit);
void TryAddUnitToHealTargetList(struct Unit * unit);
void MakeTargetListForAdjacentHeal(struct Unit * unit);
void MakeTargetListForRangedHeal(struct Unit * unit);
void TryAddUnitToRestoreTargetList(struct Unit * unit);
void MakeTargetListForRestore(struct Unit * unit);
void TryAddUnitToBarrierTargetList(struct Unit * unit);
void MakeTargetListForBarrier(struct Unit * unit);
void TryAddUnitToRescueStaffTargetList(struct Unit * unit);
void MakeTargetListForRescueStaff(struct Unit * unit);
void TryAddUnitToSilenceTargetList(struct Unit * unit);
void TryAddUnitToSleepTargetList(struct Unit * unit);
void TryAddUnitToBerserkTargetList(struct Unit * unit);
void MakeTargetListForSilence(struct Unit * unit);
void MakeTargetListForSleep(struct Unit * unit);
void MakeTargetListForBerserk(struct Unit * unit);
void TryAddUnitToWarpTargetList(struct Unit * unit);
void MakeTargetListForWarp(struct Unit * unit);
void MakeTargetListForUnlock(struct Unit * unit);
void TryAddUnitToHammerneTargetList(struct Unit * unit);
void MakeTargetListForHammerne(struct Unit * unit);
void MakeTargetListForLatona(struct Unit * unit);
void sub_08024A88(int unk);
void TryAddToMineTargetList(int x, int y);
void MakeTargetListForMine(struct Unit * unit);
void TryAddToLightRuneTargetList(int x, int y);
void MakeTargetListForLightRune(struct Unit * unit);
void TryAddUnitToDanceRingTargetList(struct Unit * unit);
void MakeTargetListForDanceRing(struct Unit * unit);

// Declarations of functions from other modules not yet in their headers.
void BmMapFillg(u8 ** map, int value);
void MapAddInRange(int x, int y, int range, int value);
void MapAddInBoundedRange(short x, short y, short minRange, short maxRange);
int GetTerrainHealAmount(int terrain);
s8 GetTerrainHealsStatus(int terrain);
s8 IsItemStealable(int item);
s8 IsItemRepairable(int item);
int GetItemMinRange(int item);
int GetItemMaxRange(int item);
int GetSomeBallistaItemAt(int x, int y);
bool sub_080789FC(u8 pidA, u8 pidB);
bool sub_08078F24(s8 x, s8 y);
void PidStatsRecordLoseData(u8 pid);
void PidStatsRecordDefeatInfo(u8 pid, u8 killerPid, int deathCause);
