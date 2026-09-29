#include "gbafe.h"

/* Chapter-specific event-call helpers */

int sub_0807A03C(void);
void SetUnitStatusExt(struct Unit * unit, int status, int duration);
int GetGold(void);
void sub_08079C48(int amount);
void StartUnkTrapAnim(ProcPtr parent, int a, int b, int c, int d);

extern u16 gUnk_03004ADC;
extern s8 gFadeComponentStep[];
extern u16 CONST_DATA gUnk_08CB8984[];
extern u16 CONST_DATA gUnk_08CB898E[];
extern struct UnitDefinition CONST_DATA gUnk_08CDB3C8[];
extern struct UnitDefinition CONST_DATA gUnk_08CDB3E8[];
extern const struct ProcCmd ProcScr_08CBB47C[];
extern struct ProcCmd CONST_DATA ProcScr_08CBB48C[];

void StartCircularFadeAnim(ProcPtr proc, int x, int y);
void StartEmitStarsAnim(ProcPtr parent, int x1, int y1, int x2, int y2);
void ClearEmitedStars(void);

struct ProcEventCameraShake
{
    PROC_HEADER;

    /* 2C */ int x;

    STRUCT_PAD(0x30, 0x4C);

    /* 4C */ s16 timer;
};

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

int sub_0807D528(void)
{
    int count = CheckFlag(0x09) != 0;

    if (CheckFlag(0x0A))
        count++;

    if (CheckFlag(0x0B))
        count++;

    if (CheckFlag(0x0C))
        count++;

    if (CheckFlag(0x0D))
        count++;

    if (CheckFlag(0x0E))
        count++;

    if (CheckFlag(0x0F))
        count++;

    if (CheckFlag(0x10))
        count++;

    if (CheckFlag(0x11))
        count++;

    if (count <= 3)
        return TRUE;

    return FALSE;
}

void sub_0807D5BC(struct EventProc * proc)
{
    if (!(proc->flags & EVENT_FLAG_SKIPPED))
    {
        struct Unit * unit = GetUnitFromCharId(0x5B);
        int x, y, cx, cy;

        x = unit->xPos * 16;
        cx = gBmSt.camera.x - 8;
        x -= cx;

        y = unit->yPos * 16;
        cy = gBmSt.camera.y - 8;
        y -= cy;

        StartCircularFadeAnim(proc, x, y);

        proc->unk_4D = TRUE;
    }
}

void sub_0807D60C(struct ProcEventCameraShake * proc)
{
    if ((GetGameTime() & 1) == 0)
    {
        proc->timer++;
        gBmSt.camera.x = (proc->timer & 1) ? proc->x - 1 : proc->x + 1;
    }
}

void sub_0807D644(struct EventProc * proc)
{
    if (!(proc->flags & EVENT_FLAG_SKIPPED))
    {
        struct ProcEventCameraShake * shake = Proc_Start(ProcScr_08CBB47C, PROC_TREE_VSYNC);
        shake->x = gBmSt.camera.x;

        if (!gPlaySt.cfgDisableSoundEffects)
            m4aSongNumStart(0x26A);
    }
}

void sub_0807D688(void)
{
    Proc_EndEach(ProcScr_08CBB47C);
    gBmSt.camera.x = (gBmSt.camera.x + 0xF) & ~0xF;
    Sound_FadeOutSE(4);
}

void sub_0807D6B4(struct ProcEventCameraShake * proc)
{
    ColorFadeTick();
    EnablePalSync();

    if (--proc->timer < 0)
        Proc_Break(proc);
}

void sub_0807D6DC(void)
{
}

void sub_0807D6E0(struct ProcEventCameraShake * proc)
{
    proc->timer = 15;
    sub_0807D6B4(proc);
}

void sub_0807D6F4(struct ProcEventCameraShake * proc)
{
    gFadeComponentStep[0x1B] = -1;
    proc->timer = 15;
    sub_0807D6B4(proc);
}

void sub_0807D710(struct EventProc * proc)
{
    if (!(proc->flags & EVENT_FLAG_SKIPPED))
    {
        struct Unit * unit = GetUnitFromCharId(0x85);

        unit->index += 0x40;
        RefreshUnitSprites();
        unit->index -= 0x40;

        CpuFastCopy(PAL_OBJ(0xD), PAL_OBJ(0xB), 0x20);

        ColorFadeSetupFromColorToWhite(1);
        ColorFadeInit();

        gFadeComponentStep[0x1B] = 1;

        Proc_Start(ProcScr_08CBB48C, proc);
    }
}

void sub_0807D770(struct EventProc * proc)
{
    if (!(proc->flags & EVENT_FLAG_SKIPPED))
        Proc_BreakEach(ProcScr_08CBB48C);
}

void sub_0807D78C(struct EventProc * proc)
{
    if (!(proc->flags & EVENT_FLAG_SKIPPED))
    {
        struct Unit * unit = GetUnitFromCharId(0x84);
        unit->pClassData = GetClassData(0x56);
        RefreshUnitSprites();
    }
}

void sub_0807D7B4(struct EventProc * proc)
{
    if (!(proc->flags & EVENT_FLAG_SKIPPED))
    {
        struct Unit * unit = GetUnitFromCharId(0x84);
        HideUnitSprite(unit);
        StartMuDeathFade(StartMu(unit));
    }
}

void sub_0807D7E0(void)
{
    if (CheckFlag(0x70))
        LoadUnit(gUnk_08CDB3C8);
    else
        LoadUnit(gUnk_08CDB3E8);
}

int sub_0807D80C(void)
{
    if (gBattleActor.unit.pCharacterData->number == GetPlayerLeaderUnitId())
        return TRUE;

    if (gBattleTarget.unit.pCharacterData->number == GetPlayerLeaderUnitId())
        return TRUE;

    return FALSE;
}

void sub_0807D840(struct EventProc * proc)
{
    if (!(proc->flags & EVENT_FLAG_SKIPPED))
    {
        struct Unit * unit = GetUnitFromCharId(0x44);
        int x, y, cx, cy;

        x = unit->xPos * 16;
        cx = gBmSt.camera.x - 8;
        x -= cx;

        y = unit->yPos * 16;
        cy = gBmSt.camera.y - 8;
        y -= cy;

        StartCircularFadeAnim(proc, x, y);

        proc->unk_4D = TRUE;
    }
}

void sub_0807D890(struct EventProc * proc)
{
    if (!(proc->flags & EVENT_FLAG_SKIPPED))
    {
        StartEmitStarsAnim(proc,
            0x7F - gBmSt.camera.x, 0x18 - gBmSt.camera.y,
            0x87 - gBmSt.camera.x, 0x30 - gBmSt.camera.y);
    }
}

void sub_0807D8D4(struct EventProc * proc)
{
    if (!(proc->flags & EVENT_FLAG_SKIPPED))
        ClearEmitedStars();
}

SECTION(".rodata.08CBB47C")
const struct ProcCmd ProcScr_08CBB47C[] = {
    PROC_REPEAT(sub_0807D60C),
    PROC_END,
};
