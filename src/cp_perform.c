#include "gbafe.h"
#include "gbafe/cp_common.h"

struct AiTargetCursorProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ int x;
    /* 30 */ int y;
    /* 34 */ u8 _pad1[0x58 - 0x34];
    /* 58 */ int kind;
    /* 5C */ u8 _pad2[0x64 - 0x5C];
    /* 64 */ s16 clock;
};

struct CpPerformProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ s8 (* func)(struct CpPerformProc * proc);
    /* 30 */ u8 clock;
    /* 31 */ u8 isUnitVisible;
};

// Declarations of other modules' functions not yet in any header
void UnitBeginAction(struct Unit * unit);
void DoAction(ProcPtr proc);
void DoItemAction(ProcPtr proc);
void StartAvailableTileEvent(s8 x, s8 y);
ProcPtr NewPopup_Simple(const struct PopupInstruction * inst, int duration, int winStyle, ProcPtr parent);
void StartCharacterEvent(u8 pidA, u8 pidB);
struct MuProc * StartMu(struct Unit * unit);
void MU_SetDefaultFacing_Auto(void);
void SetAutoMuMoveScript(const u8 * commands);
s8 MuExistsActive(void);

extern struct ProcCmd CONST_DATA ProcScr_AiTargetCursor[];
extern struct ProcCmd CONST_DATA ProcScr_08B85854[];
extern struct PopupInstruction CONST_DATA PopupScr_AiPillage[];

void CpPerform_MoveCameraOntoUnit(struct CpPerformProc * proc);
void CpPerform_BeginUnitMovement(struct CpPerformProc * proc);
void AiStartCombatAction(struct CpPerformProc * proc);
void AiStartEscapeAction(struct CpPerformProc * proc);
void AiStartStealAction(struct CpPerformProc * proc);
s8 AiPillageAction(struct CpPerformProc * proc);
s8 AiStaffAction(struct CpPerformProc * proc);
s8 AiUseItemAction(struct CpPerformProc * proc);
s8 AiRefreshAction(struct CpPerformProc * proc);
s8 AiTalkAction(struct CpPerformProc * proc);
s8 AiRideBallistaAction(struct CpPerformProc * proc);
s8 AiExitBallistaAction(struct CpPerformProc * proc);
void CpPerform_MoveCameraOntoTarget(struct CpPerformProc * proc);
void CpPerform_PerformAction(struct CpPerformProc * proc);
void CpPerform_WaitAction(struct CpPerformProc * proc);
void CpPerform_Cleanup(struct CpPerformProc * proc);
s8 AiDummyAction(struct CpPerformProc * proc);
s8 AiEscapeAction(struct CpPerformProc * proc);
s8 AiWaitAndClearScreenAction(struct CpPerformProc * proc);
void CpPerform_EquipBest(struct CpPerformProc * proc);

void AiTargetCursor_Main(ProcPtr p)
{
    struct AiTargetCursorProc * proc = p;

    PutMapCursor(proc->x, proc->y, proc->kind);

    if ((gpKeySt->held & (A_BUTTON | START_BUTTON)) || (proc->clock > 45))
        Proc_Break(proc);

    proc->clock++;
}

void StartAiTargetCursor(int x, int y, int kind, ProcPtr parent)
{
    struct AiTargetCursorProc * proc;

    proc = Proc_StartBlocking(ProcScr_AiTargetCursor, parent);

    proc->x = x;
    proc->y = y;
    proc->kind = kind;
    proc->clock = 0;
}

void CpPerform_UpdateMapMusic(void)
{
    if (!Proc_Find(ProcScr_08B85854))
        StartMapSongBgm();
}

