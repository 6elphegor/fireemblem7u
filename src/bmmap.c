#include "gbafe.h"
#include "gbafe/bmmap.h"

#define gMapMovementSigned ((s8 **) gBmMapMovement)
#define gMapRangeSigned ((s8 **) gBmMapRange)

enum { MAP_POOL_SIZE = 0x7B8 };

extern u8 sBmMapUnitPool[MAP_POOL_SIZE];
extern u8 sBmMapTerrainPool[MAP_POOL_SIZE];
extern u8 sBmMapFogPool[MAP_POOL_SIZE];
extern u8 sBmMapHiddenPool[MAP_POOL_SIZE];
extern u8 sBmMapOtherPool[MAP_POOL_SIZE];
extern u16 sTilesetConfig[0x1000 + 0x200];
extern u16 sBmBaseTilesPool[MAP_POOL_SIZE];

extern u8 ** sInitializingMap;
extern u8 sBmMapMovementPool[MAP_POOL_SIZE];
extern u8 sBmMapRangePool[MAP_POOL_SIZE];

extern u16 const gTerrainNameMsgTable[];
extern s8 const TerrainTable_HealAmount[];
extern s8 const TerrainTable_HealsStatus[];

u8 * gTilesetTerrainLookup = (u8 *) (sTilesetConfig + 0x1000);
u16 ** gBmMapBaseTiles = (u16 **) (sBmBaseTilesPool);

void InitChapterMap(int chapterId)
{
    UnpackChapterMap(gBmMapBuffer, chapterId);
    UnpackChapterMapGraphics(chapterId);

    BmMapInit(sBmMapUnitPool,     &gBmMapUnit,     gBmMapSize.x, gBmMapSize.y);
    BmMapInit(sBmMapTerrainPool,  &gBmMapTerrain,  gBmMapSize.x, gBmMapSize.y);
    BmMapInit(sBmMapMovementPool, &gBmMapMovement, gBmMapSize.x, gBmMapSize.y);
    BmMapInit(sBmMapRangePool,    &gBmMapRange,    gBmMapSize.x, gBmMapSize.y);
    BmMapInit(sBmMapFogPool,      &gBmMapFog,      gBmMapSize.x, gBmMapSize.y);
    BmMapInit(sBmMapHiddenPool,   &gBmMapHidden,   gBmMapSize.x, gBmMapSize.y);
    BmMapInit(sBmMapOtherPool,    &gBmMapOther,    gBmMapSize.x, gBmMapSize.y);

    BmMapFill(gBmMapUnit, 0);
    BmMapFill(gBmMapTerrain, 0);

    InitMetatilesMap();
    ApplyEnabledMapChanges();
    RefreshTerrainMap();

    if (gPlaySt.chapterIndex == 0x26)
        ApplyAutoWaterShadows();
}

void InitChapterPreviewMap(int chapterId)
{
    UnpackChapterMap(gBmMapBuffer, chapterId);

    BmMapInit(sBmMapUnitPool,    &gBmMapUnit,    gBmMapSize.x, gBmMapSize.y);
    BmMapInit(sBmMapTerrainPool, &gBmMapTerrain, gBmMapSize.x, gBmMapSize.y);

    BmMapFill(gBmMapUnit, 0);
    BmMapFill(gBmMapTerrain, 0);

    InitMetatilesMap();
    RefreshTerrainMap();
}

