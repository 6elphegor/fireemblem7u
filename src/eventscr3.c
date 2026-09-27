#include "gbafe.h"

extern struct MusicPlayerInfo gUnk_03005A90;
extern struct MusicPlayerInfo gUnk_03005AD0;
extern struct MusicPlayerInfo gUnk_03005CE0;
extern struct MusicPlayerInfo gUnk_03005D20;
extern struct MusicPlayerInfo gUnk_03005D60;
extern struct MusicPlayerInfo gUnk_03005DF0;
extern struct MusicPlayerInfo gUnk_03005E30;

struct AiDecisionSt {
    /* 00 */ u8 action_id;
    /* 01 */ u8 unit_id;
    /* 02 */ u8 x_move;
    /* 03 */ u8 y_move;
};

extern struct AiDecisionSt gAiDecision;

extern struct ProcCmd CONST_DATA ProcScr_EventWeatherChangeWithFade[];

void RestoreBgm(int speed);
void StartBgmFadeIn(int song, int speed, struct MusicPlayerInfo * music_player);
void FadeBgmOut_2(int speed);
void SetBgmVolume(int volume);
void StartSlowLockingFadeFromBlack(ProcPtr parent);
void RestartBattleMap(void);
void UnpackChapterMapPalette(void);
void StartLockingFadeToBlack(int speed, ProcPtr parent);
void StartLockingFadeFromBlack(int speed, ProcPtr parent);
void StartLockingFadeToWhite(int speed, ProcPtr parent);
void StartLockingFadeFromWhite(int speed, ProcPtr parent);
void Event_SetExitMap(void);
void Event_SetEnterMap(void);
void sub_080AEC5C(int a, int b, int c, ProcPtr parent);
void sub_080AECB0(int a, int b, int c, ProcPtr parent);
u32 GetGold(void);
void SetGold(s32 amount);
void StartPopup_800EE90(int amount, ProcPtr parent);
void StartPopup_800EE4C(int amount, ProcPtr parent);
void BattleInitItemEffect(struct Unit * actor, int item_slot);
void BattleInitItemEffectTarget(struct Unit * unit);
void BattleGenerateReal(struct Unit * actor, struct Unit * target);
void BattleGenerateBallistaReal(struct Unit * actor, struct Unit * target);
void UnitBeginAction(struct Unit * unit);
ProcPtr StartMu(struct Unit * unit);
void MU_SetDefaultFacing_Auto(void);
void BeginBattleAnimations(void);
void AiEndMuAndRefreshUnits(void);
void Proc_Mark(ProcPtr proc, u8 mark);
void SetWeather(int weather);
void SetVisionWithFade(int vision);
void SetVision(int vision);
void BreakItemSealForPid(int pid, u8 item);

