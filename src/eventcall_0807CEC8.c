#include "gbafe.h"

/* Chapter-specific event-call helpers */

int sub_0807A03C(void);
void SetUnitStatusExt(struct Unit * unit, int status, int duration);

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
