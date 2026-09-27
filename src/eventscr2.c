#include "gbafe.h"
#include "gbafe/unk-functions.h"

/* not yet declared elsewhere */
void MU_SetDefaultFacing_Auto(void);
void StartMuDeathFade(struct MuProc * mu);
int GetMapChangeIdAt(int x, int y);
void RefreshAutoWaterShadows(void);

struct EventCursorProc {
    /* 00 */ PROC_HEADER;
    STRUCT_PAD(0x29, 0x58);
    /* 58 */ int timer;
    STRUCT_PAD(0x5C, 0x64);
    /* 64 */ s16 x;
    /* 66 */ s16 y;
};

extern struct ProcCmd CONST_DATA ProcScr_EventFlashCursor[];
extern struct ProcCmd CONST_DATA ProcScr_EventCursor[];

bool IsPidBlueDeployed(int pid);
bool IsTutorialDisabled(void);
void RemoveMapChangeTrap(int id);
void UpdateRoofedUnits(void);
s8 MuExistsActive(void);

extern struct UnitDefinition sEventLoadUnitBuf;
extern struct UnitDefinition const gUnitDef_08B91A18;

void EventUnitLoadWait(struct EventProc * proc)
{
    struct UnitDefinition const * def = proc->unit_info;

    while (def->pid != 0)
    {
        if ((proc->flags & EVENT_FLAG_SKIPPED) || proc->unk_4D)
        {
            for (; def->pid != 0; def++)
                LoadUnitCore(def, NULL);

            proc->idle_func = NULL;
            return;
        }

        if (!UnitInfoRequiresNoMovement(def))
        {
            if (!CanDisplayUnitMovement(proc, def->x_load, def->y_load))
                goto end;

            LoadUnitCore(def, proc);
        }

        def++;
        proc->unit_info = def;
    }

    proc->idle_func = EventMovementWait;

end:
    ForceSyncUnitSpriteSheet();
}

#if NONMATCHING
// only difference: "movs r0, #0" before "proc->idle_func = NULL" is CSEd away here
void EventUnitLoadAliveWait(struct EventProc * proc)
{
    struct UnitDefinition const * def = proc->unit_info;

    goto test;

loop:
    if ((proc->flags & EVENT_FLAG_SKIPPED) || proc->unk_4D)
    {
        goto inner_test;
    inner_loop:
        if (!(GetUnitFromCharId(def->pid)->state & US_DEAD))
            LoadUnitCore(def, NULL);
        def++;
    inner_test:
        if (def->pid != 0)
            goto inner_loop;

        proc->idle_func = NULL;
        return;
    }

    if (!(GetUnitFromCharId(def->pid)->state & US_DEAD) && !UnitInfoRequiresNoMovement(def))
    {
        if (!CanDisplayUnitMovement(proc, def->x_load, def->y_load))
            goto end;

        LoadUnitCore(def, proc);
    }

    def++;
    proc->unit_info = def;

test:
    if (def->pid != 0)
        goto loop;

    proc->idle_func = EventMovementWait;

end:
    ForceSyncUnitSpriteSheet();
}
#else
ASM_FUNC("asm/nonmatching/code_0800D098.s");
#endif

