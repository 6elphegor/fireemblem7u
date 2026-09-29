#include "gbafe.h"
#include "gbafe/cp_common.h"

#define gMapRangeSigned ((s8 **) gBmMapRange)
#define gMapMovementSigned ((s8 **) gBmMapMovement)

// terrain move cost table size (the terrain lookups are 0x41 entries long)
#define AI_TERRAIN_COST_COUNT 0x41

extern s8 gWorkingTerrainMoveCosts[];

struct AiSpecialItemLutEntry {
    u16 itemId;
    void (* func)(int itemIdx);
};

extern const struct AiSpecialItemLutEntry sAiSpecialItemFuncLut[];

CONST_DATA const u8 sAiTerrainList_Door[] = {
    0x1E, 0,
};

CONST_DATA const u8 sAiTerrainList_Chest[] = {
    0x21, 0,
};

int GetSpecialItemFuncIndex(u16 item)
{
    int index = 0;
    u16 itemId = GetItemIndex(item);

    for (; sAiSpecialItemFuncLut[index].itemId != 0; index++)
    {
        if (itemId != sAiSpecialItemFuncLut[index].itemId)
            continue;

        if (sAiSpecialItemFuncLut[index].func != 0)
            return index;
    }

    return -1;
}

s8 AiTryDoSpecialItems(void)
{
    int i;

    if (gAiState.flags & AI_FLAG_STAY)
        return 0;

    for (i = 0; i < UNIT_ITEM_COUNT; i++)
    {
        int funcIndex;
        u16 item = gActiveUnit->items[i];

        if (item == 0)
            break;

        if (GetItemType(item) == 0)
            continue;

        funcIndex = GetSpecialItemFuncIndex(item);

        if (funcIndex == -1)
            continue;

        sAiSpecialItemFuncLut[funcIndex].func(i);
    }

    if (gAiState.decideState == 0)
        return 1;

    return gAiDecision.actionPerformed;
}

void AiSpecialItemDoorKey(int item)
{
    struct Vec2 pos;

    if (!(gAiState.specialItemFlags & 0x80000001))
        return;

    if (sub_0803BCE8(gActiveUnit, &pos) == 0)
        return;

    AiTryMoveTowards(pos.x, pos.y, 0, gAiState.unk7E, 1);

    if (gAiDecision.actionPerformed != 1)
        return;

    if (AiIsWithinRectDistance(pos.x, pos.y, gAiDecision.xMove, gAiDecision.yMove, 0) == 1)
        AiSetDecision(gAiDecision.xMove, gAiDecision.yMove, AI_ACTION_USEITEM, 0, item, 0, 0);
}

void AiSpecialItemLockpick(int item)
{
    struct Vec2 pos;
    u32 flags = 0;

    if (!(gAiState.specialItemFlags & 2))
        return;

    if (GetUnitItemCount(gActiveUnit) >= UNIT_ITEM_COUNT)
    {
        if (!(gActiveUnit->aiFlags & 8))
        {
            gActiveUnit->aiFlags |= 8;
            gAiState.decideState = 0;

            return;
        }
    }

    if (!(UNIT_CATTRIBUTES(gActiveUnit) & CA_STEAL))
        return;

    if (GetUnitItemCount(gActiveUnit) >= UNIT_ITEM_COUNT)
        flags |= 4;

    if (sub_0803BD64(gActiveUnit, flags, &pos) == 1)
    {
        AiTryMoveTowards(pos.x, pos.y, 0, gAiState.unk7E, 0);

        if ((gAiDecision.actionPerformed != 1))
            return;

        if ((AiIsWithinRectDistance(pos.x, pos.y, gAiDecision.xMove, gAiDecision.yMove, 0) == 1))
            AiSetDecision(gAiDecision.xMove, gAiDecision.yMove, AI_ACTION_USEITEM, 0, item, 0, 0);
    }
}

