#include "gbafe.h"
#include "gbafe/bmmap.h"
#include "gbafe/bmidoten.h"
#include "gbafe/playerphase.h"
#include "gbafe/bmpatharrowdisp.h"
#include "gbafe/prep_sallycursor.h"

void PlayerPhase_Suspend(void)
{
    gActionSt.suspend_point = SUSPEND_POINT_PLAYER_PHASE;
    WriteSuspendSave(3);
}

void HandlePlayerMapCursor(void)
{
    if ((gpKeySt->held & B_BUTTON) && !(gBmSt.cursor_sprite.x & 7) && !(gBmSt.cursor_sprite.y & 7))
    {
        HandleMapCursorInput(gpKeySt->pressed2);

        HandleMoveMapCursor(8);
        HandleMoveCameraWithMapCursor(8);
    }
    else
    {
        HandleMapCursorInput(gpKeySt->repeated);

        HandleMoveMapCursor(4);
        HandleMoveCameraWithMapCursor(4);
    }

    if (((gBmSt.cursor_sprite.x | gBmSt.cursor_sprite.y) & 0xF) != 0)
        gpKeySt->pressed &= ~(A_BUTTON | B_BUTTON | START_BUTTON | R_BUTTON | L_BUTTON);
}

bool CanShowUnitStatScreen(struct Unit * unit)
{
    if (unit->pClassData->number != 0x49 && unit->pCharacterData->number != 0x9E)
        return TRUE;

    return FALSE;
}

void PlayerPhase_IdleLoop(ProcPtr proc)
{
    HandlePlayerMapCursor();

    if (gpKeySt->pressed & L_BUTTON)
    {
        TrySwitchViewedUnit(gBmSt.cursor.x, gBmSt.cursor.y);
        PlaySoundEffect(0x38B);
    }
    else if (!IsMapFadeActive())
    {
        if ((gpKeySt->pressed & R_BUTTON) && (gBmMapUnit[gBmSt.cursor.y][gBmSt.cursor.x] != 0))
        {
            if (CanShowUnitStatScreen(GetUnit(gBmMapUnit[gBmSt.cursor.y][gBmSt.cursor.x])))
            {
                EndAllMus();

                EndPlayerPhaseSideWindows();
                SetStatScreenExcludedUnitFlags(0x1F);

                StartStatScreen(GetUnit(gBmMapUnit[gBmSt.cursor.y][gBmSt.cursor.x]), proc);

                Proc_Goto(proc, 5);

                return;
            }
        }

        if (gpKeySt->pressed & A_BUTTON)
        {
            struct Unit * unit = GetUnit(gBmMapUnit[gBmSt.cursor.y][gBmSt.cursor.x]);

            switch (GetPlayerSelectKind(unit))
            {
            case PLAYER_SELECT_NOUNIT:
            case PLAYER_SELECT_TURNENDED:
                EndPlayerPhaseSideWindows();

                gPlaySt.xCursor = gBmSt.cursor.x;
                gPlaySt.yCursor = gBmSt.cursor.y;

                if (unit)
                {
                    EndAllMus();
                    ShowUnitSprite(unit);
                }

                StartAdjustedMenu(&gMapMenuDef, gBmSt.cursor_sprite_target.x - gBmSt.camera.x, 1, 0x17);
                sub_080790C0();

                Proc_Goto(proc, 9);

                return;

            case PLAYER_SELECT_CONTROL:
                UnitBeginAction(unit);
                PidStatsAddActAmt(gActiveUnit->pCharacterData->number);

                Proc_Break(proc);

                break;

            case PLAYER_SELECT_NOCONTROL:
                UnitBeginAction(unit);
                gBmSt.swap_action_range_count = 0;

                Proc_Goto(proc, 11);

                break;

            default:
                goto else_stmt;
            }
        }
        else
        {
else_stmt:
            if ((gpKeySt->pressed & SELECT_BUTTON) && (gpKeySt->held == SELECT_BUTTON) &&
                gPlaySt.chapterModeIndex == 1 && !(gPlaySt.chapterStateBits & PLAY_FLAG_HARD))
            {
                struct Unit * unit = GetUnit(gBmMapUnit[gBmSt.cursor.y][gBmSt.cursor.x]);

                if (unit)
                {
                    EndAllMus();
                    ShowUnitSprite(unit);
                }

                EndPlayerPhaseSideWindows();
                sub_08032770(proc);

                Proc_Goto(proc, 9);

                return;
            }
            else if ((gpKeySt->pressed & START_BUTTON) && !(gpKeySt->held & SELECT_BUTTON))
            {
                struct Unit * unit = GetUnit(gBmMapUnit[gBmSt.cursor.y][gBmSt.cursor.x]);

                if (unit)
                {
                    EndAllMus();
                    ShowUnitSprite(unit);
                }

                EndPlayerPhaseSideWindows();
                StartMinimapPlayerPhase();

                Proc_Goto(proc, 9);

                return;
            }
        }
    }

    UnitSpriteHoverUpdate();

    PutMapCursor(
        gBmSt.cursor_sprite.x, gBmSt.cursor_sprite.y,
        IsUnitSpriteHoverEnabledAt(gBmSt.cursor.x, gBmSt.cursor.y) ? 3 : 0);
}

