#pragma once

#include "global.h"
#include "bm.h"

enum save_chunk_idx {
    SAVE_GAME0,
    SAVE_GAME1,
    SAVE_GAME2,
    SAVE_SUSPEND,
    SAVE_SUSPEND_ALT,
    SAVE_MULTIARENA,
    SAVE_XMAP,
    SAVE_COUNT,
};

enum save_kind_idx {
    SAVE_KIND_GAME,
    SAVE_KIND_SUSPEND,
    SAVE_KIND_MULTIARENA,
    SAVE_KIND_XMAP,

    SAVE_KIND_INVALID = UINT8_MAX,
};

enum save_chunk_magics {
    SAVE_MAGIC32 = 0x30317,
    SAVE_MAGIC32_SAV = 0x11217,
    SAVE_MAGIC32_SUS = 0x20509,
    SAVE_MAGIC32_MULTIARENA = 0x20112,
    SAVE_MAGIC32_XMAP = 0x20223,
    SAVE_MAGIC16 = 0x200A,
};

#define MAX_CLEARED_PLAYTHROUGHS 12

struct GlobalSaveInfo {
    /* 00 */ char name[0x8];
    /* 08 */ u32 magic32;
    /* 0C */ u16 magic16;

    /* 0E */ u8 completed  : 1;
             u8 flag0E_1 : 1;
             u8 Eirk_mode_easy : 1;
             u8 Eirk_mode_norm : 1;
             u8 Eirk_mode_hard : 1;
             u8 Ephy_mode_easy : 1;
             u8 Ephy_mode_norm : 1;
             u8 Ephy_mode_hard : 1;

    /* 0F */ u8 game_end;

    /* 10 */ u32 unk10_00 : 8;
             u32 unk10_08 : 16;
             u32 unk10_18 : 5;
             u32 unk10_1D : 3;

    /* 14 */ u8 cleared_playthroughs[MAX_CLEARED_PLAYTHROUGHS];
    /* 20 */ u8 SuppordRecord[0x40 - 0x20];
    /* 40 */ u8 charKnownFlags[0x60 - 0x40];

    /* 60 */ u16 checksum;
    /* 62 */ u8 last_game_save_id;
    /* 63 */ u8 last_suspend_slot;
};

struct SaveBlockInfo {
    /* 00 */ u32 magic32;
    /* 04 */ u16 magic16;
    /* 06 */ u8 kind;
    /* 08 */ u16 offset;
    /* 0A */ u16 size;
    /* 0C */ u32 checksum32;
};

struct SramMain {
    struct GlobalSaveInfo head;
    struct SaveBlockInfo block_info[SAVE_COUNT];

    /* Todo */
};

extern struct SramMain * gSramMain;

#define GLOBALSIZEINFO_SIZE_FOR_CHECKSUM 0x50

/* SRAM offsets of the misc save data (relative to gSramMain) */
#define SRAM_OFFSET_RANKDATA   0x7044
#define SRAM_OFFSET_FE6LINK    0x70D8
#define SRAM_OFFSET_SOUNDROOM  0x70FC
#define SRAM_OFFSET_LINKARENA2 0x7120
#define SRAM_OFFSET_BONUSCLAIM 0x7134

struct GameRankSaveData {
    /* 00 */ u32 valid : 0x01;
             u32 overall_rank : 0x03;
             u32 tactics_rank : 0x03;
             u32 survival_rank : 0x03;
             u32 funds_rank : 0x03;
             u32 exp_rank : 0x03;
             u32 combat_rank : 0x03;

             u32 chapter_mode : 0x02;
             u32 difficulty : 0x01;
             u32 unk00_16 : 0x01;
             u32 unk00_17 : 0x08;
             u32 cuteguy : 0x08;

             u32 hours : 0x0A;
             u32 minutes : 0x06;
             u32 seconds : 0x06;
             u32 gold : 0x18;

    /* 08 */ u32 unk08_15 : 0x06;
             u32 unk08_1F : 0x01;

    /* 0C */ char tactician_name[0xB];

    /* 17 */ u8 luckydog;
};

