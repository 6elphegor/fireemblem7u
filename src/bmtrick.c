#include "gbafe.h"
#include "gbafe/bmtarget.h"

// FE7 trap type values (differ from FE8 past TRAP_MINE)
#define FE7_TRAP_LIGHT_RUNE 12

extern struct Trap gTrapPool[TRAP_MAX_COUNT];
extern struct Trap gTrapPoolLast;

void InitTraps(void)
{
    int i;

    for (i = 0; i < TRAP_MAX_COUNT; ++i)
        gTrapPool[i].type = TRAP_NONE;

    gTrapPoolLast.type = TRAP_NONE;
}

struct Trap * GetTrapAt(int x, int y)
{
    struct Trap * it;

    for (it = gTrapPool; it->type != TRAP_NONE; ++it)
    {
        if ((x == it->xPos) && (y == it->yPos))
            return it;
    }

    return NULL;
}

struct Trap * GetTypedTrapAt(int x, int y, int trapType)
{
    struct Trap * it;

    for (it = gTrapPool; it->type != TRAP_NONE; ++it)
    {
        if ((it->xPos == x) && (it->yPos == y) && (it->type == trapType))
            return it;
    }

    return NULL;
}

struct Trap * AddTrap(int x, int y, int trapType, int meta)
{
    struct Trap * trap;

    for (trap = gTrapPool; trap->type != TRAP_NONE; ++trap) {}

    trap->xPos = x;
    trap->yPos = y;
    trap->type = trapType;
    trap->extra = meta;

    return trap;
}

struct Trap * AddDamagingTrap(int x, int y, int trapType, int meta, int turnCountdown, int turnInterval, int damage)
{
    struct Trap * trap = AddTrap(x, y, trapType, meta);

    trap->data[TRAP_EXTDATA_TRAP_TURNFIRST] = turnCountdown;
    trap->data[TRAP_EXTDATA_TRAP_TURNNEXT]  = turnInterval;
    trap->data[TRAP_EXTDATA_TRAP_COUNTER]   = turnCountdown;
    trap->data[TRAP_EXTDATA_TRAP_DAMAGE]    = damage;

    return trap;
}

struct Trap * RemoveTrap(struct Trap * trap)
{
    while (trap->type != TRAP_NONE)
    {
        *trap = *(trap + 1);
        trap++;
    }
}

void AddFireTile(int x, int y, int turnCountdown, int turnInterval)
{
    AddDamagingTrap(x, y, TRAP_FIRETILE, 0, turnCountdown, turnInterval, 10);
}

void AddGasTrap(int x, int y, int facing, int turnCountdown, int turnInterval)
{
    AddDamagingTrap(x, y, TRAP_GAS, facing, turnCountdown, turnInterval, 3);
}

void AddArrowTrap(int x, int turnCountdown, int turnInterval)
{
    AddDamagingTrap(x, 0, TRAP_LIGHTARROW, 0, turnCountdown, turnInterval, 10);
}

void AddMapChange2Trap(int x, int y, int turnCountdown, int turnInterval)
{
    AddDamagingTrap(x, y, TRAP_MAPCHANGE2, 0, turnCountdown, turnInterval, 0);
}

void AddTrap8(int x, int y)
{
    AddTrap(x, y, TRAP_8, 0);
}

void AddTrap9(int x, int y, int meta)
{
    AddTrap(x, y, TRAP_9, meta);
}

void InitMapObstacles(void)
{
    int ix, iy;

    for (iy = gBmMapSize.y - 1; iy >= 0; --iy)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; --ix)
        {
            switch (gBmMapTerrain[iy][ix])
            {

            case TERRAIN_WALL_BREAKABLE:
                if (gBmMapTerrain[iy - 1][ix] == TERRAIN_WALL_BREAKABLE)
                    continue;

                AddTrap(ix, iy, TRAP_OBSTACLE, GetChapterInfo(gPlaySt.chapterIndex)->wall_hp);

                break;

            case TERRAIN_SNAG:
                AddTrap(ix, iy, TRAP_OBSTACLE, 20);
                break;

            }
        }
    }
}

