#include "gbafe.h"
#include "gbafe/bmmind.h"

// Unit actions (FE8U: bmmind.c)

/* functions from other modules */
void TryRemoveUnitFromBallista(struct Unit * unit);
int GetSomeFacingDirection(int xFrom, int yFrom, int xTo, int yTo);
void StartAvailableTileEvent(s8 x, s8 y);
void InitObstacleBattleUnit(void);
void PidStatsRecordDefeatInfo(u8 pid, u8 killerPid, int deathCause);
void DoItemAction(ProcPtr proc);
void Make6CKOIDO(struct Unit * unit, int facing, int kind, ProcPtr parent);
int ExecTrapAfterDropAction(ProcPtr proc, struct Unit * unit);
void ExecTrapAfterDeathDrop(ProcPtr proc, struct Unit * unit);
void SetAutoMuMoveScript(const u8 * commands);
void BattleGenerateBallistaReal(struct Unit * actor, struct Unit * target);
void BattleGenerateReal(struct Unit * actor, struct Unit * target);
void BattleInitItemEffect(struct Unit * actor, int itemSlot);
void BattleInitItemEffectTarget(struct Unit * unit);
void BattleApplyMiscAction(ProcPtr proc);
void BeginBattleAnimations(void);
void StartCharacterEvent(u8 pidA, u8 pidB);
void StartSupportTalk(u8 pidA, u8 pidB, int level);
void BeginMapAnimForSteal(void);
void PutUnitSprite(int layer, int x, int y, struct Unit * unit);
void UnitGetDeathDropLocation(struct Unit * unit, int * xOut, int * yOut);
void StartMuDeathFade(struct MuProc * proc);
struct MuProc * StartMu(struct Unit * unit);
int GetFacingFromTo(int x1, int y1, int x2, int y2);
void SetMuMoveScript(struct MuProc * proc, u8 const * script);
void EndMu(struct MuProc * proc);
int GetCurrentBgmSong(void);
int GetUnitLastItem(struct Unit * unit);
void StartGiveItem(struct Unit * unit, u16 item, ProcPtr parent);

extern u8 gWorkingMovementScript[];
extern struct ProcCmd CONST_DATA ProcScr_Mu[];

extern struct ProcCmd CONST_DATA sProcScr_AfterDropAction[];
extern struct ProcCmd CONST_DATA sProcScr_DeathDropAnim[];
extern struct ProcCmd CONST_DATA sProcScr_CombatAction[];
extern struct ProcCmd CONST_DATA sProcScr_ArenaAction[];

void StoreRNStateToActionStruct(void)
{
    RandGetSt(gActionSt.action_rand_st);
}

void LoadRNStateFromActionStruct(void)
{
    RandSetSt(gActionSt.action_rand_st);
}

s8 DoAction(ProcPtr proc)
{
    gActiveUnit = GetUnit(gActionSt.instigator);

    switch (gActionSt.id)
    {
    case ACTION_WAIT:
    case ACTION_TRAPPED:
        gActiveUnit->state |= US_HAS_MOVED;
        return 1;

    case ACTION_RESCUE:
        return DoRescueAction(proc);

    case ACTION_DROP:
        return DoRescueDropAction(proc);

    case ACTION_VISIT:
    case ACTION_SEIZE:
        return ActionVisitAndSeize(proc);

    case ACTION_COMBAT:
        return ActionCombat(proc);

    case ACTION_REFRESH:
        return ActionDance(proc);

    case ACTION_TALK:
        return ActionTalk(proc);

    case ACTION_SUPPORT:
        return ActionSupport(proc);

    case ACTION_STEAL:
        return ActionSteal(proc);

    case ACTION_16:
        return ActionArena(proc);

    case ACTION_STAFF:
    case ACTION_DOOR:
    case ACTION_CHEST:
    case ACTION_USEITEM:
        DoItemAction(proc);
        return 0;

    default:
        return 1;
    }
}

