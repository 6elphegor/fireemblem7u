#include "gbafe.h"
#include "gbafe/cp_common.h"

enum ScriptKind {
    AI_SCRIPT_AI1,
    AI_SCRIPT_AI2,
};

enum {
    AI_CMD_COUNT = 0x1C,
    AI_CMD_LABEL = 0x1B,
};

typedef void (* AiScrCmd)(u8 * pc);

extern s8 gAiScriptEnded;
extern int gAiScriptKind;
extern const struct AiScr * gpAiScriptCurrent;
extern AiScrFunc gpCurrentAiFunctionCall;

extern const struct AiScr * const * const gpAi1Table[];
extern const struct AiScr * const * const gpAi2Table[];

extern const struct AiScr gAiScript_FallbackAi1[];
extern const struct AiScr gAiScript_FallbackAi2[];

extern u8 const gAiTerrainList_SnagWall[];
extern const u8 gUnk_08B970F0[], gUnk_08B970F4[], gUnk_08B970F8[];   // character id lists the AI scripts point into

void AiScriptCmd_00_ConditionalGoto(u8 * pc);
void AiScriptCmd_01_FunctionCall(u8 * pc);
void AiScriptCmd_02_ChangeAi(u8 * pc);
void AiScriptCmd_03_Goto(u8 * pc);
void AiScriptCmd_04_ActionOnSelectedCharacter(u8 * pc);
void AiScriptCmd_05_DoStandardAction(u8 * pc);
void AiScriptCmd_06_DoNothing(u8 * pc);
void AiScriptCmd_07_DoStandardActionNoMove(u8 * pc);
void AiScriptCmd_08_DoStandardActionAgainstClass(u8 * pc);
void AiScriptCmd_09_DoStaffAction(u8 * pc);
void AiScriptCmd_0A_DoStaffAction(u8 * pc);
void AiScriptCmd_0B_DoStaffAction(u8 * pc);
void AiScriptCmd_0C_MoveTowardsSetPoint(u8 * pc);
void AiScriptCmd_0D_MoveTowardsCharacterUntilInRange(u8 * pc);
void AiScriptCmd_0E_DoNothing(u8 * pc);
void AiScriptCmd_0F_MoveTowardsUnitWithClass(u8 * pc);
void AiScriptCmd_10_DoLooting(u8 * pc);
void AiScriptCmd_11_MoveTowardsSafety(u8 * pc);
void AiScriptCmd_12_MoveTowardsEnemy(u8 * pc);
void AiScriptCmd_13(u8 * pc);
void AiScriptCmd_14_DoNothing(u8 * pc);
void AiScriptCmd_15_DoNothing(u8 * pc);
void AiScriptCmd_16_RandomMovement(u8 * pc);
void AiScriptCmd_17_DoEscape(u8 * pc);
void AiScriptCmd_18_TryAttackSnagWall(u8 * pc);
void AiScriptCmd_19_MoveTowardsTerrain(u8 * pc);
void AiScriptCmd_1A_MoveTowardsTerrain(u8 * pc);
void AiScriptCmd_1B_NoOp(u8 * pc);

s8 AiTryExecScriptA(void)
{
    gpAiScriptCurrent = gpAi1Table[0][gActiveUnit->ai1];
    gpAiScriptCurrent = gpAiScriptCurrent + gActiveUnit->ai1data;

    gAiScriptEnded = 1;
    gAiScriptKind = AI_SCRIPT_AI1;

    AiScript_Exec(&gActiveUnit->ai1data);

    return gAiScriptEnded;
}

s8 AiExecFallbackScriptA(void)
{
    gpAiScriptCurrent = gAiScript_FallbackAi1;

    gAiScriptEnded = 1;
    gAiScriptKind = AI_SCRIPT_AI1;

    AiScript_Exec(&gActiveUnit->ai1data);

    return gAiScriptEnded;
}

s8 AiTryExecScriptB(void)
{
    gpAiScriptCurrent = gpAi2Table[0][gActiveUnit->ai2];
    gpAiScriptCurrent = gpAiScriptCurrent + gActiveUnit->ai2data;

    gAiScriptEnded = 1;
    gAiScriptKind = AI_SCRIPT_AI2;

    AiScript_Exec(&gActiveUnit->ai2data);

    return gAiScriptEnded;
}

s8 AiExecFallbackScriptB(void)
{
    gpAiScriptCurrent = gAiScript_FallbackAi2;

    gAiScriptEnded = 1;
    gAiScriptKind = AI_SCRIPT_AI2;

    AiScript_Exec(&gActiveUnit->ai2data);

    return gAiScriptEnded;
}

void AiScript_Exec(u8 * pc)
{
    AiScrCmd funcLut[] = {
        AiScriptCmd_00_ConditionalGoto,
        AiScriptCmd_01_FunctionCall,
        AiScriptCmd_02_ChangeAi,
        AiScriptCmd_03_Goto,
        AiScriptCmd_04_ActionOnSelectedCharacter,
        AiScriptCmd_05_DoStandardAction,
        AiScriptCmd_06_DoNothing,
        AiScriptCmd_07_DoStandardActionNoMove,
        AiScriptCmd_08_DoStandardActionAgainstClass,
        AiScriptCmd_09_DoStaffAction,
        AiScriptCmd_0A_DoStaffAction,
        AiScriptCmd_0B_DoStaffAction,
        AiScriptCmd_0C_MoveTowardsSetPoint,
        AiScriptCmd_0D_MoveTowardsCharacterUntilInRange,
        AiScriptCmd_0E_DoNothing,
        AiScriptCmd_0F_MoveTowardsUnitWithClass,
        AiScriptCmd_10_DoLooting,
        AiScriptCmd_11_MoveTowardsSafety,
        AiScriptCmd_12_MoveTowardsEnemy,
        AiScriptCmd_13,
        AiScriptCmd_14_DoNothing,
        AiScriptCmd_15_DoNothing,
        AiScriptCmd_16_RandomMovement,
        AiScriptCmd_17_DoEscape,
        AiScriptCmd_18_TryAttackSnagWall,
        AiScriptCmd_19_MoveTowardsTerrain,
        AiScriptCmd_1A_MoveTowardsTerrain,
        AiScriptCmd_1B_NoOp,
    };

    if (gpAiScriptCurrent->cmd >= AI_CMD_COUNT)
    {
        if (gAiScriptKind == AI_SCRIPT_AI1)
            gpAiScriptCurrent = gAiScript_FallbackAi1;
        else
            gpAiScriptCurrent = gAiScript_FallbackAi2;
    }

    gAiState.unk7E = gpAiScriptCurrent->unk_02;

    funcLut[gpAiScriptCurrent->cmd](pc);
}

void AiScriptCmd_00_ConditionalGoto(u8 * pc)
{
    u8 target = gpAiScriptCurrent->unk_03;
    u8 i = 0;

    if (AiCompare(gpAiScriptCurrent->unk_08, gpAiScriptCurrent->unk_01, gpAiScriptCurrent->unk_04) == 1)
    {
        const struct AiScr * script;

        if (gAiScriptKind == AI_SCRIPT_AI1)
            script = gpAi1Table[0][gActiveUnit->ai1];
        else
            script = gpAi2Table[0][gActiveUnit->ai2];

        if (target != 0)
        {
            while ((script[i].cmd != AI_CMD_LABEL) || (script[i].unk_03 != target))
                i++;

            *pc = i + 1;
        }
        else
        {
            *pc = 0;
        }
    }
    else
    {
        (*pc)++;
    }

    gAiScriptEnded = 0;
}

void AiScriptCmd_01_FunctionCall(u8 * pc)
{
    gpCurrentAiFunctionCall = gpAiScriptCurrent->unk_08;

    gAiScriptEnded = gpCurrentAiFunctionCall(gpAiScriptCurrent->unk_0C);

    (*pc)++;
}

