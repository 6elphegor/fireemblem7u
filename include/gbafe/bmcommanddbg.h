#pragma once

#include "global.h"

// FE8U: bmcommanddbg.c

struct Unit;

bool CanUnitUseVisit(void);
bool CanUnitUseSeize(void);
bool CanUnitUseAttack(void);
bool CanActiveUnitUseRescue(void);
bool CanActiveUnitUseTrade(void);
int GetUnitCommandUseFlags(void);
int sub_08031444(void);
int sub_08031470(void);
void sub_080314AC(struct Unit * unit);