int EvtCmd_SetFlag(struct EventProc * proc)
{
    SetFlag(SCR_HI16(proc->script[0]));
    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_ClearFlag(struct EventProc * proc)
{
    ClearFlag(SCR_HI16(proc->script[0]));
    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_PlayBgm(struct EventProc * proc)
{
    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
        return EVENT_CMDRET_CONTINUE;

    StartBgmExt(SCR_HI16(proc->script[0]), 1, NULL);
    return EVENT_CMDRET_YIELD;
}

int EvtCmd_PlaySongExt(struct EventProc * proc)
{
    int song = SCR_HI16(proc->script[0]);

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
        return EVENT_CMDRET_CONTINUE;

    switch (proc->script[1])
    {
    case 1:
        StartBgmExt(song, 1, (void *) &gUnk_03005D20);
        break;

    case 2:
        StartBgmExt(song, 1, (void *) &gUnk_03005D60);
        break;

    case 3:
        StartBgmExt(song, 1, (void *) &gUnk_03005E30);
        break;

    case 4:
        StartBgmExt(song, 1, (void *) &gUnk_03005DA0);
        break;

    case 5:
        StartBgmExt(song, 1, (void *) &gUnk_03005A90);
        break;

    case 6:
        StartBgmExt(song, 1, (void *) &gUnk_03005AD0);
        break;

    case 7:
        StartBgmExt(song, 1, (void *) &gUnk_03005CE0);
        break;

    case 8:
        StartBgmExt(song, 1, (void *) &gUnk_03005DF0);
        break;

    default:
        StartBgmExt(song, 1, (void *) &gUnk_03005B10);
        break;
    }

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_OverrideBgm(struct EventProc * proc)
{
    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
        return EVENT_CMDRET_CONTINUE;

    OverrideBgm(SCR_HI16(proc->script[0]));
    StartTemporaryLock(proc, 0x21);
    return EVENT_CMDRET_YIELD;
}

int EvtCmd_RestoreBgm(struct EventProc * proc)
{
    RestoreBgm(SCR_HI16(proc->script[0]));
    return EVENT_CMDRET_YIELD;
}

int EvtCmd_FadeBgmIn(struct EventProc * proc)
{
    if ((proc->flags & EVENT_FLAG_SKIPPED) == 0)
        StartBgmFadeIn(SCR_HI16(proc->script[0]), proc->script[1], NULL);

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_FadeBgmOut(struct EventProc * proc)
{
    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
        return EVENT_CMDRET_CONTINUE;

    FadeBgmOut_2(SCR_HI16(proc->script[0]));
    return EVENT_CMDRET_YIELD;
}

int EvtCmd_LowerBgmVolume(struct EventProc * proc)
{
    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
        return EVENT_CMDRET_CONTINUE;

    StartBgmVolumeChange(0x100, 0x90, 10, proc);
    return EVENT_CMDRET_YIELD;
}

int EvtCmd_RestoreBgmVolume(struct EventProc * proc)
{
    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
    {
        SetBgmVolume(0x100);
        return EVENT_CMDRET_CONTINUE;
    }

    StartBgmVolumeChange(0x90, 0x100, 10, proc);
    return EVENT_CMDRET_YIELD;
}

int EvtCmd_PlaySe(struct EventProc * proc)
{
    if ((proc->flags & EVENT_FLAG_SKIPPED) == 0 && !gPlaySt.cfgDisableSoundEffects)
        m4aSongNumStart(SCR_HI16(proc->script[0]));

    return EVENT_CMDRET_CONTINUE;
}

int EventEndBattleMap(struct EventProc * proc)
{
    proc->flags |= EVENT_FLAG_DISABLESKIP;
    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_NextChapter(struct EventProc * proc)
{
    int chapter = SCR_HI16(proc->script[0]);

    EndAllMus();
    SetNextChapterId(chapter);
    SetNextGameAction(1);

    proc->flags |= EVENT_FLAG_DISABLESKIP;

    if ((proc->flags & EVENT_FLAG_SKIPPED) == 0)
        StartSlowLockingFadeFromBlack(proc);

    if (chapter != 0x2F)
        FadeBgmOut(4);

    return EVENT_CMDRET_YIELD;
}

int Event80_CompleteGame(struct EventProc * proc)
{
    SetNextGameAction(2);
    EventEndBattleMap(proc);
    return EVENT_CMDRET_YIELD;
}

int EvtCmd_EndLynCampaign(struct EventProc * proc)
{
    SetNextGameAction(3);
    EventEndBattleMap(proc);
    return EVENT_CMDRET_YIELD;
}

int EvtCmd_SetMap(struct EventProc * proc)
{
    proc->background = -1;

    gPlaySt.chapterIndex = proc->script[1];
    RestartBattleMap();

    gBmSt.camera.x = GetCameraCenteredX(proc->script[2] * 16);
    gBmSt.camera.y = GetCameraCenteredY(proc->script[3] * 16);

    RefreshEntityMaps();
    RenderMap();
    RefreshUnitSprites();

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_SetMapId(struct EventProc * proc)
{
    gPlaySt.chapterIndex = SCR_HI16(proc->script[0]);
    return EVENT_CMDRET_CONTINUE;
}

void Event_EndSkip(struct EventProc * proc)
{
    proc->flags &= ~EVENT_FLAG_SKIPPED;

    ApplySystemGraphics();
    UnpackChapterMapPalette();
    ApplyUnitSpritePalettes();

    SetDispEnable(1, 1, 1, 1, 1);

    proc->unk_4D = TRUE;
    proc->idle_func = NULL;
}

int EvtCmd_NoSkip(struct EventProc * proc)
{
    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
        Event_EndSkip(proc);

    proc->flags |= EVENT_FLAG_NOAUTOCLEAR;
    return EVENT_CMDRET_YIELD;
}

int EvtCmd_NoSkipTalk(struct EventProc * proc)
{
    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
        Event_EndSkip(proc);

    proc->flags |= EVENT_FLAG_NOAUTOCLEAR | EVENT_FLAG_NOSKIPTALK;
    return EVENT_CMDRET_YIELD;
}

int EvtCmd_NoSkipTalkSlow(struct EventProc * proc)
{
    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
        Event_EndSkip(proc);

    proc->flags |= EVENT_FLAG_NOAUTOCLEAR | EVENT_FLAG_NOSKIPTALK | EVENT_FLAG_SLOWTALK;
    return EVENT_CMDRET_YIELD;
}

int EvtCmd_YesSkip(struct EventProc * proc)
{
    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
        return EVENT_CMDRET_CONTINUE;

    proc->flags &= ~(EVENT_FLAG_ENDMAPMAIN | EVENT_FLAG_NOAUTOCLEAR | EVENT_FLAG_NOSKIPTALK | EVENT_FLAG_SLOWTALK);
    return EVENT_CMDRET_YIELD;
}

int EvtCmd_SilentSkip(struct EventProc * proc)
{
    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
        return EVENT_CMDRET_CONTINUE;

    proc->flags = EVENT_FLAG_ENDMAPMAIN;
    return EVENT_CMDRET_YIELD;
}

int EvtCmd_NoSkipUnlessNewGamePlus(struct EventProc * proc)
{
    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
        Event_EndSkip(proc);

    if (!IsGamePlayedThrough())
        proc->flags |= EVENT_FLAG_NOAUTOCLEAR;

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_NoSkipTalkSlowUnlessNewGamePlus(struct EventProc * proc)
{
    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
        Event_EndSkip(proc);

    if (IsGamePlayedThrough())
        proc->flags |= EVENT_FLAG_NOAUTOCLEAR | EVENT_FLAG_SLOWTALK;
    else
        proc->flags |= EVENT_FLAG_NOAUTOCLEAR | EVENT_FLAG_NOSKIPTALK | EVENT_FLAG_SLOWTALK;

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_NoSkipSlowUnlessNewGamePlus(struct EventProc * proc)
{
    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
        Event_EndSkip(proc);

    if (IsGamePlayedThrough())
        proc->flags |= EVENT_FLAG_NOSKIPTALK | EVENT_FLAG_SLOWTALK;
    else
        proc->flags |= EVENT_FLAG_NOAUTOCLEAR | EVENT_FLAG_NOSKIPTALK | EVENT_FLAG_SLOWTALK;

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_FadeToBlack(struct EventProc * proc)
{
    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
        return EVENT_CMDRET_CONTINUE;

    StartLockingFadeToBlack(SCR_HI16(proc->script[0]), proc);
    return EVENT_CMDRET_YIELD;
}

int EvtCmd_FadeFromBlack(struct EventProc * proc)
{
    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
        return EVENT_CMDRET_CONTINUE;

    StartLockingFadeFromBlack(SCR_HI16(proc->script[0]), proc);
    return EVENT_CMDRET_YIELD;
}

int EvtCmd_LynModeDeathFadeToBlack(struct EventProc * proc)
{
    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
        return EVENT_CMDRET_CONTINUE;

    StartLockingFadeToBlack(GetLynModeDeathFlag() ? 0x10 : 4, proc);
    return EVENT_CMDRET_YIELD;
}

int EvtCmd_FadeToWhite(struct EventProc * proc)
{
    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
        return EVENT_CMDRET_CONTINUE;

    StartLockingFadeToWhite(SCR_HI16(proc->script[0]), proc);
    return EVENT_CMDRET_YIELD;
}

int EvtCmd_FadeFromWhite(struct EventProc * proc)
{
    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
        return EVENT_CMDRET_CONTINUE;

    StartLockingFadeFromWhite(SCR_HI16(proc->script[0]), proc);
    return EVENT_CMDRET_YIELD;
}

int EvtCmd_ExitMap(struct EventProc * proc)
{
    Event_SetExitMap();
    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_EnterMap(struct EventProc * proc)
{
    Event_SetEnterMap();
    return EVENT_CMDRET_CONTINUE;
}

int sub_0800E8A4(struct EventProc * proc)
{
    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
        return EVENT_CMDRET_CONTINUE;

    sub_080AEC5C(proc->script[1], proc->script[2], proc->script[3], proc);
    return EVENT_CMDRET_YIELD;
}

int sub_0800E8CC(struct EventProc * proc)
{
    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
        return EVENT_CMDRET_CONTINUE;

    sub_080AECB0(proc->script[1], proc->script[2], proc->script[3], proc);
    return EVENT_CMDRET_YIELD;
}

int EvtCmd_GiveGold(struct EventProc * proc)
{
    int amount = proc->script[1];

    if (amount == 0)
        amount = proc->unk_58;

    if (SCR_HI16(proc->script[0]) != 0)
    {
        SetGold(GetGold() + amount);
        StartPopup_800EE90(amount, proc);
    }
    else
    {
        if ((gActiveUnit->index & 0xC0) == 0)
            SetGold(GetGold() + amount);

        StartPopup_800EE4C(amount, proc);
    }

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_FightScript(struct EventProc * proc)
{
    struct Unit * unit_a;
    struct Unit * unit_b;
    struct BattleHit * hits;
    int ballista;
    int no_script;
    int item;

    SetBattleScriptted();

    unit_a = GetUnitFromCharId(proc->script[1]);
    unit_b = GetUnitFromCharId(proc->script[2]);
    hits = (struct BattleHit *) proc->script[3];
    ballista = (proc->script[4] >> 16) & 0xFF;
    no_script = (proc->script[4] >> 24) & 0xFF;
    item = proc->script[4] & 0xFFFF;

    gActionSt.battle_scr = (no_script == 0) ? (struct BattleHit *) hits : NULL;

    if (GetItemType(unit_a->items[0]) == 4 || item != 0)
    {
        BattleInitItemEffect(unit_a, 0);
        BattleInitItemEffectTarget(unit_b);
    }
    else if (ballista == 0)
    {
        BattleGenerateReal(unit_a, unit_b);
    }
    else
    {
        BattleGenerateBallistaReal(unit_a, unit_b);
    }

    gBattleActor.expGain = 0;
    gBattleTarget.expGain = 0;

    gBattleActor.weaponBefore = gBattleActor.weapon = GetUnitEquippedWeapon(unit_a);
    gBattleTarget.weaponBefore = gBattleTarget.weapon = GetUnitEquippedWeapon(unit_b);

    if (item != 0)
    {
        gBattleActor.weapon = item + 0x100;
        gBattleActor.weaponBefore = item + 0x100;

        switch (item)
        {
        case 0x7C:
        case 0x7D:
        case 0x7E:
        case 0x7F:
            gBattleStats.config = 0x200;
            break;
        }
    }

    if (no_script == 0)
    {
        ClearBattleHits();

        while (TRUE)
        {
            *gBattleHitIterator = *hits;

            if (hits->info & BATTLE_HIT_INFO_END)
                break;

            BattleHitAdvance();
            hits++;
        }

        BattleHitTerminate();
    }

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0 || proc->unk_4D)
    {
        BattleApplyUnitUpdates();
        SetBattleUnscriptted();
        gActionSt.battle_scr = NULL;
        return EVENT_CMDRET_CONTINUE;
    }

    proc->unk_52 = GetGameLock();
    proc->idle_func = EventScriptedBattleWait;

    UnitBeginAction(unit_a);
    HideUnitSprite(gActiveUnit);
    StartMu(gActiveUnit);
    MU_SetDefaultFacing_Auto();
    BeginBattleAnimations();

    Proc_Mark(proc, 7);

    gAiDecision.x_move = unit_a->xPos;
    gAiDecision.y_move = unit_a->yPos;

    return EVENT_CMDRET_YIELD;
}

void EventScriptedBattleWait(struct EventProc * proc)
{
    if (proc->unk_52 == GetGameLock())
    {
        proc->idle_func = EventScriptedBattleWaitB;
        BattleApplyUnitUpdates();
        gActionSt.battle_scr = NULL;
    }
}

void EventScriptedBattleWaitB(struct EventProc * proc)
{
    proc->idle_func = NULL;
    Proc_Mark(proc, 6);
    AiEndMuAndRefreshUnits();
}

int EvtCmd_SetNoReloadGfx(struct EventProc * proc)
{
    proc->flags |= EVENT_FLAG_DISABLETEXTSKIP;
    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_OnSkipFunc(struct EventProc * proc)
{
    proc->skip_func = (void *) proc->script[1];
    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_ClearOnSkipFunc(struct EventProc * proc)
{
    proc->skip_func = NULL;
    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_SetWeatherWithFade(struct EventProc * proc)
{
    struct EventWeatherChangeProc * child = Proc_StartBlocking(ProcScr_EventWeatherChangeWithFade, proc);
    child->weather = SCR_HI16(proc->script[0]);
    return EVENT_CMDRET_YIELD;
}

int EvtCmd_SetWeather(struct EventProc * proc)
{
    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
    {
        SetWeather(SCR_HI16(proc->script[0]));
    }
    else
    {
        struct EventWeatherChangeProc * child = Proc_StartBlocking(ProcScr_EventWeatherChangeWithFade, proc);
        child->weather = SCR_HI16(proc->script[0]);
    }

    return EVENT_CMDRET_YIELD;
}

void EventWeatherChangeWithFade_SetWeather(struct EventWeatherChangeProc * proc)
{
    SetWeather(proc->weather);
}

int EvtCmd_SetVision(struct EventProc * proc)
{
    int vision = SCR_HI16(proc->script[0]);

    if ((proc->flags & EVENT_FLAG_SKIPPED) == 0)
        SetVisionWithFade(vision);
    else
        SetVision(vision);

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_SetVisionInstant(struct EventProc * proc)
{
    SetVision(SCR_HI16(proc->script[0]));
    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_BreakItemSeal(struct EventProc * proc)
{
    BreakItemSealForPid(proc->script[1], proc->script[2]);
    SetFlag(proc->script[3]);
    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_EnqueueEvent(struct EventProc * proc)
{
    StartEvent(proc->script + 1);
    return EVENT_CMDRET_CONTINUE;
}
