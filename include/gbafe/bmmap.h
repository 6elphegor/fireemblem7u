#pragma once

#include "global.h"

// bmmap.c (FE8U names noted where ours differ)

extern u16 gBmMapBuffer[0x800 / 2];
extern u8 * gTilesetTerrainLookup;
extern u16 ** gBmMapBaseTiles;

void InitChapterMap(int chapterId);
void InitChapterPreviewMap(int chapterId);                  // InitMapForMinimap
void ApplyAutoWaterShadows(void);                           // sub_8019624
void RefreshAutoWaterShadows(void);                         // sub_8019778
void BmMapInit(void * buffer, u8 *** outHandle, int x, int y);
void BmMapFillg(u8 ** map, int value);                      // BmMapFill
void BmMapFillEdges(u8 ** map, u8 value);
void UnpackChapterMap(void * into, int chapterId);
void UnpackChapterMapGraphics(int chapterId);
void UnpackChapterMapPalette(void);
void InitMetatilesMap(void);                                // InitBaseTilesBmMap
void RefreshTerrainMap(void);                               // RefreshTerrainBmMap
int GetTrueTerrainAt(int x, int y);
void PutMapMetatile(u16 * bg, int xTileMap, int yTileMap, int xBmMap, int yBmMap); // DisplayBmTile
void nullsub_7(void);
void PutLimitViewSquare(u16 * bg, int xBmMap, int yBmMap, int xTileMap, int yTileMap); // DisplayMovementViewTile
void RenderMap(void);                                       // RenderBmMap
void RenderMapForFade(void);                                // RenderBmMapOnBg2
void UpdateBmMapDisplay(void);
void RenderBmMapColumn(u16 xOffset);
void RenderBmMapLine(u16 yOffset);
void RefreshUnitsOnBmMap(void);
void RefreshTorchlightsOnBmMap(void);
void RefreshMinesOnBmMap(void);
void RefreshEntityMaps(void);                               // RefreshEntityBmMaps
char * GetTerrainName(int terrainId);
int GetTerrainHealAmount(int terrain);
s8 GetTerrainHealsStatus(int terrain);
void sub_08019B40(void);                                    // sub_801A278

// defined elsewhere
void const * GetChapterMapPointer(int chapterId);
void ApplyEnabledMapChanges(void);
void sub_0802BC80(void);                                    // RefreshAllLightRunes
void SetWorkingBmMap(u8 ** map);
int GetUnitFogViewRange(struct Unit * unit);
