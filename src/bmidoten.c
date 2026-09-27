// Declared ahead of the headers: agbcc emits the inline functions below in the
// order they were first declared, and mapwork.h declares GetWorkingMoveCosts.
void SetWorkingBmMap(unsigned char ** map);
void MapAddInBoundedRange(short x, short y, short minRange, short maxRange);

#include "gbafe.h"
#include "gbafe/bmmap.h"
#include "gbafe/bmidoten.h"

#define gMapMovementSigned ((s8 **) gBmMapMovement)

int GetUnitWeaponReach(struct Unit * unit, int itemSlot);
int GetUnitStaffReachBits(struct Unit * unit);
int GetBallistaItemAt(int xPos, int yPos);
int GetItemMinRange(int item);
int GetItemMaxRange(int item);

inline void SetWorkingBmMap(u8 ** map)
{
    gWorkingBmMap = map;
}

void GenerateUnitMovementMap(struct Unit * unit)
{
    SetWorkingMoveTable(GetUnitMovementCost(unit));
    SetWorkingBmMap(gBmMapMovement);

    BeginMapFlood(unit->xPos, unit->yPos, UNIT_MOV(unit), unit->index);
}

void MapFloodUnitMovement(struct Unit * unit, s8 movement)
{
    SetWorkingMoveTable(GetUnitMovementCost(unit));
    SetWorkingBmMap(gBmMapMovement);

    BeginMapFlood(unit->xPos, unit->yPos, movement, unit->index);
}

void MapFloodUnitExtended(struct Unit * unit)
{
    SetWorkingMoveTable(GetUnitMovementCost(unit));
    SetWorkingBmMap(gBmMapMovement);

    BeginMapFlood(unit->xPos, unit->yPos, MAP_MOVEMENT_EXTENDED, 0);
}

void MapFloodRange_Unitless(int x, int y, const s8 mct[])
{
    SetWorkingMoveTable(mct);
    SetWorkingBmMap(gBmMapRange);

    BeginMapFlood(x, y, MAP_MOVEMENT_EXTENDED, 0);
}

void GenerateExtendedMovementMap(int x, int y, const s8 mct[])
{
    SetWorkingMoveTable(mct);
    SetWorkingBmMap(gBmMapMovement);

    BeginMapFlood(x, y, MAP_MOVEMENT_EXTENDED, 0);
}

void MapFloodOnWorkingMap(struct Unit * unit, int x, int y, int movement)
{
    SetWorkingMoveTable(GetUnitMovementCost(unit));

    BeginMapFlood(x, y, movement, unit->index);
}

void SetWorkingMoveTable(const s8 mct[])
{
    int i;

    for (i = 0; i < 0x41; ++i)
        gWorkingTerrainMoveCosts[i] = mct[i];
}

void BeginMapFlood(int x, int y, int movement, int unitId)
{
    gMovMapFillState.dst = gMovMapFillStPool1;
    gMovMapFillState.src = gMovMapFillStPool2;

    gMovMapFillState.movement = movement;

    if (unitId == 0)
    {
        gMovMapFillState.hasUnit = FALSE;
    }
    else
    {
        gMovMapFillState.hasUnit = TRUE;
        gMovMapFillState.unitId = unitId;
    }

    gMovMapFillState.maxMovementValue = MAP_MOVEMENT_MAX;

    BmMapFill(gWorkingBmMap, -1);

    gMovMapFillState.dst->xPos = x;
    gMovMapFillState.dst->yPos = y;
    gMovMapFillState.dst->connexion = 5;
    gMovMapFillState.dst->leastMoveCost = 0;

    gWorkingBmMap[y][x] = 0;

    gMovMapFillState.dst++;
    gMovMapFillState.dst->connexion = 4;

    MapFloodCoreRam();
}

void sub_08019D84(int connexion, int x, int y)
{
    short tileMovementCost;

    x += gMovMapFillState.src->xPos;
    y += gMovMapFillState.src->yPos;

    tileMovementCost = gWorkingTerrainMoveCosts[gBmMapTerrain[y][x]]
        + (s8) gWorkingBmMap[(u8) gMovMapFillState.src->yPos][(u8) gMovMapFillState.src->xPos];

    if (tileMovementCost >= gWorkingBmMap[y][x])
        return;

    if (gMovMapFillState.hasUnit && gBmMapUnit[y][x])
        if ((gBmMapUnit[y][x] ^ gMovMapFillState.unitId) & 0x80)
            return;

    if (tileMovementCost > gMovMapFillState.movement)
        return;

    gMovMapFillState.dst->xPos = x;
    gMovMapFillState.dst->yPos = y;
    gMovMapFillState.dst->connexion = connexion;
    gMovMapFillState.dst->leastMoveCost = tileMovementCost;

    gMovMapFillState.dst++;

    gWorkingBmMap[y][x] = tileMovementCost;
}

