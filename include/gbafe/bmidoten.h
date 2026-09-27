#pragma once

#include "global.h"

// bmidoten.c (FE8U names noted where ours differ)

struct MovMapFillStateExt
{
    /* 00 */ s8 xPos;
    /* 01 */ s8 yPos;
    /* 02 */ u8 connexion;
    /* 03 */ u8 leastMoveCost;
};

struct MovMapFillState
{
    /* 00 */ struct MovMapFillStateExt * src;
    /* 04 */ struct MovMapFillStateExt * dst;
    /* 08 */ s8 hasUnit;
    /* 09 */ u8 movement;
    /* 0A */ u8 unitId;
    /* 0B */ u8 maxMovementValue;
};

extern u8 ** gWorkingBmMap;
extern u8 gWorkingTerrainMoveCosts[];
extern struct MovMapFillStateExt gMovMapFillStPool1[];
extern struct MovMapFillStateExt gMovMapFillStPool2[];
extern struct MovMapFillState gMovMapFillState;

void GenerateUnitMovementMap(struct Unit * unit);                               // GenerateUnitMovementMap (misnamed)
void MapFloodUnitMovement(struct Unit * unit, s8 movement);             // GenerateUnitMovementMapExt
void MapFloodUnitExtended(struct Unit * unit);                          // GenerateUnitExtendedMovementMap
void MapFloodRange_Unitless(int x, int y, const s8 mct[]);              // GenerateExtendedMovementMapOnRange
void GenerateExtendedMovementMap(int x, int y, const s8 mct[]);
void MapFloodOnWorkingMap(struct Unit * unit, int x, int y, int movement); // GenerateMovementMapOnWorkingMap
void SetWorkingMoveTable(const s8 mct[]);                               // SetWorkingMoveCosts
void BeginMapFlood(int x, int y, int movement, int unitId);             // GenerateMovementMap
void sub_08019D84(int connexion, int x, int y);
void BuildBestMoveScript(int x, int y, u8 output[]);                    // GenerateBestMovementScript
void RevertMovementScript(u8 * begin, u8 * end);
void UnitApplyWorkingMovementScript(struct Unit * unit, int x, int y);
void MarkMovementMapEdges(void);
void MarkWorkingMapEdges(void);
void MapAddInRange(int x, int y, int range, int value);
void MapSetInRange(int x, int y, int range, int value);
void GenerateUnitCompleteAttackRange(struct Unit * unit);
void BuildUnitStandingRangeForReach(struct Unit * unit, int reach);    // GenerateUnitStandingReachRange
void GenerateUnitCompleteStaffRange(struct Unit * unit);
void GenerateDangerZoneRange(s8 boolDisplayStaffRange);
void GenerateMagicSealMap(int value);
void SetWorkingBmMap(u8 ** map);
void MapAddInBoundedRange(short x, short y, short minRange, short maxRange);
s8 * GetWorkingMoveCosts(void);
