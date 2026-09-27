#include "gbafe.h"

char * strcpy(char * dst, const char * src);

CONST_DATA int sSupportUnkLut[][2] = {
    { 0x15, 0x0F },
    { 0, 0 },
};

void WriteChapterFlags(void * sram_dest)
{
    WriteAndVerifySramFast(GetChapterFlagBits(), sram_dest, GetChapterFlagBitsSize());
}

void WritePermanentFlags(void * sram_dest)
{
    WriteAndVerifySramFast(GetPermanentFlagBits(), sram_dest, GetPermanentFlagBitsSize());
}

void ReadChapterFlags(void const * sram_src)
{
    ReadSramFast(sram_src, GetChapterFlagBits(), GetChapterFlagBitsSize());
}

void ReadPermanentFlags(void const * sram_src)
{
    ReadSramFast(sram_src, GetPermanentFlagBits(), GetPermanentFlagBitsSize());
}

void WriteSupplyItems(void * sram_dest)
{
    WriteAndVerifySramFast(GetConvoyItemArray(), sram_dest, 0xC8);
}

void ReadSupplyItems(void const * sram_src)
{
    ReadSramFast(sram_src, GetConvoyItemArray(), 0xC8);
}

s32 sub_0809E9FC(void)
{
    struct GlobalSaveInfo info;
    int cnt;
    s32 ret = 0;

    if (ReadGlobalSaveInfo(&info))
    {
        cnt = GetGlobalCompletionCntByInfo(&info);
        ret = CheckLinkedToFE6() ? 2 : 0;

        if (info.completed)
        {
            if (info.Eirk_mode_easy || info.Eirk_mode_norm)
                ret = 0xF;

            if (info.Eirk_mode_hard)
                ret |= 0x10;

            if (cnt > 4)
                ret |= 0x10;
        }
    }

    return ret;
}

int sub_0809EA58(void)
{
    struct GlobalSaveInfo info;
    int ret;

    if (!ReadGlobalSaveInfo(&info))
        ret = FALSE;
    else
        ret = info.Eirk_mode_hard;

    return ret;
}

bool sub_0809EA7C(void)
{
    return TRUE;
}

bool IsExtraLinkArenaEnabled(void)
{
    int i;

    if (!IsSramWorking())
        return FALSE;

    for (i = 0; i < 3; i++)
        if (IsGameSaveNotFirstChapter(i))
            return TRUE;

    return IsMultiArenaSaveReady();
}

bool IsExtraSoundRoomEnabled(void)
{
    struct GlobalSaveInfo info;

    if (ReadGlobalSaveInfo(&info) && (info.completed || info.flag0E_1))
        return TRUE;

    return FALSE;
}

bool IsExtraSupportViewerEnabled(void)
{
    int tmp0 = GGM_IsAnyCharacterKnown(NULL);

    // HACK: the original seems to have seen IsGamePlayedThrough as returning int here
    int tmp1 = ((int (*)(void)) IsGamePlayedThrough)();

    return tmp1 & tmp0;
}

u32 GetRankDataValidBitMap(void)
{
    struct GameRankSaveDataPacks buf;
    u32 attr = 0;

    if (!IsGamePlayedThrough())
        return 0;

    if (LoadAndVerfyRankData(&buf))
    {
        if (buf.pack[0].valid)
            attr = 1 << 0;

        if (buf.pack[1].valid)
            attr |= 1 << 1;

        if (buf.pack[2].valid)
            attr |= 1 << 2;

        if (buf.pack[3].valid)
            attr |= 1 << 3;

        if (buf.pack[4].valid)
            attr |= 1 << 4;

        if (buf.pack[5].valid)
            attr |= 1 << 5;
    }

    return attr;
}

bool IsExtraBonusClaimEnabled(void)
{
    struct BonusClaimEnt * ent;
    int i, ret;

    if (LoadBonusContentData(gBuf))
    {
        ret = FALSE;
        ent = (void *) gBuf;

        for (i = 0; i < 0x20; i++)
        {
            if (!ent[i].unseen)
                continue;

            if (ent[i].kind == 0)
                ret = TRUE;

            if (ent[i].kind == 2)
                ret = TRUE;
        }

        if (ret == FALSE)
            return FALSE;
        else
            return TRUE;
    }

    return FALSE;
}