void BuildBestMoveScript(int x, int y, u8 output[])
{
    u8 * outputStart = output;

    short bestCost;
    short bestDirectionCount;

    u8 neighbourCosts[4];
    u8 bestDirections[4];

    short nextDirection = 0;

    int i;

    while (((s8 **) gWorkingBmMap)[y][x] != 0)
    {
        if (x == (gBmMapSize.x - 1))
            neighbourCosts[MOVE_CMD_MOVE_LEFT] |= 0xFF;
        else
            neighbourCosts[MOVE_CMD_MOVE_LEFT] = gWorkingBmMap[y][x+1];

        if (x == 0)
            neighbourCosts[MOVE_CMD_MOVE_RIGHT] |= 0xFF;
        else
            neighbourCosts[MOVE_CMD_MOVE_RIGHT] = gWorkingBmMap[y][x-1];

        if (y == (gBmMapSize.y - 1))
            neighbourCosts[MOVE_CMD_MOVE_UP] |= 0xFF;
        else
            neighbourCosts[MOVE_CMD_MOVE_UP] = gWorkingBmMap[y+1][x];

        if (y == 0)
            neighbourCosts[MOVE_CMD_MOVE_DOWN] |= 0xFF;
        else
            neighbourCosts[MOVE_CMD_MOVE_DOWN] = gWorkingBmMap[y-1][x];

        bestCost = 0x100;
        bestDirectionCount = 0;

        for (i = 0; i < 4; ++i)
            if (bestCost > neighbourCosts[i])
                bestCost = neighbourCosts[i];

        for (i = 0; i < 4; ++i)
            if (bestCost == neighbourCosts[i])
                bestDirections[bestDirectionCount++] = i;

        switch (bestDirectionCount)
        {

        case 1:
            nextDirection = bestDirections[0];
            break;

        case 2:
            nextDirection = bestDirections[RandNext(2)];
            break;

        case 3:
            nextDirection = bestDirections[RandNext(3)];
            break;

        case 4:
            nextDirection = bestDirections[RandNext(4)];
            break;

        }

        *output++ = nextDirection;

        switch (nextDirection)
        {

        case MOVE_CMD_MOVE_LEFT:
            x++;
            break;

        case MOVE_CMD_MOVE_RIGHT:
            x--;
            break;

        case MOVE_CMD_MOVE_UP:
            y++;
            break;

        case MOVE_CMD_MOVE_DOWN:
            y--;
            break;

        }
    }

    RevertMovementScript(outputStart, output);
}

void RevertMovementScript(u8 * begin, u8 * end)
{
    u8 buffer[MOVE_SCRIPT_MAX_LENGTH];

    u8 * it = buffer;

    while (end > begin)
        *it++ = *--end;

    *it = MOVE_CMD_HALT;

    for (it = buffer; *it != MOVE_CMD_HALT;)
        *begin++ = *it++;

    *begin = MOVE_CMD_HALT;
}

void UnitApplyWorkingMovementScript(struct Unit * unit, int x, int y)
{
    u8 * it = gWorkingMoveScr;

    for (;;)
    {
        gActionSt.x_move = x;
        gActionSt.y_move = y;

        switch (*it)
        {

        case MOVE_CMD_MOVE_UP:
            y--;
            break;

        case MOVE_CMD_MOVE_DOWN:
            y++;
            break;

        case MOVE_CMD_MOVE_LEFT:
            x--;
            break;

        case MOVE_CMD_MOVE_RIGHT:
            x++;
            break;

        }

        if (!(UNIT_CATTRIBUTES(unit) & (CA_THIEF | CA_FLYER | CA_ASSASSIN)))
        {
            if (gBmMapHidden[y][x] & HIDDEN_BIT_TRAP)
            {
                *++it = MOVE_CMD_HALT;

                gActionSt.id = ACTION_TRAPPED;
                gActionSt.x_move = x;
                gActionSt.y_move = y;

                return;
            }
        }

        if (gBmMapHidden[y][x] & HIDDEN_BIT_UNIT)
        {
            *it++ = MOVE_CMD_BUMP;
            *it++ = MOVE_CMD_HALT;

            gActionSt.id = ACTION_TRAPPED;

            return;
        }

        if (*it == MOVE_CMD_HALT)
            break;

        it++;
    }
}