void EventLoadUnitsAsParty(struct EventProc * proc)
{
    struct UnitDefinition const * def = proc->unit_info;
    int count = 0;
    int i;

    for (i = 1; i < 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (unit == NULL || unit->pCharacterData == NULL)
            continue;

        if (unit->state & (US_DEAD | US_BIT16))
            continue;

        count++;
    }

    if (count > 0 && GetChapterInfo(gPlaySt.chapterIndex)->has_prep)
        return;

    if (GetChapterInfo(gPlaySt.chapterIndex)->has_prep)
    {
        for (i = 1; i < 0x40; i++)
        {
            struct Unit * unit = GetUnit(i);

            if (unit == NULL || unit->pCharacterData == NULL)
                continue;

            if (unit->state & (US_DEAD | US_BIT16))
                continue;

            unit->state |= US_HIDDEN;
        }
    }
    else
    {
        for (i = 1; i < 0x40; i++)
        {
            struct Unit * unit = GetUnit(i);

            if (unit == NULL || unit->pCharacterData == NULL)
                continue;

            if (unit->state & (US_DEAD | US_BIT16))
                continue;

            unit->state = (unit->state | US_HIDDEN) & ~US_NOT_DEPLOYED;
        }
    }

    i = 0;

    while (def->pid != 0 && (i = GetNextAvailableBlueUnitId(i)) != 0)
    {
        struct Unit * unit = GetUnit(i);
        i++;
        FakeLoadUnit(def, unit);
        def++;
    }

    for (i = 1; i < 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (unit == NULL || unit->pCharacterData == NULL)
            continue;

        if (unit->state & US_DEAD)
            continue;

        if (unit->state & US_HIDDEN)
            unit->state |= US_NOT_DEPLOYED;
    }

    RefreshEntityMaps();
    RefreshUnitSprites();
}

int EvtCmd_LoadUnit(struct EventProc * proc)
{
    EventScr const * script = proc->script;

    u8 pid = SCR_LO16(script[1]);
    u8 jid = SCR_HI16(script[1]);
    u8 x = SCR_LO16(script[2]);
    u8 y = SCR_HI16(script[2]);

    sEventLoadUnitBuf.pid_lead = gUnitDef_08B91A18.pid_lead;
    sEventLoadUnitBuf.autolevel = gUnitDef_08B91A18.autolevel;
    sEventLoadUnitBuf.faction_id = gUnitDef_08B91A18.faction_id;
    sEventLoadUnitBuf.level = gUnitDef_08B91A18.level;
    sEventLoadUnitBuf.items[0] = gUnitDef_08B91A18.items[0];
    sEventLoadUnitBuf.items[1] = gUnitDef_08B91A18.items[1];
    sEventLoadUnitBuf.items[2] = gUnitDef_08B91A18.items[2];
    sEventLoadUnitBuf.items[3] = gUnitDef_08B91A18.items[3];
    sEventLoadUnitBuf.ai[0] = gUnitDef_08B91A18.ai[0];
    sEventLoadUnitBuf.ai[1] = gUnitDef_08B91A18.ai[1];
    sEventLoadUnitBuf.ai[2] = gUnitDef_08B91A18.ai[2];
    sEventLoadUnitBuf.ai[3] = gUnitDef_08B91A18.ai[3];

    sEventLoadUnitBuf.pid = pid;
    sEventLoadUnitBuf.jid = jid;
    sEventLoadUnitBuf.x_load = x;
    sEventLoadUnitBuf.y_load = y;
    sEventLoadUnitBuf.x_move = x;
    sEventLoadUnitBuf.y_move = y;

    LoadUnitCore(&sEventLoadUnitBuf, NULL);

    return EVENT_CMDRET_YIELD;
}

void EventMovementWait(struct EventProc * proc)
{
    s8 active = MuExistsActive();

    if (!active)
    {
        BmMapFillg(gBmMapOther, 0);
        proc->idle_func = NULL;
    }
}

