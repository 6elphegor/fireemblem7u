#include "gbafe.h"

/* Chapter-specific event-call helpers */

int sub_0807A03C(void);
void SetUnitStatusExt(struct Unit * unit, int status, int duration);
int GetGold(void);
void sub_08079C48(int amount);
void StartUnkTrapAnim(ProcPtr parent, int a, int b, int c, int d);

extern u16 gUnk_03004ADC;
extern u16 CONST_DATA gUnk_08CB8984[];
extern u16 CONST_DATA gUnk_08CB898E[];

void sub_0807CEC8(void)
{
    UpdateBestGlobalSupportValue(0x0F, 0x15, 1);
}

void sub_0807CED8(void)
{
    UpdateBestGlobalSupportValue(0x0F, 0x15, 2);
}

void sub_0807CEE8(void)
{
    UpdateBestGlobalSupportValue(0x0F, 0x15, 3);
}

void sub_0807CEF8(void)
{
}

s8 sub_0807CEFC(void)
{
    return gBmSt.partial_actions_taken & 2;
}

int sub_0807CF10(void)
{
    return GetUnitItemSlot(GetUnitFromCharId(0x18), 0x6B) != -1;
}

int sub_0807CF2C(void)
{
    if (gActionSt.id == 0x17)
    {
        struct Unit * unit = GetUnit(gActionSt.instigator);

        if (GetItemIndex(unit->items[gActionSt.item_slot]) == GetItemIndex(0x6B))
            return TRUE;
    }

    return FALSE;
}

void sub_0807CF68(void)
{
    RefreshEntityMaps();
    RenderMap();
    RefreshUnitSprites();
}

int sub_0807CF7C(void)
{
    struct Unit * unit = GetUnitFromCharId(0x08);

    if (UNIT_FACTION(unit) == FACTION_BLUE && *((u16 *) &unit->xPos) == 0x0407)
        return TRUE;

    return FALSE;
}

int sub_0807CFA8(void)
{
    return sub_0807A03C() <= 1;
}

void sub_0807CFBC(void)
{
    SetFlag(0x17);
}

int sub_0807CFC8(void)
{
    return UNIT_FACTION(GetUnitFromCharId(0x08)) == FACTION_BLUE;
}

void sub_0807CFE4(void)
{
    SetGold(10000);
}

int sub_0807CFF4(void)
{
    if (!CheckFlag(0x08))
        return gBmMapTerrain[14][6] != 0x25;

    return FALSE;
}

void sub_0807D020(void)
{
    int item = 0;

    if (CheckFlag(0x85))
    {
        if (CheckFlag(0x84))
            item = 0x73;
        else
            item = 0x74;
    }
    else if (CheckFlag(0x84))
    {
        item = 0x75;
    }

    if (item != 0)
    {
        UnitAddItem(GetUnitFromCharId(0x2D), MakeNewItem(item));
        return;
    }

    if (!IsFirstChapterStatsPrologue())
        UnitAddItem(GetUnitFromCharId(0x2D), MakeNewItem(0x74));
}

int sub_0807D094(void)
{
    int pid = gActiveUnit->pCharacterData->number;

    if (pid == 0x2F)
        return TRUE;

    if (pid == 0x30)
        return TRUE;

    if (pid == 0x31)
        return TRUE;

    if (pid == 0x2E)
        return TRUE;

    return FALSE;
}

void sub_0807D0B8(void)
{
    UnitAddItem(GetUnitFromCharId(0x10), MakeNewItem(0x3E));
    UnitAddItem(GetUnitFromCharId(0x10), MakeNewItem(0x6B));
    UnitAddItem(GetUnitFromCharId(0x75), MakeNewItem(0x16));
    UnitAddItem(GetUnitFromCharId(0x75), MakeNewItem(0x6B));
    UnitAddItem(GetUnitFromCharId(0x76), MakeNewItem(0x16));
    UnitAddItem(GetUnitFromCharId(0x76), MakeNewItem(0x6B));
    UnitAddItem(GetUnitFromCharId(0x77), MakeNewItem(0x1C));
    UnitAddItem(GetUnitFromCharId(0x77), MakeNewItem(0x6B));
}