void ApplyAutoWaterShadows(void)
{
    int ix, iy;

    for (iy = 0; iy < gBmMapSize.y; ++iy)
    {
        for (ix = 0; ix < gBmMapSize.x; ++ix)
        {
            int connexion;

            if (gBmMapTerrain[iy][ix] != 0x3C)
                continue;

            connexion = 0;

            if (ix > 0)
            {
                if (gBmMapTerrain[iy][ix - 1] == TERRAIN_FLOOR_17)
                    connexion = 1;

                if (gBmMapTerrain[iy][ix - 1] == TERRAIN_STAIRS)
                    connexion = 1;

                if (gBmMapTerrain[iy][ix - 1] == TERRAIN_CHEST_OPENED)
                    connexion = 1;

                if (gBmMapTerrain[iy][ix - 1] == TERRAIN_CHEST)
                    connexion = 1;
            }

            if (iy > 0)
            {
                if (gBmMapTerrain[iy - 1][ix] == TERRAIN_FLOOR_17)
                    connexion += 2;

                if (gBmMapTerrain[iy - 1][ix] == TERRAIN_STAIRS)
                    connexion += 2;

                if (gBmMapTerrain[iy - 1][ix] == TERRAIN_CHEST_OPENED)
                    connexion += 2;

                if (gBmMapTerrain[iy - 1][ix] == TERRAIN_CHEST)
                    connexion += 2;
            }

            if (ix > 0 && iy > 0)
                if ((gBmMapTerrain[iy]    [ix - 1] == TERRAIN_FLOOR_17) &&
                    (gBmMapTerrain[iy + 1][ix - 1] == 0x3C) &&
                    (gBmMapTerrain[iy - 1][ix]     != TERRAIN_FLOOR_17))
                    connexion = 4;

            switch (connexion)
            {

            case 1:
                gBmMapBaseTiles[iy][ix] = 0x2DC;
                break;

            case 2:
                gBmMapBaseTiles[iy][ix] = 0x2D8;
                break;

            case 3:
                gBmMapBaseTiles[iy][ix] = 0x358;
                break;

            case 4:
                gBmMapBaseTiles[iy][ix] = 0x35C;
                break;

            }
        }
    }
}

void RefreshAutoWaterShadows(void)
{
    UnpackChapterMap(gBmMapBuffer, gPlaySt.chapterIndex);

    InitMetatilesMap();
    ApplyEnabledMapChanges();
    RefreshTerrainMap();
    ApplyAutoWaterShadows();
}

void BmMapInit(void * buffer, u8 *** outHandle, int x, int y)
{
    int i;
    u8 * itBuffer;

    sInitializingMap = buffer;

    x += 2;
    y += 4;

    itBuffer = buffer + y * sizeof(u8 *);

    for (i = 0; i < y; ++i)
    {
        sInitializingMap[i] = itBuffer;
        itBuffer += x;
    }

    *outHandle = sInitializingMap + 2;
}

void BmMapFill(u8 ** map, int value)
{
    int size = (gBmMapSize.y + 4) * (gBmMapSize.x + 2);

    if (size % 2)
        size = size - 1;

    value = (0xFF & value);
    value += value << 8;

    CpuFill16(value, map[-2], size);

    SetWorkingBmMap(map);
}

void BmMapFillEdges(u8 ** map, u8 value)
{
    int ix, iy;

    u8 ** theMap = map;

    for (iy = 0; iy < gBmMapSize.y; ++iy)
    {
        theMap[iy][0]              = value;
        theMap[iy][gBmMapSize.x-1] = value;
    }

    for (ix = 0; ix < gBmMapSize.x; ++ix)
    {
        theMap[0]             [ix] = value;
        theMap[gBmMapSize.y-1][ix] = value;
    }
}

void UnpackChapterMap(void * into, int chapterId)
{
    Decompress(GetChapterMapPointer(chapterId), into);

    gBmMapSize.x = ((u8 *) (into))[0];
    gBmMapSize.y = ((u8 *) (into))[1];

    Decompress(gChapterDataAssetTable[GetChapterInfo(chapterId)->asset_tileset], sTilesetConfig);

    gBmSt.camera_max.x = gBmMapSize.x * 16 - DISPLAY_WIDTH;
    gBmSt.camera_max.y = gBmMapSize.y * 16 - DISPLAY_HEIGHT;
}

void UnpackChapterMapGraphics(int chapterId)
{
    Decompress(
        gChapterDataAssetTable[GetChapterInfo(chapterId)->asset_img_a],
        (void *) (BG_VRAM + 0x20 * 0x400));

    if (gChapterDataAssetTable[GetChapterInfo(chapterId)->asset_img_b])
        Decompress(
            gChapterDataAssetTable[GetChapterInfo(chapterId)->asset_img_b],
            (void *) (BG_VRAM + 0x20 * 0x600));

    ApplyPalettes(gChapterDataAssetTable[GetChapterInfo(chapterId)->asset_pal], 6, 10);
}

void UnpackChapterMapPalette(void)
{
    ApplyPalettes(gChapterDataAssetTable[GetChapterInfo(gPlaySt.chapterIndex)->asset_pal], 6, 10);
}

