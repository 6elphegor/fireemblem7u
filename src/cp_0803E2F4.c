#include "gbafe.h"
#include "gbafe/bmtarget.h"
#include "gbafe/cp_common.h"

#define gMapRangeSigned ((s8 **) gBmMapRange)
#define gMapMovementSigned ((s8 **) gBmMapMovement)

struct AiEscapePt
{
    /* 00 */ u8 x, y;
    /* 02 */ u8 facing;
};

struct AiHealThreshold
{
    /* 00 */ u8 exitThreshold;
    /* 01 */ u8 enterThreshold;
};

struct AiCountEnemiesInRangeArg
{
    /* 00 */ u8 move_coeff_q4;
    /* 01 */ u8 attack_range; // move range if 0, attack range otherwise
    /* 02 */ u8 result_slot;
};

extern u8 gAiUnk_0203A988;
extern const struct AiEscapePt * CONST_DATA gRedAiEscapePoints[];
extern const struct AiEscapePt * CONST_DATA gGreenAiEscapePoints[];
extern struct AiHealThreshold CONST_DATA gAI3HealingThresholdTable[];
extern const struct Vec2 ** CONST_DATA gAiSpecificPositionLists;
extern u8 CONST_DATA sTerrainList_Fort[];

const struct AiEscapePt * GetEscapePointStructThingMaybe(void);

void AiRefreshDangerMap(void)
{
    if ((u8) gAiState.dangerMapFilled == 0)
    {
        gAiState.dangerMapFilled = 1;

        BmMapFillg(gBmMapOther, 0);
        AiFillDangerMap();
    }
}

void AiFillDangerMap(void)
{
    int ix;
    int iy;
    int i;
    int j;

    u16 item = 0;
    u8 might = 0;

    for (i = 1; i < 0xC0; i++)
    {
        u16 itemTmp;

        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & (US_HIDDEN | US_DEAD | US_NOT_DEPLOYED | US_BIT16))
            continue;

        if (AreUnitIdsAllied(gActiveUnitId, unit->index))
            continue;

        // BUG: Item is never re-initialized in the loop

        for (j = 0; (j < UNIT_ITEM_COUNT) && (itemTmp = unit->items[j]); j++)
        {
            if (!CanUnitUseWeapon(unit, itemTmp))
                continue;

            if (GetItemMight(itemTmp) > might)
            {
                item = itemTmp;
                might = GetItemMight(itemTmp);
            }
        }

        if (item == 0)
            continue;

        if (!AiCouldReachByBirdsEyeDistance(gActiveUnit, unit, item))
            continue;

        AiMakeMoveRangeMapsForUnitAndWeapon(unit, item);

        for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
        {
            for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
            {
                if (gMapRangeSigned[iy][ix] == 0)
                    continue;

                gBmMapOther[iy][ix] += (GetUnitPower(unit) + might) >> 1;
            }
        }
    }
}

s8 AiCheckDangerAt(int x, int y, u8 threshold)
{
    if (gBmMapOther[y][x] > threshold)
        return 0;

    return 1;
}

