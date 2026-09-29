#include "gbafe.h"
#include "gbafe/spellassoc.h"

extern s16 gEkrInitialHitSide;
extern u16 gAnimRoundData[20];
extern u16 gEfxHpLut[22];
extern s16 gBanimPositionIsEnemy[2];
extern s16 gEkrGaugeHp[2];
extern s16 gBanimMaxHP[2];

extern u16 const gUnk_081D8508[];
extern u16 const gUnk_081D8512[];
extern u16 const gUnk_081D851C[];
extern u16 const gUnk_081D8526[];
extern u16 const gUnk_081D8530[];
extern u16 const gUnk_081D853A[];
extern u16 const gUnk_081D8544[];
extern u16 const gUnk_081D854E[];
extern u16 const gUnk_081D8558[];
extern u16 const gUnk_081D8562[];

extern CONST_DATA s8 BanimTerrainGroundDefault[];
extern CONST_DATA s8 BanimTerrainGround_Tileset01[];
extern CONST_DATA s8 BanimTerrainGround_Tileset02[];
extern CONST_DATA s8 BanimTerrainGround_Tileset03[];
extern CONST_DATA s8 BanimTerrainGround_Tileset04[];
extern CONST_DATA s8 BanimTerrainGround_Tileset05[];
extern CONST_DATA s8 BanimTerrainGround_Tileset06[];
extern CONST_DATA s8 BanimTerrainGround_Tileset07[];
extern CONST_DATA s8 BanimTerrainGround_Tileset08[];
extern CONST_DATA s8 BanimTerrainGround_Tileset09[];
extern CONST_DATA s8 BanimTerrainGround_Tileset0A[];
extern CONST_DATA s8 BanimTerrainGround_Tileset0B[];
extern CONST_DATA s8 BanimTerrainGround_Tileset0C[];
extern CONST_DATA s8 BanimTerrainGround_Tileset0D[];
extern CONST_DATA s8 BanimTerrainGround_Tileset0E[];

extern CONST_DATA s8 gBanimBGLutDefault[];
extern CONST_DATA s8 gBanimBGLut01[];
extern CONST_DATA s8 gBanimBGLut02[];
extern CONST_DATA s8 gBanimBGLut03[];
extern CONST_DATA s8 gBanimBGLut04[];
extern CONST_DATA s8 gBanimBGLut05[];
extern CONST_DATA s8 gBanimBGLut06[];
extern CONST_DATA s8 gBanimBGLut07[];
extern CONST_DATA s8 gBanimBGLut08[];
extern CONST_DATA s8 gBanimBGLut09[];
extern CONST_DATA s8 gBanimBGLut0A[];
extern CONST_DATA s8 gBanimBGLut0B[];
extern CONST_DATA s8 gBanimBGLut0C[];
extern CONST_DATA s8 gBanimBGLut0D[];
extern CONST_DATA s8 gBanimBGLut0E[];

static inline s8 _GetBanimTerrainGround(u16 terrain, u16 tileset)
{
    switch (tileset)
    {
    case 0x01:
        return BanimTerrainGround_Tileset01[terrain];

    case 0x02:
        return BanimTerrainGround_Tileset02[terrain];

    case 0x03:
        return BanimTerrainGround_Tileset03[terrain];

    case 0x04:
        return BanimTerrainGround_Tileset04[terrain];

    case 0x05:
        return BanimTerrainGround_Tileset05[terrain];

    case 0x06:
        return BanimTerrainGround_Tileset06[terrain];

    case 0x07:
        return BanimTerrainGround_Tileset07[terrain];

    case 0x08:
        return BanimTerrainGround_Tileset08[terrain];

    case 0x09:
        return BanimTerrainGround_Tileset09[terrain];

    case 0x0A:
        return BanimTerrainGround_Tileset0A[terrain];

    case 0x0B:
        return BanimTerrainGround_Tileset0B[terrain];

    case 0x0C:
        return BanimTerrainGround_Tileset0C[terrain];

    case 0x0D:
        return BanimTerrainGround_Tileset0D[terrain];

    case 0x0E:
        return BanimTerrainGround_Tileset0E[terrain];

    case 0:
    default:
        return BanimTerrainGroundDefault[terrain];
    }
}

int GetBanimTerrainGround(u16 terrain, u16 tileset)
{
    int ret = _GetBanimTerrainGround(terrain, tileset);
    return ret - 1;
}

