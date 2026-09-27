#include "gbafe.h"

int EvtCmd_Sleep(struct EventProc * proc)
{
    // script[1]: duration

    int duration = SCR_HI16(proc->script[0]);

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
        return EVENT_CMDRET_CONTINUE;

    if (duration > 0)
        duration--;

    proc->sleep_duration = duration;
    proc->unk_4E = 0;

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_SleepFast(struct EventProc * proc)
{
    // script[1]: duration

    int duration = SCR_HI16(proc->script[0]);

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
        return EVENT_CMDRET_CONTINUE;

    if (duration > 0)
        duration--;

    proc->sleep_duration = duration;
    proc->unk_4E = 1;

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_SleepText(struct EventProc * proc)
{
    // script[1]: duration

    int duration = SCR_HI16(proc->script[0]);

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
        return EVENT_CMDRET_CONTINUE;

    if ((proc->flags & EVENT_FLAG_TEXTSKIPPED) != 0)
        return EVENT_CMDRET_CONTINUE;

    if (duration > 0)
        duration--;

    proc->sleep_duration = duration;

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_Background(struct EventProc * proc)
{
    // script[1]: background

    int background = SCR_HI16(proc->script[0]);

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
        return EVENT_CMDRET_CONTINUE;

    if (proc->background == -1)
    {
        LockBmDisplay();
        LockMus();
    }

    DisplayBackground(background);
    proc->background = background;

    SetDispEnable(1, 1, 1, 1, 1);

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_BackgroundLynModeDeath(struct EventProc * proc)
{
    int background = GetChapterInfo(gPlaySt.chapterIndex)->default_background;

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
        return EVENT_CMDRET_CONTINUE;

    if (!GetLynModeDeathFlag())
    {
        OverrideBgm(0x2C);
        SetLynModeDeathFlag();
    }

    if (proc->background == -1)
    {
        LockBmDisplay();
        LockMus();
    }

    DisplayBackground(background);
    proc->background = background;

    SetDispEnable(1, 1, 1, 1, 1);

    return EVENT_CMDRET_YIELD;
}


int EvtCmd_BackgroundRandom(struct EventProc * proc)
{
    int background;

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
        return EVENT_CMDRET_CONTINUE;

    background = RandNextB() % NUM_BACKGROUNDS;

    DisplayBackground(background);
    proc->background = background;

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_BackgroundMore(struct EventProc * proc)
{
    // script[1]: background

    int background = SCR_HI16(proc->script[0]);

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
        return EVENT_CMDRET_CONTINUE;

    if (proc->background == -1)
    {
        LockBmDisplay();
        LockMus();
    }

    DisplayBackgroundNoClear(background);
    proc->background = background;

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_ClearTalk(struct EventProc * proc)
{
    if (proc->background == -1)
    {
        EventClearTalkDisplayed(proc);
        SetDispEnable(1, 1, 1, 1, 1);

        return EVENT_CMDRET_YIELD;
    }

    Event_FadeOutOfBackgroundTalk(proc);
    proc->background = -1;

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_ClearSkip(struct EventProc * proc)
{
    if (proc->script_return != NULL)
        return EVENT_CMDRET_CONTINUE;

    if ((proc->flags & EVENT_FLAG_SKIPPED) == 0)
        return EVENT_CMDRET_CONTINUE;

    if ((proc->flags & EVENT_FLAG_ENDMAPMAIN) == 0)
    {
        Event_FadeOutOfSkip(proc);
        proc->background = -1;
    }

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_ClearSkipFadeToPrep(struct EventProc * proc)
{
    if (proc->background != -1)
    {
        UnlockBmDisplay();
        ReleaseMus();
    }

    if (proc->unk_4D)
    {
        if (!GetChapterInfo(gPlaySt.chapterIndex)->has_prep)
            Event_FadeOutOfSkip(proc);
    }
    else
    {
        if (proc->background == -1)
        {
            if (GetChapterInfo(gPlaySt.chapterIndex)->has_prep)
                StartMidLockingFadeToBlack(proc);
        }
        else
        {
            if (!GetChapterInfo(gPlaySt.chapterIndex)->has_prep)
                Event_FadeOutOfSkip(proc);
        }
    }

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_FadeFromOpening(struct EventProc * proc)
{
    LockBmDisplay();
    LockMus();

    Event_FadeOutOfBackgroundTalk(proc);
    proc->background = -1;

    return EVENT_CMDRET_YIELD;
}

void DisplayBackground(int background)
{
    ClearTalk();

    SetBgOffset(0, 0, 0);
    SetBgOffset(1, 0, 0);
    SetBgOffset(2, 0, 0);
    SetBgOffset(3, 0, 0);

    Decompress(gBackgroundTable[background].img, (void *)BG_VRAM + GetBgChrOffset(3));
    TmApplyTsa(gBg3Tm, gBackgroundTable[background].tsa, OAM2_PAL(BGPAL_TALK_BACKGROUND));
    ApplyPalettes(gBackgroundTable[background].pal, BGPAL_TALK_BACKGROUND, 8);

    EnableBgSync(BG3_SYNC_BIT);
    gPal[0] = 0;
}

void DisplayBackgroundNoClear(int background)
{
    SetBgOffset(0, 0, 0);
    SetBgOffset(1, 0, 0);
    SetBgOffset(2, 0, 0);
    SetBgOffset(3, 0, 0);

    Decompress(gBackgroundTable[background].img, (void *)BG_VRAM + GetBgChrOffset(3));
    TmApplyTsa(gBg3Tm, gBackgroundTable[background].tsa, OAM2_PAL(BGPAL_TALK_BACKGROUND));

    /* BUG: the palette count should be 8, matching DisplayBackground, but is 4 instead
     * This is the value used in fe6. I assume this DisplayBackground was updated but not this */

#if BUGFIX
    ApplyPalettes(gBackgroundTable[background].pal, BGPAL_TALK_BACKGROUND, 8);
#else
    ApplyPalettes(gBackgroundTable[background].pal, BGPAL_TALK_BACKGROUND, 4);
#endif

    EnableBgSync(BG3_SYNC_BIT);
    gPal[0] = 0;
}

/* functions defined elsewhere that are not declared in headers yet */
ProcPtr StartTalkMsg(int x, int y, int id);
void EndTalk(void);
void SetTalkFlag(int talk_flags);
void SetTalkFunc(ProcFunc func);
bool IsTalkLocked(void);
void ResumeTalk(void);
bool IsTalkActive(void);
bool IsTactFemale(void);
int GetGameTacticsRank(void);
int GetGameSurvivalRank(void);
int GetGameExpRank(void);
int GetGameCombatRank(void);
int GetGameFundsRank(void);
void EventForceSlowTextSpeed(struct EventProc * proc);
void sub_0800AF20(struct EventProc * proc);
void AiGetUnitClosestValidPosition(struct Unit * unit, int x, int y, struct Vec2 * out);
void MapFloodRange_Unitless(int x, int y, s8 const * mov_table);
void BuildBestMoveScript(int x, int y, u8 * out);
struct MuProc * StartMu(struct Unit * unit);
void DisableMuCamera(struct MuProc * mu);
void SetMuMoveScript(struct MuProc * mu, u8 const * move_script);
void SetMuConfig(struct MuProc * mu, int speed);
bool IsMuActive(struct MuProc * mu);
void EndMu(struct MuProc * mu);
u8 IsPidBlue(u8 pid);
u8 IsPidBlueDeployed(u8 pid);
void BmMapFillg(u8 ** map, int value);
void EventUnitLoadWait(struct EventProc * proc);
void EventUnitLoadAliveWait(struct EventProc * proc);
void EventLoadUnitsAsParty(struct EventProc * proc);

extern u8 gEventSavedPosX[];
extern u8 gEventSavedPosY[];

struct EventMuWaitProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ int x;
    /* 30 */ int y;
    STRUCT_PAD(0x34, 0x54);
    /* 54 */ struct MuProc * mu;
};

extern u8 gUnk_02033E00[];
extern struct ProcCmd CONST_DATA ProcScr_08B91A08[];

void EventStartTalk(struct EventProc * proc, int msg, bool init)
{
    if (init)
        InitTalk(0x80, 2, TRUE);

    if (proc->flags & EVENT_FLAG_SLOWTALK)
        EventForceSlowTextSpeed(proc);

    StartTalkMsg(1, 1, msg);

    if (proc->flags & EVENT_FLAG_NOSKIPTALK)
        SetTalkFlag(TALK_FLAG_NOSKIP);

    if (proc->flags & EVENT_FLAG_SLOWTALK)
        SetTalkFlag(TALK_FLAG_NOFAST);

    proc->idle_func = EventEndTalk;
}

int EvtCmd_Talk(struct EventProc * proc)
{
    proc->flags &= ~EVENT_FLAG_TEXTSKIPPED;

    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    EventStartTalk(proc, proc->script[1], TRUE);
    return EVENT_CMDRET_YIELD;
}

int EvtCmd_TalkOpaque(struct EventProc * proc)
{
    proc->flags &= ~EVENT_FLAG_TEXTSKIPPED;

    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    EventStartTalk(proc, proc->script[1], TRUE);
    SetTalkFlag(0x100);
    return EVENT_CMDRET_YIELD;
}

int EvtCmd_TalkByMode(struct EventProc * proc)
{
    proc->flags &= ~EVENT_FLAG_TEXTSKIPPED;

    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    InitTalk(0x80, 2, TRUE);

    if (gPlaySt.chapterModeIndex != CHAPTER_MODE_HECTOR)
        EventStartTalk(proc, proc->script[1], TRUE);
    else
        EventStartTalk(proc, proc->script[2], TRUE);

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_TalkSetFuncBroken(struct EventProc * proc)
{
    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    /* BUG: passes the address of the argument rather than the argument */
    SetTalkFunc((ProcFunc)(proc->script + 1));
    return EVENT_CMDRET_YIELD;
}

int EvtCmd_TalkMore(struct EventProc * proc)
{
    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    if (proc->flags & EVENT_FLAG_TEXTSKIPPED)
        return EVENT_CMDRET_CONTINUE;

    EventStartTalk(proc, proc->script[1], FALSE);
    return EVENT_CMDRET_YIELD;
}

int EvtCmd_TalkMoreByMode(struct EventProc * proc)
{
    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    if (proc->flags & EVENT_FLAG_TEXTSKIPPED)
        return EVENT_CMDRET_CONTINUE;

    if (gPlaySt.chapterModeIndex != CHAPTER_MODE_HECTOR)
        EventStartTalk(proc, proc->script[1], FALSE);
    else
        EventStartTalk(proc, proc->script[2], FALSE);

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_TalkAuto(struct EventProc * proc)
{
    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    EventStartTalk(proc, proc->talk_auto_msg, TRUE);
    return EVENT_CMDRET_YIELD;
}

int Event14_TalkContinue(struct EventProc * proc)
{
    if (proc->flags & EVENT_FLAG_SKIPPED)
    {
        EndTalk();
        return EVENT_CMDRET_CONTINUE;
    }

    ResumeTalk();
    proc->idle_func = EventEndTalk;
    return EVENT_CMDRET_YIELD;
}

int EvtCmd_TalkGeneric(struct EventProc * proc)
{
    EventScr const * msgs = (EventScr const *)proc->script[1];

    proc->flags &= ~EVENT_FLAG_TEXTSKIPPED;

    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    EventStartTalk(proc, msgs[gActiveUnit->pCharacterData->visit_group], TRUE);
    return EVENT_CMDRET_YIELD;
}

int EvtCmd_TalkMoreGeneric(struct EventProc * proc)
{
    EventScr const * msgs = (EventScr const *)proc->script[1];

    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    if (proc->flags & EVENT_FLAG_TEXTSKIPPED)
        return EVENT_CMDRET_CONTINUE;

    EventStartTalk(proc, msgs[gActiveUnit->pCharacterData->visit_group], FALSE);
    return EVENT_CMDRET_YIELD;
}

int EvtCmd_TalkByTactRank(struct EventProc * proc)
{
    EventScr const * msgs = (EventScr const *)proc->script[1];
    int rank;
    int idx;

    proc->flags &= ~EVENT_FLAG_TEXTSKIPPED;

    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    switch (SCR_HI16(proc->script[0]))
    {
    case 0:
        rank = GetGameTacticsRank();
        break;

    case 1:
        rank = GetGameSurvivalRank();
        break;

    case 2:
        rank = GetGameExpRank();
        break;

    case 3:
        rank = GetGameCombatRank();
        break;

    case 4:
    default:
        rank = GetGameFundsRank();
        break;
    }

    idx = 0;
    if (rank <= 2)
    {
        idx = 1;
        if (rank <= 1)
            idx = 2;
    }

    EventStartTalk(proc, msgs[idx], TRUE);
    return EVENT_CMDRET_YIELD;
}

int EvtCmd_TalkByTactGender(struct EventProc * proc)
{
    proc->flags &= ~EVENT_FLAG_TEXTSKIPPED;

    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    if (!IsTactFemale())
        EventStartTalk(proc, proc->script[1], TRUE);
    else
        EventStartTalk(proc, proc->script[2], TRUE);

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_TalkMoreByTactGender(struct EventProc * proc)
{
    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    if (proc->flags & EVENT_FLAG_TEXTSKIPPED)
        return EVENT_CMDRET_CONTINUE;

    if (!IsTactFemale())
        EventStartTalk(proc, proc->script[1], FALSE);
    else
        EventStartTalk(proc, proc->script[2], FALSE);

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_TalkByFlag(struct EventProc * proc)
{
    proc->flags &= ~EVENT_FLAG_TEXTSKIPPED;

    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    if (CheckFlag(proc->script[1]))
        EventStartTalk(proc, proc->script[2], TRUE);
    else
        EventStartTalk(proc, proc->script[3], TRUE);

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_TalkMoreByFlag(struct EventProc * proc)
{
    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    if (proc->flags & EVENT_FLAG_TEXTSKIPPED)
        return EVENT_CMDRET_CONTINUE;

    if (CheckFlag(proc->script[1]))
        EventStartTalk(proc, proc->script[2], FALSE);
    else
        EventStartTalk(proc, proc->script[3], FALSE);

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_TalkByFunc(struct EventProc * proc)
{
    proc->flags &= ~EVENT_FLAG_TEXTSKIPPED;

    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    if (((bool (*)(void))proc->script[1])())
        EventStartTalk(proc, proc->script[2], TRUE);
    else
        EventStartTalk(proc, proc->script[3], TRUE);

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_TalkMoreByFunc(struct EventProc * proc)
{
    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    if (proc->flags & EVENT_FLAG_TEXTSKIPPED)
        return EVENT_CMDRET_CONTINUE;

    if (((bool (*)(void))proc->script[1])())
        EventStartTalk(proc, proc->script[2], FALSE);
    else
        EventStartTalk(proc, proc->script[3], FALSE);

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_ClearTalkBubble(struct EventProc * proc)
{
    ClearTalkBubble();
    return EVENT_CMDRET_CONTINUE;
}

void EventEndTalk(struct EventProc * proc)
{
    u16 skipped = proc->flags & EVENT_FLAG_SKIPPED;

    if (skipped)
    {
        EndTalk();
        sub_0800AF20(proc);
        proc->idle_func = NULL;
        return;
    }

    if (!IsTalkActive() || IsTalkLocked())
    {
        sub_0800AF20(proc);
        proc->idle_func = NULL;
    }
}

int Event20(struct EventProc * proc)
{
    s16 x = (proc->script[0] >> 16) & 0xFF;
    s16 y = (proc->script[0] >> 24) & 0xFF;
    int cam_x, cam_y;

    if ((proc->flags & EVENT_FLAG_SKIPPED) || proc->unk_4D)
    {
        StoreAdjustedCameraPositions(x, y, &cam_x, &cam_y);
        gBmSt.camera.x = cam_x * 16;
        gBmSt.camera.y = cam_y * 16;
        SetMapCursorPosition(x, y);
        RenderMap();
        return EVENT_CMDRET_CONTINUE;
    }

    EnsureCameraOntoCenteredPosition(proc, x, y);
    SetMapCursorPosition(x, y);
    return EVENT_CMDRET_YIELD;
}

int EvtCmd_CameraPosition(struct EventProc * proc)
{
    s16 x = (proc->script[0] >> 16) & 0xFF;
    s16 y = (proc->script[0] >> 24) & 0xFF;

    if ((proc->flags & EVENT_FLAG_SKIPPED) || proc->unk_4D)
    {
        gBmSt.camera.x = GetCameraAdjustedX(x * 16);
        gBmSt.camera.y = GetCameraAdjustedY(y * 16);
        SetMapCursorPosition(x, y);
        RenderMap();
        return EVENT_CMDRET_CONTINUE;
    }

    EnsureCameraOntoPosition(proc, x, y);
    SetMapCursorPosition(x, y);
    return EVENT_CMDRET_YIELD;
}

int EvtCmd_CameraPid(struct EventProc * proc)
{
    struct Unit * unit = GetUnitFromCharId(SCR_HI16(proc->script[0]));

    if ((proc->flags & EVENT_FLAG_SKIPPED) || proc->unk_4D)
    {
        gBmSt.camera.x = GetCameraAdjustedX(unit->xPos * 16);
        gBmSt.camera.y = GetCameraAdjustedY(unit->yPos * 16);
        SetMapCursorPosition(unit->xPos, unit->yPos);
        RenderMap();
    }
    else
    {
        EnsureCameraOntoPosition(proc, unit->xPos, unit->yPos);
        SetMapCursorPosition(unit->xPos, unit->yPos);
    }

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_CameraLeader(struct EventProc * proc)
{
    struct Unit * unit = GetUnitFromCharId(GetPlayerLeaderUnitId());

    EnsureCameraOntoPosition(proc, unit->xPos, unit->yPos);
    SetMapCursorPosition(unit->xPos, unit->yPos);
    return EVENT_CMDRET_YIELD;
}

bool CanDisplayUnitMovement(struct EventProc * proc, int x, int y)
{
    if (proc->flags & EVENT_FLAG_UNITCAM)
    {
        if (Proc_Find(ProcScr_CamMove) != NULL)
            return FALSE;

        if (EnsureCameraOntoPosition(proc, x, y))
            return FALSE;
    }

    if (!CanStartMu())
        return FALSE;

    return TRUE;
}

int EvtCmd_MovePosition(struct EventProc * proc)
{
    int x = SCR_LO16_SIGN(proc->script[1]);
    int y = SCR_HI16_SIGN(proc->script[1]);
    int x_to = SCR_LO16_SIGN(proc->script[2]);
    int y_to = SCR_HI16_SIGN(proc->script[2]);
    struct Unit * unit;

    if (gBmMapUnit[y][x] == 0)
        return EVENT_CMDRET_CONTINUE;

    unit = GetUnit(gBmMapUnit[y][x]);

    if ((proc->flags & EVENT_FLAG_SKIPPED) || proc->unk_4D)
    {
        TryMoveUnit(unit, x_to, y_to, TRUE);
        RefreshUnitSprites();
        return EVENT_CMDRET_CONTINUE;
    }

    if (!CanDisplayUnitMovement(proc, x, y))
        return EVENT_CMDRET_REPEAT;

    TryMoveUnitDisplayed(proc, unit, x_to, y_to, 0);
    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_MovePositionSpeed(struct EventProc * proc)
{
    int x = SCR_LO16_SIGN(proc->script[1]);
    int y = SCR_HI16_SIGN(proc->script[1]);
    int x_to = SCR_LO16_SIGN(proc->script[2]);
    int y_to = SCR_HI16_SIGN(proc->script[2]);
    u16 speed = SCR_LO16(proc->script[3]);
    struct Unit * unit;

    if (gBmMapUnit[y][x] == 0)
        return EVENT_CMDRET_CONTINUE;

    unit = GetUnit(gBmMapUnit[y][x]);

    if ((proc->flags & EVENT_FLAG_SKIPPED) || proc->unk_4D)
    {
        TryMoveUnit(unit, x_to, y_to, TRUE);
        RefreshUnitSprites();
        return EVENT_CMDRET_CONTINUE;
    }

    if (!CanDisplayUnitMovement(proc, x, y))
        return EVENT_CMDRET_REPEAT;

    TryMoveUnitDisplayed(proc, unit, x_to, y_to, speed);
    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_MovePid(struct EventProc * proc)
{
    struct Unit * unit = GetUnitFromCharId(proc->script[1]);
    int x_to = SCR_LO16_SIGN(proc->script[2]);
    int y_to = SCR_HI16_SIGN(proc->script[2]);

    if ((proc->flags & EVENT_FLAG_SKIPPED) || proc->unk_4D)
    {
        TryMoveUnit(unit, x_to, y_to, TRUE);
        RefreshUnitSprites();
        return EVENT_CMDRET_CONTINUE;
    }

    if (!CanDisplayUnitMovement(proc, unit->xPos, unit->yPos))
        return EVENT_CMDRET_REPEAT;

    TryMoveUnitDisplayed(proc, unit, x_to, y_to, 0);
    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_MovePidSpeed(struct EventProc * proc)
{
    struct Unit * unit = GetUnitFromCharId(proc->script[1]);
    int x_to = SCR_LO16_SIGN(proc->script[2]);
    int y_to = SCR_HI16_SIGN(proc->script[2]);
    u16 speed = SCR_LO16(proc->script[3]);

    if ((proc->flags & EVENT_FLAG_SKIPPED) || proc->unk_4D)
    {
        TryMoveUnit(unit, x_to, y_to, TRUE);
        RefreshUnitSprites();
        return EVENT_CMDRET_CONTINUE;
    }

    if (!CanDisplayUnitMovement(proc, unit->xPos, unit->yPos))
        return EVENT_CMDRET_REPEAT;

    TryMoveUnitDisplayed(proc, unit, x_to, y_to, speed);
    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_MovePidOneStepSpeed(struct EventProc * proc)
{
    struct Unit * unit = GetUnitFromCharId(proc->script[1]);
    int direction = proc->script[2];
    u16 speed = SCR_LO16(proc->script[3]);
    int x = unit->xPos;
    int y = unit->yPos;

    switch (direction)
    {
    case 0:
        y--;
        break;

    case 1:
        y++;
        break;

    case 2:
        x--;
        break;

    case 3:
        x++;
        break;
    }

    if ((proc->flags & EVENT_FLAG_SKIPPED) || proc->unk_4D)
    {
        TryMoveUnit(unit, x, y, TRUE);
        RefreshUnitSprites();
        return EVENT_CMDRET_CONTINUE;
    }

    if (!CanDisplayUnitMovement(proc, unit->xPos, unit->yPos))
        return EVENT_CMDRET_REPEAT;

    TryMoveUnitDisplayed(proc, unit, x, y, speed);
    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_MovePidScript(struct EventProc * proc)
{
    struct Unit * unit = GetUnitFromCharId(proc->script[1]);
    u8 const * move_script = (u8 const *)proc->script[2];
    int x, y;

    if ((proc->flags & EVENT_FLAG_SKIPPED) || proc->unk_4D)
    {
        x = unit->xPos;
        y = unit->yPos;
        ApplyMoveScriptToCoordinates(&x, &y, move_script);
        TryMoveUnit(unit, x, y, FALSE);
        RefreshUnitSprites();
        return EVENT_CMDRET_CONTINUE;
    }

    if (!CanDisplayUnitMovement(proc, unit->xPos, unit->yPos))
        return EVENT_CMDRET_REPEAT;

    DisplayMovement(proc, unit, move_script, 0);
    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_MovePositionScript(struct EventProc * proc)
{
    int x = SCR_LO16_SIGN(proc->script[1]);
    int y = SCR_HI16_SIGN(proc->script[1]);
    u8 const * move_script = (u8 const *)proc->script[2];
    struct Unit * unit = GetUnit(gBmMapUnit[y][x]);

    if ((proc->flags & EVENT_FLAG_SKIPPED) || proc->unk_4D)
    {
        ApplyMoveScriptToCoordinates(&x, &y, move_script);
        TryMoveUnit(unit, x, y, FALSE);
        RefreshUnitSprites();
        return EVENT_CMDRET_CONTINUE;
    }

    if (!CanDisplayUnitMovement(proc, x, y))
        return EVENT_CMDRET_REPEAT;

    DisplayMovement(proc, unit, move_script, 0);
    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_MovePidNextTo(struct EventProc * proc)
{
    struct Unit * unit = GetUnitFromCharId(proc->script[2]);
    int x = unit->xPos;
    int y = unit->yPos;

    unit = GetUnitFromCharId(proc->script[1]);

    if ((proc->flags & EVENT_FLAG_SKIPPED) || proc->unk_4D)
    {
        TryMoveUnit(unit, x, y, TRUE);
        RefreshUnitSprites();
        return EVENT_CMDRET_CONTINUE;
    }

    if (!CanDisplayUnitMovement(proc, unit->xPos, unit->yPos))
        return EVENT_CMDRET_REPEAT;

    TryMoveUnitDisplayed(proc, unit, x, y, 0);
    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_MoveLeader(struct EventProc * proc)
{
    struct Unit * unit = GetUnitFromCharId(GetPlayerLeaderUnitId());
    int x_to = SCR_LO16_SIGN(proc->script[1]);
    int y_to = SCR_HI16_SIGN(proc->script[1]);

    if ((proc->flags & EVENT_FLAG_SKIPPED) || proc->unk_4D)
    {
        TryMoveUnit(unit, x_to, y_to, TRUE);
        RefreshUnitSprites();
        return EVENT_CMDRET_CONTINUE;
    }

    if (!CanDisplayUnitMovement(proc, unit->xPos, unit->yPos))
        return EVENT_CMDRET_REPEAT;

    TryMoveUnitDisplayed(proc, unit, x_to, y_to, 0);
    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_MovePidByFaction_PositionSpeed_Script(struct EventProc * proc)
{
    bool blue = IsPidBlue(proc->script[1]);
    struct Unit * unit = GetUnitFromCharId(SCR_LO16(proc->script[1]));
    int x = SCR_LO16_SIGN(proc->script[2]);
    int y = SCR_HI16_SIGN(proc->script[2]);
    u16 speed = SCR_HI16(proc->script[1]);
    u8 const * move_script = (u8 const *)proc->script[3];

    if (blue)
    {
        if (x == 99)
            return EVENT_CMDRET_CONTINUE;

        if (x == unit->xPos && y == unit->yPos)
            return EVENT_CMDRET_CONTINUE;
    }

    if ((proc->flags & EVENT_FLAG_SKIPPED) || proc->unk_4D)
    {
        if (!blue)
        {
            x = unit->xPos;
            y = unit->yPos;
            ApplyMoveScriptToCoordinates(&x, &y, move_script);
        }

        TryMoveUnit(unit, x, y, FALSE);
        RefreshUnitSprites();
        return EVENT_CMDRET_CONTINUE;
    }

    if (!CanDisplayUnitMovement(proc, unit->xPos, unit->yPos))
        return EVENT_CMDRET_REPEAT;

    if (blue)
        TryMoveUnitDisplayed(proc, unit, x, y, speed);
    else
        DisplayMovement(proc, unit, move_script, 0);

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_MovePidByFaction_Script_Script(struct EventProc * proc)
{
    int x, y;
    bool blue = IsPidBlue(proc->script[1]);
    struct Unit * unit = GetUnitFromCharId(SCR_LO16(proc->script[1]));
    u8 const * move_script_blue = (u8 const *)proc->script[2];
    u8 const * move_script = (u8 const *)proc->script[3];

    if ((proc->flags & EVENT_FLAG_SKIPPED) || proc->unk_4D)
    {
        x = unit->xPos;
        y = unit->yPos;

        if (!blue)
            ApplyMoveScriptToCoordinates(&x, &y, move_script);
        else
            ApplyMoveScriptToCoordinates(&x, &y, move_script_blue);

        TryMoveUnit(unit, x, y, FALSE);
        RefreshUnitSprites();
        return EVENT_CMDRET_CONTINUE;
    }

    if (!CanDisplayUnitMovement(proc, unit->xPos, unit->yPos))
        return EVENT_CMDRET_REPEAT;

    if (blue)
        DisplayMovement(proc, unit, move_script_blue, 0);
    else
        DisplayMovement(proc, unit, move_script, 0);

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_MovePositionInstant(struct EventProc * proc)
{
    struct Unit * unit = GetUnit(gBmMapUnit[SCR_HI16_SIGN(proc->script[1])][SCR_LO16_SIGN(proc->script[1])]);

    if (unit != NULL)
    {
        TryMoveUnit(unit, SCR_LO16_SIGN(proc->script[2]), SCR_HI16_SIGN(proc->script[2]), TRUE);
        RefreshUnitSprites();
    }

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_MovePidInstant(struct EventProc * proc)
{
    struct Unit * unit = GetUnitFromCharId(proc->script[1]);

    TryMoveUnit(unit, SCR_LO16_SIGN(proc->script[2]), SCR_HI16_SIGN(proc->script[2]), TRUE);
    RefreshUnitSprites();

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_SavePositionPid(struct EventProc * proc)
{
    struct Unit * unit;
    int slot;

    if (proc->script[1] == 0)
    {
        if (!IsPidBlueDeployed(GetPlayerLeaderUnitId()))
            return EVENT_CMDRET_CONTINUE;

        unit = GetUnitFromCharId(GetPlayerLeaderUnitId());
        slot = gPlaySt.chapterModeIndex;
    }
    else
    {
        if (!IsPidBlueDeployed(proc->script[1]))
            return EVENT_CMDRET_CONTINUE;

        unit = GetUnitFromCharId(proc->script[1]);
        slot = proc->script[2];
    }

    gEventSavedPosX[slot] = unit->xPos;
    gEventSavedPosY[slot] = unit->yPos;

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_MovePidToSavedPosition(struct EventProc * proc)
{
    struct Unit * unit;
    int slot;
    int x, y;

    if (proc->script[1] == 0)
    {
        if (!IsPidBlueDeployed(GetPlayerLeaderUnitId()))
            return EVENT_CMDRET_CONTINUE;

        unit = GetUnitFromCharId(GetPlayerLeaderUnitId());
        slot = gPlaySt.chapterModeIndex;
    }
    else
    {
        if (!IsPidBlueDeployed(proc->script[1]))
            return EVENT_CMDRET_CONTINUE;

        unit = GetUnitFromCharId(proc->script[1]);
        slot = proc->script[2];
    }

    x = gEventSavedPosX[slot];
    y = gEventSavedPosY[slot];

    if ((proc->flags & EVENT_FLAG_SKIPPED) || proc->unk_4D)
    {
        TryMoveUnit(unit, x, y, TRUE);
        RefreshUnitSprites();
        return EVENT_CMDRET_CONTINUE;
    }

    if (!CanDisplayUnitMovement(proc, unit->xPos, unit->yPos))
        return EVENT_CMDRET_REPEAT;

    TryMoveUnitDisplayed(proc, unit, x, y, 0);
    return EVENT_CMDRET_CONTINUE;
}

void TryMoveUnit(struct Unit * unit, int x, int y, u8 move_closest)
{
    struct Vec2 pos;

    if (x == 0xFF)
        x = -1;

    if (y == 0xFF)
        y = -1;

    pos.x = x;
    pos.y = y;

    if (gBmMapTerrain[y][x] != 0 && move_closest)
    {
        if (unit->xPos != x || unit->yPos != y)
            AiGetUnitClosestValidPosition(unit, (s16)x, (s16)y, &pos);
    }

    unit->xPos = pos.x;
    unit->yPos = pos.y;

    UnitSyncMovement(unit);

    if (!(unit->state & US_UNDER_A_ROOF))
    {
        unit->state &= ~(US_HIDDEN | US_NOT_DEPLOYED);
        RefreshEntityMaps();
    }
}

bool TryMoveUnitDisplayed(struct EventProc * proc, struct Unit * unit, int x, int y, u16 speed)
{
    struct Vec2 pos;
    u8 placed = FALSE;

    if (x == 0xFF)
        x = -1;

    if (y == 0xFF)
        y = -1;

    DisableAllLightRunes();

    pos.x = x;
    pos.y = y;

    if (gBmMapTerrain[y][x] == 0)
    {
        placed = TRUE;
        gBmMapTerrain[y][x] = placed;
    }
    else
    {
        AiGetUnitClosestValidPosition(unit, (s16)x, (s16)y, &pos);
    }

    MapFloodRange_Unitless(unit->xPos, unit->yPos, unit->pClassData->pMovCostTable[0]);
    BuildBestMoveScript(pos.x, pos.y, gUnk_02033E00);

    if (placed)
        gBmMapTerrain[y][x] = 0;

    if (proc->flags & EVENT_FLAG_SLOWTALK)
        speed |= 0x40;

    EnableAllLightRunes();

    return DisplayMovement(proc, unit, gUnk_02033E00, speed);
}

bool DisplayMovement(struct EventProc * proc, struct Unit * unit, u8 const * move_script, u16 speed)
{
    int x, y;
    struct MuProc * mu = StartMu(unit);
    struct EventMuWaitProc * wait;

    if (!(proc->flags & EVENT_FLAG_UNITCAM))
        DisableMuCamera(mu);

    wait = Proc_Start(ProcScr_08B91A08, PROC_TREE_3);
    wait->mu = mu;

    HideUnitSprite(unit);
    unit->state |= US_HIDDEN;

    x = unit->xPos;
    y = unit->yPos;

    gBmMapOther[y][x] = 0;

    ApplyMoveScriptToCoordinates(&x, &y, move_script);

    wait->x = x;
    wait->y = y;

    SetMuMoveScript(mu, move_script);

    if (speed != 0)
        SetMuConfig(mu, speed);

    gBmMapOther[y][x] = unit->index;

    return TRUE;
}

void sub_0800CD14(void)
{
}

void WaitForMu_OnLoop(struct EventMuWaitProc * proc)
{
    struct MuProc * mu = proc->mu;
    struct Unit * unit;

    if (IsMuActive(mu))
        return;

    EndMu(mu);

    unit = mu->unit;
    unit->xPos = proc->x;
    unit->yPos = proc->y;

    UnitSyncMovement(unit);
    ShowUnitSprite(unit);

    unit->state &= ~US_HIDDEN;

    RefreshEntityMaps();
    RefreshUnitSprites();

    Proc_Break(proc);
}

int EvtCmd_LoadUnits(struct EventProc * proc)
{
    BmMapFillg(gBmMapOther, 0);

    proc->unit_info = (struct UnitDefinition const *)proc->script[1];

    if (proc->flags & EVENT_FLAG_SKIPPED)
    {
        EventUnitLoadWait(proc);
        return EVENT_CMDRET_CONTINUE;
    }

    proc->idle_func = EventUnitLoadWait;
    return EVENT_CMDRET_YIELD;
}

int EvtCmd_LoadUnitsAlive(struct EventProc * proc)
{
    BmMapFillg(gBmMapOther, 0);

    proc->unit_info = (struct UnitDefinition const *)proc->script[1];

    if (proc->flags & EVENT_FLAG_SKIPPED)
    {
        EventUnitLoadAliveWait(proc);
        return EVENT_CMDRET_CONTINUE;
    }

    proc->idle_func = EventUnitLoadAliveWait;
    return EVENT_CMDRET_YIELD;
}

int EvtCmd_LoadUnitsFiltered(struct EventProc * proc)
{
    if ((proc->script[1] & 0xFFFF0000) && !(gPlaySt.chapterStateBits & PLAY_FLAG_HARD))
        return EVENT_CMDRET_CONTINUE;

    if (gPlaySt.chapterModeIndex != (u8)proc->script[1])
        return EVENT_CMDRET_CONTINUE;

    BmMapFillg(gBmMapOther, 0);

    proc->unit_info = (struct UnitDefinition const *)proc->script[2];

    if (proc->flags & EVENT_FLAG_SKIPPED)
    {
        EventUnitLoadWait(proc);
        return EVENT_CMDRET_CONTINUE;
    }

    proc->idle_func = EventUnitLoadWait;
    return EVENT_CMDRET_YIELD;
}

int EvtCmd_LoadUnitsParty(struct EventProc * proc)
{
    BmMapFillg(gBmMapOther, 0);

    proc->unit_info = (struct UnitDefinition const *)proc->script[1];
    EventLoadUnitsAsParty(proc);

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_LoadUnitsPartyIfScenario(struct EventProc * proc)
{
    if (gPlaySt.chapterModeIndex == (u8)proc->script[1])
    {
        BmMapFillg(gBmMapOther, 0);

        proc->unit_info = (struct UnitDefinition const *)proc->script[2];
        EventLoadUnitsAsParty(proc);

        return EVENT_CMDRET_YIELD;
    }

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_LoadUnitsByMode(struct EventProc * proc)
{
    int mode = 0;

    if (gPlaySt.chapterStateBits & PLAY_FLAG_HARD)
        mode = 1;

    if (gPlaySt.chapterModeIndex == CHAPTER_MODE_HECTOR)
        mode += 2;

    BmMapFillg(gBmMapOther, 0);

    switch (mode)
    {
    case 1:
        proc->unit_info = (struct UnitDefinition const *)proc->script[2];
        break;

    case 2:
        proc->unit_info = (struct UnitDefinition const *)proc->script[3];
        break;

    case 3:
        proc->unit_info = (struct UnitDefinition const *)proc->script[4];
        break;

    case 0:
    default:
        proc->unit_info = (struct UnitDefinition const *)proc->script[1];
        break;
    }

    if (proc->unit_info == NULL)
        return EVENT_CMDRET_CONTINUE;

    if (proc->flags & EVENT_FLAG_SKIPPED)
    {
        EventUnitLoadWait(proc);
        return EVENT_CMDRET_CONTINUE;
    }

    proc->idle_func = EventUnitLoadWait;
    return EVENT_CMDRET_YIELD;
}

int EvtCmd_LoadUnitsPartyByMode(struct EventProc * proc)
{
    int mode = 0;

    if (gPlaySt.chapterStateBits & PLAY_FLAG_HARD)
        mode = 1;

    if (gPlaySt.chapterModeIndex == CHAPTER_MODE_HECTOR)
        mode += 2;

    BmMapFillg(gBmMapOther, 0);

    switch (mode)
    {
    case 1:
        proc->unit_info = (struct UnitDefinition const *)proc->script[2];
        break;

    case 2:
        proc->unit_info = (struct UnitDefinition const *)proc->script[3];
        break;

    case 3:
        proc->unit_info = (struct UnitDefinition const *)proc->script[4];
        break;

    case 0:
    default:
        proc->unit_info = (struct UnitDefinition const *)proc->script[1];
        break;
    }

    EventLoadUnitsAsParty(proc);
    return EVENT_CMDRET_CONTINUE;
}

int GetNextAvailableBlueUnitId(int uid)
{
    for (; uid < 0x40; uid++)
    {
        struct Unit * unit = GetUnit(uid);

        if (unit == NULL)
            continue;

        if (unit->pCharacterData == NULL)
            continue;

        if (unit->state & (US_DEAD | US_NOT_DEPLOYED))
            continue;

        return uid;
    }

    return 0;
}

bool UnitInfoRequiresNoMovement(struct UnitDefinition const * def)
{
    if (def->x_load == def->x_move && def->y_load == def->y_move && gBmMapUnit[def->y_load][def->x_load] != 0)
        return TRUE;

    return FALSE;
}

