#include "gbafe.h"

#include "constants/terrains.h"
#include "gbafe/bmmap.h"

struct MinimapProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ int xCameraSpeed;
    /* 30 */ int yCameraSpeed;
    /* 34 */ int xRegionRadius;
    /* 38 */ int yRegionRadius;
    /* 3C */ int xScreen;
    /* 40 */ int yScreen;
    /* 44 */ STRUCT_PAD(0x44, 0x4A);
    /* 4A */ s16 cameraMoved;
    /* 4C */ s16 animClock;
};

// Data (not yet in C; FE7U addresses in symbols.ld)
extern u8 gGfx_MinimapTiles[];
extern u16 gPal_MinimapTiles[];
extern u16 gPal_08A1FFD0[];
extern s16 gMinimapWinBuf[2][320];
extern s16 * gMinimapFrontWinBuf;
extern s16 * gMinimapBackWinBuf;
extern s16 * gMinimapDisplayedWinBuf;
extern u16 * gMinimapObjectFlashPal;
extern struct ProcCmd CONST_DATA ProcScr_Minimap[];

void ApplyMinimapGraphics(int);
void Minimap_InitProcVars(struct MinimapProc *);

int GetMinimapConnectKindAt(int x, int y) {
    int index = 0;

    int terrainId = gBmMapTerrain[y][x];

    if (gBmMapTerrain[y + 1][x] == terrainId) {
        index += 1;
    }

    index *= 2;

    if (gBmMapTerrain[y - 1][x] == terrainId) {
        index += 1;
    }

    index *= 2;

    if (gBmMapTerrain[y][x + 1] == terrainId) {
        index += 1;
    }

    index *= 2;

    if (gBmMapTerrain[y][x - 1] == terrainId) {
        index += 1;
    }

    return index;
}
int NormalizeSeaMinimapTerrain(int terrainId) {
    switch (terrainId) {
        case 0x36:
        case 0x3D:
        case 0x00:
            return TERRAIN_SEA;
        default:
            return terrainId;
    }
}
int GetMinimapSeaKindAt(int x, int y) {
    int terrainIdA;
    int terrainIdB;

    int index = 0;

    terrainIdA = NormalizeSeaMinimapTerrain(gBmMapTerrain[y][x]);
    terrainIdB = NormalizeSeaMinimapTerrain(gBmMapTerrain[y + 1][x]);

    if (terrainIdB == terrainIdA) {
        index += 1;
    }

    index *= 2;

    terrainIdB = NormalizeSeaMinimapTerrain(gBmMapTerrain[y - 1][x]);

    if (terrainIdB == terrainIdA) {
        index += 1;
    }

    index *= 2;

    terrainIdB = NormalizeSeaMinimapTerrain(gBmMapTerrain[y][x + 1]);

    if (terrainIdB == terrainIdA) {
        index += 1;
    }

    index *= 2;

    terrainIdB = NormalizeSeaMinimapTerrain(gBmMapTerrain[y][x - 1]);

    if (terrainIdB == terrainIdA) {
        index += 1;
    }

    return index;
}
int NormalizeWaterMinimapTerrain(int terrainId) {
    switch (terrainId) {
        case 0x17:
        case 0x1A:
        case 0x3F:
        case 0x00:
            return 0x3C;
        default:
            return terrainId;
    }
}
int GetMinimapWaterKindAt(int x, int y) {
    int terrainIdA;
    int terrainIdB;

    int index = 0;

    terrainIdA = NormalizeWaterMinimapTerrain(gBmMapTerrain[y][x]);
    terrainIdB = NormalizeWaterMinimapTerrain(gBmMapTerrain[y + 1][x]);

    if (terrainIdB == terrainIdA) {
        index += 1;
    }

    index *= 2;

    terrainIdB = NormalizeWaterMinimapTerrain(gBmMapTerrain[y - 1][x]);

    if (terrainIdB == terrainIdA) {
        index += 1;
    }

    index *= 2;

    terrainIdB = NormalizeWaterMinimapTerrain(gBmMapTerrain[y][x + 1]);

    if (terrainIdB == terrainIdA) {
        index += 1;
    }

    index *= 2;

    terrainIdB = NormalizeWaterMinimapTerrain(gBmMapTerrain[y][x - 1]);

    if (terrainIdB == terrainIdA) {
        index += 1;
    }

    return index;
}
int GetMinimapRiverKindAt(int x, int y) {
    int terrainId;

    int index = 0;

    terrainId = gBmMapTerrain[y + 1][x];

    if ((terrainId == TERRAIN_RIVER) ||
        (terrainId == TERRAIN_SEA) ||
        (terrainId == 0x36) ||
        (terrainId == TERRAIN_LAKE) ||
        (terrainId == 0x13)) {
        index += 1;
    }

    index *= 2;

    terrainId = gBmMapTerrain[y - 1][x];

    if ((terrainId == TERRAIN_RIVER) ||
        (terrainId == TERRAIN_SEA) ||
        (terrainId == 0x36) ||
        (terrainId == TERRAIN_LAKE) ||
        (terrainId == 0x13)) {
        index += 1;
    }

    index *= 2;

    terrainId = gBmMapTerrain[y][x + 1];

    if ((terrainId == TERRAIN_RIVER) ||
        (terrainId == TERRAIN_SEA) ||
        (terrainId == 0x36) ||
        (terrainId == TERRAIN_LAKE) ||
        (terrainId == 0x13)) {
        index += 1;
    }

    index *= 2;

    terrainId = gBmMapTerrain[y][x - 1];

    if ((terrainId == TERRAIN_RIVER) ||
        (terrainId == TERRAIN_SEA) ||
        (terrainId == 0x36) ||
        (terrainId == TERRAIN_LAKE) ||
        (terrainId == 0x13)) {
        index += 1;
    }

    return index;
}
int GetMinimapCliffKindAt(int x, int y) {

    int terrainId = gBmMapTerrain[y][x];

    if ((gBmMapTerrain[y][x - 1] == terrainId) ||
        (gBmMapTerrain[y][x + 1] == terrainId)) {

        if ((gBmMapTerrain[y - 1][x] == TERRAIN_SEA) ||
            (gBmMapTerrain[y - 1][x] == 0x36) ||
            (gBmMapTerrain[y - 1][x] == TERRAIN_LAKE)) {
            return 4;
        }

        if ((gBmMapTerrain[y + 1][x] == TERRAIN_SEA) ||
            (gBmMapTerrain[y + 1][x] == 0x36) ||
            (gBmMapTerrain[y + 1][x] == TERRAIN_LAKE)) {
            return 0;
        }

        if (gBmMapTerrain[y - 1][x] == TERRAIN_DESERT) {
            return 0xC;
        }

        return 8;
    }

    if ((gBmMapTerrain[y - 1][x] == terrainId) ||
        (gBmMapTerrain[y + 1][x] == terrainId)) {

        if ((gBmMapTerrain[y][x + 1] == TERRAIN_SEA) ||
            (gBmMapTerrain[y][x + 1] == 0x36) ||
            (gBmMapTerrain[y][x + 1] == TERRAIN_LAKE)) {
            return 2;
        }

        if ((gBmMapTerrain[y][x - 1] == TERRAIN_SEA) ||
            (gBmMapTerrain[y][x - 1] == 0x36) ||
            (gBmMapTerrain[y][x - 1] == TERRAIN_LAKE)) {
            return 6;
        }

        if (gBmMapTerrain[y][x + 1] == TERRAIN_DESERT) {
            return 0xD;
        }

        return 9;

    }

    if ((gBmMapTerrain[y + 1][x - 1] == terrainId) ||
        (gBmMapTerrain[y - 1][x + 1] == terrainId)) {

        if ((gBmMapTerrain[y - 1][x - 1] == TERRAIN_SEA) ||
            (gBmMapTerrain[y - 1][x - 1] == 0x36) ||
            (gBmMapTerrain[y - 1][x - 1] == TERRAIN_LAKE)) {
            return 5;
        }

        if ((gBmMapTerrain[y + 1][x + 1] == TERRAIN_SEA) ||
            (gBmMapTerrain[y + 1][x + 1] == 0x36) ||
            (gBmMapTerrain[y + 1][x + 1] == TERRAIN_LAKE)) {
            return 1;
        }

        if (gBmMapTerrain[y - 1][x - 1] == TERRAIN_DESERT) {
            return 0xE;
        }

        return 10;
    }

    if ((gBmMapTerrain[y + 1][x + 1] == terrainId) ||
        (gBmMapTerrain[y - 1][x - 1] == terrainId)) {

        if ((gBmMapTerrain[y - 1][x + 1] == TERRAIN_SEA) ||
            (gBmMapTerrain[y - 1][x + 1] == 0x36) ||
            (gBmMapTerrain[y - 1][x + 1] == TERRAIN_LAKE)) {
            return 3;
        }

        if ((gBmMapTerrain[y + 1][x - 1] == TERRAIN_SEA) ||
            (gBmMapTerrain[y + 1][x - 1] == 0x36) ||
            (gBmMapTerrain[y + 1][x - 1] == TERRAIN_LAKE)) {
            return 7;
        }

        if (gBmMapTerrain[y - 1][x + 1] == TERRAIN_DESERT) {
            return 0xF;
        }

        return 0xB;
    }

    return 8;
}
int GetMinimapStairTileAt(int x, int y) {
    if (gBmMapTerrain[y - 1][x] == TERRAIN_STAIRS) {
        return 0x12;
    }

    if (gBmMapTerrain[y + 1][x] == TERRAIN_STAIRS) {
        return 0x12;
    }

    if (gBmMapTerrain[y][x - 1] == TERRAIN_STAIRS) {
        return 0x12;
    }

    if (gBmMapTerrain[y][x + 1] != TERRAIN_STAIRS) {
        return 0x11;
    }

    return 0x12;
}
int GetMinimapDoorTileAt(int x, int y) {

    if (gBmMapTerrain[y][x + 1] == TERRAIN_DOOR) {
        return 0x16;
    }

    if (gBmMapTerrain[y][x - 1] == TERRAIN_DOOR) {
        return 0x17;
    }

    return 7;
}
int GetMinimapBridgeKindAt(int x, int y) {
    if ((gBmMapTerrain[y][x + 1] == 0x13) ||
        (gBmMapTerrain[y][x - 1] == 0x13)) {
        return 0x10;
    }

    if ((gBmMapTerrain[y + 1][x] == 0x13) ||
        (gBmMapTerrain[y - 1][x] == 0x13)) {
        return 0x18;
    }

    if ((gBmMapTerrain[y][x + 1] == TERRAIN_RIVER) ||
        (gBmMapTerrain[y][x - 1] == TERRAIN_RIVER)) {
        return 0x18;
    }

    if ((gBmMapTerrain[y + 1][x] == TERRAIN_RIVER) ||
        (gBmMapTerrain[y - 1][x] == TERRAIN_RIVER)) {
        return 0x10;
    }

    if ((gBmMapTerrain[y][x + 1] == TERRAIN_LAKE) ||
        (gBmMapTerrain[y][x - 1] == TERRAIN_LAKE)) {
        return 0x18;
    }

    if ((gBmMapTerrain[y + 1][x] == TERRAIN_LAKE) ||
        (gBmMapTerrain[y - 1][x] == TERRAIN_LAKE)) {
        return 0x10;
    }

    // return; // BUG?

}
int GetMinimapTileAt(int x, int y) {
    switch (gBmMapTerrain[y][x]) {
        case TERRAIN_PLAINS:
            return 1;

        case TERRAIN_ROAD:
            return GetMinimapConnectKindAt(x, y) + 0x40;

        case 0x03:
        case TERRAIN_VILLAGE_CLOSED:
        case TERRAIN_HOUSE:
        case 0x38:
            return 2;

        case TERRAIN_ARMORY:
        case TERRAIN_VENDOR:
            return 3;

        case 0x08:
            return 4;

        case TERRAIN_FORT:
            return 5;

        case 0x0B:
        case 0x37:
            return 6;

        case TERRAIN_FOREST:
        case TERRAIN_SNAG:
            return 8;

        case TERRAIN_THICKET:
            return 9;

        case TERRAIN_SAND:
        case TERRAIN_DESERT:
            return 0xA;

        case TERRAIN_RIVER:
            return GetMinimapRiverKindAt(x, y) + 0x60;

        case TERRAIN_MOUNTAIN:
            return 0xB;

        case TERRAIN_PEAK:
            return 0x14;

        case 0x13:
        case 0x34:
            return GetMinimapBridgeKindAt(x, y);

        case 0x3C:
            return GetMinimapWaterKindAt(x, y) + 0x30;

        case TERRAIN_SEA:
        case TERRAIN_LAKE:
        case TERRAIN_GLACIER:
        case 0x35:
        case 0x36:
            return GetMinimapSeaKindAt(x, y) + 0x30;

        case 0x17:
        case 0x18:
        case 0x3E:
            return 0xC;

        case TERRAIN_PILLAR:
            return 0xD;

        case TERRAIN_DOOR:
            return GetMinimapDoorTileAt(x, y);

        case TERRAIN_THRONE:
            return 0xE;

        case 0x20:
        case 0x21:
            return 0xF;

        case 0x25:
            return 0x1A;

        case 0x3B:
            return 0x1B;

        case TERRAIN_CLIFF:
        case 0x3A:
            return GetMinimapCliffKindAt(x, y) + 0x50;

        case 0x27:
        case 0x28:
        case 0x29:
            return 0x13;

        case TERRAIN_SHIP_FLAT:
            return 0x3A;

        case TERRAIN_STAIRS:
            return GetMinimapStairTileAt(x, y);

        case 0x19:
        case 0x1A:
        case 0x1B:
        case TERRAIN_RUBBLE:
        case TERRAIN_ROOF:
        case TERRAIN_SHIP_WRECK:
        case TERRAIN_TILE_2C:
        case TERRAIN_TILE_2E:
        case 0x39:
        case 0x3D:
        case 0x3F:
        case 0x40:
            return GetMinimapConnectKindAt(x, y) + 0x20;

        case TERRAIN_VALLEY:
            return 0x19;

        case 0x00:
        case TERRAIN_C_ROOM_09:
        case 0x14:
        case TERRAIN_CHURCH:
        case TERRAIN_ARENA_30:
        case TERRAIN_FENCE_32:
        default:
            return 0;
    }
}
u16* GetMinimapTerrainCellAt(int x, int y) {
    return (u16*)(gBuf + (GetMinimapTileAt(x, y) * 0x20));
}
u16* GetMinimapObjectCellAt(int x, int y) {
    u8 factionIconOffsetLut[] = {
        [FACTION_ID_BLUE]  = 0x1D,
        [FACTION_ID_GREEN] = 0x1F,
        [FACTION_ID_RED]   = 0x1E,
    };

    int unitId = gBmMapUnit[y][x];

    if (unitId == 0) {
        return (u16*)(gBuf + 0x00);
    } else {
        return (u16*)(gBuf + (factionIconOffsetLut[unitId >> 6] * 0x20));
    }
}
void DrawMinimapInternal(u16* vram, int palId) {
    int iy;
    int ix;
    int chr;

    if (vram == 0) {
        vram = (void*)(BG_VRAM + 0x20);
    }

    chr = ((u32)vram << 15) >> 20;

    if (palId < 0) {
        palId = 3;
    }

    for (iy = 0; iy < gBmMapSize.y; iy += 2) {
        for (ix = 0; ix < gBmMapSize.x; ix += 2) {
            u16* iterA = GetMinimapTerrainCellAt(ix, iy);
            u16* iterB = GetMinimapTerrainCellAt(ix + 1, iy);

            *vram++ = *iterA;
            iterA += 2;
            *vram++ = *iterB;
            iterB += 2;
            *vram++ = *iterA;
            iterA += 2;
            *vram++ = *iterB;
            iterB += 2;
            *vram++ = *iterA;
            iterA += 2;
            *vram++ = *iterB;
            iterB += 2;
            *vram++ = *iterA;
            iterA += 2;
            *vram++ = *iterB;
            iterB += 2;

            iterA = GetMinimapTerrainCellAt(ix, iy + 1);
            iterB = GetMinimapTerrainCellAt(ix + 1, iy + 1);

            *vram++ = *iterA;
            iterA += 2;
            *vram++ = *iterB;
            iterB += 2;
            *vram++ = *iterA;
            iterA += 2;
            *vram++ = *iterB;
            iterB += 2;
            *vram++ = *iterA;
            iterA += 2;
            *vram++ = *iterB;
            iterB += 2;
            *vram++ = *iterA;
            iterA += 2;
            *vram++ = *iterB;
            iterB += 2;

            gBg1Tm[TM_OFFSET((ix / 2), (iy / 2))] = TILEREF(chr, palId);

            chr++;

            if ((gBmMapUnit[iy  ][ix  ] != 0) ||
                (gBmMapUnit[iy  ][ix+1] != 0) ||
                (gBmMapUnit[iy+1][ix  ] != 0) ||
                (gBmMapUnit[iy+1][ix+1] != 0)) {

                iterA = GetMinimapObjectCellAt(ix, iy);
                iterB = GetMinimapObjectCellAt(ix + 1, iy);

                *vram++ = *iterA;
                iterA += 2;
                *vram++ = *iterB;
                iterB += 2;
                *vram++ = *iterA;
                iterA += 2;
                *vram++ = *iterB;
                iterB += 2;
                *vram++ = *iterA;
                iterA += 2;
                *vram++ = *iterB;
                iterB += 2;
                *vram++ = *iterA;
                iterA += 2;
                *vram++ = *iterB;
                iterB += 2;

                iterA = GetMinimapObjectCellAt(ix, iy + 1);
                iterB = GetMinimapObjectCellAt(ix + 1, iy + 1);

                *vram++ = *iterA;
                iterA += 2;
                *vram++ = *iterB;
                iterB += 2;
                *vram++ = *iterA;
                iterA += 2;
                *vram++ = *iterB;
                iterB += 2;
                *vram++ = *iterA;
                iterA += 2;
                *vram++ = *iterB;
                iterB += 2;
                *vram++ = *iterA;
                iterA += 2;
                *vram++ = *iterB;
                iterB += 2;

                gBg0Tm[TM_OFFSET((ix / 2), (iy / 2))] = TILEREF(chr, (palId + 1));

                chr++;
            }

        }
    }

    return;
}
void Minimap_Init(ProcPtr proc) {
    PlaySoundEffect(0x398);

    Minimap_InitProcVars(proc);
    ApplyMinimapGraphics(-1);
    DrawMinimapInternal(0, -1);

    EnableBgSync(3);

    return;
}
void Minimap_OnHBlank() {
    u16 vcount = REG_VCOUNT + 1;

    if (vcount > 160) {
        gMinimapDisplayedWinBuf = gMinimapFrontWinBuf;
        vcount = 0;
    }

    REG_WIN0H = (gMinimapDisplayedWinBuf[vcount*2] << 8) + gMinimapDisplayedWinBuf[vcount*2 + 1];

    return;
}
void InitMinimapWindowBuffers() {
    s16* swap = gMinimapFrontWinBuf;
    gMinimapFrontWinBuf = gMinimapBackWinBuf;
    gMinimapBackWinBuf = swap;

    return;
}
void Minimap_InitOpenAnim(struct MinimapProc* proc) {
    gMinimapFrontWinBuf = gMinimapWinBuf[1];
    gMinimapBackWinBuf = gMinimapWinBuf[0];
    gMinimapDisplayedWinBuf = gMinimapWinBuf[1];

    SetWinEnable(1, 0, 0);

    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(0, 0, 1, 1, 1);

    SetWin0Box(DISPLAY_WIDTH, 0, 0, DISPLAY_HEIGHT);

    SetBlendTargetA(0, 0, 1, 1, 0);
    SetBlendTargetB(1, 1, 1, 1, 1);

    SetBlendBackdropB(1);

    SetBlendConfig(3, 16, 0, 0);

    gDispIo.win_ct.win0_enable_blend = 1;
    gDispIo.win_ct.win1_enable_blend = 1;
    gDispIo.win_ct.wout_enable_blend = 1;

    proc->animClock = 0;

    SetOnHBlankA(Minimap_OnHBlank);

    return;
}
void Minimap_OpenAnim(struct MinimapProc* proc) {
    int unk;
    int i;
    int angle;
    struct Vec2 arr[4];

    SetBlendConfig(3, 16, 0, proc->animClock / 4);

    unk = Interpolate(INTERPOLATE_RCUBIC, 0, 256, proc->animClock, 16);
    angle = unk / 4 - 64;

    arr[0].x = -proc->xRegionRadius;
    arr[0].y = -proc->yRegionRadius;

    arr[1].x = +proc->xRegionRadius;
    arr[1].y = -proc->yRegionRadius;

    arr[2].x = +proc->xRegionRadius;
    arr[2].y = +proc->yRegionRadius;

    arr[3].x = -proc->xRegionRadius;
    arr[3].y = +proc->yRegionRadius;

    for (i = 0; i <= 3; i++) {
        int a1;
        int a2;

        a1 = (COS_Q12(angle) * arr[i].x) - (SIN_Q12(angle) * arr[i].y);
        a2 = (SIN_Q12(angle) * arr[i].x) + (COS_Q12(angle) * arr[i].y);

        arr[i].x = ((a1 * unk) >> 20) + 120;
        arr[i].y = ((a2 * unk) >> 20) + 80;
    }

    sub_080133A8(gMinimapBackWinBuf);

    sub_080133C8(gMinimapBackWinBuf, arr[0].x, arr[0].y, arr[1].x, arr[1].y);
    sub_080133C8(gMinimapBackWinBuf, arr[1].x, arr[1].y, arr[2].x, arr[2].y);
    sub_080133C8(gMinimapBackWinBuf, arr[2].x, arr[2].y, arr[3].x, arr[3].y);
    sub_080133C8(gMinimapBackWinBuf, arr[3].x, arr[3].y, arr[0].x, arr[0].y);

    InitMinimapWindowBuffers();

    proc->animClock++;

    if (proc->animClock > 16) {
        Proc_Break(proc);
    }

    return;
}
void Minimap_InitCloseAnim(struct MinimapProc* proc) {
    PlaySoundEffect(0x399);

    SetBlendTargetA(0, 0, 1, 1, 0);
    SetBlendTargetB(1, 1, 1, 1, 1);

    SetBlendConfig(3, 16, 0, 4);

    gMinimapFrontWinBuf = gMinimapWinBuf[1];
    gMinimapBackWinBuf = gMinimapWinBuf[0];
    gMinimapDisplayedWinBuf = gMinimapWinBuf[1];

    proc->animClock = 0;

    return;
}
void Minimap_CloseAnim(struct MinimapProc* proc) {
    int i;
    int unk;
    int angle;
    struct Vec2 arr[4];

    SetBlendConfig(3, 16, 0, 4 - (proc->animClock / 4));

    unk = Interpolate(INTERPOLATE_CUBIC, 256, 0, proc->animClock, 16);
    angle = 64 - (unk / 4);

    arr[0].x = -proc->xRegionRadius;
    arr[0].y = -proc->yRegionRadius;

    arr[1].x = +proc->xRegionRadius;
    arr[1].y = -proc->yRegionRadius;

    arr[2].x = +proc->xRegionRadius;
    arr[2].y = +proc->yRegionRadius;

    arr[3].x = -proc->xRegionRadius;
    arr[3].y = +proc->yRegionRadius;

    for (i = 0; i <= 3; i++) {
        int a1;
        int a2;

        a1 = (COS_Q12(angle) * arr[i].x) - (SIN_Q12(angle) * arr[i].y);
        a2 = (SIN_Q12(angle) * arr[i].x) + (COS_Q12(angle) * arr[i].y);

        arr[i].x = ((a1 * unk) >> 20) + 120;
        arr[i].y = ((a2 * unk) >> 20) + 80;
    }

    sub_080133A8(gMinimapBackWinBuf);

    sub_080133C8(gMinimapBackWinBuf, arr[0].x, arr[0].y, arr[1].x, arr[1].y);
    sub_080133C8(gMinimapBackWinBuf, arr[1].x, arr[1].y, arr[2].x, arr[2].y);
    sub_080133C8(gMinimapBackWinBuf, arr[2].x, arr[2].y, arr[3].x, arr[3].y);
    sub_080133C8(gMinimapBackWinBuf, arr[3].x, arr[3].y, arr[0].x, arr[0].y);

    InitMinimapWindowBuffers();

    proc->animClock++;

    if (proc->animClock > 16) {
        Proc_Break(proc);
    }

    return;
}
void ApplyMinimapGraphics(int palId) {
    if (palId < 0) {
        palId = 3;
    }

    Decompress(gGfx_MinimapTiles, gBuf);

    ApplyPalette(gPal_MinimapTiles, palId);
    ApplyPalette(gPal_08A1FFD0, palId + 1);

    return;
}
void InitMinimapFlashPalette() {
    int colorNum;
    int palNum;

    gMinimapObjectFlashPal = (u16 *)gBuf;

    for (colorNum = 1; colorNum < 16; colorNum++) {
        int color = gPal[BGPAL_OFFSET(4) + colorNum];

        int red = RED_VALUE(color);
        int green = GREEN_VALUE(color);
        int blue = BLUE_VALUE(color);

        for (palNum = 0; palNum < 8; palNum++) {
            gMinimapObjectFlashPal[colorNum + 0x10 * palNum] = ((blue << 10) + (green << 5)) + red;

            red += 3;
            if (red > 31) {
                red = 31;
            }

            green += 3;
            if (green > 31) {
                green = 31;
            }

            blue += 3;
            if (blue > 31) {
                blue = 31;
            }
        }
    }

    return;
}
void Minimap_ApplyFlashPalette() {
    u8 gUnknown_08205D87[] = {
        0, 4, 7, 6,
        5, 4, 3, 2,
        2, 1, 1, 1,
        0, 0, 0, 0,
    };

    u8 idx = gUnknown_08205D87[(GetGameTime() >> 2) % sizeof(gUnknown_08205D87)];

    ApplyPalette(gMinimapObjectFlashPal + idx * 0x10, 4);

    return;
}
void Minimap_ApplyViewportFlashColor() {
    u8 idx;
    int tmp;
    int r, g, b;

    u8 gUnknown_08205D97[] = {
        0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
        0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F,
        0x0F, 0x0E, 0x0D, 0x0C, 0x0B, 0x0A, 0x09, 0x08,
        0x07, 0x06, 0x05, 0x04, 0x03, 0x02, 0x01, 0x00,
    };

    tmp = GetGameTime() & 0x1F;
    idx = gUnknown_08205D97[tmp];
    tmp = idx + 0x10;

    r = tmp;
    g = tmp;
    b = tmp;

    gPal[OBPAL_OFFSET(0) + 0xE] = (b << 10) + (g << 5) + r;
    EnablePalSync();

    return;
}
void Minimap_PutViewport(struct MinimapProc* proc) {
    int xScreen;
    int yScreen;

    u16 viewportSprite[] = {
        4,
        OAM0_SHAPE_8x8 + OAM0_Y(-1), OAM1_SIZE_8x8 + OAM1_X(-1), OAM2_CHR(0x28),
        OAM0_SHAPE_8x8 + OAM0_Y(-1), OAM1_SIZE_8x8 + OAM1_X(53) + OAM1_HFLIP, OAM2_CHR(0x28),
        OAM0_SHAPE_8x8 + OAM0_Y(33), OAM1_SIZE_8x8 + OAM1_X(-1) + OAM1_VFLIP, OAM2_CHR(0x28),
        OAM0_SHAPE_8x8 + OAM0_Y(33), OAM1_SIZE_8x8 + OAM1_X(53) + OAM1_HFLIP + OAM1_VFLIP, OAM2_CHR(0x28),
    };

    xScreen = proc->xScreen + gBmSt.camera.x / 4;
    yScreen = proc->yScreen + gBmSt.camera.y / 4;

    PutOamHiRam(xScreen, yScreen, viewportSprite, 0);

    return;
}
void Minimap_AdjustDisplay(struct MinimapProc* proc) {
    int x = (DISPLAY_WIDTH - (gBmMapSize.x * 4)) >> 1;
    int y = (DISPLAY_HEIGHT - (gBmMapSize.y * 4)) >> 1;

    if ((gBmMapSize.y * 4) > DISPLAY_HEIGHT - 16) {
        y = ((gBmMapSize.y * 4) - DISPLAY_HEIGHT + 16);
        y = ((gBmSt.camera.y << 16) / gBmSt.camera_max.y) * y / 0x10000;
        y = 8 - y;
    }

    proc->xScreen = x;
    proc->yScreen = y;

    SetBgOffset(0, -x, -y);
    SetBgOffset(1, -x, -y);

    return;
}
void Minimap_HandleMoveInput(struct MinimapProc* proc) {
    int x = gBmSt.camera.x;
    int y = gBmSt.camera.y;

    if (((x % 16) == 0) && ((y % 16) == 0)) {
        proc->xCameraSpeed = 0;
        proc->yCameraSpeed = 0;

        if (gpKeySt->held & DPAD_LEFT) {
            proc->xCameraSpeed = -8;
            proc->cameraMoved = 1;
        }

        if (gpKeySt->held & DPAD_RIGHT) {
            proc->xCameraSpeed = +8;
            proc->cameraMoved = 1;
        }

        if (gpKeySt->held & DPAD_UP) {
            proc->yCameraSpeed = -8;
            proc->cameraMoved = 1;
        }

        if (gpKeySt->held & DPAD_DOWN) {
            proc->yCameraSpeed = +8;
            proc->cameraMoved = 1;
        }
    }

    x = x + proc->xCameraSpeed;
    y = y + proc->yCameraSpeed;

    if (x < 0) {
        x = 0;
    }

    if (x > gBmSt.camera_max.x) {
        x = gBmSt.camera_max.x;
    }

    if (y < 0) {
        y = 0;
    }

    if (y > gBmSt.camera_max.y) {
        y = gBmSt.camera_max.y;
    }

    gBmSt.camera.x = x;
    gBmSt.camera.y = y;

    return;
}
void Minimap_InitProcVars(struct MinimapProc* proc) {
    proc->cameraMoved = 0;

    proc->xRegionRadius = gBmMapSize.x * 2;
    proc->yRegionRadius = gBmMapSize.y * 2;

    return;
}
void Minimap_AdjustCursorOnClose(struct MinimapProc* proc) {
    int x;
    int y;

    if (proc->cameraMoved != 0) {
        x = (gBmSt.camera.x / 16) + 7;
        y = (gBmSt.camera.y / 16) + 5;

        SetMapCursorPosition(x, y);
    }

    SetOnHBlankA(NULL);

    return;
}
void Minimap_Main(ProcPtr proc) {
    Minimap_ApplyFlashPalette();

    Minimap_ApplyViewportFlashColor(proc);
    Minimap_AdjustDisplay(proc);
    Minimap_PutViewport(proc);
    Minimap_HandleMoveInput(proc);

    if (gpKeySt->held & (R_BUTTON | L_BUTTON)) {
        SetBlendTargetA(0, 1, 0, 0, 0);
        SetBlendTargetB(0, 0, 1, 1, 1);
        SetBlendConfig(1, 8, 8, 0);
    } else {
        SetBlendTargetA(0, 0, 1, 1, 0);
        SetBlendTargetB(1, 1, 1, 1, 1);
        SetBlendConfig(3, 16, 0, 4);
    }

    if (((gBmSt.camera.x & 0xF) == 0) && ((gBmSt.camera.y & 0xF) == 0) && (gpKeySt->pressed & (B_BUTTON | START_BUTTON))) {
        Proc_Break(proc);
    }

    return;
}
void StartMinimapPlayerPhase() {
    Proc_Start(ProcScr_Minimap, PROC_TREE_3);
    return;
}
void DrawMinimap(int chapterId, u16* vram, int palId) {
    TmFill(gBg0Tm, 0);
    TmFill(gBg1Tm, 0);

    InitChapterPreviewMap(chapterId);
    ApplyMinimapGraphics(palId);
    DrawMinimapInternal(vram, palId);

    return;
}