int GetBanimBackgroundIndex(u16 terrain, u16 tileset)
{
    switch (tileset)
    {
    case 0x01:
        return gBanimBGLut01[terrain];

    case 0x02:
        return gBanimBGLut02[terrain];

    case 0x03:
        return gBanimBGLut03[terrain];

    case 0x04:
        return gBanimBGLut04[terrain];

    case 0x05:
        return gBanimBGLut05[terrain];

    case 0x06:
        return gBanimBGLut06[terrain];

    case 0x07:
        return gBanimBGLut07[terrain];

    case 0x08:
        return gBanimBGLut08[terrain];

    case 0x09:
        return gBanimBGLut09[terrain];

    case 0x0A:
        return gBanimBGLut0A[terrain];

    case 0x0B:
        return gBanimBGLut0B[terrain];

    case 0x0C:
        return gBanimBGLut0C[terrain];

    case 0x0D:
        return gBanimBGLut0D[terrain];

    case 0x0E:
        return gBanimBGLut0E[terrain];

    case 0:
    default:
        return gBanimBGLutDefault[terrain];
    }
}

s16 GetSpellAnimId(u16 jid, u16 weapon)
{
    u16 ret;
    u16 item = GetItemIndex(weapon);
    const struct SpellAssoc * it;

    for (it = gSpellAssocData; it->item != 0xFFFF; it++)
    {
        if (it->item == item)
            break;
    }

    ret = it->efx;

    if (it->efx == 3)
    {
        switch (jid)
        {
        case 0x28:
        case 0x29:
            ret = 4;
            break;

        case 0x38:
            ret = 5;
            break;

        case 0x07:
            ret = 0xC;
            break;

        case 0x2A:
            ret = 0x6;
            break;

        case 0x2B:
            ret = 0xD;
            break;

        case 0x32:
            ret = 0x7;
            break;

        case 0x33:
            ret = 0x8;
            break;

        case 0x34:
        case 0x35:
            ret = 0x9;
            break;

        case 0x36:
        case 0x37:
            ret = 0xA;
            break;

        case 0x16:
        case 0x17:
            ret = 0xB;
            break;

        default:
            break;
        }
    }

    return ret;
}

void UnsetMapStaffAnim(s16 * out, u16 pos, u16 weapon)
{
    u16 item = GetItemIndex(weapon);

    if (*out == -1)
        *out = 0;

    if (gEkrInitialHitSide == pos)
        return;

    switch (item)
    {
    case ITEM_STAFF_WARP:
    case ITEM_STAFF_RESCUE:
    case ITEM_STAFF_TORCH:
    case ITEM_STAFF_UNLOCK:
        *out = 0;
    }
}

#define ANIM_REF_OFFSET(off_ref_round, off_ref_pos) ((off_ref_round) * 2 + off_ref_pos)

