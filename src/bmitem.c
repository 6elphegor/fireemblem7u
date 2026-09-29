#include "gbafe.h"

char * MsgExpandWithArticle(int a, int b, s8 c);
int GetGold(void);

extern u8 CONST_DATA ItemEffectiveness_08C97ED2[];

// GetItemNameWithArticle is defined before GetItemAttributes and calls it out
// of line (the plain C reads the attributes itself: calling an inline function
// before its definition is an error with -Werror)
#if NONMATCHING
#define GetItemAttributes_NoInline(item) (GetItemData(ITEM_INDEX(item))->attributes)
#else
int GetItemAttributes_NoInline(int item) asm("GetItemAttributes");
#endif

inline const struct ItemData * GetItemData(int itemIndex)
{
    return gItemData + itemIndex;
}

inline int GetItemIndex(int item)
{
    return ITEM_INDEX(item);
}

inline char * GetItemName(int item)
{
    char * result;

    DecodeMsg(GetItemData(ITEM_INDEX(item))->nameTextId);
    result = MsgExpandWithArticle(0, 0, 0);

    return result;
}

inline char * GetItemNameWithArticle(int item, u8 capitalize)
{
    bool no_article;

    DecodeMsg(GetItemData(ITEM_INDEX(item))->nameTextId);

    no_article = FALSE;
    if (GetItemAttributes_NoInline(item) & IA_UNSELLABLE)
        no_article = TRUE;

    switch (GetItemIndex(item)) {
    case ITEM_BALLISTA_REGULAR:
    case ITEM_BALLISTA_LONG:
    case ITEM_BALLISTA_KILLER:
        no_article = TRUE;
    }

    return MsgExpandWithArticle(1, no_article, capitalize);
}

inline int GetItemDescMsg(int item)
{
    return GetItemData(ITEM_INDEX(item))->descTextId;
}

inline int GetItemUseDescId(int item)
{
    return GetItemData(ITEM_INDEX(item))->useDescTextId;
}

inline int GetItemType(int item)
{
    if (!item)
        return 0xFF;

    return GetItemData(ITEM_INDEX(item))->weaponType;
}

inline int GetItemAttributes(int item)
{
    return GetItemData(ITEM_INDEX(item))->attributes;
}

inline int GetItemUses(int item)
{
    if (GetItemAttributes(item) & IA_UNBREAKABLE)
        return 0xFF;
    else
        return ITEM_USES(item);
}

inline int GetItemMaxUses(int item)
{
    if (GetItemAttributes(item) & IA_UNBREAKABLE)
        return 0xFF;
    else
        return GetItemData(ITEM_INDEX(item))->maxUses;
}

inline int GetItemMight(int item)
{
    return GetItemData(ITEM_INDEX(item))->might;
}

inline int GetItemHit(int item)
{
    return GetItemData(ITEM_INDEX(item))->hit;
}

inline int GetItemWeight(int item)
{
    return GetItemData(ITEM_INDEX(item))->weight;
}

inline int GetItemCrit(int item)
{
    return GetItemData(ITEM_INDEX(item))->crit;
}

inline int GetItemCost(int item)
{
    if (GetItemAttributes(item) & IA_UNBREAKABLE)
        return GetItemData(ITEM_INDEX(item))->costPerUse;
    else
        return GetItemData(ITEM_INDEX(item))->costPerUse * GetItemUses(item);
}

inline int GetItemMinRange(int item)
{
    return GetItemData(ITEM_INDEX(item))->encodedRange >> 4;
}

inline int GetItemMaxRange(int item)
{
    return GetItemData(ITEM_INDEX(item))->encodedRange & 0xF;
}

inline int GetItemEncodedRange(int item)
{
    return GetItemData(ITEM_INDEX(item))->encodedRange;
}

inline int GetItemRequiredExp(int item)
{
    return GetItemData(ITEM_INDEX(item))->weaponRank;
}

inline const u8 * GetItemEffectiveness(int item)
{
    return GetItemData(ITEM_INDEX(item))->pEffectiveness;
}

inline const struct ItemStatBonuses * GetItemBonuses(int item)
{
    return GetItemData(ITEM_INDEX(item))->pStatBonuses;
}

inline int GetItemIconId(int item)
{
    if (!item)
        return -1;

    return GetItemData(ITEM_INDEX(item))->iconId;
}

inline int GetItemWeaponEffect(int item)
{
    return GetItemData(ITEM_INDEX(item))->weaponEffectId;
}

