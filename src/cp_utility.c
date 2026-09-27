#include "gbafe.h"
#include "gbafe/cp_common.h"

#define gMapRangeSigned ((s8 **) gBmMapRange)
#define gMapMovementSigned ((s8 **) gBmMapMovement)
#define ITEM_INDEX(item) ((item) & 0xFF)

extern struct Vec2 CONST_DATA sRange3OffsetLut[];
extern u8 CONST_DATA gTerrainList_LootableVillages[];
extern u8 CONST_DATA gTerrainList_LootableVillagesAndChests[];
extern const u8 * CONST_DATA gAiClassRankLists[];
extern u16 CONST_DATA gAiStealPriorityItemList[];

s8 AiCompare(const u8 * left, u8 op, u32 right)
{
    switch (op)
    {
    case AI_COMPARE_GT:
        if (*left > right)
            return 1;
        break;

    case AI_COMPARE_GE:
        if (*left >= right)
            return 1;
        break;

    case AI_COMPARE_EQ:
        if (*left == right)
            return 1;
        break;

    case AI_COMPARE_LE:
        if (*left <= right)
            return 1;
        break;

    case AI_COMPARE_LT:
        if (*left < right)
            return 1;
        break;

    case AI_COMPARE_NE:
        if (*left != right)
            return 1;
        break;
    }

    return 0;
}

s8 AiFindTargetInReachByCharId(int uid, struct Vec2 * out)
{
    int i;

    MapFloodRange_Unitless(gActiveUnit->xPos, gActiveUnit->yPos, GetUnitMovementCost(gActiveUnit));
    MarkWorkingMapEdges();

    out->x = -1;

    for (i = 1; i < 0xC0; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (gBmMapRange[unit->yPos][unit->xPos] > MAP_MOVEMENT_MAX)
            continue;

        if (unit->pCharacterData->number != uid)
            continue;

        if (unit->state & US_DEAD)
        {
            gAiState.cmd_result[0] = 1;
            return 0;
        }

        if (unit->state & US_RESCUED)
            gAiState.cmd_result[0] = 3;

        out->x = unit->xPos;
        out->y = unit->yPos;
    }

    if (out->x >= 0)
        return 1;

    if (!(GetUnitFromCharId(uid)->state & US_UNAVAILABLE))
    {
        gAiState.cmd_result[0] = 4;
        return 0;
    }

    gAiState.cmd_result[0] = 1;

    return 0;
}

s8 AiFindTargetInReachByClassId(int classId, struct Vec2 * out)
{
    int i;

    u8 bestDistance = 0xFF;

    MapFloodRange_Unitless(gActiveUnit->xPos, gActiveUnit->yPos, GetUnitMovementCost(gActiveUnit));

    out->x = -1;

    for (i = 1; i < 0xC0; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & (US_HIDDEN | US_DEAD | US_RESCUED | US_BIT16))
            continue;

        if (gBmMapRange[unit->yPos][unit->xPos] > MAP_MOVEMENT_MAX)
            continue;

        if (unit->pClassData->number != classId)
            continue;

        if (bestDistance < gMapRangeSigned[unit->yPos][unit->xPos])
            continue;

        bestDistance = gBmMapRange[unit->yPos][unit->xPos];
        out->x = unit->xPos;
        out->y = unit->yPos;
    }

    if (out->x >= 0)
        return 1;

    return 0;
}

s8 AiFindTargetInReachByFunc(s8 (* func)(struct Unit * unit), struct Vec2 * out)
{
    s16 ix;
    s16 iy;

    u8 bestDistance = 0xFF;

    s16 xOut = 0;
    s16 yOut = 0;

    MapFloodRange_Unitless(gActiveUnit->xPos, gActiveUnit->yPos, GetUnitMovementCost(gActiveUnit));

    xOut = -1;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
        {
            if (gBmMapRange[iy][ix] > MAP_MOVEMENT_MAX)
                continue;

            if (gBmMapUnit[iy][ix] == 0)
                continue;

            if (gBmMapUnit[iy][ix] == gActiveUnitId)
                continue;

            if (!func(GetUnit(gBmMapUnit[iy][ix])))
                continue;

            if (gBmMapRange[iy][ix] > bestDistance)
                continue;

            bestDistance = gBmMapRange[iy][ix];
            xOut = ix;
            yOut = iy;
        }
    }

    if (xOut >= 0)
    {
        out->x = xOut;
        out->y = yOut;

        return 1;
    }

    return 0;
}

