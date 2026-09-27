#include "gbafe.h"
#include "gbafe/bmtrade.h"

void TradeMenu_InitUnitNameDisplay(struct TradeMenuProc * proc)
{
    char * str;
    int xStart;

    StartSysBrownBox(6, 0x4800, 0x08, 0x800, 0x400, proc);

    EnableSysBrownBox(0, -40, -1, 1);
    EnableSysBrownBox(1, 184, -1, 0);

    SetBlendConfig(1, 12, 6, 0);

    SetBlendTargetA(FALSE, FALSE, FALSE, FALSE, FALSE);
    SetBlendTargetB(TRUE, TRUE, TRUE, TRUE, TRUE);

    str = DecodeMsg(UNIT_NAME_ID(proc->units[0]));
    xStart = ((8 * UNIT_PANEL_WIDTH) - GetStringTextLen(str)) / 2;

    PutDrawText(NULL, gBg0Tm + TM_OFFSET(0, 0), 0, xStart, UNIT_PANEL_WIDTH, str);

    str = DecodeMsg(UNIT_NAME_ID(proc->units[1]));
    xStart = ((8 * UNIT_PANEL_WIDTH) - GetStringTextLen(str)) / 2;

    PutDrawText(NULL, gBg0Tm + TM_OFFSET(24, 0), 0, xStart, UNIT_PANEL_WIDTH, str);

    EnableBgSync(BG0_SYNC_BIT);
}

void TradeMenu_HighlightUpdater_OnInit(struct TradeMenuProc * proc)
{
    proc->hoverColumn = (u8) POS_INVALID;
}

void TradeMenu_HighlightUpdater_OnLoop(struct TradeMenuProc * proc)
{
    struct TradeMenuProc * tradeMenu = proc->proc_parent;

    if (proc->hoverColumn == tradeMenu->hoverColumn && proc->hoverRow == tradeMenu->hoverRow)
        return;

    if (proc->hoverColumn != (u8) POS_INVALID)
    {
        ClearUiItemHover(
            gTradeItemDisplayTileLocation[proc->hoverColumn][proc->hoverRow].x,
            gTradeItemDisplayTileLocation[proc->hoverColumn][proc->hoverRow].y,
            12);
    }

    DrawUiItemHover(
        gTradeItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].x,
        gTradeItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].y,
        12);

    proc->hoverColumn = tradeMenu->hoverColumn;
    proc->hoverRow = tradeMenu->hoverRow;
}

int TradeMenu_GetAdjustedRow(struct TradeMenuProc * proc, int col, int row)
{
    while (proc->hasItem[col][row] == 0 && row >= 0)
        row--;

    return row;
}

void TradeMenu_InitItemText(struct TradeMenuProc * proc)
{
    int col, row;

    for (col = 0; col < 2; ++col)
    {
        for (row = 0; row < UNIT_ITEM_COUNT; ++row)
        {
            InitTextDb(&gTradeMenuText[col][row], ITEM_PANEL_WIDTH);
        }
    }
}

void TradeMenu_RefreshItemText(struct TradeMenuProc * proc)
{
    u8 xLookup[] = { ITEM_PANEL_LEFT_X, ITEM_PANEL_RIGHT_X };
    u8 yLookup[] = { ITEM_PANEL_LEFT_Y, ITEM_PANEL_RIGHT_Y };

    int col, row;

    CpuFastFill(0, gBg0Tm + TM_OFFSET(0, 9), 11 * 0x20 * sizeof(u16));

    for (col = 0; col < 2; ++col)
    {
        for (row = 0; row < UNIT_ITEM_COUNT; ++row)
        {
            int item = proc->units[col]->items[row];

            ClearText(&gTradeMenuText[col][row]);

            if (item)
            {
                DrawItemMenuLine(&gTradeMenuText[col][row], item, IsItemDisplayUsable(proc->units[col], item),
                    gBg0Tm + TM_OFFSET(xLookup[col] + 1, yLookup[col] + row * 2 + 1));
            }
        }
    }

    EnableBgSync(BG0_SYNC_BIT);
}

void TradeMenu_RefreshSelectableCells(struct TradeMenuProc * proc)
{
    int col, row;

    for (col = 0; col < 2; ++col)
    {
        for (row = 0; row < UNIT_ITEM_COUNT; ++row)
        {
            u16 item = proc->units[col]->items[row];
            proc->hasItem[col][row] = (item ? TRUE : FALSE);
        }
    }

    proc->hasItem[0][UNIT_ITEM_COUNT] = 0;
    proc->hasItem[1][UNIT_ITEM_COUNT] = 0;
}

