#include "gbafe.h"

// declared without prototypes: owned by other save modules
void ClearPidChStatsSaveData();
void ReadPidStats();
void WritePidStats();
void ReadChapterStats();
void WriteChapterStats();
void MetaSave_SetMetCharacter();
void WriteSupplyItems();
void ReadSupplyItems();
void WritePermanentFlags();
void ReadPermanentFlags();
void WriteChapterFlags();
void ReadChapterFlags();

u32 GetBonusContentClaimFlags(void)
{
    return gBonusContentClaimFlags;
}

void SetBonusContentClaimFlags(u32 flags)
{
    gBonusContentClaimFlags = flags;
}

void WriteBonusContentClaimFlags(struct GameSaveBlock * sram_dest)
{
    WriteAndVerifySramFast(&gBonusContentClaimFlags, &sram_dest->bonusClaimFlags, sizeof(gBonusContentClaimFlags));
}

void ReadBonusContentClaimFlags(struct GameSaveBlock const * sram_src)
{
    ReadSramFast(&sram_src->bonusClaimFlags, &gBonusContentClaimFlags, sizeof(gBonusContentClaimFlags));
}

void WriteLastGameSaveId(int num)
{
    struct GlobalSaveInfo info;

    ReadGlobalSaveInfo(&info);
    info.last_game_save_id = num;
    WriteGlobalSaveInfoNoChecksum(&info);
}

int ReadLastGameSaveId(void)
{
    int ret;
    struct GlobalSaveInfo info;

    if (!ReadGlobalSaveInfo(&info))
        return 0;

    ret = info.last_game_save_id;

    if (ret > SAVE_GAME2)
        return SAVE_GAME0;
    else if (ret < 0)
        return SAVE_GAME0;
    else
        return ret;
}

void InvalidateGameSave(int index)
{
    struct SaveBlockInfo chunk;
    struct PlaySt play_st;

    if (IsValidSuspendSave(SAVE_SUSPEND))
    {
        ReadSuspendSavePlaySt(SAVE_SUSPEND, &play_st);

        if (play_st.gameSaveSlot == index)
            InvalidateSuspendSave(SAVE_SUSPEND);
    }

    chunk.kind = SAVE_KIND_INVALID;
    WriteSaveBlockInfo(&chunk, index);
}

void CopyGameSave(int index_src, int index_dest)
{
    struct SaveBlockInfo chunk;
    void * src = GetSaveReadAddr(index_src);
    void * dest = GetSaveWriteAddr(index_dest);

    ReadSramFast(src, gBuf, sizeof(struct GameSaveBlock));
    WriteAndVerifySramFast(gBuf, dest, sizeof(struct GameSaveBlock));

    chunk.magic32 = SAVE_MAGIC32_SAV;
    chunk.kind = SAVE_KIND_GAME;
    WriteSaveBlockInfo(&chunk, index_dest);
}

void WriteNewGameSave(int index, int isDifficult, int mode)
{
    int i;
    struct SaveBlockInfo chunk;
    struct GameSavePackedUnit unitp;

    struct GameSaveBlock * dest = GetSaveWriteAddr(index);

    if (mode == 0)
        mode = gPlaySt.chapterModeIndex;

    SetGameTime(0);
    InitPlayConfig(isDifficult);
    InitUnits();
    ClearSupplyItems();
    ResetPermanentFlags();
    InvalidateSuspendSave(SAVE_SUSPEND);

    gPlaySt.tact_gender = 0;
    gPlaySt.unk2C_04 = 0;
    CpuFill16(0, &gPlaySt.total_gold, 0x10);
    gPlaySt.unk2C_0D = 0;
    gPlaySt.chapterModeIndex = mode;
    gPlaySt.tact_enabled = 1;
    gPlaySt.playerName[0] = '\0';

    if (mode == CHAPTER_MODE_LYN)
        gPlaySt.chapterIndex = 0;

    if (mode == CHAPTER_MODE_ELIWOOD)
        gPlaySt.chapterIndex = 0xC;

    if (mode == CHAPTER_MODE_HECTOR)
        gPlaySt.chapterIndex = 0xD;

    gPlaySt.playthroughIdentifier = GetNewPlaythroughId();
    gPlaySt.gameSaveSlot = index;
    gPlaySt.unk2C_17 = GetGlobalCompletionCount();

    WriteAndVerifySramFast(&gPlaySt, &dest->playSt, sizeof(gPlaySt));
    SetBonusContentClaimFlags(0);
    WriteBonusContentClaimFlags(dest);

    CpuFill16(0, &unitp, sizeof(unitp));

    for (i = 0; i < UNIT_SAVE_AMOUNT_BLUE; i++)
        WriteAndVerifySramFast(&unitp, &dest->units[i], sizeof(unitp));

    WriteSupplyItems(dest->supplyItems);
    ClearPidChStatsSaveData(dest);
    WritePermanentFlags(dest->permanentFlags);

    chunk.magic32 = SAVE_MAGIC32_SAV;
    chunk.kind = SAVE_KIND_GAME;
    WriteSaveBlockInfo(&chunk, index);
    WriteLastGameSaveId(index);
}

