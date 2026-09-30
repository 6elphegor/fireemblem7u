#include "gbafe.h"

#define gMapMovementSigned ((s8 **) gBmMapMovement)
#define gMapRangeSigned ((s8 **) gBmMapRange)

struct ItemUseMenuItemProc {
    /* 00 */ PROC_HEADER;

    /* 2A */ s16 xTile;
    /* 2C */ s16 yTile;
    /* 30 */ void const * def;
    /* 34 */ struct Text text;
    /* 3C */ s8 itemNumber;
    /* 3D */ u8 availability;
};
PROC_SIZE_CHECK(struct ItemUseMenuItemProc);

s8 CanUnitUseItem(struct Unit * unit, int item)
{
    if ((GetItemAttributes(item) & IA_STAFF) && !CanUnitUseStaff(unit, item))
        return FALSE;

    switch (GetItemIndex(item))
    {
    case ITEM_STAFF_HEAL:
    case ITEM_STAFF_MEND:
    case ITEM_STAFF_RECOVER:
        return HasSelectTarget(unit, MakeTargetListForAdjacentHeal);

    case ITEM_STAFF_PHYSIC:
        return HasSelectTarget(unit, MakeTargetListForRangedHeal);

    case ITEM_STAFF_FORTIFY:
        return HasSelectTarget(unit, MakeTargetListForRangedHeal);

    case ITEM_STAFF_RESTORE:
        return HasSelectTarget(unit, MakeTargetListForRestore);

    case ITEM_STAFF_RESCUE:
        return HasSelectTarget(unit, MakeTargetListForRescueStaff);

    case ITEM_STAFF_BARRIER:
        return HasSelectTarget(unit, MakeTargetListForBarrier);

    case ITEM_STAFF_SILENCE:
        return HasSelectTarget(unit, MakeTargetListForSilence);

    case ITEM_STAFF_SLEEP:
        return HasSelectTarget(unit, MakeTargetListForSleep);

    case ITEM_STAFF_BERSERK:
        return HasSelectTarget(unit, MakeTargetListForBerserk);

    case ITEM_STAFF_WARP:
        return HasSelectTarget(unit, MakeTargetListForWarp);

    case ITEM_STAFF_REPAIR:
        return HasSelectTarget(unit, MakeTargetListForHammerne);

    case ITEM_STAFF_UNLOCK:
        return HasSelectTarget(unit, MakeTargetListForUnlock);

    case ITEM_BOOSTER_HP:
    case ITEM_BOOSTER_POW:
    case ITEM_BOOSTER_SKL:
    case ITEM_BOOSTER_SPD:
    case ITEM_BOOSTER_LCK:
    case ITEM_BOOSTER_DEF:
    case ITEM_BOOSTER_RES:
    case ITEM_BOOSTER_MOV:
    case ITEM_BOOSTER_CON:
        return CanUnitUseStatGainItem(unit, item);

    case ITEM_HEROCREST:
    case ITEM_KNIGHTCREST:
    case ITEM_ORIONSBOLT:
    case ITEM_ELYSIANWHIP:
    case ITEM_GUIDINGRING:
    case ITEM_EARTH_SEAL:
    case ITEM_HEAVEN_SEAL:
    case ITEM_FELL_CONTRACT:
    case ITEM_OCEANSEAL:
        return CanUnitUsePromotionItem(unit, item);

    case ITEM_VULNERARY:
    case ITEM_ELIXIR:
    case ITEM_VULNERARY_2:
        return CanUnitUseHealItem(unit);

    case ITEM_PUREWATER:
        return CanUnitUsePureWaterItem(unit);

    case ITEM_TORCH:
        return CanUnitUseTorchItem(unit);

    case ITEM_ANTITOXIN:
        return CanUnitUseAntitoxinItem(unit);

    case ITEM_CHESTKEY:
    case ITEM_CHESTKEY_BUNDLE:
        return CanUnitUseChestKeyItem(unit);

    case ITEM_DOORKEY:
        return CanUnitUseDoorKeyItem(unit);

    case ITEM_LOCKPICK:
        return CanUnitUseLockpickItem(unit);

    case ITEM_MINE:
        return HasSelectTarget(unit, MakeTargetListForMine);

    case ITEM_LIGHTRUNE:
        return HasSelectTarget(unit, MakeTargetListForLightRune);

    case ITEM_STAFF_TORCH:
        return gPlaySt.chapterVisionRange != 0;

    case ITEM_FILLAS_MIGHT:
    case ITEM_NINISS_GRACE:
    case ITEM_THORS_IRE:
    case ITEM_SETS_LITANY:
        return HasSelectTarget(unit, MakeTargetListForDanceRing);

    case ITEM_AFAS_DROPS:
        if (unit->state & US_GROWTH_BOOST)
            return FALSE;

        return TRUE;

    default:
        return FALSE;
    }
}