s8 TradeMenu_UpdateSelection(struct TradeMenuProc * proc)
{
    s8 changedSelection = FALSE;
    int newSelectedRow;

    if ((gpKeySt->repeated & DPAD_LEFT) && proc->hoverColumn == POS_R)
    {
        newSelectedRow = TradeMenu_GetAdjustedRow(proc, POS_L, proc->hoverRow);

        if (newSelectedRow < 0)
            goto end;

        proc->hoverColumn = POS_L;
        proc->hoverRow = newSelectedRow;

        changedSelection = TRUE;

        PlaySoundEffect(0x387);
    }

    if ((gpKeySt->repeated & DPAD_RIGHT) && proc->hoverColumn == POS_L)
    {
        newSelectedRow = TradeMenu_GetAdjustedRow(proc, POS_R, proc->hoverRow);

        if (newSelectedRow < 0)
            goto end;

        proc->hoverColumn = POS_R;
        proc->hoverRow = newSelectedRow;

        changedSelection = TRUE;

        PlaySoundEffect(0x387);
    }

    if ((gpKeySt->repeated & DPAD_UP))
    {
        if (proc->hoverRow == 0)
        {
            if (gpKeySt->repeated != gpKeySt->pressed)
                goto end;

            proc->hoverRow = TradeMenu_GetAdjustedRow(proc, proc->hoverColumn, UNIT_ITEM_COUNT - 1) + 1;
        }

        proc->hoverRow--;

        changedSelection = TRUE;

        PlaySoundEffect(0x386);
    }

    if ((gpKeySt->repeated & DPAD_DOWN))
    {
        if (!proc->hasItem[proc->hoverColumn][proc->hoverRow + 1])
        {
            if (gpKeySt->repeated != gpKeySt->pressed)
                goto end;

            proc->hoverRow = -1;
        }

        proc->hoverRow++;

        changedSelection = TRUE;

        PlaySoundEffect(0x386);
    }

end:
    return changedSelection;
}

void TradeMenu_ApplyItemSwap(struct TradeMenuProc * proc)
{
    u16 * pItemA = &proc->units[proc->hoverColumn]->items[proc->hoverRow];
    u16 * pItemB = &proc->units[proc->selectedColumn]->items[proc->selectedRow];

    u16 swp = *pItemA;
    *pItemA = *pItemB;
    *pItemB = swp;

    proc->hasTraded = TRUE;

    gActionSt.id = ACTION_TRADED;

    UnitRemoveInvalidItems(proc->units[0]);
    UnitRemoveInvalidItems(proc->units[1]);

    TradeMenu_RefreshItemText(proc);
}

void TradeMenu_InitItemDisplay(struct TradeMenuProc * proc)
{
    DrawUiFrame2(1,  8, 14, 12, 0);
    DrawUiFrame2(15, 8, 14, 12, 0);

    ResetTextFont();

    ClearIcons();
    ApplyIconPalettes(4);

    TradeMenu_InitItemText(proc);
    TradeMenu_RefreshItemText(proc);

    StartFace(0, GetUnitPortraitId(proc->units[0]), 64,  -4, 3);
    StartFace(1, GetUnitPortraitId(proc->units[1]), 176, -4, 2);

    SetFaceBlinkControlById(0, 5);
    SetFaceBlinkControlById(1, 5);

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);
}

void TradeMenu_OnInitUnselected(struct TradeMenuProc * proc)
{
    TradeMenu_RefreshSelectableCells(proc);
    proc->extraCellEnabled = FALSE;
}

void TradeMenu_OnLoopUnselected(struct TradeMenuProc * proc)
{
    if (TradeMenu_UpdateTutorial(proc))
    {
        PutUiHand(
            8 * gTradeItemDisplayTileLocation[proc->hoverColumn][proc->hoverRow].x,
            8 * gTradeItemDisplayTileLocation[proc->hoverColumn][proc->hoverRow].y);
    }
    else
    {
        TradeMenu_UpdateSelection(proc);

        PutUiHand(
            8 * gTradeItemDisplayTileLocation[proc->hoverColumn][proc->hoverRow].x,
            8 * gTradeItemDisplayTileLocation[proc->hoverColumn][proc->hoverRow].y);

        if (gpKeySt->pressed & A_BUTTON)
        {
            Proc_Goto(proc, L_TRADEMENU_SELECTED);
            PlaySoundEffect(0x38A);
        }
        else if (gpKeySt->pressed & B_BUTTON)
        {
            Proc_Goto(proc, L_TRADEMENU_END);
            PlaySoundEffect(0x38B);
        }
        else if (gpKeySt->pressed & R_BUTTON)
        {
            Proc_StartBlocking(ProcScr_TradeMenu_HelpBox, proc);
        }
    }
}

