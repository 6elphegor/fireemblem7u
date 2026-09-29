#include "gbafe.h"
#include "gbafe/bmarena.h"

// Arena (FE8U: bmarena.c)

extern struct Unit gArenaOpponent;
extern u8 gArenaLevelBackup;

void * memcpy(void * dst, const void * src, unsigned long size);

extern const u8 gArenaBaseWeapons[8];
extern const u8 gArenaWeaponUpgrades[26];

CONST_DATA u8 gClassList_MeleeArena[] = {
    0xA, 0xC, 0xE, 0x10, 0x12, 0x13, 0x14, 0x16,
    0x1E, 0x20, 0x22, 0x24, 0x26, 0x28, 0x2A, 0x2D,
    0x32, 0x33, 0x34, 0x36, 0x38, 0x39, 0x3A, 0x3B,
    0xA, 0xE, 0x12, 0x14, 0x20, 0x24, 0x28, 0x32,
    0x34, 0x39, 0x3A, 0x38, 0x38, 0,
};

CONST_DATA u8 gClassList_MagicArena[] = {
    0xA, 0xC, 0xE, 0x10, 0x12, 0x13, 0x14, 0x16,
    0x18, 0x1A, 0x1E, 0x20, 0x22, 0x24, 0x26, 0x28,
    0x2A, 0x2D, 0x2E, 0x30, 0x32, 0x33, 0x34, 0x36,
    0x38, 0x39, 0x3A, 0x3B, 0x3C, 0xA, 0xE, 0x12,
    0x14, 0x18, 0x20, 0x24, 0x28, 0x2E, 0x32, 0x34,
    0x38, 0x38, 0,
};

CONST_DATA u8 gClassList_BowArena[] = {
    0x18, 0x1A, 0x1E, 0x20, 0x22, 0x24, 0x26, 0x2D,
    0x2E, 0x30, 0, 0xA, 0xE, 0x10, 0x12, 0x13,
    0x1E, 0x20, 0x22, 0x24, 0x26, 0x28, 0x2D, 0x32,
    0x34, 0x38, 0x39, 0x3A, 0x3B, 0x3C, 0x12, 0x12,
    0x3C, 0, 0,
};

void ArenaBeginInternal(struct Unit * unit)
{
    int i;

    gArenaSt.player = unit;
    gArenaSt.opponent = &gArenaOpponent;

    gArenaLevelBackup = UNIT_ARENA_LEVEL(unit);

    gArenaSt.player_jid = unit->pClassData->number;
    gArenaSt.player_weapon_kind = GetUnitBestWRankType(unit);

    gArenaSt.opponent_jid = ArenaGenerateOpposingClassId(gArenaSt.player_weapon_kind);
    gArenaSt.opponent_weapon_kind = GetClassBestWRankType(GetClassData(gArenaSt.opponent_jid));

    gArenaSt.player_is_magic = IsWeaponMagic(gArenaSt.player_weapon_kind);
    gArenaSt.opponent_is_magic = IsWeaponMagic(gArenaSt.opponent_weapon_kind);

    gArenaSt.player_level = unit->level;

    if (UNIT_ARENA_LEVEL(unit) < 5)
        gArenaSt.opponent_level = ArenaGetOpposingLevel(gArenaSt.player_level);
    else
        gArenaSt.opponent_level = ArenaGetOpposingLevel(gArenaSt.player_level) + 7;

    ArenaGenerateOpponentUnit();
    ArenaGenerateBaseWeapons();

    for (i = 0; i < 10; i++)
    {
        if (!ArenaAdjustOpponentPowerRanking())
            break;
    }

    for (i = 0; i < 5; i++)
    {
        if (!ArenaAdjustOpponentDamage())
            break;
    }

    gArenaSt.player_power_ranking = ArenaGetPowerRanking(gArenaSt.player, gArenaSt.opponent_is_magic);
    gArenaSt.opponent_power_ranking = ArenaGetPowerRanking(gArenaSt.opponent, gArenaSt.player_is_magic);

    ArenaGenerateMatchupGoldValue();

    gArenaSt.unk_0B = 1;

    ArenaSetResult(0);

    ArenaSetFallbackWeaponsMaybe();
}

void ArenaBegin(struct Unit * unit)
{
    RandGetSt(gActionSt.arena_begin_rand_st);
    ArenaBeginInternal(unit);
}

