#include "gbafe.h"
#include "gbafe/cp_common.h"

s8 AiCompare(const u8 * left, u8 op, u32 right)
{
    switch (op)
    {
    case AI_COMPARE_GT:
        if (*left > right)
            return 1;
        break;

    case AI_COMPARE_GE:
        if (*left >= right)
            return 1;
        break;

    case AI_COMPARE_EQ:
        if (*left == right)
            return 1;
        break;

    case AI_COMPARE_LE:
        if (*left <= right)
            return 1;
        break;

    case AI_COMPARE_LT:
        if (*left < right)
            return 1;
        break;

    case AI_COMPARE_NE:
        if (*left != right)
            return 1;
        break;
    }

    return 0;
}

s8 AiFindTargetInReachByCharId(int uid, struct Vec2 * out)
{
    int i;

    MapFloodRange_Unitless(gActiveUnit->xPos, gActiveUnit->yPos, GetUnitMovementCost(gActiveUnit));
    MarkWorkingMapEdges();

    out->x = -1;

    for (i = 1; i < 0xC0; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (gBmMapRange[unit->yPos][unit->xPos] > MAP_MOVEMENT_MAX)
            continue;

        if (unit->pCharacterData->number != uid)
            continue;

        if (unit->state & US_DEAD)
        {
            gAiState.cmd_result[0] = 1;
            return 0;
        }

        if (unit->state & US_RESCUED)
            gAiState.cmd_result[0] = 3;

        out->x = unit->xPos;
        out->y = unit->yPos;
    }

    if (out->x >= 0)
        return 1;

    if (!(GetUnitFromCharId(uid)->state & US_UNAVAILABLE))
    {
        gAiState.cmd_result[0] = 4;
        return 0;
    }

    gAiState.cmd_result[0] = 1;

    return 0;
}
ASM_FUNC("asm/nonmatching/code_0803598C.s");
ASM_FUNC("asm/nonmatching/code_08035A38.s");
ASM_FUNC("asm/nonmatching/code_08035B54.s");
ASM_FUNC("asm/nonmatching/code_08035C70.s");
ASM_FUNC("asm/nonmatching/code_08035D50.s");
ASM_FUNC("asm/nonmatching/code_08035DA4.s");
ASM_FUNC("asm/nonmatching/code_08035E0C.s");
ASM_FUNC("asm/nonmatching/code_08035E28.s");
ASM_FUNC("asm/nonmatching/code_08035E44.s");
ASM_FUNC("asm/nonmatching/code_08035F48.s");
ASM_FUNC("asm/nonmatching/code_08035FA0.s");
ASM_FUNC("asm/nonmatching/code_080360E8.s");
ASM_FUNC("asm/nonmatching/code_0803631C.s");
ASM_FUNC("asm/nonmatching/code_08036390.s");
ASM_FUNC("asm/nonmatching/code_0803640C.s");
ASM_FUNC("asm/nonmatching/code_08036488.s");
ASM_FUNC("asm/nonmatching/code_08036514.s");
ASM_FUNC("asm/nonmatching/code_080365B0.s");
ASM_FUNC("asm/nonmatching/code_08036650.s");
ASM_FUNC("asm/nonmatching/code_080366F0.s");
ASM_FUNC("asm/nonmatching/code_08036770.s");
ASM_FUNC("asm/nonmatching/code_08036810.s");
ASM_FUNC("asm/nonmatching/code_0803688C.s");
ASM_FUNC("asm/nonmatching/code_080368C0.s");
ASM_FUNC("asm/nonmatching/code_08036900.s");
ASM_FUNC("asm/nonmatching/code_080369F4.s");
ASM_FUNC("asm/nonmatching/code_08036A8C.s");
ASM_FUNC("asm/nonmatching/code_08036B00.s");
ASM_FUNC("asm/nonmatching/code_08036CEC.s");
ASM_FUNC("asm/nonmatching/code_08036ED8.s");
ASM_FUNC("asm/nonmatching/code_08037044.s");
ASM_FUNC("asm/nonmatching/code_0803707C.s");
ASM_FUNC("asm/nonmatching/code_080370C8.s");
ASM_FUNC("asm/nonmatching/code_0803710C.s");
ASM_FUNC("asm/nonmatching/code_0803715C.s");
ASM_FUNC("asm/nonmatching/code_08037218.s");
ASM_FUNC("asm/nonmatching/code_08037260.s");
ASM_FUNC("asm/nonmatching/code_080372AC.s");
ASM_FUNC("asm/nonmatching/code_08037350.s");
ASM_FUNC("asm/nonmatching/code_08037380.s");
ASM_FUNC("asm/nonmatching/code_08037460.s");
ASM_FUNC("asm/nonmatching/code_080374AC.s");
ASM_FUNC("asm/nonmatching/code_08037548.s");
ASM_FUNC("asm/nonmatching/code_0803758C.s");
