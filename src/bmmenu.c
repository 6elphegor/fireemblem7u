#include "gbafe.h"
#include "gbafe/bmmenu.h"

extern struct ProcCmd CONST_DATA ProcScr_Config_Field[];
extern u16 CONST_DATA EventScr_08B93DA4[];
extern const struct SelectInfo gSelectInfo_Rescue;
extern const struct SelectInfo gSelectInfo_Drop;
extern const struct SelectInfo gSelectInfo_Take;
extern const struct SelectInfo gSelectInfo_Give;
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

ASM_FUNC("asm/nonmatching/code_08021A3C.s");
ASM_FUNC("asm/nonmatching/code_08021A98.s");
ASM_FUNC("asm/nonmatching/code_08021AE4.s");
ASM_FUNC("asm/nonmatching/code_08021B34.s");
ASM_FUNC("asm/nonmatching/code_08021B9C.s");
ASM_FUNC("asm/nonmatching/code_08021BA8.s");
ASM_FUNC("asm/nonmatching/code_08021BF4.s");
ASM_FUNC("asm/nonmatching/code_08021C38.s");
ASM_FUNC("asm/nonmatching/code_08021C88.s");
ASM_FUNC("asm/nonmatching/code_08021CDC.s");
ASM_FUNC("asm/nonmatching/code_08021CF4.s");
ASM_FUNC("asm/nonmatching/code_08021D28.s");
ASM_FUNC("asm/nonmatching/code_08021D44.s");
ASM_FUNC("asm/nonmatching/code_08021D54.s");
ASM_FUNC("asm/nonmatching/code_08021D68.s");
ASM_FUNC("asm/nonmatching/code_08021DEC.s");
ASM_FUNC("asm/nonmatching/code_08021E10.s");
ASM_FUNC("asm/nonmatching/code_08021E64.s");
ASM_FUNC("asm/nonmatching/code_08021E88.s");
ASM_FUNC("asm/nonmatching/code_08021EB8.s");
ASM_FUNC("asm/nonmatching/code_08021EFC.s");
ASM_FUNC("asm/nonmatching/code_08021F1C.s");
ASM_FUNC("asm/nonmatching/code_08021F8C.s");
ASM_FUNC("asm/nonmatching/code_08021FB4.s");
ASM_FUNC("asm/nonmatching/code_0802201C.s");
ASM_FUNC("asm/nonmatching/code_08022058.s");
ASM_FUNC("asm/nonmatching/code_08022094.s");
ASM_FUNC("asm/nonmatching/code_08022168.s");
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