void ArenaResume(struct Unit * unit)
{
    RandSetSt(gActionSt.arena_begin_rand_st);
    ArenaBeginInternal(unit);
    RandSetSt(gActionSt.action_rand_st);
}

int GetUnitBestWRankType(struct Unit * unit)
{
    int i;

    int wexp = 0;
    int type = -1;

    for (i = 0; i < 8; i++)
    {
        if (i == ITYPE_STAFF)
            continue;

        if (wexp < unit->ranks[i])
        {
            wexp = unit->ranks[i];
            type = i;
        }
    }

    return type;
}

int GetClassBestWRankType(const struct ClassData * class)
{
    int i;

    int wexp = 0;
    int type = -1;

    for (i = 0; i < 8; i++)
    {
        if (i == ITYPE_STAFF)
            continue;

        if (wexp < class->baseRanks[i])
        {
            wexp = class->baseRanks[i];
            type = i;
        }
    }

    return type;
}

int ArenaGenerateOpposingClassId(int weaponType)
{
    int i;
    int promotedFlag;
    int classNum;

    int classCount = 0;
    u8 * classList = NULL;

    switch (weaponType)
    {
    case ITYPE_SWORD:
    case ITYPE_LANCE:
    case ITYPE_AXE:
        classList = gClassList_MeleeArena;
        break;

    case ITYPE_BOW:
        classList = gClassList_BowArena;
        break;

    case ITYPE_ANIMA:
    case ITYPE_LIGHT:
    case ITYPE_DARK:
        classList = gClassList_MagicArena;
        break;
    }

    promotedFlag = UNIT_CATTRIBUTES(gArenaSt.player) & CA_PROMOTED;

    for (i = 0; classList[i] != 0; i++)
    {
        if ((GetClassData(classList[i])->attributes & CA_PROMOTED) != promotedFlag)
            continue;

        classCount++;
    }

    classNum = RandNext(classCount);

    for (i = 0, classCount = 0; TRUE; i++)
    {
        if ((GetClassData(classList[i])->attributes & CA_PROMOTED) != promotedFlag)
            continue;

        if (classCount == classNum)
            break;

        classCount++;
    }

    return classList[i];
}

s8 IsWeaponMagic(int weaponType)
{
    switch (weaponType)
    {
    case ITYPE_SWORD:
    case ITYPE_LANCE:
    case ITYPE_AXE:
    case ITYPE_BOW:
        return 0;

    case ITYPE_ANIMA:
    case ITYPE_LIGHT:
    case ITYPE_DARK:
        return 1;
    }
}

int ArenaGetOpposingLevel(int level)
{
    int result = level + RandNext(1 + 2 * 4) - 4;

    if (result < 1)
        result = 1;

    return result;
}

int ArenaGetPowerRanking(struct Unit * unit, s8 opponentIsMagic)
{
    int result = unit->maxHP;

    result += unit->maxHP;
    result += unit->pow * 2;
    result += unit->skl * 2;
    result += unit->spd * 2;
    result += unit->lck;
    result += UNIT_CON_BASE(unit);

    if (opponentIsMagic)
        result += GetUnitResistance(unit) * 2;
    else
        result += GetUnitDefense(unit) * 2;

    if (UNIT_CATTRIBUTES(unit) & CA_CRITBONUS)
        result += GetUnitPower(unit);

    return result;
}

void ArenaGenerateOpponentUnit(void)
{
    int level;
    int i;

    struct UnitDefinition udef;

    struct Unit * unit = &gArenaOpponent;

    udef.pid = CHARACTER_ARENA_OPPONENT;
    udef.jid = gArenaSt.opponent_jid;
    udef.faction_id = 0;
    udef.level = gArenaSt.opponent_level;
    udef.autolevel = 1;
    udef.items[0] = 0;
    udef.items[1] = 0;
    udef.items[2] = 0;
    udef.items[3] = 0;
    udef.ai[0] = 0;
    udef.ai[0] = 0;
    udef.ai[1] = 0;
    udef.ai[2] = 0;
    udef.ai[3] = 0;

    ClearUnit(&gArenaOpponent);
    unit->index = 0x80;

    UnitInitFromDefinition(unit, &udef);
    UnitLoadStatsFromChracter(unit, unit->pCharacterData);

    level = unit->level;

    unit->level = ((gPlaySt.chapterStateBits & PLAY_FLAG_HARD) ? level * 24 : level * 12) / 10;

    UnitAutolevel(unit);

    unit->level = level;

    for (i = 0; i < 8; i++)
    {
        if (unit->ranks[i] != 0)
            unit->ranks[i] = -75;
    }

    if (unit->level < 1)
        unit->level = 1;

    if (unit->level > 20)
        unit->level = 20;

    UnitCheckStatCaps(unit);
    SetUnitHp(unit, GetUnitMaxHp(unit));
}