struct GameRankSaveDataPacks {
    /* 00 */ struct GameRankSaveData pack[6];
    /* 90 */ u16 checksum;
    /* 92 */ u16 unk92;
};

struct Fe6LinkSaveInfo {
    /* 00 */ u32 flags[8];
    /* 20 */ u16 value;
    /* 22 */ u16 checksum;
};

struct SoundRoomSaveData {
    /* 00 */ u32 flags[8];
    /* 20 */ u16 checksum;
    /* 22 */ u16 unk22;
};

struct LinkArenaSaveData2 {
    /* 00 */ u32 flags[4];
    /* 10 */ u16 checksum;
    /* 12 */ u16 unk12;
};

#define SRAM_XMAP_SIZE 0xC00u
#define SRAM_XMAP_ADDR (CART_SRAM + CART_SRAM_SIZE - SRAM_XMAP_SIZE)

void SramInit(void);
bool IsSramWorking(void);
void WipeSram(void);
u16 Checksum16(void const * data, int size);
bool ReadGlobalSaveInfo(struct GlobalSaveInfo * info);
void WriteGlobalSaveInfo(struct GlobalSaveInfo * info);
void WriteGlobalSaveInfoNoChecksum(struct GlobalSaveInfo * info);
void InitGlobalSaveInfo(void);
void ResetFe6LinkSaveInfo(void);
void EraseBonusContentData(void);
void * SramOffsetToAddr(u16 off);
u16 SramAddrToOffset(void * addr);
bool ReadSaveBlockInfo(struct SaveBlockInfo * block_info, int save_id);
void WriteSaveBlockInfo(struct SaveBlockInfo * block_info, int save_id);
// ??? EraseSaveBlockInfo
void * GetSaveWriteAddr(int save_id);
void * GetSaveReadAddr(int save_id);
void WriteChapterFlags(void * sram_dest);
void WritePermanentFlags(void * sram_dest);
void ReadChapterFlags(void const * sram_src);
void ReadPermanentFlags(void const * sram_src);
void WriteSupplyItems(void * sram_dest);
void ReadSupplyItems(void const * sram_src);
s32 sub_0809E9FC(void);
int sub_0809EA58(void);
bool sub_0809EA7C(void);
bool IsExtraLinkArenaEnabled(void);
bool IsExtraSoundRoomEnabled(void);
bool IsExtraSupportViewerEnabled(void);
u32 GetRankDataValidBitMap(void);
bool IsExtraBonusClaimEnabled(void);
int GetUnitsAverageSupportValue(const int unitA, const int unitB);
int GetTotalAverageSupportValue(void);
int GetTotalGlobalSupportValue(struct GlobalSaveInfo * info);
int GetTotalSupportCollection(void);
int GetGlobalBestSupport(int unitA, int unitB, struct GlobalSaveInfo * info);
void GetGlobalSupportListFromSave(int pid, u8 * data, struct GlobalSaveInfo * info);
bool UpdateBestGlobalSupportValue(int unitA, int unitB, int supportRank);
void MetaSave_SetMetCharacter(int pid, struct GlobalSaveInfo * info);
bool GGM_IsCharacterKnown(int pid, struct GlobalSaveInfo * info);
int GGM_IsAnyCharacterKnown(struct GlobalSaveInfo * info);
void sub_0809EF8C(void);
void sub_0809EF90(void);
bool IsGamePlayedThrough(void);
int CheckLinkedToFE6(void);
bool ReadFe6LinkSaveInfo(void * buf);
void WriteFe6LinkSaveInfo(void * buf);
void ClearFe6LinkSaveInfo(struct Fe6LinkSaveInfo * link);
bool Fe6LinkSaveInfo_CheckFlag(struct Fe6LinkSaveInfo * link, int flag);
void Fe6LinkSaveInfo_SetFlag(struct Fe6LinkSaveInfo * link, int flag);
void Fe6LinkSaveInfo_SetValue(struct Fe6LinkSaveInfo * link, u16 value);
u16 Fe6LinkSaveInfo_GetValue(struct Fe6LinkSaveInfo * link);
bool LoadAndVerfyRankData(void * buf);
bool LoadBonusContentData(void * buf);
void SaveBonusContentData(void * buf);
void SaveRankings(void * buf);
void EraseSaveRankData(void);
int GetNextChapterMode(void);
int LoadRankData(void * buf, int chapter_mode, int difficulty);
void SaveNewRankData(void * buf, int chapter_mode, int difficulty);
u8 JudgeGameRankSaveData(struct GameRankSaveData * old, struct GameRankSaveData * new);
void GenerateGameRankSaveData(struct GameRankSaveData * buf, int chapter_mode, int difficulty);
void SaveEndgameRankings(void);
void EraseSoundRoomSaveData(void);
bool LoadAndVerifySoundRoomData(void * buf);
void WriteSoundRoomSaveData(struct SoundRoomSaveData * buf);
bool IsSoundRoomSongUnlocked(struct SoundRoomSaveData * buf, int song);
void UnlockSoundRoomSong(struct SoundRoomSaveData * buf, int song);
void EraseLinkArenaStruct2(void);
bool LoadAndVerfyLinkArenaStruct2(void * buf);
void WriteLinkArenaStruct2(struct LinkArenaSaveData2 * buf);
bool ModifySaveLinkArenaStruct2A(struct LinkArenaSaveData2 * buf, int val);
void ModifySaveLinkArenaStruct2B(struct LinkArenaSaveData2 * buf, int val);
void SaveGlobalLang(int lang);
int LoadGlobalLang(void);
void LoadAndVerifySramSaveData(void);

