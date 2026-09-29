#include "gbafe.h"
#include "gbafe/bmusemind.h"

void BattleInitItemEffect(struct Unit * actor, int itemSlot);
void BattleInitItemEffectTarget(struct Unit * unit);
void BattleApplyItemEffect(ProcPtr proc);
void BeginBattleAnimations(void);
void InitBattleUnitWithoutBonuses(struct BattleUnit * bu, struct Unit * unit);
void UnitPromote(struct Unit * unit);
void GenerateBattleUnitStatGainsComparatively(struct BattleUnit * bu, struct Unit * unit);
void MapFloodUnitExtended(struct Unit * unit);
s8 ExecTrapAfterWarp(ProcPtr proc);
struct MuProc * GetUnitMu(struct Unit * unit);
void EndMu(struct MuProc * proc);
void StartAvailableDoorTileEvent(s8 x, s8 y);
void StartAvailableChestTileEvent(s8 x, s8 y);
void NewPopup2_PlanA(ProcPtr proc, int iconId, char const * str);
void StartLightRuneAnim3(ProcPtr proc, int x, int y);

extern s8 TerrainTable_MovCost_FlyNormal[];

extern const struct ProcCmd ProcScr_PostWarpStaffAction[];
extern const struct ProcCmd ProcScr_SetTargetStatus[];

void DoItemHealStaffAction(ProcPtr proc)
{
    int amount;

    BattleInitItemEffect(GetUnit(gActionSt.instigator), gActionSt.item_slot);

    BattleInitItemEffectTarget(GetUnit(gActionSt.target));

    amount = GetUnitItemHealAmount(
        GetUnit(gActionSt.instigator),
        GetUnit(gActionSt.instigator)->items[gActionSt.item_slot]);

    AddUnitHp(GetUnit(gActionSt.target), amount);

    gBattleHitIterator->hpChange = gBattleTarget.unit.curHP - GetUnitCurrentHp(GetUnit(gActionSt.target));

    gBattleTarget.unit.curHP = GetUnitCurrentHp(GetUnit(gActionSt.target));

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();
}

void DoItemRestoreStaffAction(ProcPtr proc)
{
    BattleInitItemEffect(GetUnit(gActionSt.instigator), gActionSt.item_slot);

    BattleInitItemEffectTarget(GetUnit(gActionSt.target));

    SetUnitStatus(GetUnit(gActionSt.target), UNIT_STATUS_NONE);

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();
}

void ExecBarrierStaff(ProcPtr proc)
{
    BattleInitItemEffect(GetUnit(gActionSt.instigator), gActionSt.item_slot);

    BattleInitItemEffectTarget(GetUnit(gActionSt.target));

    GetUnit(gActionSt.target)->barrierDuration = 7;

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();
}

void GetRescueStaffTargetPosition(struct Unit * unit, struct Unit * target, int * xOut, int * yOut)
{
    int foundDist, dist;
    int ix, iy;

    *xOut = -1;
    *yOut = -1;

    foundDist = 9999;

    MapFloodUnitExtended(unit);

    gBmMapUnit[unit->yPos][unit->xPos] = -1;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
        {
            if (gBmMapMovement[iy][ix] > 0x78)
                continue;

            if (gBmMapUnit[iy][ix] != 0)
                continue;

            if ((gBmMapHidden[iy][ix] & HIDDEN_BIT_UNIT) != 0)
                continue;

            if (!CanUnitCrossTerrain(target, gBmMapTerrain[iy][ix]))
                continue;

            dist = RECT_DISTANCE(ix, iy, unit->xPos, unit->yPos);

            if (foundDist >= dist)
            {
                foundDist = dist;
                *xOut = ix;
                *yOut = iy;
            }
        }
    }

    if (*xOut >= 0 && *yOut >= 0)
        return;

    foundDist = 9999;

    GenerateExtendedMovementMap(unit->xPos, unit->yPos, TerrainTable_MovCost_FlyNormal);

    gBmMapUnit[unit->yPos][unit->xPos] = -1;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
        {
            if (gBmMapMovement[iy][ix] > 0x78)
                continue;

            if (gBmMapUnit[iy][ix] != 0)
                continue;

            if ((gBmMapHidden[iy][ix] & HIDDEN_BIT_UNIT) != 0)
                continue;

            if (!CanUnitCrossTerrain(target, gBmMapTerrain[iy][ix]))
                continue;

            dist = RECT_DISTANCE(ix, iy, unit->xPos, unit->yPos);

            if (foundDist >= dist)
            {
                foundDist = dist;
                *xOut = ix;
                *yOut = iy;
            }
        }
    }

    if (*xOut >= 0 && *yOut >= 0)
        return;

    *xOut = target->xPos;
    *yOut = target->yPos;
}

