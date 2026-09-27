#include "gbafe.h"

#define gMapMovementSigned ((s8 **) gBmMapMovement)
#define gMapRangeSigned ((s8 **) gBmMapRange)


extern s8 TerrainTable_MovCost_FlyNormal[];

EWRAM_DATA struct Unit * gSubjectUnit = NULL;

void ForEachUnitInMovement(void (*func)(struct Unit * unit))
{
    int ix;
    int iy;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
        {
            if (gMapMovementSigned[iy][ix] == 0)
                continue;

            if (gBmMapUnit[iy][ix] == 0)
                continue;

            func(GetUnit(gBmMapUnit[iy][ix]));
        }
    }
}

void ForEachUnitInRange(void (*func)(struct Unit * unit))
{
    int ix;
    int iy;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
        {
            if (gMapRangeSigned[iy][ix] == 0)
                continue;

            if (gBmMapUnit[iy][ix] == 0)
                continue;

            func(GetUnit(gBmMapUnit[iy][ix]));
        }
    }
}

void ForEachPosInRange(void (*func)(int x, int y))
{
    int ix;
    int iy;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
        {
            if (gMapRangeSigned[iy][ix] == 0)
                continue;

            func(ix, iy);
        }
    }
}

void ForEachAdjacentUnit(int x, int y, void (*func)(struct Unit * unit))
{
    BeginTargetList(x, y);

    MapAddInRange(x, y, 1, 1);
    MapAddInRange(x, y, 0, -1);

    ForEachUnitInRange(func);
}

void ForEachAdjacentPosition(int x, int y, void (*func)(int x, int y))
{
    BeginTargetList(x, y);

    MapAddInRange(x, y, 1, 1);
    MapAddInRange(x, y, 0, -1);

    ForEachPosInRange(func);
}

void ForEachPosIn12Range(int x, int y, void (*func)(int x, int y))
{
    BeginTargetList(x, y);

    MapAddInRange(x, y, 2, 1);
    MapAddInRange(x, y, 0, -1);

    ForEachPosInRange(func);
}

void ForEachUnitInMagBy2Range(void (*func)(struct Unit * unit))
{
    int x = gSubjectUnit->xPos;
    int y = gSubjectUnit->yPos;

    BeginTargetList(x, y);

    MapAddInRange(x, y, GetUnitMagRange(gSubjectUnit), 1);
    MapAddInRange(x, y, 0, -1);

    ForEachUnitInRange(func);
}

void TryAddTrapsToTargetList(void)
{
    struct Trap * trap;

    for (trap = GetTrap(0); trap->type != TRAP_NONE; ++trap)
    {
        if (trap->type != TRAP_OBSTACLE)
            continue;

        if ((gBmMapTerrain[trap->yPos][trap->xPos] == TERRAIN_WALL_BREAKABLE) && (gMapRangeSigned[trap->yPos][trap->xPos] != 0))
            EnlistTarget(trap->xPos, trap->yPos, 0, trap->extra);

        if ((gBmMapTerrain[trap->yPos + 1][trap->xPos] == TERRAIN_WALL_BREAKABLE) && (gMapRangeSigned[trap->yPos + 1][trap->xPos] != 0))
            EnlistTarget(trap->xPos, trap->yPos + 1, 0, trap->extra);

        if ((gBmMapTerrain[trap->yPos][trap->xPos] == TERRAIN_SNAG) && (gMapRangeSigned[trap->yPos][trap->xPos] != 0))
            EnlistTarget(trap->xPos, trap->yPos, 0, trap->extra);
    }
}

void AddUnitToTargetListIfNotAllied(struct Unit * unit)
{
    if (!AreUnitIdsAllied(gSubjectUnit->index, unit->index))
        EnlistTarget(unit->xPos, unit->yPos, unit->index, 0);
}