void CpPerform_MoveCameraOntoUnit(struct CpPerformProc * proc)
{
    proc->isUnitVisible = 1;

    if ((gPlaySt.chapterVisionRange != 0) && (gPlaySt.faction == FACTION_RED))
    {
        if ((gBmMapFog[gActiveUnit->yPos][gActiveUnit->xPos] != 0) || (gBmMapFog[gAiDecision.yMove][gAiDecision.xMove] != 0))
        {
            EnsureCameraOntoPosition(proc, gActiveUnit->xPos, gActiveUnit->yPos);
        }
        else
        {
            proc->isUnitVisible = 0;

            if (gAiDecision.actionId == AI_ACTION_PILLAGE)
                EnsureCameraOntoPosition(proc, gAiDecision.xMove, gAiDecision.yMove);
        }
    }
    else
    {
        EnsureCameraOntoPosition(proc, gActiveUnit->xPos, gActiveUnit->yPos);
    }
}

void CpPerform_BeginUnitMovement(struct CpPerformProc * proc)
{
    UnitBeginAction(gActiveUnit);

    HideUnitSprite(gActiveUnit);

    RevertMapChange(gActiveUnit);
    SetWorkingBmMap(gBmMapMovement);

    BuildBestMoveScript(gAiDecision.xMove, gAiDecision.yMove, gWorkingMoveScr);

    UnitApplyWorkingMovementScript(gActiveUnit, gActiveUnit->xPos, gActiveUnit->yPos);

    gAiDecision.xMove = gActionSt.x_move;
    gAiDecision.yMove = gActionSt.y_move;

    if (proc->isUnitVisible)
    {
        StartMu(gActiveUnit);
        MU_SetDefaultFacing_Auto();
        SetAutoMuMoveScript(gWorkingMoveScr);
    }
}

void AiEndMuAndRefreshUnits(void)
{
    gActiveUnit = GetUnit(gActionSt.instigator);

    SetMapCursorPosition(gAiDecision.xMove, gAiDecision.yMove);
    RenderMapForFade();

    MoveActiveUnit(gAiDecision.xMove, gAiDecision.yMove);

    RefreshEntityMaps();
    RenderMap();

    StartMapFade(1);

    EndAllMus();
    RefreshEntityMaps();

    ShowUnitSprite(gActiveUnit);
    RefreshUnitSprites();
}

void AiStartCombatAction(struct CpPerformProc * proc)
{
    gActionSt.instigator = gActiveUnitId;
    gActionSt.id = ACTION_COMBAT;
    gActionSt.target = gAiDecision.targetId;

    gActiveUnit->xPos = gAiDecision.xMove;
    gActiveUnit->yPos = gAiDecision.yMove;

    if (gAiDecision.targetId == 0)
    {
        struct Trap * trap = GetTrapAt(gAiDecision.xTarget, gAiDecision.yTarget);
        gActionSt.x_target = trap->xPos;
        gActionSt.y_target = trap->yPos;
        gActionSt.extra = trap->extra;
    }

    if ((s8)gAiDecision.itemSlot != -1)
    {
        EquipUnitItemSlot(gActiveUnit, gAiDecision.itemSlot);
        gActionSt.item_slot = 0;
    }
    else
    {
        gActionSt.item_slot = ITEMSLOT_BALLISTA;
    }

    DoAction(proc);
}

void AiStartEscapeAction(struct CpPerformProc * proc)
{
    u8 scripts[4][3] = {
        { MOVE_CMD_MOVE_LEFT,  MOVE_CMD_MOVE_LEFT,  MOVE_CMD_HALT },
        { MOVE_CMD_MOVE_RIGHT, MOVE_CMD_MOVE_RIGHT, MOVE_CMD_HALT },
        { MOVE_CMD_MOVE_DOWN,  MOVE_CMD_MOVE_DOWN,  MOVE_CMD_HALT },
        { MOVE_CMD_MOVE_UP,    MOVE_CMD_MOVE_UP,    MOVE_CMD_HALT },
    };

    if ((gAiDecision.xTarget != 5) && (proc->isUnitVisible))
        SetAutoMuMoveScript(scripts[gAiDecision.xTarget]);
}

void AiStartStealAction(struct CpPerformProc * proc)
{
    struct Unit * unit = GetUnit(gAiDecision.targetId);

    u16 item = unit->items[gAiDecision.itemSlot];

    UnitAddItem(gActiveUnit, item);
    UnitRemoveItem(unit, gAiDecision.itemSlot);

    StartStoleItemPopup(item, proc);
}