void DoItemRescueStaffAction(ProcPtr proc)
{
    int x, y;

    BattleInitItemEffect(GetUnit(gActionSt.instigator), gActionSt.item_slot);

    BattleInitItemEffectTarget(GetUnit(gActionSt.target));

    GetRescueStaffTargetPosition(
        GetUnit(gActionSt.instigator),
        GetUnit(gActionSt.target),
        &x, &y);

    GetUnit(gActionSt.target)->xPos = x;
    GetUnit(gActionSt.target)->yPos = y;

    gBattleTarget.changeHP = x;
    gBattleTarget.changePow = y;

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();
}

s8 PostWarpStaff_ExecTrap(ProcPtr proc)
{
    return ExecTrapAfterWarp(proc);
}

int PostWarpStaff_RefreshMap(void)
{
    EndMu(GetUnitMu(GetUnit(gActionSt.target)));

    RefreshEntityMaps();
    RenderMap();
    RefreshUnitSprites();
    ForceSyncUnitSpriteSheet();
}

void ExecWarpStaff(ProcPtr proc)
{
    BattleInitItemEffect(GetUnit(gActionSt.instigator), gActionSt.item_slot);

    BattleInitItemEffectTarget(GetUnit(gActionSt.target));

    GetUnit(gActionSt.target)->xPos = gActionSt.x_target;
    GetUnit(gActionSt.target)->yPos = gActionSt.y_target;

    gBattleTarget.changeHP = gActionSt.x_target;
    gBattleTarget.changePow = gActionSt.y_target;

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();

    Proc_StartBlocking(ProcScr_PostWarpStaffAction, proc);
}

void DoItemAttackStaffAction(ProcPtr proc)
{
    int accuracy;

    BattleInitItemEffect(GetUnit(gActionSt.instigator), gActionSt.item_slot);

    BattleInitItemEffectTarget(GetUnit(gActionSt.target));

    accuracy = GetOffensiveStaffAccuracy(
        GetUnit(gActionSt.instigator),
        GetUnit(gActionSt.target));

    gBattleActor.battleEffectiveHitRate = accuracy;

    if (!RandRoll(accuracy))
    {
        gBattleHitIterator->attributes |= BATTLE_HIT_ATTR_MISS;
    }
    else
    {
        switch (GetItemIndex(gBattleActor.weaponBefore))
        {

        case ITEM_STAFF_BERSERK:
            gBattleTarget.statusOut = UNIT_STATUS_BERSERK;
            break;

        case ITEM_STAFF_SILENCE:
            gBattleTarget.statusOut = UNIT_STATUS_SILENCED;
            break;

        case ITEM_STAFF_SLEEP:
            gBattleTarget.statusOut = UNIT_STATUS_SLEEP;
            break;

        }
    }

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();
}

void DoItemFortifyStaffAction(ProcPtr proc)
{
    int i;
    int amount;
    int targetCount;

    BattleInitItemEffect(GetUnit(gActionSt.instigator), gActionSt.item_slot);

    MakeTargetListForRangedHeal(GetUnit(gActionSt.instigator));

    amount = GetUnitItemHealAmount(
        GetUnit(gActionSt.instigator),
        GetUnit(gActionSt.instigator)->items[gActionSt.item_slot]);

    targetCount = CountTargets();

    for (i = 0; i < targetCount; i++)
        AddUnitHp(GetUnit(GetTarget(i)->uid), amount);

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();
}