void ListAttackTargetsForWeapon(struct Unit * unit, int item)
{
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BeginTargetList(x, y);

    BmMapFillg(gBmMapRange, 0);

    MapAddInBoundedRange(x, y, GetItemMinRange(item), GetItemMaxRange(item));

    ForEachUnitInRange(AddUnitToTargetListIfNotAllied);

    TryAddTrapsToTargetList();
}

void TryAddUnitToTradeTargetList(struct Unit * unit)
{
    if (!AreUnitIdsSameFaction(gSubjectUnit->index, unit->index))
        return;

    if (unit->statusIndex != UNIT_STATUS_BERSERK)
    {
        if (gSubjectUnit->items[0] != 0 || unit->items[0] != 0)
        {
            if (!(UNIT_CATTRIBUTES(unit) & CA_SUPPLY))
                EnlistTarget(unit->xPos, unit->yPos, unit->index, 0);
        }
    }

    if (unit->state & US_RESCUING)
    {
        struct Unit * rescue = GetUnit(unit->rescue);

        if (UNIT_FACTION(rescue) != FACTION_BLUE)
            return;

        if (gSubjectUnit->items[0] == 0 && rescue->items[0] == 0)
            return;

        EnlistTarget(unit->xPos, unit->yPos, rescue->index, 0);
    }
}

void MakeTradeTargetList(struct Unit * unit)
{
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFillg(gBmMapRange, 0);
    ForEachAdjacentUnit(x, y, TryAddUnitToTradeTargetList);

    if (gSubjectUnit->state & US_RESCUING)
    {
        int count = CountTargets();
        TryAddUnitToTradeTargetList(GetUnit(gSubjectUnit->rescue));

        if (count != CountTargets())
        {
            GetTarget(count)->x = gSubjectUnit->xPos;
            GetTarget(count)->y = gSubjectUnit->yPos;
        }
    }
}

void TryAddUnitToRescueTargetList(struct Unit * unit)
{
    if (!AreUnitIdsAllied(gSubjectUnit->index, unit->index))
        return;

    if (unit->statusIndex == UNIT_STATUS_BERSERK)
        return;

    if (unit->state & (US_RESCUING | US_RESCUED))
        return;

    if (!CanUnitRescue(gSubjectUnit, unit))
        return;

    EnlistTarget(unit->xPos, unit->yPos, unit->index, 0);
}

void MakeRescueTargetList(struct Unit * unit)
{
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFillg(gBmMapRange, 0);

    ForEachAdjacentUnit(x, y, TryAddUnitToRescueTargetList);
}

void TryAddToDropTargetList(int x, int y)
{
    if (gBmMapUnit[y][x] != 0)
        return;

    if (!CanUnitCrossTerrain(GetUnit(gSubjectUnit->rescue), gBmMapTerrain[y][x]))
        return;

    EnlistTarget(x, y, 0, 0);
}

void MakeDropTargetList(struct Unit * unit)
{
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFillg(gBmMapRange, 0);

    ForEachAdjacentPosition(x, y, TryAddToDropTargetList);
}

void TryAddRescuedUnitToTakeTargetList(struct Unit * unit)
{
    if (!AreUnitIdsSameFaction(gSubjectUnit->index, unit->index))
        return;

    if (!(unit->state & US_RESCUING))
        return;

    if (UNIT_CATTRIBUTES(unit) & CA_SUPPLY)
        return;

    if (!CanUnitRescue(gSubjectUnit, GetUnit(unit->rescue)))
        return;

    EnlistTarget(unit->xPos, unit->yPos, unit->index, 0);
}

void MakeTakeTargetList(struct Unit * unit)
{
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFillg(gBmMapRange, 0);

    ForEachAdjacentUnit(x, y, TryAddRescuedUnitToTakeTargetList);
}