void ApplyEnabledMapChanges(void)
{
    struct Trap * trap;

    for (trap = gTrapPool; trap->type != TRAP_NONE; ++trap)
    {
        switch (trap->type)
        {

        case TRAP_MAPCHANGE:
            ApplyMapChange(trap->extra);
            break;

        case TRAP_MAPCHANGE2:
            ApplyMapChange(trap->extra ? trap->yPos : trap->xPos);
            break;

        }
    }
}

void RefreshAllLightRunes(void)
{
    struct Trap * trap;

    for (trap = gTrapPool; trap->type != TRAP_NONE; ++trap)
    {
        switch (trap->type)
        {

        case FE7_TRAP_LIGHT_RUNE:
            gBmMapTerrain[trap->yPos][trap->xPos] = TERRAIN_TILE_00;
            break;

        }
    }
}

int GetObstacleHpAt(int x, int y)
{
    struct Trap * trap = GetTrapAt(x, y);

    if (!trap)
        return 0;

    return trap->extra;
}

const struct MapChange * GetMapChange(int id)
{
    const struct MapChange * mapChange = GetChapterMapChanges(gPlaySt.chapterIndex);

    if (!mapChange)
        return NULL;

    while (mapChange->id >= 0)
    {
        if (id == mapChange->id)
            return mapChange;

        ++mapChange;
    }

    return NULL;
}

int GetMapChangeIdAt(int x, int y)
{
    int result = -1;

    const struct MapChange * mapChange = GetChapterMapChanges(gPlaySt.chapterIndex);

    if (!mapChange)
        return result;

    while (mapChange->id >= 0)
    {
        if (x >= mapChange->xOrigin)
            if (y >= mapChange->yOrigin)
                if (mapChange->xOrigin + mapChange->xSize - 1 >= x)
                    if (mapChange->yOrigin + mapChange->ySize - 1 >= y)
                        result = mapChange->id;

        ++mapChange;
    }

    return result;
}

void ApplyMapChange(int id)
{
    int ix = 0, iy = 0;

    const struct MapChange * mapChange = GetMapChange(id);
    const u16 * tileDataIt = mapChange->data;

    for (iy = 0; iy < mapChange->ySize; ++iy)
    {
        for (ix = 0; ix < mapChange->xSize; ++ix)
        {
            if (*tileDataIt != 0)
            {
                gBmMapBaseTiles[mapChange->yOrigin + iy][mapChange->xOrigin + ix] = *tileDataIt++;
            }
            else
            {
                ++tileDataIt;
            }
        }
    }
}

void AddMapChangeTrap(int id)
{
    AddTrap(0, 0, TRAP_MAPCHANGE, id);
}

void RemoveMapChangeTrap(int id)
{
    struct Trap * trap;

    for (trap = gTrapPool; trap->type != TRAP_NONE; ++trap)
    {
        if (trap->type == TRAP_MAPCHANGE && trap->extra == id)
            RemoveTrap(trap);
    }
}

void UnitHideIfUnderRoof(struct Unit * unit)
{
    if (gBmMapTerrain[unit->yPos][unit->xPos] == TERRAIN_ROOF)
        unit->state |= (US_HIDDEN | US_UNDER_A_ROOF);
}

void UpdateRoofedUnits(void)
{
    int i;

    for (i = 1; i < 0xC0; ++i)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (!(unit->state & US_UNDER_A_ROOF))
            continue;

        if (gBmMapTerrain[unit->yPos][unit->xPos] != TERRAIN_ROOF)
            unit->state = (unit->state & ~(US_UNDER_A_ROOF | US_HIDDEN)) | US_SEEN;
    }

    RefreshEntityMaps();
    RefreshUnitSprites();
}

void GenerateFireTileTrapTargets(int x, int y, int damage)
{
    EnlistTarget(x, y, gBmMapUnit[y][x], damage);
}

void GenerateArrowTrapTargets(int x, int y, int damage)
{
    int iy;

    for (iy = 0; iy < gBmMapSize.y; ++iy)
    {
        if (gBmMapUnit[iy][x])
            EnlistTarget(x, iy, gBmMapUnit[iy][x], damage);
    }
}