void DisplayUnitEffectRange(struct Unit * unit)
{
    int flags = LIMITVIEW_BLUE;

    MapFloodUnitMovement(gActiveUnit, UNIT_MOV(gActiveUnit) - gActionSt.move_count);

    if (!(gActiveUnit->state & US_HAS_MOVED))
    {
        BmMapFill(gBmMapOther, 0);

        if (UnitHasMagicRank(unit))
            GenerateMagicSealMap(1);

        BmMapFill(gBmMapRange, 0);

        switch (GetUnitWeaponUsabilityBits(gActiveUnit))
        {
        case 3:
            if (gBmSt.swap_action_range_count & 1)
            {
                GenerateUnitCompleteStaffRange(gActiveUnit);
                flags = LIMITVIEW_GREEN | LIMITVIEW_BLUE;
            }
            else
            {
                GenerateUnitCompleteAttackRange(gActiveUnit);
                flags = LIMITVIEW_RED | LIMITVIEW_BLUE;
            }

            break;

        case 2:
            GenerateUnitCompleteStaffRange(gActiveUnit);
            flags = LIMITVIEW_GREEN | LIMITVIEW_BLUE;

            break;

        case 1:
            GenerateUnitCompleteAttackRange(gActiveUnit);
            flags = LIMITVIEW_RED | LIMITVIEW_BLUE;

            break;
        }
    }

    DisplayMoveRangeGraphics(flags);
}

void PlayerPhase_InitUnitMovementSelect(void)
{
    if (!MuExists())
    {
        if (UNIT_FACTION(gActiveUnit) == gPlaySt.faction)
        {
            if ((gActiveUnit->statusIndex != UNIT_STATUS_SLEEP) && (gActiveUnit->statusIndex != UNIT_STATUS_BERSERK))
            {
                StartMu(gActiveUnit);
                HideUnitSprite(gActiveUnit);
            }
        }
    }

    MU_SetDefaultFacing_Auto();
    sub_08078FC8();

    gBmSt.flags |= BM_FLAG_1;

    DisplayUnitEffectRange(gActiveUnit);

    if ((gActiveUnit->xPos == gBmSt.cursor.x) && (gActiveUnit->yPos == gBmSt.cursor.y))
    {
        PathArrowDisp_Init(0);
        PlaySoundEffect(0x389);
        return;
    }

    PathArrowDisp_Init(1);
}

void DisplayActiveUnitEffectRange(ProcPtr proc)
{
    PlaySoundEffect(0x388);

    gBmSt.flags &= ~BM_FLAG_1;
    DisplayUnitEffectRange(gActiveUnit);
}