int GetItemCantUseMsgid(struct Unit * unit, int item)
{
    switch (GetItemIndex(item))
    {
    case ITEM_STAFF_TORCH:
    case ITEM_BOOSTER_HP:
    case ITEM_BOOSTER_POW:
    case ITEM_BOOSTER_SKL:
    case ITEM_BOOSTER_SPD:
    case ITEM_BOOSTER_LCK:
    case ITEM_BOOSTER_DEF:
    case ITEM_BOOSTER_RES:
    case ITEM_BOOSTER_MOV:
    case ITEM_BOOSTER_CON:
    case ITEM_VULNERARY:
    case ITEM_ELIXIR:
    case ITEM_PUREWATER:
    case ITEM_ANTITOXIN:
    case ITEM_TORCH:
    case ITEM_VULNERARY_2:
        return 0x743; // There's no need for that.

    case ITEM_CHESTKEY:
    case ITEM_CHESTKEY_BUNDLE:
        return 0x747; // There's no chest.

    case ITEM_DOORKEY:
        return 0x746; // There's no door.

    case ITEM_LOCKPICK:
        if (UNIT_CATTRIBUTES(gActiveUnit) & CA_THIEF)
            return 0x74A;

        return 0x748;

    case ITEM_HEROCREST:
    case ITEM_KNIGHTCREST:
    case ITEM_ORIONSBOLT:
    case ITEM_ELYSIANWHIP:
    case ITEM_GUIDINGRING:
    case ITEM_EARTH_SEAL:
    case ITEM_HEAVEN_SEAL:
    case ITEM_FELL_CONTRACT:
    case ITEM_OCEANSEAL:
    {
        int level = gActiveUnit->level;
        s8 boolval;

        gActiveUnit->level = 10;
        boolval = CanUnitUsePromotionItem(gActiveUnit, item);
        gActiveUnit->level = level;

        if (boolval)
            return 0x745;

        return 0x744;
    }

    default:
        return 0x744;
    }
}

void DoItemUse(struct Unit * unit, int item)
{
    ClearUi();
    EndFaceById(0);

    switch (GetItemIndex(item))
    {
    case ITEM_STAFF_HEAL:
    case ITEM_STAFF_MEND:
    case ITEM_STAFF_RECOVER:
        DoUseHealStaff(unit, MakeTargetListForAdjacentHeal);
        break;

    case ITEM_STAFF_PHYSIC:
        DoUseHealStaff(unit, MakeTargetListForRangedHeal);
        break;

    case ITEM_STAFF_RESCUE:
        DoUseRescueStaff(unit, MakeTargetListForRescueStaff);
        break;

    case ITEM_STAFF_RESTORE:
        DoUseRestoreStaff(unit, MakeTargetListForRestore);
        break;

    case ITEM_STAFF_SILENCE:
        DoUseAttackStaff(unit, MakeTargetListForSilence);
        break;

    case ITEM_STAFF_SLEEP:
        DoUseAttackStaff(unit, MakeTargetListForSleep);
        break;

    case ITEM_STAFF_BERSERK:
        DoUseAttackStaff(unit, MakeTargetListForBerserk);
        break;

    case ITEM_STAFF_BARRIER:
        DoUseBarrierStaff(unit);
        break;

    case ITEM_STAFF_UNLOCK:
        DoUsePutTrap(unit, MakeTargetListForUnlock, 0x730);
        break;

    case ITEM_STAFF_WARP:
        DoUseWarpStaff(unit);
        break;

    case ITEM_STAFF_REPAIR:
        DoUseRepairStaff(unit);
        break;

    case ITEM_STAFF_FORTIFY:
        SetStaffUseAction(unit);
        break;

    case ITEM_MINE:
        DoUsePutTrap(unit, MakeTargetListForMine, 0x732);
        break;

    case ITEM_LIGHTRUNE:
        DoUsePutTrap(unit, MakeTargetListForLightRune, 0x733);
        break;

    case ITEM_STAFF_TORCH:
        DoUseTorchStaff(unit);
        break;

    case ITEM_FILLAS_MIGHT:
    case ITEM_NINISS_GRACE:
    case ITEM_THORS_IRE:
    case ITEM_SETS_LITANY:
        DoUseSpecialDance(unit, MakeTargetListForDanceRing, 0x734);
        break;

    default:
        SetItemUseAction(unit);
        break;
    }
}

