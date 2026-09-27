#include "gbafe.h"
#include "gbafe/bmtrap.h"
#include "gbafe/bmarch.h"

// Traps (FE8U: bmtrap.c)

// from other modules
struct MuProc;
void StartFireTrapAnim1(ProcPtr proc, int x, int y);
void StartFireTrapAnim2(ProcPtr proc, int x, int y);
void MU_SetDefaultFacing_Auto(void);
struct MuProc * GetUnitMu(struct Unit * unit);
void EndMu(struct MuProc * proc);
void BeginUnitCritDamageAnim(struct Unit * unit, int trapType);
void ApplyHazardHealing(ProcPtr proc, struct Unit * unit, int hpAmount, int status);
bool CheckForWaitEvents(void);
void RunWaitEvents(void);
struct Trap * GetTypedTrapAt(int x, int y, int trapType);
struct Trap * AddTrap(int x, int y, int trapType, int meta);
struct Trap * RemoveTrap(struct Trap * trap);
void AddFireTile(int x, int y, int turnCountdown, int turnInterval);
void AddGasTrap(int x, int y, int facing, int turnCountdown, int turnInterval);
void AddTrap8(int x, int y);
void AddTrap9(int x, int y, int meta);
void NewPopup2_PlanA(ProcPtr parent, int icon, char * str);
int GetBattleAnimType(void);
const struct TrapData * sub_080791F0(void);

CONST_DATA struct ProcCmd sProcScr_ExecTrap8[] = {
    PROC_SLEEP(1),
    PROC_WHILE(MuExistsActive),
    PROC_CALL(RegisterTrapDeathBWL),
    PROC_CALL(ExecFireTileTrapAnim1),
    PROC_YIELD,
    PROC_CALL(ApplyTrapDamageAnim),
    PROC_YIELD,
    PROC_CALL(ApplyTrapDamageReal),
    PROC_YIELD,
    PROC_END,
};

CONST_DATA struct ProcCmd sProcScr_ExecTrapMine[] = {
    PROC_SLEEP(1),
    PROC_WHILE(MuExistsActive),
    PROC_CALL(RegisterTrapDeathBWL),
    PROC_CALL(ExecFireTileTrapAnim2),
    PROC_YIELD,
    PROC_CALL(ApplyTrapDamageAnim),
    PROC_YIELD,
    PROC_CALL(ApplyTrapDamageReal),
    PROC_YIELD,
    PROC_END,
};

void RegisterTrapDeathBWL(struct ProcBmTrap * proc)
{
    struct Unit * unit = proc->unit;

    if (GetUnitCurrentHp(unit) <= 10)
        PidStatsRecordLoseData(unit->pCharacterData->number);
}

void ExecFireTileTrapAnim1(struct ProcBmTrap * proc)
{
    StartFireTrapAnim1(proc, proc->unit->xPos, proc->unit->yPos);
}

void ExecFireTileTrapAnim2(struct ProcBmTrap * proc)
{
    StartFireTrapAnim2(proc, proc->unit->xPos, proc->unit->yPos);
}

void ApplyTrapDamageAnim(struct ProcBmTrap * proc)
{
    struct Unit * unit = proc->unit;

    switch (proc->post_exec_type)
    {
    case 0:
        EndAllMus();
        break;

    case 1:
        EndAllMus();
        StartMu(gActiveUnit);
        MU_SetDefaultFacing_Auto();
        break;

    case 2:
        EndMu(GetUnitMu(unit));
        break;
    }

    gActionSt.extra = TRAP_TORCHLIGHT;
    BeginUnitCritDamageAnim(unit, TRAP_TORCHLIGHT);
}

void ApplyTrapDamageReal(struct ProcBmTrap * proc)
{
    struct Unit * unit = proc->unit;

    ApplyHazardHealing(proc, unit, -10, -1);

    if (GetUnitCurrentHp(unit) == 0)
    {
        struct Unit * tmp = gActiveUnit;
        gActiveUnit = unit;

        PidStatsRecordDefeatInfo(unit->pCharacterData->number, 0, 3);

        if (CheckForWaitEvents() != 0)
            RunWaitEvents();

        gActiveUnit = tmp;
    }
}

enum
{
    TRAP_FIRE_THIEF = 14,
    TRAP_MINE_ASSASSIN = 15,
};

