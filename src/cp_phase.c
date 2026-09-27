#include "gbafe.h"
#include "gbafe/cp_common.h"

// AI phase (FE8U: cp_phase.c)

extern u32 gAiItemConfigTable[];
extern struct ProcCmd CONST_DATA gProcScr_CpOrder[];
extern struct ProcCmd CONST_DATA gProcScr_BerserkCpOrder[];

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