s8 HasSelectTarget(struct Unit * unit, void (*func)(struct Unit *))
{
    func(unit);

    return CountTargets() != 0;
}

s8 CanUnitUseHealItem(struct Unit * unit)
{
    if (GetUnitCurrentHp(unit) == GetUnitMaxHp(unit))
        return FALSE;

    return TRUE;
}

s8 sub_08027304(struct Unit * unit)
{
    return FALSE;
}

s8 CanUnitUsePureWaterItem(struct Unit * unit)
{
    if (unit->barrierDuration == 7)
        return FALSE;

    return TRUE;
}

s8 CanUnitUseTorchItem(struct Unit * unit)
{
    if (gPlaySt.chapterVisionRange != 0 && unit->torchDuration != 4)
        return TRUE;

    return FALSE;
}

s8 CanUnitUseAntitoxinItem(struct Unit * unit)
{
    if (unit->statusIndex != UNIT_STATUS_POISON)
        return FALSE;

    return TRUE;
}

s8 CanUnitUseChestKeyItem(struct Unit * unit)
{
    if (gBmMapTerrain[unit->yPos][unit->xPos] != TERRAIN_CHEST)
        return FALSE;

    if (!IsThereClosedChestAt(unit->xPos, unit->yPos))
        return FALSE;

    return TRUE;
}

s8 CanUnitUseDoorKeyItem(struct Unit * unit)
{
    MakeTargetListForDoorAndBridges(unit, TERRAIN_DOOR);
    return CountTargets();
}

s8 CanUnitOpenBridge(struct Unit * unit)
{
    MakeTargetListForDoorAndBridges(unit, TERRAIN_DRAWBRIDGE);
    return CountTargets();
}

s8 CanUnitUseLockpickItem(struct Unit * unit)
{
    if (!(UNIT_CATTRIBUTES(unit) & CA_THIEF))
        return FALSE;

    if (!CanUnitUseChestKeyItem(unit) && !CanUnitUseDoorKeyItem(unit) && !CanUnitOpenBridge(unit))
        return FALSE;

    return TRUE;
}

s8 CanUnitUsePromotionItem(struct Unit * unit, int item)
{
    const u8 * classList = NULL;

    if (unit->level < 10)
        return FALSE;

    switch (GetItemIndex(item))
    {
    case ITEM_HEROCREST:
        classList = gItemUseJidList_HeroCrest;
        break;

    case ITEM_KNIGHTCREST:
        classList = gItemUseJidList_KnightCrest;
        break;

    case ITEM_ORIONSBOLT:
        classList = gItemUseJidList_OrionsBolt;
        break;

    case ITEM_ELYSIANWHIP:
        classList = gItemUseJidList_ElysianWhip;
        break;

    case ITEM_GUIDINGRING:
        classList = gItemUseJidList_GuidingRing;
        break;

    case ITEM_EARTH_SEAL:
        classList = gItemUseJidList_EarthSeal;
        break;

    case ITEM_HEAVEN_SEAL:
        if (gPlaySt.chapterModeIndex == 3)
            classList = gItemUseJidList_HeavenSealHector;
        else
            classList = gItemUseJidList_HeavenSeal;

        break;

    case ITEM_FELL_CONTRACT:
        classList = gItemUseJidList_FellContract;
        break;

    case ITEM_OCEANSEAL:
        classList = gItemUseJidList_OceanSeal;
        break;
    }

    while (*classList)
    {
        if (unit->pClassData->number == *classList)
            return TRUE;

        classList++;
    }

    return FALSE;
}

s8 CanUnitUseStatGainItem(struct Unit * unit, int item)
{
    s8 result;

    const struct ItemStatBonuses * bonuses = GetItemBonuses(item);

    ClearUnit(&gStatGainSimUnit);

    gStatGainSimUnit.pCharacterData = unit->pCharacterData;
    gStatGainSimUnit.pClassData = unit->pClassData;

    gStatGainSimUnit.maxHP = unit->maxHP + bonuses->hpBonus;
    gStatGainSimUnit.pow = unit->pow + bonuses->powBonus;
    gStatGainSimUnit.skl = unit->skl + bonuses->sklBonus;
    gStatGainSimUnit.spd = unit->spd + bonuses->spdBonus;
    gStatGainSimUnit.def = unit->def + bonuses->defBonus;
    gStatGainSimUnit.res = unit->res + bonuses->resBonus;
    gStatGainSimUnit.lck = unit->lck + bonuses->lckBonus;
    gStatGainSimUnit.movBonus = unit->movBonus + bonuses->movBonus;
    gStatGainSimUnit.conBonus = unit->conBonus + bonuses->conBonus;

    UnitCheckStatCaps(&gStatGainSimUnit);

    result = gStatGainSimUnit.maxHP != unit->maxHP;

    if (gStatGainSimUnit.pow != unit->pow)
        result = TRUE;

    if (gStatGainSimUnit.skl != unit->skl)
        result = TRUE;

    if (gStatGainSimUnit.spd != unit->spd)
        result = TRUE;

    if (gStatGainSimUnit.def != unit->def)
        result = TRUE;

    if (gStatGainSimUnit.res != unit->res)
        result = TRUE;

    if (gStatGainSimUnit.lck != unit->lck)
        result = TRUE;

    if (gStatGainSimUnit.movBonus != unit->movBonus)
        result = TRUE;

    if (gStatGainSimUnit.conBonus != unit->conBonus)
        result = TRUE;

    return result;
}