void AiScriptCmd_02_ChangeAi(u8 * pc)
{
    u8 ai1 = gpAiScriptCurrent->unk_01;
    u8 ai2 = gpAiScriptCurrent->unk_02;

    if (ai1 != 0xFF)
    {
        gActiveUnit->ai1 = ai1;
        gActiveUnit->ai1data = 0;
    }

    if (ai2 != 0xFF)
    {
        gActiveUnit->ai2 = ai2;
        gActiveUnit->ai2data = 0;
    }

    if (((gAiScriptKind == 0) && (ai1 == 0xFF)) || ((gAiScriptKind == 1 && (ai2 == 0xFF))))
        (*pc)++;

    gAiState.decideState = 0;
}

void AiScriptCmd_03_Goto(u8 * pc)
{
    const struct AiScr * script;

    u8 target = gpAiScriptCurrent->unk_03;
    u8 i = 0;

    if (gAiScriptKind == AI_SCRIPT_AI1)
        script = gpAi1Table[0][gActiveUnit->ai1];
    else
        script = gpAi2Table[0][gActiveUnit->ai2];

    if (target != 0)
    {
        while ((script[i].cmd != AI_CMD_LABEL || (script[i].unk_03 != target)))
            i++;

        *pc = i + 1;
    }
    else
    {
        *pc = 0;
    }

    gAiScriptEnded = 0;
}

s8 AiIsUnitEnemy(struct Unit * unit)
{
    if (AreUnitIdsAllied(gActiveUnit->index, unit->index))
        return 0;

    return 1;
}

s8 AiIsUnitNonActive(struct Unit * unit)
{
    if (unit == gActiveUnit)
        return 0;

    return 1;
}

s8 AiIsUnitEnemyAndNotInScrList(struct Unit * unit)
{
    if ((AiIsInShortList(gpAiScriptCurrent->unk_08, unit->pCharacterData->number) != 1) && !(AreUnitIdsAllied(gActiveUnit->index, unit->index)))
        return 1;

    return 0;
}

s8 AiIsUnitEnemyOrInScrList(struct Unit * unit)
{
    if ((AiIsInShortList(gpAiScriptCurrent->unk_08, unit->pCharacterData->number) == 1) || !(AreUnitIdsAllied(gActiveUnit->index, unit->index)))
        return 1;

    return 0;
}

s8 AiIsUnitEnemyAndScrCharId(struct Unit * unit)
{
    if ((unit->pCharacterData->number == gpAiScriptCurrent->unk_04) && !(AreUnitIdsAllied(gActiveUnit->index, unit->index)))
        return 1;

    return 0;
}

s8 AiIsUnitEnemyAndScrClassId(struct Unit * unit)
{
    if ((unit->pClassData->number == gpAiScriptCurrent->unk_04) && (!AreUnitIdsAllied(gActiveUnit->index, unit->index)))
        return 1;

    return 0;
}

void AiScriptCmd_04_ActionOnSelectedCharacter(u8 * pc)
{
    u8 rand = RandNext(100);

    if (rand <= gpAiScriptCurrent->unk_01)
    {
        if (!AiTryDoStaff(AiIsUnitEnemy))
        {
            if (AiUnitWithCharIdExists(gpAiScriptCurrent->unk_04) == 1)
            {
                if (GetUnitFromCharId(gpAiScriptCurrent->unk_04)->state & US_RESCUED)
                {
                    gAiState.cmd_result[0] = 3;
                    gAiScriptEnded = 0;
                }
                else
                {
                    AiAttemptOffensiveAction(AiIsUnitEnemyAndScrCharId);
                }
            }
            else
            {
                gAiState.cmd_result[0] = 1;
                gAiScriptEnded = 0;
            }
        }
    }
    else
    {
        gAiState.decideState = 4;
    }

    (*pc)++;
}

void AiScriptCmd_05_DoStandardAction(u8 * pc)
{
    u8 rand = RandNext(100);

    if (rand <= gpAiScriptCurrent->unk_01)
    {
        if (gpAiScriptCurrent->unk_08 == 0)
        {
            if (AiTryDoStaff(AiIsUnitEnemy) == 0)
                AiAttemptOffensiveAction(AiIsUnitEnemy);
        }
        else
        {
            if (AiTryDoStaff(AiIsUnitEnemyOrInScrList) == 0)
                AiAttemptOffensiveAction(AiIsUnitEnemyAndNotInScrList);
        }
    }
    else
    {
        gAiState.decideState = 4;
    }

    (*pc)++;
}

void AiScriptCmd_06_DoNothing(u8 * pc)
{
    (*pc)++;
}

void AiScriptCmd_07_DoStandardActionNoMove(u8 * pc)
{
    u8 rand = RandNext(100);

    if (rand <= gpAiScriptCurrent->unk_01)
    {
        gAiState.flags |= AI_FLAG_STAY;

        if (!AiTryDoStaff(AiIsUnitEnemy))
            AiAttemptOffensiveAction(AiIsUnitEnemy);
    }
    else
    {
        gAiState.decideState = 4;
    }

    (*pc)++;
}

void AiScriptCmd_08_DoStandardActionAgainstClass(u8 * pc)
{
    u8 rand = RandNext(100);

    if (rand <= gpAiScriptCurrent->unk_01)
    {
        if (AiTryDoStaff(AiIsUnitEnemyAndScrClassId) == 0)
            AiAttemptOffensiveAction(AiIsUnitEnemyAndScrClassId);
    }
    else
    {
        gAiState.decideState = 4;
    }

    (*pc)++;
}

void AiScriptCmd_09_DoStaffAction(u8 * pc)
{
    AiTryDoStaff(AiIsUnitEnemy);
    (*pc)++;
}

void AiScriptCmd_0A_DoStaffAction(u8 * pc)
{
    AiTryDoStaff(AiIsUnitEnemy);
    (*pc)++;
}

void AiScriptCmd_0B_DoStaffAction(u8 * pc)
{
    AiTryDoStaff(AiIsUnitEnemy);
    (*pc)++;
}

void AiScriptCmd_0C_MoveTowardsSetPoint(u8 * pc)
{
    AiTryMoveTowards(gpAiScriptCurrent->unk_01, gpAiScriptCurrent->unk_03, 0, gpAiScriptCurrent->unk_02, 1);

    if (gAiDecision.actionPerformed == 1)
    {
        if (gAiDecision.xMove == gpAiScriptCurrent->unk_01)
        {
            if (gAiDecision.yMove == gpAiScriptCurrent->unk_03)
                (*pc)++;
        }
    }
}

void AiScriptCmd_0D_MoveTowardsCharacterUntilInRange(u8 * pc)
{
    struct Vec2 pos;

    if (AiFindTargetInReachByCharId(gpAiScriptCurrent->unk_04, &pos) == 1)
    {
        AiTryMoveTowards(pos.x, pos.y, 0, gpAiScriptCurrent->unk_02, 1);

        if (AiIsWithinRectDistance(pos.x, pos.y, gAiDecision.xMove, gAiDecision.yMove, 1) == 1)
        {
            struct Unit * unit = GetUnitFromCharId(gpAiScriptCurrent->unk_04);

            if ((unit->state & US_RESCUED) != 0)
            {
                gAiState.cmd_result[0] = 3;
            }
            else
            {
                AiUpdateDecision(0, 0, 0, 0, unit->index);

                gAiState.cmd_result[0] = 2;
                gAiDecision.actionPerformed = 0;
                gAiScriptEnded = 0;
            }
        }
    }
    else
    {
        gAiScriptEnded = 0;
    }

    (*pc)++;
}