int GetUnitsAverageSupportValue(const int unitA, const int unitB)
{
    int i;

    for (i = 0; sSupportUnkLut[i][0] != 0; i++)
    {
        if (sSupportUnkLut[i][0] == unitA)
            if (sSupportUnkLut[i][1] != unitB)
                return 2;

        if (sSupportUnkLut[i][0] == unitB)
            if (sSupportUnkLut[i][1] != unitA)
                return 2;

        if (sSupportUnkLut[i][1] == unitA)
            if (sSupportUnkLut[i][0] != unitB)
                return 2;

        if (sSupportUnkLut[i][1] == unitB)
            if (sSupportUnkLut[i][0] != unitA)
                return 2;
    }

    return 3;
}

int GetTotalAverageSupportValue(void)
{
    int ret = 0;
    struct SupportTalkEnt const * ent = gSupportTalkList;

    for (; ent->pidA != 0; ent++)
        ret += GetUnitsAverageSupportValue(ent->pidA, ent->pidB);

    return ret;
}

int GetTotalGlobalSupportValue(struct GlobalSaveInfo * info)
{
    int i, j, tmp1, tmp2, ret = 0;
    struct GlobalSaveInfo local_info;

    if (info == NULL)
    {
        info = &local_info;
        ReadGlobalSaveInfo(info);
    }

    for (i = 0; i < 0x20; i++)
    {
        for (j = 0; j < 4; j++)
        {
            tmp1 = 1 + i;
            tmp2 = info->SuppordRecord[tmp1 - 1];
            ret += (tmp2 >> (j << 1)) & 3;
        }
    }

    return ret;
}

int GetTotalSupportCollection(void)
{
    int tmp0 = GetTotalGlobalSupportValue(NULL);
    int tmp1 = GetTotalAverageSupportValue();

    if ((tmp0 > 0) && (((tmp0 * 100) / tmp1) == 0))
        tmp0 = 1;
    else
        tmp0 = (tmp0 * 100) / tmp1;

    if (tmp0 > 100)
        tmp0 = 100;

    return tmp0;
}

int GetGlobalBestSupport(int unitA, int unitB, struct GlobalSaveInfo * info)
{
    struct GlobalSaveInfo local_info;
    int i = 0;
    int ret = 0;
    int tmp0, tmp1;
    struct SupportTalkEnt const * cur = gSupportTalkList;

    if (info == NULL)
    {
        info = &local_info;
        ReadGlobalSaveInfo(info);
    }

    for (; cur->pidA != 0; i++, cur++)
    {
        if (cur->pidA == unitA && cur->pidB == unitB)
            break;

        if (cur->pidA == unitB && cur->pidB == unitA)
            break;
    }

    tmp0 = i >> 2;
    tmp1 = (3 & i) << 1;
    ret = 3 & info->SuppordRecord[tmp0] >> tmp1;
    return ret;
}

void GetGlobalSupportListFromSave(int pid, u8 * data, struct GlobalSaveInfo * info)
{
    struct GlobalSaveInfo local_info;
    struct SupportTalkEnt const * ptr;
    int i;
    int j;

    if (gCharacterData[pid - 1].pSupportData == NULL)
    {
        for (i = 0; i < UNIT_SUPPORT_MAX_COUNT; data++, i++)
            *data = 0;

        return;
    }

    j = 0;
    ptr = gSupportTalkList;

    if (info == NULL)
    {
        info = &local_info;
        ReadGlobalSaveInfo(info);
    }

    for (;; j++, ptr++)
    {
        int tmp1, tmp2;

        if (ptr->pidA == 0)
            break;

        if ((ptr->pidA != pid) && (ptr->pidB != pid))
            continue;

        tmp1 = j >> 2;
        tmp2 = (j & 3) << 1;

        for (i = 0; i < gCharacterData[pid - 1].pSupportData->count; i++)
        {
            if ((ptr->pidA != gCharacterData[pid - 1].pSupportData->pids[i]) &&
                (ptr->pidB != gCharacterData[pid - 1].pSupportData->pids[i]))
            {
                continue;
            }

            data[i] = (info->SuppordRecord[tmp1] >> (tmp2)) & 3;

            break;
        }
    }

    for (i = gCharacterData[pid - 1].pSupportData->count; i < UNIT_SUPPORT_MAX_COUNT; i++)
        data[i] = 0;
}