void TryAddUnitToGiveTargetList(struct Unit * unit)
{
    if (!AreUnitIdsSameFaction(gSubjectUnit->index, unit->index))
        return;

    if (unit->state & US_RESCUING)
        return;

    if (unit->statusIndex == UNIT_STATUS_BERSERK || unit->statusIndex == UNIT_STATUS_SLEEP)
        return;

    if (UNIT_CATTRIBUTES(unit) & CA_SUPPLY)
        return;

    if (!CanUnitRescue(unit, GetUnit(gSubjectUnit->rescue)))
        return;

    EnlistTarget(unit->xPos, unit->yPos, unit->index, 0);
}

void MakeGiveTargetList(struct Unit * unit)
{
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFillg(gBmMapRange, 0);

    ForEachAdjacentUnit(x, y, TryAddUnitToGiveTargetList);
}

void TryAddUnitToTalkTargetList(struct Unit * unit)
{
    if (unit->statusIndex == UNIT_STATUS_BERSERK || unit->statusIndex == UNIT_STATUS_SLEEP)
        return;

    if (!CheckForCharacterEvents(gSubjectUnit->pCharacterData->number, unit->pCharacterData->number))
        return;

    EnlistTarget(unit->xPos, unit->yPos, unit->index, unit->pCharacterData->number);
}

void MakeTalkTargetList(struct Unit * unit)
{
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFillg(gBmMapRange, 0);

    ForEachAdjacentUnit(x, y, TryAddUnitToTalkTargetList);
}

void MakeTargetListForSupport(struct Unit * unit)
{
    int i;
    int count;

    gSubjectUnit = unit;

    BeginTargetList(unit->xPos, unit->yPos);

    count = GetUnitSupporterCount(gSubjectUnit);

    for (i = 0; i < count; i++)
    {
        struct Unit * other = GetUnitSupportUnit(gSubjectUnit, i);

        if (other == 0)
            continue;

        if (RECT_DISTANCE(gSubjectUnit->xPos, gSubjectUnit->yPos, other->xPos, other->yPos) != 1)
            continue;

        if (!CanUnitSupportNow(gSubjectUnit, i))
            continue;

        if (other->state & (US_DEAD | US_NOT_DEPLOYED | US_RESCUED | US_BIT16))
            continue;

        if (other->statusIndex == UNIT_STATUS_BERSERK || other->statusIndex == UNIT_STATUS_SLEEP)
            continue;

        EnlistTarget(other->xPos, other->yPos, other->index, i);
    }
}

void AddUnitToTargetListIfAllied(struct Unit * unit)
{
    if (AreUnitIdsAllied(gSubjectUnit->index, unit->index))
        return;

    EnlistTarget(unit->xPos, unit->yPos, unit->index, 1);
}

void FillBallistaRangeMaybe(struct Unit * unit)
{
    int item;

    int x = unit->xPos;
    int y = unit->yPos;
    gSubjectUnit = unit;

    BeginTargetList(x, y);

    item = GetSomeBallistaItemAt(x, y);
    if (item != 0)
    {
        BmMapFillg(gBmMapRange, 0);

        MapAddInBoundedRange(x, y, GetItemMinRange(item), GetItemMaxRange(item));

        ForEachUnitInRange(AddUnitToTargetListIfAllied);

        TryAddTrapsToTargetList();
    }
}

void TryAddClosedDoorToTargetList(int x, int y)
{
    if (gBmMapTerrain[y][x] != TERRAIN_DOOR)
        return;

    if (!IsThereClosedDoorAt(x, y))
        return;

    EnlistTarget(x, y, TERRAIN_DOOR, 0);
}

void TryAddBridgeToTargetList(int x, int y)
{
    if (gBmMapTerrain[y][x] != TERRAIN_DRAWBRIDGE)
        return;

    if (!IsThereClosedDoorAt(x, y))
        return;

    EnlistTarget(x, y, TERRAIN_DRAWBRIDGE, 0);
}

void MakeTargetListForDoorAndBridges(struct Unit * unit, int terrain)
{
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFillg(gBmMapRange, 0);

    switch (terrain)
    {
    case TERRAIN_DOOR:
        ForEachAdjacentPosition(x, y, TryAddClosedDoorToTargetList);
        return;

    case TERRAIN_DRAWBRIDGE:
        ForEachAdjacentPosition(x, y, TryAddBridgeToTargetList);
        return;
    }
}