void AiScriptCmd_0E_DoNothing(u8 * pc)
{
    (*pc)++;
}

void AiScriptCmd_0F_MoveTowardsUnitWithClass(u8 * pc)
{
    struct Vec2 pos;

    if (AiFindTargetInReachByClassId(gpAiScriptCurrent->unk_04, &pos) == 1)
        AiTryMoveTowards(pos.x, pos.y, 0, gpAiScriptCurrent->unk_02, 1);

    (*pc)++;
}

void AiScriptCmd_10_DoLooting(u8 * pc)
{
    if (AiTryDoSpecialItems() == 1)
    {
        if (gpAiScriptCurrent->unk_03 == 0)
            return;

        gActiveUnit->_u46++;

        if (gActiveUnit->_u46 != gpAiScriptCurrent->unk_03)
            return;

        (*pc)++;
        gAiScriptEnded = 0;
    }
    else
    {
        struct Vec2 pos;
        u8 itemSlot;

        if (AiFindPillageLocation(&pos, &itemSlot) == 1)
        {
            AiTryMoveTowards(pos.x, pos.y, 0, -1, 1);

            if (AiLocationIsPillageTarget(gAiDecision.xMove, gAiDecision.yMove) != 1)
                return;

            AiSetDecision(gAiDecision.xMove, gAiDecision.yMove, AI_ACTION_PILLAGE, 0, itemSlot, 0, 0);

            if (gpAiScriptCurrent->unk_03 == 0)
                return;

            gActiveUnit->_u46++;

            if (gActiveUnit->_u46 != gpAiScriptCurrent->unk_03)
                return;

            (*pc)++;
            gAiScriptEnded = 0;
        }
        else
        {
            (*pc)++;
            gAiScriptEnded = 0;
        }
    }
}

void AiScriptCmd_11_MoveTowardsSafety(u8 * pc)
{
    struct Vec2 pos;

    if (AiFindSafestReachableLocation(gActiveUnit, &pos) == 1)
        AiSetDecision(pos.x, pos.y, AI_ACTION_NONE, 0, 0, 0, 0);

    (*pc)++;
}

void AiScriptCmd_12_MoveTowardsEnemy(u8 * pc)
{
    struct Vec2 pos;

    if (gpAiScriptCurrent->unk_08 == 0)
    {
        if (AiFindTargetInReachByFunc(AiIsUnitEnemy, &pos) == 1)
            AiTryMoveTowards(pos.x, pos.y, 0, gpAiScriptCurrent->unk_02, 1);
    }
    else
    {
        if (AiFindTargetInReachByFunc(AiIsUnitEnemyAndNotInScrList, &pos) == 1)
            AiTryMoveTowards(pos.x, pos.y, 0, gpAiScriptCurrent->unk_02, 1);
    }

    (*pc)++;
}

void AiScriptCmd_13(u8 * pc)
{
    struct Vec2 pos;

    if (gpAiScriptCurrent->unk_08 == 0)
    {
        if (AiFindTargetInReachNeglectWallByFunc(AiIsUnitEnemy, &pos) == 1)
            AiTryMoveTowardsNeglectWall(pos.x, pos.y, 0, gpAiScriptCurrent->unk_02, 1);
    }
    else
    {
        if (AiFindTargetInReachNeglectWallByFunc(AiIsUnitEnemyAndNotInScrList, &pos) == 1)
            AiTryMoveTowardsNeglectWall(pos.x, pos.y, 0, gpAiScriptCurrent->unk_02, 1);
    }

    (*pc)++;
}

void AiScriptCmd_14_DoNothing(u8 * pc)
{
    (*pc)++;
}

void AiScriptCmd_15_DoNothing(u8 * pc)
{
    (*pc)++;
}

void AiScriptCmd_16_RandomMovement(u8 * pc)
{
    AiRandomMove();

    (*pc)++;
}

void AiScriptCmd_17_DoEscape(u8 * pc)
{
    gActiveUnit->aiFlags |= AI_UNIT_FLAG_3;
    AiTryMoveTowardsEscape();

    (*pc)++;
}

int sub_08038054(int x, int y)
{
    return ((AiGetTerrainCombatPositionScoreComponent(x, y) + AiGetFriendZoneCombatPositionScoreComponent(x, y)) - ((s8 **) gBmMapMovement)[y][x] - gBmMapOther[y][x] / 8) + 0x7FFFFFFF;
}

s8 sub_080380A8(int x, int y, struct Vec2 * out, u8 * itemSlotOut)
{
    int slot;

    int xOut = -1;
    int yOut = -1;

    u32 best = 0;

    GenerateUnitMovementMap(gActiveUnit);

    for (slot = 0; slot < 5; slot++)
    {
        int ix;
        int iy;

        u16 item = gActiveUnit->items[slot];

        if (item == 0)
            break;

        if (!CanUnitUseWeapon(gActiveUnit, item))
            continue;

        BmMapFill(gBmMapRange, 0);
        MapAddInBoundedRange(x, y, GetItemMinRange(item), GetItemMaxRange(item));

        for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
        {
            for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
            {
                u32 current;

                if (gBmMapMovement[iy][ix] > 0x78)
                    continue;

                if (((s8 **) gBmMapRange)[iy][ix] == 0)
                    continue;

                if (gBmMapUnit[iy][ix] != 0 && gBmMapUnit[iy][ix] != gActiveUnitId)
                    continue;

                current = GetItemMight(item) + sub_08038054(ix, iy);

                if (current > best)
                {
                    xOut = ix;
                    yOut = iy;
                    best = current;

                    *itemSlotOut = slot;
                }
            }
        }
    }

    if (best == 0)
        return 0;

    out->x = xOut;
    out->y = yOut;

    return 1;
}

s8 sub_08038218(const u8 * terrainList, u32 flags, struct Vec2 * out)
{
    int ix;
    int iy;

    u8 best = 0xff;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
        {
            if (gBmMapRange[iy][ix] > 0x78)
                continue;

            if (AiIsInByteList(terrainList, gBmMapTerrain[iy][ix]) == 0)
                continue;

            if (flags & 1)
            {
                if (gBmMapUnit[iy][ix] != 0 && !AreUnitIdsAllied(gActiveUnit->index, gBmMapUnit[iy][ix]))
                    continue;
            }

            if (flags & 2)
            {
                if (AiCountNearbyEnemyUnits(ix, iy) != 0)
                    continue;
            }

            if (best <= ((s8 **) gBmMapRange)[iy][ix])
                continue;

            out->x = ix;
            out->y = iy;
            best = gBmMapRange[iy][ix];
        }
    }

    if (best != 0xff)
        return 1;

    return 0;
}

void AiScriptCmd_18_TryAttackSnagWall(u8 * pc)
{
    struct Vec2 posA;
    struct Vec2 posB;
    u8 slot;

    sub_0803C058(gActiveUnit);

    if (sub_08038218(gAiTerrainList_SnagWall, 0, &posA) == 1)
    {
        if (sub_080380A8(posA.x, posA.y, &posB, &slot) == 1)
        {
            if (GetTrapAt(posA.x, posA.y) == 0 && GetTrapAt(posA.x, posA.y + 1) == 0)
                return;

            AiSetDecision(posB.x, posB.y, AI_ACTION_COMBAT, 0, slot, posA.x, posA.y);
        }
        else
        {
            AiTryMoveTowards(posA.x, posA.y, 0, 0xff, 1);
        }
    }
    else
    {
        gAiState.cmd_result[0] = 4;
        gAiScriptEnded = 0;
    }

    (*pc)++;
}