struct PidStats
{
    u32 loss_count      : 8;
    u32 favval          : 16;
    u32 act_count       : 8;
    u32 stat_view_count : 8;
    u32 defeat_chapter  : 6;
    u32 defeat_turn     : 10;
    u32 deploy_count    : 6;
    u32 move_count      : 10;
    u32 defeat_cause    : 4;
    u32 exp_gained      : 12;
    u32 win_count       : 10;
    u32 battle_count    : 12;
    u32 killer_pid      : 9;
    u32 : 0; // unused/padding (15 bits)
};

#define BWL_ARRAY_NUM 0x46

struct ChapterStats {
    /* 00 */ u16 chapter_index : 7;
             u16 chapter_turn  : 9;
    /* 02 */ u16 chapter_time;
};

#define WIN_ARRAY_NUM 0x30

extern struct PidStats * gPidStatsSaveLoc;
extern struct PidStats gPidStatsData[BWL_ARRAY_NUM];
extern struct ChapterStats gChapterStats[WIN_ARRAY_NUM];

void ClearPidChStatsSaveData(void * sram_dest);
void ClearPidStats_ret(void);
void ClearPidStats(void);
void ReadPidStats(void * sram_src);
void ReadChapterStats(void const * sram_src);
void WritePidStats(void * sram_dest);
void WriteChapterStats(void * sram_dest);
struct ChapterStats * GetChapterStats(int index);
bool IsChapterStatsValid(struct ChapterStats * chapter_stats);
int GetNextChapterStatsSlot(void);
int GetCurCompleteChapters(void);
int GetNextChapterStatsEntry(void);
void RegisterChapterStats(struct PlaySt *);
int GetGameTotalTime_unused(void);
int GetGameTotalTurnCount(void);
bool IsChapterPartOfCurrentMode(int ch_index);
int GetGameTotalTime(void);
int GetTotalTurnCountUpUntilNow(void);
void PidStatsAddBattleAmt(struct Unit * unit);
void PidStatsAddWinAmt(u8 pid);
void PidStatsRecordLoseData(u8 pid);
void PidStatsRecordDefeatInfo(u8 pid, u8 killerPid, int deathCause);
void PidStatsAddActAmt(u8 pid);
void PidStatsAddStatView(u8 pid);
void PidStatsAddDeployAmt(u8 pid);
void PidStatsAddMove(u8 pid, int amount);
void PidStatsAddExpGained(u8 pid, int expGain);
void PidStatsSubFavval08(u8 pid);
void PidStatsSubFavval100(u8 pid);
int PidStatsGetTotalBattleAmt(void);
int PidStatsGetTotalWinAmt(void);
int PidStatsGetTotalLossAmt(void);
int PidStatsGetTotalLevel(void);
int PidStatsGetTotalExpGain(void);
int PidStatsGetExpGain(u8 pid);
int PidStatsGetFavval(u8 pid);
void PidStatsAddFavval(u8 pid, int val);
void PidStatsRecordBattleRes(void);
bool IsPlaythroughIdUnique(int index);
int GetNewPlaythroughId(void);
int GetGlobalCompletionCntByInfo(struct GlobalSaveInfo * info);
int GetGlobalCompletionCount(void);
bool RegisterCompletedPlaythrough(struct GlobalSaveInfo * info, int index);
void SavePlayThroughData(void);
bool IsFirstChapterStatsPrologue(void);
int GetCompletedPlaythroughKind(void);
void WriteCompletedPlaythroughSaveData(void);
struct PidStats * GetPidStats(u8 pid);
#define UNIT_SAVE_AMOUNT_BLUE 52