inline int GetItemEffect(int item)
{
    return GetItemData(ITEM_INDEX(item))->useEffectId;
}

inline int GetItemCostPerUse(int item)
{
    return GetItemData(ITEM_INDEX(item))->costPerUse;
}

inline int GetItemMaxValue(int item)
{
    return GetItemData(ITEM_INDEX(item))->costPerUse * GetItemMaxUses(item);
}

inline int GetItemAwardedExp(int item)
{
    return GetItemData(ITEM_INDEX(item))->weaponExp;
}

inline int sub_080174C0(int item)
{
    return GetItemData(ITEM_INDEX(item))->unk21;
}

int GetItemHpBonus(int item)
{
    if (!item)
        return 0;
    else {
        const struct ItemStatBonuses * statBonuses = GetItemBonuses(item);

        if (statBonuses)
            return statBonuses->hpBonus;
    }

    return 0;
}

int GetItemPowBonus(int item)
{
    if (!item)
        return 0;
    else {
        const struct ItemStatBonuses * statBonuses = GetItemBonuses(item);

        if (statBonuses)
            return statBonuses->powBonus;
    }

    return 0;
}

int GetItemSklBonus(int item)
{
    if (!item)
        return 0;
    else {
        const struct ItemStatBonuses * statBonuses = GetItemBonuses(item);

        if (statBonuses)
            return statBonuses->sklBonus;
    }

    return 0;
}

int GetItemSpdBonus(int item)
{
    if (!item)
        return 0;
    else {
        const struct ItemStatBonuses * statBonuses = GetItemBonuses(item);

        if (statBonuses)
            return statBonuses->spdBonus;
    }

    return 0;
}

int GetItemDefBonus(int item)
{
    if (!item)
        return 0;
    else {
        const struct ItemStatBonuses * statBonuses = GetItemBonuses(item);

        if (statBonuses)
            return statBonuses->defBonus;
    }

    return 0;
}

int GetItemResBonus(int item)
{
    if (!item)
        return 0;
    else {
        const struct ItemStatBonuses * statBonuses = GetItemBonuses(item);

        if (statBonuses)
            return statBonuses->resBonus;
    }

    return 0;
}

int GetItemLckBonus(int item)
{
    if (!item)
        return 0;
    else {
        const struct ItemStatBonuses * statBonuses = GetItemBonuses(item);

        if (statBonuses)
            return statBonuses->lckBonus;
    }

    return 0;
}

int MakeNewItem(int item)
{
    int uses = GetItemMaxUses(item);

    if (GetItemAttributes(item) & IA_UNBREAKABLE)
        uses = 0;

    return (uses << 8) + GetItemIndex(item);
}

bool CanUnitUseWeapon(struct Unit * unit, int item)
{
    if (item == 0)
        return FALSE;

    if (!(GetItemAttributes(item) & IA_WEAPON))
        return FALSE;

    if (GetItemAttributes(item) & IA_LOCK_ANY) {
        if ((GetItemAttributes(item) & IA_LOCK_1) && !(UNIT_CATTRIBUTES(unit) & CA_LOCK_1))
            return FALSE;

        if ((GetItemAttributes(item) & IA_LOCK_4) && !(UNIT_CATTRIBUTES(unit) & CA_LOCK_4))
            return FALSE;

        if ((GetItemAttributes(item) & IA_LOCK_5) && !(UNIT_CATTRIBUTES(unit) & CA_LOCK_5))
            return FALSE;

        if ((GetItemAttributes(item) & IA_LOCK_6) && !(UNIT_CATTRIBUTES(unit) & CA_LOCK_6))
            return FALSE;

        if ((GetItemAttributes(item) & IA_LOCK_7) && !(UNIT_CATTRIBUTES(unit) & CA_LOCK_7))
            return FALSE;

        if ((GetItemAttributes(item) & IA_LOCK_2) && !(UNIT_CATTRIBUTES(unit) & CA_LOCK_2))
            return FALSE;

        if (GetItemAttributes(item) & IA_LOCK_3) {
            if (!(UNIT_CATTRIBUTES(unit) & CA_LOCK_3))
                return FALSE;

            return TRUE;
        }

        if (GetItemAttributes(item) & IA_UNUSABLE)
            if (!(IsItemUnsealedForUnit(unit, item)))
                return FALSE;
    }

    if ((unit->statusIndex == UNIT_STATUS_SILENCED) && (GetItemAttributes(item) & IA_MAGIC))
        return FALSE;

    {
        int wRank = GetItemRequiredExp(item);
        int uRank = (unit->ranks[GetItemType(item)]);

        return (uRank >= wRank) ? TRUE : FALSE;
    }
}