void ExecUnlockStaff(ProcPtr proc)
{
    BattleInitItemEffect(GetUnit(gActionSt.instigator), gActionSt.item_slot);

    gBattleTarget.unit.xPos = gActionSt.x_target;
    gBattleTarget.unit.yPos = gActionSt.y_target;

    gBattleTarget.changeHP = gActionSt.x_target;
    gBattleTarget.changePow = gActionSt.y_target;

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();
}

void ExecHammerne(ProcPtr proc)
{
    BattleInitItemEffect(GetUnit(gActionSt.instigator), gActionSt.item_slot);

    BattleInitItemEffectTarget(GetUnit(gActionSt.target));

    GetUnit(gActionSt.target)->items[gActionSt.extra] =
        MakeNewItem(GetUnit(gActionSt.target)->items[gActionSt.extra]);

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();
}

void ExecLatona(ProcPtr proc)
{
    int i;
    int targetCount;

    BattleInitItemEffect(GetUnit(gActionSt.instigator), gActionSt.item_slot);

    MakeTargetListForLatona(GetUnit(gActionSt.instigator));

    targetCount = CountTargets();

    for (i = 0; i < targetCount; i++)
    {
        struct Unit * target = GetUnit(GetTarget(i)->uid);

        SetUnitHp(target, GetUnitMaxHp(target));
        SetUnitStatus(target, UNIT_STATUS_NONE);
    }

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();
}

void ExecVulneraryItem(ProcPtr proc, int amount)
{
    BattleInitItemEffect(GetUnit(gActionSt.instigator), gActionSt.item_slot);

    AddUnitHp(GetUnit(gActionSt.instigator), amount);

    gBattleHitIterator->hpChange = gBattleActor.unit.curHP - GetUnitCurrentHp(GetUnit(gActionSt.instigator));

    gBattleActor.unit.curHP = GetUnitCurrentHp(GetUnit(gActionSt.instigator));

    gBattleActor.weaponBefore = ITEM_VULNERARY;

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();
}

void ExecElixirItem(ProcPtr proc)
{
    BattleInitItemEffect(GetUnit(gActionSt.instigator), gActionSt.item_slot);

    SetUnitHp(GetUnit(gActionSt.instigator), GetUnitMaxHp(GetUnit(gActionSt.instigator)));

    gBattleHitIterator->hpChange = gBattleActor.unit.curHP - GetUnitCurrentHp(GetUnit(gActionSt.instigator));

    gBattleActor.unit.curHP = GetUnitCurrentHp(GetUnit(gActionSt.instigator));

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();
}

void ExecPureWaterItem(ProcPtr proc)
{
    BattleInitItemEffect(GetUnit(gActionSt.instigator), gActionSt.item_slot);

    GetUnit(gActionSt.instigator)->barrierDuration = 7;

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();
}

void ExecTorchItem(ProcPtr proc)
{
    BattleInitItemEffect(GetUnit(gActionSt.instigator), gActionSt.item_slot);

    GetUnit(gActionSt.instigator)->torchDuration = 4;

    gActionSt.x_target = gActionSt.x_move;
    gActionSt.y_target = gActionSt.y_move;

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();
}

void ExecAntitoxinItem(ProcPtr proc)
{
    BattleInitItemEffect(GetUnit(gActionSt.instigator), gActionSt.item_slot);

    SetUnitStatus(GetUnit(gActionSt.instigator), UNIT_STATUS_NONE);
    SetUnitStatus(&gBattleActor.unit, UNIT_STATUS_NONE);

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();
}