void AiScriptCmd_19_MoveTowardsTerrain(u8 * pc)
{
    struct Vec2 pos;

    MapFloodRange_Unitless(gActiveUnit->xPos, gActiveUnit->yPos, GetUnitMovementCost(gActiveUnit));

    if (AiFindClosestTerrainPosition(&gpAiScriptCurrent->unk_03, 0, &pos) == 1)
    {
        AiTryMoveTowards(pos.x, pos.y, 0, gpAiScriptCurrent->unk_02, 1);
    }
    else
    {
        gAiState.cmd_result[0] = 4;
        gAiScriptEnded = 0;
    }

    (*pc)++;
}

void AiScriptCmd_1A_MoveTowardsTerrain(u8 * pc)
{
    struct Vec2 pos;

    MapFloodRange_Unitless(gActiveUnit->xPos, gActiveUnit->yPos, GetUnitMovementCost(gActiveUnit));

    if (AiFindClosestTerrainPosition(gpAiScriptCurrent->unk_08, 0, &pos) == 1)
    {
        AiTryMoveTowards(pos.x, pos.y, 0, gpAiScriptCurrent->unk_02, 1);
    }
    else
    {
        gAiState.cmd_result[0] = 4;
        gAiScriptEnded = 0;
    }

    (*pc)++;
}

void AiScriptCmd_1B_NoOp(u8 * pc)
{
    (*pc)++;
    gAiScriptEnded = 0;
}

void AiDoBerserkAction(void)
{
    if (!AiTryDoStaff(AiIsUnitEnemy))
        AiAttemptOffensiveAction(AiIsUnitNonActive);
}

void AiDoBerserkMove(void)
{
    struct Vec2 pos;

    if (AiFindTargetInReachByFunc(AiIsUnitNonActive, &pos) == 1)
        AiTryMoveTowards(pos.x, pos.y, 0, -1, 1);
}

s8 sub_08038544(void)
{
    return 1;
}

s8 sub_08038548(u8 * arg)
{
    AiGetClassRank(*arg);

    return 1;
}

extern const struct AiScr AiScr_AiB_MoveToEnemy[];
extern const struct AiScr gUnk_08B97318[];
extern const struct AiScr gUnk_08B97338[];
extern const struct AiScr gUnk_08B97368[];
extern const struct AiScr gUnk_08B97398[];
extern const struct AiScr gUnk_08B973B8[];
extern const struct AiScr AiScr_AiB_NeverMove[];
extern const struct AiScr AiScr_AiB_PillageThenPursue[];
extern const struct AiScr AiScr_AiB_PillageThenEscape[];
extern const struct AiScr gAiScript_Escape[];
extern const struct AiScr gUnk_08B974B8[];
extern const struct AiScr gUnk_08B974F8[];
extern const struct AiScr gUnk_08B97538[];
extern const struct AiScr gUnk_08B97578[];
extern const struct AiScr gUnk_08B975B8[];
extern const struct AiScr gUnk_08B97608[];
extern const struct AiScr gUnk_08B97678[];
extern const struct AiScr gUnk_08B97778[];
extern const struct AiScr gUnk_08B977F8[];
extern const struct AiScr gAiScript_ActionInRange[];
extern const struct AiScr gAiScript_ActionInRange_80Perc[];
extern const struct AiScr gAiScript_ActionInRange_50Perc[];
extern const struct AiScr gAiScript_ActionStanding[];
extern const struct AiScr gAiScript_ActionStanding_80Perc[];
extern const struct AiScr gAiScript_ActionStanding_50Perc[];
extern const struct AiScr gAiScript_DoNothing[];
extern const struct AiScr gUnk_08B979EC[];
extern const struct AiScr gUnk_08B97A14[];
extern const struct AiScr gUnk_08B97A38[];
extern const struct AiScr gAiScript_ActionInRange_ExceptCivilian[];
extern const struct AiScr gUnk_08B97A9C[];
extern const struct AiScr gUnk_08B97ABC[];
extern const struct AiScr gUnk_08B97AFC[];
extern const struct AiScr gUnk_08B97B1C[];
extern const struct AiScr gUnk_08B97B8C[];
extern const struct AiScr gUnk_08B97D1C[];
extern const struct AiScr gUnk_08B97FCC;
extern const struct AiScr gUnk_08B97FDC[];
extern const struct AiScr gUnk_08B9806C[];
extern const struct AiScr gUnk_08B9811C[];
extern const struct AiScr gUnk_08B981CC[];
extern const struct AiScr gUnk_08B9827C[];
extern const struct AiScr gUnk_08B9832C[];
extern const struct AiScr gUnk_08B983DC[];
extern const struct AiScr gUnk_08B9848C[];
extern const struct AiScr gUnk_08B9856C[];
extern const struct AiScr gUnk_08B9858C[];
extern const struct AiScr gUnk_08B985BC[];
extern const struct AiScr gUnk_08B9861C[];
extern const struct AiScr gUnk_08B9863C[];
extern const struct AiScr gUnk_08B986A8[];
extern const struct AiScr gUnk_08B98724[];
extern const struct AiScr gUnk_08B987A0[];
extern const struct AiScr gUnk_08B9881C[];
extern const struct AiScr gUnk_08B98898[];

SECTION(".rodata.08B970A4")
const struct AiScr gAiScript_FallbackAi1[] = {
    { .cmd = 5, .unk_01 = 0x64, .unk_02 = 0xFF },
};

SECTION(".rodata.08B970B4")
const struct AiScr gAiScript_FallbackAi2[] = {
    { .cmd = 0x12, .unk_02 = 0xFF },
};