bool CanUnitUseWeaponNow(struct Unit * unit, int item)
{
    if (item == 0)
        return FALSE;

    if (!(GetItemAttributes(item) & IA_WEAPON))
        return FALSE;

    if ((GetItemAttributes(item) & IA_MAGIC) && IsUnitMagicSealed(unit))
        return FALSE;

    return CanUnitUseWeapon(unit, item);
}

bool CanUnitUseStaff(struct Unit * unit, int item)
{
    if (item == 0)
        return FALSE;

    if (!(GetItemAttributes(item) & IA_STAFF))
        return FALSE;

    if (unit->statusIndex == UNIT_STATUS_SLEEP)
        return FALSE;

    if (unit->statusIndex == UNIT_STATUS_BERSERK)
        return FALSE;

    if (unit->statusIndex == UNIT_STATUS_SILENCED)
        return FALSE;

    {
        int wRank = GetItemRequiredExp(item);
        int uRank = unit->ranks[GetItemType(item)];

        return (uRank >= wRank) ? TRUE : FALSE;
    }
}

bool CanUnitUseStaffNow(struct Unit * unit, int item)
{
    if (item == 0)
        return FALSE;

    if (!(GetItemAttributes(item) & IA_STAFF))
        return FALSE;

    if (IsUnitMagicSealed(unit))
        return FALSE;

    return CanUnitUseStaff(unit, item);
}

void DrawItemMenuLine(struct Text * text, int item, bool isUsable, u16 * mapOut)
{
    Text_SetParams(text, 0, (isUsable ? TEXT_COLOR_SYSTEM_WHITE : TEXT_COLOR_SYSTEM_GRAY));
    Text_DrawString(text, GetItemName(item));

    PutText(text, mapOut + 2);

    PutNumberOrBlank(mapOut + 11, isUsable ? TEXT_COLOR_SYSTEM_BLUE : TEXT_COLOR_SYSTEM_GRAY, GetItemUses(item));

    PutIcon(mapOut, GetItemIconId(item), 0x4000);
}

void DrawItemMenuLineLong(struct Text * text, int item, bool isUsable, u16 * mapOut)
{
    Text_SetParams(text, 0, (isUsable ? TEXT_COLOR_SYSTEM_WHITE : TEXT_COLOR_SYSTEM_GRAY));
    Text_DrawString(text, GetItemName(item));

    PutText(text, mapOut + 2);

    PutNumberOrBlank(mapOut + 10, isUsable ? TEXT_COLOR_SYSTEM_BLUE : TEXT_COLOR_SYSTEM_GRAY, GetItemUses(item));
    PutNumberOrBlank(mapOut + 13, isUsable ? TEXT_COLOR_SYSTEM_BLUE : TEXT_COLOR_SYSTEM_GRAY, GetItemMaxUses(item));
    PutSpecialChar(mapOut + 11, isUsable ? TEXT_COLOR_SYSTEM_WHITE : TEXT_COLOR_SYSTEM_GRAY, TEXT_SPECIAL_SLASH);

    PutIcon(mapOut, GetItemIconId(item), 0x4000);
}

void DrawItemMenuLineNoColor(struct Text * text, int item, u16 * mapOut)
{
    Text_SetCursor(text, 0);
    Text_DrawString(text, GetItemName(item));

    PutText(text, mapOut + 2);

    PutNumberOrBlank(mapOut + 11, Text_GetColor(text), GetItemUses(item));

    PutIcon(mapOut, GetItemIconId(item), 0x4000);
}

void DrawItemStatScreenLine(struct Text * text, int item, int nameColor, u16 * mapOut)
{
    int color;

    ClearText(text);

    color = nameColor;
    Text_SetColor(text, color);

    Text_DrawString(text, GetItemName(item));

    color = (nameColor == TEXT_COLOR_SYSTEM_GRAY) ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE;
    PutSpecialChar(mapOut + 12, color, TEXT_SPECIAL_SLASH);

    color = (nameColor != TEXT_COLOR_SYSTEM_GRAY) ? TEXT_COLOR_SYSTEM_BLUE : TEXT_COLOR_SYSTEM_GRAY;
    PutNumberOrBlank(mapOut + 11, color, GetItemUses(item));
    PutNumberOrBlank(mapOut + 14, color, GetItemMaxUses(item));

    PutText(text, mapOut + 2);

    PutIcon(mapOut, GetItemIconId(item), 0x4000);
}

