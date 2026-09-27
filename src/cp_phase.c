#include "gbafe.h"
#include "gbafe/cp_common.h"

// AI phase (FE8U: cp_phase.c)

extern u32 gAiItemConfigTable[];

void CpOrderBerserkInit(ProcPtr proc);
void CpOrderFunc_End(ProcPtr proc);
void CpOrderMain(ProcPtr proc);

CONST_DATA struct ProcCmd gProcScr_CpOrder[] = {
    PROC_19,
    PROC_REPEAT(CpOrderMain),
    PROC_END,
};

CONST_DATA struct ProcCmd gProcScr_BerserkCpOrder[] = {
    PROC_19,
    PROC_CALL(CpOrderBerserkInit),
    PROC_REPEAT(CpOrderFunc_End),
    PROC_END,
};

void AiPhase_Begin(ProcPtr proc)
{
    int i;

    gAiState.flags = AI_FLAG_0;
    gAiState.unk7E = -1;

    gAiState.orderState = 0;

    for (i = 0; i < 8; ++i)
        gAiState.cmd_result[i] = 0;

    gAiState.specialItemFlags = gAiItemConfigTable[gPlaySt.chapterIndex];
    gAiState.unk84 = 0;

    AiUpdateUnitsSeekHealing();
    SetupUnitInventoryAIFlags();

    Proc_StartBlocking(gProcScr_CpOrder, proc);
}

void AiPhaseBerserkInit(ProcPtr proc)
{
    int i;

    gAiState.flags = AI_FLAG_BERSERKED;
    gAiState.unk7E = -1;

    for (i = 0; i < 8; ++i)
        gAiState.cmd_result[i] = 0;

    gAiState.specialItemFlags = gAiItemConfigTable[gPlaySt.chapterIndex];

    AiUpdateUnitsSeekHealing();
    SetupUnitInventoryAIFlags();

    Proc_StartBlocking(gProcScr_BerserkCpOrder, proc);
}

void AiPhaseCleanup(ProcPtr proc)
{
    gAiState.flags = AI_FLAGS_NONE;
}