void TradeMenu_OnInitSelected(struct TradeMenuProc * proc)
{
    int lastRow;

    proc->selectedColumn = proc->hoverColumn;
    proc->selectedRow = proc->hoverRow;

    proc->hoverColumn = proc->hoverColumn ^ 1;

    lastRow = TradeMenu_GetAdjustedRow(proc, proc->hoverColumn, (UNIT_ITEM_COUNT - 1));

    if (lastRow != (UNIT_ITEM_COUNT - 1))
    {
        proc->hoverRow = lastRow + 1;
        proc->hasItem[proc->hoverColumn][proc->hoverRow] = TRUE;

        proc->extraCellEnabled = TRUE;

        proc->extraColumn = proc->hoverColumn;
        proc->extraRow = proc->hoverRow;
    }
}

void TradeMenu_OnLoopSelected(struct TradeMenuProc * proc)
{
    if (TradeMenu_UpdateTutorial(proc))
    {
        PutUiHand(
            8 * gTradeItemDisplayTileLocation[proc->hoverColumn][proc->hoverRow].x,
            8 * gTradeItemDisplayTileLocation[proc->hoverColumn][proc->hoverRow].y);

        DisplayFrozenUiHand(
            8 * gTradeItemDisplayTileLocation[proc->selectedColumn][proc->selectedRow].x,
            8 * gTradeItemDisplayTileLocation[proc->selectedColumn][proc->selectedRow].y);
    }
    else
    {
        TradeMenu_UpdateSelection(proc);

        PutUiHand(
            8 * gTradeItemDisplayTileLocation[proc->hoverColumn][proc->hoverRow].x,
            8 * gTradeItemDisplayTileLocation[proc->hoverColumn][proc->hoverRow].y);

        DisplayFrozenUiHand(
            8 * gTradeItemDisplayTileLocation[proc->selectedColumn][proc->selectedRow].x,
            8 * gTradeItemDisplayTileLocation[proc->selectedColumn][proc->selectedRow].y);

        if (gpKeySt->pressed & A_BUTTON)
        {
            TradeMenu_ApplyItemSwap(proc);

            PlaySoundEffect(0x38A);
            Proc_Break(proc);
        }
        else if (gpKeySt->pressed & B_BUTTON)
        {
            PlaySoundEffect(0x38B);
            Proc_Break(proc);
        }
        else if (gpKeySt->pressed & R_BUTTON)
        {
            Proc_StartBlocking(ProcScr_TradeMenu_HelpBox, proc);
        }
    }
}

void TradeMenu_OnEndSelected(struct TradeMenuProc * proc)
{
    proc->hoverColumn = proc->selectedColumn;
    proc->hoverRow = proc->selectedRow;

    TradeMenu_RefreshSelectableCells(proc);

    if (!proc->hasItem[proc->hoverColumn][0])
        proc->hoverColumn = proc->hoverColumn ^ 1;

    proc->hoverRow = TradeMenu_GetAdjustedRow(proc, proc->hoverColumn, proc->hoverRow);
}

s8 TradeMenu_LoadForcedInitialHover(struct TradeMenuProc * proc)
{
    if (gBmSt.unk_3F < 0)
        return TRUE;

    proc->hoverColumn = gBmSt.unk_3F / UNIT_ITEM_COUNT;
    proc->hoverRow = gBmSt.unk_3F % UNIT_ITEM_COUNT;

    TradeMenu_RefreshSelectableCells(proc);
    Proc_Goto(proc, L_TRADEMENU_SELECTED);

    return FALSE;
}

void TradeMenu_ClearDisplay(struct TradeMenuProc * proc)
{
    EndFaceById(0);
    EndFaceById(1);
}