void MakeTerrainHealTargetList(int faction)
{
    int i;

    BeginTargetList(0, 0);

    for (i = faction + 1; i < faction + 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);
        int terrain;
        int amount;

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & (US_DEAD | US_NOT_DEPLOYED | US_RESCUED | US_BIT16))
            continue;

        terrain = gBmMapTerrain[unit->yPos][unit->xPos];

        if (GetTerrainHealAmount(terrain) != 0 && (GetUnitCurrentHp(unit) != GetUnitMaxHp(unit)))
        {
            amount = (GetTerrainHealAmount(terrain) * GetUnitMaxHp(unit)) / 100;
            EnlistTarget(unit->xPos, unit->yPos, unit->index, amount);
        }

        if (GetTerrainHealsStatus(terrain) == 0)
            continue;

        if (unit->statusIndex == UNIT_STATUS_NONE)
            continue;

        EnlistTarget(unit->xPos, unit->yPos, unit->index, -1);
    }
}

void MakePoisonDamageTargetList(int faction)
{
    int i;

    BeginTargetList(0, 0);

    for (i = faction + 1; i < faction + 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & (US_DEAD | US_NOT_DEPLOYED | US_RESCUED | US_BIT16))
            continue;

        if (unit->statusIndex != UNIT_STATUS_POISON)
            continue;

        EnlistTarget(unit->xPos, unit->yPos, unit->index, RandNext(3) + 1);
    }
}

void TryAddUnitToRefreshTargetList(struct Unit * unit)
{
    if (!AreUnitIdsSameFaction(gSubjectUnit->index, unit->index))
        return;

    if (!(unit->state & US_UNSELECTABLE))
        return;

    EnlistTarget(unit->xPos, unit->yPos, unit->index, 0);
}

void MakeTargetListForRefresh(struct Unit * unit)
{
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFillg(gBmMapRange, 0);

    ForEachAdjacentUnit(x, y, TryAddUnitToRefreshTargetList);
}

void AddAsTarget_IfCanStealFrom(struct Unit * unit)
{
    int i;

    if (UNIT_FACTION(unit) != FACTION_RED)
        return;

    if (gActiveUnit->spd < unit->spd)
        return;

    for (i = 0; i < UNIT_ITEM_COUNT; i++)
    {
        if (!IsItemStealable(unit->items[i]))
            continue;

        EnlistTarget(unit->xPos, unit->yPos, unit->index, 0);
        return;
    }
}

void MakeTargetListForSteal(struct Unit * unit)
{
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFillg(gBmMapRange, 0);

    ForEachAdjacentUnit(x, y, AddAsTarget_IfCanStealFrom);
}

void TryAddUnitToHealTargetList(struct Unit * unit)
{
    if (!AreUnitIdsAllied(gSubjectUnit->index, unit->index))
        return;

    if (unit->state & US_RESCUED)
        return;

    if (GetUnitCurrentHp(unit) == GetUnitMaxHp(unit))
        return;

    EnlistTarget(unit->xPos, unit->yPos, unit->index, 0);
}

void MakeTargetListForAdjacentHeal(struct Unit * unit)
{
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFillg(gBmMapRange, 0);

    ForEachAdjacentUnit(x, y, TryAddUnitToHealTargetList);
}

void MakeTargetListForRangedHeal(struct Unit * unit)
{
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BeginTargetList(x, y);

    BmMapFillg(gBmMapRange, 0);

    MapAddInRange(x, y, GetUnitMagRange(gSubjectUnit), 1);

    ForEachUnitInRange(TryAddUnitToHealTargetList);
}

