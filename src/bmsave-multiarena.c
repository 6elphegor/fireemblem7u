#include "gbafe.h"

u16 GetGameStateChecksum_Unused(void)
{
    int i;
    u16 ret = 0;

    for (i = 0; i < 0x34; i++)
    {
        if (gUnitArrayBlue[i].pCharacterData == NULL)
            continue;

        gUnitArrayBlue[i].pMapSpriteHandle = NULL;
        ret += SramChecksum32(&gUnitArrayBlue[i], MULTIARENA_PACKEDUNIT_SIZE);
    }

    for (i = 0; i < 0x32; i++)
    {
        if (gUnitArrayRed[i].pCharacterData == NULL)
            continue;

        gUnitArrayRed[i].pMapSpriteHandle = NULL;
        ret += SramChecksum32(&gUnitArrayRed[i], MULTIARENA_PACKEDUNIT_SIZE);
    }

    for (i = 0; i < 0x0A; i++)
    {
        if (gUnitArrayGreen[i].pCharacterData == NULL)
            continue;

        gUnitArrayGreen[i].pMapSpriteHandle = NULL;
        ret += SramChecksum32(&gUnitArrayGreen[i], MULTIARENA_PACKEDUNIT_SIZE);
    }

    ret += SramChecksum32(GetPermanentFlagBits(), sub_0807992C() / 2);
    ret += SramChecksum32(sub_08079930(), sub_08079938() / 2);
    ret += SramChecksum32(GetTrap(0), 0x100);

    return ret;
}

void sub_080A1AAC(void)
{
    u8 buf[8];
}

bool IsMultiArenaSaveValid(int index)
{
    return ReadSaveBlockInfo(NULL, index);
}

void WriteNewMultiArenaSave(void)
{
    int i, j;
    struct SaveBlockInfo block_info;
    u8 save_unit[MULTIARENA_PACKEDUNIT_SIZE];
    char team_name[MULTIARENA_TEAMNAME_SIZE + 2];
    struct MultiArenaRankingEnt ranking_ent;
    u16 config;

    struct MultiArenaSaveBlock * dst = GetSaveWriteAddr(SAVE_MULTIARENA);

    CpuFill16(0, save_unit, sizeof(save_unit));
    CpuFill16(0, team_name, MULTIARENA_TEAMNAME_SIZE);

    for (i = 0; i < MULTIARENA_MAX_TEAMS; i++)
    {
        for (j = 0; j < MULTIARENA_UNITS_PER_TEAM; j++)
            WriteAndVerifySramFast(save_unit, dst->teams[i].units[j], sizeof(save_unit));

        WriteAndVerifySramFast(team_name, dst->teams[i].name, sizeof(dst->teams[i].name));
    }

    config = 7;
    WriteAndVerifySramFast(&config, &dst->config, sizeof(config));

    for (i = 0; i < MULTIARENA_MAX_RANKINGS; i++)
    {
        ranking_ent.ranking = gInitialMultiArenaRankings[i].ranking;
        ranking_ent.player_count = gInitialMultiArenaRankings[i].player_count;
        ranking_ent.mode = gInitialMultiArenaRankings[i].mode;
        ranking_ent.points = gInitialMultiArenaRankings[i].points;

        SioStrCpy(gInitialMultiArenaRankings[i].name, ranking_ent.name);
        WriteAndVerifySramFast(&ranking_ent, &dst->rankings[i], sizeof(ranking_ent));
    }

    block_info.magic32 = SAVE_MAGIC32_MULTIARENA;
    block_info.kind = SAVE_KIND_MULTIARENA;
    WriteSaveBlockInfo(&block_info, SAVE_MULTIARENA);
}

bool ReadMultiArenaSaveTeamRaw(int team, struct MultiArenaSaveTeam * dst)
{
    struct MultiArenaSaveBlock const * src_sram = GetSaveReadAddr(SAVE_MULTIARENA);

    ReadSramFast(&src_sram->teams[team], dst, sizeof(struct MultiArenaSaveTeam));

    if (dst->name[0] == 0)
        return FALSE;

    return TRUE;
}