void ArenaGenerateBaseWeapons(void)
{
    u8 arenaWeapons[8];
    memcpy(arenaWeapons, gArenaBaseWeapons, sizeof(arenaWeapons));

    gArenaSt.player_weapon = MakeNewItem(arenaWeapons[gArenaSt.player_weapon_kind]);
    gArenaSt.opponent_weapon = MakeNewItem(arenaWeapons[gArenaSt.opponent_weapon_kind]);

    gArenaSt.range = 1;

    if (gArenaSt.player_weapon_kind == ITYPE_BOW)
        gArenaSt.range = 2;

    if (gArenaSt.opponent_weapon_kind == ITYPE_BOW)
        gArenaSt.range = 2;
}

u16 ArenaGetUpgradedWeapon(u16 item)
{
    u8 * iter;
    u8 arenaWeaponUpgrades[26];
    memcpy(arenaWeaponUpgrades, gArenaWeaponUpgrades, sizeof(arenaWeaponUpgrades));

    for (iter = arenaWeaponUpgrades; *iter != (u8) -1; iter++)
    {
        if (GetItemIndex(item) != *iter)
            continue;

        if (*++iter != 0)
            return MakeNewItem(*iter);

        return item;
    }

#if NONMATCHING
    // Original bug: no return for an item not in the list; r0 holds the
    // list's end marker.
    return 0xFF;
#endif
}

s8 ArenaAdjustOpponentDamage(void)
{
    s8 result = 0;

    gBattleActor.battleAttack = GetUnitPower(gArenaSt.player) + 5;

    if (gArenaSt.opponent_is_magic)
        gBattleActor.battleDefense = GetUnitResistance(gArenaSt.player);
    else
        gBattleActor.battleDefense = GetUnitDefense(gArenaSt.player);

    gBattleTarget.battleAttack = GetUnitPower(gArenaSt.opponent) + 5;

    if (gArenaSt.player_is_magic)
        gBattleTarget.battleDefense = GetUnitResistance(gArenaSt.opponent);
    else
        gBattleTarget.battleDefense = GetUnitDefense(gArenaSt.opponent);

    if ((gBattleActor.battleAttack - gBattleTarget.battleDefense) < (GetUnitMaxHp(gArenaSt.opponent) / 6))
    {
        result = 1;

        if (gArenaSt.player_is_magic)
        {
            gArenaSt.opponent->res -= 4;

            if (gArenaSt.opponent->res < 0)
                gArenaSt.opponent->res = 0;
        }
        else
        {
            gArenaSt.opponent->def -= 4;

            if (gArenaSt.opponent->def < 0)
                gArenaSt.opponent->def = 0;
        }

        gArenaSt.opponent->spd += 1;
        gArenaSt.opponent->skl += 1;
    }

    if (gBattleTarget.battleAttack - gBattleActor.battleDefense < (GetUnitMaxHp(gArenaSt.player) / 6))
    {
        result = 1;

        gArenaSt.opponent->pow += 3;
        gArenaSt.opponent->spd += 2;
        gArenaSt.opponent->skl += 2;

        gArenaSt.opponent_weapon = ArenaGetUpgradedWeapon(gArenaSt.opponent_weapon);
    }

    return result;
}