void InitMetatilesMap(void)
{
    int ix, iy;

    u16 ** rows;
    u16 * tiles;
    u16 * itBuffer;

    rows  = gBmMapBaseTiles;
    tiles = gBmMapBuffer;

    gBmMapSize.y++;

    tiles++;

    itBuffer = (u16 *) (gBmMapBaseTiles + gBmMapSize.y);

    for (iy = 0; iy < gBmMapSize.y; ++iy)
    {
        rows[iy] = itBuffer;
        itBuffer += gBmMapSize.x;

        for (ix = 0; ix < gBmMapSize.x; ++ix)
            gBmMapBaseTiles[iy][ix] = *tiles++;
    }

    tiles = gBmMapBaseTiles[iy - 1];

    for (ix = 0; ix < gBmMapSize.x; ++ix)
        *tiles++ = 0;

    gBmMapSize.y--;
}

void RefreshTerrainMap(void)
{
    int ix, iy;

    for (iy = 0; iy < gBmMapSize.y; ++iy)
        for (ix = 0; ix < gBmMapSize.x; ++ix)
            gBmMapTerrain[iy][ix] = gTilesetTerrainLookup[gBmMapBaseTiles[iy][ix] >> 2];

    RefreshAllLightRunes();
}

int GetTrueTerrainAt(int x, int y)
{
    return gTilesetTerrainLookup[gBmMapBaseTiles[y][x] >> 2];
}

void PutMapMetatile(u16 * bg, int xTileMap, int yTileMap, int xBmMap, int yBmMap)
{
    u16 * out = bg + yTileMap * 0x40 + xTileMap * 2;
    u16 * tile = sTilesetConfig + gBmMapBaseTiles[yBmMap][xBmMap];

    u16 base = gBmMapFog[yBmMap][xBmMap] ? (6 << 12) : (11 << 12);

    out[0x00 + 0] = base + *tile++;
    out[0x00 + 1] = base + *tile++;
    out[0x20 + 0] = base + *tile++;
    out[0x20 + 1] = base + *tile++;
}

void nullsub_7(void)
{
}

void PutLimitViewSquare(u16 * bg, int xBmMap, int yBmMap, int xTileMap, int yTileMap)
{
    bg = bg + 2 * (yTileMap * 0x20 + xTileMap);

    if (!bg)
        nullsub_7();

    if (gMapMovementSigned[yBmMap][xBmMap] >= 0)
    {
        bg[0x00 + 0] = 0x4280;
        bg[0x00 + 1] = 0x4281;
        bg[0x20 + 0] = 0x4282;
        bg[0x20 + 1] = 0x4283;

        return;
    }

    if (gMapRangeSigned[yBmMap][xBmMap])
    {
        if (bg[0])
        {
            bg[0x00 + 0] = 0x5284;
            bg[0x00 + 1] = 0x5285;
            bg[0x20 + 0] = 0x5286;
            bg[0x20 + 1] = 0x5287;

            return;
        }
        else
        {
            bg[0x00 + 0] = 0x5280;
            bg[0x00 + 1] = 0x5281;
            bg[0x20 + 0] = 0x5282;
            bg[0x20 + 1] = 0x5283;

            return;
        }
    }

    bg[0x00 + 0] = 0;
    bg[0x00 + 1] = 0;
    bg[0x20 + 0] = 0;
    bg[0x20 + 1] = 0;
}

void RenderMap(void)
{
    int ix, iy;

    gBmSt.map_render_anchor.x = gBmSt.camera.x >> 4;
    gBmSt.map_render_anchor.y = gBmSt.camera.y >> 4;

    for (iy = (10 - 1); iy >= 0; --iy)
        for (ix = (15 - 1); ix >= 0; --ix)
            PutMapMetatile(gBg3Tm, ix, iy,
                (short) gBmSt.map_render_anchor.x + ix, (short) gBmSt.map_render_anchor.y + iy);

    EnableBgSync(BG3_SYNC_BIT);
    SetBgOffset(3, 0, 0);

    SetDispEnable(TRUE, TRUE, TRUE, TRUE, TRUE);
}

void RenderMapForFade(void)
{
    int ix, iy;

    SetBgChrOffset(2, 0x8000);

    gBmSt.map_render_anchor.x = gBmSt.camera.x >> 4;
    gBmSt.map_render_anchor.y = gBmSt.camera.y >> 4;

    for (iy = (10 - 1); iy >= 0; --iy)
        for (ix = (15 - 1); ix >= 0; --ix)
            PutMapMetatile(gBg2Tm, ix, iy,
                (short) gBmSt.map_render_anchor.x + ix, (short) gBmSt.map_render_anchor.y + iy);

    EnableBgSync(BG2_SYNC_BIT);
    SetBgOffset(2, 0, 0);
}

