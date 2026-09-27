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

#define GLOBALSIZEINFO_SIZE_FOR_CHECKSUM 0x50

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
// ??? sub_809F344
// ??? WritePermanentFlags
// ??? ReadChapterFlags
// ??? ReadPermanentFlags
// ??? WriteSupplyItems
// ??? ReadSupplyItems
s32 sub_0809E9FC(void);
// ??? sub_0809EA58
// ??? sub_809F48C
// ??? IsExtraLinkArenaEnabled
// ??? sub_0809EAB8
// ??? IsExtraSupportViewerEnabled
// ??? GetRankDataValidBitMap
// ??? sub_809F588
// ??? sub_809F5B0
// ??? GetUnitsAverageSupportValue
// ??? GetTotalAverageSupportValue
// ??? GetTotalGlobalSupportValue
// ??? GetTotalSupportCollection
// ??? GetGlobalBestSupport
// ??? GetGlobalSupportListFromSave
// ??? UpdateBestGlobalSupportValue
// ??? MetaSave_SetMetCharacter
// ??? GGM_IsCharacterKnown
// ??? GGM_IsAnyCharacterKnown
// ??? nullsub_82
// ??? nullsub_83
bool IsGamePlayedThrough(void);
int CheckLinkedToFE6(void);
// ??? ReadFe6LinkSaveInfo
void WriteFe6LinkSaveInfo(void * buf);
// ??? sub_0809F084
// ??? sub_0809F0A0
// ??? sub_0809F0B8
// ??? sub_0809F0D0
// ??? sub_0809F0D4
// ??? LoadAndVerfyRankData
// ??? LoadBonusContentData
void SaveBonusContentData(void * buf);
// ??? SaveRankings
// ??? EraseSaveRankData
// ??? GetNextChapterMode
// ??? sub_0809F224
// ??? SaveNewRankData
// ??? JudgeGameRankSaveData
// ??? GenerateGameRankSaveData
void SaveEndgameRankings(void);
// ??? sub_0809F668
bool LoadAndVerifySoundRoomData(void * buf);
// ??? WriteSoundRoomSaveData
// ??? IsSoundRoomSongUnlocked
// ??? UnlockSoundRoomSong
void UnlockSoundRoomSong(void * buf, int song);
// ??? EraseLinkArenaStruct2
bool LoadAndVerfyLinkArenaStruct2(void * buf);
// ??? WriteLinkArenaStruct2
// ??? ModifySaveLinkArenaStruct2A
// ??? ModifySaveLinkArenaStruct2B
// ??? LoadAndVerifySramSaveData

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
// ??? sub_0809FB70
int GetNextChapterStatsEntry(void);
void RegisterChapterStats(struct PlaySt *);
// ??? GetGameTotalTime_unused
// ??? GetGameTotalTurnCount
// ??? IsChapterPartOfCurrentMode
// ??? sub_0809FCB0
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
// ??? PidStatsGetFavval
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
// ??? IsGameSaveNotFirstChapter
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
// ??? sub_080A19D8
// ??? sub_080A1AAC
// ??? sub_80A2448
// ??? sub_080A1AC8
// ??? sub_80A25A4
// ??? sub_80A25D8
// ??? sub_80A261C
// ??? sub_80A2658
// ??? sub_80A26AC
// ??? sub_80A2724
// ??? WriteMultiArenaSaveTeam
// ??? sub_80A2820
// ??? sub_80A2884
// ??? sub_80A28C0
// ??? sub_080A1F54
// ??? sub_080A1F90
// ??? IsMultiArenaSaveReady
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