enum {
    PACKED_US_DEAD       = (1 << 0),
    PACKED_US_UNDEPLOYED = (1 << 1),
    PACKED_US_SOLO_ANIM1 = (1 << 2),
    PACKED_US_SOLO_ANIM2 = (1 << 3),
    PACKED_US_METIS_TOME = (1 << 4),
    PACKED_US_B5         = (1 << 5),
    PACKED_US_B6         = (1 << 6),
};

struct GameSavePackedUnit {
    /* 00 */ u32 jid : 7;
             u32 level : 5;
             u32 exp : 7;
             u32 xPos : 6;
             u32 yPos : 6;
             u32 flags : 13;
             u32 max_hp : 6;
             u32 pow : 5;
             u32 skl : 5;
             u32 spd : 5;
             u32 def : 5;
             u32 res : 5;
             u32 lck : 5;
             u32 con_bonus : 5;
             u32 mov_bonus : 5;
             u32 item1 : 14;
             u32 item2 : 14;
             u32 item3 : 14;
             u32 item4 : 14;
             u32 item5 : 14;
    /* 14 */ u8 pid;
    /* 15 */ u8 ranks[8];
    /* 1D */ u8 supports[7];
} __attribute__((packed));

struct GameSaveBlock {
    /* 000 */ struct PlaySt playSt;
    /* 048 */ struct GameSavePackedUnit units[UNIT_SAVE_AMOUNT_BLUE];
    /* 798 */ u16 supplyItems[100];
    /* 860 */ u8 pidStats[0xCC0 - 0x860];
    /* CC0 */ u8 chapterStats[0xD80 - 0xCC0];
    /* D80 */ u8 permanentFlags[0xD88 - 0xD80];
    /* D88 */ u32 bonusClaimFlags;
};

#define UNIT_SAVE_AMOUNT_RED 50
#define UNIT_SAVE_AMOUNT_GREEN 10

struct SuspendSavePackedUnit {
    /* 00 */ u8 pid;
    /* 01 */ u8 jid;
    /* 02 */ u8 ai1;
    /* 03 */ u8 rescue;
    /* 04 */ u32 state;
    /* 08 */ u16 item1; // top 2 bits: supportBits
    /* 0A */ u16 item2;
    /* 0C */ u16 item3;
    /* 0E */ u8 maxHP;
    /* 0F */ u8 curHP;
    /* 10 */ u8 exp;
    /* 11 */ u8 aiFlags;
    /* 12 */ u8 ranks[8];
    /* 1A */ u8 supports[7];
    /* 21 */ u8 ai1data;
    /* 22 */ u8 ai2;
    /* 23 */ u8 ai2data;
    /* 24 */ u32 level : 5;
             u32 xPos : 6;
             u32 yPos : 6;
             u32 pow : 5;
             u32 skl : 5;
             u32 spd : 5;
    /* 28 */ u32 def : 5;
             u32 res : 5;
             u32 lck : 5;
             u32 conBonus : 5;
             u32 statusIndex : 3;
             u32 statusDuration : 3;
             u32 torchDuration : 3;
             u32 barrierDuration : 3;
    /* 2C */ u32 movBonus : 4;
             u32 item4 : 14;
             u32 item5 : 14;
    /* 30 */ u8 ballistaIndex; // bit 7: supportBits
    /* 31 */ u8 unk31;
    /* 32 */ u16 ai3And4;
};