void PlayerPhase_DisplayDangerZone(void)
{
    GenerateDangerZoneRange(gBmSt.swap_action_range_count & 1);

    BmMapFill(gBmMapMovement, -1);

    PlaySoundEffect(0x388);

    gBmSt.flags |= BM_FLAG_3;
    gBmSt.flags &= ~BM_FLAG_1;

    if (gBmSt.swap_action_range_count & 1)
        DisplayMoveRangeGraphics(5);
    else
        DisplayMoveRangeGraphics(3);
}

void PlayerPhase_RangeDisplayIdle(ProcPtr proc)
{
    enum
    {
        ACT_FAIL = 0,
        ACT_MOVE = 1,
        ACT_CANCEL = 2,
        ACT_INFOSCREEN = 3,
        ACT_RESET_CURSOR = 4,
        ACT_EVENT = 5,
        ACT_SWAP_RANGES = 6,
    };

    u8 uid;
    u8 action = -1;

    HandlePlayerMapCursor();

    if (gpKeySt->pressed & A_BUTTON)
    {
        if (!gActiveUnit)
        {
            if (GetCombinedEnemyWeaponUsabilityBits() == 3)
                action = ACT_SWAP_RANGES;
            else
                action = ACT_CANCEL;
        }
        else if (sub_0807905C())
        {
            action = ACT_EVENT;
        }
        else
        {
            if ((GetPlayerSelectKind(gActiveUnit) != PLAYER_SELECT_CONTROL) && !(gActiveUnit->state & US_HAS_MOVED))
            {
                if (GetUnitWeaponUsabilityBits(gActiveUnit) == 3)
                    action = ACT_SWAP_RANGES;
                else
                    action = ACT_CANCEL;
            }
            else if (!CanMoveActiveUnitTo(gBmSt.cursor.x, gBmSt.cursor.y))
            {
                action = ACT_FAIL;
            }
            else
            {
                action = ACT_MOVE;
                goto else_stmt;
            }
        }
    }
    else
    {
else_stmt:
        if (gpKeySt->pressed & B_BUTTON)
        {
            if (gActiveUnit->state & US_HAS_MOVED)
                action = ACT_FAIL;
            else
                action = ACT_CANCEL;
        }
        else if (gpKeySt->pressed & R_BUTTON)
        {
            action = ACT_INFOSCREEN;
        }
        else if (gpKeySt->pressed & L_BUTTON)
        {
            action = ACT_RESET_CURSOR;
        }
    }

    switch (action)
    {
    case ACT_FAIL:
        PlaySoundEffect(0x38C);

        break;

    case ACT_MOVE:
        EnsureCameraOntoPosition(proc, gActiveUnitMoveOrigin.x, gActiveUnitMoveOrigin.y);
        HideMoveRangeGraphics();
        Proc_Break(proc);

        return;

    case ACT_CANCEL:
        if (gActiveUnit)
        {
            EndAllMus();

            gActiveUnit->state &= ~US_HIDDEN;

            if (UNIT_FACTION(gActiveUnit) == 0)
            {
                EnsureCameraOntoPosition(proc, gActiveUnitMoveOrigin.x, gActiveUnitMoveOrigin.y);
                SetMapCursorPosition(gActiveUnitMoveOrigin.x, gActiveUnitMoveOrigin.y);
            }
        }

        gBmSt.flags &= ~BM_FLAG_3;

        HideMoveRangeGraphics();

        RefreshEntityMaps();
        RefreshUnitSprites();

        PlaySoundEffect(0x38B);

        Proc_Goto(proc, 9);

        return;

    case ACT_INFOSCREEN:
        if (Proc_Find(gProcScr_EventEngine))
            break;

        uid = gBmMapUnit[gBmSt.cursor.y][gBmSt.cursor.x];

        if ((gActiveUnitMoveOrigin.x == gBmSt.cursor.x) && (gActiveUnitMoveOrigin.y == gBmSt.cursor.y))
            uid = gActiveUnit->index;

        if (uid == 0)
            break;

        if (!CanShowUnitStatScreen(GetUnit(uid)))
            break;

        EndAllMus();
        SetStatScreenExcludedUnitFlags(0x1F);
        StartStatScreen(GetUnit(uid), proc);

        Proc_Goto(proc, 6);

        return;

    case ACT_RESET_CURSOR:
        if (!gActiveUnit)
            break;

        EnsureCameraOntoPosition(proc, gActiveUnitMoveOrigin.x, gActiveUnitMoveOrigin.y);
        SetMapCursorPosition(gActiveUnitMoveOrigin.x, gActiveUnitMoveOrigin.y);
        PlaySoundEffect(0x38B);

        break;

    case ACT_EVENT:
        break;

    case ACT_SWAP_RANGES:
        gBmSt.swap_action_range_count++;

        HideMoveRangeGraphics();

        if (gBmSt.flags & BM_FLAG_3)
            Proc_Goto(proc, 12);
        else
            Proc_Goto(proc, 11);

        break;
    }

    if (GetPlayerSelectKind(gActiveUnit) == PLAYER_SELECT_CONTROL)
        DrawUpdatedPathArrow();

    PutMapCursor(gBmSt.cursor_sprite.x, gBmSt.cursor_sprite.y, 1);
}

