#include "gbafe.h"
#include "gbafe/prep_sallycursor.h"
#include "gbafe/bksel.h"

// Data (not yet in C; FE7U addresses in symbols.ld)

extern const struct ProcCmd ProcScr_Config_Field[];
extern const struct ProcCmd gProcScr_BKSEL[];
extern const struct ProcCmd gProcScr_0859B630[];
extern u16 CONST_DATA EventScr_CompleteTraining[];
extern u8 CONST_DATA Tsa_StealMenuFrame[];

extern const struct MenuDef gBallistaRangeMenuDef;
extern const struct MenuDef gWeaponSelectMenuDef;
extern const struct MenuDef gItemMenuDef;
extern const struct MenuDef gItemSelectMenuDef;
extern const struct MenuDef gItemSubMenuDef;
extern const struct MenuDef gYesNoSelectionMenuDef;
extern const struct MenuDef gStaffItemSelectMenuDef;
extern const struct MenuDef gStealItemMenuDef;

extern const struct SelectInfo gSelectInfo_Rescue;
extern const struct SelectInfo gSelectInfo_Drop;
extern const struct SelectInfo gSelectInfo_Take;
extern const struct SelectInfo gSelectInfo_Give;
extern const struct SelectInfo gSelectInfo_Attack;
extern const struct SelectInfo gSelectInfo_Trade;
extern const struct SelectInfo gSelectInfo_Talk;
extern const struct SelectInfo gSelectInfo_Support;
extern const struct SelectInfo gSelectInfo_Steal;
extern const struct SelectInfo gSelectInfo_Dance;

extern struct Font gItemSelectMenuFont;

u8 StartFightBallistaReview(struct MenuProc * menu, struct MenuItemProc * menuItem);
u8 StartFightItemReview(struct MenuProc * menu, struct MenuItemProc * menuItem);
u8 ItemMenu_Select1stCommand(struct MenuProc * menu, struct MenuItemProc * menuItem);
void sub_08022360(int x, int y);
u8 sub_08022404(struct MenuProc * menu);
u8 sub_0802245C(struct MenuProc * menu);
void CallSuspendPromptEvent(void);

