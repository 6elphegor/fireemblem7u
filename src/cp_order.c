#include "gbafe.h"
#include "gbafe/cp_common.h"

// AI unit ordering (FE8U: cp_order.c)

void * memcpy(void * dst, const void * src, unsigned long size);

void CpOrderMain(ProcPtr proc);
void CpOrderBerserkInit(ProcPtr proc);
void CpOrderFunc_BeginDecide(ProcPtr proc);
int GetUnitBattleAiPriority(struct Unit * unit);
int GetUnitAiPriority(struct Unit * unit);
int BuildAiUnitList(void);
void SortAiUnitList(int count);
void CpOrderFunc_End(ProcPtr proc);
void AiDecideMain(void);

extern void (* AiDecideMainFunc)(void);
extern u32 * sUnitPriorityArray;
extern ProcFunc CONST_DATA sCpOrderFuncList[];
extern const int sFactionUnitCountLut[3];
extern struct ProcCmd CONST_DATA gProcScr_CpDecide[];

void CpOrderMain(ProcPtr proc)
{
    sCpOrderFuncList[gAiState.orderState++](proc);
}

void CpOrderBerserkInit(ProcPtr proc)
{
    int i, aiNum = 0;

    u32 faction = gPlaySt.faction;

    int factionUnitCountLut[3];
    memcpy(factionUnitCountLut, sFactionUnitCountLut, sizeof(factionUnitCountLut));

    for (i = 0; i < factionUnitCountLut[faction >> 6]; ++i)
    {
        struct Unit * unit = GetUnit(faction + i + 1);

        if (!unit->pCharacterData)
            continue;

        if (unit->statusIndex != UNIT_STATUS_BERSERK)
            continue;

        if (unit->state & (US_HIDDEN | US_UNSELECTABLE | US_DEAD | US_RESCUED | US_HAS_MOVED_AI))
            continue;

        gAiState.units[aiNum++] = faction + i + 1;
    }

    if (aiNum != 0)
    {
        gAiState.units[aiNum] = 0;
        gAiState.unitIt = gAiState.units;

        AiDecideMainFunc = AiDecideMain;

        Proc_StartBlocking(gProcScr_CpDecide, proc);
    }
}

void CpOrderFunc_BeginDecide(ProcPtr proc)
{
    int unitAmt = BuildAiUnitList();

    if (unitAmt != 0)
    {
        SortAiUnitList(unitAmt);

        gAiState.units[unitAmt] = 0;
        gAiState.unitIt = gAiState.units;

        AiDecideMainFunc = AiDecideMain;

        Proc_StartBlocking(gProcScr_CpDecide, proc);
    }
}

int GetUnitBattleAiPriority(struct Unit * unit)
{
    int i, item;

    u8 rangedAmt = 0;
    u8 meleeAmt = 0;

    for (i = 0; (i < UNIT_ITEM_COUNT) && !!(item = unit->items[i]); ++i)
    {
        if (!CanUnitUseWeapon(unit, item) && !CanUnitUseStaff(unit, item))
            continue;

        if (GetItemAttributes(item) & IA_STAFF)
            return 72;

        if (GetItemAttributes(item) & IA_WEAPON)
        {
            int range = GetItemMaxRange(item);

            if (range > 1)
                rangedAmt++;
            else
                meleeAmt++;
        }
    }

    if (rangedAmt != 0)
        return 40;

    if (meleeAmt != 0)
        return 20;

    return 87;
}

int GetUnitAiPriority(struct Unit * unit)
{
    int priority = UNIT_MOV(unit);

    u16 lead = GetUnitLeaderCharId(unit);

    if (UNIT_CATTRIBUTES(unit) & (CA_DANCE | CA_PLAY))
        return priority - 149;

    if (!(unit->aiFlags & AI_UNIT_FLAG_0))
    {
        priority += lead << 8;

        if (UNIT_CATTRIBUTES(unit) & CA_STEAL)
            return priority + 60;

        if ((unit->pCharacterData->number == lead) || (UNIT_CATTRIBUTES(unit) & CA_LORD))
            return priority + 87;

        priority = priority + GetUnitBattleAiPriority(unit);
    }

    return priority;
}

int BuildAiUnitList(void)
{
    int i, aiNum = 0;

    u32 faction = gPlaySt.faction;
    u32 * prioIt = sUnitPriorityArray;

    int factionUnitCountLut[3];
    memcpy(factionUnitCountLut, sFactionUnitCountLut, sizeof(factionUnitCountLut));

    for (i = 0; i < factionUnitCountLut[faction >> 6]; ++i)
    {
        struct Unit * unit = GetUnit(faction + i + 1);

        if (!unit->pCharacterData)
            continue;

        if (unit->statusIndex == UNIT_STATUS_SLEEP)
            continue;

        if (unit->statusIndex == UNIT_STATUS_BERSERK)
            continue;

        if (unit->state & (US_HIDDEN | US_UNSELECTABLE | US_DEAD | US_RESCUED | US_HAS_MOVED_AI))
            continue;

        gAiState.units[aiNum] = faction + i + 1;
        *prioIt++ = GetUnitAiPriority(unit);

        aiNum++;
    }

    return aiNum;
}

void SortAiUnitList(int count)
{
    int i, j;

    if (count <= 1)
        return;
    ++count; --count;

    for (i = 0; i <= count - 2; ++i)
    {
        for (j = count - 2; j >= i; --j)
        {
            if (sUnitPriorityArray[j] > sUnitPriorityArray[j + 1])
            {
                int tmp;

                tmp = sUnitPriorityArray[j];
                sUnitPriorityArray[j] = sUnitPriorityArray[j + 1];
                sUnitPriorityArray[j + 1] = tmp;

                tmp = gAiState.units[j];
                gAiState.units[j] = gAiState.units[j + 1];
                gAiState.units[j + 1] = tmp;
            }
        }
    }
}

void CpOrderFunc_End(ProcPtr proc)
{
    Proc_Break(proc);
}