bool UpdateBestGlobalSupportValue(int unitA, int unitB, int supportRank)
{
    int convo;
    int var0;
    int var1;
    struct GlobalSaveInfo info;
    struct SupportTalkEnt const * ptr;

    supportRank = supportRank & 3;

    if (!ReadGlobalSaveInfo(&info))
        return FALSE;

    convo = 0;

    for (ptr = gSupportTalkList;; ptr++)
    {
        if (ptr->pidA == 0)
            break;

        if ((ptr->pidA == unitA) && (ptr->pidB == unitB))
            break;

        if ((ptr->pidA == unitB) && (ptr->pidB == unitA))
            break;

        convo++;
    }

    var0 = convo >> 2;
    var1 = (convo & 3) << 1;

    if (((info.SuppordRecord[var0] >> var1) & 3) >= (supportRank))
        return FALSE;

    info.SuppordRecord[var0] &= ~(3 << var1);
    info.SuppordRecord[var0] += (supportRank << var1);

    WriteGlobalSaveInfo(&info);

    return TRUE;
}

void MetaSave_SetMetCharacter(int pid, struct GlobalSaveInfo * info)
{
    int loaded = 0;
    struct GlobalSaveInfo local_info;

    if (pid > 0x100)
        return;

    if (info == NULL)
    {
        info = &local_info;
        ReadGlobalSaveInfo(info);
        loaded = 1;
    }

    info->charKnownFlags[pid >> 3] |= 1 << (pid & 7);

    if (loaded)
        WriteGlobalSaveInfo(info);
}

bool GGM_IsCharacterKnown(int pid, struct GlobalSaveInfo * info)
{
    struct GlobalSaveInfo local_info;

    if (pid > 0x100)
        return FALSE;

    if (info == NULL)
    {
        info = &local_info;
        ReadGlobalSaveInfo(&local_info);
    }

    if (1 & info->charKnownFlags[pid >> 3] >> (pid & 7))
        return TRUE;
    else
        return FALSE;
}

int GGM_IsAnyCharacterKnown(struct GlobalSaveInfo * info)
{
    int i;
    struct GlobalSaveInfo local_info;

    if (info == NULL)
    {
        info = &local_info;
        ReadGlobalSaveInfo(&local_info);
    }

    for (i = 0; i < 0x20; i++)
    {
        if (info->charKnownFlags[i] != 0)
            return 1;
    }

    return 0;
}

void sub_0809EF8C(void)
{
}

void sub_0809EF90(void)
{
}

bool IsGamePlayedThrough(void)
{
    struct GlobalSaveInfo info;

    if (!ReadGlobalSaveInfo(&info))
        return FALSE;

    if (info.completed == 0)
        return FALSE;
    else
        return TRUE;
}

int CheckLinkedToFE6(void)
{
    struct Fe6LinkSaveInfo link;
    struct GlobalSaveInfo info;
    int cnt;

    if (ReadGlobalSaveInfo(&info))
    {
        cnt = GetGlobalCompletionCntByInfo(&info);

        if (cnt > 9)
            return 2;

        if (cnt > 7)
            return 1;
    }

    if (!ReadFe6LinkSaveInfo(&link))
        cnt = 0;
    else
        cnt = link.value;

    return cnt;
}

bool ReadFe6LinkSaveInfo(void * buf)
{
    struct Fe6LinkSaveInfo local;
    struct Fe6LinkSaveInfo * link = buf;

    if (!IsSramWorking())
        return FALSE;

    if (link == NULL)
        link = &local;

    ReadSramFast((void *) gSramMain + SRAM_OFFSET_FE6LINK, link, sizeof(struct Fe6LinkSaveInfo));

    if (link->checksum != Checksum16(link, 0x22))
        return FALSE;
    else
        return TRUE;
}

void WriteFe6LinkSaveInfo(void * buf)
{
    struct Fe6LinkSaveInfo * link = buf;

    link->checksum = Checksum16(link, 0x22);
    WriteAndVerifySramFast(link, (void *) gSramMain + SRAM_OFFSET_FE6LINK, sizeof(struct Fe6LinkSaveInfo));
}

