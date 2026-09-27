#include "gbafe.h"
#include "gbafe/bmtarget.h"
#include "gbafe/unk-functions.h"

/* defined in other event engine modules */
void StartGiveItem(struct Unit * unit, int iid, struct EventProc * proc);
void LoadUnitCore(struct UnitDefinition const * def, struct EventProc * proc);
void FakeLoadUnit(struct UnitDefinition const * def, struct Unit * unit);
bool CanDisplayUnitMovement(struct EventProc * proc, int x, int y);
bool UnitInfoRequiresNoMovement(struct UnitDefinition const * def);
int GetNextAvailableBlueUnitId(int id);

/* not yet declared elsewhere */
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

ASM_FUNC("asm/nonmatching/code_0800D098.s");

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

ASM_FUNC("asm/nonmatching/code_0800DA88.s");

ASM_FUNC("asm/nonmatching/code_0800DB58.s");

ASM_FUNC("asm/nonmatching/code_0800DB90.s");

ASM_FUNC("asm/nonmatching/code_0800DBE8.s");

ASM_FUNC("asm/nonmatching/code_0800DC0C.s");

ASM_FUNC("asm/nonmatching/code_0800DC80.s");

ASM_FUNC("asm/nonmatching/code_0800DCC8.s");

ASM_FUNC("asm/nonmatching/code_0800DD38.s");

ASM_FUNC("asm/nonmatching/code_0800DD88.s");

ASM_FUNC("asm/nonmatching/code_0800DDC0.s");

ASM_FUNC("asm/nonmatching/code_0800DDC8.s");

ASM_FUNC("asm/nonmatching/code_0800DDFC.s");

ASM_FUNC("asm/nonmatching/code_0800DE64.s");

ASM_FUNC("asm/nonmatching/code_0800DE84.s");

ASM_FUNC("asm/nonmatching/code_0800DE98.s");

ASM_FUNC("asm/nonmatching/code_0800DEC8.s");

ASM_FUNC("asm/nonmatching/code_0800DF50.s");

ASM_FUNC("asm/nonmatching/code_0800DF8C.s");

ASM_FUNC("asm/nonmatching/code_0800E058.s");

ASM_FUNC("asm/nonmatching/code_0800E0D4.s");

ASM_FUNC("asm/nonmatching/code_0800E100.s");

ASM_FUNC("asm/nonmatching/code_0800E16C.s");

ASM_FUNC("asm/nonmatching/code_0800E18C.s");

ASM_FUNC("asm/nonmatching/code_0800E1A8.s");

ASM_FUNC("asm/nonmatching/code_0800E1C4.s");

ASM_FUNC("asm/nonmatching/code_0800E1EC.s");

ASM_FUNC("asm/nonmatching/code_0800E214.s");

ASM_FUNC("asm/nonmatching/code_0800E254.s");

ASM_FUNC("asm/nonmatching/code_0800E2B8.s");