s8 AiFindTargetInReachNeglectWallByFunc(s8 (* func)(struct Unit * unit), struct Vec2 * out)
{
    s16 ix;
    s16 iy;

    u8 bestDistance = 0xFF;

    s16 xOut = 0;
    s16 yOut = 0;

    GenerateExtendedMovementMapOnRangeNeglectWall(gActiveUnit->xPos, gActiveUnit->yPos, GetUnitMovementCost(gActiveUnit));

    xOut = -1;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
        {
            if (gBmMapRange[iy][ix] > MAP_MOVEMENT_MAX)
                continue;

            if (gBmMapUnit[iy][ix] == 0)
                continue;

            if (gBmMapUnit[iy][ix] == gActiveUnitId)
                continue;

            if (func(GetUnit(gBmMapUnit[iy][ix])) == 0)
                continue;

            if (gBmMapRange[iy][ix] > bestDistance)
                continue;

            bestDistance = gBmMapRange[iy][ix];
            xOut = ix;
            yOut = iy;
        }
    }

    if (xOut >= 0)
    {
        out->x = xOut;
        out->y = yOut;

        return 1;
    }

    return 0;
}

void AiRandomMove(void)
{
    s16 ix;
    s16 iy;

    u8 lastRand = 0;

    s16 xOut = 0;
    s16 yOut = 0;

    RevertMapChange(gActiveUnit);

    xOut = -1;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
        {
            u8 rand;

            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX)
                continue;

            if (gBmMapUnit[iy][ix] != 0)
                continue;

            rand = RandNext(0x100);

            if (rand < lastRand)
                continue;

            lastRand = rand;
            xOut = ix;
            yOut = iy;
        }
    }

    if (xOut >= 0)
        AiSetDecision(xOut, yOut, AI_ACTION_NONE, 0, 0, 0, 0);
}

s8 AiReachesByBirdsEyeDistance(struct Unit * unit, struct Unit * other, u16 item)
{
    int distance = RECT_DISTANCE(unit->xPos, unit->yPos, other->xPos, other->yPos);

    if (distance <= UNIT_MOV(unit) + GetItemMaxRange(item))
        return 1;

    return 0;
}

s8 AiCouldReachByBirdsEyeDistance(struct Unit * unit, struct Unit * other, u16 item)
{
    int distance = RECT_DISTANCE(unit->xPos, unit->yPos, other->xPos, other->yPos);

    if (distance <= UNIT_MOV(unit) + UNIT_MOV(other) + GetItemMaxRange(item))
        return 1;

    return 0;
}

s8 AiIsInShortList(const u16 * list, u16 item)
{
    while (*list)
    {
        if (*list == item)
            return 1;

        list++;
    }

    return 0;
}

s8 AiIsInByteList(const u8 * list, u8 item)
{
    while (*list)
    {
        if (*list == item)
            return 1;

        list++;
    }

    return 0;
}

s8 AiFindClosestTerrainPosition(const u8 * terrainList, int flags, struct Vec2 * out)
{
    int ix;
    int iy;

    u8 bestDistance = 0xFF;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
        {
            if (gBmMapRange[iy][ix] > MAP_MOVEMENT_MAX)
                continue;

            if (AiIsInByteList(terrainList, gBmMapTerrain[iy][ix]) == 0)
                continue;

            if (flags & AI_FLAG_0)
            {
                if ((gBmMapUnit[iy][ix] != 0) && (AreUnitIdsAllied(gActiveUnit->index, gBmMapUnit[iy][ix]) == 0))
                    continue;
            }

            if (flags & AI_FLAG_STAY)
            {
                if (AiCountNearbyEnemyUnits(ix, iy) != 0)
                    continue;
            }

            if (bestDistance <= gMapRangeSigned[iy][ix])
                continue;

            out->x = ix;
            out->y = iy;

            bestDistance = gBmMapRange[iy][ix];
        }
    }

    if (bestDistance != 0xFF)
        return 1;

    return 0;
}