ASM_FUNC("asm/nonmatching/code_080A0810.s");

void ReadGameSave(int slot)
{
    int i;
    struct GameSaveBlock * src = GetSaveReadAddr(slot);

    ClearMenuOverrides();

    if (!(gBmSt.flags & BM_FLAG_LINKARENA))
        InvalidateSuspendSave(SAVE_SUSPEND);

    ReadSramFast(src, &gPlaySt, sizeof(gPlaySt));
    SetGameTime(gPlaySt.time_saved);
    gPlaySt.gameSaveSlot = slot;

    InitUnits();

    for (i = 0; i < UNIT_SAVE_AMOUNT_BLUE; i++)
        LoadSavedUnit(&src->units[i], &gUnitArrayBlue[i]);

    ReadSupplyItems(src->supplyItems);
    ReadPermanentFlags(src->permanentFlags);
    ReadPidStats(src->pidStats);
    ReadChapterStats(src->chapterStats);
    ReadBonusContentClaimFlags(src);
    WriteLastGameSaveId(slot);
}

bool IsSaveValid(int index)
{
    return ReadSaveBlockInfo(NULL, index);
}

void ReadGameSavePlaySt(int slot, struct PlaySt * buf)
{
    struct GameSaveBlock const * src = GetSaveReadAddr(slot);
    ReadSramFast(&src->playSt, buf, sizeof(struct PlaySt));
}

u32 LoadSavedBonusClaimFlags(int slot)
{
    u32 buf;
    struct GameSaveBlock const * src = GetSaveReadAddr(slot);
    ReadSramFast(&src->bonusClaimFlags, &buf, sizeof(buf));
    return buf;
}

bool sub_080A09FC(struct PlaySt * play_st)
{
    if (play_st->chapterIndex > 0xD)
        return TRUE;

    return FALSE;
}

bool IsGameNotFirstChapter(struct PlaySt * play_st)
{
    if (play_st->chapterIndex <= 0xB)
    {
        if (play_st->chapterIndex > 0)
            return TRUE;
    }
    else if (play_st->chapterIndex > 0xD)
        return TRUE;

    return FALSE;
}

bool IsGameSaveNotFirstChapter(int slot)
{
    struct PlaySt play_st;

    if (!IsSaveValid(slot))
        return FALSE;

    ReadGameSavePlaySt(slot, &play_st);
    return IsGameNotFirstChapter(&play_st);
}

ASM_FUNC("asm/nonmatching/code_080A0A60.s");

ASM_FUNC("asm/nonmatching/code_080A0E9C.s");

void InvalidateSuspendSave(int slot)
{
    struct SaveBlockInfo chunk;
    chunk.kind = SAVE_KIND_INVALID;

    WriteSaveBlockInfo(&chunk, slot);

    if (slot == SAVE_SUSPEND)
        WriteSaveBlockInfo(&chunk, SAVE_SUSPEND_ALT);
}

void WriteSuspendSave(int slot)
{
    struct SuspendSaveBlock * dest;
    struct SaveBlockInfo chunk;
    u8 list[0x10];
    int i;
    struct SuspendSavePackedUnit * buf;

    if (gPlaySt.chapterStateBits & PLAY_FLAG_TUTORIAL)
        return;

    if (!IsSramWorking())
        return;

    slot += GetNextSuspendSaveId();
    dest = GetSaveWriteAddr(slot);
    gPlaySt.time_saved = GetGameTime();
    WriteAndVerifySramFast(&gPlaySt, &dest->playSt, sizeof(gPlaySt));
    sub_0802F1F8();
    WriteAndVerifySramFast(&gActionSt, &dest->action, sizeof(struct Action));

    buf = (struct SuspendSavePackedUnit *) gBuf;

    for (i = 0; i < UNIT_SAVE_AMOUNT_BLUE; i++)
        EncodeSuspendSavePackedUnit(&gUnitArrayBlue[i], buf++);

    for (i = 0; i < UNIT_SAVE_AMOUNT_RED; i++)
        EncodeSuspendSavePackedUnit(&gUnitArrayRed[i], buf++);

    for (i = 0; i < UNIT_SAVE_AMOUNT_GREEN; i++)
        EncodeSuspendSavePackedUnit(&gUnitArrayGreen[i], buf++);

    WriteSramFast(gBuf, dest->blueUnits,
        (UNIT_SAVE_AMOUNT_BLUE + UNIT_SAVE_AMOUNT_RED + UNIT_SAVE_AMOUNT_GREEN) * sizeof(struct SuspendSavePackedUnit));

    WritePermanentFlags(dest->permanentFlags);
    WriteChapterFlags(dest->chapterFlags);
    WriteSupplyItems(dest->supplyItems);
    WritePidStats(dest->pidStats);
    WriteChapterStats(dest->chapterStats);
    WriteTraps(dest->traps);

    GetForceDisabledMenuItems(list);
    WriteAndVerifySramFast(list, dest->menuOverride, sizeof(list));

    chunk.magic32 = SAVE_MAGIC32_SUS;
    chunk.kind = SAVE_KIND_SUSPEND;
    WriteSaveBlockInfo(&chunk, slot);

    gBmSt.just_resumed = FALSE;
    WriteSwappedSuspendSaveId();
}