void ExecKeyItem(void)
{
    int x, y;

    UnitUpdateUsedItem(GetUnit(gActionSt.instigator), gActionSt.item_slot);

    x = GetUnit(gActionSt.instigator)->xPos;
    y = GetUnit(gActionSt.instigator)->yPos;

    StartAvailableDoorTileEvent(x - 1, y);
    StartAvailableDoorTileEvent(x + 1, y);
    StartAvailableDoorTileEvent(x, y - 1);
    StartAvailableDoorTileEvent(x, y + 1);

    StartAvailableChestTileEvent(x, y);

    PlaySoundEffect(0xB1);

    gBattleTarget.statusOut = -1;
}

void GenerateItemPromotionBattle(struct Unit * unit, int itemIdx, s8 unk)
{
    if (itemIdx != -1)
        gBattleActor.weaponBefore = gBattleTarget.weaponBefore = unit->items[itemIdx];

    gBattleActor.weapon = gBattleTarget.weapon = GetUnitEquippedWeapon(unit);

    InitBattleUnitWithoutBonuses(&gBattleTarget, unit);

    UnitPromote(unit);

    InitBattleUnitWithoutBonuses(&gBattleActor, unit);

    GenerateBattleUnitStatGainsComparatively(&gBattleActor, &gBattleTarget.unit);

    SetBattleUnitTerrainBonusesAuto(&gBattleActor);
    SetBattleUnitTerrainBonusesAuto(&gBattleTarget);

    if (unk)
        unit->state |= US_HAS_MOVED;

    if (itemIdx != -1)
        UnitUpdateUsedItem(unit, itemIdx);

    gBattleHitArray[0].attributes = 0;
    gBattleHitArray[0].info = BATTLE_HIT_INFO_END;
    gBattleHitArray[0].hpChange = 0;

    gBattleStats.config = BATTLE_CONFIG_PROMOTION;
}

void DoItemPromoteAction(void)
{
    GenerateItemPromotionBattle(GetUnit(gActionSt.instigator), gActionSt.item_slot, 1);
    BeginBattleAnimations();
}

void GeneratePromotionBattle(struct Unit * unit, int item)
{
    gBattleActor.weaponBefore = gBattleTarget.weaponBefore = item;
    gBattleActor.weapon = gBattleTarget.weapon = item;

    InitBattleUnit(&gBattleTarget, unit);

    UnitPromote(unit);

    InitBattleUnit(&gBattleActor, unit);

    GenerateBattleUnitStatGainsComparatively(&gBattleActor, &gBattleTarget.unit);

    SetBattleUnitTerrainBonusesAuto(&gBattleActor);
    SetBattleUnitTerrainBonusesAuto(&gBattleTarget);

    gBattleHitArray[0].attributes = 0;
    gBattleHitArray[0].info = BATTLE_HIT_INFO_END;
    gBattleHitArray[0].hpChange = 0;

    gBattleStats.config = BATTLE_CONFIG_PROMOTION;

    BeginBattleAnimations();

    unit->state |= US_HIDDEN;
}

int ApplyItemStatBoost(struct Unit * unit, int itemIdx)
{
    const struct ItemStatBonuses * statBonuses;
    int messageId = 0;

    int item = unit->items[itemIdx];

    if (GetItemIndex(item) == ITEM_AFAS_DROPS)
    {
        unit->state |= US_GROWTH_BOOST;
        UnitUpdateUsedItem(unit, itemIdx);
        return 0x719;
    }

    statBonuses = GetItemBonuses(item);

    unit->maxHP += statBonuses->hpBonus;
    unit->curHP += statBonuses->hpBonus;
    unit->pow += statBonuses->powBonus;
    unit->skl += statBonuses->sklBonus;
    unit->spd += statBonuses->spdBonus;
    unit->def += statBonuses->defBonus;
    unit->res += statBonuses->resBonus;
    unit->lck += statBonuses->lckBonus;
    unit->movBonus += statBonuses->movBonus;
    unit->conBonus += statBonuses->conBonus;

    UnitCheckStatCaps(unit);
    UnitUpdateUsedItem(unit, itemIdx);

    switch (GetItemIndex(item))
    {

    case ITEM_BOOSTER_SKL:
        messageId = 0x711;
        break;

    case ITEM_BOOSTER_LCK:
        messageId = 0x713;
        break;

    case ITEM_BOOSTER_HP:
        messageId = 0x718;
        break;

    case ITEM_BOOSTER_DEF:
        messageId = 0x714;
        break;

    case ITEM_BOOSTER_SPD:
        messageId = 0x712;
        break;

    case ITEM_BOOSTER_RES:
        messageId = 0x715;
        break;

    case ITEM_BOOSTER_MOV:
        messageId = 0x716;
        break;

    case ITEM_BOOSTER_CON:
        messageId = 0x717;
        break;

    case ITEM_BOOSTER_POW:
        messageId = UnitHasMagicRank(unit) ? 0x710 : 0x70F;
        break;

    }

    return messageId;
}