s8 ArenaAdjustOpponentPowerRanking(void)
{
    int max;
    int diff;

    gArenaSt.player_power_ranking = ArenaGetPowerRanking(gArenaSt.player, gArenaSt.opponent_is_magic);
    gArenaSt.opponent_power_ranking = ArenaGetPowerRanking(gArenaSt.opponent, gArenaSt.player_is_magic);

    max = gArenaSt.player_power_ranking > gArenaSt.opponent_power_ranking
        ? gArenaSt.player_power_ranking
        : gArenaSt.opponent_power_ranking;

    diff = ABS(gArenaSt.player_power_ranking - gArenaSt.opponent_power_ranking);

    if (((diff * 100) / max) <= 20)
        return 0;

    if (gArenaSt.player_power_ranking < gArenaSt.opponent_power_ranking)
    {
        if (gArenaSt.opponent->maxHP != 0)
        {
            gArenaSt.opponent->maxHP -= 1;
            gArenaSt.opponent->curHP -= 1;
        }

        if (gArenaSt.opponent->pow != 0)
            gArenaSt.opponent->pow -= 1;

        if (gArenaSt.opponent->skl != 0)
            gArenaSt.opponent->skl -= 1;

        if (gArenaSt.opponent->spd != 0)
            gArenaSt.opponent->spd -= 1;

        if (gArenaSt.opponent->def != 0)
            gArenaSt.opponent->def -= 1;

        if (gArenaSt.opponent->res != 0)
            gArenaSt.opponent->res -= 1;

        if (gArenaSt.opponent->lck != 0)
            gArenaSt.opponent->lck -= 1;
    }
    else
    {
        if (gArenaSt.opponent->maxHP < 80)
        {
            gArenaSt.opponent->maxHP += 2;
            gArenaSt.opponent->curHP += 2;
        }

        if (gArenaSt.opponent->pow < 30)
            gArenaSt.opponent->pow += 1;

        if (gArenaSt.opponent->skl < 30)
            gArenaSt.opponent->skl += 1;

        if (gArenaSt.opponent->spd < 30)
            gArenaSt.opponent->spd += 1;

        if (gArenaSt.opponent->def < 30)
            gArenaSt.opponent->def += 1;

        if (gArenaSt.opponent->res < 30)
            gArenaSt.opponent->res += 1;

        if (gArenaSt.opponent->lck < 30)
            gArenaSt.opponent->lck += 1;
    }

    return 1;
}

void ArenaGenerateMatchupGoldValue(void)
{
    int value;

    value = gArenaSt.opponent_power_ranking - gArenaSt.player_power_ranking;
    value = 800 + 10 * (value / 2);

    if (value < 1)
        value = 1;

    gArenaSt.matchup_gold_value = value;
}

int ArenaGetMatchupGoldValue(void)
{
    return gArenaSt.matchup_gold_value;
}

int ArenaGetResult(void)
{
    return gArenaSt.result;
}

void ArenaSetResult(int result)
{
    gArenaSt.result = result;
}

void ArenaContinueBattle(void)
{
    int resumedFlag = gBmSt.just_resumed;

    gActionSt.extra = gBattleTarget.unit.curHP;

    gActionSt.suspend_point = SUSPEND_POINT_DURING_ARENA;
    WriteSuspendSave(3);

    BattleUnwind();

    if (gBattleTarget.unit.curHP == 0)
        BattleApplyExpGains();

    UpdateUnitDuringBattle(gArenaSt.player, &gBattleActor);

    if (!(resumedFlag) || (gBattleTarget.unit.curHP == 0))
        PidStatsRecordBattleRes();
}

s8 ArenaIsUnitAllowed(struct Unit * unit)
{
    if (unit->statusIndex == UNIT_STATUS_SILENCED)
        return 0;

    if (GetUnitBestWRankType(unit) < 0)
        return 0;

    return 1;
}

void ArenaSetFallbackWeaponForUnit(struct Unit * unit, u16 * pItem)
{
    int i;
    u8 arenaWeapons[8];
    memcpy(arenaWeapons, gArenaBaseWeapons, sizeof(arenaWeapons));

    if (CanUnitUseWeapon(unit, *pItem) != 0)
        return;

    for (i = 0; i < 8; i++)
    {
        if (unit->pClassData->baseRanks[i] != 0)
        {
            *pItem = MakeNewItem(arenaWeapons[i]);
            return;
        }
    }
}

void ArenaSetFallbackWeaponsMaybe(void)
{
    ArenaSetFallbackWeaponForUnit(gArenaSt.player, &gArenaSt.player_weapon);
    ArenaSetFallbackWeaponForUnit(gArenaSt.opponent, &gArenaSt.opponent_weapon);
}