u8 AiGetPositionRange(int x, int y)
{
    if (gMapRangeSigned[y][x] >= MAP_MOVEMENT_MAX)
        return 0xFF;

    if (gBmMapUnit[y][x] != 0 && gBmMapUnit[y][x] != gActiveUnitId)
        return 0xFF;

    return gBmMapRange[y][x];
}

s8 AiFindClosestTerrainAdjacentPosition(const u8 * terrainList, int flags, struct Vec2 * out)
{
    int ix;
    int iy;
    struct Vec2 tmp;

    u8 bestDistance = 0xFF;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
        {
            if (gBmMapRange[iy][ix] > MAP_MOVEMENT_MAX)
                continue;

            if (!AiIsInByteList(terrainList, gBmMapTerrain[iy][ix]))
                continue;

            if (flags & AI_FLAG_0)
            {
                if (gBmMapUnit[iy][ix] != 0 && !AreUnitIdsAllied(gActiveUnit->index, gBmMapUnit[iy][ix]))
                    continue;
            }

            if (flags & AI_FLAG_STAY)
            {
                if (AiCountNearbyEnemyUnits(ix, iy) != 0)
                    continue;
            }

            if (!AiFindBestAdjacentPositionByFunc(ix, iy, AiGetPositionRange, &tmp))
                continue;

            if (bestDistance <= gMapRangeSigned[tmp.y][tmp.x])
                continue;

            out->x = tmp.x;
            out->y = tmp.y;
            bestDistance = gBmMapRange[tmp.y][tmp.x];
        }
    }

    if (bestDistance != 0xFF)
        return 1;

    return 0;
}

s8 AiFindClosestUnlockPosition(int flags, struct Vec2 * out)
{
    int ix;
    int iy;
    struct Vec2 tmp;
    u16 zero = 0;

    u8 bestDistance = 0xFF;
    u8 count = 0;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
        {
            if (gBmMapRange[iy][ix] > MAP_MOVEMENT_MAX)
                continue;

            switch (gBmMapTerrain[iy][ix])
            {
            case TERRAIN_DOOR:
                count++;

                if (flags & AI_FLAG_3)
                    continue;

                if (!AiFindBestAdjacentPositionByFunc(ix, iy, AiGetPositionRange, &tmp))
                    continue;

                break;

            case TERRAIN_CHEST:
                count++;

                if (flags & AI_FLAG_BERSERKED)
                    continue;

                tmp.x = ix;
                tmp.y = iy;

                if (gBmMapMovement[iy][ix] <= UNIT_MOV(gActiveUnit))
                {
                    if (flags & AI_FLAG_0)
                    {
                        if (gBmMapUnit[tmp.y][tmp.x] != 0 && !AreUnitIdsAllied(gActiveUnit->index, gBmMapUnit[tmp.y][tmp.x]))
                            continue;
                    }

                    if (flags & AI_FLAG_STAY)
                    {
                        if (AiCountNearbyEnemyUnits(tmp.x, tmp.y) != 0)
                            continue;
                    }

                    out->x = tmp.x;
                    out->y = tmp.y;

                    return 1;
                }

                break;

            default:
                continue;
            }

            if (flags & 1)
            {
                if (gBmMapUnit[tmp.y][tmp.x] != 0 && !AreUnitIdsAllied(gActiveUnit->index, gBmMapUnit[tmp.y][tmp.x]))
                    continue;
            }

            if (flags & 2)
            {
                if (AiCountNearbyEnemyUnits(tmp.x, tmp.y) != 0)
                    continue;
            }

            if (bestDistance <= gMapRangeSigned[tmp.y][tmp.x])
                continue;

            out->x = tmp.x;
            out->y = tmp.y;
            bestDistance = gBmMapRange[tmp.y][tmp.x];
        }
    }

    if (!(zero & 0x10000))
        gAiState.cmd_result[1] = 1;

    if (count == 0)
        gAiState.cmd_result[0] = 5;

    if (bestDistance != 0xFF)
        return 1;

    return 0;
}