s8 AiPillageAction(struct CpPerformProc * proc)
{
    int x = gAiDecision.xMove;
    int y = gAiDecision.yMove;

    if (gBmMapTerrain[y][x] == TERRAIN_CHEST)
    {
        gActiveUnit->xPos = gAiDecision.xMove;
        gActiveUnit->yPos = gAiDecision.yMove;

        gActionSt.id = ACTION_USEITEM;
        gAiDecision.itemSlot = gAiDecision.itemSlot; // dummy
        gActionSt.item_slot = gAiDecision.itemSlot;

        DoItemAction(proc);
    }
    else
    {
        s8 y2 = y - 1;
        StartAvailableTileEvent((s8)x, y2);

        PlaySoundEffect(0xAB);

        NewPopup_Simple(PopupScr_AiPillage, 0x60, 0, proc);
    }

    return 1;
}

s8 AiStaffAction(struct CpPerformProc * proc)
{
    gActiveUnit->xPos = gAiDecision.xMove;
    gActiveUnit->yPos = gAiDecision.yMove;

    gActionSt.id = ACTION_STAFF;

    gActionSt.target = gAiDecision.targetId;
    gActionSt.item_slot = gAiDecision.itemSlot;

    DoItemAction(proc);

    return 1;
}

s8 AiUseItemAction(struct CpPerformProc * proc)
{
    gActiveUnit->xPos = gAiDecision.xMove;
    gActiveUnit->yPos = gAiDecision.yMove;

    gActionSt.id = ACTION_USEITEM;
    gActionSt.item_slot = gAiDecision.itemSlot;

    DoItemAction(proc);

    return 1;
}

s8 AiRefreshAction(struct CpPerformProc * proc)
{
    return 1;
}

s8 AiTalkAction(struct CpPerformProc * proc)
{
    gActiveUnit->xPos = gAiDecision.xMove;
    gActiveUnit->yPos = gAiDecision.yMove;

    if (gAiDecision.targetId == 0)
    {
        StartCharacterEvent(
            GetUnit(gAiDecision.itemSlot)->pCharacterData->number,
            GetUnit(gAiDecision.xTarget)->pCharacterData->number);
    }

    return 1;
}

s8 AiRideBallistaAction(struct CpPerformProc * proc)
{
    gActiveUnit->xPos = gAiDecision.xMove;
    gActiveUnit->yPos = gAiDecision.yMove;

    RideBallista(gActiveUnit);

    return 1;
}

s8 AiExitBallistaAction(struct CpPerformProc * proc)
{
    gActiveUnit->xPos = gAiDecision.xMove;
    gActiveUnit->yPos = gAiDecision.yMove;

    TryRemoveUnitFromBallista(gActiveUnit);

    return 1;
}

void CpPerform_MoveCameraOntoTarget(struct CpPerformProc * proc)
{
    struct Unit * unit;

    int x = 0;
    int y = 0;

    if (gActionSt.id == ACTION_TRAPPED)
        return;

    switch (gAiDecision.actionId)
    {
    case AI_ACTION_NONE:
    case AI_ACTION_ESCAPE:
    case AI_ACTION_PILLAGE:
    case AI_ACTION_USEITEM:
    case AI_ACTION_RIDEBALLISTA:
    case AI_ACTION_EXITBALLISTA:
        return;

    case AI_ACTION_COMBAT:
        if (gAiDecision.targetId == 0)
        {
            x = gAiDecision.xTarget;
            y = gAiDecision.yTarget;
        }
        else
        {
            unit = GetUnit(gAiDecision.targetId);
            x = unit->xPos;
            y = unit->yPos;
        }

        if (((s8)gAiDecision.itemSlot == -1) && !(gActiveUnit->state & US_IN_BALLISTA))
        {
            EndAllMus();

            gActiveUnit->xPos = gAiDecision.xMove;
            gActiveUnit->yPos = gAiDecision.yMove;

            RideBallista(gActiveUnit);

            StartMu(gActiveUnit);
            MU_SetDefaultFacing_Auto();
        }

        break;

    case AI_ACTION_STEAL:
        unit = GetUnit(gAiDecision.targetId);

        x = unit->xPos;
        y = unit->yPos;

        break;

    case AI_ACTION_REFRESH:
        unit = GetUnit(gAiDecision.targetId);

        x = unit->xPos;
        y = unit->yPos;

        break;

    case AI_ACTION_TALK:
        unit = GetUnit(gAiDecision.yTarget);

        x = unit->xPos;
        y = unit->yPos;

        break;

    case AI_ACTION_STAFF:
        if (gAiDecision.targetId == 0)
            return;

        unit = GetUnit(gAiDecision.targetId);

        x = unit->xPos;
        y = unit->yPos;

        break;
    }

    EnsureCameraOntoPosition(proc, x, y);
    StartAiTargetCursor(x * 16, y * 16, 2, proc);
}

