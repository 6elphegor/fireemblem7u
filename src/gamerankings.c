#include "gbafe.h"

// FE8U: gamerankings.c

void * memcpy(void * dst, const void * src, unsigned long size);

extern u8 const gGameSurvivalRankThresholds[4];
extern u8 const gCombatRankThresholds[4];
extern u8 const gChapterSurvivalRankThresholds[4];

extern u8 CONST_DATA gOverallRankWeightLookup[5][5];
extern u16 CONST_DATA gOverallRankLookup[];
extern u8 CONST_DATA gUnknown_08CED69E[3][5];
extern u16 CONST_DATA gUnknown_08CED6AE[];
extern u8 CONST_DATA gUnknown_08CED6BA[2][5];
extern u16 CONST_DATA gUnknown_08CED6C4[];

u16 GetGameDeathCount(void);
u16 GetGameWinPerc(void);
u16 GetChapterDeathCount(void);
int GetChapterWinPerc(void);

int GetGameTacticsRank(void)
{
    int gameTotalTurns;
    int nextIndex;
    int i;
    int rankThresholds[4];

    gameTotalTurns = GetTotalTurnCountUpUntilNow();

    for (i = 0; i < 4; i++)
        rankThresholds[i] = 0;

    nextIndex = GetNextChapterStatsSlot();

    for (i = 0; i < nextIndex; i++)
    {
        struct ChapterStats * ent = GetChapterStats(i);

        if (IsChapterPartOfCurrentMode(ent->chapter_index) != 0)
        {
            rankThresholds[0] += gChapterDataTable[ent->chapter_index].turnsForTacticsRankDInEliwoodStory[IsDifficultMode()];
            rankThresholds[1] += gChapterDataTable[ent->chapter_index].turnsForTacticsRankCInEliwoodStory[IsDifficultMode()];
            rankThresholds[2] += gChapterDataTable[ent->chapter_index].turnsForTacticsRankBInEliwoodStory[IsDifficultMode()];
            rankThresholds[3] += gChapterDataTable[ent->chapter_index].turnsForTacticsRankAInEliwoodStory[IsDifficultMode()];
        }
    }

    for (i = 0; i < 4; i++)
    {
        if (gameTotalTurns > rankThresholds[i])
            return i;
    }

    return i;
}

int GetGameSurvivalRank(void)
{
    int deathCount;
    u8 i;
    u8 rankThresholds[4];

    memcpy(rankThresholds, gGameSurvivalRankThresholds, sizeof(rankThresholds));

    deathCount = GetGameDeathCount();

    for (i = 0; i < 4; i++)
    {
        if (deathCount >= rankThresholds[i])
            return i;
    }

    return i;
}

int GetGameExpRank(void)
{
    int nextIndex;
    int i;
    int rankThresholds[4];

    int totalExp = PidStatsGetTotalExpGain();

    for (i = 0; i < 4; i++)
        rankThresholds[i] = 0;

    nextIndex = GetNextChapterStatsSlot();

    for (i = 0; i < nextIndex; i++)
    {
        struct ChapterStats * ent = GetChapterStats(i);

        if (IsChapterPartOfCurrentMode(ent->chapter_index))
        {
            rankThresholds[0] += gChapterDataTable[ent->chapter_index].gainedExpForExpRankDInEliwoodStory[IsDifficultMode()];
            rankThresholds[1] += gChapterDataTable[ent->chapter_index].gainedExpForExpRankCInEliwoodStory[IsDifficultMode()];
            rankThresholds[2] += gChapterDataTable[ent->chapter_index].gainedExpForExpRankBInEliwoodStory[IsDifficultMode()];
            rankThresholds[3] += gChapterDataTable[ent->chapter_index].gainedExpForExpRankAInEliwoodStory[IsDifficultMode()];
        }
    }

    for (i = 0; i < 4; i++)
    {
        if (totalExp < rankThresholds[i])
            return i;
    }

    return i;
}

int GetGameCombatRank(void)
{
    int winPercentage;
    int i;
    u8 rankThresholds[4];

    memcpy(rankThresholds, gCombatRankThresholds, sizeof(rankThresholds));

    winPercentage = GetGameWinPerc();

    for (i = 0; i < 4; i++)
    {
        if (winPercentage < rankThresholds[i])
            return i;
    }

    return i;
}