s8 AiTryGetNearestHealPoint(struct Vec2 * out)
{
    struct Unit * unit;

    int ix;
    int iy;

    int currentCount = 10000;
    int currentMove = 0xff;

    if (gActiveUnit->ai3And4 & AI_UNIT_CONFIG_FLAG_STAY)
        return 0;

    if (UNIT_CATTRIBUTES(gActiveUnit) & CA_LORD)
        return 0;

    MapFloodUnitMovement(gActiveUnit, MAP_MOVEMENT_EXTENDED);

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
        {
            int count;

            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX)
                continue;

            if (!AiIsInByteList(sTerrainList_Fort, gBmMapTerrain[iy][ix]))
            {
                if ((gBmMapUnit[iy][ix] == 0) || !AreUnitIdsAllied(gActiveUnitId, gBmMapUnit[iy][ix]))
                    continue;

                unit = GetUnit(gBmMapUnit[iy][ix]);

                if (!(unit->aiFlags & AI_UNIT_FLAG_2))
                    continue;
            }
            else
            {
                if (gBmMapUnit[iy][ix] != 0)
                {
                    if (!AreUnitIdsAllied(gActiveUnitId, gBmMapUnit[iy][ix]))
                        continue;

                    unit = GetUnit(gBmMapUnit[iy][ix]);

                    if (unit->ai3And4 & AI_UNIT_CONFIG_FLAG_STAY)
                    {
                        if (!(unit->aiFlags & AI_UNIT_FLAG_2))
                            continue;
                    }
                }
            }

            count = AiCountNearbyEnemyUnits(ix, iy);

            if ((count <= currentCount) && (gMapMovementSigned[iy][ix] <= currentMove))
            {
                currentCount = count;
                currentMove = gBmMapMovement[iy][ix];
                out->x = ix;
                out->y = iy;
            }
        }
    }

    if (currentMove != 0xff)
    {
        if ((gBmMapUnit[out->y][out->x] != 0) && (gBmMapUnit[out->y][out->x] != gActiveUnitId))
        {
            unit = GetUnit(gBmMapUnit[out->y][out->x]);
            unit->aiFlags |= AI_UNIT_FLAG_1;
        }

        return 1;
    }

    return 0;
}

void AiUpdateUnitsSeekHealing(void)
{
    int i;

    u8 faction = gPlaySt.faction;

    int factionUnitCountLut[3] = {
        [FACTION_ID_BLUE]  = 62,
        [FACTION_ID_GREEN] = 20,
        [FACTION_ID_RED]   = 50
    };

    for (i = 0; i < factionUnitCountLut[faction >> 6]; i++)
    {
        struct Unit * unit = GetUnit(faction + i + 1);

        if (!UNIT_IS_VALID(unit))
            continue;

        AiUpdateGetUnitIsHealing(unit);
    }
}

s8 AiUpdateGetUnitIsHealing(struct Unit * unit)
{
    u16 hpPercentage = Div(GetUnitCurrentHp(unit) * 100, GetUnitMaxHp(unit));

    if (unit->aiFlags & AI_UNIT_FLAG_0)
    {
        if (gAI3HealingThresholdTable[unit->ai3And4 & AI_UNIT_CONFIG_HEALTHRESHOLD_MASK].exitThreshold > hpPercentage)
        {
            return 1;
        }
        else
        {
            unit->aiFlags &= ~AI_UNIT_FLAG_0;
            return 0;
        }
    }
    else
    {
        if (gAI3HealingThresholdTable[unit->ai3And4 & AI_UNIT_CONFIG_HEALTHRESHOLD_MASK].enterThreshold > hpPercentage)
        {
            unit->aiFlags |= AI_UNIT_FLAG_0;
            return 1;
        }
        else
        {
            return 0;
        }
    }
}

s8 AiTryHealSelf(void)
{
    int i;

    for (i = 0; i < UNIT_ITEM_COUNT; i++)
    {
        u16 item = gActiveUnit->items[i];

        if (item == 0)
            return 0;

        if (GetItemIndex(item) == ITEM_VULNERARY || GetItemIndex(item) == ITEM_ELIXIR)
        {
            if (!(gAiState.flags & AI_FLAG_STAY) && !(gActiveUnit->ai3And4 & AI_UNIT_CONFIG_FLAG_STAY))
            {
                struct Vec2 position;

                if (AiFindSafestReachableLocation(gActiveUnit, &position) == TRUE)
                {
                    AiSetDecision(position.x, position.y, AI_ACTION_USEITEM, 0, i, 0, 0);
                    return TRUE;
                }
            }
            else
            {
                AiSetDecision(gActiveUnit->xPos, gActiveUnit->yPos, AI_ACTION_USEITEM, 0, i, 0, 0);
                return TRUE;
            }
        }
    }

    return FALSE;
}