void TryAddUnitToRestoreTargetList(struct Unit * unit)
{
    if (!AreUnitIdsAllied(gSubjectUnit->index, unit->index))
        return;

    if (unit->state & US_RESCUED)
        return;

    if (unit->statusIndex == UNIT_STATUS_NONE)
        return;

    EnlistTarget(unit->xPos, unit->yPos, unit->index, 0);
}

void MakeTargetListForRestore(struct Unit * unit)
{
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFillg(gBmMapRange, 0);

    ForEachAdjacentUnit(x, y, TryAddUnitToRestoreTargetList);
}

void TryAddUnitToBarrierTargetList(struct Unit * unit)
{
    if (!AreUnitIdsAllied(gSubjectUnit->index, unit->index))
        return;

    if (unit->state & US_RESCUED)
        return;

    if (unit->barrierDuration >= 7)
        return;

    EnlistTarget(unit->xPos, unit->yPos, unit->index, 0);
}

void MakeTargetListForBarrier(struct Unit * unit)
{
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFillg(gBmMapRange, 0);

    ForEachAdjacentUnit(x, y, TryAddUnitToBarrierTargetList);
}

void TryAddUnitToRescueStaffTargetList(struct Unit * unit)
{
    if (!AreUnitIdsAllied(gSubjectUnit->index, unit->index))
        return;

    EnlistTarget(unit->xPos, unit->yPos, unit->index, 0);
}

void MakeTargetListForRescueStaff(struct Unit * unit)
{
    gSubjectUnit = unit;

    BmMapFillg(gBmMapRange, 0);

    ForEachUnitInMagBy2Range(TryAddUnitToRescueStaffTargetList);
}

void TryAddUnitToSilenceTargetList(struct Unit * unit)
{
    if (AreUnitIdsAllied(gSubjectUnit->index, unit->index))
        return;

    if (unit->statusIndex != UNIT_STATUS_NONE && unit->statusIndex != UNIT_STATUS_SILENCED)
        return;

    EnlistTarget(unit->xPos, unit->yPos, unit->index, 0);
}

void TryAddUnitToSleepTargetList(struct Unit * unit)
{
    if (AreUnitIdsAllied(gSubjectUnit->index, unit->index))
        return;

    if (unit->statusIndex != UNIT_STATUS_NONE && unit->statusIndex != UNIT_STATUS_SLEEP)
        return;

    EnlistTarget(unit->xPos, unit->yPos, unit->index, 0);
}

void TryAddUnitToBerserkTargetList(struct Unit * unit)
{
    if (AreUnitIdsAllied(gSubjectUnit->index, unit->index))
        return;

    if (unit->statusIndex != UNIT_STATUS_NONE && unit->statusIndex != UNIT_STATUS_BERSERK)
        return;

    EnlistTarget(unit->xPos, unit->yPos, unit->index, 0);
}

void MakeTargetListForSilence(struct Unit * unit)
{
    gSubjectUnit = unit;

    BmMapFillg(gBmMapRange, 0);

    ForEachUnitInMagBy2Range(TryAddUnitToSilenceTargetList);
}

void MakeTargetListForSleep(struct Unit * unit)
{
    gSubjectUnit = unit;

    BmMapFillg(gBmMapRange, 0);

    ForEachUnitInMagBy2Range(TryAddUnitToSleepTargetList);
}

void MakeTargetListForBerserk(struct Unit * unit)
{
    gSubjectUnit = unit;

    BmMapFillg(gBmMapRange, 0);

    ForEachUnitInMagBy2Range(TryAddUnitToBerserkTargetList);
}

void TryAddUnitToWarpTargetList(struct Unit * unit)
{
    if (!AreUnitIdsAllied(gSubjectUnit->index, unit->index))
        return;

    EnlistTarget(unit->xPos, unit->yPos, unit->index, 0);
}

void MakeTargetListForWarp(struct Unit * unit)
{
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFillg(gBmMapRange, 0);

    ForEachAdjacentUnit(x, y, TryAddUnitToWarpTargetList);
}