void PlayerPhase_CancelAction(ProcPtr proc)
{
    gActionSt.id = ACTION_NONE;
    Proc_Goto(proc, 2);
}

void PlayerPhase_BackToMove(ProcPtr proc)
{
    gActiveUnit->xPos = gActiveUnitMoveOrigin.x;
    gActiveUnit->yPos = gActiveUnitMoveOrigin.y;

    UnitSyncMovement(gActiveUnit);

    gActiveUnit->state &= ~US_HIDDEN;

    RefreshEntityMaps();
    RenderMap();
    RefreshUnitSprites();

    if (!(gActiveUnit->state & US_HAS_MOVED))
        UnitBeginAction(gActiveUnit);
    else
        UnitBeginCantoAction(gActiveUnit);

    HideUnitSprite(gActiveUnit);
    EndAllMus();
    StartMu(gActiveUnit);

    Proc_Goto(proc, 1);
}

s8 PlayerPhase_PrepareAction(ProcPtr proc)
{
    s8 cameraReturn;

    cameraReturn = EnsureCameraOntoPosition(
        proc, GetUnit(gActionSt.instigator)->xPos, GetUnit(gActionSt.instigator)->yPos);
    cameraReturn ^= 1;

    switch (gActionSt.id)
    {
    case ACTION_NONE:
        if (gBmSt.partial_actions_taken != 0)
        {
            gActionSt.id = ACTION_1C;
            break;
        }

        PlayerPhase_BackToMove(proc);

        return 1;

    case ACTION_TRADED:
        gBmSt.partial_actions_taken |= 2;
        PlayerPhase_CancelAction(proc);

        return 1;

    case ACTION_TRADED_SUPPLY:
        gBmSt.partial_actions_taken |= 4;
        PlayerPhase_CancelAction(proc);

        return 1;

    case ACTION_TAKE:
    case ACTION_GIVE:
        gBmSt.partial_actions_taken |= 1;
        PlayerPhase_CancelAction(proc);

        return 1;

    case 0x1E:
    case 0x1F:
        gBmSt.partial_actions_taken |= 8;
        PlayerPhase_CancelAction(proc);

        return 1;

    case ACTION_TRADED_NOCHANGES:
        PlayerPhase_CancelAction(proc);

        return 1;
    }

    if ((gActionSt.id != ACTION_WAIT) && !gBmSt.just_resumed)
    {
        gActionSt.suspend_point = SUSPEND_POINT_DURING_ACTION;
        WriteSuspendSave(3);
    }

    return cameraReturn;
}