s8 DoRescueAction(ProcPtr proc)
{
    struct Unit * subject = GetUnit(gActionSt.instigator);
    struct Unit * target = GetUnit(gActionSt.target);

    TryRemoveUnitFromBallista(target);

    Make6CKOIDO(
        target,
        GetSomeFacingDirection(subject->xPos, subject->yPos, target->xPos, target->yPos),
        0,
        proc);

    UnitRescue(subject, target);
    HideUnitSprite(target);

    return 0;
}

s8 AfterDrop_CheckTrapAfterDropMaybe(struct AfterDropActionProc * proc)
{
    return ExecTrapAfterDropAction(proc, proc->unit);
}

int sub_0802F38C(void)
{
    RefreshEntityMaps();
    RenderMap();
    RefreshUnitSprites();
    ForceSyncUnitSpriteSheet();
}

s8 DoRescueDropAction(ProcPtr proc)
{
    struct AfterDropActionProc * child;

    struct Unit * target = GetUnit(gActionSt.target);

    if (gBmMapHidden[gActionSt.y_target][gActionSt.x_target] & HIDDEN_BIT_UNIT)
    {
        gWorkingMovementScript[0] = MOVE_CMD_BUMP;
        gWorkingMovementScript[1] = MOVE_CMD_HALT;
        SetAutoMuMoveScript(gWorkingMovementScript);
        return 0;
    }

    UnitSyncMovement(GetUnit(gActionSt.instigator));

    Make6CKOIDO(
        target,
        GetSomeFacingDirection(gActionSt.x_target, gActionSt.y_target, target->xPos, target->yPos),
        2,
        proc);

    UnitDrop(GetUnit(gActionSt.instigator), gActionSt.x_target, gActionSt.y_target);

    child = Proc_StartBlocking(sProcScr_AfterDropAction, proc);
    child->unit = target;

    return 0;
}

s8 ActionVisitAndSeize(ProcPtr proc)
{
    int x = GetUnit(gActionSt.instigator)->xPos;
    int y = GetUnit(gActionSt.instigator)->yPos;

    StartAvailableTileEvent(x, y);

    return 0;
}

s8 ActionCombat(ProcPtr proc)
{
    struct Unit * target = GetUnit(gActionSt.target);

    if (target == NULL)
        InitObstacleBattleUnit();

    if (gActionSt.item_slot == ITEMSLOT_BALLISTA)
        BattleGenerateBallistaReal(GetUnit(gActionSt.instigator), target);
    else
        BattleGenerateReal(GetUnit(gActionSt.instigator), target);

    Proc_StartBlocking(sProcScr_CombatAction, proc);

    return 0;
}

s8 ActionArena(ProcPtr proc)
{
    Proc_StartBlocking(sProcScr_ArenaAction, proc);
    return 0;
}

s8 ActionDance(ProcPtr proc)
{
    GetUnit(gActionSt.target)->state &= ~(US_UNSELECTABLE | US_HAS_MOVED | US_HAS_MOVED_AI);

    BattleInitItemEffect(GetUnit(gActionSt.instigator), -1);
    BattleInitItemEffectTarget(GetUnit(gActionSt.target));

    gBattleStats.config = BATTLE_CONFIG_REFRESH;

    BattleApplyMiscAction(proc);
    BeginBattleAnimations();

    return 0;
}

s8 ActionTalk(ProcPtr proc)
{
    StartCharacterEvent(
        GetUnit(gActionSt.instigator)->pCharacterData->number,
        GetUnit(gActionSt.target)->pCharacterData->number);

    return 0;
}

s8 ActionSupport(ProcPtr proc)
{
    int subjectExp;
    int targetExp;

    struct Unit * target = GetUnit(gActionSt.target);

    int targetSupportNum = GetUnitSupportNumByPid(gActiveUnit, target->pCharacterData->number);
    int subjectSupportNum = GetUnitSupportNumByPid(target, gActiveUnit->pCharacterData->number);

    CanUnitSupportNow(target, subjectSupportNum);

    UnitGainSupportLevel(gActiveUnit, targetSupportNum);
    UnitGainSupportLevel(target, subjectSupportNum);

    StartSupportTalk(
        gActiveUnit->pCharacterData->number,
        target->pCharacterData->number,
        GetUnitSupportLevel(gActiveUnit, targetSupportNum));

    subjectExp = gActiveUnit->supports[targetSupportNum];
    targetExp = target->supports[subjectSupportNum];

    if (subjectExp != targetExp)
    {
        if (subjectExp > targetExp)
            target->supports[subjectSupportNum] = subjectExp;

        if (subjectExp < targetExp)
            gActiveUnit->supports[targetSupportNum] = targetExp;
    }

    return 0;
}

