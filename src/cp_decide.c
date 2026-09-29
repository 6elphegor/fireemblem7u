#include "gbafe.h"
#include "gbafe/cp_common.h"
#include "gbafe/bmtrap.h"
#include "gbafe/playerphase.h"

// AI decision (FE8U: cp_decide.c)

void CpDecide_Suspend(ProcPtr proc);
void CpDecide_Main(ProcPtr proc);
void AiDecideMain(void);
void DecideHealOrEscape(void);
void DecideSpecialItems(void);
void DecideScriptA(void);
void DecideScriptB(void);

typedef void (* DecideFunc)(void);

extern void (* AiDecideMainFunc)(void);
extern const DecideFunc sDecideFuncList[];
extern const struct ProcCmd gProcScr_CpPerform[];

void CpDecide_Suspend(ProcPtr proc)
{
    if (UNIT_FACTION(gActiveUnit) == FACTION_BLUE)
        gActionSt.suspend_point = SUSPEND_POINT_BERSERK_PHASE;
    else
        gActionSt.suspend_point = SUSPEND_POINT_AI_PHASE;

    WriteSuspendSave(3);
}

void CpDecide_Main(ProcPtr proc)
{
next_unit:
    gAiState.decideState = 0;

    if (*gAiState.unitIt)
    {
        gAiState.unk7C = 0;

        gActiveUnitId = *gAiState.unitIt;
        gActiveUnit = GetUnit(gActiveUnitId);

        if (gActiveUnit->state & (US_DEAD | US_UNSELECTABLE) || !gActiveUnit->pCharacterData)
        {
            gAiState.unitIt++;
            goto next_unit;
        }

        do
        {
            RefreshEntityMaps();
            RenderMap();
            RefreshUnitSprites();

            AiUpdateNoMoveFlag(gActiveUnit);

            gAiState.combatWeightTableId = (gActiveUnit->ai3And4 & AI_UNIT_CONFIG_COMBATWEIGHT_MASK) >> AI_UNIT_CONFIG_COMBATWEIGHT_SHIFT;

            gAiState.dangerMapFilled = FALSE;
            AiRefreshDangerMap();

            AiClearDecision();
            AiDecideMainFunc();

            gActiveUnit->state |= US_HAS_MOVED_AI;

            if (!gAiDecision.actionPerformed ||
                (gActiveUnit->xPos == gAiDecision.xMove && gActiveUnit->yPos == gAiDecision.yMove && gAiDecision.actionId == AI_ACTION_NONE))
            {
                gAiState.unitIt++;
                Proc_Goto(proc, 0);
            }
            else
            {
                gAiState.unitIt++;
                Proc_StartBlocking(gProcScr_CpPerform, proc);
            }
        } while (0);
    }
    else
    {
        Proc_End(proc);
    }
}

void AiClearDecision(void)
{
    gAiDecision.actionId = 0;

    gAiDecision.unitId = 0;
    gAiDecision.xMove = 0;
    gAiDecision.yMove = 0;
    gAiDecision.unk04 = 0;
    gAiDecision.unk05 = 0;
    gAiDecision.targetId = 0;
    gAiDecision.itemSlot = 0;
    gAiDecision.xTarget = 0;
    gAiDecision.yTarget = 0;

    gAiDecision.actionPerformed = FALSE;
}

void AiSetDecision(s16 xMove, s16 yMove, u8 actionId, u8 targetId, u8 itemSlot, u8 xTarget, u8 yTarget)
{
    gAiDecision.unitId = gActiveUnitId;
    gAiDecision.xMove = xMove;
    gAiDecision.yMove = yMove;

    gAiDecision.actionId = actionId;

    gAiDecision.targetId = targetId;
    gAiDecision.itemSlot = itemSlot;
    gAiDecision.xTarget = xTarget;
    gAiDecision.yTarget = yTarget;

    gAiDecision.actionPerformed = TRUE;
}