void UpdateBmMapDisplay(void)
{
    if (gBmSt.camera.x != gBmSt.camera_previous.x)
    {
        if (gBmSt.camera.x > gBmSt.camera_previous.x)
        {
            if (((gBmSt.camera.x - 1) ^ (gBmSt.camera_previous.x - 1)) & 0x10)
                RenderBmMapColumn(15);
        }
        else
        {
            if ((gBmSt.camera.x ^ gBmSt.camera_previous.x) & 0x10)
                RenderBmMapColumn(0);
        }
    }

    if (gBmSt.camera.y != gBmSt.camera_previous.y)
    {
        if (gBmSt.camera.y > gBmSt.camera_previous.y)
        {
            if (((gBmSt.camera.y - 1) ^ (gBmSt.camera_previous.y - 1)) & 0x10)
                RenderBmMapLine(10);
        }
        else
        {
            if ((gBmSt.camera.y ^ gBmSt.camera_previous.y) & 0x10)
                RenderBmMapLine(0);
        }
    }

    gBmSt.camera_previous = gBmSt.camera;

    SetBgOffset(3,
        gBmSt.camera.x - (u16) gBmSt.map_render_anchor.x * 16,
        gBmSt.camera.y - (u16) gBmSt.map_render_anchor.y * 16);

    if (gBmSt.flags & BM_FLAG_0)
    {
        SetBgOffset(2,
            gBmSt.camera.x - (u16) gBmSt.map_render_anchor.x * 16,
            gBmSt.camera.y - (u16) gBmSt.map_render_anchor.y * 16);
    }
}

void RenderBmMapColumn(u16 xOffset)
{
    u16 xBmMap = (gBmSt.camera.x >> 4) + xOffset;
    u16 yBmMap = (gBmSt.camera.y >> 4);

    u16 xTileMap = ((gBmSt.camera.x >> 4) - gBmSt.map_render_anchor.x + xOffset) & 0xF;
    u16 yTileMap = ((gBmSt.camera.y >> 4) - gBmSt.map_render_anchor.y);

    int iy;

    if (!(gBmSt.flags & 1))
    {
        for (iy = 10; iy >= 0; --iy)
        {
            PutMapMetatile(gBg3Tm,
                xTileMap, (yTileMap + iy) & 0xF,
                xBmMap, (yBmMap + iy));
        }

        EnableBgSync(BG3_SYNC_BIT);
    }
    else
    {
        for (iy = 10; iy >= 0; --iy)
        {
            PutMapMetatile(gBg3Tm,
                xTileMap, (yTileMap + iy) & 0xF,
                xBmMap, (yBmMap + iy));

            PutLimitViewSquare(gBg2Tm,
                xBmMap, (yBmMap + iy),
                xTileMap, (yTileMap + iy) & 0xF);
        }

        EnableBgSync(BG2_SYNC_BIT | BG3_SYNC_BIT);
    }
}

void RenderBmMapLine(u16 yOffset)
{
    u16 xBmMap = (gBmSt.camera.x >> 4);
    u16 yBmMap = (gBmSt.camera.y >> 4) + yOffset;

    u16 xTileMap = ((gBmSt.camera.x >> 4) - gBmSt.map_render_anchor.x);
    u16 yTileMap = ((gBmSt.camera.y >> 4) - gBmSt.map_render_anchor.y + yOffset) & 0xF;

    int ix;

    if (!(gBmSt.flags & 1))
    {
        for (ix = 15; ix >= 0; --ix)
        {
            PutMapMetatile(gBg3Tm,
                (xTileMap + ix) & 0xF, yTileMap,
                (xBmMap + ix), yBmMap);
        }

        EnableBgSync(BG3_SYNC_BIT);
    }
    else
    {
        for (ix = 15; ix >= 0; --ix)
        {
            PutMapMetatile(gBg3Tm,
                (xTileMap + ix) & 0xF, yTileMap,
                (xBmMap + ix), yBmMap);

            PutLimitViewSquare(gBg2Tm,
                (xBmMap + ix), yBmMap,
                (xTileMap + ix) & 0xF, yTileMap);
        }

        EnableBgSync(BG2_SYNC_BIT | BG3_SYNC_BIT);
    }
}