void MarkMovementMapEdges(void)
{
    int ix, iy;

    for (iy = gBmMapSize.y - 1; iy >= 0; --iy)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; --ix)
        {
            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX)
                continue;

            if (gMapMovementSigned[iy][ix] == gMovMapFillState.maxMovementValue)
                continue;

            if (gMapMovementSigned[iy][ix - 1] < 0 && (ix != 0))
                gBmMapMovement[iy][ix - 1] = gMovMapFillState.maxMovementValue;

            if (gMapMovementSigned[iy][ix + 1] < 0 && (ix != (gBmMapSize.x - 1)))
                gBmMapMovement[iy][ix + 1] = gMovMapFillState.maxMovementValue;

            if (gMapMovementSigned[iy - 1][ix] < 0 && (iy != 0))
                gBmMapMovement[iy - 1][ix] = gMovMapFillState.maxMovementValue;

            if (gMapMovementSigned[iy + 1][ix] < 0 && (iy != (gBmMapSize.y - 1)))
                gBmMapMovement[iy + 1][ix] = gMovMapFillState.maxMovementValue;
        }
    }

    gMovMapFillState.maxMovementValue++;
}

void MarkWorkingMapEdges(void)
{
    int ix, iy;

    for (iy = gBmMapSize.y - 1; iy >= 0; --iy)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; --ix)
        {
            if (gWorkingBmMap[iy][ix] > MAP_MOVEMENT_MAX)
                continue;

            if ((s8) gWorkingBmMap[iy][ix] == gMovMapFillState.maxMovementValue)
                continue;

            if ((s8) gWorkingBmMap[iy][ix - 1] < 0 && (ix != 0))
                gWorkingBmMap[iy][ix - 1] = gMovMapFillState.maxMovementValue;

            if ((s8) gWorkingBmMap[iy][ix + 1] < 0 && (ix != (gBmMapSize.x - 1)))
                gWorkingBmMap[iy][ix + 1] = gMovMapFillState.maxMovementValue;

            if ((s8) gWorkingBmMap[iy - 1][ix] < 0 && (iy != 0))
                gWorkingBmMap[iy - 1][ix] = gMovMapFillState.maxMovementValue;

            if ((s8) gWorkingBmMap[iy + 1][ix] < 0 && (iy != (gBmMapSize.y - 1)))
                gWorkingBmMap[iy + 1][ix] = gMovMapFillState.maxMovementValue;
        }
    }

    gMovMapFillState.maxMovementValue++;
}

void MapAddInRange(int x, int y, int range, int value)
{
    int ix, iy, iRange;

    for (iRange = range, iy = y; (iy <= y + range) && (iy < gBmMapSize.y); --iRange, ++iy)
    {
        int xMin, xMax, xRange;

        xMin = x - iRange;
        xRange = 2 * iRange + 1;

        if (xMin < 0)
        {
            xRange += xMin;
            xMin = 0;
        }

        xMax = xMin + xRange;

        if (xMax > gBmMapSize.x)
        {
            xMax -= (xMax - gBmMapSize.x);
            xMax = gBmMapSize.x;
        }

        for (ix = xMin; ix < xMax; ++ix)
        {
            gWorkingBmMap[iy][ix] += value;
        }
    }

    for (iRange = (range - 1), iy = (y - 1); (iy >= y - range) && (iy >= 0); --iRange, --iy)
    {
        int xMin, xMax, xRange;

        xMin = x - iRange;
        xRange = 2 * iRange + 1;

        if (xMin < 0)
        {
            xRange += xMin;
            xMin = 0;
        }

        xMax = xMin + xRange;

        if (xMax > gBmMapSize.x)
        {
            xMax -= (xMax - gBmMapSize.x);
            xMax = gBmMapSize.x;
        }

        for (ix = xMin; ix < xMax; ++ix)
        {
            gWorkingBmMap[iy][ix] += value;
        }
    }
}

void MapSetInRange(int x, int y, int range, int value)
{
    int ix, iy, iRange;

    for (iRange = range, iy = y; (iy <= y + range) && (iy < gBmMapSize.y); --iRange, ++iy)
    {
        int xMin, xMax, xRange;

        xMin = x - iRange;
        xRange = 2 * iRange + 1;

        if (xMin < 0)
        {
            xRange += xMin;
            xMin = 0;
        }

        xMax = xMin + xRange;

        if (xMax > gBmMapSize.x)
        {
            xMax -= (xMax - gBmMapSize.x);
            xMax = gBmMapSize.x;
        }

        for (ix = xMin; ix < xMax; ++ix)
        {
            gWorkingBmMap[iy][ix] = value;
        }
    }

    for (iRange = (range - 1), iy = (y - 1); (iy >= y - range) && (iy >= 0); --iRange, --iy)
    {
        int xMin, xMax, xRange;

        xMin = x - iRange;
        xRange = 2 * iRange + 1;

        if (xMin < 0)
        {
            xRange += xMin;
            xMin = 0;
        }

        xMax = xMin + xRange;

        if (xMax > gBmMapSize.x)
        {
            xMax -= (xMax - gBmMapSize.x);
            xMax = gBmMapSize.x;
        }

        for (ix = xMin; ix < xMax; ++ix)
        {
            gWorkingBmMap[iy][ix] = value;
        }
    }
}