u16 GetItemAfterUse(int item)
{
    if (GetItemAttributes(item) & IA_UNBREAKABLE)
        return item;

    item -= (1 << 8);

    if (item < (1 << 8))
        return 0;

    return item;
}

u16 GetUnitEquippedWeapon(struct Unit * unit)
{
    int i;

    for (i = 0; i < UNIT_ITEM_COUNT; ++i)
        if (CanUnitUseWeapon(unit, unit->items[i]) == TRUE)
            return unit->items[i];

    return 0;
}

int GetUnitEquippedWeaponSlot(struct Unit * unit)
{
    int i;

    for (i = 0; i < UNIT_ITEM_COUNT; ++i)
        if (CanUnitUseWeaponNow(unit, unit->items[i]) == TRUE)
            return i;

    return -1;
}

bool IsItemCoveringRange(int item, int range)
{
    int min = GetItemMinRange(item);
    int max = GetItemMaxRange(item);

    if ((min <= range) && (range <= max))
        return TRUE;

    return FALSE;
}

void EquipUnitItemSlot(struct Unit * unit, int itemSlot)
{
    int item, i;

    item = unit->items[itemSlot];

    for (i = itemSlot; i != 0; --i)
        unit->items[i] = unit->items[i - 1];

    unit->items[0] = item;
}

bool IsItemEffectiveAgainst(u16 item, struct Unit * unit)
{
#if !PLATFORM_GBA
    // (a forecast against no unit: the GBA reads a class from the BIOS
    // region, which no effectiveness list names)
    if (unit->pClassData == NULL)
        return FALSE;
#endif
    int classId = unit->pClassData->number;
    const u8 * effList = GetItemEffectiveness(item);

    if (!effList)
        return FALSE;

    for (; *effList; ++effList)
        if (*effList == classId)
            goto check_flying_effectiveness_negation;

    return FALSE;

check_flying_effectiveness_negation:
    {
        u32 attributes;
        int i;

        if (GetItemEffectiveness(item) != ItemEffectiveness_08C97ED2)
            return TRUE;

        attributes = 0;

        for (i = 0; i < UNIT_ITEM_COUNT; ++i)
            attributes = attributes | GetItemAttributes(unit->items[i]);

        if (attributes & IA_NEGATE_FLYING)
            return FALSE;

        return TRUE;
    }
}

char * GetItemRangeString(int item)
{
    int rangeTextIdLookup[10] = {
        0x112F, 0x1130, 0x1131, 0x1132, 0x1133,
        0x1134, 0x1135, 0x1136, 0x1137, 0x1138,
    };

    switch (GetItemEncodedRange(item)) {

    case 0x10:
        return DecodeMsg(rangeTextIdLookup[0]);

    case 0x11:
        return DecodeMsg(rangeTextIdLookup[1]);

    case 0x12:
        return DecodeMsg(rangeTextIdLookup[2]);

    case 0x13:
        return DecodeMsg(rangeTextIdLookup[3]);

    case 0x22:
        return DecodeMsg(rangeTextIdLookup[4]);

    case 0x23:
        return DecodeMsg(rangeTextIdLookup[5]);

    case 0x3A:
        return DecodeMsg(rangeTextIdLookup[6]);

    case 0x3F:
        return DecodeMsg(rangeTextIdLookup[7]);

    case 0xFF:
        return DecodeMsg(rangeTextIdLookup[8]);

    default:
        return DecodeMsg(rangeTextIdLookup[9]);
    }
}

int GetWeaponLevelFromExp(int wexp)
{
    if (wexp < WPN_EXP_E)
        return WPN_LEVEL_0;

    if (wexp < WPN_EXP_D)
        return WPN_LEVEL_E;

    if (wexp < WPN_EXP_C)
        return WPN_LEVEL_D;

    if (wexp < WPN_EXP_B)
        return WPN_LEVEL_C;

    if (wexp < WPN_EXP_A)
        return WPN_LEVEL_B;

    if (wexp < WPN_EXP_S)
        return WPN_LEVEL_A;

    return WPN_LEVEL_S;
}

char * GetWeaponLevelStringFromExp(int item)
{
    int rankTextIdLookup[] = {
        0x111C, 0x111D, 0x111E, 0x111F,
        0x1120, 0x1121, 0x1122, 0x12AE,
    };

    int var = GetItemRequiredExp(item);

    if ((GetItemAttributes(item) & IA_LOCK_ANY) && GetWeaponLevelFromExp(var) == WPN_LEVEL_0)
        var = 7;
    else
        var = GetWeaponLevelFromExp(var);

    return DecodeMsg(rankTextIdLookup[var]);
}