bool ReadMultiArenaSaveTeamName(int team, char * dst)
{
    struct MultiArenaSaveBlock const * src_sram = GetSaveReadAddr(SAVE_MULTIARENA);

    ReadSramFast(&src_sram->teams[team], &gMultiArenaSaveTeamBufA, sizeof(struct MultiArenaSaveTeam));

    if (gMultiArenaSaveTeamBufA.name[0] == 0)
        return FALSE;

    SioStrCpy(gMultiArenaSaveTeamBufA.name, dst);

    return TRUE;
}

void WriteMultiArenaSaveTeamName(int team, char * name)
{
    struct SaveBlockInfo block_info;

    struct MultiArenaSaveBlock * dst_sram = GetSaveWriteAddr(SAVE_MULTIARENA);

    WriteAndVerifySramFast(name, dst_sram->teams[team].name, MULTIARENA_TEAMNAME_SIZE);

    block_info.magic32 = SAVE_MAGIC32_MULTIARENA;
    block_info.kind = SAVE_KIND_MULTIARENA;
    WriteSaveBlockInfo(&block_info, SAVE_MULTIARENA);
}

void WipeMultiArenaSaveTeam(int team)
{
    struct SaveBlockInfo block_info;

    struct MultiArenaSaveBlock * dst_sram = GetSaveWriteAddr(SAVE_MULTIARENA);

    CpuFill16(0, &gMultiArenaSaveTeamBufA, sizeof(struct MultiArenaSaveTeam));
    WriteAndVerifySramFast(&gMultiArenaSaveTeamBufA, &dst_sram->teams[team], sizeof(struct MultiArenaSaveTeam));

    block_info.magic32 = SAVE_MAGIC32_MULTIARENA;
    block_info.kind = SAVE_KIND_MULTIARENA;
    WriteSaveBlockInfo(&block_info, SAVE_MULTIARENA);
}

void CopyMultiArenaSaveTeam(int team_src, int team_dst)
{
    struct SaveBlockInfo block_info;

    struct MultiArenaSaveBlock const * src_sram = GetSaveReadAddr(SAVE_MULTIARENA);
    struct MultiArenaSaveBlock * dst_sram = GetSaveWriteAddr(SAVE_MULTIARENA);

    ReadSramFast(&src_sram->teams[team_src], &gMultiArenaSaveTeamBufA, sizeof(struct MultiArenaSaveTeam));
    WriteAndVerifySramFast(&gMultiArenaSaveTeamBufA, &dst_sram->teams[team_dst], sizeof(struct MultiArenaSaveTeam));

    block_info.magic32 = SAVE_MAGIC32_MULTIARENA;
    block_info.kind = SAVE_KIND_MULTIARENA;
    WriteSaveBlockInfo(&block_info, SAVE_MULTIARENA);
}

void SwapMultiArenaSaveTeams(int team_a, int team_b)
{
    struct SaveBlockInfo block_info;

    struct MultiArenaSaveBlock const * src_sram = GetSaveReadAddr(SAVE_MULTIARENA);
    struct MultiArenaSaveBlock * dst_sram = GetSaveWriteAddr(SAVE_MULTIARENA);

    ReadSramFast(&src_sram->teams[team_a], &gMultiArenaSaveTeamBufA, sizeof(struct MultiArenaSaveTeam));
    ReadSramFast(&src_sram->teams[team_b], &gMultiArenaSaveTeamBufB, sizeof(struct MultiArenaSaveTeam));

    WriteAndVerifySramFast(&gMultiArenaSaveTeamBufA, &dst_sram->teams[team_b], sizeof(struct MultiArenaSaveTeam));
    WriteAndVerifySramFast(&gMultiArenaSaveTeamBufB, &dst_sram->teams[team_a], sizeof(struct MultiArenaSaveTeam));

    block_info.magic32 = SAVE_MAGIC32_MULTIARENA;
    block_info.kind = SAVE_KIND_MULTIARENA;
    WriteSaveBlockInfo(&block_info, SAVE_MULTIARENA);
}