void ClearFe6LinkSaveInfo(struct Fe6LinkSaveInfo * link)
{
    CpuFastFill(0, link, sizeof(struct Fe6LinkSaveInfo));
}

bool Fe6LinkSaveInfo_CheckFlag(struct Fe6LinkSaveInfo * link, int flag)
{
    return link->flags[flag >> 5] & (1 << (flag & 0x1F));
}

void Fe6LinkSaveInfo_SetFlag(struct Fe6LinkSaveInfo * link, int flag)
{
    link->flags[flag >> 5] |= 1 << (flag & 0x1F);
}

void Fe6LinkSaveInfo_SetValue(struct Fe6LinkSaveInfo * link, u16 value)
{
    link->value = value;
}

u16 Fe6LinkSaveInfo_GetValue(struct Fe6LinkSaveInfo * link)
{
    return link->value;
}

bool LoadAndVerfyRankData(void * buf)
{
    struct GameRankSaveDataPacks * _buf = buf;

    if (!IsSramWorking())
        return FALSE;

    if (_buf == NULL)
        _buf = (void *) gBuf;

    ReadSramFast((void *) gSramMain + SRAM_OFFSET_RANKDATA, _buf, sizeof(struct GameRankSaveDataPacks));

    if (_buf->checksum != Checksum16(_buf, 0x90))
        return FALSE;
    else
        return TRUE;
}

bool LoadBonusContentData(void * buf)
{
    struct BonusClaimEnt * _buf = buf;

    if (!IsSramWorking())
        return FALSE;

    if (_buf == NULL)
        _buf = (void *) gBuf;

    ReadSramFast((void *) gSramMain + SRAM_OFFSET_BONUSCLAIM, _buf, 0x284);

    if (*(u16 *)((u8 *) _buf + 0x280) != Checksum16(_buf, 0x280))
        return FALSE;
    else
        return TRUE;
}

void SaveBonusContentData(void * buf)
{
    *(u16 *)((u8 *) buf + 0x280) = Checksum16(buf, 0x280);
    WriteAndVerifySramFast(buf, (void *) gSramMain + SRAM_OFFSET_BONUSCLAIM, 0x284);
}

void SaveRankings(void * buf)
{
    struct GameRankSaveDataPacks * _buf = buf;

    _buf->checksum = Checksum16(buf, 0x90);
    WriteAndVerifySramFast(buf, (void *) gSramMain + SRAM_OFFSET_RANKDATA, sizeof(struct GameRankSaveDataPacks));
}

void EraseSaveRankData(void)
{
    u16 _buf[sizeof(struct GameRankSaveDataPacks) / 2];

    CpuFill16(0, _buf, sizeof(struct GameRankSaveDataPacks));
    SaveRankings(_buf);
}

int GetNextChapterMode(void)
{
    return gPlaySt.chapterModeIndex - 1;
}

int LoadRankData(void * buf, int chapter_mode, int difficulty)
{
    struct GameRankSaveDataPacks _buf;
    struct GameRankSaveData * src;
    struct GameRankSaveData * dest = buf;

    CpuFill16(0, buf, 0x18);
    CpuFill16(0, &_buf, sizeof(_buf));

    if (LoadAndVerfyRankData(&_buf) != 0)
    {
        src = &_buf.pack[(chapter_mode + difficulty * 3)];
        *dest = *src;
        return 1;
    }

    return 0;
}

void SaveNewRankData(void * buf, int chapter_mode, int difficulty)
{
    struct GameRankSaveDataPacks _buf;
    struct GameRankSaveData * src = buf;

    if (LoadAndVerfyRankData(&_buf) != 0)
    {
        _buf.pack[chapter_mode + difficulty * 3] = *src;
        SaveRankings(&_buf);
    }
}

u8 JudgeGameRankSaveData(struct GameRankSaveData * old, struct GameRankSaveData * new)
{
    int newtime, oldtime;

    if (old->valid == 0)
        return 1;

    if (new->overall_rank > old->overall_rank)
        return 1;
    else if (new->overall_rank != old->overall_rank)
        return 0;

    if (new->luckydog != 0 && new->luckydog != old->luckydog)
        return 1;

    if (new->unk00_17 > old->unk00_17)
        return 1;

    if (new->gold > old->gold)
        return 1;
    else if (new->gold != old->gold)
        return 0;

    newtime = new->hours * 3600
        + new->minutes * 60
        + new->seconds;

    oldtime = old->hours * 3600
        + old->minutes * 60
        + old->seconds;

    if (newtime >= oldtime)
        return 0;

    return 1;
}

