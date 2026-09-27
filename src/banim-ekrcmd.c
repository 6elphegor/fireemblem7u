// banim.h declares this as returning s16, but it returns an untruncated int
#define GetBattleAnimCharacterUniquePalIndex GetBattleAnimCharacterUniquePalIndex_hdr
#include "gbafe.h"
#undef GetBattleAnimCharacterUniquePalIndex

struct UnkStruct1_sub_805893C {
    u8 _pad_[0x23];
    u8 unk23[5];
    u32 unk28;
};

struct UnkStruct2_sub_805893C {
    struct UnkStruct1_sub_805893C * unk1;
    struct UnkStruct1_sub_805893C * unk2;
};

extern u16 gUnknown_030014D8[];
extern s16 gBanimIdx[2];
extern u16 gAnimRoundData[20];
extern u16 gEfxHpLut[22];
extern int gBattleScripted;

extern u16 CONST_DATA Pal_BallistaRegular[];
extern u16 CONST_DATA Pal_BallistaLong[];
extern u16 CONST_DATA Pal_BallistaKiller[];

bool CheckBattleHasHit(void)
{
    const struct BattleHit * bh = &gBattleHitArray[0];

    if (bh->info & BATTLE_HIT_INFO_FINISHES)
        return TRUE;
    else
        return FALSE;
}

int GetBattleAnimCharacterUniquePalIndex(struct Unit * unit, int index)
{
    struct UnkStruct2_sub_805893C * arg = (void *) unit;
    u32 val;
    u16 * buf = gUnknown_030014D8;

    val = ((arg->unk1->unk28 | arg->unk2->unk28) >> 0x8) & 0x1;
    *buf = val = arg->unk1->unk23[val];
    return val - 1;
}

u16 * FilterBattleAnimCharacterPalette(s16 index, u16 item)
{
    switch (index)
    {
    case 0x8B:
        switch (GetItemIndex(item))
        {
        case 0x34:
            return Pal_BallistaRegular;

        case 0x35:
            return Pal_BallistaLong;

        case 0x36:
            return Pal_BallistaKiller;

        default:
            return NULL;
        }
        break;

    default:
        return NULL;
    }
}

int GetAllegienceId(u32 arg)
{
    u8 _arg = arg;

    switch (_arg)
    {
    case FACTION_RED:
        return 1;

    case FACTION_GREEN:
        return 2;

    case FACTION_PURPLE:
        return 3;

    case FACTION_BLUE:
        return 0;
    }

    return 0;
}

void EkrPrepareBanimfx(struct Anim * anim, u16 index)
{
    gBanimIdx[GetAnimPosition(anim)] = index;
    UpdateBanimFrame();
    SwitchAISFrameDataFromBARoundType(anim, 6);
}

s16 GetBattleAnimRoundType(int index)
{
    s16 * buf = (s16 *) gAnimRoundData;

    if (buf[index] == -1)
        return -1;
    else
        return buf[index] & 0xFFF;
}

s16 GetBattleAnimRoundTypeFlags(int index)
{
    s16 * buf = (s16 *) gAnimRoundData;

    if (buf[index] == -1)
        return 0;
    else
        return buf[index] & 0xF000;
}

s16 GetEfxHp(int index)
{
    return gEfxHpLut[index] & 0xFFF;
}

s16 GetEfxHpModMaybe(int index)
{
    s16 * buf = (s16 *) gEfxHpLut;
    return buf[index] & 0xF000;
}

u16 IsItemDisplayedInBattle(u16 item)
{
    if (GetItemIndex(item) == 0x7C)
        return TRUE;

    if (GetItemIndex(item) == 0x7D)
        return TRUE;

    if (GetItemIndex(item) == 0x7E)
        return TRUE;

    if (GetItemIndex(item) == 0x7F)
        return TRUE;

    return FALSE;
}

u16 IsWeaponLegency(u16 item)
{
    if (GetItemIndex(item) == 0x84)
        return TRUE;

    if (GetItemIndex(item) == 0x85)
        return TRUE;

    if (GetItemIndex(item) == 0x86)
        return TRUE;

    if (GetItemIndex(item) == 0x3C)
        return TRUE;

    return FALSE;
}

bool EkrCheckAttackRound(u16 round)
{
    int i;
    s16 cur;

    for (i = round; i < 0x14; i = i + 2)
    {
        cur = gAnimRoundData[i];

        if (cur == 0)
            return TRUE;

        if (cur == 1)
            return TRUE;

        if (cur == 2)
            return TRUE;

        if (cur == 3)
            return TRUE;

        if (cur == 9)
            return TRUE;
    }

    return FALSE;
}

void SetBattleScriptted(void)
{
    gBattleScripted = TRUE;
}

void SetBattleUnscriptted(void)
{
    gBattleScripted = FALSE;
}

bool CheckBattleScriptted(void)
{
    if (gBattleScripted == FALSE)
        return FALSE;
    else
        return TRUE;
}