int GetWeaponLevelSpecialCharFromExp(int wexp)
{
    u8 rankTextIdLookup[] = {
        0x14, 0x1D, 0x1C, 0x1B, 0x1A, 0x19, 0x18
    };

    return rankTextIdLookup[GetWeaponLevelFromExp(wexp)];
}

char * GetItemKindString(int wpnType)
{
    int wtypeTextIdLookup[] = {
        0x1111, 0x1112, 0x1113, 0x1114,
        0x1115, 0x1116, 0x1117, 0x1118,
        0x1119, 0x111A, 0x111B,
    };

    return DecodeMsg(wtypeTextIdLookup[wpnType]);
}

void GetWeaponExpProgressState(int wexp, int * outValue, int * outMax)
{
    switch (GetWeaponLevelFromExp(wexp)) {

    case WPN_LEVEL_0:
        *outValue = 0;
        *outMax = 0;
        return;

    case WPN_LEVEL_E:
        *outValue = wexp      - WPN_EXP_E;
        *outMax   = WPN_EXP_D - WPN_EXP_E;
        return;

    case WPN_LEVEL_D:
        *outValue = wexp      - WPN_EXP_D;
        *outMax   = WPN_EXP_C - WPN_EXP_D;
        return;

    case WPN_LEVEL_C:
        *outValue = wexp      - WPN_EXP_C;
        *outMax   = WPN_EXP_B - WPN_EXP_C;
        return;

    case WPN_LEVEL_B:
        *outValue = wexp      - WPN_EXP_B;
        *outMax   = WPN_EXP_A - WPN_EXP_B;
        return;

    case WPN_LEVEL_A:
        *outValue = wexp      - WPN_EXP_A;
        *outMax   = WPN_EXP_S - WPN_EXP_A;
        return;

    case WPN_LEVEL_S:
        *outValue = 0;
        *outMax = 0;
        return;
    }
}

bool IsItemDisplayUsable(struct Unit * unit, int item)
{
    if (GetItemAttributes(item) & IA_WEAPON)
        return CanUnitUseWeapon(unit, item);

    if (GetItemAttributes(item) & IA_STAFF)
        return CanUnitUseStaff(unit, item);

    if (GetItemEffect(item)) {
        if (unit->statusIndex == UNIT_STATUS_SLEEP)
            return FALSE;

        if (unit->statusIndex == UNIT_STATUS_BERSERK)
            return FALSE;

        if (!(UNIT_CATTRIBUTES(unit) & CA_THIEF) && GetItemIndex(item) == ITEM_LOCKPICK)
            return FALSE;
    }

    return TRUE;
}

bool CanUnitUse_unused(struct Unit * unit, int item)
{
    if (GetItemAttributes(item) & IA_WEAPON)
        return CanUnitUseWeapon(unit, item);
    else
        return CanUnitUseItem(unit, item);
}

int GetUnitItemHealAmount(struct Unit * unit, int item)
{
    int result = 0;

    switch (GetItemIndex(item)) {

    case ITEM_STAFF_HEAL:
    case ITEM_STAFF_PHYSIC:
    case ITEM_STAFF_FORTIFY:
    case ITEM_VULNERARY:
    case ITEM_VULNERARY_2:
        result = 10;
        break;

    case ITEM_STAFF_MEND:
        result = 20;
        break;

    case ITEM_STAFF_RECOVER:
    case ITEM_ELIXIR:
        result = 80;
        break;
    }

    if (GetItemAttributes(item) & IA_STAFF) {
        result += GetUnitPower(unit);

        if (result > 80)
            result = 80;
    }

    return result;
}

int GetUnitItemSlot(struct Unit * unit, int itemIndex)
{
    int i;

    for (i = 0; i < UNIT_ITEM_COUNT; ++i)
        if (GetItemIndex(unit->items[i]) == itemIndex)
            return i;

    return -1;
}

bool IsItemStealable(int item)
{
    return (GetItemType(item) == ITYPE_ITEM);
}

bool IsItemRepairable(int item)
{
    if (!item)
        return FALSE;

    if (!(GetItemAttributes(item) & (IA_WEAPON | IA_STAFF)))
        return FALSE;

    if (GetItemAttributes(item) & (IA_UNBREAKABLE | IA_HAMMERNE | IA_LOCK_3))
        return FALSE;

    if (GetItemUses(item) == GetItemMaxUses(item))
        return FALSE;

    return TRUE;
}

