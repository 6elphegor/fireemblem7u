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

ASM_FUNC("asm/nonmatching/code_0800B90C.s");
ASM_FUNC("asm/nonmatching/code_0800B974.s");
ASM_FUNC("asm/nonmatching/code_0800B9A8.s");
ASM_FUNC("asm/nonmatching/code_0800B9E4.s");
ASM_FUNC("asm/nonmatching/code_0800BA3C.s");
ASM_FUNC("asm/nonmatching/code_0800BA60.s");
ASM_FUNC("asm/nonmatching/code_0800BA90.s");
ASM_FUNC("asm/nonmatching/code_0800BADC.s");
ASM_FUNC("asm/nonmatching/code_0800BB04.s");
ASM_FUNC("asm/nonmatching/code_0800BB34.s");
ASM_FUNC("asm/nonmatching/code_0800BB7C.s");
ASM_FUNC("asm/nonmatching/code_0800BBC4.s");
ASM_FUNC("asm/nonmatching/code_0800BC54.s");
ASM_FUNC("asm/nonmatching/code_0800BCA0.s");
ASM_FUNC("asm/nonmatching/code_0800BCE8.s");
ASM_FUNC("asm/nonmatching/code_0800BD38.s");
ASM_FUNC("asm/nonmatching/code_0800BD84.s");
ASM_FUNC("asm/nonmatching/code_0800BDD4.s");
ASM_FUNC("asm/nonmatching/code_0800BE20.s");
ASM_FUNC("asm/nonmatching/code_0800BE2C.s");
ASM_FUNC("asm/nonmatching/code_0800BE74.s");
ASM_FUNC("asm/nonmatching/code_0800BEEC.s");
ASM_FUNC("asm/nonmatching/code_0800BF5C.s");
ASM_FUNC("asm/nonmatching/code_0800BFDC.s");
ASM_FUNC("asm/nonmatching/code_0800C00C.s");
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