void GenerateGasTrapTargets(int x, int y, int damage, int facing)
{
    int i;

    int xInc = 0;
    int yInc = 0;

    switch (facing)
    {

    case FACING_UP:
        xInc = 0;
        yInc = -1;

        break;

    case FACING_DOWN:
        xInc = 0;
        yInc = +1;

        break;

    case FACING_LEFT:
        xInc = -1;
        yInc = 0;

        break;

    case FACING_RIGHT:
        xInc = +1;
        yInc = 0;

        break;

    }

    for (i = 2; i >= 0; --i)
    {
        x += xInc;
        y += yInc;

        if (gBmMapUnit[y][x])
            EnlistTarget(x, y, gBmMapUnit[y][x], damage);
    }
}

s8 ShouldSkipGasTrapDisplay(int x, int y, int facing)
{
    int i;

    int xInc = 0;
    int yInc = 0;

    s8 boolHasNoEffect = TRUE;

    switch (facing)
    {

    case FACING_UP:
        xInc = 0;
        yInc = -1;

        break;

    case FACING_DOWN:
        xInc = 0;
        yInc = +1;

        break;

    case FACING_LEFT:
        xInc = -1;
        yInc = 0;

        break;

    case FACING_RIGHT:
        xInc = +1;
        yInc = 0;

        break;

    }

    for (i = 0; i < 3; ++i)
    {
        x += xInc;
        y += yInc;

        if (gBmMapUnit[y][x])
            boolHasNoEffect = FALSE;
    }

    return boolHasNoEffect;
}

void GenerateTrapDamageTargets(void)
{
    struct Trap * trap;

    BeginTargetList(0, 0);

    for (trap = gTrapPool; trap->type != TRAP_NONE; ++trap)
    {
        if ((s8) trap->data[TRAP_EXTDATA_TRAP_COUNTER] == 0)
        {
            switch (trap->type)
            {

            case TRAP_FIRETILE:
                GenerateFireTileTrapTargets(trap->xPos, trap->yPos, (s8) trap->data[TRAP_EXTDATA_TRAP_DAMAGE]);
                break;

            case TRAP_LIGHTARROW:
                GenerateArrowTrapTargets(trap->xPos, trap->yPos, (s8) trap->data[TRAP_EXTDATA_TRAP_DAMAGE]);
                break;

            case TRAP_GAS:
                GenerateGasTrapTargets(trap->xPos, trap->yPos, (s8) trap->data[TRAP_EXTDATA_TRAP_DAMAGE], trap->extra);
                break;

            }
        }
    }
}

void GenerateDisplayedTrapDamageTargets(void)
{
    struct Trap * trap;

    int specialType = 0;

    BeginTargetList(0, 0);

    for (trap = gTrapPool; trap->type != TRAP_NONE; ++trap)
    {
        if (trap->data[TRAP_EXTDATA_TRAP_COUNTER] == 0)
        {
            switch (trap->type)
            {

            case TRAP_FIRETILE:
                if (gBmMapUnit[trap->yPos][trap->xPos])
                {
                    EnlistTarget(trap->xPos, trap->yPos, 0, TRAP_FIRETILE);
                    GenerateFireTileTrapTargets(trap->xPos, trap->yPos, trap->data[TRAP_EXTDATA_TRAP_DAMAGE]);
                }

                break;

            case TRAP_GAS:
                switch (trap->extra)
                {

                case FACING_UP:
                    specialType = 0x64;
                    break;

                case FACING_DOWN:
                    specialType = 0x65;
                    break;

                case FACING_LEFT:
                    specialType = 0x66;
                    break;

                case FACING_RIGHT:
                    specialType = 0x67;
                    break;

                }

                if (!ShouldSkipGasTrapDisplay(trap->xPos, trap->yPos, trap->extra))
                {
                    EnlistTarget(trap->xPos, trap->yPos, 0, specialType);
                    GenerateGasTrapTargets(trap->xPos, trap->yPos, trap->data[TRAP_EXTDATA_TRAP_DAMAGE], trap->extra);
                }

                break;

            case TRAP_LIGHTARROW:
                EnlistTarget(trap->xPos, trap->yPos, 0, TRAP_LIGHTARROW);
                GenerateArrowTrapTargets(trap->xPos, trap->yPos, trap->data[TRAP_EXTDATA_TRAP_DAMAGE]);
                break;

            case TRAP_MAPCHANGE2:
                EnlistTarget(trap->extra ? trap->xPos : trap->yPos, trap - gTrapPool, 0, trap->type);
                break;

            }
        }
    }
}