bool TryMakeCantoUnit(ProcPtr proc)
{
    if (!(UNIT_CATTRIBUTES(gActiveUnit) & CA_CANTO))
        return FALSE;

    if (gActiveUnit->state & (US_DEAD | US_HAS_MOVED | US_BIT16))
        return FALSE;

    if ((u8) (gActionSt.id - ACTION_COMBAT) <= 1)
        return FALSE;

    if (UNIT_MOV(gActiveUnit) <= gActionSt.move_count)
        return FALSE;

    if (!CanActiveUnitStillMove())
        return FALSE;

    BmMapFill(gBmMapRange, 0);

    UnitBeginCantoAction(gActiveUnit);

    gActiveUnit->state |= US_HAS_MOVED;
    gActiveUnit->state &= ~US_UNSELECTABLE;

    EndAllMus();
    StartMu(gActiveUnit);
    MU_SetDefaultFacing_Auto();

    if (gPlaySt.chapterVisionRange != 0)
        Proc_Goto(proc, 4);
    else
        Proc_Goto(proc, 1);

    return TRUE;
}

bool RunPotentialWaitEvents(void)
{
    if (CheckForWaitEvents())
    {
        RunWaitEvents();
        return FALSE;
    }

    return TRUE;
}

bool EnsureCameraOntoActiveUnitPosition(ProcPtr proc)
{
    return !EnsureCameraOntoPosition(proc, gActiveUnit->xPos, gActiveUnit->yPos);
}

void PlayerPhase_FinishAction(ProcPtr proc)
{
    if (gPlaySt.chapterVisionRange != 0)
    {
        RenderMapForFade();

        MoveActiveUnit(gActionSt.x_move, gActionSt.y_move);

        RefreshEntityMaps();
        RenderMap();

        StartMapFade(0);

        RefreshUnitSprites();
    }
    else
    {
        MoveActiveUnit(gActionSt.x_move, gActionSt.y_move);

        RefreshEntityMaps();
        RenderMap();
    }

    SetMapCursorPosition(gActiveUnit->xPos, gActiveUnit->yPos);

    gPlaySt.xCursor = gBmSt.cursor.x;
    gPlaySt.yCursor = gBmSt.cursor.y;

    if (TryMakeCantoUnit(proc))
    {
        HideUnitSprite(gActiveUnit);
        return;
    }

    if (ShouldCallEndEvent())
    {
        EndAllMus();

        RefreshEntityMaps();
        RenderMap();
        RefreshUnitSprites();

        MaybeCallEndEvent_();

        Proc_Goto(proc, 8);

        return;
    }

    EndAllMus();
}

void sub_0801CD50(void)
{
    if (gPlaySt.faction == FACTION_BLUE)
    {
        MoveActiveUnit(gActionSt.x_move, gActionSt.y_move);
        RefreshEntityMaps();
        RenderMap();
        RefreshUnitSprites();
        EndAllMus();
    }
}

void sub_0801CD80(ProcPtr proc)
{
    if (gActionSt.id != ACTION_TRAPPED)
        StartSemiCenteredOrphanMenu(&gUnitActionMenuDef, gBmSt.cursor_sprite_target.x - gBmSt.camera.x, 1, 0x16);

    Proc_Break(proc);
}

void PlayerPhase_ApplyUnitMovement(ProcPtr proc)
{
    gActiveUnit->xPos = gActionSt.x_move;
    gActiveUnit->yPos = gActionSt.y_move;

    UnitSyncMovement(gActiveUnit);

    if ((!(gActiveUnit->state & US_HAS_MOVED) && (gActionSt.id == ACTION_NONE)) && (gBmSt.partial_actions_taken == 0))
        gActionSt.move_count = gBmMapMovement[gActionSt.y_move][gActionSt.x_move];

    ResetTextFont();

    if (sub_08079004() == 1)
    {
        Proc_SetRepeatCb(proc, sub_0801CD80);
        return;
    }

    if (gActionSt.id != ACTION_TRAPPED)
        StartSemiCenteredOrphanMenu(&gUnitActionMenuDef, gBmSt.cursor_sprite_target.x - gBmSt.camera.x, 1, 0x16);

    Proc_Break(proc);
}