void AiSpecialItemAntitoxin(int item)
{
    struct Vec2 pos;

    if (!(gAiState.specialItemFlags & 4))
        return;

    if (gActiveUnit->statusIndex != UNIT_STATUS_POISON)
        return;

    if (AiFindSafestReachableLocation(gActiveUnit, &pos) == 1)
        AiSetDecision(pos.x, pos.y, AI_ACTION_USEITEM, 0, item, 0, 0);
}

u8 sub_0803BC90(int x, int y)
{
    if (gMapRangeSigned[y][x] >= MAP_MOVEMENT_MAX)
        return -1;

    if ((gBmMapUnit[y][x] != 0) && (gBmMapUnit[y][x] != gActiveUnitId))
        return -1;

    return gBmMapRange[y][x];
}

s8 sub_0803BCE8(struct Unit * unit, struct Vec2 * pos)
{
    sub_0803BFF4(unit);

    if (!AiFindClosestTerrainAdjacentPosition(sAiTerrainList_Door, 0, pos))
        return 0;

    sub_0803BED0(unit);

    if (gMapRangeSigned[pos->y][pos->x] >= MAP_MOVEMENT_MAX)
        return 0;

    return 1;
}

s8 sub_0803BD3C(struct Unit * unit, struct Vec2 * pos)
{
    sub_0803BED0(unit);

    if (AiFindClosestTerrainPosition(sAiTerrainList_Chest, 0, pos) == 0)
        return 0;

    return 1;
}

s8 sub_0803BD64(struct Unit * unit, u32 flags, struct Vec2 * pos)
{
    InitAiMoveMapForUnit(unit);
    sub_0803BFC0(unit);

    if ((AiFindClosestUnlockPosition(flags | 1, pos) == 1) && (gMapMovementSigned[pos->y][pos->x] < MAP_MOVEMENT_MAX))
    {
        return 1;
    }
    else
    {
        sub_0803BFF4(unit);

        if (AiFindClosestUnlockPosition(flags, pos) == 1)
        {
            if ((gMapMovementSigned[pos->y][pos->x] < MAP_MOVEMENT_MAX) && (gBmMapUnit[pos->y][pos->x] == 0))
                return 0;

            return 1;
        }
    }

    return 0;
}

void AiSetMovCostTableWithPassableWalls(const s8 * cost)
{
    u16 i;

    for (i = 1; i < AI_TERRAIN_COST_COUNT; i++)
    {
        if (cost[i] >= 1)
            gWorkingTerrainMoveCosts[i] = cost[i];
        else
            gWorkingTerrainMoveCosts[i] = 1;
    }
}

void sub_0803BE3C(const s8 * cost, int terrainId)
{
    u16 i;

    for (i = 1; i < AI_TERRAIN_COST_COUNT; i++)
        gWorkingTerrainMoveCosts[i] = cost[i];

    gWorkingTerrainMoveCosts[terrainId] = 1;
}

void sub_0803BE6C(const s8 * cost, int terrainIdA, int terrainIdB)
{
    u16 i;

    for (i = 1; i < AI_TERRAIN_COST_COUNT; i++)
        gWorkingTerrainMoveCosts[i] = cost[i];

    gWorkingTerrainMoveCosts[terrainIdA] = 1;
    gWorkingTerrainMoveCosts[terrainIdB] = 1;
}

void InitAiMoveMapForUnit(struct Unit * unit)
{
    SetWorkingMoveTable(GetUnitMovementCost(unit));

    SetWorkingBmMap(gBmMapMovement);
    BeginMapFlood(unit->xPos, unit->yPos, MAP_MOVEMENT_EXTENDED, unit->index);
}

void sub_0803BED0(struct Unit * unit)
{
    SetWorkingMoveTable(GetUnitMovementCost(unit));

    SetWorkingBmMap(gBmMapRange);
    BeginMapFlood(unit->xPos, unit->yPos, MAP_MOVEMENT_EXTENDED, unit->index);
}