inline void MapAddInBoundedRange(short x, short y, short minRange, short maxRange)
{
    MapAddInRange(x, y, maxRange,     +1);
    MapAddInRange(x, y, minRange - 1, -1);
}

void GenerateUnitCompleteAttackRange(struct Unit * unit)
{
    int ix, iy;

    #define FOR_EACH_IN_MOVEMENT_RANGE(block) \
        for (iy = gBmMapSize.y - 1; iy >= 0; --iy) \
        { \
            for (ix = gBmMapSize.x - 1; ix >= 0; --ix) \
            { \
                if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX) \
                    continue; \
                if (gBmMapUnit[iy][ix]) \
                    continue; \
                if (gBmMapOther[iy][ix]) \
                    continue; \
                block \
            } \
        }

    switch (GetUnitWeaponReach(unit, -1))
    {

    case REACH_RANGE1:
        FOR_EACH_IN_MOVEMENT_RANGE({
            MapAddInBoundedRange(ix, iy, 1, 1);
        })

        break;

    case REACH_RANGE1 | REACH_RANGE2:
        FOR_EACH_IN_MOVEMENT_RANGE({
            MapAddInBoundedRange(ix, iy, 1, 2);
        })

        break;

    case REACH_RANGE1 | REACH_RANGE2 | REACH_RANGE3:
        FOR_EACH_IN_MOVEMENT_RANGE({
            MapAddInBoundedRange(ix, iy, 1, 3);
        })

        break;

    case REACH_RANGE2:
        FOR_EACH_IN_MOVEMENT_RANGE({
            MapAddInBoundedRange(ix, iy, 2, 2);
        })

        break;

    case REACH_RANGE2 | REACH_RANGE3:
        FOR_EACH_IN_MOVEMENT_RANGE({
            MapAddInBoundedRange(ix, iy, 2, 3);
        })

        break;

    case REACH_RANGE3:
        FOR_EACH_IN_MOVEMENT_RANGE({
            MapAddInBoundedRange(ix, iy, 3, 3);
        })

        break;

    case REACH_RANGE3 | REACH_TO10:
        FOR_EACH_IN_MOVEMENT_RANGE({
            MapAddInBoundedRange(ix, iy, 3, 10);
        })

        break;

    case REACH_RANGE1 | REACH_RANGE3:
        FOR_EACH_IN_MOVEMENT_RANGE({
            MapAddInBoundedRange(ix, iy, 1, 1);
            MapAddInBoundedRange(ix, iy, 3, 3);
        })

        break;

    case REACH_RANGE1 | REACH_RANGE3 | REACH_TO10:
        FOR_EACH_IN_MOVEMENT_RANGE({
            MapAddInBoundedRange(ix, iy, 1, 1);
            MapAddInBoundedRange(ix, iy, 3, 10);
        })

        break;

    case REACH_RANGE1 | REACH_RANGE2 | REACH_RANGE3 | REACH_TO10:
        FOR_EACH_IN_MOVEMENT_RANGE({
            MapAddInBoundedRange(ix, iy, 1, 10);
        })

        break;

    }

    if (UNIT_CATTRIBUTES(unit) & CA_BALLISTAE)
    {
        FOR_EACH_IN_MOVEMENT_RANGE({
            int item = GetBallistaItemAt(ix, iy);

            if (item)
            {
                MapAddInBoundedRange(ix, iy,
                    GetItemMinRange(item), GetItemMaxRange(item));
            }
        })
    }

    #undef FOR_EACH_IN_MOVEMENT_RANGE

    SetWorkingBmMap(gBmMapMovement);
}