int GetPlayerSelectKind(struct Unit * unit)
{
    u8 faction = gPlaySt.faction;

    if (!unit)
        return PLAYER_SELECT_NOUNIT;

    if (gBmSt.flags & BM_FLAG_4)
    {
        if (!CanCharacterBePrepMoved(unit->pCharacterData->number))
            return PLAYER_SELECT_4;

        faction = FACTION_BLUE;
    }

    if (!unit)
        return PLAYER_SELECT_NOUNIT;

    if (UNIT_FACTION(unit) != faction)
        return PLAYER_SELECT_NOCONTROL;

    if (unit->state & US_UNSELECTABLE)
        return PLAYER_SELECT_TURNENDED;

    if (UNIT_CATTRIBUTES(unit) & CA_UNSELECTABLE)
        return PLAYER_SELECT_TURNENDED;

    if ((unit->statusIndex != UNIT_STATUS_SLEEP) && (unit->statusIndex != UNIT_STATUS_BERSERK))
        return PLAYER_SELECT_CONTROL;

    return PLAYER_SELECT_NOCONTROL;
}

bool CanMoveActiveUnitTo(int x, int y)
{
    struct Trap * trap;

    if (gBmMapUnit[y][x] != 0)
        return FALSE;

    if (gBmMapMovement[y][x] >= MAP_MOVEMENT_MAX)
        return FALSE;

    if (!(gActiveUnit->state & US_IN_BALLISTA))
        return TRUE;

    trap = GetTrapAt(x, y);

    if ((x == gActiveUnitMoveOrigin.x) && (y == gActiveUnitMoveOrigin.y))
        return TRUE;

    if (!trap)
        return TRUE;

    if (trap->type != TRAP_BALLISTA)
        return TRUE;

    return FALSE;
}

void PlayerPhase_DisplayUnitMovement(void)
{
    GetMovementScriptFromPath();
    UnitApplyWorkingMovementScript(gActiveUnit, gActiveUnit->xPos, gActiveUnit->yPos);
    SetAutoMuMoveScript(gWorkingMoveScr);
}

void PlayerPhase_WaitForUnitMovement(ProcPtr proc)
{
    if (!MuExistsActive())
        Proc_Break(proc);
}

void PlayerPhase_ResumeRangeDisplay(ProcPtr proc)
{
    if (!gActiveUnit)
    {
        RefreshBMapGraphics();
        Proc_Goto(proc, 12);
        return;
    }

    gBmMapUnit[gActiveUnit->yPos][gActiveUnit->xPos] = gActiveUnit->index;
    gActiveUnit->state &= ~US_HIDDEN;

    RefreshBMapGraphics();

    gBmMapUnit[gActiveUnit->yPos][gActiveUnit->xPos] = 0;
    gActiveUnit->state |= US_HIDDEN;

    switch (GetPlayerSelectKind(gActiveUnit))
    {
    case PLAYER_SELECT_CONTROL:
        HideUnitSprite(gActiveUnit);
        break;

    case PLAYER_SELECT_NOCONTROL:
        Proc_Goto(proc, 11);
        break;
    }
}

void PlayerPhase_ReReadGameSaveGfx(void)
{
    RefreshBMapGraphics();
    SetBlendNone();
}

void MoveLimitViewChange_OnInit(struct MoveLimitViewProc * proc)
{
    RegisterDataMove(Img_LimitViewSquare, (u8 *) VRAM + 0x5080, 0x80);

    if (!(gBmSt.flags & BM_FLAG_0))
    {
        proc->unk_4C = 2;
    }
    else
    {
        RegisterDataMove(Img_LimitViewSquare, (u8 *) VRAM + 0x5000, 0x80);
        Proc_End(proc);
    }
}

void MoveLimitViewChange_OnLoop(struct MoveLimitViewProc * proc)
{
    RegisterDataMove(gOpenLimitViewImgLut[proc->unk_4C], (u8 *) VRAM + 0x5000, 0x80);

    proc->unk_4C++;

    if (proc->unk_4C == 8)
        Proc_Break(proc);
}