void AiUpdateDecision(u8 actionId, u8 targetId, u8 itemSlot, u8 xTarget, u8 yTarget)
{
    if (actionId != 0xFF)
        gAiDecision.actionId = actionId;

    if (targetId != 0xFF)
        gAiDecision.targetId = targetId;

    if (itemSlot != 0xFF)
        gAiDecision.itemSlot = itemSlot;

    if (xTarget != 0xFF)
        gAiDecision.xTarget = xTarget;

    if (yTarget != 0xFF)
        gAiDecision.yTarget = yTarget;

    gAiDecision.actionPerformed = TRUE;
}

void AiDecideMain(void)
{
    while (sDecideFuncList[gAiState.decideState] && !gAiDecision.actionPerformed)
    {
        sDecideFuncList[gAiState.decideState++]();
    }
}

void DecideHealOrEscape(void)
{
    if (gAiState.flags & AI_FLAG_BERSERKED)
        return;

    if (AiUpdateGetUnitIsHealing(gActiveUnit) == TRUE)
    {
        struct Vec2 vec2;

        if (AiTryHealSelf() == TRUE)
            return;

        if ((gActiveUnit->aiFlags & AI_UNIT_FLAG_3) && (AiTryMoveTowardsEscape() == TRUE))
        {
            AiTryDanceOrStealAfterMove();
            return;
        }

        if (AiTryGetNearestHealPoint(&vec2) != TRUE)
            return;

        AiTryMoveTowards(vec2.x, vec2.y, 0, 0, 1);

        if (gAiDecision.actionPerformed == TRUE)
            AiTryActionAfterMove();
    }
    else
    {
        if ((gActiveUnit->aiFlags & AI_UNIT_FLAG_3) && (AiTryMoveTowardsEscape() == TRUE))
            AiTryDanceOrStealAfterMove();
    }
}

void DecideSpecialItems(void)
{
    if (gAiState.flags & AI_FLAG_BERSERKED)
        return;

    AiTryDoSpecialItems();
}

void DecideScriptA(void)
{
    int i = 0;

    if (gAiState.flags & AI_FLAG_BERSERKED)
    {
        AiDoBerserkAction();
        return;
    }

    for (i = 0; i < 0x100; ++i)
    {
        if (AiTryExecScriptA() == TRUE)
            return;
    }

    AiExecFallbackScriptA();
}

void DecideScriptB(void)
{
    int i = 0;

    if ((gActiveUnit->state & US_IN_BALLISTA) && (GetRiddenBallistaAt(gActiveUnit->xPos, gActiveUnit->yPos) != NULL))
        return;

    if (gAiState.flags & AI_FLAG_BERSERKED)
    {
        AiDoBerserkMove();
        return;
    }

    for (i = 0; i < 0x100; ++i)
    {
        if (AiTryExecScriptB() == TRUE)
            return;
    }

    AiExecFallbackScriptB();
}

void CpPerform_BeginUnitMovement();
void CpPerform_Cleanup();
void CpPerform_EquipBest();
void CpPerform_MoveCameraOntoTarget();
void CpPerform_MoveCameraOntoUnit();
void CpPerform_PerformAction();
void CpPerform_WaitAction();

SECTION(".rodata.08B96F9C")
const struct ProcCmd gProcScr_CpPerform[] = {
    PROC_19,
    PROC_CALL(CpPerform_UpdateMapMusic),
    PROC_CALL(CpPerform_MoveCameraOntoUnit),
    PROC_SLEEP(0),
    PROC_CALL(CpPerform_BeginUnitMovement),
    PROC_WHILE(MuExistsActive),
    PROC_CALL(CpPerform_MoveCameraOntoTarget),
    PROC_SLEEP(0),
    PROC_CALL(CpPerform_PerformAction),
    PROC_REPEAT(CpPerform_WaitAction),
    PROC_CALL_2(HandlePostActionTraps),
    PROC_CALL_2(RunPotentialWaitEvents),
    PROC_CALL(CpPerform_Cleanup),
    PROC_CALL(CpPerform_EquipBest),
    PROC_LABEL(1),
    PROC_END,
};

SECTION(".rodata.08B96F14")
const DecideFunc sDecideFuncList[] = {
    DecideHealOrEscape,
    DecideScriptA,
    DecideScriptB,
    DecideSpecialItems,
    NULL,
    NULL,
    DecideSpecialItems,
    DecideScriptA,
    DecideHealOrEscape,
    DecideScriptB,
    NULL,
    NULL,
};
