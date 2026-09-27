#include "gbafe.h"
#include "gbafe/bmmap.h"
#include "gbafe/bmidoten.h"

#define gMapMovementSigned ((s8 **) gBmMapMovement)

void StartMapFade(bool locksGame);

void SetVisionWithFade(int vision_range)
{
    if (vision_range < 0)
        vision_range = GetChapterInfo(gPlaySt.chapterIndex)->fog;

    RenderMapForFade();
    gPlaySt.chapterVisionRange = vision_range;
    RefreshEntityMaps();
    RefreshUnitSprites();
    RenderMap();
    StartMapFade(1);
}

void SetVision(int vision_range)
{
    if (vision_range < 0)
        vision_range = GetChapterInfo(gPlaySt.chapterIndex)->fog;

    gPlaySt.chapterVisionRange = vision_range;
    RefreshEntityMaps();
    RefreshUnitSprites();
    RenderMap();
}

void FillWarpRangeMap(struct Unit * unit_act, struct Unit * unit_tar)
{
    int x, y;

    BmMapFillg(gBmMapMovement, -1);
    BmMapFillg(gBmMapRange, 0);
    SetWorkingBmMap(gBmMapMovement);

    x = unit_tar->xPos;
    y = unit_tar->yPos;
    MapAddInBoundedRange(x, y, 1, GetUnitMagRange(unit_act));

    if (0 == gPlaySt.chapterVisionRange)
    {
        for (y = gBmMapSize.y - 1; y >= 0; y--)
        {
            for (x = gBmMapSize.x - 1; x >= 0; x--)
            {
                if (gBmMapMovement[y][x] > 0x78)
                    continue;

                if (CanUnitCrossTerrain(unit_tar, gBmMapTerrain[y][x]) &&
                    0 == gBmMapUnit[y][x])
                    continue;

                gMapMovementSigned[y][x] = -1;
            }
        }
    }
    else
    {
        for (y = gBmMapSize.y - 1; y >= 0; y--)
        {
            for (x = gBmMapSize.x - 1; x >= 0; x--)
            {
                if (gBmMapMovement[y][x] > 0x78)
                    continue;

                if (CanUnitCrossTerrain(unit_tar, gBmMapTerrain[y][x]) &&
                    0 == gBmMapUnit[y][x] &&
                    0 != gBmMapFog[y][x])
                    continue;

                gMapMovementSigned[y][x] = -1;
            }
        }
    }

    gMapMovementSigned[unit_act->yPos][unit_act->xPos] = -1;
}