void TradeMenu_HelpBox_OnInit(struct Proc * proc)
{
    struct TradeMenuProc * tradeMenu = proc->proc_parent;

    int item = tradeMenu->units[tradeMenu->hoverColumn]->items[tradeMenu->hoverRow];

    if (!item)
    {
        Proc_End(proc);
        return;
    }

    if (tradeMenu->extraCellEnabled)
        tradeMenu->hasItem[tradeMenu->extraColumn][tradeMenu->extraRow] = FALSE;

    LoadHelpBoxGfx(NULL, -1);

    StartItemHelpBox(
        8 * gTradeItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].x,
        8 * gTradeItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].y,
        item);

    gpKeySt->pressed = gpKeySt->pressed & ~(B_BUTTON | R_BUTTON);
}

void TradeMenu_HelpBox_OnLoop(struct Proc * proc)
{
    struct TradeMenuProc * tradeMenu = proc->proc_parent;

    s8 changedSelection = TradeMenu_UpdateSelection(tradeMenu);
    int item = tradeMenu->units[tradeMenu->hoverColumn]->items[tradeMenu->hoverRow];

    if (changedSelection)
    {
        StartItemHelpBox(
            8 * gTradeItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].x,
            8 * gTradeItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].y,
            item);
    }

    if (gpKeySt->pressed & (B_BUTTON | R_BUTTON))
        Proc_Break(proc);

    PutUiHand(
        8 * gTradeItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].x,
        8 * gTradeItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].y);

    if (tradeMenu->extraCellEnabled)
    {
        DisplayFrozenUiHand(
            8 * gTradeItemDisplayTileLocation[tradeMenu->selectedColumn][tradeMenu->selectedRow].x,
            8 * gTradeItemDisplayTileLocation[tradeMenu->selectedColumn][tradeMenu->selectedRow].y);
    }
}

void TradeMenu_HelpBox_OnEnd(struct Proc * proc)
{
    struct TradeMenuProc * tradeMenu = proc->proc_parent;

    if (tradeMenu->extraCellEnabled)
        tradeMenu->hasItem[tradeMenu->extraColumn][tradeMenu->extraRow] = TRUE;

    CloseHelpBox();

    PutUiHand(
        8 * gTradeItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].x,
        8 * gTradeItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].y);

    if (tradeMenu->extraCellEnabled)
    {
        DisplayFrozenUiHand(
            8 * gTradeItemDisplayTileLocation[tradeMenu->selectedColumn][tradeMenu->selectedRow].x,
            8 * gTradeItemDisplayTileLocation[tradeMenu->selectedColumn][tradeMenu->selectedRow].y);
    }
}

ProcPtr StartTradeMenu(struct Unit * lUnit, struct Unit * rUnit, int unused)
{
    struct TradeMenuProc * proc = Proc_Start(ProcScr_TradeMenu, PROC_TREE_3);

    proc->units[0] = lUnit;
    proc->units[1] = rUnit;

    proc->hasTraded = FALSE;

    proc->hoverColumn = POS_L;
    proc->hoverRow = 0;

    proc->tradeTutorialState = TRADE_TUT_NONE;

    gpTradeMenuProc = proc;

    if (sub_08079A5C())
    {
        SetkeyStIgnoredMask(A_BUTTON | START_BUTTON | DPAD_DOWN | DPAD_UP);
        proc->tradeTutorialState = TRADE_TUT_INIT;
    }

    if (GetUnitItemCount(lUnit) == 0)
        proc->hoverColumn = POS_R;
}

void SetTradeMenuTutStatus2(void)
{
    gpTradeMenuProc->tradeTutorialState = 2;
}

void SetTradeMenuTutStatus3(void)
{
    gpTradeMenuProc->tradeTutorialState = 3;
}

void SetTradeMenuTutStatus4()
{
    gpTradeMenuProc->tradeTutorialState = 4;
}

void SetTradeMenuTutStatus5(void)
{
    gpTradeMenuProc->tradeTutorialState = 5;
}

void SetTradeMenuTutStatus7(void)
{
    gpTradeMenuProc->tradeTutorialState = 7;
}

void SetTradeMenuTutStatus8(void)
{
    gpTradeMenuProc->tradeTutorialState = 8;
}

void TradeMenu_TutorialHandCursor_Update(void)
{
    struct TradeMenuProc * tradeMenu = gpTradeMenuProc;

    DisplayFrozenUiHand(
        8 * gTradeItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].x,
        8 * gTradeItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].y);
}

