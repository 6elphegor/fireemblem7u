#pragma once

#include "global.h"

// UiSpinningArrows_Init
// UiSpinningArrows_Loop
ProcPtr StartUiSpinningArrows(ProcPtr);
ProcPtr LoadUiSpinningArrowGfx(s32, s32, s32);
void SetUiSpinningArrowPositions(s32, s32, s32, s32);
void SetUiSpinningArrowConfig(s32);
void SetUiSpinningArrowFastMaybe(s32);
// EndUiSpinningArrows