void sub_0803BF00(struct Unit * unit)
{
    AiSetMovCostTableWithPassableWalls(GetUnitMovementCost(unit));

    SetWorkingBmMap(gBmMapMovement);
    BeginMapFlood(unit->xPos, unit->yPos, MAP_MOVEMENT_EXTENDED, unit->index);
}

void sub_0803BF30(struct Unit * unit)
{
    AiSetMovCostTableWithPassableWalls(GetUnitMovementCost(unit));

    SetWorkingBmMap(gBmMapMovement);
    BeginMapFlood(unit->xPos, unit->yPos, MAP_MOVEMENT_EXTENDED, 0);
}

void GenerateExtendedMovementMapOnRangeNeglectWall(int x, int y, const s8 * cost)
{
    AiSetMovCostTableWithPassableWalls(cost);

    SetWorkingBmMap(gBmMapRange);
    BeginMapFlood(x, y, MAP_MOVEMENT_EXTENDED, 0);
}

void sub_0803BF8C(int x, int y, struct Unit * unit)
{
    AiSetMovCostTableWithPassableWalls(GetUnitMovementCost(unit));

    SetWorkingBmMap(gBmMapRange);
    BeginMapFlood(x, y, MAP_MOVEMENT_EXTENDED, unit->index);
}

void sub_0803BFC0(struct Unit * unit)
{
    sub_0803BE3C(GetUnitMovementCost(unit), TERRAIN_DOOR);

    SetWorkingBmMap(gBmMapRange);
    BeginMapFlood(unit->xPos, unit->yPos, MAP_MOVEMENT_EXTENDED, unit->index);
}

void sub_0803BFF4(struct Unit * unit)
{
    sub_0803BE3C(GetUnitMovementCost(unit), TERRAIN_DOOR);

    SetWorkingBmMap(gBmMapRange);
    BeginMapFlood(unit->xPos, unit->yPos, MAP_MOVEMENT_EXTENDED, 0);
}

void sub_0803C024(struct Unit * unit)
{
    sub_0803BE6C(GetUnitMovementCost(unit), TERRAIN_WALL_BREAKABLE, TERRAIN_SNAG);

    SetWorkingBmMap(gBmMapRange);
    BeginMapFlood(unit->xPos, unit->yPos, MAP_MOVEMENT_EXTENDED, unit->index);
}

void sub_0803C058(struct Unit * unit)
{
    sub_0803BE6C(GetUnitMovementCost(unit), TERRAIN_WALL_BREAKABLE, TERRAIN_SNAG);

    SetWorkingBmMap(gBmMapRange);
    BeginMapFlood(unit->xPos, unit->yPos, MAP_MOVEMENT_EXTENDED, 0);
}

void sub_0803C08C(struct Unit * unit)
{
    SetWorkingMoveTable(GetUnitMovementCost(unit));

    SetWorkingBmMap(gBmMapRange);
    BeginMapFlood(unit->xPos, unit->yPos, UNIT_MOV(unit), unit->index);
}

void AiUpdateNoMoveFlag(struct Unit * unit)
{
    if ((unit->ai3And4 & AI_UNIT_CONFIG_FLAG_STAY) != 0)
        gAiState.flags |= AI_FLAG_STAY;
    else
        gAiState.flags &= ~AI_FLAG_STAY;
}

void AiMapFloodRangeFrom(int x, int y, struct Unit * unit)
{
    SetWorkingMoveTable(GetUnitMovementCost(unit));

    SetWorkingBmMap(gBmMapRange);
    BeginMapFlood(x, y, MAP_MOVEMENT_EXTENDED, unit->index);
}

SECTION(".rodata.081D3BDC")
const struct AiSpecialItemLutEntry sAiSpecialItemFuncLut[] = {
    { .itemId = 0x69, .func = AiSpecialItemDoorKey },
    { .itemId = 0x6A, .func = AiSpecialItemLockpick },
    { .itemId = 0x6E, .func = AiSpecialItemAntitoxin },
    { 0 },
};