s8 ActionSteal(ProcPtr proc)
{
    int item;

    struct Unit * target = GetUnit(gActionSt.target);

    if (target->state & US_DROP_ITEM)
    {
        if (gActionSt.item_slot == (GetUnitItemCount(target) - 1))
            target->state &= ~US_DROP_ITEM;
    }

    item = GetUnit(gActionSt.target)->items[gActionSt.item_slot];

    UnitRemoveItem(GetUnit(gActionSt.target), gActionSt.item_slot);
    UnitAddItem(GetUnit(gActionSt.instigator), item);

    BattleInitItemEffect(GetUnit(gActionSt.instigator), -1);
    gBattleTarget.terrainId = TERRAIN_PLAINS;
    InitBattleUnit(&gBattleTarget, GetUnit(gActionSt.target));
    gBattleTarget.weapon = item;
    BattleApplyMiscAction(proc);

    EndAllMus();
    BeginMapAnimForSteal();

    return 0;
}

void DeathDropSpriteAnim_Loop(struct DeathDropAnimProc * proc)
{
    int x = Interpolate(0, proc->xFrom, proc->xTo, proc->clock, proc->clockEnd);
    int y = Interpolate(0, proc->yFrom, proc->yTo, proc->clock, proc->clockEnd);

    y += proc->yOffset;

    proc->yOffset += proc->ySpeed;
    proc->ySpeed += proc->yAccel;

    PutUnitSprite(7, x - gBmSt.camera.x, y - gBmSt.camera.y, proc->unit);

    ++proc->clock;

    if (proc->clock == proc->clockEnd)
        Proc_Break(proc);
}

void DeathDropSpriteAnim_ExecAnyTrap(struct DeathDropAnimProc * proc)
{
    ExecTrapAfterDeathDrop(proc, proc->unit);
}

void DeathDropSpriteAnim_End(void)
{
    RefreshEntityMaps();
    RefreshUnitSprites();
}

void DropRescueOnDeath(ProcPtr proc, struct Unit * unit)
{
    struct DeathDropAnimProc * child;

    if (GetUnitCurrentHp(unit) != 0)
        return;

    if (!(unit->state & US_RESCUING))
        return;

    child = Proc_StartBlocking(sProcScr_DeathDropAnim, proc);

    child->unit = GetUnit(unit->rescue);

    UnitGetDeathDropLocation(unit, &child->xDrop, &child->yDrop);
    UnitDrop(unit, child->xDrop, child->yDrop);

    child->xFrom = unit->xPos * 16;
    child->yFrom = unit->yPos * 16;
    child->xTo = child->xDrop * 16;
    child->yTo = child->yDrop * 16;
    child->yOffset = 0;
    child->ySpeed = -5;
    child->yAccel = 1;
    child->clock = 0;
    child->clockEnd = 11;

    UseUnitSprite(GetUnitSMSId(child->unit));
    ForceSyncUnitSpriteSheet();

    PlaySoundEffect(SONG_AC);
}

void KillUnitOnCombatDeath(struct Unit * unitA, struct Unit * unitB)
{
    if (GetUnitCurrentHp(unitA) != 0)
        return;

    if (unitA->pCharacterData->number == CHARACTER_FIREDRAGON)
        return;

    PidStatsRecordDefeatInfo(unitA->pCharacterData->number, unitB->pCharacterData->number, 2);

    UnitKill(unitA);
}

void KillUnitOnArenaDeathMaybe(struct Unit * unit)
{
    if (GetUnitCurrentHp(unit) != 0)
        return;

    UnitKill(unit);

    PidStatsRecordDefeatInfo(unit->pCharacterData->number, 0, 6);
}