SECTION(".rodata.08B972F8")
const struct AiScr AiScr_AiB_MoveToEnemy[] = {
    { .cmd = 0x12, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
};

SECTION(".rodata.08B97318")
const struct AiScr gUnk_08B97318[] = {
    { .cmd = 0x13, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
};

SECTION(".rodata.08B97338")
const struct AiScr gUnk_08B97338[] = {
    { .cmd = 0xE, .unk_02 = 0xFF },
    { .cmd = 2, .unk_01 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
};

SECTION(".rodata.08B97368")
const struct AiScr gUnk_08B97368[] = {
    { .cmd = 0xE, .unk_02 = 0xFF },
    { .cmd = 2, .unk_01 = 0xFF, .unk_02 = 4 },
    { .cmd = 3, .unk_02 = 0xFF },
};

SECTION(".rodata.08B97398")
const struct AiScr gUnk_08B97398[] = {
    { .cmd = 0x12, .unk_02 = 0xFF, .unk_08 = &gUnk_08B970F0[2] },
    { .cmd = 3, .unk_02 = 0xFF },
};

SECTION(".rodata.08B973B8")
const struct AiScr gUnk_08B973B8[] = {
    { .cmd = 0x12, .unk_02 = 0xFF, .unk_08 = gUnk_08B970F4 },
    { .cmd = 3, .unk_02 = 0xFF },
};

SECTION(".rodata.08B973D8")
const struct AiScr AiScr_AiB_NeverMove[] = {
    { .cmd = 0xE, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
};

SECTION(".rodata.08B973F8")
const struct AiScr AiScr_AiB_PillageThenPursue[] = {
    { .cmd = 0x10, .unk_02 = 0xFF },
    { .cmd = 2 },
    { .cmd = 3, .unk_02 = 0xFF },
};

SECTION(".rodata.08B97428")
const struct AiScr AiScr_AiB_PillageThenEscape[] = {
    { .cmd = 0x10, .unk_02 = 0xFF },
    { .cmd = 2, .unk_01 = 6, .unk_02 = 0xC },
    { .cmd = 3, .unk_02 = 0xFF },
};

SECTION(".rodata.08B97458")
const struct AiScr gAiScript_Escape[] = {
    { .cmd = 0x17, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 0xC, .unk_01 = 0x15, .unk_02 = 0xFF, .unk_03 = 0x11 },
    { .cmd = 0x1B, .unk_02 = 0xFF, .unk_03 = 1 },
    { .cmd = 6, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF, .unk_03 = 1 },
};

SECTION(".rodata.08B974B8")
const struct AiScr gUnk_08B974B8[] = {
    { .cmd = 0xC, .unk_01 = 6, .unk_02 = 0xFF, .unk_03 = 9 },
    { .cmd = 0x1B, .unk_02 = 0xFF, .unk_03 = 1 },
    { .cmd = 5, .unk_01 = 0x64, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF, .unk_03 = 1 },
};

SECTION(".rodata.08B974F8")
const struct AiScr gUnk_08B974F8[] = {
    { .cmd = 0xC, .unk_01 = 6, .unk_02 = 0xFF, .unk_03 = 5 },
    { .cmd = 0x1B, .unk_02 = 0xFF, .unk_03 = 1 },
    { .cmd = 5, .unk_01 = 0x64, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF, .unk_03 = 1 },
};

SECTION(".rodata.08B97538")
const struct AiScr gUnk_08B97538[] = {
    { .cmd = 0xC, .unk_01 = 5, .unk_02 = 0xFF, .unk_03 = 2 },
    { .cmd = 0x1B, .unk_02 = 0xFF, .unk_03 = 1 },
    { .cmd = 5, .unk_01 = 0x64, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF, .unk_03 = 1 },
};

SECTION(".rodata.08B97578")
const struct AiScr gUnk_08B97578[] = {
    { .cmd = 0xC, .unk_01 = 6, .unk_02 = 0xFF, .unk_03 = 2 },
    { .cmd = 0x1B, .unk_02 = 0xFF, .unk_03 = 1 },
    { .cmd = 5, .unk_01 = 0x64, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF, .unk_03 = 1 },
};

SECTION(".rodata.08B975B8")
const struct AiScr gUnk_08B975B8[] = {
    { .cmd = 1, .unk_02 = 0xFF, .unk_08 = AiCountEnemyInRangeOrTryMoveToSpecificPosition },
    { .unk_02 = 0xFF, .unk_03 = 1, .unk_08 = &gAiState.cmd_result[0] },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 0x1B, .unk_02 = 0xFF, .unk_03 = 1 },
    { .cmd = 1, .unk_02 = 0xFF, .unk_08 = sub_0803A3F0, .unk_0C = gUnk_081D3B44 },
};

SECTION(".rodata.08B97608")
const struct AiScr gUnk_08B97608[] = {
    { .cmd = 1, .unk_02 = 0xFF, .unk_08 = AiFunc_CountEnemiesInRange, .unk_0C = gUnk_081D3B48 },
    { .unk_02 = 0xFF, .unk_03 = 1, .unk_08 = &gAiState.cmd_result[0] },
    { .cmd = 0xE, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 0x1B, .unk_02 = 0xFF, .unk_03 = 1 },
    { .cmd = 2, .unk_01 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF, .unk_03 = 1 },
};

SECTION(".rodata.08B97678")
const struct AiScr gUnk_08B97678[] = {
    { .cmd = 1, .unk_02 = 0xFF, .unk_08 = AiFunc_CountEnemiesInRange, .unk_0C = gUnk_081D3B48 },
    { .unk_02 = 0xFF, .unk_03 = 1, .unk_08 = &gAiState.cmd_result[0] },
    { .cmd = 0xE, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 0x1B, .unk_02 = 0xFF, .unk_03 = 1 },
    { .cmd = 2, .unk_01 = 0xFF, .unk_02 = 1 },
    { .cmd = 3, .unk_02 = 0xFF, .unk_03 = 1 },
    { .cmd = 1, .unk_02 = 0xFF, .unk_08 = AiFunc_CountEnemiesInRange, .unk_0C = gUnk_081D3B48 },
    { .unk_02 = 0xFF, .unk_03 = 1, .unk_08 = &gAiState.cmd_result[0] },
    { .cmd = 0xE, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 0x1B, .unk_02 = 0xFF, .unk_03 = 1 },
    { .cmd = 2, .unk_01 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF, .unk_03 = 1 },
    { .cmd = 0x12, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
};

SECTION(".rodata.08B97778")
const struct AiScr gUnk_08B97778[] = {
    { .cmd = 0x16, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 0x1A, .unk_02 = 0xFF, .unk_08 = gUnk_08B970F8 },
    { .unk_01 = 2, .unk_02 = 0xFF, .unk_03 = 1, .unk_04 = 4, .unk_08 = &gAiState.cmd_result[0] },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 0xB, .unk_01 = 1 },
    { .cmd = 0x12, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
};

SECTION(".rodata.08B977F8")
const struct AiScr gUnk_08B977F8[] = {
    { .cmd = 0x1A, .unk_02 = 0xFF, .unk_08 = &gUnk_08B970F8[2] },
    { .unk_01 = 2, .unk_02 = 0xFF, .unk_03 = 1, .unk_04 = 4, .unk_08 = &gAiState.cmd_result[0] },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 0xB, .unk_01 = 1 },
    { .cmd = 0x12, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
};

SECTION(".rodata.08B97858")
const struct AiScr gAiScript_ActionInRange[] = {
    { .cmd = 5, .unk_01 = 0x64, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
};

SECTION(".rodata.08B97878")
const struct AiScr gAiScript_ActionInRange_80Perc[] = {
    { .cmd = 5, .unk_01 = 0x50, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
};

SECTION(".rodata.08B97898")
const struct AiScr gAiScript_ActionInRange_50Perc[] = {
    { .cmd = 5, .unk_01 = 0x32, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
};

SECTION(".rodata.08B978B8")
const struct AiScr gAiScript_ActionStanding[] = {
    { .cmd = 7, .unk_01 = 0x64, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
};

SECTION(".rodata.08B978D8")
const struct AiScr gAiScript_ActionStanding_80Perc[] = {
    { .cmd = 7, .unk_01 = 0x50, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
};

SECTION(".rodata.08B978F8")
const struct AiScr gAiScript_ActionStanding_50Perc[] = {
    { .cmd = 7, .unk_01 = 0x32, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
};

SECTION(".rodata.08B97918")
const struct AiScr gAiScript_DoNothing[] = {
    { .cmd = 6, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 5, .unk_01 = 0x64, .unk_02 = 0xFF },
    { .cmd = 1, .unk_02 = 0xFF, .unk_08 = sub_0803A3D4 },
    { .unk_02 = 0xFF, .unk_03 = 1, .unk_08 = &gAiState.cmd_result[0] },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 0x1B, .unk_02 = 0xFF, .unk_03 = 1 },
    { .cmd = 7, .unk_01 = 0x64, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF, .unk_03 = 1 },
    { .cmd = 5, .unk_01 = 0x64, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 5, .unk_01 = 0x64, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
};

SECTION(".rodata.08B979EC")
const struct AiScr gUnk_08B979EC[] = {
    { .cmd = 5, .unk_01 = 0x64, .unk_02 = 0xFF, .unk_08 = gUnk_08B979E8 },
    { .cmd = 3, .unk_02 = 0xFF },
};

SECTION(".rodata.08B97A14")
const struct AiScr gUnk_08B97A14[] = {
    { .cmd = 5, .unk_01 = 0x64, .unk_02 = 0xFF, .unk_08 = gUnk_08B97A0C },
    { .cmd = 3, .unk_02 = 0xFF },
};

SECTION(".rodata.08B97A38")
const struct AiScr gUnk_08B97A38[] = {
    { .cmd = 5, .unk_01 = 0x64, .unk_02 = 0xFF, .unk_08 = gUnk_08B97A34 },
    { .cmd = 3, .unk_02 = 0xFF },
};

SECTION(".rodata.08B97A5C")
const struct AiScr gAiScript_ActionInRange_ExceptCivilian[] = {
    { .cmd = 5, .unk_01 = 0x64, .unk_02 = 0xFF, .unk_08 = gUnk_08B97A58 },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 5, .unk_01 = 0x64, .unk_02 = 0xFF, .unk_08 = gUnk_08B970F4 },
    { .cmd = 3, .unk_02 = 0xFF },
};

SECTION(".rodata.08B97A9C")
const struct AiScr gUnk_08B97A9C[] = {
    { .cmd = 5, .unk_01 = 0x64, .unk_02 = 0xFF, .unk_08 = &gUnk_08B970F4[2] },
    { .cmd = 3, .unk_02 = 0xFF },
};

SECTION(".rodata.08B97ABC")
const struct AiScr gUnk_08B97ABC[] = {
    { .cmd = 4, .unk_01 = 0x64, .unk_02 = 0xFF, .unk_04 = 3 },
    { .unk_01 = 5, .unk_02 = 0xFF, .unk_04 = 3, .unk_08 = &gAiState.cmd_result[0] },
    { .cmd = 5, .unk_01 = 0x64, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
};

SECTION(".rodata.08B97AFC")
const struct AiScr gUnk_08B97AFC[] = {
    { .cmd = 5, .unk_01 = 0x64, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
};

SECTION(".rodata.08B97B1C")
const struct AiScr gUnk_08B97B1C[] = {
    { .cmd = 1, .unk_02 = 0xFF, .unk_08 = AiFunc_CountEnemiesInRange, .unk_0C = gUnk_081D3B4C },
    { .unk_02 = 0xFF, .unk_03 = 1, .unk_08 = &gAiState.cmd_result[0] },
    { .cmd = 7, .unk_01 = 0x64, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 0x1B, .unk_02 = 0xFF, .unk_03 = 1 },
    { .cmd = 5, .unk_01 = 0x64, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
};

SECTION(".rodata.08B97B8C")
const struct AiScr gUnk_08B97B8C[] = {
    { .cmd = 1, .unk_02 = 0xFF, .unk_08 = sub_0803A5BC },
    { .unk_01 = 2, .unk_02 = 0xFF, .unk_03 = 1, .unk_04 = 1, .unk_08 = &gAiState.cmd_result[1] },
    { .cmd = 1, .unk_02 = 0xFF, .unk_08 = sub_0803A7C8 },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 0x1B, .unk_02 = 0xFF, .unk_03 = 1 },
    { .cmd = 2 },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 2 },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 1, .unk_02 = 0xFF, .unk_08 = AiFunc_CountEnemiesInRange, .unk_0C = gUnk_081D3B50 },
    { .unk_02 = 0xFF, .unk_03 = 1, .unk_08 = &gAiState.cmd_result[0] },
    { .cmd = 0xC, .unk_01 = 5, .unk_02 = 0xFF, .unk_03 = 7 },
    { .cmd = 7, .unk_01 = 0x64, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 0x1B, .unk_02 = 0xFF, .unk_03 = 1 },
    { .cmd = 0x12, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 1, .unk_02 = 0xFF, .unk_08 = AiFunc_CountEnemiesInRange, .unk_0C = gUnk_081D3B50 },
    { .unk_02 = 0xFF, .unk_03 = 1, .unk_08 = &gAiState.cmd_result[0] },
    { .cmd = 0xC, .unk_01 = 0x11, .unk_02 = 0xFF, .unk_03 = 6 },
    { .cmd = 7, .unk_01 = 0x64, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 0x1B, .unk_02 = 0xFF, .unk_03 = 1 },
    { .cmd = 0x12, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
};

SECTION(".rodata.08B97D1C")
const struct AiScr gUnk_08B97D1C[] = {
    { .cmd = 1, .unk_02 = 0xFF, .unk_08 = sub_0803AA60 },
    { .cmd = 2, .unk_01 = 0x10, .unk_02 = 5 },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 1, .unk_02 = 0xFF, .unk_08 = AiFunc_CountEnemiesInRange, .unk_0C = gUnk_081D3B50 },
    { .unk_02 = 0xFF, .unk_03 = 1, .unk_08 = &gAiState.cmd_result[0] },
    { .cmd = 0xC, .unk_01 = 4, .unk_02 = 0xFF, .unk_03 = 2 },
    { .cmd = 7, .unk_01 = 0x64, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 0x1B, .unk_02 = 0xFF, .unk_03 = 1 },
    { .cmd = 0x12, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 1, .unk_02 = 0xFF, .unk_08 = AiFunc_CountEnemiesInRange, .unk_0C = gUnk_081D3B50 },
    { .unk_02 = 0xFF, .unk_03 = 1, .unk_08 = &gAiState.cmd_result[0] },
    { .cmd = 0xC, .unk_01 = 6, .unk_02 = 0xFF, .unk_03 = 2 },
    { .cmd = 7, .unk_01 = 0x64, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 0x1B, .unk_02 = 0xFF, .unk_03 = 1 },
    { .cmd = 0x12, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 1, .unk_02 = 0xFF, .unk_08 = AiFunc_CountEnemiesInRange, .unk_0C = gUnk_081D3B50 },
    { .unk_02 = 0xFF, .unk_03 = 1, .unk_08 = &gAiState.cmd_result[0] },
    { .cmd = 0xC, .unk_01 = 4, .unk_02 = 0xFF, .unk_03 = 3 },
    { .cmd = 7, .unk_01 = 0x64, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 0x1B, .unk_02 = 0xFF, .unk_03 = 1 },
    { .cmd = 0x12, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 1, .unk_02 = 0xFF, .unk_08 = AiFunc_CountEnemiesInRange, .unk_0C = gUnk_081D3B50 },
    { .unk_02 = 0xFF, .unk_03 = 1, .unk_08 = &gAiState.cmd_result[0] },
    { .cmd = 0xC, .unk_01 = 5, .unk_02 = 0xFF, .unk_03 = 3 },
    { .cmd = 7, .unk_01 = 0x64, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 0x1B, .unk_02 = 0xFF, .unk_03 = 1 },
    { .cmd = 0x12, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 1, .unk_02 = 0xFF, .unk_08 = AiFunc_CountEnemiesInRange, .unk_0C = gUnk_081D3B50 },
    { .unk_02 = 0xFF, .unk_03 = 1, .unk_08 = &gAiState.cmd_result[0] },
    { .cmd = 0xC, .unk_01 = 6, .unk_02 = 0xFF, .unk_03 = 3 },
    { .cmd = 7, .unk_01 = 0x64, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 0x1B, .unk_02 = 0xFF, .unk_03 = 1 },
    { .cmd = 0x12, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
};

SECTION(".rodata.08B97FCC")
const struct AiScr gUnk_08B97FCC = { .cmd = 2 };

SECTION(".rodata.08B97FDC")
const struct AiScr gUnk_08B97FDC[] = {
    { .cmd = 0xD, .unk_02 = 0xFF, .unk_04 = 2 },
    { .unk_01 = 2, .unk_02 = 0xFF, .unk_03 = 1, .unk_04 = 4, .unk_08 = &gAiState.cmd_result[0] },
    { .unk_01 = 2, .unk_02 = 0xFF, .unk_04 = 3, .unk_08 = &gAiState.cmd_result[0] },
    { .unk_01 = 5, .unk_02 = 0xFF, .unk_04 = 2, .unk_08 = &gAiState.cmd_result[0] },
    { .cmd = 1, .unk_02 = 0xFF, .unk_08 = sub_0803A58C, .unk_0C = gUnk_081D3B54 },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 0x1B, .unk_02 = 0xFF, .unk_03 = 1 },
    { .cmd = 0xE, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
};

SECTION(".rodata.08B9806C")
const struct AiScr gUnk_08B9806C[] = {
    { .cmd = 0xD, .unk_02 = 0xFF, .unk_04 = 0x28 },
    { .unk_01 = 2, .unk_02 = 0xFF, .unk_03 = 1, .unk_04 = 4, .unk_08 = &gAiState.cmd_result[0] },
    { .unk_01 = 2, .unk_02 = 0xFF, .unk_03 = 2, .unk_04 = 1, .unk_08 = &gAiState.cmd_result[0] },
    { .unk_01 = 2, .unk_02 = 0xFF, .unk_03 = 1, .unk_04 = 2, .unk_08 = &gAiState.cmd_result[0] },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 0x1B, .unk_02 = 0xFF, .unk_03 = 1 },
    { .cmd = 0x12, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 0x1B, .unk_02 = 0xFF, .unk_03 = 2 },
    { .cmd = 0x12, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF, .unk_03 = 2 },
};

SECTION(".rodata.08B9811C")
const struct AiScr gUnk_08B9811C[] = {
    { .cmd = 0xD, .unk_02 = 0xFF, .unk_04 = 1 },
    { .unk_01 = 2, .unk_02 = 0xFF, .unk_03 = 1, .unk_04 = 4, .unk_08 = &gAiState.cmd_result[0] },
    { .unk_01 = 2, .unk_02 = 0xFF, .unk_03 = 2, .unk_04 = 1, .unk_08 = &gAiState.cmd_result[0] },
    { .unk_01 = 2, .unk_02 = 0xFF, .unk_03 = 1, .unk_04 = 2, .unk_08 = &gAiState.cmd_result[0] },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 0x1B, .unk_02 = 0xFF, .unk_03 = 1 },
    { .cmd = 0x12, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 0x1B, .unk_02 = 0xFF, .unk_03 = 2 },
    { .cmd = 0x12, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF, .unk_03 = 2 },
};

SECTION(".rodata.08B981CC")
const struct AiScr gUnk_08B981CC[] = {
    { .cmd = 0xD, .unk_02 = 0xFF, .unk_04 = 1 },
    { .unk_01 = 2, .unk_02 = 0xFF, .unk_03 = 1, .unk_04 = 4, .unk_08 = &gAiState.cmd_result[0] },
    { .unk_01 = 2, .unk_02 = 0xFF, .unk_03 = 2, .unk_04 = 1, .unk_08 = &gAiState.cmd_result[0] },
    { .unk_01 = 2, .unk_02 = 0xFF, .unk_03 = 1, .unk_04 = 2, .unk_08 = &gAiState.cmd_result[0] },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 0x1B, .unk_02 = 0xFF, .unk_03 = 1 },
    { .cmd = 0xE, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 0x1B, .unk_02 = 0xFF, .unk_03 = 2 },
    { .cmd = 0x12, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF, .unk_03 = 2 },
};

SECTION(".rodata.08B9827C")
const struct AiScr gUnk_08B9827C[] = {
    { .cmd = 0xD, .unk_02 = 0xFF, .unk_04 = 2 },
    { .unk_01 = 2, .unk_02 = 0xFF, .unk_03 = 1, .unk_04 = 4, .unk_08 = &gAiState.cmd_result[0] },
    { .unk_01 = 2, .unk_02 = 0xFF, .unk_03 = 2, .unk_04 = 1, .unk_08 = &gAiState.cmd_result[0] },
    { .unk_01 = 2, .unk_02 = 0xFF, .unk_03 = 1, .unk_04 = 2, .unk_08 = &gAiState.cmd_result[0] },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 0x1B, .unk_02 = 0xFF, .unk_03 = 1 },
    { .cmd = 0x12, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 0x1B, .unk_02 = 0xFF, .unk_03 = 2 },
    { .cmd = 0x12, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF, .unk_03 = 2 },
};

SECTION(".rodata.08B9832C")
const struct AiScr gUnk_08B9832C[] = {
    { .cmd = 0xD, .unk_02 = 0xFF, .unk_04 = 2 },
    { .unk_01 = 2, .unk_02 = 0xFF, .unk_03 = 1, .unk_04 = 4, .unk_08 = &gAiState.cmd_result[0] },
    { .unk_01 = 2, .unk_02 = 0xFF, .unk_03 = 2, .unk_04 = 1, .unk_08 = &gAiState.cmd_result[0] },
    { .unk_01 = 2, .unk_02 = 0xFF, .unk_03 = 1, .unk_04 = 2, .unk_08 = &gAiState.cmd_result[0] },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 0x1B, .unk_02 = 0xFF, .unk_03 = 1 },
    { .cmd = 0xE, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 0x1B, .unk_02 = 0xFF, .unk_03 = 2 },
    { .cmd = 0x12, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF, .unk_03 = 2 },
};

SECTION(".rodata.08B983DC")
const struct AiScr gUnk_08B983DC[] = {
    { .cmd = 0xD, .unk_02 = 0xFF, .unk_04 = 0x26 },
    { .unk_01 = 2, .unk_02 = 0xFF, .unk_03 = 1, .unk_04 = 4, .unk_08 = &gAiState.cmd_result[0] },
    { .unk_01 = 2, .unk_02 = 0xFF, .unk_03 = 2, .unk_04 = 1, .unk_08 = &gAiState.cmd_result[0] },
    { .unk_01 = 2, .unk_02 = 0xFF, .unk_03 = 1, .unk_04 = 2, .unk_08 = &gAiState.cmd_result[0] },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 0x1B, .unk_02 = 0xFF, .unk_03 = 1 },
    { .cmd = 0x12, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 0x1B, .unk_02 = 0xFF, .unk_03 = 2 },
    { .cmd = 0x12, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF, .unk_03 = 2 },
};

SECTION(".rodata.08B9848C")
const struct AiScr gUnk_08B9848C[] = {
    { .cmd = 0xD, .unk_02 = 0xFF, .unk_04 = 0x7A },
    { .unk_01 = 2, .unk_02 = 0xFF, .unk_03 = 1, .unk_04 = 4, .unk_08 = &gAiState.cmd_result[0] },
    { .unk_01 = 2, .unk_02 = 0xFF, .unk_03 = 2, .unk_04 = 1, .unk_08 = &gAiState.cmd_result[0] },
    { .unk_01 = 2, .unk_02 = 0xFF, .unk_03 = 1, .unk_04 = 2, .unk_08 = &gAiState.cmd_result[0] },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 0x1B, .unk_02 = 0xFF, .unk_03 = 1 },
    { .cmd = 0x12, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 0x1B, .unk_02 = 0xFF, .unk_03 = 2 },
    { .cmd = 0x12, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF, .unk_03 = 2 },
    { .cmd = 1, .unk_02 = 0xFF, .unk_08 = sub_0803A5BC },
    { .cmd = 1, .unk_02 = 0xFF, .unk_08 = sub_0803A7C8 },
    { .cmd = 3, .unk_02 = 0xFF },
};

SECTION(".rodata.08B9856C")
const struct AiScr gUnk_08B9856C[] = {
    { .cmd = 1, .unk_02 = 0xFF, .unk_08 = sub_0803A828, .unk_0C = gUnk_081D3B58 },
    { .cmd = 3, .unk_02 = 0xFF },
};

SECTION(".rodata.08B9858C")
const struct AiScr gUnk_08B9858C[] = {
    { .cmd = 1, .unk_02 = 0xFF, .unk_08 = sub_0803A828, .unk_0C = gUnk_081D3B58 },
    { .cmd = 7, .unk_01 = 0x64, .unk_02 = 0xFF },
    { .cmd = 3, .unk_02 = 0xFF },
};

SECTION(".rodata.08B985BC")
const struct AiScr gUnk_08B985BC[] = {
    { .cmd = 1, .unk_02 = 0xFF, .unk_08 = sub_0803A874, .unk_0C = gUnk_081D3B5C },
    { .unk_01 = 2, .unk_02 = 0xFF, .unk_03 = 1, .unk_04 = 5, .unk_08 = &gAiState.cmd_result[0] },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 0x1B, .unk_02 = 0xFF, .unk_03 = 1 },
    { .cmd = 2, .unk_01 = 6, .unk_02 = 0xC },
    { .cmd = 3, .unk_02 = 0xFF },
};

SECTION(".rodata.08B9861C")
const struct AiScr gUnk_08B9861C[] = {
    { .cmd = 1, .unk_02 = 0xFF, .unk_08 = sub_0803A874, .unk_0C = gUnk_081D3B60 },
    { .cmd = 3, .unk_02 = 0xFF },
};

SECTION(".rodata.08B9863C")
const struct AiScr gUnk_08B9863C[] = {
    { .cmd = 0x18, .unk_02 = 0xFF },
    { .unk_01 = 2, .unk_02 = 0xFF, .unk_03 = 1, .unk_04 = 4, .unk_08 = &gAiState.cmd_result[0] },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 0x1B, .unk_02 = 0xFF, .unk_03 = 1 },
    { .cmd = 2 },
    { .cmd = 3, .unk_02 = 0xFF },
};

SECTION(".rodata.08B986A8")
const struct AiScr gUnk_08B986A8[] = {
    { .cmd = 1, .unk_02 = 0xFF, .unk_08 = sub_0803A548, .unk_0C = gUnk_08B986A0 },
    { .unk_01 = 2, .unk_02 = 0xFF, .unk_03 = 1, .unk_04 = 1, .unk_08 = &gAiState.cmd_result[0] },
    { .cmd = 1, .unk_02 = 0xFF, .unk_08 = sub_0803AA40, .unk_0C = gUnk_08B9869C },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 0x1B, .unk_02 = 0xFF, .unk_03 = 1 },
    { .cmd = 2 },
    { .cmd = 3, .unk_02 = 0xFF },
};