int GetGameFundsRank(void)
{
    u32 totalGoldComp;
    int i;

    int totalGold = GetPartyTotalGoldValue();
    int overallFundsRequirement = 0;

    int nextIndex = GetNextChapterStatsSlot();

    for (i = 0; i < nextIndex; i++)
    {
        struct ChapterStats * ent = GetChapterStats(i);

        if (IsChapterPartOfCurrentMode(ent->chapter_index) != 0)
            overallFundsRequirement += gChapterDataTable[ent->chapter_index].goldForFundsRankInEliwoodStory[IsDifficultMode()];
    }

    totalGoldComp = totalGold * 100;

    if (totalGoldComp >= (overallFundsRequirement * 80))
        return 4;
    else if (totalGoldComp >= (overallFundsRequirement * 60))
        return 3;
    else if (totalGoldComp >= (overallFundsRequirement * 40))
        return 2;
    else if (totalGoldComp >= (overallFundsRequirement * 20))
        return 1;
    else
        return 0;
}

int GetOverallRank(int tacticsRank, int survivalRank, int fundsRank, int combatRank, int expRank)
{
    int i;

    u16 tmp = gOverallRankWeightLookup[0][tacticsRank];
    tmp += gOverallRankWeightLookup[1][survivalRank];
    tmp += gOverallRankWeightLookup[2][fundsRank];
    tmp += gOverallRankWeightLookup[3][combatRank];
    tmp += gOverallRankWeightLookup[4][expRank];

    for (i = 0; i < 5; i++)
    {
        if ((u32) tmp < gOverallRankLookup[i])
            return i;
    }

    return i;
}

int sub_080B663C(int param_1, int param_2, int param_3)
{
    int i;

    u16 tmp = gUnknown_08CED69E[0][param_1];
    tmp += gUnknown_08CED69E[1][param_2];
    tmp += gUnknown_08CED69E[2][param_3];

    for (i = 0; i < 5; i++)
    {
        if ((u32) tmp < gUnknown_08CED6AE[i])
            return i;
    }

    return i;
}

int GetGameOverallRank(void)
{
    return GetOverallRank(
        GetGameTacticsRank(),
        GetGameSurvivalRank(),
        GetGameFundsRank(),
        GetGameExpRank(),
        GetGameCombatRank());
}

int GetChapterTacticsRank(void)
{
    int i;
    int rankThresholds[4];

    u16 turn = gPlaySt.chapterTurnNumber;
    struct ChapterInfo const * chapter = &gChapterDataTable[gPlaySt.chapterIndex];

    rankThresholds[0] = chapter->turnsForTacticsRankDInEliwoodStory[IsDifficultMode()];
    rankThresholds[1] = chapter->turnsForTacticsRankCInEliwoodStory[IsDifficultMode()];
    rankThresholds[2] = chapter->turnsForTacticsRankBInEliwoodStory[IsDifficultMode()];
    rankThresholds[3] = chapter->turnsForTacticsRankAInEliwoodStory[IsDifficultMode()];

    for (i = 0; i < 4; i++)
    {
        if (turn > rankThresholds[i])
            return i;
    }

    return i;
}

int GetChapterSurvivalRank(void)
{
    int deathCount;
    u8 i;
    u8 rankThresholds[4];

    memcpy(rankThresholds, gChapterSurvivalRankThresholds, sizeof(rankThresholds));

    deathCount = GetChapterDeathCount();

    for (i = 0; i < 4; i++)
    {
        if (deathCount >= rankThresholds[i])
            return i;
    }

    return i;
}

int sub_080B676C(int param_1, int param_2)
{
    int i;

    u16 tmp = gUnknown_08CED6BA[0][param_1];
    tmp += gUnknown_08CED6BA[1][param_2];

    for (i = 0; i < 5; i++)
    {
        if ((u32) tmp < gUnknown_08CED6C4[i])
            return i;
    }

    return i;
}

u16 GetGameDeathCount(void)
{
    int i;
    int count = 0;

    for (i = 1; i < 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if ((unit->state & (US_DEAD | US_BIT16)) == US_DEAD)
            count++;
    }

    return count;
}

u16 GetGameWinPerc(void)
{
    int battles = PidStatsGetTotalBattleAmt();
    int wins = PidStatsGetTotalWinAmt() * 100;

    return wins / battles;
}

u16 GetChapterDeathCount(void)
{
    int i;
    int count = 0;

    for (i = 1; i < 0x40; i++)
    {
        struct PidStats * bwl;
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if ((unit->state & (US_DEAD | US_BIT16)) != US_DEAD)
            continue;

        bwl = GetPidStats(unit->pCharacterData->number);

        if (bwl->defeat_chapter != gPlaySt.chapterIndex)
            continue;

        count++;
    }

    return count;
}

void sub_080B6844(void)
{
}

