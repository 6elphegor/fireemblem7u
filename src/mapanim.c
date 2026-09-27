#include "gbafe.h"

// not yet declared in headers
bool DidBattleUnitBreakWeapon(struct BattleUnit * bu);
void EndManimInfoWindow(void);
struct ProcCmd * sub_08075638(void);
void sub_0807160C(struct Unit * unit);
bool ManimShouldBuDisplayWeaponBroke(struct BattleUnit * bu);
bool ManimShouldBuDisplayWeaponLevelGained(struct BattleUnit * bu);

extern struct ProcCmd ProcScr_ManimEnd[];

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
        sub_0807160C(gManimSt.actor[gManimSt.defender_actor].unit);
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

ASM_FUNC("asm/nonmatching/code_0806E6B0.s");
ASM_FUNC("asm/nonmatching/code_0806E750.s");
ASM_FUNC("asm/nonmatching/code_0806E7C4.s");
ASM_FUNC("asm/nonmatching/code_0806E8D8.s");
ASM_FUNC("asm/nonmatching/code_0806EA94.s");
ASM_FUNC("asm/nonmatching/code_0806EADC.s");
ASM_FUNC("asm/nonmatching/code_0806EAEC.s");
ASM_FUNC("asm/nonmatching/code_0806EB20.s");