struct SuspendSaveBlock {
    /* 0000 */ struct PlaySt playSt;
    /* 0048 */ struct Action action;
    /* 0064 */ struct SuspendSavePackedUnit blueUnits[UNIT_SAVE_AMOUNT_BLUE];
    /* 0AF4 */ struct SuspendSavePackedUnit redUnits[UNIT_SAVE_AMOUNT_RED];
    /* 151C */ struct SuspendSavePackedUnit greenUnits[UNIT_SAVE_AMOUNT_GREEN];
    /* 1724 */ u8 traps[0x200];
    /* 1924 */ u16 supplyItems[100];
    /* 19EC */ u8 pidStats[0x1E4C - 0x19EC];
    /* 1E4C */ u8 chapterStats[0x1F0C - 0x1E4C];
    /* 1F0C */ u8 menuOverride[0x10];
    /* 1F1C */ u8 permanentFlags[8];
    /* 1F24 */ u8 chapterFlags[8];
};

extern u32 gBonusContentClaimFlags;
extern u8 gSuspendSaveIdOffset;

u32 GetBonusContentClaimFlags(void);
void SetBonusContentClaimFlags(u32 flags);
void WriteBonusContentClaimFlags(struct GameSaveBlock * sram_dest);
void ReadBonusContentClaimFlags(struct GameSaveBlock const * sram_src);
void WriteLastGameSaveId(int num);
int ReadLastGameSaveId(void);
void InvalidateGameSave(int index);
void CopyGameSave(int index_src, int index_dest);
void WriteNewGameSave(int index, int isDifficult, int mode);
void WriteGameSave(int slot);
void ReadGameSave(int slot);
bool IsSaveValid(int);
void ReadGameSavePlaySt(s32, struct PlaySt *);
u32 LoadSavedBonusClaimFlags(int slot);
bool sub_080A09FC(struct PlaySt * play_st);
bool IsGameNotFirstChapter(struct PlaySt * play_st);
bool IsGameSaveNotFirstChapter(int slot);
void WriteGameSavePackedUnit(struct Unit *unit, void *sram_dest);
void LoadSavedUnit(const void *sram_src, struct Unit *unit);
void InvalidateSuspendSave(int);
void WriteSuspendSave(int saveBlockId);
void ReadSuspendSave(int slot);
u8 IsValidSuspendSave(int);
void ReadSuspendSavePlaySt(int slot, struct PlaySt * buf);
void EncodeSuspendSavePackedUnit(struct Unit * unit, void * buf);
void ReadSuspendSavePackedUnit(void const * sram_src, struct Unit * unit);
void WriteTraps(void * sram_dest);
void ReadTraps(void const * sram_src);
int GetLastSuspendSaveId(void);
int GetNextSuspendSaveId(void);
void WriteSwappedSuspendSaveId(void);
int SramChecksum32(void const * sram_src, int size);
bool VerifySaveBlockChecksum(struct SaveBlockInfo * block_info);
void PopulateSaveBlockChecksum(struct SaveBlockInfo * block_info);
u16 GetGameStateChecksum_Unused(void);
void sub_080A1AAC(void);
bool IsMultiArenaSaveValid(int index);

#define MULTIARENA_TEAMNAME_SIZE 10
#define MULTIARENA_UNITS_PER_TEAM 5
#define MULTIARENA_MAX_TEAMS 10
#define MULTIARENA_MAX_RANKINGS 10
#define MULTIARENA_PACKEDUNIT_SIZE 0x24

struct MultiArenaRankingEnt {
    /* 00 */ u32 ranking : 2;
    /*    */ u32 player_count : 2;
    /*    */ u32 mode : 1;
    /*    */ u32 points : 27;
    /* 04 */ char name[0xC];
};