void SetStaffUseAction(struct Unit * unit)
{
    HideMoveRangeGraphics();

    TmFill(gBg2Tm, 0);
    EnableBgSync(BG2_SYNC_BIT);

    gActionSt.id = ACTION_STAFF;
}

void SetItemUseAction(struct Unit * unit)
{
    gActionSt.id = ACTION_USEITEM;
}

u8 StaffSelectOnSelect(ProcPtr proc, struct SelectTarget * target)
{
    gActionSt.target = target->uid;
    SetStaffUseAction(NULL);

    return 0x17;
}

void DoUseRescueStaff(struct Unit * unit, void (*func)(struct Unit *))
{
    func(unit);

    BmMapFill(gBmMapMovement, -1);

    StartSubtitleHelp(
        NewTargetSelection_Specialized(&gSelectInfo_WarpUnit, StaffSelectOnSelect),
        DecodeMsg(0x72C));
}

void DoUseSpecialDance(struct Unit * unit, void (*func)(struct Unit *), int msg)
{
    func(unit);

    BmMapFill(gBmMapMovement, -1);

    StartSubtitleHelp(
        NewTargetSelection_Specialized(&gSelectInfo_WarpUnit, StaffSelectOnSelect),
        DecodeMsg(msg));
}

void WarpSelect_OnInit(struct WarpSelectProc * proc)
{
    struct SpriteAnim * ap;

    StartSubtitleHelp(proc, DecodeMsg(0x725));

    EnsureCameraOntoPosition(proc,
        GetUnit(gActionSt.target)->xPos,
        GetUnit(gActionSt.target)->yPos);

    HideMoveRangeGraphics();

    FillWarpRangeMap(gActiveUnit, GetUnit(gActionSt.target));

    gBmSt.flags &= ~BM_FLAG_1;

    DisplayMoveRangeGraphics(1);

    SetMapCursorPosition(
        GetUnit(gActionSt.target)->xPos,
        GetUnit(gActionSt.target)->yPos);

    ap = StartSpriteAnim(gSpriteAnim_WarpCursor, 0);

    ap->oam2 = 0;
    SetSpriteAnimId(ap, 0);

    proc->ap = ap;
    proc->prevWarpAllowed = 2;
}

void WarpSelect_OnIdle(struct WarpSelectProc * proc)
{
    s8 warpAllowed = gMapMovementSigned[gBmSt.cursor.y][gBmSt.cursor.x] != -1;

    HandlePlayerMapCursor();

    if (gpKeySt->pressed & A_BUTTON)
    {
        if (warpAllowed)
        {
            Proc_Break(proc);

            gActionSt.x_target = gBmSt.cursor.x;
            gActionSt.y_target = gBmSt.cursor.y;

            SetStaffUseAction(gActiveUnit);

            TmFill(gBg2Tm, 0);
            EnableBgSync(BG2_SYNC_BIT);

            PlaySoundEffect(0x38A);

            return;
        }
        else
        {
            PlaySoundEffect(0x38C);
        }
    }

    if (gpKeySt->pressed & B_BUTTON)
    {
        Proc_Goto(proc, 99);

        TmFill(gBg2Tm, 0);
        EnableBgSync(BG2_SYNC_BIT);

        PlaySoundEffect(0x38B);
    }

    if (warpAllowed != proc->prevWarpAllowed)
        SetSpriteAnimId(proc->ap, warpAllowed ? 0 : 1);

    DisplaySpriteAnim(proc->ap,
        gBmSt.cursor_sprite.x - gBmSt.camera.x,
        gBmSt.cursor_sprite.y - gBmSt.camera.y);

    proc->prevWarpAllowed = warpAllowed;
}