void GenerateGameRankSaveData(struct GameRankSaveData * buf, int chapter_mode, int difficulty)
{
    int i, j;
    int best = 0;
    u16 hours, minutes, seconds;

    CpuFill16(0, buf, sizeof(struct GameRankSaveData));

    buf->valid = 1;
    buf->chapter_mode = chapter_mode;
    buf->difficulty = difficulty;

    buf->gold = GetPartyTotalGoldValue();

    buf->unk00_16 = gPlaySt.tact_enabled;
    buf->unk00_17 = gPlaySt.unk2C_04;

    FormatTime(GetGameTotalTime(), &hours, &minutes, &seconds);
    buf->hours = hours;
    buf->minutes = minutes;
    buf->seconds = seconds;

    buf->cuteguy = 0;
    buf->luckydog = 0;

    for (i = 1; i < 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (US_GROWTH_BOOST & unit->state)
        {
            if (US_DEAD & unit->state)
                break;

            buf->luckydog = unit->pCharacterData->number;
            break;
        }
    }

    for (j = 1; j < 0x40; j++)
    {
        struct Unit * unit = GetUnit(j);

        if (UNIT_IS_VALID(unit) == 0)
            continue;

        if (((US_BIT16 | US_DEAD) & unit->state) != 0)
            continue;

        if (PidStatsGetFavval(unit->pCharacterData->number) <= best)
            continue;

        best = PidStatsGetFavval(unit->pCharacterData->number);
        buf->cuteguy = unit->pCharacterData->number;
    }

    buf->tactics_rank = GetGameTacticsRank();
    buf->funds_rank = GetGameFundsRank();
    buf->survival_rank = GetGameSurvivalRank();
    buf->exp_rank = GetGameExpRank();
    buf->combat_rank = GetGameCombatRank();

    buf->overall_rank = GetOverallRank(buf->tactics_rank, buf->survival_rank, buf->funds_rank, buf->exp_rank, buf->combat_rank);
    buf->unk08_15 = GetCurCompleteChapters();
    strcpy(buf->tactician_name, GetTacticianName());
}

void SaveEndgameRankings(void)
{
    struct GameRankSaveData old, new;

    int chapter_mode = GetNextChapterMode();
    int difficulty = 1 & gPlaySt.chapterStateBits >> 6;

    GenerateGameRankSaveData(&new, chapter_mode, difficulty);
    LoadRankData(&old, chapter_mode, difficulty);

    if (JudgeGameRankSaveData(&old, &new) != 0)
        SaveNewRankData(&new, chapter_mode, difficulty);
}

void EraseSoundRoomSaveData(void)
{
    struct SoundRoomSaveData buf;

    CpuFill16(0, &buf, sizeof(buf));
    WriteSoundRoomSaveData(&buf);
}

bool LoadAndVerifySoundRoomData(void * buf)
{
    struct SoundRoomSaveData tmp;
    struct SoundRoomSaveData * _buf = buf;

    if (!IsSramWorking())
        return FALSE;

    if (_buf == NULL)
        _buf = &tmp;

    ReadSramFast((void *) gSramMain + SRAM_OFFSET_SOUNDROOM, _buf, sizeof(struct SoundRoomSaveData));

    if (_buf->checksum != Checksum16(_buf, sizeof(struct SoundRoomSaveData) - 4))
        return FALSE;
    else
        return TRUE;
}

void WriteSoundRoomSaveData(struct SoundRoomSaveData * buf)
{
    buf->checksum = Checksum16(buf, sizeof(struct SoundRoomSaveData) - 4);
    WriteAndVerifySramFast(buf, (void *) gSramMain + SRAM_OFFSET_SOUNDROOM, sizeof(struct SoundRoomSaveData));
}