void BuildUnitStandingRangeForReach(struct Unit * unit, int reach)
{
    int x = unit->xPos;
    int y = unit->yPos;

    switch (reach)
    {

    case REACH_RANGE1:
        MapAddInBoundedRange(x, y, 1, 1);
        break;

    case REACH_RANGE1 | REACH_RANGE2:
        MapAddInBoundedRange(x, y, 1, 2);
        break;

    case REACH_RANGE1 | REACH_RANGE2 | REACH_RANGE3:
        MapAddInBoundedRange(x, y, 1, 3);
        break;

    case REACH_RANGE2:
        MapAddInBoundedRange(x, y, 2, 2);
        break;

    case REACH_RANGE2 | REACH_RANGE3:
        MapAddInBoundedRange(x, y, 2, 3);
        break;

    case REACH_RANGE3:
        MapAddInBoundedRange(x, y, 3, 3);
        break;

    case REACH_RANGE3 | REACH_TO10:
        MapAddInBoundedRange(x, y, 3, 10);
        break;

    case REACH_RANGE1 | REACH_RANGE3:
        MapAddInBoundedRange(x, y, 1, 1);
        MapAddInBoundedRange(x, y, 3, 3);
        break;

    case REACH_RANGE1 | REACH_RANGE3 | REACH_TO10:
        MapAddInBoundedRange(x, y, 1, 1);
        MapAddInBoundedRange(x, y, 3, 10);
        break;

    case REACH_RANGE1 | REACH_RANGE2 | REACH_RANGE3 | REACH_TO10:
        MapAddInBoundedRange(x, y, 1, 10);
        break;

    case REACH_MAGBY2:
        MapAddInBoundedRange(x, y, 1, GetUnitMagRange(unit));
        break;

    }
}

void GenerateUnitCompleteStaffRange(struct Unit * unit)
{
    int ix, iy;

    int reach = GetUnitStaffReachBits(unit);
    int magBy2Range = GetUnitMagRange(unit);

    #define FOR_EACH_IN_MOVEMENT_RANGE(block) \
        for (iy = gBmMapSize.y - 1; iy >= 0; --iy) \
        { \
            for (ix = gBmMapSize.x - 1; ix >= 0; --ix) \
            { \
                if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX) \
                    continue; \
                if (gBmMapUnit[iy][ix]) \
                    continue; \
                if (gBmMapOther[iy][ix]) \
                    continue; \
                block \
            } \
        }

    switch (reach)
    {

    case REACH_RANGE1:
        FOR_EACH_IN_MOVEMENT_RANGE({
            MapAddInBoundedRange(ix, iy, 1, 1);
        })

        break;

    case REACH_RANGE1 | REACH_RANGE2:
        FOR_EACH_IN_MOVEMENT_RANGE({
            MapAddInBoundedRange(ix, iy, 1, 2);
        })

        break;

    case REACH_MAGBY2:
        FOR_EACH_IN_MOVEMENT_RANGE({
            MapAddInBoundedRange(ix, iy, 1, magBy2Range);
        })

        break;

    default:
        break;

    }

    #undef FOR_EACH_IN_MOVEMENT_RANGE
}

void GenerateDangerZoneRange(s8 boolDisplayStaffRange)
{
    int i, enemyFaction;
    int hasMagicRank, prevHasMagicRank;
    u8 savedUnitId;

    prevHasMagicRank = -1;

    BmMapFill(gBmMapRange, 0);

    enemyFaction = GetActiveFactionOpposingAlliance();

    for (i = enemyFaction + 1; i < enemyFaction + 0x80; ++i)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (boolDisplayStaffRange && !UnitHasMagicRank(unit))
            continue;

        if (gPlaySt.chapterVisionRange && (gBmMapFog[unit->yPos][unit->xPos] == 0))
            continue;

        if (unit->state & US_UNDER_A_ROOF)
            continue;

        MapFloodUnitMovement(unit, UNIT_MOV(unit));

        savedUnitId = gBmMapUnit[unit->yPos][unit->xPos];
        gBmMapUnit[unit->yPos][unit->xPos] = 0;

        hasMagicRank = UnitHasMagicRank(unit);

        if (prevHasMagicRank != hasMagicRank)
        {
            BmMapFill(gBmMapOther, 0);

            if (hasMagicRank)
                GenerateMagicSealMap(1);

            prevHasMagicRank = hasMagicRank;
        }

        SetWorkingBmMap(gBmMapRange);

        if (boolDisplayStaffRange)
            GenerateUnitCompleteStaffRange(unit);
        else
            GenerateUnitCompleteAttackRange(unit);

        gBmMapUnit[unit->yPos][unit->xPos] = savedUnitId;
    }
}

void GenerateMagicSealMap(int value)
{
    int i;

    for (i = FACTION_RED + 1; i < FACTION_RED + 0x40; ++i)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (UNIT_CATTRIBUTES(unit) & CA_MAGICSEAL)
            MapSetInRange(unit->xPos, unit->yPos, 10, value);
    }
}

inline s8 * GetWorkingMoveCosts(void)
{
    return gWorkingTerrainMoveCosts;
}