void WarpSelect_OnConfirm(struct WarpSelectProc * proc)
{
    ResetTextFont();
    HideMoveRangeGraphics();
    EndSubtitleHelp();

    SetMapCursorPosition(gActiveUnit->xPos, gActiveUnit->yPos);

    EnsureCameraOntoPosition(proc, gActiveUnit->xPos, gActiveUnit->yPos);
}

void WarpSelect_OnCancel(struct WarpSelectProc * proc)
{
    ResetTextFont();
    HideMoveRangeGraphics();
    EndSubtitleHelp();

    SetMapCursorPosition(gActiveUnit->xPos, gActiveUnit->yPos);

    Proc_Start(gProcScr_BackToUnitMenu, PROC_TREE_3);
}

void WarpSelect_OnEnd(struct WarpSelectProc * proc)
{
    HideMoveRangeGraphics();
    EndSpriteAnim(proc->ap);
}

u8 WarpOnSelectTarget(ProcPtr proc, struct SelectTarget * target)
{
    EndTargetSelection(proc);

    gActionSt.target = target->uid;

    Proc_Start(gProcScr_SquareSelectWarp, PROC_TREE_3);

    return 4;
}

void DoUseWarpStaff(struct Unit * unit)
{
    MakeTargetListForWarp(unit);

    BmMapFill(gBmMapMovement, -1);

    StartSubtitleHelp(
        NewTargetSelection_Specialized(&gSelectInfo_WarpUnit, WarpOnSelectTarget),
        DecodeMsg(0x72B));

    PlaySoundEffect(0x38A);
}

u8 OnSelectPutTrap(ProcPtr proc, struct SelectTarget * target)
{
    gActionSt.x_target = target->x;
    gActionSt.y_target = target->y;

    SetStaffUseAction(NULL);

    return 0x17;
}

void DoUsePutTrap(struct Unit * unit, void (*func)(struct Unit *), int msg)
{
    func(unit);

    BmMapFill(gBmMapMovement, -1);

    StartSubtitleHelp(
        NewTargetSelection_Specialized(&gSelectInfo_PutTrap, OnSelectPutTrap),
        DecodeMsg(msg));

    PlaySoundEffect(0x38A);
}

u8 RepairSelectOnSelect(ProcPtr proc, struct SelectTarget * target)
{
    ResetTextFont();

    gActionSt.target = target->uid;

    StartEquipInfoWindow(
        StartMenu(&gMenuInfo_RepairItems),
        GetUnit(gActionSt.target),
        16, 11);

    StartFace(0, GetUnitPortraitId(GetUnit(gActionSt.target)), 184, 12, 2);
    SetFaceBlinkControlById(0, 5);

    return 0x17;
}

void DoUseRepairStaff(struct Unit * unit)
{
    MakeTargetListForHammerne(unit);

    BmMapFill(gBmMapMovement, -1);

    StartSubtitleHelp(
        StartMapSelect(&gSelectInfo_Repair),
        DecodeMsg(0x72E));

    PlaySoundEffect(0x38A);
}

u8 RepairSelectOnChange(ProcPtr proc, struct SelectTarget * target)
{
    ChangeActiveUnitFacing(target->x, target->y);
    RefreshHammerneUnitInfoWindow(GetUnit(target->uid));
}

void RepairSelectOnInit(ProcPtr proc)
{
    StartUnitInventoryInfoWindow(proc);
}

int RepairMenuItemOnChange(ProcPtr menu, struct ItemUseMenuItemProc * item)
{
    UpdateMenuItemPanel(item->itemNumber);
}

int RepairMenuItemOnChangeOut(ProcPtr menu, struct ItemUseMenuItemProc * item)
{
}

u8 RepairMenuItemIsAvailable(void const * def, int number)
{
    int item = GetUnit(gActionSt.target)->items[number];

    if (!item)
        return 3;

    if (!IsItemRepairable(item))
        return 2;

    return 1;
}

int RepairMenuItemDraw(ProcPtr menu, struct ItemUseMenuItemProc * menuItem)
{
    int item = GetUnit(gActionSt.target)->items[menuItem->itemNumber];
    int isRepairable = IsItemRepairable(item);

    DrawItemMenuLineLong(
        &menuItem->text, item, isRepairable,
        gBg0Tm + (menuItem->yTile * 0x20 + menuItem->xTile));

    EnableBgSync(BG0_SYNC_BIT);

    return 0;
}

