#include "gbafe.h"
#include "gbafe/bmtarget.h"
#include "gbafe/cp_common.h"
#include "gbafe/bmcommanddbg.h"

// Unused unit command availability checks (FE8U: bmcommanddbg.c)

// Also declared in bmmenu.h, which conflicts with bmtarget.h
int GetUnitWeaponReach(struct Unit * unit, int slot);
void BuildUnitStandingRangeForReach(struct Unit * unit, int reach);
int GetAvailableTileEventCommand(s8 x, s8 y);
s8 CanUnitSeize(struct Unit * unit);

bool CanUnitUseVisit(void)
{
    int ix;
    int iy;

    if (gActiveUnit->state & US_HAS_MOVED)
        return FALSE;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
        {
            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX)
                continue;

            if (gBmMapTerrain[iy][ix] != TERRAIN_VILLAGE && gBmMapTerrain[iy][ix] != TERRAIN_HOUSE &&
                gBmMapTerrain[iy][ix] != 0x38 && gBmMapTerrain[iy][ix] != 0x37)
                continue;

            if (GetAvailableTileEventCommand(ix, iy) == 0x0E)
                return TRUE;
        }
    }

    return FALSE;
}

bool CanUnitUseSeize(void)
{
    int ix;
    int iy;

    if (gActiveUnit->state & US_HAS_MOVED)
        return FALSE;

    if (!CanUnitSeize(gActiveUnit))
        return FALSE;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
        {
            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX)
                continue;

            if (GetAvailableTileEventCommand(ix, iy) == 0x0F)
                return TRUE;
        }
    }

    return FALSE;
}

bool CanUnitUseAttack(void)
{
    BeginTargetList(0, 0);
    BmMapFillg(gBmMapRange, 0);
    GenerateUnitCompleteAttackRange(gActiveUnit);
    gSubjectUnit = gActiveUnit;
    ForEachUnitInRange(AddUnitToTargetListIfNotAllied);
    return CountTargets() != 0 ? TRUE : FALSE;
}

bool CanActiveUnitUseRescue(void)
{
    MakeRescueTargetList(gActiveUnit);
    return CountTargets() != 0 ? TRUE : FALSE;
}

bool CanActiveUnitUseTrade(void)
{
    MakeTradeTargetList(gActiveUnit);
    return CountTargets() != 0 ? TRUE : FALSE;
}

int GetUnitCommandUseFlags(void)
{
    int result = 0;

    GetGameTime();

    result |= CanUnitUseVisit() << 15;
    result |= CanUnitUseSeize() << 16;
    result |= CanUnitUseAttack() << 1;
    result |= CanActiveUnitUseRescue() << 8;
    result |= CanActiveUnitUseTrade() << 23;

    return result;
}

int sub_08031444(void)
{
    MapFloodUnitMovement(gActiveUnit, UNIT_MOV(gActiveUnit) - gActionSt.move_count);
    return GetUnitCommandUseFlags();
}

int sub_08031470(void)
{
    BmMapFillg(gBmMapMovement, -1);
    gBmMapMovement[gActiveUnit->yPos][gActiveUnit->xPos] = 0;
    return GetUnitCommandUseFlags();
}

void sub_080314AC(struct Unit * unit)
{
    int i;
    int ix;
    int iy;

    int reach = GetUnitWeaponReach(unit, -1);

    BmMapFillg(gBmMapOther, 0);

    for (i = FACTION_RED + 1; i < FACTION_RED + 0x40; i++)
    {
        struct Unit * unit2 = GetUnit(i);

        if (!UNIT_IS_VALID(unit2))
            continue;

        BuildUnitStandingRangeForReach(unit2, reach);

        gActionSt.x_target = unit2->xPos;
        gActionSt.y_target = unit2->yPos;
    }

    BeginTargetList(0, 0);

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
        {
            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX)
                continue;

            if (gBmMapUnit[iy][ix] != 0)
                continue;

            if (gBmMapOther[iy][ix] == 0)
                continue;

            EnlistTarget(ix, iy, 1, 1);
        }
    }
}