int AiCountUnitsInRange(void)
{
    int ix;
    int iy;

    int count = 0;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
        {
            if (gMapRangeSigned[iy][ix] == 0)
                continue;

            if (gBmMapUnit[iy][ix] == 0)
                continue;

            count++;
        }
    }

    return count;
}

int AiCountEnemyUnitsInRange(void)
{
    int ix;
    int iy;

    int count = 0;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
        {
            if (gMapRangeSigned[iy][ix] == 0)
                continue;

            if (gBmMapUnit[iy][ix] == 0)
                continue;

            if (AreUnitIdsAllied(gActiveUnitId, gBmMapUnit[iy][ix]))
                continue;

            count++;
        }
    }

    return count;
}

int AiCountAlliedUnitsInRange(void)
{
    int ix;
    int iy;

    int count = 0;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
        {
            if (gMapRangeSigned[iy][ix] == 0)
                continue;

            if (gBmMapUnit[iy][ix] == 0)
                continue;

            if (AreUnitIdsAllied(gActiveUnitId, gBmMapUnit[iy][ix]) != 1)
                continue;

            count++;
        }
    }

    return count;
}

int AiCountNearbyUnits(s16 x, s16 y)
{
    int count = 0;

    struct Vec2 * it = sRange3OffsetLut;

    it--;

    while (it->x != 9999)
    {
        it++;

        if (x + it->x >= gBmMapSize.x)
            continue;

        if (y + it->y >= gBmMapSize.y)
            continue;

        if (gBmMapUnit[y + it->y][x + it->x] == 0)
            continue;

        count++;
    }

    return count;
}

int AiCountNearbyEnemyUnits(s16 x, s16 y)
{
    int count = 0;

    struct Vec2 * it = sRange3OffsetLut;

    it--;

    while (it->x != 9999)
    {
        it++;

        if (x + it->x >= gBmMapSize.x)
            continue;

        if (y + it->y >= gBmMapSize.y)
            continue;

        if (gBmMapUnit[y + it->y][x + it->x] == 0)
            continue;

        if (AreUnitIdsAllied(gActiveUnitId, gBmMapUnit[y + it->y][x + it->x]))
            continue;

        count++;
    }

    return count;
}

int AiCountNearbyAlliedUnits(s16 x, s16 y)
{
    int count = 0;

    struct Vec2 * it = sRange3OffsetLut;

    it--;

    while (it->x != 9999)
    {
        it++;

        if (x + it->x >= gBmMapSize.x)
            continue;

        if (y + it->y >= gBmMapSize.y)
            continue;

        if (gBmMapUnit[y + it->y][x + it->x] == 0)
            continue;

        if (AreUnitIdsAllied(gActiveUnitId, gBmMapUnit[y + it->y][x + it->x]) != 1)
            continue;

        count++;
    }

    return count;
}

void AiMakeMoveRangeMapsForUnitAndWeapon(struct Unit * unit, u16 item)
{
    int ix;
    int iy;

    RevertMapChange(unit);
    BmMapFillg(gBmMapRange, 0);

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
        {
            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX)
                continue;

            MapAddInBoundedRange(ix, iy, GetItemMinRange(item), GetItemMaxRange(item));
        }
    }
}

void AiMakeMoveRangeUnitPowerMaps(struct Unit * unit)
{
    int ix;
    int iy;

    int power = GetUnitPower(unit) > 20 ? 20 : GetUnitPower(unit);

    RevertMapChange(unit);
    BmMapFillg(gBmMapRange, 0);

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
        {
            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX)
                continue;

            MapAddInRange(ix, iy, power, 1);
        }
    }
}