u8 RepairMenuItemSelect(ProcPtr menu, struct ItemUseMenuItemProc * menuItem)
{
    if (menuItem->availability == 2)
    {
        int msgId = 0;

        int item = GetUnit(gActionSt.target)->items[menuItem->itemNumber];

        if (GetItemAttributes(item) & (IA_UNBREAKABLE | IA_HAMMERNE | IA_LOCK_3))
            msgId = 0x74C;
        else if (!(GetItemAttributes(item) & (IA_STAFF | IA_WEAPON)))
            msgId = 0x741;
        else if (GetItemUses(item) == GetItemMaxUses(item))
            msgId = 0x740;

        if (msgId != 0)
            MenuFrozenHelpBox(menu, msgId);

        return 8;
    }

    gActionSt.extra = menuItem->itemNumber;
    SetStaffUseAction(gActiveUnit);

    return 0x37;
}

void DoUseHealStaff(struct Unit * unit, void (*func)(struct Unit *))
{
    func(unit);

    BmMapFill(gBmMapMovement, -1);

    StartSubtitleHelp(
        StartMapSelect(&gSelectInfo_Heal),
        DecodeMsg(0x72A));
}

void DoUseRestoreStaff(struct Unit * unit, void (*func)(struct Unit *))
{
    func(unit);

    BmMapFill(gBmMapMovement, -1);

    StartSubtitleHelp(
        StartMapSelect(&gSelectInfo_Restore),
        DecodeMsg(0x72D));
}

int RestoreMapSelect_Init(ProcPtr proc)
{
    StartUnitHpStatusInfoWindow(proc);
}

u8 RestoreMapSelect_SwitchIn(ProcPtr proc, struct SelectTarget * target)
{
    ChangeActiveUnitFacing(target->x, target->y);
    RefreshUnitHpStatusInfoWindow(GetUnit(target->uid));
}

void DoUseBarrierStaff(struct Unit * unit)
{
    MakeTargetListForBarrier(unit);

    BmMapFill(gBmMapMovement, -1);

    StartSubtitleHelp(
        StartMapSelect(&gSelectInfo_Barrier),
        DecodeMsg(0x72F));
}

int BarrierMapSelect_Init(ProcPtr proc)
{
    StartUnitResChangeInfoWindow(proc);
}

u8 BarrierMapSelect_SwitchIn(ProcPtr proc, struct SelectTarget * target)
{
    ChangeActiveUnitFacing(target->x, target->y);
    RefreshUnitResChangeInfoWindow(GetUnit(target->uid));
}

void DoUseAttackStaff(struct Unit * unit, void (*func)(struct Unit *))
{
    func(unit);

    BmMapFill(gBmMapMovement, -1);

    StartSubtitleHelp(
        StartMapSelect(&gSelectInfo_OffensiveStaff),
        DecodeMsg(0x731));
}

int AttackStaffMapSelect_Init(ProcPtr proc)
{
    StartUnitStaffOffenseInfoWindow(proc);
}

u8 AttackStaffMapSelect_SwitchIn(ProcPtr proc, struct SelectTarget * target)
{
    ChangeActiveUnitFacing(target->x, target->y);

    RefreshUnitStaffOffenseInfoWindow(
        GetUnit(target->uid),
        GetOffensiveStaffAccuracy(gActiveUnit, GetUnit(target->uid)));
}

void SubtitleMapSelect_End(ProcPtr proc)
{
    EndSubtitleHelp();
    ClearUi();
}

int sub_08027E68(struct Unit * unit)
{
    if ((UNIT_CATTRIBUTES(unit) & CA_ASSASSIN) && GetTrapAt(unit->xPos, unit->yPos) == NULL)
        return TRUE;

    return FALSE;
}

void sub_08027E9C(void)
{
    StartSubtitleHelp(
        NewTargetSelection_Specialized(&gSelectInfo_WarpUnit, StaffSelectOnSelect),
        DecodeMsg(0x72C));
}

void TorchSelect_OnInit(struct WarpSelectProc * proc)
{
    gBmSt.flags |= BM_FLAG_0;

    StartSubtitleHelp(proc, DecodeMsg(0x735));

    if (IsCameraNotWatchingPosition(gActiveUnit->xPos, gActiveUnit->yPos))
        EnsureCameraOntoPosition(proc, gActiveUnit->xPos, gActiveUnit->yPos);
}