void MoveLimitView_OnInit(ProcPtr proc)
{
    int ix;
    int iy;

    SetWinEnable(0, 0, 0);

    gBmSt.flags |= BM_FLAG_0;
    RenderMap();

    for (iy = 9; iy >= 0; --iy)
    {
        for (ix = 14; ix >= 0; --ix)
        {
            s16 xOrigin = gBmSt.map_render_anchor.x;
            s16 yOrigin = gBmSt.map_render_anchor.y;

            PutLimitViewSquare(gBg2Tm, xOrigin + ix, yOrigin + iy, ix, iy);
        }
    }

    EnableBgSync(BG2_SYNC_BIT);
    SetBgOffset(2, 0, 0);

    SetBlendAlpha(10, 6);

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendBackdropA(0);

    SetBlendTargetB(0, 0, 0, 1, 1);
    SetBlendBackdropB(1);

    InitBmBgLayers();
}

void MoveLimitView_OnLoop(struct MoveLimitViewProc * proc)
{
    int frame = (GetGameTime() / 2) & 31;

    if (proc->flags & LIMITVIEW_BLUE)
        ApplyPaletteExt(Pal_LimitViewBlue + frame, 0x82, 0x20);

    if (proc->flags & LIMITVIEW_RED)
        ApplyPaletteExt(Pal_LimitViewRed + frame, 0xA2, 0x20);

    if (proc->flags & LIMITVIEW_GREEN)
        ApplyPaletteExt(Pal_LimitViewGreen + frame, 0xA2, 0x20);

    if (proc->flags & LIMITVIEW_UNK)
        ApplyPaletteExt(Pal_LimitViewBlue + frame, 0xA2, 0x20);
}

void MoveLimitView_OnEnd(struct MoveLimitViewProc * proc)
{
    if ((proc->flags & (LIMITVIEW_BLUE | LIMITVIEW_UNK)) != 0)
    {
        TmFill(gBg2Tm, 0);
        EnableBgSync(BG2_SYNC_BIT);
    }

    gBmSt.flags &= ~(BM_FLAG_0 | BM_FLAG_1);

    InitBmBgLayers();
}

void DisplayMoveRangeGraphics(int flags)
{
    struct MoveLimitViewProc * proc = Proc_Find(sProcScr_MoveLimitView);

    if (proc)
    {
        MoveLimitView_OnInit(proc);
        MoveLimitViewChange_OnInit(NULL);

        return;
    }

    proc = Proc_Start(sProcScr_MoveLimitView, PROC_TREE_4);
    proc->flags = flags;
}

void HideMoveRangeGraphics(void)
{
    Proc_EndEach(sProcScr_MoveLimitView);
}

bool TrySetCursorOn(int unitId)
{
    ProcPtr proc;

    struct Unit * unit = GetUnit(unitId);

    if (!UNIT_IS_VALID(unit))
        return FALSE;

    if (unit->state & (US_HIDDEN | US_UNSELECTABLE | US_DEAD | US_BIT16))
        return FALSE;

    if (unit->statusIndex == UNIT_STATUS_BERSERK || unit->statusIndex == UNIT_STATUS_SLEEP)
        return FALSE;

    proc = Proc_Find(ProcScr_PlayerPhase);

    if (!proc)
        proc = Proc_Find(ProcScr_SALLYCURSOR);

    EnsureCameraOntoPosition(proc, unit->xPos, unit->yPos);
    SetMapCursorPosition(unit->xPos, unit->yPos);

    return TRUE;
}

void TrySwitchViewedUnit(int x, int y)
{
    int i;

    int unitId = gBmMapUnit[y][x];

    if ((unitId & 0xC0) != FACTION_BLUE)
        unitId = 0;

    unitId++;

    for (i = unitId; i < 0x3F; ++i)
    {
        if (TrySetCursorOn(i))
            return;
    }

    for (i = 1; i <= unitId; ++i)
    {
        if (TrySetCursorOn(i))
            return;
    }
}

void PlayerPhase_HandleAutoEnd(ProcPtr proc)
{
    if (!(gPlaySt.cfgDisableAutoEndTurns) && (CountFactionMoveableUnits(gPlaySt.faction) == 0))
        Proc_Goto(proc, 3);
}
