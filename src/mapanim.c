#include "gbafe.h"

// not yet declared in headers
bool DidBattleUnitBreakWeapon(struct BattleUnit * bu);
void EndManimInfoWindow(void);
struct ProcCmd * sub_08075638(void);
void StartManimPoisonAnim(struct Unit * unit);
bool ManimShouldBuDisplayWeaponBroke(struct BattleUnit * bu);
bool ManimShouldBuDisplayWeaponLevelGained(struct BattleUnit * bu);

bool CheckBattleDefeatTalk(u8 pid);
void DisplayDefeatTalkForPid(u8 pid);
void StartBattleTalk(u8 pid_a, u8 pid_b);
u8 GetSpellAssocReturnBool(u16 item);
void StartManimInfoWindow(int x, int y, ProcPtr parent);

extern struct ProcCmd ProcScr_ManimEnd[];
extern struct ProcCmd ProcScr_ManimExpBar[];

void Manim_StoleItemPopup(ProcPtr proc)
{
    switch (gManimSt.manim_kind)
    {
    case 1:
        break;

    default:
        return;
    }

    StartStoleItemPopup(gManimSt.actor[1].bu->weapon, proc);
}

void Manim_WeaponBrokePopup(ProcPtr proc)
{
    struct BattleUnit * bu = NULL;

    if (ManimShouldBuDisplayWeaponBroke(&gBattleActor))
        bu = &gBattleActor;

    if (ManimShouldBuDisplayWeaponBroke(&gBattleTarget))
        bu = &gBattleTarget;

    if (bu != NULL)
        sub_0800EDE0(bu->weaponBefore, proc);
}

bool ManimShouldBuDisplayWeaponBroke(struct BattleUnit * bu)
{
    if (UNIT_FACTION(&bu->unit) == FACTION_BLUE)
        return DidBattleUnitBreakWeapon(bu);

    return FALSE;
}

void Manim_WeaponLevelGainedPopup(ProcPtr proc)
{
    struct BattleUnit * bu = NULL;

    if (ManimShouldBuDisplayWeaponLevelGained(&gBattleActor))
        bu = &gBattleActor;

    if (ManimShouldBuDisplayWeaponLevelGained(&gBattleTarget))
        bu = &gBattleTarget;

    if (bu != NULL)
        sub_0800EE28(bu->weaponType, proc);
}

bool ManimShouldBuDisplayWeaponLevelGained(struct BattleUnit * bu)
{
    if (UNIT_FACTION(&bu->unit) == FACTION_BLUE)
        if (HasBattleUnitGainedWeaponLevel(bu))
            return TRUE;

    return FALSE;
}

void Manim_PrepareBattleTalk(ProcPtr proc)
{
    ResetText();
}

void Manim_Finish(ProcPtr proc)
{
    ResetMuAnims();
    ResetTextFont();
    EndManimInfoWindow();
    InitBmBgLayers();
    UnpackUiWindowFrameGraphics();
    ApplySystemObjectsGraphics();

    if (IsEventRunning())
        EndAllMus();
}

void Manim_AdvanceBattleRound(void)
{
    gManimSt.attacker_actor = gManimSt.hit_it->info >> 3 & 1;
    gManimSt.defender_actor = 1 - gManimSt.attacker_actor;

    gManimSt.hit_attributes = gManimSt.hit_it->attributes;
    gManimSt.hit_info = gManimSt.hit_it->info;
    gManimSt.hit_damage = gManimSt.hit_it->hpChange;

    if (gManimSt.main_actor_count == 1)
    {
        gManimSt.attacker_actor = 0;
        gManimSt.defender_actor = 0;
    }

    gManimSt.hit_it++;
}

void Manim_PrepareNextBattleRound(ProcPtr proc)
{
    if (gManimSt.hit_it->info & BATTLE_HIT_INFO_END)
    {
        Proc_Break(proc);
        Proc_GotoScript(proc, ProcScr_ManimEnd);
        return;
    }

    Manim_AdvanceBattleRound();
    Proc_Break(proc);
}

void Manim_DisplayRoundAnim(ProcPtr proc)
{
    Proc_StartBlocking(sub_08075638(), proc);
}

void Manim_ShowPoisonEffectIfAny(ProcPtr proc)
{
    if (gManimSt.hit_attributes & BATTLE_HIT_ATTR_POISON)
    {
        StartManimPoisonAnim(gManimSt.actor[gManimSt.defender_actor].unit);
        StartTemporaryLock(proc, 100);
    }
}