int GetPickTrapType(struct Unit * unit)
{
    struct Trap * trap;

    if ((trap = GetTrapAt(unit->xPos, unit->yPos)) == NULL)
        return TRAP_NONE;

    switch (trap->type)
    {
    case TRAP_BALLISTA:
        return TRAP_NONE;

    case TRAP_FIRETILE:
        if ((UNIT_CATTRIBUTES(unit) & CA_THIEF))
            return TRAP_FIRE_THIEF;

        break;

    case TRAP_MINE:
        if ((UNIT_CATTRIBUTES(unit) & CA_ASSASSIN))
        {
            if (GetUnitItemCount(unit) != UNIT_ITEM_COUNT)
                return TRAP_MINE_ASSASSIN;

            return TRAP_NONE;
        }
        else if ((UNIT_CATTRIBUTES(unit) & CA_STEAL))
            return TRAP_NONE;

        break;
    }

    return trap->type;
}

int ExecTrap(ProcPtr proc, struct Unit * unit, int exec_type)
{
    struct ProcBmTrap * proc2;

    switch (GetPickTrapType(unit))
    {
    case TRAP_8:
        proc2 = Proc_StartBlocking(sProcScr_ExecTrap8, proc);
        proc2->post_exec_type = exec_type;
        proc2->unit = unit;
        break;

    case TRAP_MINE:
        RemoveTrap(GetTypedTrapAt(unit->xPos, unit->yPos, TRAP_MINE));
        proc2 = Proc_StartBlocking(sProcScr_ExecTrapMine, proc);
        proc2->post_exec_type = exec_type;
        proc2->unit = unit;
        break;

    case TRAP_FIRE_THIEF:
        RemoveTrap(GetTrapAt(unit->xPos, unit->yPos));
        PlaySoundEffect(0xB1);
        NewPopup2_PlanA(proc, -1, DecodeMsg(0x71A)); /* Disabled trap. */
        break;

    case TRAP_MINE_ASSASSIN:
        RemoveTrap(GetTrapAt(unit->xPos, unit->yPos));
        PlaySoundEffect(0xB1);
        NewPopup2_PlanA(proc, -1, DecodeMsg(0x71B)); /* Recovered mine. */
        UnitAddItem(unit, MakeNewItem(ITEM_MINE));
        break;
    }

    return 0;
}

bool HandlePostActionTraps(ProcPtr proc)
{
    if (GetUnitCurrentHp(gActiveUnit) <= 0)
        return 1;

    if (!GetPickTrapType(gActiveUnit))
        return 1;

    gActionSt.suspend_point = 1;
    gActionSt.id = 1;

    WriteSuspendSave(3);

    if (GetBattleAnimType() == 1)
        RefreshUnitSprites();

    return ExecTrap(proc, gActiveUnit, 0);
}

bool ExecTrapAfterWarp(ProcPtr proc)
{
    return ExecTrap(proc, GetUnit(gActionSt.target), 1);
}

bool ExecTrapAfterDropAction(ProcPtr proc, struct Unit * unit)
{
    if (!GetPickTrapType(unit))
    {
        EndMu(GetUnitMu(unit));
        RenderMap();
        RefreshEntityMaps();
        ForceSyncUnitSpriteSheet();
        return 1;
    }

    return ExecTrap(proc, unit, 2);
}

bool ExecTrapAfterDeathDrop(ProcPtr proc, struct Unit * unit)
{
    return ExecTrap(proc, unit, 3);
}

void LoadChapterTraps(void)
{
    const struct TrapData * data = sub_080791F0();

    while (data->type)
    {
        switch (data->type)
        {
        case TRAP_BALLISTA:
            AddBallista(data->xPos, data->yPos, data->subtype);
            break;

        case TRAP_FIRETILE:
            AddFireTile(data->xPos, data->yPos, data->turn_counter, data->turn);
            break;

        case TRAP_GAS:
            AddGasTrap(data->xPos, data->yPos, data->subtype, data->turn_counter, data->turn);
            break;

        case TRAP_8:
            AddTrap8(data->xPos, data->yPos);
            break;

        case TRAP_9:
            AddTrap9(data->xPos, data->yPos, data->subtype);
            break;

        case TRAP_MINE:
            AddTrap(data->xPos, data->yPos, data->type, 0);
            break;
        }
        data++;
    }
}