int sub_0807D170(void)
{
    return UNIT_FACTION(GetUnitFromCharId(0x10)) == FACTION_BLUE;
}

u8 sub_0807D18C(void)
{
    u8 count = CheckFlag(0x0E) != 0;

    if (CheckFlag(0x0F))
        count++;

    if (CheckFlag(0x10))
        count++;

    return count;
}

int sub_0807D1C8(void)
{
    return sub_0807D18C() == 0;
}

int sub_0807D1E0(void)
{
    return sub_0807D18C() <= 1;
}

int sub_0807D1F8(void)
{
    return sub_0807D18C() <= 2;
}

int sub_0807D210(void)
{
    struct Unit * unit = GetUnit(gBmMapUnit[8][3]);

    if (unit != NULL && UNIT_FACTION(unit) == FACTION_BLUE)
        return TRUE;

    return FALSE;
}

int sub_0807D240(void)
{
    struct Unit * unit = GetUnitFromCharId(0x26);

    if (unit != NULL && unit->level > 6 && CheckFlag(0x0A))
        return TRUE;

    return FALSE;
}

void sub_0807D26C(void)
{
    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 1;
    gDispIo.bg2_ct.priority = 1;
    gDispIo.bg3_ct.priority = 3;
}

void sub_0807D29C(void)
{
    SetUnitStatusExt(GetUnitFromCharId(0x01), UNIT_STATUS_DEFENSE, 2);
}

int sub_0807D2B0(void)
{
    if (gPlaySt.faction == FACTION_BLUE)
    {
        int jid = gActiveUnit->pClassData->number;

        if (jid == 0x3C)
            goto ret_true;

        if (jid == 0x3D)
            goto ret_true;

        if (DivRem(RandNextB(), 11) == 0)
            goto ret_true;
    }

    return FALSE;

ret_true:
    return TRUE;
}

void sub_0807D2EC(void)
{
    u16 sum = 0;
    int i;

    for (i = 1; i < 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        sum += PidStatsGetExpGain(unit->pCharacterData->number);
    }

    gUnk_03004ADC = sum;
}

int sub_0807D324(void)
{
    int sum = 0;
    int i;

    for (i = 1; i < 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        sum += PidStatsGetExpGain(unit->pCharacterData->number);
    }

    sum -= gUnk_03004ADC;

    if (sum > 699)
        return TRUE;

    return FALSE;
}

int sub_0807D368(void)
{
    u16 sum = 0;
    int i;

    for (i = 1; i < 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);
        int pid;

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & US_DEAD)
            continue;

        pid = unit->pCharacterData->number;

        if ((u8) (pid - 1) <= 1 || pid == 0x2D)
            sum += unit->level;
    }

    if (sum >= 50)
        return TRUE;

    return FALSE;
}

void sub_0807D3BC(ProcPtr proc)
{
    StartUnkTrapAnim(proc, 0x10, 1, 2, 3);
}

int sub_0807D3D4(void)
{
    struct Unit * unit = GetUnitFromCharId(0x25);
    u8 y = unit->yPos;

    if ((u8) (unit->xPos - 0x10) <= 2 && y <= 2)
        return TRUE;

    return FALSE;
}

int sub_0807D3F8(void)
{
    return GetGold() > 19999;
}

void sub_0807D414(void)
{
    sub_08079C48(20000);
}

int sub_0807D424(void)
{
    if (CheckFlag(0x07) && !CheckFlag(0x0D))
        return TRUE;

    return FALSE;
}

u16 sub_0807D448(u16 const * list)
{
    int j = 0;
    int sum = 0;
    int i;

    for (i = 1; i < 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & US_DEAD)
            continue;

        for (; list[j] != 0; j++)
        {
            if (unit->pCharacterData->number == (list[j] & 0xFF))
                sum += PidStatsGetExpGain(list[j]);
        }

        j = 0;
    }

    return sum;
}

int sub_0807D4C0(void)
{
    if (sub_0807D448(gUnk_08CB8984) > sub_0807D448(gUnk_08CB898E))
        return TRUE;

    return FALSE;
}

int sub_0807D4EC(void)
{
    int count = CheckFlag(0x09) != 0;

    if (CheckFlag(0x0A))
        count++;

    if (CheckFlag(0x0B))
        count++;

    return count <= 1;
}