bool IsSoundRoomSongUnlocked(struct SoundRoomSaveData * buf, int val)
{
    struct SoundRoomSaveData tmp;
    u32 _val = val;

    if (buf == NULL)
    {
        buf = &tmp;
        LoadAndVerifySoundRoomData(&tmp);
    }

    if ((buf->flags[val >> 5] >> (_val % 0x20)) & 1)
        return TRUE;

    return FALSE;
}

void UnlockSoundRoomSong(struct SoundRoomSaveData * buf, int val)
{
    struct SoundRoomSaveData tmp;
    u32 _val = val;

    if (buf == NULL)
    {
        buf = &tmp;
        if (!LoadAndVerifySoundRoomData(&tmp))
            return;
    }

    if (buf->flags[val >> 5] & (1 << (_val % 0x20)))
        return;

    buf->flags[val >> 5] |= 1 << (_val % 0x20);

    WriteSoundRoomSaveData(buf);
}

void EraseLinkArenaStruct2(void)
{
    struct LinkArenaSaveData2 buf;

    CpuFill16(0, &buf, sizeof(buf));
    WriteLinkArenaStruct2(&buf);
}

bool LoadAndVerfyLinkArenaStruct2(void * buf)
{
    struct LinkArenaSaveData2 tmp, * _buf = buf;

    if (!IsSramWorking())
        return FALSE;

    if (_buf == NULL)
        _buf = &tmp;

    ReadSramFast((void *) gSramMain + SRAM_OFFSET_LINKARENA2, _buf, sizeof(struct LinkArenaSaveData2));

    if (_buf->checksum != Checksum16(_buf, sizeof(struct LinkArenaSaveData2) - 4))
        return FALSE;
    else
        return TRUE;
}

void WriteLinkArenaStruct2(struct LinkArenaSaveData2 * buf)
{
    buf->checksum = Checksum16(buf, sizeof(struct LinkArenaSaveData2) - 4);
    WriteAndVerifySramFast(buf, (void *) gSramMain + SRAM_OFFSET_LINKARENA2, sizeof(struct LinkArenaSaveData2));
}

bool ModifySaveLinkArenaStruct2A(struct LinkArenaSaveData2 * buf, int val)
{
    struct LinkArenaSaveData2 tmp;
    u32 _val = val;

    if (buf == NULL)
    {
        buf = &tmp;
        LoadAndVerfyLinkArenaStruct2(&tmp);
    }

    if (1 & (buf->flags[val >> 5] >> (_val % 0x20)))
        return TRUE;
    else
        return FALSE;
}

void ModifySaveLinkArenaStruct2B(struct LinkArenaSaveData2 * buf, int val)
{
    struct LinkArenaSaveData2 tmp;
    u32 _val = val;

    if (buf == NULL)
    {
        buf = &tmp;

        if (!LoadAndVerfyLinkArenaStruct2(&tmp))
            return;
    }

    if (buf->flags[val >> 5] & (1 << (_val % 0x20)))
        return;

    buf->flags[val >> 5] |= (1 << (_val % 0x20));
    WriteLinkArenaStruct2(buf);
}

void SaveGlobalLang(int lang)
{
    struct GlobalSaveInfo info;

    if (ReadGlobalSaveInfo(&info) && info.unk10_18 != lang)
    {
        info.unk10_18 = lang;
        WriteGlobalSaveInfo(&info);
    }

    SetLang(lang);
}

int LoadGlobalLang(void)
{
    struct GlobalSaveInfo info;

    int ret;

    if (!ReadGlobalSaveInfo(&info))
        ret = 0;
    else
    {
        SetLang(info.unk10_18);
        ret = info.unk10_18;
    }

    return ret;
}

void LoadAndVerifySramSaveData(void)
{
    if (!ReadGlobalSaveInfo(NULL))
        InitGlobalSaveInfo();

    if (!LoadBonusContentData(NULL))
        EraseBonusContentData();

    if (!ReadFe6LinkSaveInfo(NULL))
        ResetFe6LinkSaveInfo();

    if (!LoadAndVerfyRankData(NULL))
        EraseSaveRankData();

    if (!LoadAndVerifySoundRoomData(NULL))
        EraseSoundRoomSaveData();

    if (!LoadAndVerfyLinkArenaStruct2(NULL))
        EraseLinkArenaStruct2();
}
