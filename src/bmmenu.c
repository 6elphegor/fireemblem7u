#include "gbafe.h"
#include "gbafe/bmmenu.h"

extern struct ProcCmd CONST_DATA ProcScr_Config_Field[];
extern u16 CONST_DATA EventScr_08B93DA4[];
extern const struct SelectInfo gSelectInfo_Rescue;
extern const struct SelectInfo gSelectInfo_Drop;
extern const struct SelectInfo gSelectInfo_Take;
extern const struct SelectInfo gSelectInfo_Give;
extern const struct MenuDef gBallistaRangeMenuDef;
extern const struct MenuDef gWeaponSelectMenuDef;
extern const struct MenuDef gItemMenuDef;
extern const struct SelectInfo gSelectInfo_Attack;
extern const struct SelectInfo gSelectInfo_Trade;
extern struct ProcCmd CONST_DATA gProcScr_BKSEL[];
extern struct ProcCmd CONST_DATA gProcScr_0859B630[];

u8 StartFightBallistaReview(struct MenuProc * menu, struct MenuItemProc * menuItem);
u8 StartFightItemReview(struct MenuProc * menu, struct MenuItemProc * menuItem);
u8 ItemMenu_Select1stCommand(struct MenuProc * menu, struct MenuItemProc * menuItem);
//--HEAD-END--