void TradeMenu_DoubleTutorialHandCursor_Update(void)
{
    struct TradeMenuProc * tradeMenu = gpTradeMenuProc;

    DisplayFrozenUiHand(
        8 * gTradeItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].x,
        8 * gTradeItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].y);

    DisplayFrozenUiHand(
        8 * gTradeItemDisplayTileLocation[tradeMenu->selectedColumn][tradeMenu->selectedRow].x,
        8 * gTradeItemDisplayTileLocation[tradeMenu->selectedColumn][tradeMenu->selectedRow].y);
}

void StartTradeMenuTutorialHandCursor(ProcPtr parent)
{
    Proc_Start(ProcScr_TradeMenu_TutorialHandCursor, parent);
}

void StartDoubleTradeMenuTutorialHandCursor(ProcPtr parent)
{
    Proc_Start(ProcScr_TradeMenu_DoubleTutorialHandCursor, parent);
}

void TradeMenu_TutorialWait_OnInit(struct TradeMenuProc * proc)
{
    proc->timer = 20;
}

void TradeMenu_TutorialWait_OnLoop(struct TradeMenuProc * proc)
{
    proc->timer--;

    if (proc->timer < 0)
        Proc_Break(proc);
}

void TradeMenuHandSTAL(ProcPtr ee)
{
    if (gpTradeMenuProc->tradeTutorialState != 3 && gpTradeMenuProc->tradeTutorialState != 5 && gpTradeMenuProc->tradeTutorialState != 8)
        Proc_StartBlocking(ProcScr_TradeMenu_TutorialWait, ee);
}

void CallTradeTutEventStart(struct TradeMenuProc * proc)
{
    if (proc->tradeTutorialState != TRADE_TUT_NONE)
        StartEventInternal(EventScr_TradeTutStart, proc);
}

void CallTradeTutEventSelectItem(struct TradeMenuProc * proc)
{
    StartEventInternal(EventScr_TradeTut_SelectItem, proc);
}

void CallTradeTutEventPressAtoGetItem(struct TradeMenuProc * proc)
{
    StartEventInternal(EventScr_TradeTut_PressAtoGetItem, proc);
}

void CallTradeTutEventDone(struct TradeMenuProc * proc)
{
    StartEventInternal(EventScr_TradeTutDone, proc);
}

s8 TradeMenu_UpdateTutorial(struct TradeMenuProc * proc)
{
    if (proc->tradeTutorialState != 4 && (gpKeySt->pressed == 0))
        return FALSE;

    switch (gpTradeMenuProc->tradeTutorialState)
    {

    case 2:
        if (gpKeySt->pressed & DPAD_RIGHT)
        {
            SetkeyStIgnoredMask(START_BUTTON | DPAD_UP | DPAD_DOWN);
            CallTradeTutEventSelectItem(proc);

            return FALSE;
        }

        PlaySoundEffect(0x38C);

        Proc_Goto(proc, L_TRADEMENU_LOADFORCED);

        return TRUE;

    case 3:
        if (!(gpKeySt->pressed & (B_BUTTON | DPAD_LEFT | R_BUTTON)))
        {
            if (!(gpKeySt->pressed & A_BUTTON))
                return FALSE;

            if (GetItemIndex(proc->units[proc->hoverColumn]->items[proc->hoverRow]) == ITEM_VULNERARY)
            {
                SetkeyStIgnoredMask(START_BUTTON | DPAD_UP | DPAD_DOWN);
                SetTradeMenuTutStatus4(proc);

                return FALSE;
            }
        }

        PlaySoundEffect(0x38C);

        CallTradeTutEventSelectItem(proc);

        return TRUE;

    case 5:
        if (gpKeySt->pressed & A_BUTTON)
        {
            CallTradeTutEventDone(proc);

            return FALSE;
        }

        PlaySoundEffect(0x38C);

        CallTradeTutEventPressAtoGetItem(proc);

        return TRUE;

    case 4:
        CallTradeTutEventPressAtoGetItem(proc);

        return TRUE;

    case 8:
        if (gpKeySt->pressed & B_BUTTON)
        {
            SetkeyStIgnoredMask(0);

            return FALSE;
        }

        PlaySoundEffect(0x38C);

        CallTradeTutEventDone(proc);

        return TRUE;

    default:
        return FALSE;

    }
}