SECTION(".rodata.08B98724")
const struct AiScr gUnk_08B98724[] = {
    { .cmd = 1, .unk_02 = 0xFF, .unk_08 = sub_0803A548, .unk_0C = gUnk_08B9871C },
    { .unk_01 = 2, .unk_02 = 0xFF, .unk_03 = 1, .unk_04 = 1, .unk_08 = &gAiState.cmd_result[0] },
    { .cmd = 1, .unk_02 = 0xFF, .unk_08 = sub_0803AA40, .unk_0C = gUnk_08B98718 },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 0x1B, .unk_02 = 0xFF, .unk_03 = 1 },
    { .cmd = 2 },
    { .cmd = 3, .unk_02 = 0xFF },
};

SECTION(".rodata.08B987A0")
const struct AiScr gUnk_08B987A0[] = {
    { .cmd = 1, .unk_02 = 0xFF, .unk_08 = sub_0803A548, .unk_0C = gUnk_08B98798 },
    { .unk_01 = 2, .unk_02 = 0xFF, .unk_03 = 1, .unk_04 = 1, .unk_08 = &gAiState.cmd_result[0] },
    { .cmd = 1, .unk_02 = 0xFF, .unk_08 = sub_0803AA40, .unk_0C = gUnk_08B98794 },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 0x1B, .unk_02 = 0xFF, .unk_03 = 1 },
    { .cmd = 2 },
    { .cmd = 3, .unk_02 = 0xFF },
};