void TorchSelect_OnIdle(struct WarpSelectProc * proc)
{
    int xTorch = gBmSt.cursor.x;
    int yTorch = gBmSt.cursor.y;

    s8 canTorch = gMapRangeSigned[yTorch][xTorch];

    HandlePlayerMapCursor();

    if (gpKeySt->pressed & A_BUTTON)
    {
        if (canTorch)
        {
            PlaySoundEffect(0x38A);

            Proc_Break(proc);

            gActionSt.x_target = gBmSt.cursor.x;
            gActionSt.y_target = gBmSt.cursor.y;

            SetStaffUseAction(gActiveUnit);

            return;
        }
        else
        {
            PlaySoundEffect(0x38C);
        }
    }

    if (gpKeySt->pressed & B_BUTTON)
    {
        TmFill(gBg2Tm, 0);
        EnableBgSync(BG2_SYNC_BIT);

        Proc_Goto(proc, 99);

        PlaySoundEffect(0x38B);
    }

    PutMapCursor(gBmSt.cursor_sprite.x, gBmSt.cursor_sprite.y, TRUE);
}

void DoUseTorchStaff(struct Unit * unit)
{
    Proc_Start(gProcScr_SquareSelectTorch, PROC_TREE_3);
    PlaySoundEffect(0x38A);
}

s8 CanUnitUseItemPrepScreen(struct Unit * unit, int item)
{
    if (GetItemAttributes(item) & IA_STAFF)
        return FALSE;

    switch (GetItemIndex(item))
    {
    case ITEM_BOOSTER_HP:
    case ITEM_BOOSTER_POW:
    case ITEM_BOOSTER_SKL:
    case ITEM_BOOSTER_SPD:
    case ITEM_BOOSTER_LCK:
    case ITEM_BOOSTER_DEF:
    case ITEM_BOOSTER_RES:
    case ITEM_BOOSTER_MOV:
    case ITEM_BOOSTER_CON:
        return CanUnitUseStatGainItem(unit, item);

    case ITEM_HEROCREST:
    case ITEM_KNIGHTCREST:
    case ITEM_ORIONSBOLT:
    case ITEM_ELYSIANWHIP:
    case ITEM_GUIDINGRING:
    case ITEM_EARTH_SEAL:
    case ITEM_HEAVEN_SEAL:
    case ITEM_FELL_CONTRACT:
    case ITEM_OCEANSEAL:
        return CanUnitUsePromotionItem(unit, item);

    case ITEM_AFAS_DROPS:
        if (unit->state & US_GROWTH_BOOST)
            return FALSE;

        return TRUE;

    default:
        return FALSE;
    }
}

bool sub_08028194(struct Unit * unit)
{
    int i, count = GetUnitItemCount(unit);

    for (i = 0; i < count; ++i)
    {
        if (GetItemIndex(unit->items[i]) == ITEM_EMBLEM_SEAL)
            return TRUE;
    }

    return FALSE;
}

SECTION(".rodata.08B94194")
const struct ProcCmd gProcScr_SquareSelectWarp[] = {
    PROC_SET_END_CB(WarpSelect_OnEnd),
    PROC_CALL(LockGame),
    PROC_WHILE_EXISTS(ProcScr_CamMove),
    PROC_CALL(WarpSelect_OnInit),
    PROC_WHILE_EXISTS(ProcScr_CamMove),
    PROC_REPEAT(WarpSelect_OnIdle),
    PROC_CALL(WarpSelect_OnConfirm),
    PROC_SLEEP(0),
    PROC_CALL(UnlockGame),
    PROC_GOTO(100),
    PROC_LABEL(99),
    PROC_CALL(WarpSelect_OnCancel),
    PROC_SLEEP(0),
    PROC_CALL(UnlockGame),
    PROC_LABEL(100),
    PROC_END,
};

SECTION(".rodata.08B94214")
const struct ProcCmd gProcScr_SquareSelectTorch[] = {
    PROC_CALL(LockGame),
    PROC_CALL(TorchSelect_OnInit),
    PROC_WHILE_EXISTS(ProcScr_CamMove),
    PROC_REPEAT(TorchSelect_OnIdle),
    PROC_CALL(WarpSelect_OnConfirm),
    PROC_GOTO(100),
    PROC_LABEL(99),
    PROC_CALL(WarpSelect_OnCancel),
    PROC_LABEL(100),
    PROC_CALL(UnlockGame),
    PROC_END,
};

extern const struct MenuItemDef gItemUseMenuItems[];

