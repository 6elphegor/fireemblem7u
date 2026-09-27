#pragma once

#include "global.h"

struct ChapterMap {
    u8  obj1Id;
    u8  obj2Id;
    u8  paletteId;
    u8  tileConfigId;
    u8  mainLayerId;
    u8  objAnimId;
    u8  paletteAnimId;
    u8  changeLayerId;
};

enum {
    MAP_BGM_BLUE            =  0,
    MAP_BGM_RED             =  1,
    MAP_BGM_GREEN           =  2,
    MAP_BGM_BLUE_HECTOR     =  3,
    MAP_BGM_RED_HECTOR      =  4,
    MAP_BGM_GREEN_HECTOR    =  5,
    MAP_BGM_BLUE_GREEN_ALT  =  6,
    MAP_BGM_RED_ALT         =  7,
    MAP_BGM_PROLOGUE_LYN    =  8,
    MAP_BGM_PROLOGUE        =  9,
    MAP_BGM_PROLOGUE_HECTOR = 10,

    MAP_BGM_MAX
};

struct ChapterInfo {
    /* 00 */ char const * debug_name;

    /* 04 */ u8 asset_img_a;
    /* 05 */ u8 asset_img_b;
    /* 06 */ u8 asset_pal;
    /* 07 */ u8 asset_tileset;
    /* 08 */ u8 asset_map;
    /* 09 */ u8 asset_img_anims;
    /* 0A */ u8 asset_pal_anims;
    /* 0B */ u8 asset_map_changes;

    /* 0C */ u8 fog;
    /* 0D */ u8 has_prep;
    /* 0E */ u8 title_ids[2];
    /* 10 */ u8 unk_0F;
    /* 11 */ u8 unk_10;
    /* 12 */ u8 weather;
    /* 13 */ u8 banim_terrain_id;
    /* 14 */ u8 hard_bonus_levels;

    ALIGN_PAD(0x15, 0x16);

    /* 16 */ u16 map_bgm_ids[8];
    /* 26 */ u16 song_prologue_lyn;
    /* 28 */ u16 song_openning[2];

    /* 2C */ u8 wall_hp;

    /* 2D */ u8 turnsForTacticsRankAInEliwoodStory[2]; // FE7
    /* 2F */ u8 turnsForTacticsRankAInHectorStory[2]; // FE7
    /* 31 */ u8 turnsForTacticsRankBInEliwoodStory[2]; // FE7
    /* 33 */ u8 turnsForTacticsRankBInHectorStory[2]; // FE7
    /* 35 */ u8 turnsForTacticsRankCInEliwoodStory[2]; // FE7
    /* 37 */ u8 turnsForTacticsRankCInHectorStory[2]; // FE7
    /* 39 */ u8 turnsForTacticsRankDInEliwoodStory[2]; // FE7
    /* 3B */ u8 turnsForTacticsRankDInHectorStory[2]; // FE7

    /* 3D */ u8 unk3D; // padding?

    /* 3E */ u16 gainedExpForExpRankAInEliwoodStory[2]; // FE7
    /* 42 */ u16 gainedExpForExpRankAInHectorStory[2]; // FE7
    /* 46 */ u16 gainedExpForExpRankBInEliwoodStory[2]; // FE7
    /* 4A */ u16 gainedExpForExpRankBInHectorStory[2]; // FE7
    /* 4E */ u16 gainedExpForExpRankCInEliwoodStory[2]; // FE7
    /* 52 */ u16 gainedExpForExpRankCInHectorStory[2]; // FE7
    /* 56 */ u16 gainedExpForExpRankDInEliwoodStory[2]; // FE7
    /* 5A */ u16 gainedExpForExpRankDInHectorStory[2]; // FE7

    /* 5E */ u16 unk5E; // padding?

    /* 60 */ u32 goldForFundsRankInEliwoodStory[2]; // FE7
    /* 68 */ u32 goldForFundsRankInHectorStory[2]; // FE7

    /* 70 */ u16 msg_chapter_title[2];
    /* 74 */ u16 unk74[2]; // FE7U only (not in FE7J): the fields below are at FE7J offset + 4

    /* 78 */ u8 mapEventDataId;
    /* 79 */ u8 gmapEventId;

    /* 7A */ u16 divinationTextIdBeginning; // FE7
    /* 7C */ u16 divinationTextIdInEliwoodStory; // FE7
    /* 7E */ u16 divinationTextIdInHectorStory; // FE7
    /* 80 */ u16 divinationTextIdEnding; // FE7
    /* 82 */ u8 divinationPortrait; // FE7
    /* 83 */ u8 divinationFee; // FE7

    /* 84 */ u8 prepScreenNumber[2];
    /* 86 */ u8 merchantPosX;
    /* 87 */ u8 merchantPosXInHectorStory; // FE7
    /* 88 */ u8 merchantPosY;
    /* 89 */ u8 merchantPosYInHectorStory; // FE7

    /* 8A */ s8 victorySongEnemyThreshold;
    /* 8B */ bool8 fadeToBlack;

    /* 8C */ u16 statusObjectiveTextId;
    /* 8E */ u16 goalWindowTextId;
    /* 90 */ u8 goalWindowDataType;
    /* 91 */ u8 protectCharacterIndex;

    /* 92 */ u8 destPosX;
    /* 93 */ u8 destPosY;

    /* 94 */ u8 unk94; // ?
    /* 95 */ u8 default_background;
    /* 96 */ u8 unk96; // ?
    /* 97 */ u8 unk97; // ?
};

struct ChapterEventGroup
{
    /* 00 */ const void * turnBasedEvents;
    /* 04 */ const void * characterBasedEvents; // must be 32-Aligned?
    /* 08 */ const void * locationBasedEvents;
    /* 0C */ const void * miscBasedEvents;

    // select unit -> select destination -> move unit to destination
    /* 10 */ const void * specialEventsWhenUnitSelected;
    /* 14 */ const void * specialEventsWhenDestSelected;
    /* 18 */ const void * specialEventsAfterUnitMoved;

    /* 1C */ const void * tutorialEvents;

    /* 20 */ const void * traps;
    /* 24 */ const void * extraTrapsInHard;

    /* 28 */ const void * playerUnitsInNormal;
    /* 2C */ const void * playerUnitsInHard;

    /* 30 */ STRUCT_PAD(0x30, 0x38);

    /* 38 */ const void * beginningSceneEvents;
    /* 3C */ const void * endingSceneEvents;
};

const struct ChapterInfo * GetChapterInfo(u32 chIndex);
const void * GetChapterMapPointer(u32 chIndex);
const void * GetChapterMapChanges(u32 chIndex);
const char * GetChapterTitleName(u32 chIndex);
u8 IsDifficultMode(void);

extern CONST_DATA struct ChapterInfo gChapterDataTable[];
extern const void * gChapterDataAssetTable[];
