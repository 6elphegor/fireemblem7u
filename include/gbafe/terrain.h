#pragma once

#include "global.h"

struct Unit;

enum trap_types {
    TRAP_NONE       = 0,
    TRAP_BALLISTA   = 1,
    TRAP_OBSTACLE   = 2, // walls & snags
    TRAP_MAPCHANGE  = 3,
    TRAP_FIRETILE   = 4,
    TRAP_GAS        = 5,
    TRAP_MAPCHANGE2 = 6, // TODO: figure out
    TRAP_LIGHTARROW = 7,
    TRAP_8          = 8,
    TRAP_9          = 9,
    TRAP_TORCHLIGHT = 10,
    TRAP_MINE       = 11,
    TRAP_GORGON_EGG = 12, // TODO: figure out
    TRAP_LIGHT_RUNE = 13,
};

struct Trap {
    /* 00 */ u8 xPos;
    /* 01 */ u8 yPos;

    /* 02 */ u8 type;

    /* 03 */ u8 extra; // extra data (meaning varies based on trap type)
    /* 04 */ s8 data[4]; // more extra data (see above enum for per trap type entry allocations)
};
GBA_SIZE_CHECK(struct Trap, 0x8);

#define TRAP_INDEX(aTrap) ((aTrap) - GetTrap(0))

enum { TRAP_MAX_COUNT = 64 };

enum {
    // Trap::data indices
    TRAP_EXTDATA_BLST_RIDDEN   = 1, // "is ridden" boolean
    TRAP_EXTDATA_BLST_ITEMUSES = 2, // ballista item uses

    TRAP_EXTDATA_TRAP_TURNFIRST = 0, // start turn countdown
    TRAP_EXTDATA_TRAP_TURNNEXT  = 1, // repeat turn countdown
    TRAP_EXTDATA_TRAP_COUNTER   = 2, // turn counter
    TRAP_EXTDATA_TRAP_DAMAGE    = 3, // trap damage

    TRAP_EXTDATA_RUNE_TURNSLEFT = 2, // turns left before wearing out
};

struct MapChange {
    /* 00 */ s8 id;
    /* 01 */ u8 xOrigin;
    /* 02 */ u8 yOrigin;
    /* 03 */ u8 xSize;
    /* 04 */ u8 ySize;
    /* 08 */ const u16 * data;
};
GBA_SIZE_CHECK(struct MapChange, 0xC);

extern u16 ** gBmMapBaseTiles; // FE7U: ROM-resident pointer (0x08B932B4)

struct Trap *GetTrap(int id);
void ClearTraps(void);
struct Trap *GetTrapAt(int x, int y);
void ApplyMapChange(int index);
void AddMapChangeTrap(int id);

// bmtrick
void InitTraps(void);
struct Trap * GetTypedTrapAt(int x, int y, int trapType);
struct Trap * AddTrap(int x, int y, int trapType, int meta);
struct Trap * AddDamagingTrap(int x, int y, int trapType, int meta, int turnCountdown, int turnInterval, int damage);
struct Trap * RemoveTrap(struct Trap * trap);
void AddFireTile(int x, int y, int turnCountdown, int turnInterval);
void AddGasTrap(int x, int y, int facing, int turnCountdown, int turnInterval);
void AddArrowTrap(int x, int turnCountdown, int turnInterval);
void AddMapChange2Trap(int x, int y, int turnCountdown, int turnInterval);
void AddTrap8(int x, int y);
void AddTrap9(int x, int y, int meta);
void InitMapObstacles(void);
void ApplyEnabledMapChanges(void);
void RefreshAllLightRunes(void);
int GetObstacleHpAt(int x, int y);
const struct MapChange * GetMapChange(int id);
void RemoveMapChangeTrap(int id);
void UnitHideIfUnderRoof(struct Unit * unit);
void UpdateRoofedUnits(void);
void GenerateFireTileTrapTargets(int x, int y, int damage);
void GenerateArrowTrapTargets(int x, int y, int damage);
void GenerateGasTrapTargets(int x, int y, int damage, int facing);
s8 ShouldSkipGasTrapDisplay(int x, int y, int facing);
void GenerateTrapDamageTargets(void);
void GenerateDisplayedTrapDamageTargets(void);
void CountDownTraps(void);
void ResetCountedDownTraps(void);
void RefreshEntityMapsAsRedPhase(void);
void StartTrapDamageMapAnim(void);
void PostTrapExecFlag(void);
struct Trap * AddLightRune(int x, int y);
struct Trap * RemoveLightRune(struct Trap * trap);
void DecayTraps(void);
void DisableAllLightRunes(void);
void EnableAllLightRunes(void);

int GetTrueTerrainAt(int x, int y); /* GetTrueTerrainAt */
bool8 CheckPermanentFlag(int flag);
extern const uintptr_t gEvent_GameOver[]; // EventScr
void RefreshTerrainMap(void);
