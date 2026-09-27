#pragma once

#include "global.h"

// Ballistae (FE8U: bmarch.c)

struct Trap;
struct Unit;

enum
{
    TRAP_EXTDATA_BLST_RIDDEN = 1,
    TRAP_EXTDATA_BLST_ITEMUSES = 2,
};

struct Trap * GetRiddenBallistaAt(int x, int y);
int GetBallistaItemAt(int x, int y);
int GetSomeBallistaItemAt(int x, int y);
struct Trap * AddBallista(int x, int y, int ballistaType);
void RideBallista(struct Unit * unit);
void TryRemoveUnitFromBallista(struct Unit * unit);
s8 IsBallista(struct Trap * trap);
int sub_080347F8(struct Trap * trap);
int sub_08034820(struct Trap * trap);
int GetBallistaItemUses(struct Trap * trap);
void ClearBallistaOccupied(struct Trap * trap);
void SetBallistaOccupied(struct Trap * trap);