u8 MapMenu_UnitCommand(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    Proc_Goto(Proc_Find(ProcScr_PlayerPhase), 10);
    StartUnitListScreenField();

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 MapMenu_OptionsCommand(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    Proc_Start(ProcScr_Config_Field, PROC_TREE_3);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 MapMenu_StatusCommand(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    NewChapterStatusScreen(NULL);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 MapMenu_DangerZone_UnusedEffect(void)
{
    gActiveUnit = NULL;
    gBmSt.swap_action_range_count = 0;
    Proc_Goto(Proc_Find(ProcScr_PlayerPhase), 0xC);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 sub_08021600(void)
{
    sub_080A4E0C(PROC_TREE_3);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 sub_08021610(void)
{
    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

void sub_08021614(ProcPtr proc)
{
    if (GetTalkChoiceResult() != 1)
        EventGotoLabel(proc, 0x63);
}

u8 sub_08021630(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    StartEvent(EventScr_08B93DA4);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 EffectWait(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    gActionSt.id = ACTION_WAIT;

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 GenericSelection_BackToUM(ProcPtr proc, struct SelectTarget * target)
{
    EndTargetSelection(proc);

    TmFill(gBg2Tm, 0);
    EnableBgSync(BG2_SYNC_BIT);

    ResetTextFont();

    HideMoveRangeGraphics();

    EnsureCameraOntoPosition(
        StartSemiCenteredOrphanMenu(&gUnitActionMenuDef, gBmSt.cursor_sprite_target.x - gBmSt.camera.x, 1, 22),
        gActiveUnit->xPos,
        gActiveUnit->yPos
    );

    return MENU_ACT_SKIPCURSOR | MENU_ACT_SND6B | MENU_ACT_CLEAR;
}

void BackToUnitMenu_CamWatch(ProcPtr proc)
{
    if (IsCameraNotWatchingPosition(gActiveUnit->xPos, gActiveUnit->yPos))
    {
        int y = gActiveUnit->yPos;

        Proc_EndEach(ProcScr_CamMove);

        if (GetCameraAdjustedY(y << 4) > gBmSt.camera_max.y)
            y = (gBmSt.camera_max.y >> 4) + 2;

        EnsureCameraOntoPosition(proc, gActiveUnit->xPos, y);
    }
}

void BackToUnitMenu_RestartMenu(void)
{
    StartSemiCenteredOrphanMenu(&gUnitActionMenuDef, gBmSt.cursor_sprite_target.x - gBmSt.camera.x, 1, 22);
}

u8 GenericSelection_BackToUM_CamWait(ProcPtr proc, struct SelectTarget * target)
{
    EndTargetSelection(proc);

    TmFill(gBg2Tm, 0);
    EnableBgSync(BG2_SYNC_BIT);

    HideMoveRangeGraphics();

    ResetTextFont();

    Proc_Start(gProcScr_BackToUnitMenu, PROC_TREE_3);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_SND6B | MENU_ACT_CLEAR;
}

u8 ItemMenu_ButtonBPressed(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    TmFill(gBg2Tm, 0);
    EnableBgSync(BG2_SYNC_BIT);

    ResetTextFont();

    StartSemiCenteredOrphanMenu(&gUnitActionMenuDef, gBmSt.cursor_sprite_target.x - gBmSt.camera.x, 1, 22);

    HideMoveRangeGraphics();

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6B | MENU_ACT_CLEAR | MENU_ACT_ENDFACE;
}

u8 RescueSelection_OnHelp(ProcPtr proc, struct SelectTarget * target)
{
    return 0;
}

u8 RescueUsability(const struct MenuItemDef * def, int number)
{
    if (gActiveUnit->state & US_HAS_MOVED)
        return MENU_NOTSHOWN;

    if (gActiveUnit->state & (US_IN_BALLISTA | US_RESCUING))
        return MENU_NOTSHOWN;

    MakeRescueTargetList(gActiveUnit);

    if (CountTargets() == 0)
        return MENU_NOTSHOWN;

    return MENU_ENABLED;
}

u8 RescueEffect(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    MakeRescueTargetList(gActiveUnit);
    StartMapSelect(&gSelectInfo_Rescue);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A;
}

u8 RescueSelection_OnSelect(ProcPtr proc, struct SelectTarget * target)
{
    gActionSt.target = target->uid;
    gActionSt.id = ACTION_RESCUE;

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 DropUsability(const struct MenuItemDef * def, int number)
{
    if (gActiveUnit->state & US_HAS_MOVED)
        return MENU_NOTSHOWN;

    if (!(gActiveUnit->state & US_RESCUING))
        return MENU_NOTSHOWN;

    MakeDropTargetList(gActiveUnit);

    if (CountTargets() == 0)
        return MENU_NOTSHOWN;

    return MENU_ENABLED;
}

u8 DropEffect(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    MakeDropTargetList(gActiveUnit);
    StartMapSelect(&gSelectInfo_Drop);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 DropSelection_OnSelect(ProcPtr proc, struct SelectTarget * target)
{
    gActionSt.id = ACTION_DROP;
    gActionSt.target = gActiveUnit->rescue;
    gActionSt.x_target = target->x;
    gActionSt.y_target = target->y;

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 TakeUsability(const struct MenuItemDef * def, int number)
{
    if (gActiveUnit->state & US_HAS_MOVED)
        return MENU_NOTSHOWN;

    if (gBmSt.partial_actions_taken & 1)
        return MENU_NOTSHOWN;

    if (gActiveUnit->state & US_RESCUING)
        return MENU_NOTSHOWN;

    sub_08023F64(gActiveUnit);

    if (CountTargets() == 0)
        return MENU_NOTSHOWN;

    return MENU_ENABLED;
}

u8 TakeEffect(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    sub_08023F64(gActiveUnit);
    StartMapSelect(&gSelectInfo_Take);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A;
}

u8 GiveUsability(const struct MenuItemDef * def, int number)
{
    if (gActiveUnit->state & US_HAS_MOVED)
        return MENU_NOTSHOWN;

    if (gBmSt.partial_actions_taken & 1)
        return MENU_NOTSHOWN;

    if (!(gActiveUnit->state & US_RESCUING))
        return MENU_NOTSHOWN;

    sub_08024018(gActiveUnit);

    if (CountTargets() == 0)
        return MENU_NOTSHOWN;

    return MENU_ENABLED;
}

u8 GiveEffect(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    sub_08024018(gActiveUnit);
    StartMapSelect(&gSelectInfo_Give);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A;
}

void MakeUnitRescueTransferGraphics(struct Unit * from, struct Unit * to)
{
    struct Unit * rescue = GetUnit(from->rescue);

    EndSubtitleHelp();

    Make6CKOIDOAMM(rescue, GetSomeFacingDirection(to->xPos, to->yPos, from->xPos, from->yPos));
}

u8 TakeSelection_OnSelect(ProcPtr proc, struct SelectTarget * target)
{
    gActionSt.id = ACTION_TAKE;
    gActionSt.target = target->uid;

    UnitSyncMovement(GetUnit(gActionSt.target));

    MakeUnitRescueTransferGraphics(GetUnit(gActionSt.target), GetUnit(gActionSt.instigator));

    UnitGive(GetUnit(gActionSt.target), GetUnit(gActionSt.instigator));

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 GiveSelection_OnSelect(ProcPtr proc, struct SelectTarget * target)
{
    gActionSt.id = ACTION_GIVE;
    gActionSt.target = target->uid;

    UnitSyncMovement(GetUnit(gActionSt.instigator));

    MakeUnitRescueTransferGraphics(GetUnit(gActionSt.instigator), GetUnit(gActionSt.target));

    UnitGive(GetUnit(gActionSt.instigator), GetUnit(gActionSt.target));

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 UnitAttackCommandEffect(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    if (menuItem->availability == MENU_DISABLED)
    {
        MenuFrozenHelpBox(menu, 0x742);
        return MENU_ACT_SND6B;
    }

    ClearIcons();
    ApplyIconPalettes(4);

    if (gActiveUnit->state & US_IN_BALLISTA)
        return StartFightBallistaReview(menu, menuItem);

    return StartFightItemReview(menu, menuItem);
}

u8 StartFightBallistaReview(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    ProcPtr proc = StartMenu(&gBallistaRangeMenuDef);

    StartFace(0, GetUnitPortraitId(gActiveUnit), 0xB0, 0xC, 2);
    SetFaceBlinkControlById(0, 5);

    StartEquipInfoWindow(proc, gActiveUnit, 0xF, 0xB);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 StartFightItemReview(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    ProcPtr proc = StartMenu(&gWeaponSelectMenuDef);

    StartFace(0, GetUnitPortraitId(gActiveUnit), 0xB0, 0xC, 2);
    SetFaceBlinkControlById(0, 5);

    StartEquipInfoWindow(proc, gActiveUnit, 0xF, 0xB);

    sub_080790B8();

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

int DisplayUnitStandingAttackRange(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    BmMapFillg(gBmMapMovement, -1);
    BmMapFillg(gBmMapRange, 0);

    if (gActiveUnit->state & US_IN_BALLISTA)
    {
        MapAddInBoundedRange(gActiveUnit->xPos, gActiveUnit->yPos, 1, 10);
    }
    else
    {
        int reach = GetUnitWeaponReach(gActiveUnit, -1);
        BuildUnitStandingRangeForReach(gActiveUnit, reach);
    }

    DisplayMoveRangeGraphics(3);

    return 0;
}

int HideMoveRangeGraphicsWrapper(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    HideMoveRangeGraphics();
    return 0;
}

u8 WeaponSelectMenu_IsAvailable(const struct MenuItemDef * def, int number)
{
    int item = gActiveUnit->items[number];

    if (!(GetItemAttributes(item) & IA_WEAPON))
        return MENU_NOTSHOWN;

    if (!CanUnitUseWeapon(gActiveUnit, item))
        return MENU_NOTSHOWN;

    ListAttackTargetsForWeapon(gActiveUnit, item);

    if (CountTargets() == 0)
        return MENU_NOTSHOWN;

    return MENU_ENABLED;
}

u8 WeaponSelectMenu_Selected(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    EquipUnitItemSlot(gActiveUnit, menuItem->itemNumber);
    gActionSt.item_slot = 0;

    ClearUi();

    ListAttackTargetsForWeapon(gActiveUnit, gActiveUnit->items[0]);

    StartMapSelect(&gSelectInfo_Attack);

    sub_080790BC();

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_ENDFACE;
}

int WeaponSelectMenu_Draw(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    int item = gActiveUnit->items[menuItem->itemNumber];

    s8 isUsable = CanUnitUseWeapon(gActiveUnit, item);

    DrawItemMenuLine(
        &menuItem->text,
        item,
        isUsable,
        gBg0Tm + TM_OFFSET(menuItem->xTile, menuItem->yTile)
    );

    return 0;
}

int WeaponSelectMenu_SwitchIn(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    int reach;

    UpdateMenuItemPanel(menuItem->itemNumber);

    BmMapFillg(gBmMapMovement, -1);
    BmMapFillg(gBmMapRange, 0);

    reach = GetUnitWeaponReach(gActiveUnit, menuItem->itemNumber);
    BuildUnitStandingRangeForReach(gActiveUnit, reach);

    DisplayMoveRangeGraphics(2);

    return 0;
}

int BallistaRangeMenu_SwitchOut(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    if (!(menu->state & 4))
        HideMoveRangeGraphics();

    return 0;
}

u8 AttackMapSelect_Select(ProcPtr proc, struct SelectTarget * target)
{
    gActionSt.id = ACTION_COMBAT;
    gActionSt.target = target->uid;

    if (target->uid == 0)
    {
        gActionSt.x_target = target->x;
        gActionSt.y_target = target->y;
        gActionSt.extra = target->extra;
    }

    Proc_EndEach(gProcScr_BKSEL);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

void sub_08021D28(void)
{
    EnsureCameraOntoPosition(NULL, gActiveUnit->xPos, gActiveUnit->yPos);
}

void GoToFightItemReview(void)
{
    UnitAttackCommandEffect(NULL, NULL);
}

u8 AttackMapSelect_Cancel(ProcPtr proc, struct SelectTarget * target)
{
    Proc_Start(gProcScr_0859B630, PROC_TREE_3);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6B;
}

u8 AttackMapSelect_SwitchIn(ProcPtr proc, struct SelectTarget * target)
{
    struct Unit * unit = GetUnit(target->uid);

    ChangeActiveUnitFacing(target->x, target->y);

    if (target->uid == 0)
    {
        gActionSt.x_target = target->x;
        gActionSt.y_target = target->y;
        gActionSt.extra = target->extra;

        InitObstacleBattleUnit();
    }

    if (gActionSt.item_slot == ITEMSLOT_BALLISTA)
        BattleGenerateBallistaSimulation(gActiveUnit, unit, gActiveUnit->xPos, gActiveUnit->yPos);
    else
        BattleGenerateSimulation(gActiveUnit, unit, -1, -1, gActionSt.item_slot);

    UpdateBattleForecastContents();

    return 0;
}

int AttackMapSelect_End(ProcPtr proc)
{
    TmFill(gBg2Tm, 0);
    EnableBgSync(BG2_SYNC_BIT);

    HideMoveRangeGraphics();
    CloseBattleForecast();

    return 0;
}

u8 ItemSubMenu_IsTradeAvailable(const struct MenuItemDef * def, int number)
{
    if (gActiveUnit->state & US_HAS_MOVED)
        return MENU_NOTSHOWN;

    if (gBmSt.partial_actions_taken & 2)
        return MENU_NOTSHOWN;

    if (UNIT_CATTRIBUTES(gActiveUnit) & CA_SUPPLY)
        return MENU_NOTSHOWN;

    MakeTradeTargetList(gActiveUnit);

    if (CountTargets() == 0)
        return MENU_NOTSHOWN;

    return MENU_ENABLED;
}

u8 TradeCommandEffect(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    ClearUi();

    MakeTradeTargetList(gActiveUnit);
    StartMapSelect(&gSelectInfo_Trade);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A;
}

u8 TradeSelection_OnSelect(ProcPtr proc, struct SelectTarget * target)
{
    gActionSt.id = ACTION_TRADED_NOCHANGES;

    sub_0802B678(gActiveUnit, GetUnit(target->uid), 0);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 UnitActionMenu_Seize_Available(const struct MenuItemDef * def, int number)
{
    if (gActiveUnit->state & US_HAS_MOVED)
        return MENU_NOTSHOWN;

    if (!sub_08034884(gActiveUnit))
        return MENU_NOTSHOWN;

    return GetAvailableTileEventCommand(gActiveUnit->xPos, gActiveUnit->yPos) == 0xF
        ? MENU_ENABLED : MENU_NOTSHOWN;
}

u8 UnitActionMenu_Seize(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    gActionSt.id = ACTION_SEIZE;
    gActiveUnit->state |= US_HAS_MOVED;

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 VisitCommandUsability(const struct MenuItemDef * def, int number)
{
    int terrain;

    if (gActiveUnit->state & US_HAS_MOVED)
        return MENU_NOTSHOWN;

    terrain = gBmMapTerrain[gActiveUnit->yPos][gActiveUnit->xPos];

    if (!(terrain == TERRAIN_VILLAGE || terrain == TERRAIN_HOUSE || terrain == 0x38 || terrain == 0x37))
        return MENU_NOTSHOWN;

    if (GetAvailableTileEventCommand(gActiveUnit->xPos, gActiveUnit->yPos) != 0xE)
        return MENU_NOTSHOWN;

    if (IsUnitMagicSealed(gActiveUnit))
        return MENU_DISABLED;

    return MENU_ENABLED;
}

u8 VisitCommandEffect(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    if (menuItem->availability == MENU_DISABLED)
    {
        MenuFrozenHelpBox(menu, 0x736);
        return MENU_ACT_SND6B;
    }

    gActionSt.id = ACTION_VISIT;

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 sub_08021FB4(const struct MenuItemDef * def)
{
    int i;

    if (gActiveUnit->state & US_HAS_MOVED)
        return MENU_NOTSHOWN;

    MakeTargetListForRefresh(gActiveUnit);

    if (CountTargets() != 0)
        return MENU_ENABLED;

    for (i = 0; i < UNIT_ITEM_COUNT; i++)
    {
        int item = gActiveUnit->items[i];

        if (item == 0)
            break;

        if (GetItemType(item) != ITYPE_12)
            continue;

        if (!CanUnitUseItem(gActiveUnit, item))
            continue;

        return MENU_ENABLED;
    }

    return MENU_NOTSHOWN;
}

u8 PlayCommandUsability(const struct MenuItemDef * def, int number)
{
    if (!(UNIT_CATTRIBUTES(gActiveUnit) & CA_PLAY))
        return MENU_NOTSHOWN;

    gBmSt.inventory_item_overflow = ITEM_PLAY;

    return sub_08021FB4(def);
}

u8 DanceCommandUsability(const struct MenuItemDef * def, int number)
{
    if (!(UNIT_CATTRIBUTES(gActiveUnit) & CA_DANCE))
        return MENU_NOTSHOWN;

    gBmSt.inventory_item_overflow = ITEM_DANCE;

    return sub_08021FB4(def);
}

u8 PlayCommandEffect(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    s8 hasTargets;
    int i;

    s8 itemUsable = 0;

    MakeTargetListForRefresh(gActiveUnit);

    hasTargets = 0;
    if (CountTargets() != 0)
        hasTargets = 1;

    for (i = 0; i < UNIT_ITEM_COUNT; i++)
    {
        int item = gActiveUnit->items[i];

        if (item == 0)
            break;

        if (GetItemType(item) != ITYPE_12)
            continue;

        if (!CanUnitUseItem(gActiveUnit, item))
            continue;

        itemUsable = 1;
    }

    if (hasTargets && !itemUsable)
    {
        return ItemMenu_Select1stCommand(menu, menuItem);
    }
    else
    {
        ProcPtr proc = StartMenu(&gItemMenuDef);

        StartFace(0, GetUnitPortraitId(gActiveUnit), 0xB0, 0xC, 2);
        SetFaceBlinkControlById(0, 5);
        StartEquipInfoWindow(proc, gActiveUnit, 0xF, 0xB);

        ClearIcons();
        ApplyIconPalettes(4);

        return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
    }
}

u8 RefreshMapSelect_Select(ProcPtr proc, struct SelectTarget * target)
{
    gActionSt.id = ACTION_REFRESH;
    gActionSt.target = target->uid;

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

ASM_FUNC("asm/nonmatching/code_0802217C.s");
ASM_FUNC("asm/nonmatching/code_0802219C.s");
ASM_FUNC("asm/nonmatching/code_08022204.s");
ASM_FUNC("asm/nonmatching/code_0802228C.s");
ASM_FUNC("asm/nonmatching/code_080222DC.s");
ASM_FUNC("asm/nonmatching/code_0802234C.s");
ASM_FUNC("asm/nonmatching/code_0802235C.s");
ASM_FUNC("asm/nonmatching/code_08022360.s");
ASM_FUNC("asm/nonmatching/code_080223A4.s");
ASM_FUNC("asm/nonmatching/code_080223B0.s");
ASM_FUNC("asm/nonmatching/code_080223EC.s");
ASM_FUNC("asm/nonmatching/code_08022404.s");
ASM_FUNC("asm/nonmatching/code_0802245C.s");
ASM_FUNC("asm/nonmatching/code_08022530.s");
ASM_FUNC("asm/nonmatching/code_080225A8.s");
ASM_FUNC("asm/nonmatching/code_080225F0.s");
ASM_FUNC("asm/nonmatching/code_08022624.s");
ASM_FUNC("asm/nonmatching/code_080226B0.s");
ASM_FUNC("asm/nonmatching/code_080226F0.s");
ASM_FUNC("asm/nonmatching/code_08022724.s");
ASM_FUNC("asm/nonmatching/code_08022798.s");
ASM_FUNC("asm/nonmatching/code_080227D0.s");
ASM_FUNC("asm/nonmatching/code_08022808.s");
ASM_FUNC("asm/nonmatching/code_08022858.s");
ASM_FUNC("asm/nonmatching/code_08022884.s");
ASM_FUNC("asm/nonmatching/code_0802290C.s");
ASM_FUNC("asm/nonmatching/code_08022984.s");
ASM_FUNC("asm/nonmatching/code_080229F0.s");
ASM_FUNC("asm/nonmatching/code_08022A38.s");
ASM_FUNC("asm/nonmatching/code_08022A44.s");
ASM_FUNC("asm/nonmatching/code_08022A7C.s");
ASM_FUNC("asm/nonmatching/code_08022ABC.s");
ASM_FUNC("asm/nonmatching/code_08022AC8.s");
ASM_FUNC("asm/nonmatching/code_08022B1C.s");
ASM_FUNC("asm/nonmatching/code_08022B34.s");
ASM_FUNC("asm/nonmatching/code_08022B78.s");
ASM_FUNC("asm/nonmatching/code_08022BAC.s");
ASM_FUNC("asm/nonmatching/code_08022BC0.s");
ASM_FUNC("asm/nonmatching/code_08022C10.s");
ASM_FUNC("asm/nonmatching/code_08022C44.s");
ASM_FUNC("asm/nonmatching/code_08022C58.s");
ASM_FUNC("asm/nonmatching/code_08022C98.s");
ASM_FUNC("asm/nonmatching/code_08022CC0.s");
ASM_FUNC("asm/nonmatching/code_08022CFC.s");
ASM_FUNC("asm/nonmatching/code_08022D20.s");
ASM_FUNC("asm/nonmatching/code_08022DB4.s");
ASM_FUNC("asm/nonmatching/code_08022DD4.s");
ASM_FUNC("asm/nonmatching/code_08022E08.s");
ASM_FUNC("asm/nonmatching/code_08022E28.s");
ASM_FUNC("asm/nonmatching/code_08022E5C.s");
ASM_FUNC("asm/nonmatching/code_08022E7C.s");
ASM_FUNC("asm/nonmatching/code_08022EB0.s");
ASM_FUNC("asm/nonmatching/code_08022ED0.s");
ASM_FUNC("asm/nonmatching/code_08022F20.s");
ASM_FUNC("asm/nonmatching/code_08022F68.s");
ASM_FUNC("asm/nonmatching/code_08022F6C.s");
ASM_FUNC("asm/nonmatching/code_08022F78.s");
ASM_FUNC("asm/nonmatching/code_08022FC8.s");
ASM_FUNC("asm/nonmatching/code_08023000.s");
ASM_FUNC("asm/nonmatching/code_08023020.s");
ASM_FUNC("asm/nonmatching/code_08023044.s");
ASM_FUNC("asm/nonmatching/code_080230E8.s");
ASM_FUNC("asm/nonmatching/code_0802312C.s");
ASM_FUNC("asm/nonmatching/code_08023180.s");
ASM_FUNC("asm/nonmatching/code_080231B8.s");
ASM_FUNC("asm/nonmatching/code_08023210.s");
ASM_FUNC("asm/nonmatching/code_08023248.s");
ASM_FUNC("asm/nonmatching/code_0802327C.s");
ASM_FUNC("asm/nonmatching/code_08023288.s");
ASM_FUNC("asm/nonmatching/code_080232AC.s");
ASM_FUNC("asm/nonmatching/code_080232CC.s");
ASM_FUNC("asm/nonmatching/code_080232F0.s");
ASM_FUNC("asm/nonmatching/code_0802330C.s");
ASM_FUNC("asm/nonmatching/code_08023310.s");
ASM_FUNC("asm/nonmatching/code_08023330.s");
ASM_FUNC("asm/nonmatching/code_08023354.s");
ASM_FUNC("asm/nonmatching/code_08023374.s");
ASM_FUNC("asm/nonmatching/code_08023398.s");
ASM_FUNC("asm/nonmatching/code_080233B8.s");
ASM_FUNC("asm/nonmatching/code_080233E0.s");
ASM_FUNC("asm/nonmatching/code_08023400.s");
ASM_FUNC("asm/nonmatching/code_08023424.s");
ASM_FUNC("asm/nonmatching/code_08023444.s");
ASM_FUNC("asm/nonmatching/code_08023468.s");
ASM_FUNC("asm/nonmatching/code_08023474.s");
ASM_FUNC("asm/nonmatching/code_08023498.s");
ASM_FUNC("asm/nonmatching/code_080234F4.s");
ASM_FUNC("asm/nonmatching/code_08023520.s");
ASM_FUNC("asm/nonmatching/code_08023550.s");
ASM_FUNC("asm/nonmatching/code_0802357C.s");
ASM_FUNC("asm/nonmatching/code_080235F8.s");
ASM_FUNC("asm/nonmatching/code_08023658.s");
ASM_FUNC("asm/nonmatching/code_0802367C.s");
ASM_FUNC("asm/nonmatching/code_080236C0.s");
ASM_FUNC("asm/nonmatching/code_080236EC.s");
ASM_FUNC("asm/nonmatching/code_08023724.s");
ASM_FUNC("asm/nonmatching/code_0802376C.s");
ASM_FUNC("asm/nonmatching/code_080237A0.s");
ASM_FUNC("asm/nonmatching/code_080237C4.s");
ASM_FUNC("asm/nonmatching/code_080237C8.s");