void sub_08036770(struct Unit * unit, u16 item)
{
    int ix;
    int iy;

    RevertMapChange(unit);
    BmMapFillg(gBmMapRange, 0);

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
        {
            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX)
                continue;

            MapAddInBoundedRange(ix, iy, GetItemMinRange(item), GetItemMaxRange(item));
        }
    }
}

s8 AiFindBestAdjacentPositionByFunc(int x, int y, u8 (* funcArg)(int x, int y), struct Vec2 * out)
{
    int i;

    u8 (* func)(int x, int y) = funcArg;

    u8 best = 0xFF;

    s8 adjacencyLut[8] =
    {
        +1,  0,
        -1,  0,
         0, +1,
         0, -1,
    };

    for (i = 0; i < 4; i++)
    {
        u8 val = func(x + adjacencyLut[i * 2 + 0], y + adjacencyLut[i * 2 + 1]);

        if (val == 0xFF)
            continue;

        if (best <= val)
            continue;

        best = val;
        out->x = x + adjacencyLut[i * 2 + 0];
        out->y = y + adjacencyLut[i * 2 + 1];
    }

    if (best != 0xFF)
        return 1;

    return 0;
}

int AiGetItemStealRank(u16 item)
{
    int result = 0;

    u16 * it = gAiStealPriorityItemList;

    while (*it != 0xFFFF)
    {
        if (*it == item)
            return result;

        it++;
        result++;
    }

    return -1;
}

s8 AiGetUnitStealItemSlot(struct Unit * unit)
{
    int i;

    u8 rank = 0xFF;
    u8 slot = 0xFF;

    for (i = 0; i < UNIT_ITEM_COUNT; i++)
    {
        u8 rankNew;

        u16 item = unit->items[i];

        if (item == 0)
            return slot;

        rankNew = AiGetItemStealRank(ITEM_INDEX(item));

        if (rank < rankNew)
            continue;

        rank = rankNew;
        slot = i;
    }

    return slot;
}

s8 AiFindSafestReachableLocation(struct Unit * unit, struct Vec2 * out)
{
    int ix;
    int iy;

    u8 bestDanger = 0xFF;

    if (gAiState.flags & AI_FLAG_STAY)
    {
        BmMapFillg(gBmMapMovement, -1);
        gBmMapMovement[unit->yPos][unit->xPos] = 0;
    }
    else
    {
        RevertMapChange(unit);
    }

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
        {
            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX)
                continue;

            if (gBmMapUnit[iy][ix] != 0 && gBmMapUnit[iy][ix] != gActiveUnitId)
                continue;

            if (bestDanger < gBmMapOther[iy][ix])
                continue;

            out->x = ix;
            out->y = iy;

            bestDanger = gBmMapOther[iy][ix];
        }
    }

    if (bestDanger != 0xFF)
        return 1;

    return 0;
}

s8 AiFindPillageLocation(struct Vec2 * out, u8 * outItemSlot)
{
    u8 * terrainList;

    SetWorkingMoveTable(GetUnitMovementCost(gActiveUnit));
    SetWorkingBmMap(gBmMapRange);

    BeginMapFlood(gActiveUnit->xPos, gActiveUnit->yPos, 0x7C, gActiveUnit->index);

    terrainList = AiGetChestUnlockItemSlot(outItemSlot) == 1
        ? gTerrainList_LootableVillagesAndChests
        : gTerrainList_LootableVillages;

    if (AiFindClosestTerrainPosition(terrainList, 1, out) == 1)
        return 1;

    MapFloodRange_Unitless(gActiveUnit->xPos, gActiveUnit->yPos, GetUnitMovementCost(gActiveUnit));

    if (AiFindClosestTerrainPosition(terrainList, 0, out) == 1)
        return 1;

    return 0;
}