void DoItemStatBoostAction(ProcPtr proc)
{
    int item;
    int messageId;
    struct Unit * unit = GetUnit(gActionSt.instigator);

    item = unit->items[gActionSt.item_slot];

    gBattleTarget.statusOut = -1;

    messageId = ApplyItemStatBoost(unit, gActionSt.item_slot);

    PlaySoundEffect(0x37A);

    NewPopup2_PlanA(proc, GetItemIconId(item), DecodeMsg(messageId));
}

void ExecMine(ProcPtr proc)
{
    BattleInitItemEffect(GetUnit(gActionSt.instigator), gActionSt.item_slot);

    AddTrap(gActionSt.x_target, gActionSt.y_target, TRAP_MINE, 0);

    BattleApplyItemEffect(proc);

    gBattleTarget.statusOut = -1;

    StartMineAnim(proc, gActionSt.x_target, gActionSt.y_target);
}

void ExecLightRune(ProcPtr proc)
{
    BattleInitItemEffect(GetUnit(gActionSt.instigator), gActionSt.item_slot);

    AddLightRune(gActionSt.x_target, gActionSt.y_target);

    BattleApplyItemEffect(proc);

    StartLightRuneAnim3(proc, gActionSt.x_target, gActionSt.y_target);

    gBattleTarget.statusOut = -1;
}

void ExecTorchStaff(ProcPtr proc)
{
    BattleInitItemEffect(GetUnit(gActionSt.instigator), gActionSt.item_slot);

    AddTrap(gActionSt.x_target, gActionSt.y_target, TRAP_TORCHLIGHT, 8);

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();
}

void ExecDanceRing(ProcPtr proc)
{
    int status = 0;

    BattleInitItemEffect(GetUnit(gActionSt.instigator), gActionSt.item_slot);

    BattleInitItemEffectTarget(GetUnit(gActionSt.target));

    switch (GetItemIndex(GetUnit(gActionSt.instigator)->items[gActionSt.item_slot]))
    {

    case ITEM_FILLAS_MIGHT:
        status = UNIT_STATUS_ATTACK;
        break;

    case ITEM_NINISS_GRACE:
        status = UNIT_STATUS_DEFENSE;
        break;

    case ITEM_THORS_IRE:
        status = UNIT_STATUS_CRIT;
        break;

    case ITEM_SETS_LITANY:
        status = UNIT_STATUS_AVOID;
        break;

    }

    SetUnitStatusExt(GetUnit(gActionSt.target), status, 1);

    gBattleStats.config = BATTLE_CONFIG_DANCERING;

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();
}