void RefreshUnitsOnBmMap(void)
{
    struct Unit * unit;
    int i;

    for (i = 1; i < FACTION_RED; ++i)
    {
        unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & US_HIDDEN)
            continue;

        gBmMapUnit[unit->yPos][unit->xPos] = i;

        if (gPlaySt.chapterVisionRange)
            MapAddInRange(unit->xPos, unit->yPos, GetUnitFogViewRange(unit), 1);
    }

    if (gPlaySt.faction != FACTION_RED)
    {
        for (i = FACTION_RED + 1; i < FACTION_PURPLE + 6; ++i)
        {
            unit = GetUnit(i);

            if (!UNIT_IS_VALID(unit))
                continue;

            if (unit->state & US_HIDDEN)
                continue;

            if (UNIT_CATTRIBUTES(unit) & CA_MAGICSEAL)
                MapAddInRange(unit->xPos, unit->yPos, 10, -1);

            if (gPlaySt.chapterVisionRange && !gBmMapFog[unit->yPos][unit->xPos])
            {
                gBmMapHidden[unit->yPos][unit->xPos] |= HIDDEN_BIT_UNIT;
                unit->state = unit->state | US_CONCEALED;
            }
            else
            {
                gBmMapUnit[unit->yPos][unit->xPos] = i;

                if (unit->state & US_CONCEALED)
                    unit->state = (unit->state &~ US_CONCEALED) | US_SEEN;
            }
        }
    }
    else
    {
        for (i = FACTION_RED + 1; i < FACTION_PURPLE + 6; ++i)
        {
            unit = GetUnit(i);

            if (!UNIT_IS_VALID(unit))
                continue;

            if (unit->state & US_HIDDEN)
                continue;

            if (UNIT_CATTRIBUTES(unit) & CA_MAGICSEAL)
                MapAddInRange(unit->xPos, unit->yPos, 10, -1);

            if (gPlaySt.chapterVisionRange)
            {
                if (!gBmMapFog[unit->yPos][unit->xPos])
                    unit->state = unit->state | US_CONCEALED;
                else
                    unit->state = unit->state &~ US_CONCEALED;
            }

            gBmMapUnit[unit->yPos][unit->xPos] = i;
        }
    }
}

void RefreshTorchlightsOnBmMap(void)
{
    struct Trap * trap;

    for (trap = GetTrap(0); trap->type != TRAP_NONE; ++trap)
    {
        switch (trap->type)
        {

        case TRAP_TORCHLIGHT:
            MapAddInRange(trap->xPos, trap->yPos, trap->extra, 1);
            break;

        }
    }
}

void RefreshMinesOnBmMap(void)
{
    struct Trap * trap;

    for (trap = GetTrap(0); trap->type != TRAP_NONE; ++trap)
    {
        switch (trap->type)
        {

        case TRAP_MINE:
            if (!gBmMapUnit[trap->yPos][trap->xPos])
                gBmMapHidden[trap->yPos][trap->xPos] |= HIDDEN_BIT_TRAP;

            break;

        }
    }
}

void RefreshEntityMaps(void)
{
    BmMapFill(gBmMapUnit, 0);
    BmMapFill(gBmMapHidden, 0);

    BmMapFill(gBmMapFog, !gPlaySt.chapterVisionRange ? 1 : 0);

    RefreshTorchlightsOnBmMap();
    RefreshUnitsOnBmMap();
    RefreshMinesOnBmMap();
}

char * GetTerrainName(int terrainId)
{
    return DecodeMsg(gTerrainNameMsgTable[terrainId]);
}

int GetTerrainHealAmount(int terrainId)
{
    return TerrainTable_HealAmount[terrainId];
}

s8 GetTerrainHealsStatus(int terrainId)
{
    return TerrainTable_HealsStatus[terrainId];
}

void sub_08019B40(void)
{
    const u16 * tile = sTilesetConfig;

    SetBlankChr(0x400 + (*tile++ & 0x3FF));
    SetBlankChr(0x400 + (*tile++ & 0x3FF));
    SetBlankChr(0x400 + (*tile++ & 0x3FF));
    SetBlankChr(0x400 + (*tile++ & 0x3FF));

    gPal[0] = 0x4300;
    EnablePalSync();
}
