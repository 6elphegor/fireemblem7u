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
// ??? sub_0801A010
// ??? UnitApplyWorkingMovementScript
// ??? sub_0801A0FC
// ??? MarkWorkingMapEdges
// ??? MapAddInRange
// ??? MapSetInRange
// ??? GenerateUnitCompleteAttackRange
// ??? BuildUnitStandingRangeForReach
// ??? GenerateUnitCompleteStaffRange
// ??? sub_0801B008
// ??? GenerateMagicSealMap
// ??? SetWorkingBmMap
// ??? MapAddInBoundedRange
// ??? GetWorkingMoveCosts

void MapFloodOnWorkingMap(struct Unit * unit, int x, int y, int movement); // GenerateMovementMapOnWorkingMap
s8 * GetWorkingMoveCosts(void);
extern u8 ** gWorkingBmMap;

extern u8 gWorkingMoveScr[MOVE_SCRIPT_MAX_LENGTH];
