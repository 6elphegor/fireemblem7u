#pragma once

// The tables that name each battle animation's parts: banim_data (one entry
// per animation), battle_terrain_table, character_battle_animation_palette_table.
// The structs are here so that src/data/banimtables.c, which defines the tables
// (const, and none of the readers' declarations may be visible), can share them.

#include "global.h"

struct BattleAnim {
    char abbr[12];
    int * modes;
    char * script;
    char * oam_r;
    char * oam_l;
    u16 * pal;
};
GBA_SIZE_CHECK(struct BattleAnim, 0x20);

struct BattleAnimCharaPal {
    char abbr[12];
    u16 * pal;
};
GBA_SIZE_CHECK(struct BattleAnimCharaPal, 0x10);

struct BattleAnimTerrain {
    char abbr[12];
    char * tileset;
    u16 * palette;
    int null_1; // useless, always 00
};
GBA_SIZE_CHECK(struct BattleAnimTerrain, 0x18);
