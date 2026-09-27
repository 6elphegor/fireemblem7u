#pragma once

#include "global.h"
#include "mu.h"

// ??? MapFloodUnitMovement
// ??? MapFloodUnitExtended
// ??? MapFloodRange_Unitless
// ??? GenerateExtendedMovementMap
// ??? MapFloodOnWorkingMap
// ??? SetWorkingMoveTable
// ??? BeginMapFlood
// ??? sub_08019D84
// ??? BuildBestMoveScript
// ??? RevertMovementScript
// ??? UnitApplyWorkingMovementScript
// ??? MarkMovementMapEdges
// ??? MarkWorkingMapEdges
// ??? MapAddInRange
// ??? MapSetInRange
// ??? GenerateUnitCompleteAttackRange
// ??? BuildUnitStandingRangeForReach
// ??? GenerateUnitCompleteStaffRange
// ??? GenerateDangerZoneRange
// ??? GenerateMagicSealMap
// ??? SetWorkingBmMap
// ??? MapAddInBoundedRange
// ??? GetWorkingMoveCosts

void MapFloodOnWorkingMap(struct Unit * unit, int x, int y, int movement); // GenerateMovementMapOnWorkingMap
s8 * GetWorkingMoveCosts(void);
extern u8 ** gWorkingBmMap;
void GenerateUnitCompleteAttackRange(struct Unit * unit);

extern u8 gWorkingMoveScr[MOVE_SCRIPT_MAX_LENGTH];