int GetItemReach(int item)
{
    switch (GetItemEncodedRange(item)) {

    case 0x11:
        return REACH_RANGE1;

    case 0x12:
        return REACH_RANGE1 | REACH_RANGE2;

    case 0x13:
        return REACH_RANGE1 | REACH_RANGE2 | REACH_RANGE3;

    case 0x22:
        return REACH_RANGE2;

    case 0x23:
        return REACH_RANGE2 | REACH_RANGE3;

    case 0x33:
        return REACH_RANGE3;

    case 0x3A:
        return REACH_RANGE3 | REACH_TO10;

    case 0x3F:
        return REACH_RANGE3 | REACH_TO15;

    default:
        return REACH_NONE;
    }
}

int GetUnitWeaponReach(struct Unit * unit, int itemSlot)
{
    int i, item, result = 0;

    if (itemSlot >= 0)
        return GetItemReach(unit->items[itemSlot]);

    for (i = 0; (i < UNIT_ITEM_COUNT) && (item = unit->items[i]); ++i)
        if (CanUnitUseWeapon(unit, item))
            result |= GetItemReach(item);

    return result;
}

int GetUnitItemUseReachBits(struct Unit * unit, int itemSlot)
{
    int i, tmp, range = 0;

    if (itemSlot >= 0) {
        tmp = unit->items[itemSlot];

        if (!CanUnitUseItem(unit, tmp))
            return REACH_NONE;

        range = GetItemMaxRange(tmp);

        if (range == 0)
            range = 99;
    } else {
        for (i = 0; (i < UNIT_ITEM_COUNT) && (tmp = unit->items[i]); ++i) {
            if (CanUnitUseItem(unit, tmp)) {
                tmp = GetItemMaxRange(tmp);

                if (tmp == 0)
                    tmp = 99;

                if (range < tmp)
                    range = tmp;
            }
        }
    }

    switch (range) {

    case 1:
        return REACH_RANGE1;

    case 2:
        return REACH_RANGE1 | REACH_RANGE2;

    case 99:
        return REACH_MAGBY2;

    default:
        return REACH_NONE;
    }
}

int GetUnitStaffReachBits(struct Unit * unit)
{
    int i, tmp, range = 0;

    for (i = 0; (i < UNIT_ITEM_COUNT) && (tmp = unit->items[i]); ++i) {
        if (CanUnitUseStaff(unit, tmp)) {
            tmp = GetItemMaxRange(tmp);

            if (tmp == 0)
                tmp = 99;

            if (range < tmp)
                range = tmp;
        }
    }

    switch (range) {

    case 1:
        return REACH_RANGE1;

    case 2:
        return REACH_RANGE1 | REACH_RANGE2;

    case 99:
        return REACH_MAGBY2;

    default:
        return REACH_NONE;
    }
}

int GetConvoyItemCostSum(void)
{
    int i, result = 0;
    const u16 * convoy = GetConvoyItemArray();
    for (i = 0; (i < 100) && (*convoy); ++i)
    {
        result += GetItemCost(*convoy);
        convoy++;
    }
    return result;
}

int GetUnitItemCostSum(void)
{
    int i, j, item, result = 0;

    for (i = 1; i < 0x40; ++i) {
        struct Unit * unit = GetUnit(i);

        if (!unit)
            continue;

        if (!unit->pCharacterData)
            continue;

        if (unit->state & (US_DEAD | US_BIT16))
            continue;

        for (j = 0; (j < UNIT_ITEM_COUNT) && (item = unit->items[j]); ++j)
            result += GetItemCost(item);
    }

    return result;
}

s32 GetPartyTotalGoldValue(void)
{
    int result = 0;

    result += GetConvoyItemCostSum();
    result += GetUnitItemCostSum();
    result += GetGold();

    if (result > 9999999)
        result = 9999999;

    return result;
}

void BreakItemSealForPid(int item, u8 pid)
{
    gPlaySt.unk1C[GetItemType(item)] = pid;
}

static inline int GetChapterUnk1C(int arg)
{
    return gPlaySt.unk1C[arg];
}

bool IsItemUnsealedForUnit(struct Unit * unit, int item)
{
    return (GetChapterUnk1C(GetItemType(item)) == unit->pCharacterData->number) ? TRUE : FALSE;
}
