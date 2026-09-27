#include "gbafe.h"

/* Chapter-specific event-call helpers */

s8 sub_08079D20(void);
s8 sub_0807A304(void);
void UnitGetDeathDropLocation(struct Unit * unit, int * xOut, int * yOut);
s8 sub_0807A1F8(void);
void EndTalk(void);
bool IsTalkActive(void);
ProcPtr StartTalkExt(int x, int y, char const * str, ProcPtr parent);
void SetTalkPrintColor(int color);

struct EventCallLookupEnt
{
    /* 00 */ int key;
    /* 04 */ int value;
};

extern struct EventCallLookupEnt CONST_DATA gUnk_08CBF3AC[];

struct Event_0807DC14Sub
{
    /* 00 */ u8 unk_00;
    /* 01 */ u8 unk_01;
    /* 02 */ u8 unk_02;
    /* 04 */ u16 unk_04;
};

struct ProcEvent_0807DC14
{
    PROC_HEADER;
    STRUCT_PAD(0x29, 0x5E);

    /* 5E */ u16 flags;
    /* 60 */ struct Event_0807DC14Sub unk_60;
};

int sub_0807D9E4(void)
{
    struct Unit * unit = GetUnitFromCharId(0x09);

    if (sub_08079D20() && unit->pClassData->number == 0x13 && unit->level > 4)
        return TRUE;

    return FALSE;
}

int sub_0807DA14(void)
{
    struct Unit * unit = GetUnitFromCharId(0x09);
    u8 i;
    int item;

    for (i = 0; (i < UNIT_ITEM_COUNT) && (item = unit->items[i]) != 0; i++)
    {
        if ((GetItemAttributes(item) & IA_WEAPON) && CanUnitUseWeaponNow(unit, item))
            return TRUE;
    }

    return FALSE;
}

int sub_0807DA68(void)
{
    struct Unit * unit = GetUnitFromCharId(0x37);

    if (unit->xPos <= 1 && unit->yPos <= 1)
        return TRUE;

    return FALSE;
}

int sub_0807DA8C(void)
{
    return GetUnitCurrentHp(GetUnitFromCharId(0x09)) == 0;
}

int sub_0807DAA8(void)
{
    return GetUnitCurrentHp(GetUnitFromCharId(0x37)) == 0;
}

void sub_0807DAC4(void)
{
    int pid = 0x09;
    int i;

    for (i = 1; i < 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->pCharacterData->number != pid)
            continue;

        PidStatsRecordDefeatInfo(pid, 0, 6);

        UnitKill(unit);
        SetUnitHp(unit, 0);

        if (gBattleActor.unit.index == unit->index)
            memcpy(&gBattleActor.unit, unit, sizeof(struct Unit));

        if (gBattleTarget.unit.index == unit->index)
            memcpy(&gBattleTarget.unit, unit, sizeof(struct Unit));

        if (unit->state & US_RESCUED)
            UnitDrop(GetUnit(unit->rescue), 0, 0);

        if (unit->state & US_RESCUING)
        {
            int x, y;

            UnitGetDeathDropLocation(unit, &x, &y);
            UnitDrop(unit, x, y);
        }

        break;
    }
}

int sub_0807DB74(void)
{
    if (sub_0807A304())
        return gBmMapTerrain[2][5] == 0x25;

    return FALSE;
}

int sub_0807DBA0(void)
{
    s8 positions[10][2] =
    {
        { 8, 10 }, { 12, 10 },
        { 8, 11 }, { 9, 11 }, { 10, 11 }, { 11, 11 }, { 12, 11 },
        { 9, 12 }, { 10, 12 }, { 11, 12 },
    };

    s8 * it;
    u8 ** map;
    int i;

    for (i = 0, map = gBmMapUnit, it = positions[0]; i < 9; it += 2, i++)
    {
        int uid = map[it[1]][it[0]];

        if (uid != 0 && (uid & 0xC0) == FACTION_BLUE)
            return TRUE;
    }

    return FALSE;
}

void sub_0807DBF4(void)
{
    UnitAddItem(GetUnitFromCharId(0x27), MakeNewItem(0x8C));
}

void sub_0807DC14(struct ProcEvent_0807DC14 * proc)
{
    struct Event_0807DC14Sub * sub = &proc->unk_60;

    sub->unk_00 = 0;
    sub->unk_01 = 0;
    sub->unk_02 = 0;
    sub->unk_04 = 0;

    InitTalk(0x80, 2, TRUE);
}

int sub_0807DC30(int key)
{
    int i;

    for (i = 0; gUnk_08CBF3AC[i].key != 0; i++)
    {
        if (key == gUnk_08CBF3AC[i].key)
            return gUnk_08CBF3AC[i].value;
    }

    return 0;
}

int sub_0807DC5C(struct ProcEvent_0807DC14 * proc)
{
    struct Event_0807DC14Sub * sub = &proc->unk_60;
    struct Unit * unit;
    int active;
    int i;

    if (proc->flags & EVENT_FLAG_SKIPPED)
    {
        EndTalk();
        return FALSE;
    }

    active = IsTalkActive();

    if (active)
        return TRUE;

    switch (sub->unk_00)
    {
    case 0:
        i = 1;

        if (sub->unk_01 != 0)
            i = sub->unk_01;

        for (; i < 0x40; i++)
        {
            unit = GetUnit(i);

            if (!UNIT_IS_VALID(unit))
                continue;

            if (unit->state & US_UNAVAILABLE)
                continue;

            sub->unk_02 = unit->pCharacterData->number;

            if (sub->unk_02 == 0x01)
                continue;

            if (sub->unk_02 == 0x02)
                continue;

            if (sub->unk_02 == 0x2D)
                continue;

            if (sub->unk_02 == 0x26)
                continue;

            sub->unk_04 = sub_0807DC30(sub->unk_02);
            sub->unk_01 = i + 1;
            sub->unk_00++;

            return TRUE;
        }

        return FALSE;

    case 1:
        unit = GetUnitFromCharId(sub->unk_02);

        if (unit != NULL)
        {
            EnsureCameraOntoPosition(proc, unit->xPos, unit->yPos);
            SetMapCursorPosition(unit->xPos, unit->yPos);
        }

        sub->unk_00++;
        break;

    case 2:
        if (Proc_Find(ProcScr_Face))
        {
            ClearTalkBubble();
            Proc_ForEach(ProcScr_Face, (ProcFunc) StartFaceFadeOut);
            StartTemporaryLock(proc, 8);
        }

        sub->unk_00++;
        break;

    case 3:
        if (sub->unk_04 != 0)
        {
            SetInitTalkTextFont();
            ClearTalkText();
            ClearPutTalkText();
            ClearTalk();

            StartTalkExt(10, 14, DecodeMsg(sub->unk_04), NULL);
            SetTalkPrintColor(1);
            SetActiveTalkFace(1);
        }

        sub->unk_00 = active;
        break;
    }

    return TRUE;
}

void sub_0807DD94(void)
{
    CpuFastFill(0, (void *) VRAM, 0x20);

    TmFill(gBg0Tm, 0);
    TmFill(gBg1Tm, 0);

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);
}

void sub_0807DDD0(void)
{
    InitPlayerUnitPositionsForPrepScreen();
    SyncUnitDeploymentState();

    RefreshEntityMaps();
    RefreshUnitSprites();
    RenderMap();
}

int sub_0807DDEC(void)
{
    if (gPlaySt.chapterModeIndex == CHAPTER_MODE_HECTOR && sub_0807A1F8() && CheckFlag(0x07))
        return TRUE;

    return FALSE;
}