void CountDownTraps(void)
{
    struct Trap * trap;

    for (trap = gTrapPool; trap->type != TRAP_NONE; ++trap)
    {
        switch (trap->type)
        {

        case TRAP_FIRETILE:
        case TRAP_GAS:
        case TRAP_MAPCHANGE2:
        case TRAP_LIGHTARROW:
            trap->data[TRAP_EXTDATA_TRAP_COUNTER]--;
            break;

        }
    }
}

void ResetCountedDownTraps(void)
{
    struct Trap * trap;

    for (trap = gTrapPool; trap->type != TRAP_NONE; ++trap)
    {
        switch (trap->type)
        {

        case TRAP_FIRETILE:
        case TRAP_GAS:
        case TRAP_MAPCHANGE2:
        case TRAP_LIGHTARROW:
            if (trap->data[TRAP_EXTDATA_TRAP_COUNTER] == 0)
                trap->data[TRAP_EXTDATA_TRAP_COUNTER] = trap->data[TRAP_EXTDATA_TRAP_TURNNEXT];

            break;

        }
    }
}

void RefreshEntityMapsAsRedPhase(void)
{
    int truePhase = gPlaySt.faction;
    gPlaySt.faction = FACTION_RED;

    RefreshEntityMaps();

    gPlaySt.faction = truePhase;
}

void StartTrapDamageMapAnim(void)
{
    sub_08024A88(3);
}

void PostTrapExecFlag(void)
{
    if (CheckChapterFlag(0x65))
        StartEvent(gEvent_GameOver);
}

struct Trap * AddLightRune(int x, int y)
{
    struct Trap * trap = AddTrap(x, y, FE7_TRAP_LIGHT_RUNE, gBmMapTerrain[y][x]);

    trap->data[TRAP_EXTDATA_RUNE_TURNSLEFT] = 3;
    gBmMapTerrain[y][x] = TERRAIN_TILE_00;
}

struct Trap * RemoveLightRune(struct Trap * trap)
{
    gBmMapTerrain[trap->yPos][trap->xPos] = GetTrueTerrainAt(trap->xPos, trap->yPos);
    return RemoveTrap(trap);
}

void DecayTraps(void)
{
    struct Trap * trap;

    for (trap = gTrapPool; trap->type != TRAP_NONE; ++trap)
    {
        switch (trap->type)
        {

        case TRAP_TORCHLIGHT:
            trap->extra--;

            if (trap->extra == 0)
            {
                RemoveTrap(trap);
                trap--;
            }

            break;

        case FE7_TRAP_LIGHT_RUNE:
            trap->data[TRAP_EXTDATA_RUNE_TURNSLEFT]--;

            if (trap->data[TRAP_EXTDATA_RUNE_TURNSLEFT] == 0)
            {
                RemoveLightRune(trap);
                trap--;
            }

            break;

        }
    }
}

void DisableAllLightRunes(void)
{
    struct Trap * trap;

    for (trap = gTrapPool; trap->type != TRAP_NONE; ++trap)
    {
        switch (trap->type)
        {

        case FE7_TRAP_LIGHT_RUNE:
            gBmMapTerrain[trap->yPos][trap->xPos] = GetTrueTerrainAt(trap->xPos, trap->yPos);
            break;

        }
    }
}

void EnableAllLightRunes(void)
{
    struct Trap * trap;

    for (trap = gTrapPool; trap->type != TRAP_NONE; ++trap)
    {
        switch (trap->type)
        {

        case FE7_TRAP_LIGHT_RUNE:
            gBmMapTerrain[trap->yPos][trap->xPos] = TERRAIN_TILE_00;
            break;

        }
    }
}

struct Trap * GetTrap(int id)
{
    return gTrapPool + id;
}