void BATTLE_GOTO1_IfNobodyIsDead(ProcPtr proc)
{
    if (!(gBattleStats.config & BATTLE_CONFIG_MAPANIMS))
    {
        if (gBattleActor.unit.curHP == 0)
            return;

        if (gBattleTarget.unit.curHP == 0)
            return;
    }

    Proc_Goto(proc, 1);
}

bool8 DidUnitDie(struct Unit * unit)
{
    if (GetUnitCurrentHp(unit) != 0)
        return FALSE;

    if (unit->pCharacterData->number == CHARACTER_FIREDRAGON)
        return FALSE;

    return TRUE;
}

void BATTLE_PostCombatDeathFades(struct CombatActionProc * proc)
{
    struct MuProc * muProc;

    proc->unk_54 = NULL;

    if (DidUnitDie(&gBattleActor.unit))
    {
        muProc = Proc_Find(ProcScr_Mu);
        StartMuDeathFade(muProc);
        proc->unk_54 = muProc;

        TryRemoveUnitFromBallista(&gBattleActor.unit);
    }

    if (DidUnitDie(&gBattleTarget.unit))
    {
        struct Unit * target = GetUnit(gBattleTarget.unit.index);
        target->state |= US_HIDDEN;

        TryRemoveUnitFromBallista(target);

        RefreshUnitSprites();
        muProc = StartMu(&gBattleTarget.unit);

        gWorkingMovementScript[0] = GetFacingFromTo(
            gBattleActor.unit.xPos, gBattleActor.unit.yPos, gBattleTarget.unit.xPos, gBattleTarget.unit.yPos);
        gWorkingMovementScript[1] = MOVE_CMD_HALT;

        SetMuMoveScript(muProc, gWorkingMovementScript);
        StartMuDeathFade(muProc);

        proc->unk_54 = muProc;
    }
}

void BATTLE_DeleteLinkedMOVEUNIT(struct CombatActionProc * proc)
{
    EndMu(proc->unk_54);
}

void BATTLE_HandleCombatDeaths(struct CombatActionProc * proc)
{
    struct Unit * unitA = GetUnit(proc->unitIdA);
    struct Unit * unitB = GetUnit(proc->unitIdB);

    DropRescueOnDeath(proc, unitA);
    DropRescueOnDeath(proc, unitB);

    KillUnitOnCombatDeath(unitA, unitB);
    KillUnitOnCombatDeath(unitB, unitA);
}

void sub_0802F9A4(void)
{
    int bgmIdx = GetActiveMapSong();

    if (GetCurrentBgmSong() != bgmIdx)
        StartBgmExt(bgmIdx, 6, NULL);
}

bool8 BATTLE_HandleItemDrop(struct CombatActionProc * proc)
{
    struct Unit * unitA = NULL;
    struct Unit * unitB = NULL;

    proc->unitIdA = gBattleActor.unit.index;
    proc->unitIdB = gBattleTarget.unit.index;

    if (gBattleActor.unit.curHP == 0)
    {
        unitA = GetUnit(gBattleActor.unit.index);
        unitB = GetUnit(gBattleTarget.unit.index);
    }

    if (gBattleTarget.unit.curHP == 0)
    {
        unitA = GetUnit(gBattleTarget.unit.index);
        unitB = GetUnit(gBattleActor.unit.index);
    }

    if (unitA == NULL)
        return TRUE;

    if (!(unitA->state & US_DROP_ITEM))
        return TRUE;

    if (unitA->items[0] == 0)
        return TRUE;

    if (UNIT_FACTION(unitB) != FACTION_BLUE)
        return TRUE;

    StartGiveItem(unitB, GetUnitLastItem(unitA), proc);

    return FALSE;
}

void sub_0802FA6C(ProcPtr proc)
{
    gBattleTarget.unit.maxHP = 1;
    gBattleTarget.unit.curHP = 1;

    if (gBattleActor.unit.curHP != 0)
        Proc_Goto(proc, 1);
}

void BATTLE_HandleArenaDeathsMaybe(ProcPtr proc)
{
    KillUnitOnArenaDeathMaybe(gActiveUnit);
    DropRescueOnDeath(proc, gActiveUnit);
}