s8 AiGetChestUnlockItemSlot(u8 * out)
{
    int i;

    *out = 0;

    if (GetUnitItemCount(gActiveUnit) == UNIT_ITEM_COUNT)
    {
        gActiveUnit->aiFlags |= AI_UNIT_FLAG_3;
        return 0;
    }

    for (i = 0; i < UNIT_ITEM_COUNT; i++)
    {
        u16 item = gActiveUnit->items[i];

        if (item == 0)
            return 0;

        *out = i;

        if (GetItemIndex(item) == ITEM_CHESTKEY)
            return 1;

        if (GetItemIndex(item) == ITEM_LOCKPICK)
        {
            if (UNIT_CATTRIBUTES(gActiveUnit) & CA_STEAL)
                return 1;
        }
    }

    return 0;
}

void AiTryMoveTowards(s16 x, s16 y, u8 action, u8 maxDanger, u8 unk)
{
    s16 ix;
    s16 iy;

    u8 bestRange;

    s16 xOut = 0;
    s16 yOut = 0;

    if ((gActiveUnit->xPos == x) && (gActiveUnit->yPos == y))
    {
        AiSetDecision(gActiveUnit->xPos, gActiveUnit->yPos, action, 0, 0, 0, 0);
        return;
    }

    if (unk)
        MapFloodRange_Unitless(x, y, GetUnitMovementCost(gActiveUnit));
    else
        AiMapFloodRangeFrom(x, y, gActiveUnit);

    RevertMapChange(gActiveUnit);

    bestRange = gBmMapRange[gActiveUnit->yPos][gActiveUnit->xPos];
    xOut = -1;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
        {
            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX)
                continue;

            if (gBmMapUnit[iy][ix] != 0 && gBmMapUnit[iy][ix] != gActiveUnitId)
                continue;

            if (maxDanger == 0)
            {
                if (UNIT_MOV(gActiveUnit) < gAiState.bestBlueMov && gBmMapOther[iy][ix] != 0)
                    continue;
            }

            if (!AiCheckDangerAt(ix, iy, maxDanger))
                continue;

            if (gBmMapRange[iy][ix] > bestRange)
                continue;

            bestRange = gBmMapRange[iy][ix];
            xOut = ix;
            yOut = iy;
        }
    }

    if (xOut >= 0)
        AiSetDecision(xOut, yOut, action, AI_ACTION_NONE, 0, 0, 0);
}

void AiTryMoveTowardsNeglectWall(s16 x, s16 y, u8 action, u8 maxDanger, u8 unk)
{
    s16 ix;
    s16 iy;

    u8 bestRange;

    s16 xOut = 0;
    s16 yOut = 0;

    if ((gActiveUnit->xPos == x) && (gActiveUnit->yPos == y))
    {
        AiSetDecision(gActiveUnit->xPos, gActiveUnit->yPos, action, 0, 0, 0, 0);
        return;
    }

    if (unk)
        GenerateExtendedMovementMapOnRangeNeglectWall(x, y, GetUnitMovementCost(gActiveUnit));
    else
        sub_0803BF8C(x, y, gActiveUnit);

    RevertMapChange(gActiveUnit);

    bestRange = gBmMapRange[gActiveUnit->yPos][gActiveUnit->xPos];
    xOut = -1;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
        {
            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX)
                continue;

            if (gBmMapUnit[iy][ix] != 0 && gBmMapUnit[iy][ix] != gActiveUnitId)
                continue;

            if (maxDanger == 0)
            {
                if (UNIT_MOV(gActiveUnit) < gAiState.bestBlueMov && gBmMapOther[iy][ix] != 0)
                    continue;
            }

            if (!AiCheckDangerAt(ix, iy, maxDanger))
                continue;

            if (gBmMapRange[iy][ix] > bestRange)
                continue;

            bestRange = gBmMapRange[iy][ix];
            xOut = ix;
            yOut = iy;
        }
    }

    if (xOut >= 0)
        AiSetDecision(xOut, yOut, action, AI_ACTION_NONE, 0, 0, 0);
}