s8 AiTryMoveTowardsEscape(void)
{
    const struct AiEscapePt * escapePoint;

    MapFloodUnitMovement(gActiveUnit, MAP_MOVEMENT_EXTENDED);
    escapePoint = GetEscapePointStructThingMaybe();

    if (escapePoint != NULL)
    {
        if (gMapMovementSigned[escapePoint->y][escapePoint->x] <= UNIT_MOV(gActiveUnit))
        {
            AiTryMoveTowards(escapePoint->x, escapePoint->y, 0, -1, 1);
            AiSetDecision(gAiDecision.xMove, gAiDecision.yMove, AI_ACTION_ESCAPE, escapePoint->x, escapePoint->y, escapePoint->facing, 0);

            return 1;
        }
        else
        {
            AiTryMoveTowards(escapePoint->x, escapePoint->y, 0, -1, 0);
            return gAiDecision.actionPerformed;
        }
    }

    return 0;
}

const struct AiEscapePt * GetEscapePointStructThingMaybe(void)
{
    int i = 0;

    const struct AiEscapePt * list = NULL;
    const struct AiEscapePt * result = NULL;

    int chapter = gPlaySt.chapterIndex;

    u8 resultMove = 0xFF;

    switch (gPlaySt.faction)
    {
    case FACTION_BLUE:
        return NULL;

    case FACTION_RED:
        list = gRedAiEscapePoints[chapter];
        break;

    case FACTION_GREEN:
        list = gGreenAiEscapePoints[chapter];
        break;
    }

    for (; list[i].x != 0xFF; i++)
    {
        if (gBmMapMovement[list[i].y][list[i].x] > MAP_MOVEMENT_MAX)
            continue;

        if (resultMove > gMapMovementSigned[list[i].y][list[i].x])
        {
            resultMove = gMapMovementSigned[list[i].y][list[i].x];
            result = list + i;
        }
    }

    return result;
}

s8 AiCanEquip(void)
{
    if (gActiveUnit->state & US_CANTOING)
        return 0;

    if (gAiDecision.actionId == AI_ACTION_COMBAT)
        return 0;

    if (gActiveUnit->statusIndex == UNIT_STATUS_BERSERK)
        return 0;

    return 1;
}

s8 AiEquipGetFlags(u16 * out)
{
    int i;
    u32 perc;

    if (GetUnitItemCount(gActiveUnit) == 0)
        return 0;

    for (i = 0; i < UNIT_ITEM_COUNT; i++)
    {
        u16 item;
        out[i] = 0;

        item = gActiveUnit->items[i];

        if (item == 0)
            break;

        if (!(GetItemAttributes(item) & (IA_WEAPON | IA_STAFF)))
            continue;

        if (GetItemAttributes(item) & IA_LOCK_3)
            continue;

        if (!CanUnitUseWeapon(gActiveUnit, item) && !CanUnitUseStaff(gActiveUnit, item))
            continue;

        if (GetItemAttributes(item) & IA_WEAPON)
        {
            if (GetItemMinRange(item) > 1)
                out[i] |= 2;

            if (GetItemMaxRange(item) == 1)
                out[i] |= 1;

            perc = Div(perc = GetItemUses(item) * 100, GetItemMaxUses(item));

            if (perc <= 10)
                out[i] |= 4;
        }
        else
        {
            sub_08039CCC(item);
            out[i] |= 8;
        }

        out[i] |= (GetItemMight(item) << 8);
    }
}