void WriteMultiArenaSaveTeam(int team, struct Unit * units_src, char const * name_src)
{
    struct SaveBlockInfo block_info;
    int i;

    struct MultiArenaSaveBlock * dst_sram = GetSaveWriteAddr(SAVE_MULTIARENA);

    WriteAndVerifySramFast(name_src, dst_sram->teams[team].name, sizeof(dst_sram->teams[team].name));

    for (i = 0; i < MULTIARENA_UNITS_PER_TEAM; i++)
        WriteGameSavePackedUnit(&units_src[i], dst_sram->teams[team].units[i]);

    block_info.magic32 = SAVE_MAGIC32_MULTIARENA;
    block_info.kind = SAVE_KIND_MULTIARENA;
    WriteSaveBlockInfo(&block_info, SAVE_MULTIARENA);
}

bool ReadMultiArenaSaveTeam(int team, struct Unit * units_dst, char * name_dst)
{
    int i;

    struct MultiArenaSaveBlock const * src_sram = GetSaveReadAddr(SAVE_MULTIARENA);

    ReadSramFast(src_sram->teams[team].name, name_dst, sizeof(src_sram->teams[team].name));

    for (i = 0; i < MULTIARENA_UNITS_PER_TEAM; i++)
        LoadSavedUnit(src_sram->teams[team].units[i], &units_dst[i]);

    if (src_sram->teams[team].name[0] == 0)
        return FALSE;

    return TRUE;
}

void WriteMultiArenaSaveRankings(struct MultiArenaRankingEnt const * src)
{
    struct SaveBlockInfo block_info;

    struct MultiArenaSaveBlock * dst_sram = GetSaveWriteAddr(SAVE_MULTIARENA);

    WriteAndVerifySramFast(src, dst_sram->rankings, sizeof(dst_sram->rankings));

    block_info.magic32 = SAVE_MAGIC32_MULTIARENA;
    block_info.kind = SAVE_KIND_MULTIARENA;
    WriteSaveBlockInfo(&block_info, SAVE_MULTIARENA);
}

void ReadMultiArenaSaveRankings(struct MultiArenaRankingEnt * dst)
{
    struct MultiArenaSaveBlock * src_sram = GetSaveReadAddr(SAVE_MULTIARENA);
    ReadSramFast(src_sram->rankings, dst, sizeof(src_sram->rankings));
}

void WriteMultiArenaSaveConfig(void const * config_src)
{
    struct SaveBlockInfo block_info;

    struct MultiArenaSaveBlock * dst_sram = GetSaveWriteAddr(SAVE_MULTIARENA);

    WriteAndVerifySramFast(config_src, &dst_sram->config, 2);

    block_info.magic32 = SAVE_MAGIC32_MULTIARENA;
    block_info.kind = SAVE_KIND_MULTIARENA;
    WriteSaveBlockInfo(&block_info, SAVE_MULTIARENA);
}

void ReadMultiArenaSaveConfig(void * config_dst)
{
    struct MultiArenaSaveBlock * src_sram = GetSaveReadAddr(SAVE_MULTIARENA);
    ReadSramFast(&src_sram->config, config_dst, 2);
}

bool IsMultiArenaSaveReady(void)
{
    char buf[MULTIARENA_TEAMNAME_SIZE + 1];
    int i;

    if (!IsMultiArenaSaveValid(SAVE_MULTIARENA))
        return FALSE;

    for (i = 0; i < MULTIARENA_MAX_TEAMS; i++)
    {
        if (ReadMultiArenaSaveTeamName(i, buf) == TRUE)
            return TRUE;
    }

    return FALSE;
}