struct MultiArenaSaveTeam {
    /* 00 */ char name[MULTIARENA_TEAMNAME_SIZE];
    /* 0A */ u8 unk_0A[0x14 - 0x0A];
    /* 14 */ u8 units[MULTIARENA_UNITS_PER_TEAM][MULTIARENA_PACKEDUNIT_SIZE];
};

struct MultiArenaSaveBlock {
    /* 000 */ struct MultiArenaSaveTeam teams[MULTIARENA_MAX_TEAMS];
    /* 7D0 */ u16 config;
    /* 7D4 */ struct MultiArenaRankingEnt rankings[MULTIARENA_MAX_RANKINGS];
};

extern struct MultiArenaRankingEnt const gInitialMultiArenaRankings[MULTIARENA_MAX_RANKINGS];
extern struct MultiArenaSaveTeam gMultiArenaSaveTeamBufA;
extern struct MultiArenaSaveTeam gMultiArenaSaveTeamBufB;

void WriteNewMultiArenaSave(void);
bool ReadMultiArenaSaveTeamRaw(int team, struct MultiArenaSaveTeam * dst);
bool ReadMultiArenaSaveTeamName(int team, char * dst);
void WriteMultiArenaSaveTeamName(int team, char * name);
void WipeMultiArenaSaveTeam(int team);
void CopyMultiArenaSaveTeam(int team_src, int team_dst);
void SwapMultiArenaSaveTeams(int team_a, int team_b);
void WriteMultiArenaSaveTeam(int team, struct Unit * units_src, char const * name_src);
bool ReadMultiArenaSaveTeam(int team, struct Unit * units_dst, char * name_dst);
void WriteMultiArenaSaveRankings(struct MultiArenaRankingEnt const * src);
void ReadMultiArenaSaveRankings(struct MultiArenaRankingEnt * dst);
void WriteMultiArenaSaveConfig(void const * config_src);
void ReadMultiArenaSaveConfig(void * config_dst);
bool IsMultiArenaSaveReady(void);
// ??? LoadAndVerfySuspendSave
// ??? ReadExtraMapSaveHead
// ??? GetExtraMapMapReadAddr
// ??? GetExtraMapMapSize
// ??? GetExtraMapInfoReadAddr
// ??? GetExtraMapInfoSize
// ??? ExtraMapChecksum
// ??? IsExtraMapAvailable
// ??? ReadExtraMapInfo
// ??? sub_80A2BE0
// ??? sub_80A2BE8
// ??? sub_80A2BF4
// ??? sub_80A2BF8
void sub_80A2BFC(void); // NullBmMapHidden_
// ??? sub_80A2C10
// ??? GetMinimapConnectKindAt
// ??? NormalizeSeaMinimapTerrain
// ??? GetMinimapSeaKindAt
// ??? NormalizeWaterMinimapTerrain
// ??? GetMinimapWaterKindAt
// ??? GetMinimapRiverKindAt
// ??? GetMinimapCliffKindAt
// ??? GetMinimapStairTileAt
// ??? GetMinimapDoorTileAt
// ??? GetMinimapBridgeKindAt
// ??? GetMinimapTileAt
// ??? GetMinimapTerrainCellAt
// ??? GetMinimapObjectCellAt
// ??? DrawMinimapInternal
// ??? Minimap_Init
// ??? Minimap_OnHBlank
// ??? InitMinimapWindowBuffers
// ??? Minimap_InitOpenAnim
// ??? Minimap_OpenAnim
// ??? Minimap_InitCloseAnim
// ??? Minimap_CloseAnim
// ??? ApplyMinimapGraphics
// ??? InitMinimapFlashPalette
// ??? Minimap_ApplyFlashPalette
// ??? Minimap_ApplyViewportFlashColor
// ??? Minimap_PutViewport
// ??? Minimap_AdjustDisplay
// ??? Minimap_HandleMoveInput
// ??? Minimap_InitProcVars
// ??? Minimap_AdjustCursorOnClose
// ??? Minimap_Main
// ??? StartMinimapPlayerPhase
// ??? DrawMinimap