void CpPerform_PerformAction(struct CpPerformProc * proc)
{
    proc->clock = 0;

    if (gActionSt.id == ACTION_TRAPPED)
    {
        proc->func = AiDummyAction;
        return;
    }

    switch (gAiDecision.actionId)
    {
    case AI_ACTION_NONE:
        proc->func = AiDummyAction;
        break;

    case AI_ACTION_COMBAT:
        proc->func = AiDummyAction;
        AiStartCombatAction(proc);
        break;

    case AI_ACTION_ESCAPE:
        AiStartEscapeAction(proc);
        proc->func = AiEscapeAction;
        break;

    case AI_ACTION_STEAL:
        AiStartStealAction(proc);
        proc->func = AiWaitAndClearScreenAction;
        break;

    case AI_ACTION_PILLAGE:
        proc->func = AiPillageAction;
        break;

    case AI_ACTION_STAFF:
        proc->func = AiStaffAction;
        break;

    case AI_ACTION_USEITEM:
        proc->func = AiUseItemAction;
        break;

    case AI_ACTION_REFRESH:
        proc->func = AiRefreshAction;
        break;

    case AI_ACTION_TALK:
        proc->func = AiTalkAction;
        break;

    case AI_ACTION_RIDEBALLISTA:
        proc->func = AiRideBallistaAction;
        break;

    case AI_ACTION_EXITBALLISTA:
        proc->func = AiExitBallistaAction;
        break;
    }
}

void CpPerform_WaitAction(struct CpPerformProc * proc)
{
    proc->clock++;

    if (proc->func(proc) == 1)
        Proc_Break(proc);

    gActiveUnit->xPos = gAiDecision.xMove;
    gActiveUnit->yPos = gAiDecision.yMove;
}

void CpPerform_Cleanup(struct CpPerformProc * proc)
{
    AiUpdateUnitsSeekHealing();
    AiEndMuAndRefreshUnits();

    if (!(gActiveUnit->pCharacterData) || (gActiveUnit->state & (US_HIDDEN | US_DEAD | US_BIT16)))
        Proc_Goto(proc, 1);
}

s8 AiDummyAction(struct CpPerformProc * proc)
{
    return 1;
}

s8 AiEscapeAction(struct CpPerformProc * proc)
{
    if (!MuExistsActive())
    {
        gActiveUnit->pCharacterData = NULL;
        return 1;
    }

    return 0;
}

s8 AiWaitAndClearScreenAction(struct CpPerformProc * proc)
{
    if (proc->clock > 4)
    {
        TmFill(gBg0Tm, 0);
        TmFill(gBg1Tm, 0);

        EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);

        return 1;
    }

    return 0;
}

void CpPerform_EquipBest(struct CpPerformProc * proc)
{
    u16 equipFlags[UNIT_ITEM_COUNT + 1];

    if (AiCanEquip() && AiEquipGetFlags(equipFlags))
    {
        u16 rangeDanger;
        u16 meleeDanger;
        u16 combinedDanger;

        AiEquipGetDanger(gAiDecision.xMove, gAiDecision.yMove, &rangeDanger, &meleeDanger, &combinedDanger);
        AiEquipBestConsideringDanger(rangeDanger, meleeDanger, combinedDanger, equipFlags);
    }
}