int EvtCmd_WaitForMovement(struct EventProc * proc)
{
    if (MuExistsActive())
        return EVENT_CMDRET_REPEAT;

    BmMapFillg(gBmMapOther, 0);

    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_UnitCameraOn(struct EventProc * proc)
{
    proc->flags |= EVENT_FLAG_UNITCAM;
    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_UnitCameraOff(struct EventProc * proc)
{
    proc->flags &= ~EVENT_FLAG_UNITCAM;
    return EVENT_CMDRET_CONTINUE;
}

int Event3C_ASMC1(struct EventProc * proc)
{
    EventScr const * next = proc->script + 1;

    ((void (*)(struct EventProc *)) proc->script[1])(proc);

    if (next != proc->script + 1)
        return EVENT_CMDRET_JUMPED;

    return EVENT_CMDRET_YIELD;
}

int Event3D_ASMC2(struct EventProc * proc)
{
    EventScr const * script = proc->script;
    EventScr const * next = script + 1;

    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    ((void (*)(struct EventProc *)) script[1])(proc);

    if (next != proc->script + 1)
        return EVENT_CMDRET_JUMPED;

    return EVENT_CMDRET_CONTINUE;
}

int Event3E_ASMC3(struct EventProc * proc)
{
    EventScr const * script = proc->script;
    EventScr const * next = script + 1;

    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    if (proc->flags & EVENT_FLAG_TEXTSKIPPED)
        return EVENT_CMDRET_CONTINUE;

    ((void (*)(struct EventProc *)) script[1])(proc);

    if (next != proc->script + 1)
        return EVENT_CMDRET_JUMPED;

    return EVENT_CMDRET_CONTINUE;
}

int Event3F_ASMC4(struct EventProc * proc)
{
    EventScr const * next = proc->script + 1;
    u8 result = ((u8 (*)(struct EventProc *)) proc->script[1])(proc);

    if (next != proc->script + 1)
        return EVENT_CMDRET_JUMPED;

    if (result)
        return EVENT_CMDRET_CONTINUE;

    return EVENT_CMDRET_REPEAT;
}

int Event40_ASMC5(struct EventProc * proc)
{
    EventScr const * next = proc->script + 1;
    u8 result = ((u8 (*)(struct EventProc *)) proc->script[1])(proc);

    if (next != proc->script + 1)
        return EVENT_CMDRET_JUMPED;

    if (result)
        return EVENT_CMDRET_REPEAT;

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_Stop(struct EventProc * proc)
{
    return EVENT_CMDRET_REPEAT;
}

int EvtCmd_Label(struct EventProc * proc)
{
    return EVENT_CMDRET_CONTINUE;
}

int EventGotoLabel(struct EventProc * proc, int label)
{
    EventScr const * it = proc->script_start;

    while (*it != 0)
    {
        if ((*it & 0xFFFF) == 0x44 && it[1] == label)
        {
            proc->script = it + gEventCmdTable[0x44].length;
            return EVENT_CMDRET_JUMPED;
        }

        it += gEventCmdTable[*it & 0xFFFF].length;
    }

    return EVENT_CMDRET_YIELD;
}

int Event43_Goto(struct EventProc * proc)
{
    return EventGotoLabel(proc, proc->script[1]);
}

int EvtCmd_GotoIfnAlive(struct EventProc * proc)
{
    u16 pid = SCR_LO16(proc->script[2]);
    int i;

    for (i = 1; i < 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (unit == NULL || unit->pCharacterData == NULL)
            continue;

        if (unit->state & US_DEAD)
            continue;

        if (unit->pCharacterData->number == pid)
            return EVENT_CMDRET_CONTINUE;
    }

    return EventGotoLabel(proc, proc->script[1]);
}

int EvtCmd_GotoIfnInTeam(struct EventProc * proc)
{
    u16 pid = SCR_LO16(proc->script[2]);
    int i;

    for (i = 1; i < 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (unit == NULL || unit->pCharacterData == NULL)
            continue;

        if (unit->state & (US_DEAD | US_NOT_DEPLOYED))
            continue;

        if (unit->pCharacterData->number == pid)
            return EVENT_CMDRET_CONTINUE;
    }

    return EventGotoLabel(proc, proc->script[1]);
}

int EvtCmd_GotoIfyFunc(struct EventProc * proc)
{
    if (((u8 (*)(void)) proc->script[2])())
        return EventGotoLabel(proc, proc->script[1]);

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_GotoIfnFunc(struct EventProc * proc)
{
    if (!((u8 (*)(void)) proc->script[2])())
        return EventGotoLabel(proc, proc->script[1]);

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_GotoIfySkip(struct EventProc * proc)
{
    if (proc->flags & (EVENT_FLAG_SKIPPED | EVENT_FLAG_TEXTSKIPPED))
        return EventGotoLabel(proc, proc->script[1]);

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_GotoIfySkipText(struct EventProc * proc)
{
    if (proc->flags & EVENT_FLAG_TEXTSKIPPED)
        return EventGotoLabel(proc, proc->script[1]);

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_GotoIfyFlag(struct EventProc * proc)
{
    EventScr const * it = proc->script_start;
    int label = proc->script[1];

    if (!CheckFlag(proc->script[2]))
        return EVENT_CMDRET_CONTINUE;

    while (*it != 0)
    {
        if ((*it & 0xFFFF) == 0x44 && it[1] == label)
        {
            proc->script = it + gEventCmdTable[0x44].length;
            return EVENT_CMDRET_JUMPED;
        }

        it += gEventCmdTable[*it & 0xFFFF].length;
    }

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_GotoIfnFlag(struct EventProc * proc)
{
    EventScr const * it = proc->script_start;
    int label = proc->script[1];

    if (CheckFlag(proc->script[2]))
        return EVENT_CMDRET_CONTINUE;

    while (*it != 0)
    {
        if ((*it & 0xFFFF) == 0x44 && it[1] == label)
        {
            proc->script = it + gEventCmdTable[0x44].length;
            return EVENT_CMDRET_JUMPED;
        }

        it += gEventCmdTable[*it & 0xFFFF].length;
    }

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_GotoIfyActive(struct EventProc * proc)
{
    EventScr const * it = proc->script_start;
    EventScr const * script = proc->script;
    int label = script[1];

    if (SCR_HI16(script[0]) != 0)
    {
        if (gActiveUnit->pCharacterData->number != (u8) script[2])
            return EVENT_CMDRET_CONTINUE;
    }
    else
    {
        if (gActiveUnit->pCharacterData->number == (u8) script[2])
            return EVENT_CMDRET_CONTINUE;
    }

    while (*it != 0)
    {
        if ((*it & 0xFFFF) == 0x44 && it[1] == label)
        {
            proc->script = it + gEventCmdTable[0x44].length;
            return EVENT_CMDRET_JUMPED;
        }

        it += gEventCmdTable[*it & 0xFFFF].length;
    }

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_GotoIfyEliwoodMode(struct EventProc * proc)
{
    if (gPlaySt.chapterModeIndex == 2)
        return EventGotoLabel(proc, proc->script[1]);

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_GotoIfyHectorMode(struct EventProc * proc)
{
    if (gPlaySt.chapterModeIndex == 3)
        return EventGotoLabel(proc, proc->script[1]);

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_GotoIfyDifficulty(struct EventProc * proc)
{
    EventScr const * script = proc->script;

    if (SCR_HI16(script[0]) != 0)
    {
        if (!(gPlaySt.chapterStateBits & 0x40))
            goto no;
    }
    else
    {
        if (gPlaySt.chapterStateBits & 0x40)
            goto no;
    }

    return EventGotoLabel(proc, script[1]);

no:
    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_GotoIfnTalkYes(struct EventProc * proc)
{
    if (GetTalkChoiceResult() != 1)
        return EventGotoLabel(proc, proc->script[1]);

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_GotoIfnTalkYes2(struct EventProc * proc)
{
    if (GetTalkChoiceResult() != 1)
        return EventGotoLabel(proc, proc->script[1]);

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_GotoIfnTutorial(struct EventProc * proc)
{
    if ((gPlaySt.chapterStateBits & 0x40) || IsTutorialDisabled())
        return EventGotoLabel(proc, proc->script[1]);

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_GotoIfnDeadAndFlagOnce(struct EventProc * proc)
{
    u16 pid = SCR_LO16(proc->script[2]);
    int flag = proc->script[3];
    int i;

    for (i = 1; i < 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (unit == NULL || unit->pCharacterData == NULL)
            continue;

        if (!(unit->state & US_DEAD))
            continue;

        if (unit->pCharacterData->number != pid)
            continue;

        if (CheckFlag(flag))
            break;

        SetFlag(flag);
        return EVENT_CMDRET_CONTINUE;
    }

    return EventGotoLabel(proc, proc->script[1]);
}

int EvtCmd_GotoIfyTurnCountReached(struct EventProc * proc)
{
    if (gPlaySt.chapterTurnNumber >= SCR_HI16(proc->script[0]))
        return EventGotoLabel(proc, proc->script[1]);

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_GotoIfxDeployed(struct EventProc * proc)
{
    EventScr const * script = proc->script;

    if (SCR_HI16(script[0]) != 0)
    {
        if (!IsPidBlueDeployed((u8) script[2]))
            return EVENT_CMDRET_CONTINUE;
    }
    else
    {
        if (IsPidBlueDeployed((u8) script[2]))
            return EVENT_CMDRET_CONTINUE;
    }

    return EventGotoLabel(proc, proc->script[1]);
}

int EvtCmd_Jump(struct EventProc * proc)
{
    EventScr const * target = (EventScr const *) proc->script[1];

    proc->script = target;
    proc->script_start = target;

    return EVENT_CMDRET_JUMPED;
}

int EvtCmd_SkipNIfyFunc(struct EventProc * proc)
{
    if (((u8 (*)(void)) proc->script[1])())
        proc->ignore_count = SCR_HI16(proc->script[0]);

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_SkipNIfnFunc(struct EventProc * proc)
{
    if (!((u8 (*)(void)) proc->script[1])())
        proc->ignore_count = SCR_HI16(proc->script[0]);

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_GiveItem(struct EventProc * proc)
{
    u16 iid = SCR_LO16(proc->script[1]);
    return EventGiveItem(gActiveUnit, iid, proc);
}

int EvtCmd_GiveItemToPid(struct EventProc * proc)
{
    EventScr const * script = proc->script;
    int pid = SCR_LO16(script[1]);
    u16 iid = SCR_LO16(script[2]);

    if (pid == 0)
        pid = proc->pid_param;

    return EventGiveItem(GetUnitFromCharId(pid), iid, proc);
}

int EvtCmd_GiveItemToLeader(struct EventProc * proc)
{
    u16 iid = SCR_LO16(proc->script[1]);

    return EventGiveItem(GetUnitFromCharId(GetPlayerLeaderUnitId()), iid, proc);
}

int EventGiveItem(struct Unit * unit, u16 iid, struct EventProc * proc)
{
    if (iid == 0)
        iid = proc->iid_param;

    StartGiveItem(unit, iid, proc);

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_MapChange(struct EventProc * proc)
{
    u32 param = SCR_HI16(proc->script[0]);
    u16 id = param;
    u16 remove_prev;

    if (id == 0xFFFF)
    {
        id = proc->map_change_param;
        remove_prev = 0;
    }
    else
    {
        id = id & 0x7FFF;
        remove_prev = param & 0x8000;
    }

    if (!proc->unk_4D)
    {
        RenderMapForFade();

        ApplyMapChange(id);

        if (remove_prev)
            RemoveMapChangeTrap(id - 1);

        AddMapChangeTrap(id);
        RefreshTerrainMap();
        UpdateRoofedUnits();
        RenderMap();

        StartMapFade(TRUE);
    }
    else
    {
        ApplyMapChange(id);

        if (remove_prev)
            RemoveMapChangeTrap(id - 1);

        AddMapChangeTrap(id);
        RefreshTerrainMap();
        UpdateRoofedUnits();
    }

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_MapChangeWithAutoWaterShadows(struct EventProc * proc)
{
    u32 param = SCR_HI16(proc->script[0]);
    u16 id = param;
    u16 remove_prev;

    if (id == 0xFFFF)
    {
        id = proc->map_change_param;
        remove_prev = 0;
    }
    else
    {
        id = id & 0x7FFF;
        remove_prev = param & 0x8000;
    }

    if (!proc->unk_4D)
    {
        RenderMapForFade();

        ApplyMapChange(id);

        if (remove_prev)
        {
            RemoveMapChangeTrap(id - 1);
            PlaySoundEffect(0xBD);
        }
        else
        {
            PlaySoundEffect(0xBE);
        }

        AddMapChangeTrap(id);
        RefreshTerrainMap();
        UpdateRoofedUnits();
        RefreshAutoWaterShadows();
        RenderMap();

        StartMapFade(TRUE);
    }
    else
    {
        ApplyMapChange(id);

        if (remove_prev)
            RemoveMapChangeTrap(id - 1);

        AddMapChangeTrap(id);
        RefreshTerrainMap();
        UpdateRoofedUnits();
        RefreshAutoWaterShadows();
    }

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_MapChangeInstant(struct EventProc * proc)
{
    u16 id = SCR_HI16(proc->script[0]);

    if (id == 0xFFFF)
        id = proc->map_change_param;

    ApplyMapChange(id);
    AddMapChangeTrap(id);
    RefreshTerrainMap();
    UpdateRoofedUnits();
    RenderMap();

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_MapChangeInstantNoRender(struct EventProc * proc)
{
    u32 param = SCR_HI16(proc->script[0]);
    u16 id = param;
    u16 remove_prev;

    if (id == 0xFFFF)
    {
        id = proc->map_change_param;
        remove_prev = 0;
    }
    else
    {
        id = id & 0x7FFF;
        remove_prev = param & 0x8000;
    }

    ApplyMapChange(id);

    if (remove_prev)
        RemoveMapChangeTrap(id - 1);
    else
        AddMapChangeTrap(id);

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_ReRenderMap(struct EventProc * proc)
{
    RefreshTerrainMap();
    UpdateRoofedUnits();

    if (SCR_HI16(proc->script[0]) != 0)
        RefreshAutoWaterShadows();

    RenderMap();

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_MapChangePosition(struct EventProc * proc)
{
    EventScr word = proc->script[0];
    int id = GetMapChangeIdAt((u8) (word >> 16), word >> 24);

    if (id == -1)
        id = proc->map_change_param;

    if (!proc->unk_4D)
    {
        RenderMapForFade();

        ApplyMapChange(id);
        AddMapChangeTrap(id);
        RefreshTerrainMap();
        UpdateRoofedUnits();
        RenderMap();

        StartMapFade(TRUE);
    }
    else
    {
        ApplyMapChange(id);
        AddMapChangeTrap(id);
        RefreshTerrainMap();
        UpdateRoofedUnits();
    }

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_SetFaction(struct EventProc * proc)
{
    u8 pid = proc->script[1];
    int faction = proc->script[2];
    int i;

    for (i = 1; i < 0xC0; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (unit == NULL || unit->pCharacterData == NULL)
            continue;

        if (unit->state & US_DEAD)
            continue;

        if (unit->pCharacterData->number != pid)
            continue;

        UnitChangeFaction(unit, faction);
    }

    RefreshUnitSprites();

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_FlashCursorPosition(struct EventProc * proc)
{
    struct EventCursorProc * cursor;
    u16 x, y;

    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    x = SCR_LO16_SIGN(proc->script[1]);
    y = SCR_HI16_SIGN(proc->script[1]);

    cursor = Proc_Start(ProcScr_EventFlashCursor, proc);
    cursor->x = x;
    cursor->y = y;

    proc->idle_func = EventFlashCursorWait;

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_FlashCursorPid(struct EventProc * proc)
{
    struct Unit * unit = GetUnitFromCharId(proc->script[1]);
    struct EventCursorProc * cursor;

    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    cursor = Proc_Start(ProcScr_EventFlashCursor, proc);
    cursor->x = unit->xPos;
    cursor->y = unit->yPos;

    proc->idle_func = EventFlashCursorWait;

    return EVENT_CMDRET_YIELD;
}

void EventFlashCursorWait(struct EventProc * proc)
{
    if (proc->flags & EVENT_FLAG_SKIPPED)
    {
        Proc_EndEach(ProcScr_EventFlashCursor);
        proc->idle_func = NULL;
        return;
    }

    if (!Proc_Find(ProcScr_EventFlashCursor))
        proc->idle_func = NULL;
}

void EventFlashCursor_OnInit(struct EventCursorProc * proc)
{
    proc->timer = 60;
}

void EventFlashCursor_OnLoop(struct EventCursorProc * proc)
{
    if (--proc->timer <= 0)
        Proc_Break(proc);

    PutMapCursor(proc->x * 16, proc->y * 16, 0);
}

int EvtCmd_PutCursor(struct EventProc * proc)
{
    struct EventCursorProc * cursor;
    u16 x, y;

    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    x = SCR_LO16_SIGN(proc->script[1]);
    y = SCR_HI16_SIGN(proc->script[1]);

    cursor = Proc_Start(ProcScr_EventCursor, proc);
    cursor->x = x;
    cursor->y = y;

    return EVENT_CMDRET_YIELD;
}

void EventCursor_Loop(struct EventCursorProc * proc)
{
    PutMapCursor(proc->x * 16, proc->y * 16, 0);
}

int EvtCmd_ClearCursors(struct EventProc * proc)
{
    Proc_EndEach(ProcScr_EventCursor);
    return EVENT_CMDRET_CONTINUE;
}

bool EventIsPidBlueForDisable(u8 pid)
{
    int i;

    for (i = 1; i < 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (unit == NULL || unit->pCharacterData == NULL)
            continue;

        if (unit->pCharacterData->number == pid)
            return TRUE;
    }

    return FALSE;
}

int EvtCmd_RemovePosition(struct EventProc * proc)
{
    s16 x = SCR_LO16_SIGN(proc->script[1]);
    s16 y = SCR_HI16_SIGN(proc->script[1]);

    struct Unit * unit = GetUnit(gBmMapUnit[y][x]);

    if (EventIsPidBlueForDisable(unit->pCharacterData->number))
        unit->state |= US_HIDDEN | US_NOT_DEPLOYED;
    else
        ClearUnit(unit);

    RefreshEntityMaps();
    RefreshUnitSprites();

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_RemovePid(struct EventProc * proc)
{
    struct Unit * unit = GetUnitFromCharId(proc->script[1]);

    if (EventIsPidBlueForDisable(proc->script[1]))
        unit->state |= US_HIDDEN | US_NOT_DEPLOYED;
    else
        ClearUnit(unit);

    RefreshEntityMaps();
    RefreshUnitSprites();

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_RemovePositionDisplayed(struct EventProc * proc)
{
    s16 x = SCR_LO16_SIGN(proc->script[1]);
    s16 y = SCR_HI16_SIGN(proc->script[1]);

    struct Unit * unit = GetUnit(gBmMapUnit[y][x]);

    if (proc->flags & EVENT_FLAG_SKIPPED)
    {
        if (EventIsPidBlueForDisable(unit->pCharacterData->number))
            unit->state |= US_HIDDEN | US_NOT_DEPLOYED;
        else
            ClearUnit(unit);

        RefreshEntityMaps();
        RefreshUnitSprites();
    }
    else
    {
        struct MuProc * mu;

        proc->pid_param = unit->pCharacterData->number;

        HideUnitSprite(unit);

        mu = StartMu(unit);
        MU_SetDefaultFacing_Auto();
        StartMuDeathFade(mu);

        proc->idle_func = EventRemoveDisplayedWait;
        proc->sleep_duration = 60;
    }

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_RemovePidDisplayed(struct EventProc * proc)
{
    struct Unit * unit;

    proc->pid_param = proc->script[1];
    unit = GetUnitFromCharId(proc->pid_param);

    if (proc->flags & EVENT_FLAG_SKIPPED)
    {
        if (EventIsPidBlueForDisable(unit->pCharacterData->number))
            unit->state |= US_HIDDEN | US_NOT_DEPLOYED;
        else
            ClearUnit(unit);

        RefreshEntityMaps();
        RefreshUnitSprites();
    }
    else
    {
        struct MuProc * mu;

        HideUnitSprite(unit);

        mu = StartMu(unit);
        MU_SetDefaultFacing_Auto();
        StartMuDeathFade(mu);

        proc->idle_func = EventRemoveDisplayedWait;
        proc->sleep_duration = 60;
    }

    return EVENT_CMDRET_YIELD;
}

void EventRemoveDisplayedWait(struct EventProc * proc)
{
    struct Unit * unit = GetUnitFromCharId(proc->pid_param);

    EndAllMus();
    ClearUnit(unit);

    RefreshEntityMaps();
    RefreshUnitSprites();

    proc->idle_func = NULL;
}

int EvtCmd_HidePosition(struct EventProc * proc)
{
    s16 x = SCR_LO16_SIGN(proc->script[1]);
    s16 y = SCR_HI16_SIGN(proc->script[1]);

    struct Unit * unit = GetUnit(gBmMapUnit[y][x]);

    unit->state |= US_HIDDEN | US_NOT_DEPLOYED;

    RefreshEntityMaps();
    RefreshUnitSprites();

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_HidePid(struct EventProc * proc)
{
    struct Unit * unit = GetUnitFromCharId(proc->script[1]);

    unit->state |= US_HIDDEN | US_NOT_DEPLOYED;

    RefreshEntityMaps();
    RefreshUnitSprites();

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_DisablePid(struct EventProc * proc)
{
    struct Unit * unit = GetUnitFromCharId(proc->script[1]);

    unit->state |= 0x04010000;

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_EnablePid(struct EventProc * proc)
{
    struct Unit * unit = GetUnitFromCharId(proc->script[1]);

    unit->state &= ~0x00400000;

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_SetState(struct EventProc * proc)
{
    struct Unit * unit = GetUnitFromCharId(proc->script[1]);

    u32 bits = proc->script[2];

    unit->state |= bits;

    RefreshEntityMaps();
    RefreshUnitSprites();

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_ClearState(struct EventProc * proc)
{
    struct Unit * unit = GetUnitFromCharId(proc->script[1]);

    unit->state &= ~proc->script[2];

    RefreshEntityMaps();
    RefreshUnitSprites();

    return EVENT_CMDRET_YIELD;
}

void EventSetUnitAi(struct Unit * unit, u8 ai1, u8 ai2, int unused)
{
    if (ai1 != 0x14)
    {
        unit->ai1 = ai1;
        unit->ai1data = 0;
    }

    if (ai2 != 0x23)
    {
        unit->ai2 = ai2;
        unit->ai2data = 0;

        if (ai2 == 0xC)
            unit->aiFlags |= 8;
    }
}

int EvtCmd_SetAiPid(struct EventProc * proc)
{
    EventScr const * script = proc->script;
    u8 pid = script[1];
    u32 ai = script[2];
    u8 ai1 = script[2];
    u8 ai2 = (ai & 0xFF00) >> 8;
    u8 ai3 = (ai & 0xFF0000) >> 16;
    int i;

    for (i = 1; i < 0xC0; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (unit == NULL || unit->pCharacterData == NULL)
            continue;

        if (unit->state & (US_HIDDEN | US_DEAD))
            continue;

        if (unit->pCharacterData->number != pid)
            continue;

        EventSetUnitAi(unit, ai1, ai2, ai3);
    }

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_SetAiPosition(struct EventProc * proc)
{
    EventScr const * script = proc->script;
    u32 ai = script[2];
    u8 ai1 = script[2];
    u8 ai2 = (ai & 0xFF00) >> 8;
    u8 ai3 = (ai & 0xFF0000) >> 16;
    int i = 0x41;
    int x = ((s8 const *) script)[4];
    int y = ((s8 const *) script)[6];

    for (; i < 0xC0; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (unit == NULL || unit->pCharacterData == NULL)
            continue;

        if (unit->state & (US_HIDDEN | US_DEAD))
            continue;

        if (unit->xPos != x || unit->yPos != y)
            continue;

        EventSetUnitAi(unit, ai1, ai2, ai3);
    }

    return EVENT_CMDRET_CONTINUE;
}