void ParseBattleHitToBanimCmd(void)
{
    u32 i;
    struct BattleHit * hit;
    u16 r9;
    u16 r10;
    u16 sp00[2];
    struct BattleUnit * bul_sp04;
    struct BattleUnit * bur_sp08;
    s32 round_sp0C;
    s32 is_enemy;
    s32 distance_sp14;
    s32 distance_sp18;
    s16 distance_sp1C;
    s32 is_dark_breath;

    hit = gBattleHitArray;

    for (i = 0; i < 20; i++)
        gAnimRoundData[i] |= 0xFFFF;

    for (i = 0; i < 20; i++)
        gEfxHpLut[2 + i] |= 0xFFFF;

    gpEkrTriangleUnits[0] = gpEkrTriangleUnits[1] = NULL;

    if (gEkrDistanceType == EKR_DISTANCE_PROMOTION)
    {
        gAnimRoundData[0] = 4;
        gAnimRoundData[1] = 4;
        return;
    }

    if (gBattleStats.config & BATTLE_CONFIG_REFRESH)
    {
        gAnimRoundData[0] = 6;
        gAnimRoundData[1] = 0;
        return;
    }

    distance_sp14 = (u16) gEkrDistanceType;
    distance_sp18 = distance_sp14;

    is_dark_breath = false;

    bul_sp04 = gpEkrBattleUnitLeft;
    bur_sp08 = gpEkrBattleUnitRight;

    if (GetItemIndex(bul_sp04->weaponBefore) == 0x11 && distance_sp14 == EKR_DISTANCE_CLOSE)
        distance_sp14 = EKR_DISTANCE_FAR;
    if (GetItemIndex(bur_sp08->weaponBefore) == 0x11 && distance_sp18 == EKR_DISTANCE_CLOSE)
        distance_sp18 = EKR_DISTANCE_FAR;

    if (GetItemIndex(bul_sp04->weaponBefore) == 0x28 && distance_sp14 == EKR_DISTANCE_CLOSE)
        distance_sp14 = EKR_DISTANCE_FAR;
    if (GetItemIndex(bur_sp08->weaponBefore) == 0x28 && distance_sp18 == EKR_DISTANCE_CLOSE)
        distance_sp18 = EKR_DISTANCE_FAR;

    if (GetItemIndex(bul_sp04->weaponBefore) == 0x29 && distance_sp14 == EKR_DISTANCE_CLOSE)
        distance_sp14 = EKR_DISTANCE_FAR;
    if (GetItemIndex(bur_sp08->weaponBefore) == 0x29 && distance_sp18 == EKR_DISTANCE_CLOSE)
        distance_sp18 = EKR_DISTANCE_FAR;

    gEfxHpLut[0] = gEkrGaugeHp[0];
    gEfxHpLut[1] = gEkrGaugeHp[1];

    round_sp0C = 0;
    r10 = 0;
    r9 = 0;

    for (; !(hit->info & BATTLE_HIT_INFO_END); hit++, round_sp0C++)
    {
        s16 r3;
        s16 distance_r4;
        u16 * r5;
        struct Unit * unit_r6;
        u16 * r8;

        if (hit->info & BATTLE_HIT_INFO_RETALIATION)
            is_enemy = true;
        else
            is_enemy = false;

        if (gBanimPositionIsEnemy[EKR_POS_L] == is_enemy)
        {
            r5 = &sp00[EKR_POS_L];
            r8 = &sp00[EKR_POS_R];
            distance_r4 = distance_sp14;
            distance_sp1C = distance_sp18;
            unit_r6 = &bul_sp04->unit;
            r3 = is_dark_breath;

            if (round_sp0C == 0)
                gEkrInitialHitSide = EKR_POS_L;
        }
        else
        {
            r5 = &sp00[EKR_POS_R];
            r8 = &sp00[EKR_POS_L];
            distance_r4 = distance_sp18;
            distance_sp1C = distance_sp14;
            unit_r6 = &bur_sp08->unit;
            r3 = 0;

            if (round_sp0C == 0)
                gEkrInitialHitSide = EKR_POS_R;
        }

        if (hit->attributes & BATTLE_HIT_ATTR_TATTACK)
        {
            gpEkrTriangleUnits[0] = gBattleStats.taUnitA;
            gpEkrTriangleUnits[1] = gBattleStats.taUnitB;
        }

        if (hit->attributes & BATTLE_HIT_ATTR_CRIT)
        {
            if (!UnitHasMagicRank(unit_r6))
                *r5 = gUnk_081D851C[distance_r4];
            else
                *r5 = gUnk_081D8544[distance_r4];
        }
        else if (hit->attributes & BATTLE_HIT_ATTR_SILENCER)
        {
            if (!UnitHasMagicRank(unit_r6))
                *r5 = gUnk_081D851C[distance_r4];
            else
                *r5 = gUnk_081D8544[distance_r4];
        }
        else if (r3 >= 0)
        {
            if (!UnitHasMagicRank(unit_r6))
                *r5 = gUnk_081D8508[distance_r4];
            else
                *r5 = gUnk_081D853A[distance_r4];
        }
        else
        {
            switch (sub_080672E8(2))
            {
            case 0:
                *r5 = gUnk_081D854E[distance_r4];
                break;

            case 1:
                *r5 = gUnk_081D8558[distance_r4];
                break;

            case 2:
                *r5 = gUnk_081D8562[distance_r4];
                break;

            default:
                break;
            }
        }

        if (hit->attributes & BATTLE_HIT_ATTR_MISS)
        {
            if (!UnitHasMagicRank(unit_r6))
                *r5 = gUnk_081D8512[distance_r4];
            else
                *r5 = gUnk_081D853A[distance_r4];

            *r8 = gUnk_081D8526[distance_sp1C];
        }
        else
        {
            *r8 = gUnk_081D8530[distance_sp1C];
        }

        gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, EKR_POS_L)] = sp00[EKR_POS_L];
        r8 = sp00;
        gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, EKR_POS_R)] = r8[sp00 - r8 + EKR_POS_R];

        if (!(hit->attributes & BATTLE_HIT_ATTR_MISS))
        {
            s16 new_hp;

            if (hit->attributes & BATTLE_HIT_ATTR_DEVIL)
            {
                if (gBanimPositionIsEnemy[EKR_POS_L] == is_enemy)
                {
                    new_hp = GetEfxHp(ANIM_REF_OFFSET(r9, EKR_POS_L)) - (s8) hit->hpChange;
                    if (new_hp < 0)
                        new_hp = 0;

                    r9++;
                    gEfxHpLut[ANIM_REF_OFFSET(r9, EKR_POS_L)] = new_hp;
                    gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, EKR_POS_L)] = (s16) gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, EKR_POS_L)] | ANIM_ROUND_DEVIL;
                }
                else
                {
                    new_hp = GetEfxHp(ANIM_REF_OFFSET(r10, EKR_POS_R)) - (s8) hit->hpChange;
                    if (new_hp < 0)
                        new_hp = 0;

                    r10++;
                    gEfxHpLut[ANIM_REF_OFFSET(r10, EKR_POS_R)] = new_hp;
                    gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, EKR_POS_R)] = (s16) gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, EKR_POS_R)] | ANIM_ROUND_DEVIL;
                }
            }
            else if (hit->attributes & BATTLE_HIT_ATTR_HPSTEAL)
            {
                if (gBanimPositionIsEnemy[EKR_POS_L] == is_enemy)
                {
                    new_hp = GetEfxHp(ANIM_REF_OFFSET(r10, EKR_POS_R)) - (s8) hit->hpChange;
                    if (new_hp < 0)
                        new_hp = 0;

                    r10++;
                    gEfxHpLut[ANIM_REF_OFFSET(r10, EKR_POS_R)] = new_hp;

                    new_hp = GetEfxHp(ANIM_REF_OFFSET(r9, EKR_POS_L)) + (s8) hit->hpChange;
                    if (new_hp > gBanimMaxHP[EKR_POS_L])
                        new_hp = gBanimMaxHP[EKR_POS_L];

                    r9++;
                    gEfxHpLut[ANIM_REF_OFFSET(r9, EKR_POS_L)] = new_hp;
                }
                else
                {
                    new_hp = GetEfxHp(ANIM_REF_OFFSET(r9, EKR_POS_L)) - (s8) hit->hpChange;
                    if (new_hp < 0)
                        new_hp = 0;

                    r9++;
                    gEfxHpLut[ANIM_REF_OFFSET(r9, EKR_POS_L)] = new_hp;

                    new_hp = GetEfxHp(ANIM_REF_OFFSET(r10, EKR_POS_R)) + (s8) hit->hpChange;
                    if (new_hp > gBanimMaxHP[EKR_POS_R])
                        new_hp = gBanimMaxHP[EKR_POS_R];

                    r10++;
                    gEfxHpLut[ANIM_REF_OFFSET(r10, EKR_POS_R)] = new_hp;
                }
            }
            else
            {
                if (gBanimPositionIsEnemy[EKR_POS_L] == is_enemy)
                {
                    new_hp = GetEfxHp(ANIM_REF_OFFSET(r10, EKR_POS_R)) - (s8) hit->hpChange;
                    if (new_hp < 0)
                        new_hp = 0;

                    r10++;
                    gEfxHpLut[ANIM_REF_OFFSET(r10, EKR_POS_R)] = new_hp;

                    if (hit->attributes & BATTLE_HIT_ATTR_POISON)
                        gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, EKR_POS_R)] = (s16) gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, EKR_POS_R)] | ANIM_ROUND_POISON;

                    if (hit->attributes & BATTLE_HIT_ATTR_SILENCER)
                        gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, EKR_POS_L)] = (s16) gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, EKR_POS_L)] | ANIM_ROUND_SILENCER;
                }
                else
                {
                    new_hp = GetEfxHp(ANIM_REF_OFFSET(r9, EKR_POS_L)) - (s8) hit->hpChange;
                    if (new_hp < 0)
                        new_hp = 0;

                    r9++;
                    gEfxHpLut[ANIM_REF_OFFSET(r9, EKR_POS_L)] = new_hp;

                    if (hit->attributes & BATTLE_HIT_ATTR_POISON)
                        gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, EKR_POS_L)] = (s16) gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, EKR_POS_L)] | ANIM_ROUND_POISON;

                    if (hit->attributes & BATTLE_HIT_ATTR_SILENCER)
                        gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, EKR_POS_R)] = (s16) gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, EKR_POS_R)] | ANIM_ROUND_SILENCER;
                }
            }
        }
    }
}