s8 AiGetUnitClosestValidPosition(struct Unit * unit, s16 x, s16 y, struct Vec2 * out)
{
    s16 ix;
    s16 iy;
    u8 bestRange;

    if ((gBmMapUnit[y][x] | gBmMapOther[y][x] | gBmMapHidden[y][x]) == 0)
    {
        out->x = x;
        out->y = y;

        return 1;
    }

    MapFloodRange_Unitless(x, y, GetUnitMovementCost(unit));
    MapFloodUnitExtended(unit);

    bestRange = 124;
    out->x = -1;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
        {
            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX)
                continue;

            if ((gBmMapUnit[iy][ix] | gBmMapOther[iy][ix] | gBmMapHidden[iy][ix]) != 0)
                continue;

            if (gBmMapRange[iy][ix] > bestRange)
                continue;

            bestRange = gBmMapRange[iy][ix];
            out->x = ix;
            out->y = iy;
        }
    }

    if (out->x != -1)
        return 1;

    return 0;
}

u8 AiGetClassRank(u8 classId)
{
    u8 num = 0;
    const u8 * const * it = gAiClassRankLists;

    while (*it != NULL)
    {
        const u8 * itClass = *it;

        while (*itClass != 0)
        {
            if (*itClass == classId)
                return num;

            itClass++;
        }

        num++;
        it++;
    }

    return num;
}

s8 AiUnitWithCharIdExists(u16 uid)
{
    int i;

    for (i = 1; i < 0xC0; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->pCharacterData->number != uid)
            continue;

        if (unit->state & US_RESCUED)
            return 1;

        if (unit->state & (US_HIDDEN | US_DEAD | US_BIT16))
            return 0;

        return 1;
    }

    return 0;
}

s8 AiIsWithinRectDistance(s16 x, s16 y, u8 x2, u8 y2, u8 maxDistance)
{
    u16 distance = RECT_DISTANCE(x, y, x2, y2);

    if (distance <= maxDistance)
        return 1;

    return 0;
}

s8 AiLocationIsPillageTarget(u8 x, u8 y)
{
    u8 tmp;

    switch (gBmMapTerrain[y][x])
    {
    case TERRAIN_VILLAGE:
        return 1;

    case TERRAIN_CHURCH:
        return 1;

    case 0x37: // ruins (village)
        return 1;

    case TERRAIN_CHEST:
        if (AiGetChestUnlockItemSlot(&tmp) == 1)
            return 1;

        return 0;
    }

    return 0;
}

void SetupUnitInventoryAIFlags(void)
{
    int i;
    int j;

    gAiState.bestBlueMov = 0;

    for (i = 1; i < 0x40; i++)
    {
        u8 mov;
        int item;

        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & (US_HIDDEN | US_DEAD | US_BIT16))
            continue;

        mov = UNIT_MOV(unit);

        if (mov > gAiState.bestBlueMov)
            gAiState.bestBlueMov = mov;

        for (j = 0; ((j < UNIT_ITEM_COUNT) && (item = unit->items[j])); j++)
        {
            if (!CanUnitUseWeapon(unit, item) && !CanUnitUseStaff(unit, item))
                continue;

            if (GetItemAttributes(item) & IA_MAGIC)
                unit->aiFlags |= AI_UNIT_FLAG_0;

            SetupUnitStatusStaffAIFlags(unit, item);
            SetupUnitHealStaffAIFlags(unit, item);
        }

        SaveNumberOfAlliedUnitsIn0To8Range(unit);
    }
}

void SetupUnitStatusStaffAIFlags(struct Unit * unit, u16 item)
{
    u8 flags;

    if (!(GetItemAttributes(item) & IA_STAFF))
        return;

    flags = AI_UNIT_FLAG_1;

    switch (GetItemIndex(item))
    {
    case ITEM_STAFF_SILENCE:
        flags = AI_UNIT_FLAG_3;
        break;

    case ITEM_STAFF_SLEEP:
        flags = AI_UNIT_FLAG_4;
        break;

    case ITEM_STAFF_BERSERK:
        flags = AI_UNIT_FLAG_5;
        break;
    }

    unit->aiFlags |= flags;
}

