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

/* ---- decls ---- */
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

ASM_FUNC("asm/nonmatching/code_0800C058.s");
ASM_FUNC("asm/nonmatching/code_0800C15C.s");
ASM_FUNC("asm/nonmatching/code_0800C25C.s");
ASM_FUNC("asm/nonmatching/code_0800C304.s");
ASM_FUNC("asm/nonmatching/code_0800C3B4.s");
ASM_FUNC("asm/nonmatching/code_0800C464.s");
ASM_FUNC("asm/nonmatching/code_0800C4EC.s");
ASM_FUNC("asm/nonmatching/code_0800C5B0.s");
ASM_FUNC("asm/nonmatching/code_0800C63C.s");
ASM_FUNC("asm/nonmatching/code_0800C6E4.s");
ASM_FUNC("asm/nonmatching/code_0800C7FC.s");
ASM_FUNC("asm/nonmatching/code_0800C8BC.s");
ASM_FUNC("asm/nonmatching/code_0800C958.s");
ASM_FUNC("asm/nonmatching/code_0800C9AC.s");
ASM_FUNC("asm/nonmatching/code_0800CA1C.s");
ASM_FUNC("asm/nonmatching/code_0800CAE8.s");
ASM_FUNC("asm/nonmatching/code_0800CB74.s");
ASM_FUNC("asm/nonmatching/code_0800CC5C.s");
ASM_FUNC("asm/nonmatching/code_0800CD14.s");
ASM_FUNC("asm/nonmatching/code_0800CD18.s");
ASM_FUNC("asm/nonmatching/code_0800CD64.s");
ASM_FUNC("asm/nonmatching/code_0800CDA8.s");
ASM_FUNC("asm/nonmatching/code_0800CDEC.s");
ASM_FUNC("asm/nonmatching/code_0800CE58.s");
ASM_FUNC("asm/nonmatching/code_0800CE80.s");
ASM_FUNC("asm/nonmatching/code_0800CEBC.s");
ASM_FUNC("asm/nonmatching/code_0800CF44.s");
ASM_FUNC("asm/nonmatching/code_0800CFAC.s");
ASM_FUNC("asm/nonmatching/code_0800CFE4.s");