SECTION(".rodata.08B9881C")
const struct AiScr gUnk_08B9881C[] = {
    { .cmd = 1, .unk_02 = 0xFF, .unk_08 = sub_0803A548, .unk_0C = gUnk_08B98814 },
    { .unk_01 = 2, .unk_02 = 0xFF, .unk_03 = 1, .unk_04 = 1, .unk_08 = &gAiState.cmd_result[0] },
    { .cmd = 1, .unk_02 = 0xFF, .unk_08 = sub_0803AA40, .unk_0C = gUnk_08B98810 },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 0x1B, .unk_02 = 0xFF, .unk_03 = 1 },
    { .cmd = 2 },
    { .cmd = 3, .unk_02 = 0xFF },
};

SECTION(".rodata.08B98898")
const struct AiScr gUnk_08B98898[] = {
    { .cmd = 1, .unk_02 = 0xFF, .unk_08 = sub_0803A548, .unk_0C = gUnk_08B98890 },
    { .unk_01 = 2, .unk_02 = 0xFF, .unk_03 = 1, .unk_04 = 1, .unk_08 = &gAiState.cmd_result[0] },
    { .cmd = 1, .unk_02 = 0xFF, .unk_08 = sub_0803AA40, .unk_0C = gUnk_08B9888C },
    { .cmd = 3, .unk_02 = 0xFF },
    { .cmd = 0x1B, .unk_02 = 0xFF, .unk_03 = 1 },
    { .cmd = 2 },
    { .cmd = 3, .unk_02 = 0xFF },
};