void DoItemAction(ProcPtr proc)
{
    int itemId = GetItemIndex(GetUnit(gActionSt.instigator)->items[gActionSt.item_slot]);

    gBattleActor.hasItemEffectTarget = 0;

    switch (itemId)
    {

    case ITEM_STAFF_HEAL:
    case ITEM_STAFF_MEND:
    case ITEM_STAFF_RECOVER:
    case ITEM_STAFF_PHYSIC:
        DoItemHealStaffAction(proc);
        break;

    case ITEM_STAFF_SILENCE:
    case ITEM_STAFF_SLEEP:
    case ITEM_STAFF_BERSERK:
        DoItemAttackStaffAction(proc);
        break;

    case ITEM_STAFF_FORTIFY:
        DoItemFortifyStaffAction(proc);
        break;

    case ITEM_STAFF_RESTORE:
        DoItemRestoreStaffAction(proc);
        break;

    case ITEM_STAFF_RESCUE:
        DoItemRescueStaffAction(proc);
        break;

    case ITEM_STAFF_BARRIER:
        ExecBarrierStaff(proc);
        break;

    case ITEM_STAFF_WARP:
        ExecWarpStaff(proc);
        break;

    case ITEM_STAFF_UNLOCK:
        ExecUnlockStaff(proc);
        break;

    case ITEM_STAFF_REPAIR:
        ExecHammerne(proc);
        break;

    case ITEM_TORCH:
        ExecTorchItem(proc);
        break;

    case ITEM_VULNERARY:
    case ITEM_VULNERARY_2:
        ExecVulneraryItem(proc, 10);
        break;

    case ITEM_ELIXIR:
        ExecElixirItem(proc);
        break;

    case ITEM_PUREWATER:
        ExecPureWaterItem(proc);
        break;

    case ITEM_ANTITOXIN:
        ExecAntitoxinItem(proc);
        break;

    case ITEM_CHESTKEY:
    case ITEM_DOORKEY:
    case ITEM_LOCKPICK:
    case ITEM_CHESTKEY_BUNDLE:
        ExecKeyItem();
        break;

    case ITEM_HEROCREST:
    case ITEM_KNIGHTCREST:
    case ITEM_ORIONSBOLT:
    case ITEM_ELYSIANWHIP:
    case ITEM_GUIDINGRING:
    case ITEM_EARTH_SEAL:
    case ITEM_HEAVEN_SEAL:
    case ITEM_FELL_CONTRACT:
    case ITEM_OCEANSEAL:
        DoItemPromoteAction();
        break;

    case ITEM_BOOSTER_HP:
    case ITEM_BOOSTER_POW:
    case ITEM_BOOSTER_SKL:
    case ITEM_BOOSTER_SPD:
    case ITEM_BOOSTER_LCK:
    case ITEM_BOOSTER_DEF:
    case ITEM_BOOSTER_RES:
    case ITEM_BOOSTER_MOV:
    case ITEM_BOOSTER_CON:
    case ITEM_AFAS_DROPS:
        DoItemStatBoostAction(proc);
        break;

    case ITEM_MINE:
        ExecMine(proc);
        break;

    case ITEM_LIGHTRUNE:
        ExecLightRune(proc);
        break;

    case ITEM_STAFF_TORCH:
        ExecTorchStaff(proc);
        break;

    case ITEM_FILLAS_MIGHT:
    case ITEM_NINISS_GRACE:
    case ITEM_THORS_IRE:
    case ITEM_SETS_LITANY:
        ExecDanceRing(proc);
        break;

    }

    if (gBattleTarget.statusOut >= 0)
        Proc_StartBlocking(ProcScr_SetTargetStatus, proc);
}

void ApplyStatusChange(void)
{
    if (gBattleTarget.statusOut < 0)
        return;

    SetUnitStatus(GetUnit(gActionSt.target), gBattleTarget.statusOut);
    gBattleTarget.statusOut = -1;
}

SECTION(".rodata.08B945C8")
const struct ProcCmd ProcScr_PostWarpStaffAction[] = {
    PROC_SLEEP(0),
    PROC_CALL_2(PostWarpStaff_ExecTrap),
    PROC_CALL(PostWarpStaff_RefreshMap),
    PROC_END,
};

SECTION(".rodata.08B945E8")
const struct ProcCmd ProcScr_SetTargetStatus[] = {
    PROC_SLEEP(1),
    PROC_CALL(ApplyStatusChange),
    PROC_END,
};