SECTION(".rodata.08B94A14")
const struct MenuItemDef gItemUseMenuItems[] = {
    {
        .name = gUnk_081C3D94,
        .overrideId = 0x19,
        .isAvailable = (void *) RepairMenuItemIsAvailable,
        .onDraw = (void *) RepairMenuItemDraw,
        .onSelected = (void *) RepairMenuItemSelect,
        .onSwitchIn = (void *) RepairMenuItemOnChange,
        .onSwitchOut = (void *) RepairMenuItemOnChangeOut,
    },
    {
        .name = gUnk_081C3D94,
        .overrideId = 0x1A,
        .isAvailable = (void *) RepairMenuItemIsAvailable,
        .onDraw = (void *) RepairMenuItemDraw,
        .onSelected = (void *) RepairMenuItemSelect,
        .onSwitchIn = (void *) RepairMenuItemOnChange,
        .onSwitchOut = (void *) RepairMenuItemOnChangeOut,
    },
    {
        .name = gUnk_081C3D94,
        .overrideId = 0x1B,
        .isAvailable = (void *) RepairMenuItemIsAvailable,
        .onDraw = (void *) RepairMenuItemDraw,
        .onSelected = (void *) RepairMenuItemSelect,
        .onSwitchIn = (void *) RepairMenuItemOnChange,
        .onSwitchOut = (void *) RepairMenuItemOnChangeOut,
    },
    {
        .name = gUnk_081C3D94,
        .overrideId = 0x1C,
        .isAvailable = (void *) RepairMenuItemIsAvailable,
        .onDraw = (void *) RepairMenuItemDraw,
        .onSelected = (void *) RepairMenuItemSelect,
        .onSwitchIn = (void *) RepairMenuItemOnChange,
        .onSwitchOut = (void *) RepairMenuItemOnChangeOut,
    },
    {
        .name = gUnk_081C3D94,
        .overrideId = 0x1D,
        .isAvailable = (void *) RepairMenuItemIsAvailable,
        .onDraw = (void *) RepairMenuItemDraw,
        .onSelected = (void *) RepairMenuItemSelect,
        .onSwitchIn = (void *) RepairMenuItemOnChange,
        .onSwitchOut = (void *) RepairMenuItemOnChangeOut,
    },
    { 0 },
};

SECTION(".rodata.08B958FC")
const struct MenuDef gMenuInfo_RepairItems = {
    .rect = { .y = 1, .w = 0x10 },
    .menuItems = gItemUseMenuItems,
    .onBPress = ItemMenu_ButtonBPressed,
    .onRPress = MenuAutoHelpBoxSelect,
    .onHelpBox = ItemMenu_HelpBox,
};

SECTION(".rodata.08B95B18")
const struct SelectInfo gSelectInfo_OffensiveStaff = {
    .onInit = (void *) AttackStaffMapSelect_Init,
    .onEnd = (void *) ClearUi,
    .onSwitchIn = AttackStaffMapSelect_SwitchIn,
    .onSelect = StaffSelectOnSelect,
    .onCancel = GenericSelection_BackToUM_CamWait,
};

SECTION(".rodata.08B95B38")
const struct SelectInfo gSelectInfo_Barrier = {
    .onInit = (void *) BarrierMapSelect_Init,
    .onEnd = (void *) ClearUi,
    .onSwitchIn = BarrierMapSelect_SwitchIn,
    .onSelect = StaffSelectOnSelect,
    .onCancel = GenericSelection_BackToUM,
};

SECTION(".rodata.08B95B58")
const struct SelectInfo gSelectInfo_Restore = {
    .onInit = (void *) RestoreMapSelect_Init,
    .onEnd = (void *) ClearUi,
    .onSwitchIn = RestoreMapSelect_SwitchIn,
    .onSelect = StaffSelectOnSelect,
    .onCancel = GenericSelection_BackToUM,
};

SECTION(".rodata.08B95B78")
const struct SelectInfo gSelectInfo_Heal = {
    .onInit = HealMapSelect_Init,
    .onEnd = (void *) ClearUi,
    .onSwitchIn = HealMapSelect_SwitchIn,
    .onSelect = StaffSelectOnSelect,
    .onCancel = GenericSelection_BackToUM_CamWait,
};

SECTION(".rodata.08B95BB8")
const struct SelectInfo gSelectInfo_PutTrap = { .onEnd = SubtitleMapSelect_End, .onCancel = GenericSelection_BackToUM };

SECTION(".rodata.08B95BD8")
const struct SelectInfo gSelectInfo_WarpUnit = {
    .onInit = WarpUnitMapSelect_Init,
    .onEnd = SubtitleMapSelect_End,
    .onSwitchIn = WarpUnitMapSelect_SwitchIn,
    .onCancel = GenericSelection_BackToUM_CamWait,
};

SECTION(".rodata.08B95C58")
const struct SelectInfo gSelectInfo_Repair = {
    .onInit = RepairSelectOnInit,
    .onSwitchIn = RepairSelectOnChange,
    .onSelect = RepairSelectOnSelect,
    .onCancel = GenericSelection_BackToUM,
};