extern const struct AiScr * const gAi2ScriptTable[];
extern const struct AiScr * const gAi1ScriptTable[];

SECTION(".rodata.08B98908")
const struct AiScr * const gAi2ScriptTable[] = {
    AiScr_AiB_MoveToEnemy,
    gUnk_08B97398,
    gUnk_08B973B8,
    AiScr_AiB_NeverMove,
    AiScr_AiB_PillageThenPursue,
    AiScr_AiB_PillageThenEscape,
    gUnk_08B97608,
    gUnk_08B97678,
    gUnk_08B975B8,
    gUnk_08B97778,
    &gUnk_08B97FCC,
    gUnk_08B97FDC,
    gAiScript_Escape,
    gUnk_08B9806C,
    gUnk_08B9811C,
    gUnk_08B9827C,
    gUnk_08B983DC,
    gUnk_08B9848C,
    gUnk_08B97D1C,
    gUnk_08B98724,
    gUnk_08B987A0,
    gUnk_08B9881C,
    gUnk_08B98898,
    gUnk_08B97578,
    gUnk_08B977F8,
    gUnk_08B974B8,
    gUnk_08B974F8,
    gUnk_08B9863C,
    gUnk_08B97318,
    gUnk_08B986A8,
    gUnk_08B97538,
    gUnk_08B97368,
    gUnk_08B97338,
    gUnk_08B981CC,
    gUnk_08B9832C,
};

SECTION(".rodata.08B98994")
const struct AiScr * const gAi1ScriptTable[] = {
    gAiScript_ActionInRange,
    gAiScript_ActionInRange_80Perc,
    gAiScript_ActionInRange_50Perc,
    gAiScript_ActionStanding,
    gAiScript_ActionStanding_80Perc,
    gAiScript_ActionStanding_50Perc,
    gAiScript_DoNothing,
    gUnk_08B979EC,
    gAiScript_ActionInRange_ExceptCivilian,
    gUnk_08B97A9C,
    gUnk_08B97ABC,
    gUnk_08B97AFC,
    gUnk_08B97B1C,
    gUnk_08B97B8C,
    gUnk_08B9856C,
    gUnk_08B9858C,
    gUnk_08B985BC,
    gUnk_08B9861C,
    gUnk_08B97A14,
    gUnk_08B97A38,
};

SECTION(".rodata.08B989E4")
const struct AiScr * const * const gpAi2Table[] = {
    gAi2ScriptTable,
    gAi2ScriptTable,
    gAi2ScriptTable,
};

SECTION(".rodata.08B989F0")
const struct AiScr * const * const gpAi1Table[] = {
    gAi1ScriptTable,
    gAi1ScriptTable,
    gAi1ScriptTable,
};