void SetupUnitHealStaffAIFlags(struct Unit * unit, u16 item)
{
    int flags = 0;

    if ((GetItemAttributes(item) & IA_WEAPON) && (GetItemMaxRange(item) > 1))
        flags = AI_UNIT_FLAG_6;

    switch (GetItemEffect(item))
    {
    case 0x01:
    case 0x02:
    case 0x03:
    case 0x04:
    case 0x05:
    case 0x21:
    case 0x22:
        flags |= AI_UNIT_FLAG_2;
        break;
    }

    unit->aiFlags |= flags;
}

void SaveNumberOfAlliedUnitsIn0To8Range(struct Unit * unit)
{
    int ix;
    int iy;

    int count = 0;

    BmMapFillg(gBmMapMovement, 0);
    MapAddInBoundedRange(unit->xPos, unit->yPos, 1, 8);

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
        {
            if (gMapMovementSigned[iy][ix] == 0)
                continue;

            if (gBmMapUnit[iy][ix] == 0)
                continue;

            if (!AreUnitIdsAllied(unit->index, gBmMapUnit[iy][ix]))
                continue;

            count++;
        }
    }

    unit->_u46 = count;
}

void CharStoreAI(struct Unit * unit, const struct UnitDefinition * uDef)
{
    unit->ai1 = uDef->ai[0];

    unit->ai2 = uDef->ai[1];

    unit->ai3And4 &= ~AI_UNIT_CONFIG_HEALTHRESHOLD_MASK;
    unit->ai3And4 |= uDef->ai[2];
    unit->ai3And4 |= (uDef->ai[3] << 8);
}

s8 sub_08037380(struct Vec2 * out)
{
    int ix;
    int iy;

    u32 maxVal = 0;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
        {
            u32 val;

            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX)
                continue;

            if (gMapRangeSigned[iy][ix] == 0)
                continue;

            if (gBmMapUnit[iy][ix] != 0 && gBmMapUnit[iy][ix] != gActiveUnitId)
                continue;

            val = ((AiGetTerrainCombatPositionScoreComponent(ix, iy) + AiGetFriendZoneCombatPositionScoreComponent(ix, iy)) - gBmMapOther[iy][ix] / 8) + 0x7FFFFFFF;

            if (maxVal >= val)
                continue;

            out->x = ix;
            out->y = iy;
            maxVal = val;
        }
    }

    if (maxVal != 0)
        return 1;

    return 0;
}

int sub_08037460(void)
{
    int count = 0;
    int i, alliance = GetActiveFactionAlliance();

    for (i = alliance + 1; i < alliance + 0x80; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & (US_HIDDEN | US_DEAD | US_BIT16))
            continue;

        if (unit->aiFlags & AI_FLAG_0)
            count++;
    }

    return count;
}

int sub_080374AC(void)
{
    int ix;
    int iy;

    int count = 0;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
        {
            if (gMapRangeSigned[iy][ix] == 0)
                continue;

            if (gBmMapUnit[iy][ix] == 0)
                continue;

            if (!AreUnitIdsAllied(gActiveUnitId, gBmMapUnit[iy][ix]))
                continue;

            if (GetUnit(gBmMapUnit[iy][ix])->aiFlags & AI_UNIT_FLAG_0)
                count++;
        }
    }

    return count;
}

s8 sub_08037548(struct Unit * unit)
{
    int i;

    for (i = 0; i < UNIT_ITEM_COUNT; i++)
    {
        u16 item = unit->items[i];

        if (item == 0)
            return 0;

        if (GetItemAttributes(item) & (IA_STAFF | IA_MAGIC))
        {
            if (CanUnitUseStaff(unit, item))
                return 1;
        }
    }

    return 0;
}

void sub_0803758C(struct Unit * unit)
{
    if (gAiState.flags & AI_FLAG_STAY)
        MapFloodUnitMovement(unit, 0);
    else
        RevertMapChange(unit);
}