void AiEquipGetDanger(int x, int y, u16 * range_danger_out, u16 * melee_danger_out, u16 * combined_danger_out)
{
    int i;
    int might;
    int iy, ix;
    u16 item;

    *combined_danger_out = 0;
    *melee_danger_out = 0;
    *range_danger_out = 0;

    BmMapFillg(gBmMapOther, 0);

    for (i = 1; i < 0xC0; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & (US_HIDDEN | US_RESCUED))
            continue;

        if (AreUnitIdsAllied(gActiveUnitId, unit->index))
            continue;

        if (!AiIsWithinFlyingDistance(unit, x, y))
            continue;

        RevertMapChange(unit);

        if (gBmMapMovement[y][x] == 0xFF)
            continue;

        might = StoreItemAndGetUnitAttack(unit, &item);

        if (GetItemMinRange(item) > 1)
            *range_danger_out += might;

        if (GetItemMaxRange(item) == 1)
            *melee_danger_out += might;

        for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
        {
            for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
            {
                if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX)
                    continue;

                if (gBmMapOther[iy][ix] + might <= 0xFF)
                    gBmMapOther[iy][ix] = gBmMapOther[iy][ix] + might;
                else
                    gBmMapOther[iy][ix] = 0xFF;
            }
        }
    }
    *combined_danger_out = *range_danger_out + *melee_danger_out;
}

void AiEquipBestMatch(int equip_flag, u16 * equip_flags)
{
    int i;

    int itemSlot = -1;
    u16 unk = 0;

    for (i = 0; i < UNIT_ITEM_COUNT; equip_flags++, i++)
    {
        if (*equip_flags == 0)
            continue;

        if (!(*equip_flags & equip_flag))
            continue;

        if ((*equip_flags & 0xff00) > unk)
        {
            unk = *equip_flags & 0xff00;
            itemSlot = i;
        }
    }

    if (itemSlot > 0)
        EquipUnitItemSlot(gActiveUnit, itemSlot);
}

void AiEquipBestConsideringDanger(u16 range_danger, u16 melee_danger, u16 combined_danger, u16 * equip_flags)
{
    if ((melee_danger + range_danger) != 0)
    {
        if (melee_danger >= range_danger)
            AiEquipBestMatch(1, equip_flags);
        else
            AiEquipBestMatch(2, equip_flags);
    }
}

void sub_08039CCC(u16 item)
{
    switch (GetItemIndex(item))
    {
    case ITEM_STAFF_HEAL:
    case ITEM_STAFF_MEND:
    case ITEM_STAFF_RECOVER:
    case ITEM_STAFF_PHYSIC:
    case ITEM_STAFF_FORTIFY:
        gActiveUnit->aiFlags |= AI_UNIT_FLAG_2;
        break;

    case ITEM_STAFF_REPAIR:
        gActiveUnit->aiFlags |= AI_UNIT_FLAG_4;
        break;
    }
}

s8 AiIsWithinFlyingDistance(struct Unit * unit, int x, int y)
{
    int mov = UNIT_MOV(unit);
    int dist = RECT_DISTANCE(x, y, unit->xPos, unit->yPos);

    if (mov >= dist)
        return 1;

    return 0;
}

int StoreItemAndGetUnitAttack(struct Unit * unit, u16 * itemOut)
{
    u16 item = GetUnitEquippedWeapon(unit);
    *itemOut = item;
    return GetUnitPower(unit) + GetItemMight(item);
}

void AiTryDanceOrStealAfterMove(void)
{
    if (gAiDecision.actionId == AI_ACTION_ESCAPE)
        return;

    if (AiTryDoDanceAdjacent(gAiDecision.xMove, gAiDecision.yMove) == 1)
        return;

    AiTryDoStealAdjacent(gAiDecision.xMove, gAiDecision.yMove);
}

void AiTryActionAfterMove(void)
{
    if (AiTryDoDanceAdjacent(gAiDecision.xMove, gAiDecision.yMove) == 1)
        return;

    if (AiTryDoStealAdjacent(gAiDecision.xMove, gAiDecision.yMove) == 1)
        return;

    sub_08039F60(gAiDecision.xMove, gAiDecision.yMove);
}