int GetChapterFundsRank(void)
{
    int goldInChapter;
    struct ChapterStats const * ent;
    int goldForFundsRank;

    int totalGold = GetPartyTotalGoldValue();

    goldInChapter = gPlaySt.total_gold;
    goldInChapter = totalGold - goldInChapter;

    gPlaySt.total_gold = totalGold;

    ent = GetChapterStats(GetNextChapterStatsSlot() - 1);

    goldForFundsRank = gChapterDataTable[ent->chapter_index].goldForFundsRankInEliwoodStory[IsDifficultMode()];

    if (goldInChapter * 100 >= goldForFundsRank * 80)
        return 4;
    else if (goldInChapter * 100 >= goldForFundsRank * 60)
        return 3;
    else if (goldInChapter * 100 >= goldForFundsRank * 40)
        return 2;
    else if (goldInChapter * 100 >= goldForFundsRank * 20)
        return 1;
    else
        return 0;
}

int GetChapterWinPerc(void)
{
    int chapterTotalBattles;
    int percentage;
    int num;
    int a;
    int b;

    int totalBattles = PidStatsGetTotalBattleAmt();
    int totalWins = PidStatsGetTotalWinAmt();

    if (totalBattles > 0xFFFFF)
        totalBattles = 0xFFFFF;

    if (totalWins > 0xFFFFF)
        totalWins = 0xFFFFF;

    chapterTotalBattles = gPlaySt.unk_34_00;

    if (totalBattles == chapterTotalBattles)
        return 40;

    a = gPlaySt.unk_34_14;
    b = gPlaySt.unk_38_1 << 12;
    num = (totalWins - (b | a)) * 100;

    percentage = num / (totalBattles - chapterTotalBattles);

    if (percentage > 100)
        percentage = 100;

    gPlaySt.unk_34_00 = totalBattles;
    gPlaySt.unk_34_14 = (totalWins & 0x00000FFF);
    gPlaySt.unk_38_1 = ((u32) totalWins >> 12);

    return percentage;
}

int GetChapterCombatRank(void)
{
    int winPercentage;
    int i;
    u8 rankThresholds[4];

    memcpy(rankThresholds, gCombatRankThresholds, sizeof(rankThresholds));

    winPercentage = GetChapterWinPerc();

    for (i = 0; i < 4; i++)
    {
        if (winPercentage < rankThresholds[i])
            return i;
    }

    return i;
}

int GetChapterExpRank(void)
{
    int totalExp;
    int i;
    struct ChapterStats * ent;
    int expInChapter;
    int rankThresholds[4];

    for (i = 0; i < 4; i++)
        rankThresholds[i] = 0;

    totalExp = PidStatsGetTotalExpGain();

    if (totalExp > 0xFFFFF)
        totalExp = 0xFFFFF;

    expInChapter = totalExp - gPlaySt.unk_38_2;
    gPlaySt.unk_38_2 = totalExp;

    ent = GetChapterStats(GetNextChapterStatsSlot() - 1);

    rankThresholds[0] = gChapterDataTable[ent->chapter_index].gainedExpForExpRankDInEliwoodStory[IsDifficultMode()];
    rankThresholds[1] = gChapterDataTable[ent->chapter_index].gainedExpForExpRankCInEliwoodStory[IsDifficultMode()];
    rankThresholds[2] = gChapterDataTable[ent->chapter_index].gainedExpForExpRankBInEliwoodStory[IsDifficultMode()];
    rankThresholds[3] = gChapterDataTable[ent->chapter_index].gainedExpForExpRankAInEliwoodStory[IsDifficultMode()];

    for (i = 0; i < 4; i++)
    {
        if (expInChapter < rankThresholds[i])
            return i;
    }

    return i;
}

void ComputeChapterRankings(void)
{
    int overallRank;
    int newRank;

    if (GetNextChapterStatsSlot() > 0)
    {
        switch (gPlaySt.chapterModeIndex)
        {
        case 1:
        case 2:
        case 3:
            gPlaySt.tacticsRank = GetChapterTacticsRank();
            gPlaySt.survivalRank = GetChapterSurvivalRank();
            gPlaySt.fundsRank = GetChapterFundsRank();
            gPlaySt.combatRank = GetChapterCombatRank();
            gPlaySt.expRank = GetChapterExpRank();
        }

        overallRank = GetOverallRank(
            gPlaySt.tacticsRank,
            gPlaySt.survivalRank,
            gPlaySt.fundsRank,
            gPlaySt.expRank,
            gPlaySt.combatRank);

        newRank = gPlaySt.unk2C_04 + overallRank;

        if (newRank > 0xff)
            newRank = 0xff;

        gPlaySt.unk2C_04 = newRank;
    }
}