u8 sub_08021540(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 MapMenu_Suspend_Available(const struct MenuItemDef * def, int number)
{
    if (gPlaySt.chapterStateBits & PLAY_FLAG_TUTORIAL)
        return MENU_DISABLED;

    return MENU_ENABLED;
}

u8 MapMenu_SuspendCommand(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    if (menuItem->availability == MENU_DISABLED)
    {
        MenuFrozenHelpBox(menu, 0x74D);
        return MENU_ACT_SND6B;
    }

    CallSuspendPromptEvent();

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 CommandEffectEndPlayerPhase(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    Proc_EndEach(ProcScr_PlayerPhase);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

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

u8 CallEvent_CompleteTraining(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    StartEvent(EventScr_CompleteTraining);

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

    MakeTakeTargetList(gActiveUnit);

    if (CountTargets() == 0)
        return MENU_NOTSHOWN;

    return MENU_ENABLED;
}

u8 TakeEffect(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    MakeTakeTargetList(gActiveUnit);
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

    MakeGiveTargetList(gActiveUnit);

    if (CountTargets() == 0)
        return MENU_NOTSHOWN;

    return MENU_ENABLED;
}

u8 GiveEffect(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    MakeGiveTargetList(gActiveUnit);
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
    BmMapFill(gBmMapMovement, -1);
    BmMapFill(gBmMapRange, 0);

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

    BmMapFill(gBmMapMovement, -1);
    BmMapFill(gBmMapRange, 0);

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

    StartTradeMenu(gActiveUnit, GetUnit(target->uid), 0);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 UnitActionMenu_Seize_Available(const struct MenuItemDef * def, int number)
{
    if (gActiveUnit->state & US_HAS_MOVED)
        return MENU_NOTSHOWN;

    if (!CanUnitSeize(gActiveUnit))
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

u8 ItemCommandUsability(const struct MenuItemDef * def, int number)
{
    if (gActiveUnit->state & US_HAS_MOVED)
        return MENU_NOTSHOWN;

    if (gActiveUnit->items[0] == 0)
        return MENU_NOTSHOWN;

    return MENU_ENABLED;
}

u8 ItemCommandEffect(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    ProcPtr proc;

    if (menuItem->availability != MENU_ENABLED)
        return 0;

    ClearIcons();
    ApplyIconPalettes(4);

    ResetTextFont();

    proc = StartMenu(&gItemSelectMenuDef);

    StartFace(0, GetUnitPortraitId(gActiveUnit), 0xB0, 0xC, 2);

    SetFaceBlinkControlById(0, 5);

    StartEquipInfoWindow(proc, gActiveUnit, 0xF, 0xB);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

int ItemSelectMenu_TextDraw(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    s8 isUsable;

    int item = gActiveUnit->items[menuItem->itemNumber];

    if (GetItemAttributes(item) & IA_WEAPON)
    {
        WeaponSelectMenu_Draw(menu, menuItem);
        return 0;
    }

    if (GetItemType(item) == ITYPE_12)
        isUsable = 0;
    else
        isUsable = CanUnitUseItem(gActiveUnit, item);

    DrawItemMenuLine(
        &menuItem->text,
        item,
        isUsable,
        gBg0Tm + TM_OFFSET(menuItem->xTile, menuItem->yTile)
    );

    EnableBgSync(BG0_SYNC_BIT);
}

u8 ItemSelectMenu_Usability(const struct MenuItemDef * def, int number)
{
    int item = gActiveUnit->items[number];

    if (item == 0)
        return MENU_NOTSHOWN;

    if (GetItemAttributes(item) & IA_WEAPON)
        WeaponSelectMenu_IsAvailable(def, number);

    return CanUnitUseItem(gActiveUnit, item)
        ? MENU_ENABLED : MENU_DISABLED;
}

u8 ItemSelectMenu_Effect(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    struct MenuRect rect;

    gActionSt.item_slot = menuItem->itemNumber;

    rect.x = menuItem->xTile + 9;
    rect.y = menuItem->yTile - 1;
    rect.w = 6;
    rect.h = 0;

    sub_08022360(rect.x, rect.y);

    StartLockingMenuExt(&gItemSubMenuDef, rect, menu);

    return MENU_ACT_SND6A;
}

int Menu_SwitchIn(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    UpdateMenuItemPanel(menuItem->itemNumber);
}

int Menu_SwitchOut_DoNothing(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
}

void sub_08022360(int x, int y)
{
    InitTextFont(&gItemSelectMenuFont, (void *) VRAM + 0x4000, 0x200, 0);

    TmCopyRect(gBg0Tm + 0x2B, gUiTmScratchA, 9, 19);
    TmCopyRect(gBg1Tm + 0x2B, gUiTmScratchB, 9, 19);
}

void ItemSubMenuEnd(struct MenuProc * menu)
{
    SetTextFont(NULL);
}

u8 MenuCommand_SelectNo(struct MenuProc * menu)
{
    SetTextFont(NULL);

    TmCopyRect(gUiTmScratchA, gBg0Tm + 0x2B, 9, 19);
    TmCopyRect(gUiTmScratchB, gBg1Tm + 0x2B, 9, 19);

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6B;
}

u8 sub_080223EC(struct MenuProc * menu)
{
    SetTextFont(NULL);
    ResetTextFont();

    EndAllMenus();

    return MENU_ACT_SKIPCURSOR | MENU_ACT_CLEAR | MENU_ACT_ENDFACE;
}

u8 sub_08022404(struct MenuProc * menu)
{
    ProcPtr proc;

    sub_080223EC(menu);
    MenuCommand_SelectNo(menu);

    proc = StartMenu(&gItemSelectMenuDef);

    StartFace(0, GetUnitPortraitId(gActiveUnit), 0xB0, 0xC, 2);

    SetFaceBlinkControlById(0, 5);
    StartEquipInfoWindow(proc, gActiveUnit, 15, 11);

    return MENU_ENABLED;
}

u8 sub_0802245C(struct MenuProc * menu)
{
    ProcPtr proc;

    sub_080223EC(menu);

    if (GetUnitItemCount(gActiveUnit) == 0)
    {
        ClearUi();

        EndFaceById(0);

        StartSemiCenteredOrphanMenu(&gUnitActionMenuDef, gBmSt.cursor_sprite_target.x - gBmSt.camera.x, 1, 0x16);

        return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6B | MENU_ACT_CLEAR;
    }

    TmCopyRect(gUiTmScratchA, gBg0Tm + 0x2B, 9, 0x13);
    TmCopyRect(gUiTmScratchB, gBg1Tm + 0x2B, 9, 0x13);

    TmFillRect(gBg0Tm + 0x2B - 0xA, 0xE, 0xC, 0);
    TmFillRect(gBg1Tm + 0x2B - 0xA, 0xD, 0xC, 0);

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);

    proc = StartMenu(&gItemSelectMenuDef);

    StartFace(0, GetUnitPortraitId(gActiveUnit), 0xB0, 0xC, 2);

    SetFaceBlinkControlById(0, 5);

    StartEquipInfoWindow(proc, gActiveUnit, 0xF, 0xB);

    return MENU_ACT_SKIPCURSOR;
}

u8 ItemSubMenu_IsUseAvailable(const struct MenuItemDef * def, int number)
{
    int item = gActiveUnit->items[gActionSt.item_slot];

    if (GetItemEffect(item) == 0)
        return MENU_NOTSHOWN;

    if (GetItemType(item) == ITYPE_STAFF)
        return MENU_NOTSHOWN;

    if (GetItemType(item) == ITYPE_12)
        return MENU_NOTSHOWN;

    if ((GetItemAttributes(item) & IA_WEAPON) && !CanUnitUseWeapon(gActiveUnit, item))
        return MENU_NOTSHOWN;

    return CanUnitUseItem(gActiveUnit, item)
        ? MENU_ENABLED : MENU_DISABLED;
}

u8 ItemSubMenu_IsEquipAvailable(const struct MenuItemDef * def, int number)
{
    int item = gActiveUnit->items[gActionSt.item_slot];

    if (!(GetItemAttributes(item) & IA_WEAPON))
        return MENU_NOTSHOWN;

    return CanUnitUseWeapon(gActiveUnit, item)
        ? MENU_ENABLED : MENU_DISABLED;
}

u8 ItemSubMenu_IsDiscardAvailable(const struct MenuItemDef * def, int number)
{
    if (GetItemAttributes(gActiveUnit->items[gActionSt.item_slot]) & IA_UNSELLABLE)
        return MENU_DISABLED;

    return MENU_ENABLED;
}

u8 ItemSubMenu_UseItem(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    if (menuItem->availability == MENU_DISABLED)
    {
        MenuFrozenHelpBox(menu, GetItemCantUseMsgid(gActiveUnit, gActiveUnit->items[gActionSt.item_slot]));
        return MENU_ACT_SND6B;
    }

    ClearUi();

    DoItemUse(gActiveUnit, gActiveUnit->items[gActionSt.item_slot]);

    PlaySoundEffect(SONG_38A);

    SetTextFont(NULL);

    ResetTextFont();

    EndAllMenus();

    return MENU_ACT_SKIPCURSOR | MENU_ACT_ENDFACE;
}

u8 ItemSubMenu_EquipItem(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    if (menuItem->availability == MENU_DISABLED)
    {
        MenuFrozenHelpBox(menu, 0x737);
        return MENU_ACT_SND6B;
    }

    EquipUnitItemSlot(gActiveUnit, gActionSt.item_slot);

    return sub_08022404(menu);
}

u8 ItemSubMenu_TradeItem(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    gBmSt.unk_3F = gActionSt.item_slot;

    sub_080223EC(menu);

    EndFaceById(0);

    TradeCommandEffect(menu, menuItem);

    return MENU_ENABLED;
}

u8 ItemSubMenu_DiscardItem(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    struct MenuProc * proc;
    struct MenuRect rect;

    if (menuItem->availability == MENU_DISABLED)
    {
        MenuFrozenHelpBox(menu, 0x739);
        return MENU_ACT_SND6B;
    }

    rect.x = menuItem->xTile + 3;
    rect.y = menuItem->yTile;
    rect.w = 5;
    rect.h = 0;

    proc = StartLockingMenuExt(&gYesNoSelectionMenuDef, rect, menu);

    proc->itemCurrent = 1;

    return MENU_ACT_SND6A | MENU_ACT_DOOM;
}

u8 MenuCommand_SelectYes(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    UnitRemoveItem(gActiveUnit, gActionSt.item_slot);

    if (gActionSt.item_slot != 0)
        TmFill(gBg0Tm, 0);

    sub_0802245C(menu);

    return MENU_ACT_SKIPCURSOR;
}

u8 BallistaRangeMenu_BallistaUsability(const struct MenuItemDef * def, int number)
{
    if (gActiveUnit->state & US_HAS_MOVED)
        return MENU_NOTSHOWN;

    if (GetBallistaItemAt(gActiveUnit->xPos, gActiveUnit->yPos) & 0xFF00)
        return MENU_ENABLED;

    return MENU_DISABLED;
}

int BallistaRangeMenu_Draw(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    s8 isAvailable = menuItem->availability == 1;
    int item = GetBallistaItemAt(gActiveUnit->xPos, gActiveUnit->yPos);

    DrawItemMenuLine(
        &menuItem->text,
        item,
        isAvailable,
        gBg0Tm + TM_OFFSET(menuItem->xTile, menuItem->yTile)
    );
}

u8 BallistaRangeMenu_Select(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    ClearUi();

    gActionSt.item_slot = ITEMSLOT_BALLISTA;

    FillBallistaRangeMaybe(gActiveUnit);

    StartMapSelect(&gSelectInfo_Attack);

    return MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_ENDFACE;
}

int FillBallistaRange(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    int item;

    BmMapFill(gBmMapMovement, -1);
    BmMapFill(gBmMapRange, 0);

    SetWorkingBmMap(gBmMapRange);

    item = GetBallistaItemAt(gActiveUnit->xPos, gActiveUnit->yPos);

    UpdateMenuItemPanel(item);

    MapAddInBoundedRange(gActiveUnit->xPos, gActiveUnit->yPos, GetItemMinRange(item), GetItemMaxRange(item));

    DisplayMoveRangeGraphics(2);

    return 0;
}

u8 StaffCommandUsability(const struct MenuItemDef * def, int number)
{
    int i;

    if (gActiveUnit->state & US_HAS_MOVED)
        return MENU_NOTSHOWN;

    for (i = 0; i < UNIT_ITEM_COUNT; i++)
    {
        int item = gActiveUnit->items[i];

        if (item == 0)
            break;

        if (GetItemType(item) != ITYPE_STAFF)
            continue;

        if (!CanUnitUseItem(gActiveUnit, item))
            continue;

        if (IsUnitMagicSealed(gActiveUnit))
            return MENU_DISABLED;
        else
            return MENU_ENABLED;
    }

    return MENU_NOTSHOWN;
}

u8 StaffCommandEffect(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    ProcPtr proc;

    if (menuItem->availability == MENU_DISABLED)
    {
        MenuFrozenHelpBox(menu, 0x73B);
        return MENU_ACT_SND6B;
    }

    ClearIcons();

    ApplyIconPalettes(4);

    proc = StartMenu(&gStaffItemSelectMenuDef);

    StartFace(0, GetUnitPortraitId(gActiveUnit), 0xB0, 0xC, 2);

    SetFaceBlinkControlById(0, 5);

    StartEquipInfoWindow(proc, gActiveUnit, 0xF, 0xB);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

int StaffCommandRange(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    int reach = GetUnitItemUseReachBits(gActiveUnit, -1);

    BmMapFill(gBmMapMovement, -1);
    BmMapFill(gBmMapRange, 0);

    BuildUnitStandingRangeForReach(gActiveUnit, reach);

    DisplayMoveRangeGraphics(5);

    return 0;
}

int HideMoveRangeGraphicsWrapper2(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    HideMoveRangeGraphics();

    return 0;
}

u8 StaffItemSelect_Usability(const struct MenuItemDef * def, int number)
{
    int item = gActiveUnit->items[number];

    if (GetItemType(item) != ITYPE_STAFF)
        return MENU_NOTSHOWN;

    if (!CanUnitUseItem(gActiveUnit, item))
        return MENU_NOTSHOWN;

    return MENU_ENABLED;
}

u8 StaffItemSelect_Effect(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    EquipUnitItemSlot(gActiveUnit, menuItem->itemNumber);

    gActionSt.item_slot = 0;

    ClearUi();

    DoItemUse(gActiveUnit, gActiveUnit->items[gActionSt.item_slot]);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A;
}

int StaffItemSelect_TextDraw(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    return ItemSelectMenu_TextDraw(menu, menuItem);
}

int StaffItemSelect_OnHover(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    int reach = GetUnitItemUseReachBits(gActiveUnit, menuItem->itemNumber);

    UpdateMenuItemPanel(menuItem->itemNumber);

    BmMapFill(gBmMapMovement, -1);
    BmMapFill(gBmMapRange, 0);

    BuildUnitStandingRangeForReach(gActiveUnit, reach);

    DisplayMoveRangeGraphics(4);

    return 0;
}

int StaffItemSelect_SwitchOut(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    if (!(menu->state & 4))
        HideMoveRangeGraphics();

    return 0;
}

u8 TalkCommandUsability(const struct MenuItemDef * def, int number)
{
    if (gActiveUnit->state & US_HAS_MOVED)
        return MENU_NOTSHOWN;

    MakeTalkTargetList(gActiveUnit);
    if (CountTargets() == 0)
        return MENU_NOTSHOWN;

    if (gActiveUnit->statusIndex == UNIT_STATUS_SILENCED)
        return MENU_DISABLED;

    return MENU_ENABLED;
}

u8 TalkCommandEffect(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    if (menuItem->availability == MENU_DISABLED)
    {
        MenuFrozenHelpBox(menu, 0x73C);
        return MENU_ACT_SND6B;
    }

    MakeTalkTargetList(gActiveUnit);
    StartMapSelect(&gSelectInfo_Talk);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A;
}

u8 TalkSelection_OnSelect(ProcPtr proc, struct SelectTarget * target)
{
    gActionSt.id = ACTION_TALK;
    gActionSt.target = target->uid;

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 SupportCommandUsability(const struct MenuItemDef * def, int number)
{
    if (gActiveUnit->state & US_HAS_MOVED)
        return MENU_NOTSHOWN;

    MakeTargetListForSupport(gActiveUnit);
    if (CountTargets() == 0)
        return MENU_NOTSHOWN;

    MakeTalkTargetList(gActiveUnit);
    if (CountTargets() != 0)
        return MENU_NOTSHOWN;

    if (gActiveUnit->statusIndex == UNIT_STATUS_SILENCED)
        return MENU_DISABLED;

    return MENU_ENABLED;
}

u8 SupportCommandEffect(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    if (menuItem->availability == MENU_DISABLED)
    {
        MenuFrozenHelpBox(menu, 0x73C);
        return MENU_ACT_SND6B;
    }

    MakeTargetListForSupport(gActiveUnit);
    StartMapSelect(&gSelectInfo_Support);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A;
}

u8 SupportSelection_OnSelect(ProcPtr proc, struct SelectTarget * target)
{
    gActionSt.id = ACTION_SUPPORT;
    gActionSt.target = target->uid;

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 DoorCommandUsability(const struct MenuItemDef * def, int number)
{
    if (gActiveUnit->state & US_HAS_MOVED)
        return MENU_NOTSHOWN;

    if (GetUnitKeyItemSlotForTerrain(gActiveUnit, TERRAIN_DOOR) < 0)
        return MENU_NOTSHOWN;

    MakeTargetListForDoorAndBridges(gActiveUnit, TERRAIN_DOOR);

    return CountTargets() != 0
        ? MENU_ENABLED : MENU_NOTSHOWN;
}

u8 DoorCommandEffect(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    gActionSt.id = ACTION_DOOR;

    gActionSt.instigator = gActiveUnit->index;

    gActionSt.item_slot = GetUnitKeyItemSlotForTerrain(gActiveUnit, TERRAIN_DOOR);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 ChestCommandUsability(const struct MenuItemDef * def, int number)
{
    if (gActiveUnit->state & US_HAS_MOVED)
        return MENU_NOTSHOWN;

    if (GetUnitKeyItemSlotForTerrain(gActiveUnit, TERRAIN_CHEST) < 0)
        return MENU_NOTSHOWN;

    return CanUnitUseChestKeyItem(gActiveUnit)
        ? MENU_ENABLED : MENU_NOTSHOWN;
}

u8 ChestCommandEffect(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    gActionSt.id = ACTION_CHEST;
    gActionSt.item_slot = GetUnitKeyItemSlotForTerrain(gActiveUnit, TERRAIN_CHEST);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 SupplyUsability(const struct MenuItemDef * def, int number)
{
    struct Unit * unit;

    if (gActiveUnit->state & US_HAS_MOVED)
        return MENU_NOTSHOWN;

    if (gBmSt.partial_actions_taken & 4)
        return MENU_NOTSHOWN;

    if (GetUnitItemCount(gActiveUnit) == 0 && GetConvoyItemCount() == 0)
        return MENU_NOTSHOWN;

    if (!sub_08079D9C())
        return MENU_NOTSHOWN;

    unit = GetUnitFromCharId(CHARACTER_MERLINUS);

    if (unit->state & US_HIDDEN)
        return MENU_NOTSHOWN;

    if (RECT_DISTANCE(gActiveUnit->xPos, gActiveUnit->yPos, unit->xPos, unit->yPos) == 1)
        return MENU_ENABLED;

    return MENU_NOTSHOWN;
}

u8 SupplyCommandEffect(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    gActionSt.id = ACTION_TRADED_NOCHANGES;

    StartBmSupply(gActiveUnit, NULL);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 ArmoryCommandUsability(const struct MenuItemDef * def, int number)
{
    if (gActiveUnit->state & US_HAS_MOVED)
        return MENU_NOTSHOWN;

    return GetAvailableTileEventCommand(gActiveUnit->xPos, gActiveUnit->yPos) == 0x13
        ? MENU_ENABLED : MENU_NOTSHOWN;
}

u8 ArmoryCommandEffect(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    StartAvailableTileEvent(gActiveUnit->xPos, gActiveUnit->yPos);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 VendorCommandUsability(const struct MenuItemDef * def, int number)
{
    if (gActiveUnit->state & US_HAS_MOVED)
        return MENU_NOTSHOWN;

    return GetAvailableTileEventCommand(gActiveUnit->xPos, gActiveUnit->yPos) == 0x14
        ? MENU_ENABLED : MENU_NOTSHOWN;
}

u8 VendorCommandEffect(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    StartAvailableTileEvent(gActiveUnit->xPos, gActiveUnit->yPos);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 SecretShopCommandUsability(const struct MenuItemDef * def, int number)
{
    if (gActiveUnit->state & US_HAS_MOVED)
        return MENU_NOTSHOWN;

    return GetAvailableTileEventCommand(gActiveUnit->xPos, gActiveUnit->yPos) == 0x15
        ? MENU_ENABLED : MENU_NOTSHOWN;
}

u8 SecretShopCommandEffect(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    StartAvailableTileEvent(gActiveUnit->xPos, gActiveUnit->yPos);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 ArenaCommandUsability(const struct MenuItemDef * def, int number)
{
    if (gActiveUnit->state & US_HAS_MOVED)
        return MENU_NOTSHOWN;

    if (gBmMapTerrain[gActiveUnit->yPos][gActiveUnit->xPos] != TERRAIN_ARENA_08)
        return MENU_NOTSHOWN;

    return ArenaIsUnitAllowed(gActiveUnit)
        ? MENU_ENABLED : MENU_DISABLED;
}

u8 ArenaCommandEffect(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    if (menuItem->availability == MENU_DISABLED)
    {
        if (IsUnitMagicSealed(gActiveUnit))
            MenuFrozenHelpBox(menu, 0x73D);
        else
            MenuFrozenHelpBox(menu, 0x73E);

        return MENU_ACT_SND6B;
    }

    StartArenaScreen();

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 sub_08022F68(void)
{
    return MENU_NOTSHOWN;
}

void sub_08022F6C(void)
{
    gActionSt.id = 0x20;
}

u8 StealCommandUsability(const struct MenuItemDef * def, int number)
{
    if (!(UNIT_CATTRIBUTES(gActiveUnit) & CA_STEAL))
        return MENU_NOTSHOWN;

    if (gActiveUnit->state & US_HAS_MOVED)
        return MENU_NOTSHOWN;

    MakeTargetListForSteal(gActiveUnit);
    if (CountTargets() == 0)
        return MENU_NOTSHOWN;

    if (GetUnitItemCount(gActiveUnit) == UNIT_ITEM_COUNT)
        return MENU_DISABLED;

    return MENU_ENABLED;
}

u8 StealCommandEffect(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    if (menuItem->availability == MENU_DISABLED)
    {
        MenuFrozenHelpBox(menu, 0x74B);
        return MENU_ACT_SND6B;
    }

    ClearUi();

    MakeTargetListForSteal(gActiveUnit);

    StartMapSelect(&gSelectInfo_Steal);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A;
}

void StealMapSelect_Init(ProcPtr menu)
{
    StartUnitInventoryInfoWindow(menu);
    StartSubtitleHelp(menu, DecodeMsg(0x721));
}

u8 StealMapSelect_SwitchIn(ProcPtr proc, struct SelectTarget * target)
{
    ChangeActiveUnitFacing(target->x, target->y);

    RefreshUnitStealInventoryInfoWindow(GetUnit(target->uid));
}

u8 StealMapSelect_Select(ProcPtr proc, struct SelectTarget * target)
{
    int pos;

    gActionSt.target = target->uid;

    ClearIcons();
    ApplyIconPalettes(4);

    StartMenu(&gStealItemMenuDef);

    EndTargetSelection(proc);

    TmApplyTsa(gBg1Tm + 0x42, Tsa_StealMenuFrame, 0x1000);

    pos = (56 - GetStringTextLen(DecodeMsg(GetUnit(gActionSt.target)->pCharacterData->nameTextId))) / 2;

    PutDrawText(0, gBg0Tm + 0x63, 0, pos, 7, DecodeMsg(GetUnit(gActionSt.target)->pCharacterData->nameTextId));

    PutFace80x72_Core(gBg0Tm + 0x63 + 0x40, GetUnitPortraitId(GetUnit(gActionSt.target)), 0x200, 5);

    return 0;
}

u8 StealItemMenuCommand_Usability(const struct MenuItemDef * def, int number)
{
    if (GetUnit(gActionSt.target)->items[number] == 0)
        return MENU_NOTSHOWN;

    if (!IsItemStealable(GetUnit(gActionSt.target)->items[number]))
        return MENU_DISABLED;

    return MENU_ENABLED;
}

int StealItemMenuCommand_Draw(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    int item = GetUnit(gActionSt.target)->items[menuItem->itemNumber];
    s8 isStealable = IsItemStealable(item);

    DrawItemMenuLine(&menuItem->text, item, isStealable, gBg0Tm + TM_OFFSET(menuItem->xTile, menuItem->yTile));
}

u8 StealItemMenuCommand_Effect(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    if (menuItem->availability == MENU_DISABLED)
    {
        MenuFrozenHelpBox(menu, 0x73F);
        return MENU_ACT_SND6B;
    }

    gActionSt.item_slot = menuItem->itemNumber;
    gActionSt.id = ACTION_STEAL;

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 ConvoyMenu_HelpBox(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    if (menuItem->itemNumber >= 5)
    {
        StartItemHelpBox(menuItem->xTile << 3, menuItem->yTile << 3, gBmSt.inventory_item_overflow);
        return 0;
    }

    StartItemHelpBox(menuItem->xTile << 3, menuItem->yTile << 3, gActiveUnit->items[menuItem->itemNumber]);
}

u8 ItemMenu_HelpBox(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    struct Unit * unit = GetUnit(gActionSt.target);

    StartItemHelpBox(menuItem->xTile * 8, menuItem->yTile << 3,
        unit->items[menuItem->itemNumber]);
}

u8 BallistaRangeMenuHelpBox(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    int x = menuItem->xTile << 3;
    int y = menuItem->yTile << 3;

    int item = GetBallistaItemAt(gActiveUnit->xPos, gActiveUnit->yPos);

    StartItemHelpBox(x, y, item);
}

void HealMapSelect_Init(ProcPtr proc)
{
    StartUnitHpInfoWindow(proc);
}

u8 HealMapSelect_SwitchIn(ProcPtr proc, struct SelectTarget * target)
{
    ChangeActiveUnitFacing(target->x, target->y);

    RefreshUnitHpInfoWindow(GetUnit(target->uid));
}

void RescueSelection_OnConstruction(ProcPtr proc)
{
    RefreshUnitTakeRescueInfoWindows(proc);
    StartSubtitleHelp(proc, DecodeMsg(0x71C));
}

u8 RescueSelection_OnChange(ProcPtr proc, struct SelectTarget * target)
{
    ChangeActiveUnitFacing(target->x, target->y);

    RefreshUnitRescueInfoWindows(GetUnit(target->uid));
}

void DropSelection_OnConstruction(ProcPtr menu)
{
    StartSubtitleHelp(menu, DecodeMsg(0x71D));
}

void sub_0802330C(void)
{
}

void GiveSelection_OnInit(ProcPtr menu)
{
    StartUnitGiveInfoWindows(menu);

    StartSubtitleHelp(menu, DecodeMsg(0x71F));
}

u8 GiveSelection_OnChange(ProcPtr proc, struct SelectTarget * target)
{
    ChangeActiveUnitFacing(target->x, target->y);

    RefreshUnitGiveInfoWindows(GetUnit(target->uid));
}

void TakeSelection_OnInit(ProcPtr menu)
{
    RefreshUnitTakeRescueInfoWindows(menu);

    StartSubtitleHelp(menu, DecodeMsg(0x71E));
}

u8 TakeSelection_OnChange(ProcPtr proc, struct SelectTarget * target)
{
    ChangeActiveUnitFacing(target->x, target->y);
    RefreshUnitTakeInfoWindows(GetUnit(target->uid));
}

void TradeTargetSelection_OnInit(ProcPtr menu)
{
    StartUnitInventoryInfoWindow(menu);
    StartSubtitleHelp(menu, DecodeMsg(0x720));
}

u8 TradeSelection_OnChange(ProcPtr proc, struct SelectTarget * target)
{
    ChangeActiveUnitFacing(target->x, target->y);
    ClearIcons();
    RefreshUnitInventoryInfoWindow(GetUnit(target->uid));
}

void TalkSupportSelection_OnInit(ProcPtr menu)
{
    StartUnitHpInfoWindow(menu);
    StartSubtitleHelp(menu, DecodeMsg(0x723));
}

u8 TalkSupportSelection_OnChange(ProcPtr proc, struct SelectTarget * target)
{
    ChangeActiveUnitFacing(target->x, target->y);
    RefreshUnitHpInfoWindow(GetUnit(target->uid));
}

void RefreshMapSelect_Init(ProcPtr menu)
{
    StartUnitHpInfoWindow(menu);
    StartSubtitleHelp(menu, DecodeMsg(0x724));
}

u8 RefreshMapSelect_SwitchIn(ProcPtr proc, struct SelectTarget * target)
{
    ChangeActiveUnitFacing(target->x, target->y);
    RefreshUnitHpInfoWindow(GetUnit(target->uid));
}

void WarpUnitMapSelect_Init(ProcPtr menu)
{
    StartUnitHpInfoWindow(menu);
}

u8 WarpUnitMapSelect_SwitchIn(ProcPtr proc, struct SelectTarget * target)
{
    ChangeActiveUnitFacing(target->x, target->y);
    RefreshUnitHpInfoWindow(GetUnit(target->uid));
}

u8 RideCommandUsability(const struct MenuItemDef * def, int number)
{
    struct Trap * trap;

    if (!(UNIT_CATTRIBUTES(gActiveUnit) & CA_BALLISTAE))
        return MENU_NOTSHOWN;

    if (gActiveUnit->state & (US_RESCUING | US_RESCUED | US_IN_BALLISTA))
        return MENU_NOTSHOWN;

    if (gBmSt.partial_actions_taken & 8)
        return MENU_NOTSHOWN;

    trap = GetTrapAt(gActiveUnit->xPos, gActiveUnit->yPos);

    if (trap == 0)
        return MENU_NOTSHOWN;

    if (trap->type != 1)
        return MENU_NOTSHOWN;

    return MENU_ENABLED;
}

u8 RideCommandEffect(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    gActionSt.id = 0x1E;
    RideBallista(gActiveUnit);

    EndAllMus();
    StartMu(gActiveUnit);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 ExitCommandUsability(const struct MenuItemDef * def, int number)
{
    if (!(gActiveUnit->state & US_IN_BALLISTA))
        return MENU_NOTSHOWN;

    if (gBmSt.partial_actions_taken & 8)
        return MENU_NOTSHOWN;

    return MENU_ENABLED;
}

u8 ExitCommandEffect(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    gActionSt.id = 0x1F;
    TryRemoveUnitFromBallista(gActiveUnit);

    EndAllMus();
    StartMu(gActiveUnit);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 GetUnitAttackCommandAvailability(const struct MenuItemDef * def, int number)
{
    int i;

    if (gActiveUnit->state & US_HAS_MOVED)
        return MENU_NOTSHOWN;

    if (gActiveUnit->state & US_IN_BALLISTA)
        return MENU_NOTSHOWN;

    for (i = 0; i < UNIT_ITEM_COUNT; i++)
    {
        int item = gActiveUnit->items[i];

        if (item == 0)
            break;

        if (!(GetItemAttributes(item) & IA_WEAPON))
            continue;

        if (!CanUnitUseWeaponNow(gActiveUnit, item))
            continue;

        ListAttackTargetsForWeapon(gActiveUnit, item);
        if (CountTargets() == 0)
            continue;

        return MENU_ENABLED;
    }

    return MENU_NOTSHOWN;
}

u8 GetUnitAttackBallistaCommandAvailability(const struct MenuItemDef * def, int number)
{
    struct Trap * trap;

    if (!(gActiveUnit->state & US_IN_BALLISTA))
        return MENU_NOTSHOWN;

    trap = GetTrapAt(gActiveUnit->xPos, gActiveUnit->yPos);

    if (!IsBallista(trap))
        return MENU_NOTSHOWN;

    ListAttackTargetsForWeapon(gActiveUnit, trap->extra | 0x100);
    if (CountTargets() == 0)
        return MENU_NOTSHOWN;

    if (GetBallistaItemUses(trap) == 0)
        return MENU_DISABLED;

    return MENU_ENABLED;
}

u8 ItemMenu_Is1stCommandAvailable(const struct MenuItemDef * def, int number)
{
    MakeTargetListForRefresh(gActiveUnit);
    if (CountTargets() == 0)
        return MENU_NOTSHOWN;

    return MENU_ENABLED;
}

int ItemMenu_Draw1stCommand(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    Text_InsertDrawString(&menuItem->text, 16, 0, GetItemName(gBmSt.inventory_item_overflow));
    PutText(&menuItem->text, gBg0Tm + TM_OFFSET(menuItem->xTile, menuItem->yTile));

    return 0;
}

u8 ItemMenu_Select1stCommand(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    if (menuItem->availability == MENU_DISABLED)
        return MENU_ACT_SND6B;

    MakeTargetListForRefresh(gActiveUnit);
    StartMapSelect(&gSelectInfo_Dance);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_ENDFACE;
}

u8 ItemMenu_AreOtherCommandsAvailable(const struct MenuItemDef * def, int number)
{
    int item = gActiveUnit->items[number - 1];

    if (GetItemType(item) != ITYPE_12)
        return MENU_NOTSHOWN;

    if (!CanUnitUseItem(gActiveUnit, item))
        return MENU_NOTSHOWN;

    return MENU_ENABLED;
}

int ItemMenu_DrawOtherCommands(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    int item = gActiveUnit->items[menuItem->itemNumber - 1];

    DrawItemMenuLine(&menuItem->text, item, 1, gBg0Tm + TM_OFFSET(menuItem->xTile, menuItem->yTile));

    return 0;
}

u8 ItemMenu_SelectOtherCommands(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    gActionSt.item_slot = menuItem->itemNumber - 1;

    ClearUi();

    DoItemUse(gActiveUnit, gActiveUnit->items[gActionSt.item_slot]);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A;
}

int ItemMenu_SwitchIn(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    if (menuItem->itemNumber == 0)
        UpdateMenuItemPanel(ITEMSLOT_OVERFLOW);
    else
        UpdateMenuItemPanel(menuItem->itemNumber - 1);
}

int ItemMenu_SwitchOut_DoNothing(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
}

u8 ItemMenuHelpBox(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    int item;

    if (menuItem->itemNumber == 0)
        item = gBmSt.inventory_item_overflow;
    else
        item = gActiveUnit->items[menuItem->itemNumber - 1];

    StartItemHelpBox(menuItem->xTile << 3, menuItem->yTile << 3, item);
}


void Config_HandleExit();
void Config_Init();
void Config_Loop_KeyHandler();
void sub_080ADB7C();

SECTION(".rodata.08B93E0C")
const struct ProcCmd gProcScr_0859B630[] = {
    PROC_CALL(LockGame),
    PROC_CALL(sub_08021D28),
    PROC_WHILE_EXISTS(gProcScr_BKSEL),
    PROC_WHILE_EXISTS(ProcScr_CamMove),
    PROC_CALL(GoToFightItemReview),
    PROC_CALL(UnlockGame),
    PROC_END,
};

SECTION(".rodata.08CE5BF0")
const struct ProcCmd ProcScr_Config_Field[] = {
    PROC_19,
    PROC_CALL(LockGame),
    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(LockBmDisplay),
    PROC_LABEL(0),
    PROC_SLEEP(0),
    PROC_CALL(sub_080ADB7C),
    PROC_CALL(Config_Init),
    PROC_CALL(StartFastFadeFromBlack),
    PROC_REPEAT(WaitForFade),
    PROC_REPEAT(Config_Loop_KeyHandler),
    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(KillHelpBox),
    PROC_CALL_2(Config_HandleExit),
    PROC_CALL(UnlockBmDisplay),
    PROC_CALL(RefreshBMapGraphics),
    PROC_CALL(StartFastFadeFromBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(UnlockGame),
    PROC_END,
};

extern const struct MenuItemDef gStealItemMenuItems[];
extern const struct MenuItemDef gYesNoSelectionMenuItems[];
extern const struct MenuItemDef gUnk_08B94E94[];
extern const struct MenuItemDef gItemMenuItems[];
extern const struct MenuItemDef gStaffItemSelectMenuItems[];
extern const struct MenuItemDef gItemSelectMenuItems[];
extern const struct MenuItemDef gBallistaRangeMenuItems[];
extern const struct MenuItemDef gWeaponSelectMenuItems[];
extern const struct MenuItemDef gUnk_08B95314[];
extern const struct MenuItemDef gUnk_08B95704[];

SECTION(".rodata.08B94AEC")
const struct MenuItemDef gStealItemMenuItems[] = {
    {
        .name = gUnk_081C3D94,
        .overrideId = 0x1E,
        .isAvailable = StealItemMenuCommand_Usability,
        .onDraw = StealItemMenuCommand_Draw,
        .onSelected = StealItemMenuCommand_Effect,
    },
    {
        .name = gUnk_081C3D94,
        .overrideId = 0x1F,
        .isAvailable = StealItemMenuCommand_Usability,
        .onDraw = StealItemMenuCommand_Draw,
        .onSelected = StealItemMenuCommand_Effect,
    },
    {
        .name = gUnk_081C3D94,
        .overrideId = 0x20,
        .isAvailable = StealItemMenuCommand_Usability,
        .onDraw = StealItemMenuCommand_Draw,
        .onSelected = StealItemMenuCommand_Effect,
    },
    {
        .name = gUnk_081C3D94,
        .overrideId = 0x21,
        .isAvailable = StealItemMenuCommand_Usability,
        .onDraw = StealItemMenuCommand_Draw,
        .onSelected = StealItemMenuCommand_Effect,
    },
    {
        .name = gUnk_081C3D94,
        .overrideId = 0x22,
        .isAvailable = StealItemMenuCommand_Usability,
        .onDraw = StealItemMenuCommand_Draw,
        .onSelected = StealItemMenuCommand_Effect,
    },
    { 0 },
};

SECTION(".rodata.08B94E28")
const struct MenuItemDef gYesNoSelectionMenuItems[] = {
    {
        .name = gUnk_081C3E78,
        .nameMsgId = 0x10EE,
        .overrideId = 0x31,
        .isAvailable = MenuAlwaysEnabled,
        .onSelected = MenuCommand_SelectYes,
    },
    {
        .name = gUnk_081C3E70,
        .nameMsgId = 0x10EF,
        .overrideId = 0x32,
        .isAvailable = MenuAlwaysEnabled,
        .onSelected = (void *) MenuCommand_SelectNo,
    },
    { 0 },
};

SECTION(".rodata.08B94E94")
const struct MenuItemDef gUnk_08B94E94[] = {
    {
        .name = gUnk_081C3E98,
        .nameMsgId = 0x10EA,
        .helpMsgId = 0x36D,
        .overrideId = 0x33,
        .isAvailable = ItemSubMenu_IsUseAvailable,
        .onSelected = ItemSubMenu_UseItem,
    },
    {
        .name = gUnk_081C3E90,
        .nameMsgId = 0x10EB,
        .helpMsgId = 0x36C,
        .color = 4,
        .overrideId = 0x34,
        .isAvailable = ItemSubMenu_IsEquipAvailable,
        .onSelected = ItemSubMenu_EquipItem,
    },
    {
        .name = gUnk_081C3E88,
        .nameMsgId = 0x10EC,
        .helpMsgId = 0x366,
        .color = 4,
        .overrideId = 0x35,
        .isAvailable = ItemSubMenu_IsTradeAvailable,
        .onSelected = ItemSubMenu_TradeItem,
    },
    {
        .name = gUnk_081C3E80,
        .nameMsgId = 0x10ED,
        .helpMsgId = 0x36E,
        .color = 4,
        .overrideId = 0x36,
        .isAvailable = ItemSubMenu_IsDiscardAvailable,
        .onSelected = ItemSubMenu_DiscardItem,
    },
    { 0 },
};

SECTION(".rodata.08B94F48")
const struct MenuItemDef gItemMenuItems[] = {
    {
        .name = gUnk_081C3D94,
        .overrideId = 0x37,
        .isAvailable = ItemMenu_Is1stCommandAvailable,
        .onDraw = ItemMenu_Draw1stCommand,
        .onSelected = ItemMenu_Select1stCommand,
        .onSwitchIn = ItemMenu_SwitchIn,
        .onSwitchOut = ItemMenu_SwitchOut_DoNothing,
    },
    {
        .name = gUnk_081C3D94,
        .overrideId = 0x38,
        .isAvailable = ItemMenu_AreOtherCommandsAvailable,
        .onDraw = ItemMenu_DrawOtherCommands,
        .onSelected = ItemMenu_SelectOtherCommands,
        .onSwitchIn = ItemMenu_SwitchIn,
        .onSwitchOut = ItemMenu_SwitchOut_DoNothing,
    },
    {
        .name = gUnk_081C3D94,
        .overrideId = 0x39,
        .isAvailable = ItemMenu_AreOtherCommandsAvailable,
        .onDraw = ItemMenu_DrawOtherCommands,
        .onSelected = ItemMenu_SelectOtherCommands,
        .onSwitchIn = ItemMenu_SwitchIn,
        .onSwitchOut = ItemMenu_SwitchOut_DoNothing,
    },
    {
        .name = gUnk_081C3D94,
        .overrideId = 0x3A,
        .isAvailable = ItemMenu_AreOtherCommandsAvailable,
        .onDraw = ItemMenu_DrawOtherCommands,
        .onSelected = ItemMenu_SelectOtherCommands,
        .onSwitchIn = ItemMenu_SwitchIn,
        .onSwitchOut = ItemMenu_SwitchOut_DoNothing,
    },
    {
        .name = gUnk_081C3D94,
        .overrideId = 0x3B,
        .isAvailable = ItemMenu_AreOtherCommandsAvailable,
        .onDraw = ItemMenu_DrawOtherCommands,
        .onSelected = ItemMenu_SelectOtherCommands,
        .onSwitchIn = ItemMenu_SwitchIn,
        .onSwitchOut = ItemMenu_SwitchOut_DoNothing,
    },
    {
        .name = gUnk_081C3D94,
        .overrideId = 0x3C,
        .isAvailable = ItemMenu_AreOtherCommandsAvailable,
        .onDraw = ItemMenu_DrawOtherCommands,
        .onSelected = ItemMenu_SelectOtherCommands,
        .onSwitchIn = ItemMenu_SwitchIn,
        .onSwitchOut = ItemMenu_SwitchOut_DoNothing,
    },
    { 0 },
};

SECTION(".rodata.08B95044")
const struct MenuItemDef gStaffItemSelectMenuItems[] = {
    {
        .name = gUnk_081C3D94,
        .overrideId = 0x3D,
        .isAvailable = StaffItemSelect_Usability,
        .onDraw = StaffItemSelect_TextDraw,
        .onSelected = StaffItemSelect_Effect,
        .onSwitchIn = StaffItemSelect_OnHover,
        .onSwitchOut = StaffItemSelect_SwitchOut,
    },
    {
        .name = gUnk_081C3D94,
        .overrideId = 0x3E,
        .isAvailable = StaffItemSelect_Usability,
        .onDraw = StaffItemSelect_TextDraw,
        .onSelected = StaffItemSelect_Effect,
        .onSwitchIn = StaffItemSelect_OnHover,
        .onSwitchOut = StaffItemSelect_SwitchOut,
    },
    {
        .name = gUnk_081C3D94,
        .overrideId = 0x3F,
        .isAvailable = StaffItemSelect_Usability,
        .onDraw = StaffItemSelect_TextDraw,
        .onSelected = StaffItemSelect_Effect,
        .onSwitchIn = StaffItemSelect_OnHover,
        .onSwitchOut = StaffItemSelect_SwitchOut,
    },
    {
        .name = gUnk_081C3D94,
        .overrideId = 0x40,
        .isAvailable = StaffItemSelect_Usability,
        .onDraw = StaffItemSelect_TextDraw,
        .onSelected = StaffItemSelect_Effect,
        .onSwitchIn = StaffItemSelect_OnHover,
        .onSwitchOut = StaffItemSelect_SwitchOut,
    },
    {
        .name = gUnk_081C3D94,
        .overrideId = 0x41,
        .isAvailable = StaffItemSelect_Usability,
        .onDraw = StaffItemSelect_TextDraw,
        .onSelected = StaffItemSelect_Effect,
        .onSwitchIn = StaffItemSelect_OnHover,
        .onSwitchOut = StaffItemSelect_SwitchOut,
    },
    { 0 },
};

SECTION(".rodata.08B9511C")
const struct MenuItemDef gItemSelectMenuItems[] = {
    {
        .name = gUnk_081C3D94,
        .overrideId = 0x42,
        .isAvailable = ItemSelectMenu_Usability,
        .onDraw = ItemSelectMenu_TextDraw,
        .onSelected = ItemSelectMenu_Effect,
        .onSwitchIn = Menu_SwitchIn,
        .onSwitchOut = Menu_SwitchOut_DoNothing,
    },
    {
        .name = gUnk_081C3D94,
        .overrideId = 0x43,
        .isAvailable = ItemSelectMenu_Usability,
        .onDraw = ItemSelectMenu_TextDraw,
        .onSelected = ItemSelectMenu_Effect,
        .onSwitchIn = Menu_SwitchIn,
        .onSwitchOut = Menu_SwitchOut_DoNothing,
    },
    {
        .name = gUnk_081C3D94,
        .overrideId = 0x44,
        .isAvailable = ItemSelectMenu_Usability,
        .onDraw = ItemSelectMenu_TextDraw,
        .onSelected = ItemSelectMenu_Effect,
        .onSwitchIn = Menu_SwitchIn,
        .onSwitchOut = Menu_SwitchOut_DoNothing,
    },
    {
        .name = gUnk_081C3D94,
        .overrideId = 0x45,
        .isAvailable = ItemSelectMenu_Usability,
        .onDraw = ItemSelectMenu_TextDraw,
        .onSelected = ItemSelectMenu_Effect,
        .onSwitchIn = Menu_SwitchIn,
        .onSwitchOut = Menu_SwitchOut_DoNothing,
    },
    {
        .name = gUnk_081C3D94,
        .overrideId = 0x46,
        .isAvailable = ItemSelectMenu_Usability,
        .onDraw = ItemSelectMenu_TextDraw,
        .onSelected = ItemSelectMenu_Effect,
        .onSwitchIn = Menu_SwitchIn,
        .onSwitchOut = Menu_SwitchOut_DoNothing,
    },
    { 0 },
};

SECTION(".rodata.08B951F4")
const struct MenuItemDef gBallistaRangeMenuItems[] = {
    {
        .name = gUnk_081C3D94,
        .overrideId = 0x47,
        .isAvailable = BallistaRangeMenu_BallistaUsability,
        .onDraw = BallistaRangeMenu_Draw,
        .onSelected = BallistaRangeMenu_Select,
        .onSwitchIn = FillBallistaRange,
        .onSwitchOut = BallistaRangeMenu_SwitchOut,
    },
    { 0 },
};

SECTION(".rodata.08B9523C")
const struct MenuItemDef gWeaponSelectMenuItems[] = {
    {
        .name = gUnk_081C3D94,
        .overrideId = 0x48,
        .isAvailable = WeaponSelectMenu_IsAvailable,
        .onDraw = WeaponSelectMenu_Draw,
        .onSelected = WeaponSelectMenu_Selected,
        .onSwitchIn = WeaponSelectMenu_SwitchIn,
        .onSwitchOut = BallistaRangeMenu_SwitchOut,
    },
    {
        .name = gUnk_081C3D94,
        .overrideId = 0x49,
        .isAvailable = WeaponSelectMenu_IsAvailable,
        .onDraw = WeaponSelectMenu_Draw,
        .onSelected = WeaponSelectMenu_Selected,
        .onSwitchIn = WeaponSelectMenu_SwitchIn,
        .onSwitchOut = BallistaRangeMenu_SwitchOut,
    },
    {
        .name = gUnk_081C3D94,
        .overrideId = 0x4A,
        .isAvailable = WeaponSelectMenu_IsAvailable,
        .onDraw = WeaponSelectMenu_Draw,
        .onSelected = WeaponSelectMenu_Selected,
        .onSwitchIn = WeaponSelectMenu_SwitchIn,
        .onSwitchOut = BallistaRangeMenu_SwitchOut,
    },
    {
        .name = gUnk_081C3D94,
        .overrideId = 0x4B,
        .isAvailable = WeaponSelectMenu_IsAvailable,
        .onDraw = WeaponSelectMenu_Draw,
        .onSelected = WeaponSelectMenu_Selected,
        .onSwitchIn = WeaponSelectMenu_SwitchIn,
        .onSwitchOut = BallistaRangeMenu_SwitchOut,
    },
    {
        .name = gUnk_081C3D94,
        .overrideId = 0x4C,
        .isAvailable = WeaponSelectMenu_IsAvailable,
        .onDraw = WeaponSelectMenu_Draw,
        .onSelected = WeaponSelectMenu_Selected,
        .onSwitchIn = WeaponSelectMenu_SwitchIn,
        .onSwitchOut = BallistaRangeMenu_SwitchOut,
    },
    { 0 },
};

SECTION(".rodata.08B95314")
const struct MenuItemDef gUnk_08B95314[] = {
    {
        .name = gUnk_081C3F94,
        .nameMsgId = 0x10CA,
        .helpMsgId = 0x35E,
        .overrideId = 0x4D,
        .isAvailable = UnitActionMenu_Seize_Available,
        .onSelected = UnitActionMenu_Seize,
    },
    {
        .name = gUnk_081C3F8C,
        .nameMsgId = 0x10CB,
        .helpMsgId = 0x353,
        .overrideId = 0x4E,
        .isAvailable = GetUnitAttackCommandAvailability,
        .onSelected = UnitAttackCommandEffect,
        .onSwitchIn = DisplayUnitStandingAttackRange,
        .onSwitchOut = HideMoveRangeGraphicsWrapper,
    },
    {
        .name = gUnk_081C3F8C,
        .nameMsgId = 0x10CB,
        .helpMsgId = 0x353,
        .overrideId = 0x4F,
        .isAvailable = GetUnitAttackBallistaCommandAvailability,
        .onSelected = UnitAttackCommandEffect,
        .onSwitchIn = DisplayUnitStandingAttackRange,
        .onSwitchOut = HideMoveRangeGraphicsWrapper,
    },
    {
        .name = gUnk_081C3F84,
        .nameMsgId = 0x10CC,
        .helpMsgId = 0x354,
        .overrideId = 0x50,
        .isAvailable = StaffCommandUsability,
        .onSelected = StaffCommandEffect,
        .onSwitchIn = StaffCommandRange,
        .onSwitchOut = HideMoveRangeGraphicsWrapper2,
    },
    {
        .name = gUnk_081C3F7C,
        .nameMsgId = 0x10C8,
        .helpMsgId = 0x368,
        .color = 4,
        .overrideId = 0x51,
        .isAvailable = RideCommandUsability,
        .onSelected = RideCommandEffect,
    },
    {
        .name = gUnk_081C3F70,
        .nameMsgId = 0x10C9,
        .helpMsgId = 0x369,
        .color = 4,
        .overrideId = 0x52,
        .isAvailable = ExitCommandUsability,
        .onSelected = ExitCommandEffect,
    },
    {
        .name = gUnk_081C3F64,
        .nameMsgId = 0x10CD,
        .helpMsgId = 0x356,
        .overrideId = 0x53,
        .isAvailable = PlayCommandUsability,
        .onSelected = PlayCommandEffect,
    },
    {
        .name = gUnk_081C3F5C,
        .nameMsgId = 0x10CE,
        .helpMsgId = 0x355,
        .overrideId = 0x54,
        .isAvailable = DanceCommandUsability,
        .onSelected = PlayCommandEffect,
    },
    {
        .name = gUnk_081C3F54,
        .nameMsgId = 0x10CF,
        .helpMsgId = 0x357,
        .overrideId = 0x55,
        .isAvailable = StealCommandUsability,
        .onSelected = StealCommandEffect,
    },
    {
        .name = gUnk_081C3F4C,
        .nameMsgId = 0x10D0,
        .helpMsgId = 0x35C,
        .overrideId = 0x56,
        .isAvailable = TalkCommandUsability,
        .onSelected = TalkCommandEffect,
    },
    {
        .name = gUnk_081C3F44,
        .nameMsgId = 0x10D1,
        .helpMsgId = 0x3DB,
        .overrideId = 0x57,
        .isAvailable = SupportCommandUsability,
        .onSelected = SupportCommandEffect,
    },
    {
        .name = gUnk_081C3F3C,
        .nameMsgId = 0x10D2,
        .helpMsgId = 0x35D,
        .overrideId = 0x58,
        .isAvailable = VisitCommandUsability,
        .onSelected = VisitCommandEffect,
    },
    {
        .name = gUnk_081C3F34,
        .nameMsgId = 0x10D3,
        .helpMsgId = 0x360,
        .overrideId = 0x59,
        .isAvailable = ChestCommandUsability,
        .onSelected = ChestCommandEffect,
    },
    {
        .name = gUnk_081C3F2C,
        .nameMsgId = 0x10D4,
        .helpMsgId = 0x35F,
        .overrideId = 0x5A,
        .isAvailable = DoorCommandUsability,
        .onSelected = DoorCommandEffect,
    },
    {
        .name = gUnk_081C3F20,
        .nameMsgId = 0x10D5,
        .helpMsgId = 0x361,
        .overrideId = 0x5B,
        .isAvailable = ArmoryCommandUsability,
        .onSelected = ArmoryCommandEffect,
    },
    {
        .name = gUnk_081C3F14,
        .nameMsgId = 0x10D6,
        .helpMsgId = 0x362,
        .overrideId = 0x5C,
        .isAvailable = VendorCommandUsability,
        .onSelected = VendorCommandEffect,
    },
    {
        .name = gUnk_081C3F08,
        .nameMsgId = 0x10D7,
        .helpMsgId = 0x363,
        .overrideId = 0x5D,
        .isAvailable = SecretShopCommandUsability,
        .onSelected = SecretShopCommandEffect,
    },
    {
        .name = gUnk_081C3EFC,
        .nameMsgId = 0x10D8,
        .helpMsgId = 0x364,
        .overrideId = 0x5E,
        .isAvailable = ArenaCommandUsability,
        .onSelected = ArenaCommandEffect,
    },
    {
        .name = gUnk_081C3EF4,
        .nameMsgId = 0x10D9,
        .helpMsgId = 0x358,
        .overrideId = 0x5F,
        .isAvailable = RescueUsability,
        .onSelected = RescueEffect,
    },
    {
        .name = gUnk_081C3EE8,
        .nameMsgId = 0x10DA,
        .helpMsgId = 0x359,
        .overrideId = 0x60,
        .isAvailable = DropUsability,
        .onSelected = DropEffect,
    },
    {
        .name = gUnk_081C3EDC,
        .nameMsgId = 0x10DB,
        .helpMsgId = 0x35B,
        .color = 4,
        .overrideId = 0x61,
        .isAvailable = TakeUsability,
        .onSelected = TakeEffect,
    },
    {
        .name = gUnk_081C3ED0,
        .nameMsgId = 0x10DC,
        .helpMsgId = 0x35A,
        .color = 4,
        .overrideId = 0x62,
        .isAvailable = GiveUsability,
        .onSelected = GiveEffect,
    },
    {
        .name = gUnk_081C3EC4,
        .nameMsgId = 0x10DD,
        .helpMsgId = 0x365,
        .overrideId = 0x63,
        .isAvailable = ItemCommandUsability,
        .onSelected = ItemCommandEffect,
    },
    {
        .name = gUnk_081C3EBC,
        .nameMsgId = 0x10DE,
        .helpMsgId = 0x366,
        .color = 4,
        .overrideId = 0x64,
        .isAvailable = ItemSubMenu_IsTradeAvailable,
        .onSelected = TradeCommandEffect,
    },
    {
        .name = gUnk_081C3EB0,
        .nameMsgId = 0x10DF,
        .helpMsgId = 0x367,
        .color = 4,
        .overrideId = 0x65,
        .isAvailable = SupplyUsability,
        .onSelected = SupplyCommandEffect,
    },
    {
        .name = gUnk_081C3EA8,
        .nameMsgId = 0x10E3,
        .helpMsgId = 0x371,
        .overrideId = 0x66,
        .isAvailable = (void *) sub_08022F68,
        .onSelected = (void *) sub_08022F6C,
    },
    {
        .name = gUnk_081C3EA0,
        .nameMsgId = 0x10E0,
        .helpMsgId = 0x352,
        .overrideId = 0x67,
        .isAvailable = MenuAlwaysEnabled,
        .onSelected = EffectWait,
    },
    { 0 },
};

SECTION(".rodata.08B95704")
const struct MenuItemDef gUnk_08B95704[] = {
    {
        .name = gUnk_081C3F9C,
        .nameMsgId = 0x10E1,
        .overrideId = 0x68,
        .isAvailable = MenuAlwaysEnabled,
        .onSelected = (void *) sub_08030C10,
    },
    { 0 },
};

extern const struct MenuDef gUnk_08B95AD0;

SECTION(".rodata.08B95920")
const struct MenuDef gStealItemMenuDef = {
    .rect = { .x = 0xE, .y = 4, .w = 0xE },
    .menuItems = gStealItemMenuItems,
    .onBPress = ItemMenu_ButtonBPressed,
    .onRPress = MenuAutoHelpBoxSelect,
    .onHelpBox = ItemMenu_HelpBox,
};

SECTION(".rodata.08B959B0")
const struct MenuDef gYesNoSelectionMenuDef = {
    .rect = { .w = 5 },
    .style = 1,
    .menuItems = gYesNoSelectionMenuItems,
    .onBPress = (void *) MenuCommand_SelectNo,
};

SECTION(".rodata.08B959D4")
const struct MenuDef gItemSubMenuDef = {
    .rect = { .w = 6 },
    .style = 1,
    .menuItems = gUnk_08B94E94,
    .onEnd = ItemSubMenuEnd,
    .onBPress = (void *) MenuCommand_SelectNo,
    .onRPress = MenuAutoHelpBoxSelect,
    .onHelpBox = MenuStdHelpBox,
};

SECTION(".rodata.08B959F8")
const struct MenuDef gItemMenuDef = {
    .rect = { .x = 1, .y = 1, .w = 0xE },
    .menuItems = gItemMenuItems,
    .onBPress = ItemMenu_ButtonBPressed,
    .onRPress = MenuAutoHelpBoxSelect,
    .onHelpBox = ItemMenuHelpBox,
};

SECTION(".rodata.08B95A1C")
const struct MenuDef gStaffItemSelectMenuDef = {
    .rect = { .x = 1, .y = 1, .w = 0xE },
    .menuItems = gStaffItemSelectMenuItems,
    .onBPress = ItemMenu_ButtonBPressed,
    .onRPress = MenuAutoHelpBoxSelect,
    .onHelpBox = ConvoyMenu_HelpBox,
};

SECTION(".rodata.08B95A40")
const struct MenuDef gItemSelectMenuDef = {
    .rect = { .x = 1, .y = 1, .w = 0xE },
    .menuItems = gItemSelectMenuItems,
    .onBPress = ItemMenu_ButtonBPressed,
    .onRPress = MenuAutoHelpBoxSelect,
    .onHelpBox = ConvoyMenu_HelpBox,
};

SECTION(".rodata.08B95A64")
const struct MenuDef gBallistaRangeMenuDef = {
    .rect = { .x = 1, .y = 1, .w = 0xE },
    .menuItems = gBallistaRangeMenuItems,
    .onBPress = ItemMenu_ButtonBPressed,
    .onRPress = MenuAutoHelpBoxSelect,
    .onHelpBox = BallistaRangeMenuHelpBox,
};

SECTION(".rodata.08B95A88")
const struct MenuDef gWeaponSelectMenuDef = {
    .rect = { .x = 1, .y = 1, .w = 0xE },
    .menuItems = gWeaponSelectMenuItems,
    .onBPress = ItemMenu_ButtonBPressed,
    .onRPress = MenuAutoHelpBoxSelect,
    .onHelpBox = ConvoyMenu_HelpBox,
};

SECTION(".rodata.08B95AAC")
const struct MenuDef gUnitActionMenuDef = {
    .rect = { .x = 1, .y = 3, .w = 7 },
    .menuItems = gUnk_08B95314,
    .onBPress = MenuCancelSelect,
    .onRPress = MenuAutoHelpBoxSelect,
    .onHelpBox = MenuStdHelpBox,
};

SECTION(".rodata.08B95AD0")
const struct MenuDef gUnk_08B95AD0 = {
    .rect = { .x = 1, .y = 2, .w = 9 },
    .menuItems = gUnk_08B95704,
    .onBPress = MenuCancelSelect,
};

SECTION(".rodata.08B95B98")
const struct SelectInfo gSelectInfo_Dance = {
    .onInit = RefreshMapSelect_Init,
    .onEnd = (void *) ClearUi,
    .onSwitchIn = RefreshMapSelect_SwitchIn,
    .onSelect = RefreshMapSelect_Select,
    .onCancel = GenericSelection_BackToUM,
};

SECTION(".rodata.08B95BF8")
const struct SelectInfo gSelectInfo_Steal = {
    .onInit = StealMapSelect_Init,
    .onEnd = (void *) ClearUi,
    .onSwitchIn = StealMapSelect_SwitchIn,
    .onSelect = StealMapSelect_Select,
    .onCancel = GenericSelection_BackToUM,
};

SECTION(".rodata.08B95C18")
const struct SelectInfo gSelectInfo_Support = {
    .onInit = TalkSupportSelection_OnInit,
    .onEnd = (void *) ClearUi,
    .onSwitchIn = TalkSupportSelection_OnChange,
    .onSelect = SupportSelection_OnSelect,
    .onCancel = GenericSelection_BackToUM,
};

SECTION(".rodata.08B95C38")
const struct SelectInfo gSelectInfo_Talk = {
    .onInit = TalkSupportSelection_OnInit,
    .onEnd = (void *) ClearUi,
    .onSwitchIn = TalkSupportSelection_OnChange,
    .onSelect = TalkSelection_OnSelect,
    .onCancel = GenericSelection_BackToUM,
};

SECTION(".rodata.08B95C78")
const struct SelectInfo gSelectInfo_Trade = {
    .onInit = TradeTargetSelection_OnInit,
    .onEnd = (void *) ClearUi,
    .onSwitchIn = TradeSelection_OnChange,
    .onSelect = TradeSelection_OnSelect,
    .onCancel = GenericSelection_BackToUM,
};

SECTION(".rodata.08B95C98")
const struct SelectInfo gSelectInfo_Attack = {
    .onInit = NewBattleForecast,
    .onEnd = (void *) AttackMapSelect_End,
    .onSwitchIn = AttackMapSelect_SwitchIn,
    .onSelect = AttackMapSelect_Select,
    .onCancel = AttackMapSelect_Cancel,
    .onHelp = (void *) StartBattleForecastHelpBox,
};

SECTION(".rodata.08B95CB8")
const struct SelectInfo gSelectInfo_Give = {
    .onInit = GiveSelection_OnInit,
    .onSwitchIn = GiveSelection_OnChange,
    .onSelect = GiveSelection_OnSelect,
    .onCancel = GenericSelection_BackToUM,
};

SECTION(".rodata.08B95CD8")
const struct SelectInfo gSelectInfo_Take = {
    .onInit = TakeSelection_OnInit,
    .onSwitchIn = TakeSelection_OnChange,
    .onSelect = TakeSelection_OnSelect,
    .onCancel = GenericSelection_BackToUM,
};

SECTION(".rodata.08B95CF8")
const struct SelectInfo gSelectInfo_Drop = {
    .onInit = DropSelection_OnConstruction,
    .onEnd = (void *) ClearUi,
    .onSelect = DropSelection_OnSelect,
    .onCancel = GenericSelection_BackToUM,
};

SECTION(".rodata.08B95D18")
const struct SelectInfo gSelectInfo_Rescue = {
    .onInit = RescueSelection_OnConstruction,
    .onSwitchIn = RescueSelection_OnChange,
    .onSelect = RescueSelection_OnSelect,
    .onCancel = GenericSelection_BackToUM,
    .onHelp = RescueSelection_OnHelp,
};