void ReadSuspendSave(int slot)
{
    int i;
    u8 list[0x10];
    struct SuspendSaveBlock * src = GetSaveReadAddr(slot + gSuspendSaveIdOffset);

    ReadSramFast(&src->playSt, &gPlaySt, sizeof(gPlaySt));
    SetGameTime(gPlaySt.time_saved);

    ReadSramFast(&src->action, &gActionSt, sizeof(struct Action));
    sub_0802F208();
    InitUnits();

    for (i = 0; i < UNIT_SAVE_AMOUNT_BLUE; i++)
        ReadSuspendSavePackedUnit(&src->blueUnits[i], &gUnitArrayBlue[i]);

    for (i = 0; i < UNIT_SAVE_AMOUNT_RED; i++)
        ReadSuspendSavePackedUnit(&src->redUnits[i], &gUnitArrayRed[i]);

    for (i = 0; i < UNIT_SAVE_AMOUNT_GREEN; i++)
        ReadSuspendSavePackedUnit(&src->greenUnits[i], &gUnitArrayGreen[i]);

    ReadPidStats(src->pidStats);
    ReadChapterStats(src->chapterStats);
    ReadSupplyItems(src->supplyItems);
    ReadPermanentFlags(src->permanentFlags);
    ReadChapterFlags(src->chapterFlags);
    ReadTraps(src->traps);

    ReadSramFast(src->menuOverride, list, sizeof(list));
    SetForceDisabledMenuItems(list);

    SetBonusContentClaimFlags(LoadSavedBonusClaimFlags(gPlaySt.gameSaveSlot));
}

u8 IsValidSuspendSave(int slot)
{
    if (!IsSramWorking())
        return FALSE;

    if (slot != SAVE_SUSPEND)
        return FALSE;

    gSuspendSaveIdOffset = GetLastSuspendSaveId();
    if (ReadSaveBlockInfo(NULL, gSuspendSaveIdOffset + SAVE_SUSPEND))
        return TRUE;

    gSuspendSaveIdOffset = GetNextSuspendSaveId();
    if (ReadSaveBlockInfo(NULL, gSuspendSaveIdOffset + SAVE_SUSPEND))
        return TRUE;

    gSuspendSaveIdOffset = 0x7F;
    return FALSE;
}

void ReadSuspendSavePlaySt(int slot, struct PlaySt * buf)
{
    ReadGameSavePlaySt(slot + gSuspendSaveIdOffset, buf);
}

ASM_FUNC("asm/nonmatching/code_080A13EC.s");

ASM_FUNC("asm/nonmatching/code_080A16C0.s");

void WriteTraps(void * sram_dest)
{
    WriteAndVerifySramFast(GetTrap(0), sram_dest, 0x40 * sizeof(struct Trap));
}

void ReadTraps(void const * sram_src)
{
    ReadSramFast(sram_src, GetTrap(0), 0x40 * sizeof(struct Trap));
}

int GetLastSuspendSaveId(void)
{
    struct GlobalSaveInfo info;
    ReadGlobalSaveInfo(&info);

    if (info.last_suspend_slot == 1)
        return 1;
    else
        return 0;
}

int GetNextSuspendSaveId(void)
{
    return 1 - GetLastSuspendSaveId();
}

void WriteSwappedSuspendSaveId(void)
{
    struct GlobalSaveInfo info;
    ReadGlobalSaveInfo(&info);
    info.last_suspend_slot = info.last_suspend_slot == 0;
    WriteGlobalSaveInfoNoChecksum(&info);
}

int SramChecksum32(void const * sram_src, int size)
{
    ReadSramFast(sram_src, gBuf, size);
    return Checksum32_thm(gBuf, size);
}

bool VerifySaveBlockChecksum(struct SaveBlockInfo * block_info)
{
    int size = block_info->size;
    void * sram_src = SramOffsetToAddr(block_info->offset);
    int checksum = SramChecksum32(sram_src, size);

    if (block_info->checksum32 != checksum)
        return FALSE;
    else
        return TRUE;
}

void PopulateSaveBlockChecksum(struct SaveBlockInfo * block_info)
{
    int size = block_info->size;
    void * sram_src = SramOffsetToAddr(block_info->offset);
    block_info->checksum32 = SramChecksum32(sram_src, size);
}
