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

// ??? ClearPidChStatsSaveData
void ClearPidStats_ret(void);
void ClearPidStats(void);
// ??? ReadPidStats
// ??? ReadChapterStats
// ??? WritePidStats
// ??? WriteChapterStats
// ??? GetChapterStats
// ??? IsChapterStatsValid
// ??? GetNextChapterStatsSlot
int sub_0809FB70(void);
int GetNextChapterStatsEntry(void);
void RegisterChapterStats(struct PlaySt *);
// ??? GetGameTotalTime_unused
// ??? GetGameTotalTurnCount
// ??? IsChapterPartOfCurrentMode
int sub_0809FCB0(void);
// ??? GetTotalTurnCountUpUntilNow
// ??? PidStatsAddBattleAmt
// ??? sub_0809FD9C
// ??? PidStatsRecordLoseData
// ??? PidStatsRecordDefeatInfo
// ??? PidStatsAddActAmt
void PidStatsAddStatView(u8 pid);
// ??? PidStatsAddDeployAmt
// ??? PidStatsAddMove
// ??? PidStatsAddExpGained
// ??? PidStatsSubFavval08
// ??? PidStatsSubFavval100
// ??? PidStatsGetTotalBattleAmt
// ??? PidStatsGetTotalWinAmt
// ??? sub_080A0178
// ??? PidStatsGetTotalLevel
// ??? sub_080A01BC
// ??? PidStatsGetExpGain
int PidStatsGetFavval(u8 pid);
// ??? PidStatsAddFavval
void PidStatsRecordBattleRes(void);
bool IsPlaythroughIdUnique(int index);
int GetNewPlaythroughId(void);
int GetGlobalCompletionCntByInfo(struct GlobalSaveInfo * info);
int GetGlobalCompletionCount(void);
bool RegisterCompletedPlaythrough(struct GlobalSaveInfo * info, int index);
void SavePlayThroughData(void);
// ??? sub_80A0DFC
// ??? WriteCompletedPlaythroughSaveData
struct PidStats * GetPidStats(u8 pid);
// ??? GetBonusContentClaimFlags
// ??? SetBonusContentClaimFlags
// ??? WriteBonusContentClaimFlags
// ??? ReadBonusContentClaimFlags
void WriteLastGameSaveId(int num);
int ReadLastGameSaveId(void);
// ??? sub_080A061C
void CopyGameSave(int index_src, int index_dest);
void WriteNewGameSave(int index, int isDifficult, int mode, int isTutorial);
void WriteGameSave(int slot);
void ReadGameSave(int slot);
bool IsSaveValid(int);
void ReadGameSavePlaySt(s32, struct PlaySt *);
// ??? LoadSavedBonusClaimFlags
// ??? sub_080A09FC
// ??? sub_080A0A10
bool IsGameSaveNotFirstChapter(int slot);
void WriteGameSavePackedUnit(struct Unit *unit, void *sram_dest);
void LoadSavedUnit(const void *sram_src, struct Unit *unit);
void InvalidateSuspendSave(int);
void WriteSuspendSave(int saveBlockId);
void ReadSuspendSave(int slot);
u8 IsValidSuspendSave(int);
// ??? ReadSuspendSavePlaySt
// ??? EncodeSuspendSavePackedUnit
// ??? ReadSuspendSavePackedUnit
// ??? WriteTraps
// ??? ReadTraps
// ??? GetLastSuspendSaveId
// ??? GetNextSuspendSaveId
// ??? WriteSwappedSuspendSaveId
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
// ??? sub_080A28CC
// ??? sub_080A290C
// ??? sub_080A2948
// ??? sub_080A2960
// ??? sub_080A2A84
// ??? sub_080A2C30
// ??? sub_080A2CBC
// ??? ApplyMinimapGraphics
// ??? InitMinimapFlashPalette
// ??? sub_080A2F38
// ??? sub_080A2F74
// ??? Minimap_PutViewport
// ??? sub_080A3004
// ??? sub_080A3080
// ??? Minimap_InitProcVars
// ??? Minimap_AdjustCursorOnClose
// ??? sub_080A31A4
// ??? sub_080A3284
// ??? DrawMinimap