s8 AiTryDoDanceAdjacent(int x, int y)
{
    int ix;
    int iy;

    u8 level = 0;
    u8 target = 0;

    if (!(UNIT_CATTRIBUTES(gActiveUnit) & (CA_DANCE | CA_PLAY)))
        return 0;

    BmMapFillg(gBmMapMovement, -1);

    MapAddInRange(x, y, 1, 1);

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
        {
            struct Unit * unit;

            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX)
                continue;

            if (gBmMapUnit[iy][ix] == 0)
                continue;

            if (!AreUnitIdsAllied(gActiveUnitId, gBmMapUnit[iy][ix]))
                continue;

            unit = GetUnit(gBmMapUnit[iy][ix]);

            if (UNIT_CATTRIBUTES(unit) & (CA_DANCE | CA_PLAY))
                continue;

            if (level < unit->level)
            {
                level = unit->level;
                target = gBmMapUnit[iy][ix];
            }
        }
    }

    if (level != 0)
    {
        AiSetDecision(x, y, AI_ACTION_REFRESH, target, 0, 0, 0);
        return 1;
    }

    return 0;
}

s8 AiTryDoStealAdjacent(int x, int y)
{
    if (!(UNIT_CATTRIBUTES(gActiveUnit) & CA_STEAL))
        return 0;

    BmMapFillg(gBmMapMovement, -1);

    gBmMapMovement[y][x] = 0;
    MapAddInRange(x, y, 1, MAP_MOVEMENT_MAX);

    if (AiAttemptStealActionWithinMovement() != -1)
        return 1;

    return 0;
}

s8 sub_08039F60(int x, int y)
{
    int ix;
    int iy;

    u16 item = GetUnitEquippedWeapon(gActiveUnit);
    if (item == 0)
        return 0;

    BmMapFillg(gBmMapMovement, 0);

    MapAddInBoundedRange(x, y, GetItemMinRange(item), GetItemMaxRange(item));

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
        {
            struct Unit * unit;

            if (gMapMovementSigned[iy][ix] == 0)
                continue;

            if (gBmMapUnit[iy][ix] == 0)
                continue;

            if (AreUnitIdsAllied(gActiveUnitId, gBmMapUnit[iy][ix]) == 1)
                continue;

            unit = GetUnit(gBmMapUnit[iy][ix]);

            if (AiGetInRangeCombatPositionScoreComponent(x, y, unit))
            {
                AiSetDecision(x, y, AI_ACTION_COMBAT, unit->index, GetUnitEquippedWeaponSlot(gActiveUnit), 0, 0);
                return 1;
            }
        }
    }

    return 0;
}

ASM_FUNC("asm/nonmatching/code_0803A090.s");
ASM_FUNC("asm/nonmatching/code_0803A0C0.s");
ASM_FUNC("asm/nonmatching/code_0803A204.s");
ASM_FUNC("asm/nonmatching/code_0803A3D4.s");
ASM_FUNC("asm/nonmatching/code_0803A3F0.s");
ASM_FUNC("asm/nonmatching/code_0803A420.s");
ASM_FUNC("asm/nonmatching/code_0803A450.s");
ASM_FUNC("asm/nonmatching/code_0803A4D8.s");
ASM_FUNC("asm/nonmatching/code_0803A548.s");
ASM_FUNC("asm/nonmatching/code_0803A58C.s");
ASM_FUNC("asm/nonmatching/code_0803A5BC.s");
ASM_FUNC("asm/nonmatching/code_0803A680.s");
ASM_FUNC("asm/nonmatching/code_0803A6BC.s");
ASM_FUNC("asm/nonmatching/code_0803A71C.s");
ASM_FUNC("asm/nonmatching/code_0803A754.s");
ASM_FUNC("asm/nonmatching/code_0803A7C8.s");
ASM_FUNC("asm/nonmatching/code_0803A828.s");
ASM_FUNC("asm/nonmatching/code_0803A874.s");
ASM_FUNC("asm/nonmatching/code_0803A8C4.s");
ASM_FUNC("asm/nonmatching/code_0803AA40.s");
ASM_FUNC("asm/nonmatching/code_0803AA60.s");