void MakeTargetListForUnlock(struct Unit * unit)
{
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFillg(gBmMapRange, 0);

    ForEachPosIn12Range(x, y, TryAddClosedDoorToTargetList);
}

void TryAddUnitToHammerneTargetList(struct Unit * unit)
{
    int i;

    if (!AreUnitIdsSameFaction(gSubjectUnit->index, unit->index))
        return;

    for (i = 0; i < UNIT_ITEM_COUNT; i++)
    {
        if (IsItemRepairable(unit->items[i]))
        {
            EnlistTarget(unit->xPos, unit->yPos, unit->index, 0);
            break;
        }
    }
}

void MakeTargetListForHammerne(struct Unit * unit)
{
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFillg(gBmMapRange, 0);

    ForEachAdjacentUnit(x, y, TryAddUnitToHammerneTargetList);
}

void MakeTargetListForLatona(struct Unit * unit)
{
    int faction;
    int i;

    BeginTargetList(unit->xPos, unit->yPos);

    faction = GetActiveFactionAlliance();

    for (i = faction + 1; i < faction + 0x80; i++)
    {
        struct Unit * other = GetUnit(i);

        if (!UNIT_IS_VALID(other))
            continue;

        if (other->state & US_UNAVAILABLE)
            continue;

        if ((GetUnitCurrentHp(other) == GetUnitMaxHp(other)) && (other->statusIndex == UNIT_STATUS_NONE))
            continue;

        if (other == unit)
            continue;

        EnlistTarget(other->xPos, other->yPos, other->index, 0);
    }
}

void sub_08024A88(int unk)
{
    int i;
    int count = CountTargets();

    for (i = 0; i < count; i++)
    {
        struct SelectTarget * target = GetTarget(i);

        struct Unit * unit = GetUnit(target->uid);

        if (GetUnitCurrentHp(unit) <= target->extra)
        {
            PidStatsRecordDefeatInfo(unit->pCharacterData->number, 0, unk);
            PidStatsRecordLoseData(unit->pCharacterData->number);
        }
    }
}

void TryAddToMineTargetList(int x, int y)
{
    struct Trap * trap;

    if (gBmMapUnit[y][x] != 0)
        return;

    if ((gPlaySt.chapterVisionRange != 0) && (gBmMapFog[y][x] == 0))
        return;

    if (!CanUnitCrossTerrain(gSubjectUnit, gBmMapTerrain[y][x]))
        return;

    trap = GetTrapAt(x, y);

    if ((trap != 0) && (trap->type != TRAP_TORCHLIGHT))
        return;

    EnlistTarget(x, y, 0, 0);
}

void MakeTargetListForMine(struct Unit * unit)
{
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFillg(gBmMapRange, 0);
    ForEachAdjacentPosition(x, y, TryAddToMineTargetList);
}

void TryAddToLightRuneTargetList(int x, int y)
{
    struct Trap * trap;

    if (gBmMapUnit[y][x] != 0)
        return;

    trap = GetTrapAt(x, y);

    if (trap != 0)
        return;

    if (TerrainTable_MovCost_FlyNormal[gBmMapTerrain[y][x]] <= 0)
        return;

    EnlistTarget(x, y, 0, 0);
}

void MakeTargetListForLightRune(struct Unit * unit)
{
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFillg(gBmMapRange, 0);

    ForEachAdjacentPosition(x, y, TryAddToLightRuneTargetList);
}

void TryAddUnitToDanceRingTargetList(struct Unit * unit)
{
    if (UNIT_FACTION(unit) != FACTION_BLUE)
        return;

    if (unit->statusIndex != UNIT_STATUS_NONE)
        return;

    EnlistTarget(unit->xPos, unit->yPos, unit->index, 0);
}

void MakeTargetListForDanceRing(struct Unit * unit)
{
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFillg(gBmMapRange, 0);

    ForEachAdjacentUnit(x, y, TryAddUnitToDanceRingTargetList);
}
