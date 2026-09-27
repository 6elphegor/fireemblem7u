#include "gbafe.h"
#include "gbafe/bmusailment.h"

/* Chapter-specific event-call helpers */

s8 sub_08079D20(void);
s8 sub_0807A304(void);
void UnitGetDeathDropLocation(struct Unit * unit, int * xOut, int * yOut);
s8 sub_0807A1F8(void);
void EndTalk(void);
bool IsTalkActive(void);
ProcPtr StartTalkExt(int x, int y, char const * str, ProcPtr parent);
void SetTalkPrintColor(int color);

struct EventLoadPos
{
    /* 00 */ s8 x_load, y_load;
    /* 02 */ s8 x_move, y_move;
};

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

void sub_0807DE1C(void)
{
    struct { s8 x, y; } positions[7] =
    {
        { 8, 12 }, { 7, 13 }, { 4, 11 }, { 9, 13 }, { 10, 10 }, { 4, 9 }, { 10, 12 },
    };

    int count = 0;
    int i;

    for (i = 1; i < 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);
        int pid;

        if (!UNIT_IS_VALID(unit))
            continue;

        pid = unit->pCharacterData->number;

        if (pid == 0x01)
            continue;

        if (pid == 0x02)
            continue;

        if (pid == 0x2D)
            continue;

        if (pid == 0x26)
            continue;

        if (pid == 0x27)
            continue;

        if (unit->state & US_UNAVAILABLE)
            continue;

        EventLoadUnit(pid, 0,
            positions[count].x, positions[count].y,
            positions[count].x, positions[count].y,
            0, NULL);

        if (++count > 6)
            break;
    }

    RefreshUnitSprites();
}

void sub_0807DEA8(struct EventProc * proc)
{
    int pids[3];
    struct EventLoadPos positions[3] =
    {
        { 12, 25, 12, 20 },
        { 11, 25, 11, 21 },
        { 13, 25, 13, 21 },
    };

    int i;

    if (gPlaySt.chapterModeIndex == CHAPTER_MODE_HECTOR)
    {
        pids[0] = 0x02;
        pids[1] = 0x2D;
        pids[2] = 0x01;
    }
    else
    {
        pids[0] = 0x01;
        pids[1] = 0x2D;
        pids[2] = 0x02;
    }

    if (proc->flags & EVENT_FLAG_SKIPPED)
        return;

    for (i = 0; i < 3; i++)
    {
        EventLoadUnit(pids[i], 0,
            positions[i].x_load, positions[i].y_load,
            positions[i].x_move, positions[i].y_move,
            0, proc);
    }
}

void Finial_EventLoadAllies1(struct EventProc * proc)
{
    struct EventLoadPos positions[3] =
    {
        { 11, 25, 11, 22 },
        { 13, 25, 13, 22 },
        { 12, 25, 12, 22 },
    };

    u16 skipped = proc->flags & EVENT_FLAG_SKIPPED;

    if (skipped != 0)
        return;

    EventLoadUnit(0x27, 0,
        positions[0].x_load, positions[0].y_load,
        positions[0].x_move, positions[0].y_move,
        skipped, proc);

    EventLoadUnit(0x26, 0,
        positions[1].x_load, positions[1].y_load,
        positions[1].x_move, positions[1].y_move,
        skipped, proc);

    if (gPlaySt.tact_enabled)
    {
        EventLoadUnit(0xCD, 0x51,
            positions[2].x_load, positions[2].y_load,
            positions[2].x_move, positions[2].y_move,
            1, proc);
    }
}

void Finial_EventLoadAllies2(struct EventProc * proc)
{
    int count = 0;
    struct EventLoadPos positions[4] =
    {
        { 14, 25, 14, 22 },
        { 10, 25, 10, 23 },
        { 11, 25, 11, 24 },
        { 13, 25, 13, 24 },
    };

    int i;

    if (proc->flags & EVENT_FLAG_SKIPPED)
        return;

    for (i = 1; i < 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);
        int pid;

        if (!UNIT_IS_VALID(unit))
            continue;

        pid = unit->pCharacterData->number;

        if (pid == 0x01)
            continue;

        if (pid == 0x02)
            continue;

        if (pid == 0x2D)
            continue;

        if (pid == 0x26)
            continue;

        if (pid == 0x27)
            continue;

        if (unit->state & US_UNAVAILABLE)
            continue;

        EventLoadUnit(pid, 0,
            positions[count].x_load, positions[count].y_load,
            positions[count].x_move, positions[count].y_move,
            0, proc);

        if (++count > 3)
            break;
    }

    RefreshUnitSprites();
}

void Finial_EventLoadAllies3(struct EventProc * proc)
{
    int count = 0;
    struct EventLoadPos positions[3] =
    {
        { 10, 25, 10, 25 },
        { 12, 25, 12, 25 },
        { 14, 25, 14, 25 },
    };

    int i;

    if (proc->flags & EVENT_FLAG_SKIPPED)
        return;

    for (i = 1; i < 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);
        int pid;

        if (!UNIT_IS_VALID(unit))
            continue;

        pid = unit->pCharacterData->number;

        if (pid == 0x01)
            continue;

        if (pid == 0x02)
            continue;

        if (pid == 0x2D)
            continue;

        if (pid == 0x26)
            continue;

        if (pid == 0x27)
            continue;

        if (unit->state & US_UNAVAILABLE)
            continue;

        if (count > 3)
        {
            EventLoadUnit(pid, 0,
                positions[count - 4].x_load, positions[count - 4].y_load,
                positions[count - 4].x_move, positions[count - 4].y_move,
                0, proc);
        }

        if (++count > 6)
            break;
    }

    RefreshUnitSprites();
}

void Finial_EventLoadAllies4(struct EventProc * proc)
{
    int pids[3];
    struct EventLoadPos positions[3] =
    {
        { 12, 20, 12, 15 },
        { 11, 21, 11, 16 },
        { 13, 21, 13, 16 },
    };

    int i;

    if (proc->flags & EVENT_FLAG_SKIPPED)
        return;

    if (gPlaySt.chapterModeIndex == CHAPTER_MODE_HECTOR)
    {
        pids[0] = 0x02;
        pids[1] = 0x2D;
        pids[2] = 0x01;
    }
    else
    {
        pids[0] = 0x01;
        pids[1] = 0x2D;
        pids[2] = 0x02;
    }

    for (i = 0; i < 3; i++)
    {
        EventLoadUnit(pids[i], 0,
            positions[i].x_load, positions[i].y_load,
            positions[i].x_move, positions[i].y_move,
            0, proc);
    }

    RefreshUnitSprites();
}

void sub_0807E1AC(void)
{
    StartStatusHealEffect(GetUnitFromCharId(0x27), NULL);
}