void Manim_MoveCameraOntoSubject(ProcPtr proc)
{
    EnsureCameraOntoPosition(proc, gManimSt.actor[0].unit->xPos, gManimSt.actor[0].unit->yPos);
}

void Manim_MoveCameraOntoTarget(ProcPtr proc)
{
    if (gManimSt.main_actor_count == 1)
        return;

    EnsureCameraOntoPosition(proc, gManimSt.actor[1].unit->xPos, gManimSt.actor[1].unit->yPos);
}

void Manim_DisplayDeathQuote(ProcPtr proc)
{
    int actor = -1;

    switch (gManimSt.main_actor_count)
    {
    case 2:
        if (gManimSt.actor[1].hp_cur == 0)
            actor = 1;

        // fallthrough

    case 1:
        if (gManimSt.actor[0].hp_cur == 0)
            actor = 0;

        break;
    }

    if (actor != -1)
    {
        int pid = gManimSt.actor[actor].unit->pCharacterData->number;

        if (CheckBattleDefeatTalk(pid))
        {
            EndManimInfoWindow();
            DisplayDefeatTalkForPid(pid);
            sub_0800ADB8();
        }
    }
}

void Manim_DisplayDeathFade(ProcPtr proc)
{
    int actor = -1;

    switch (gManimSt.main_actor_count)
    {
    case 2:
        if (gManimSt.actor[1].hp_cur == 0)
            actor = 1;

        // fallthrough

    case 1:
        if (gManimSt.actor[0].hp_cur == 0)
            actor = 0;

        break;
    }

    if (actor != -1)
        StartMuDeathFade(gManimSt.actor[actor].mu);
}

void Manim_DisplayExpBar(ProcPtr proc)
{
    struct ManimExpBarProc * exp_proc;
    int actor = -1;

    switch (gManimSt.main_actor_count)
    {
    case 2:
        if (gManimSt.actor[1].bu->expGain != 0)
            actor = 1;

        // fallthrough

    case 1:
        if (gManimSt.actor[0].bu->expGain != 0)
            actor = 0;

        break;
    }

    if (actor >= 0)
    {
        exp_proc = Proc_StartBlocking(ProcScr_ManimExpBar, proc);

        exp_proc->exp_from = gManimSt.actor[actor].bu->expPrevious;
        exp_proc->exp_to = gManimSt.actor[actor].bu->expPrevious + gManimSt.actor[actor].bu->expGain;
        exp_proc->actor = actor;
    }
}

void Manim_InitInfoBox(ProcPtr proc)
{
    int y;

    SetBlendNone();

    switch (gManimSt.manim_kind)
    {
    case 1:
    case 2:
        return;

    default:
        break;
    }

    if (!GetSpellAssocReturnBool(gManimSt.actor[0].bu->weaponBefore))
        return;

    if (gManimSt.main_actor_count == 1)
    {
        y = (gManimSt.actor[0].unit->yPos << 4) - gBmSt.camera.y;

        if (y >= 112)
            y = y - 40;
        else
            y = y + 24;
    }
    else
    {
        int array[2];
        int i;
        int actor;

        for (i = 0; i < gManimSt.main_actor_count; ++i)
            array[i] = (gManimSt.actor[i].unit->yPos << 4) - gBmSt.camera.y;

        if (ABS(array[0] - array[1]) >= 80)
        {
            y = 64;
        }
        else
        {
            actor = array[0] > array[1] ? 0 : 1;

            if (array[actor] >= 112)
                y = array[1 - actor] - 40;
            else
                y = array[actor] + 24;
        }
    }

    StartManimInfoWindow(15, y / 8, proc);
}

void Manim_CallBattleQuoteEvents(ProcPtr proc)
{
    switch (gManimSt.main_actor_count)
    {
    case 2:
        StartBattleTalk(
            gManimSt.actor[0].unit->pCharacterData->number, gManimSt.actor[1].unit->pCharacterData->number);
        break;

    default:
        break;
    }

    sub_0800ADB8();
}

void SetBattleMuPaletteByIndex(int actor)
{
}

void SetBattleMuPalette(ProcPtr proc)
{
    switch (gManimSt.main_actor_count)
    {
    case 2:
        SetBattleMuPaletteByIndex(1);

        // fallthrough

    case 1:
        SetBattleMuPaletteByIndex(0);
    }
}

void Manim_PlayStealSe(void)
{
    PlaySoundEffect(0xA0);
}
