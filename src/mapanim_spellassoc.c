#include "gbafe.h"

// not yet declared in headers
u8 GetSpellAssocReturnBool(u16 item);
u8 GetSpellAssocFlashColor(u16 item);

extern struct ProcCmd CONST_DATA ProcScr_ManimDefaultItemEffect[];
extern u8 const Img_ManimAntitoxin[];
extern u16 const Pal_ManimAntitoxin[];
extern u16 const Pal_ManimPureWater[];
extern u8 const Img_ManimHeal[];
extern u8 const Img_ManimMend[];
extern u8 const Img_ManimRecover[];
extern u8 const Img_ManimLatona1[];
extern u16 const Pal_ManimLatona[];

struct ProcCmd const * Manim_GetRoundProcScript(void)
{
    if (gManimSt.special_proc_scr == NULL)
        return ProcScr_ManimDefaultItemEffect;

    return gManimSt.special_proc_scr;
}

void Manim_AnimateSubjectIdle(ProcPtr proc)
{
    StartMuActionAnim(gManimSt.actor[gManimSt.attacker_actor].mu);
}

void Manim_SubjectResetAnim(ProcPtr proc)
{
    StartMuDelayedFaceDefender(gManimSt.actor[gManimSt.attacker_actor].mu);
}

void Manim_StartDanceAnim(ProcPtr proc)
{
    if (gManimSt.actor[gManimSt.attacker_actor].unit->pClassData->number == 0x40) // dancer
        CallDelayed(Manim_PlayDanceSe, 9);
    else
        CallDelayed(Manim_PlayRefreshSe, 12);

    gManimSt.actor[gManimSt.attacker_actor].mu->sprite_anim->clock = 0;
    gManimSt.actor[gManimSt.attacker_actor].mu->sprite_anim->clock_interval_q8 = 0x100;
    SetSpriteAnimId(gManimSt.actor[gManimSt.attacker_actor].mu->sprite_anim, 5);
}

void Manim_PlayDanceSe(void)
{
    PlaySeSpacial(0x2D5, gManimSt.actor[gManimSt.attacker_actor].unit->xPos * 16 - gBmSt.camera.x);
}

void Manim_PlayRefreshSe(void)
{
    PlaySeSpacial(0x2D6, gManimSt.actor[gManimSt.attacker_actor].unit->xPos * 16 - gBmSt.camera.x);
}

void Manim_StopDanceAnim(ProcPtr proc)
{
    gManimSt.actor[gManimSt.attacker_actor].mu->sprite_anim->clock = 0;
    gManimSt.actor[gManimSt.attacker_actor].mu->sprite_anim->clock_interval_q8 = 0;
}

void Manim_BeginSubjectFastAnim(ProcPtr proc)
{
    StartMuSpeedUpAnim(gManimSt.actor[gManimSt.attacker_actor].mu);
}

#define STEP_TOWARDS(dst, src) (16 * ((src) - (dst) > 0 ? 1 : ((src) - (dst) < 0 ? -1 : 0)))

void ManimMoveUnitTowardsTarget(struct MuProc * mu1, struct MuProc * mu2)
{
    mu1->x_q4 = mu1->x_q4 + STEP_TOWARDS(mu1->x_q4, mu2->x_q4);
    mu1->y_q4 = mu1->y_q4 + STEP_TOWARDS(mu1->y_q4, mu2->y_q4);
}

void ManimMoveUnitAwayFromTarget(struct MuProc * mu1, struct MuProc * mu2)
{
    mu1->x_q4 = mu1->x_q4 + STEP_TOWARDS(mu2->x_q4, mu1->x_q4);
    mu1->y_q4 = mu1->y_q4 + STEP_TOWARDS(mu2->y_q4, mu1->y_q4);
}

void Manim_MoveSubjectsTowardsTarget(ProcPtr proc)
{
    struct MuProc * mu, * mu2;

    mu = gManimSt.actor[gManimSt.attacker_actor].mu;
    mu2 = gManimSt.actor[gManimSt.defender_actor].mu;
    ManimMoveUnitTowardsTarget(mu, mu2);

    if (gManimSt.hit_attributes & BATTLE_HIT_ATTR_TATTACK)
    {
        mu = gManimSt.actor[2].mu;
        ManimMoveUnitTowardsTarget(mu, mu2);

        mu = gManimSt.actor[3].mu;
        ManimMoveUnitTowardsTarget(mu, mu2);
    }
}

void Manim_MoveSubjectsAwayFromTarget(ProcPtr proc)
{
    struct MuProc * mu, * mu2;

    mu = gManimSt.actor[gManimSt.attacker_actor].mu;
    mu2 = gManimSt.actor[gManimSt.defender_actor].mu;
    ManimMoveUnitAwayFromTarget(mu, mu2);

    if (gManimSt.hit_attributes & BATTLE_HIT_ATTR_TATTACK)
    {
        mu = gManimSt.actor[2].mu;
        ManimMoveUnitAwayFromTarget(mu, mu2);

        mu = gManimSt.actor[3].mu;
        ManimMoveUnitAwayFromTarget(mu, mu2);
    }
}

void Manim_MoveCameraOnSubject(ProcPtr proc)
{
    EnsureCameraOntoPosition(proc,
        gManimSt.actor[gManimSt.attacker_actor].unit->xPos,
        gManimSt.actor[gManimSt.attacker_actor].unit->yPos);
}

void Manim_MoveCameraOnTarget(ProcPtr proc)
{
    EnsureCameraOntoPosition(proc,
        gManimSt.actor[gManimSt.defender_actor].unit->xPos,
        gManimSt.actor[gManimSt.defender_actor].unit->yPos);
}

void Manim_SpellWarpMoveCamera(ProcPtr proc)
{
    gManimSt.unk_60 = gBattleTarget.changeHP;
    gManimSt.unk_61 = gBattleTarget.changePow;
    EnsureCameraOntoPosition(proc, gManimSt.unk_60, gManimSt.unk_61);
}

void Manim_BeginRoundSpecificAnims(ProcPtr proc)
{
    int sfx;
    int map_actor = gManimSt.attacker_actor;
    int map_target;
    int wall_broken;

    if (gManimSt.hit_attributes & BATTLE_HIT_ATTR_DEVIL)
        map_target = gManimSt.attacker_actor;
    else
        map_target = gManimSt.defender_actor;

    if (FALSE == GetSpellAssocReturnBool(gManimSt.actor[map_actor].bu->weaponBefore))
    {
        if (gManimSt.hit_attributes & BATTLE_HIT_ATTR_MISS)
            StartManimMissAnim(gManimSt.actor[map_target].unit);

        return;
    }

    gManimSt.hp_bar_busy = 1;

    RegisterManimHpChange(map_target, gManimSt.hit_damage);

    if (gManimSt.hit_attributes & BATTLE_HIT_ATTR_HPSTEAL)
        RegisterManimHpChange(map_actor, -gManimSt.hit_damage);

    if (gManimSt.hit_damage < 0)
        return;

    if (gManimSt.hit_attributes & BATTLE_HIT_ATTR_MISS)
    {
        PlaySeSpacial(0xC8, gManimSt.actor[map_target].unit->xPos * 16 - gBmSt.camera.x);
        StartManimMissAnim(gManimSt.actor[map_target].unit);
        return;
    }

    if (gManimSt.hit_damage == 0)
    {
        PlaySeSpacial(0x2CE, gManimSt.actor[map_target].unit->xPos * 16 - gBmSt.camera.x);
        StartManimNoDamageAnim(gManimSt.actor[map_target].unit);
        return;
    }

    wall_broken = gManimSt.actor[map_target].bu->terrainId == TERRAIN_WALL_BREAKABLE
        || gManimSt.actor[map_target].bu->terrainId == TERRAIN_SNAG;

    if (wall_broken)
    {
        if (gManimSt.hit_info & BATTLE_HIT_INFO_FINISHES)
        {
            sfx = 0xAF;
            StartManimWallBreakAnim(gManimSt.actor[map_target].unit, 1);
        }
        else
        {
            sfx = 0xB0;
            StartManimWallBreakAnim(gManimSt.actor[map_target].unit, 0);
        }
    }
    else
    {
        if (gManimSt.hit_info & BATTLE_HIT_INFO_FINISHES)
            sfx = 0xD5;
        else
            sfx = 0xD2;
    }

    if (gManimSt.hit_attributes & BATTLE_HIT_ATTR_CRIT)
    {
        PlaySeSpacial(sfx, gManimSt.actor[map_target].unit->xPos * 16 - gBmSt.camera.x);

        StartMuCritFlash(gManimSt.actor[map_target].mu,
            GetSpellAssocFlashColor(gManimSt.actor[map_actor].bu->weaponBefore));

        StartManimBgShaker();
        PlaySeSpacial(0xD8, gManimSt.actor[map_target].unit->xPos * 16 - gBmSt.camera.x);

        StartMuSpeedUpAnim(gManimSt.actor[map_actor].mu);
    }
    else
    {
        PlaySeSpacial(sfx, gManimSt.actor[map_target].unit->xPos * 16 - gBmSt.camera.x);

        StartMuHitFlash(gManimSt.actor[map_target].mu,
            GetSpellAssocFlashColor(gManimSt.actor[map_actor].bu->weaponBefore));
    }
}

void RegisterManimHpChange(int actor, int damage)
{
    if (gManimSt.actor[actor].hp_cur <= damage)
        gManimSt.actor[actor].hp_cur = 0;
    else
        gManimSt.actor[actor].hp_cur = gManimSt.actor[actor].hp_cur - damage;

    if (gManimSt.actor[actor].hp_cur > gManimSt.actor[actor].hp_max)
        gManimSt.actor[actor].hp_cur = gManimSt.actor[actor].hp_max;
}

void Manim_WaitForHpBar(ProcPtr proc)
{
    if (gManimSt.hp_bar_busy != FALSE)
        return;

    Proc_Break(proc);
}

void Manim_PoisonEffectOnTarget(ProcPtr proc)
{
    StartManimPoisonAnim(gManimSt.actor[gManimSt.defender_actor].unit);
}

void Manim_CallSpellAssocSilence(ProcPtr proc)
{
    StartManimSilenceFx(gManimSt.actor[gManimSt.defender_actor].unit);
}

void Manim_CallSpellAssocBarrier(ProcPtr proc)
{
    StartManimBarrierFx(gManimSt.actor[gManimSt.defender_actor].unit);
}

void Manim_CallSpellAssocLatona(ProcPtr proc)
{
    StartManimLatonaFx(gManimSt.actor[gManimSt.attacker_actor].unit);
}

void Manim_CallSpellAssocAntitoxin(ProcPtr proc)
{
    StartManimAntitoxinFx(gManimSt.actor[gManimSt.attacker_actor].unit, Img_ManimAntitoxin, Pal_ManimAntitoxin);
}

void Manim_CallSpellAssocPureWater(ProcPtr proc)
{
    StartManimAntitoxinFx(gManimSt.actor[gManimSt.attacker_actor].unit, Img_ManimAntitoxin, Pal_ManimPureWater);
}

void Manim_CallSpellAssocElixir(ProcPtr proc)
{
    StartManimEffectAnimator(gManimSt.actor[gManimSt.defender_actor].unit, Img_ManimRecover, Pal_ManimLatona, 0x8B);
}

void Manim_CallSpellAssocHeal(ProcPtr proc)
{
    StartManimEffectAnimator(gManimSt.actor[gManimSt.defender_actor].unit, Img_ManimLatona1, Pal_ManimLatona, 0x89);
}

void Manim_CallSpellAssocMend(ProcPtr proc)
{
    StartManimEffectAnimator(gManimSt.actor[gManimSt.defender_actor].unit, Img_ManimMend, Pal_ManimLatona, 0x8A);
}

void Manim_CallSpellAssocRecover(ProcPtr proc)
{
    StartManimEffectAnimator(gManimSt.actor[gManimSt.defender_actor].unit, Img_ManimRecover, Pal_ManimLatona, 0x8B);
}

void Manim_CallSpellAssocVulnerary(ProcPtr proc)
{
    StartManimEffectAnimator(gManimSt.actor[gManimSt.defender_actor].unit, Img_ManimLatona1, Pal_ManimLatona, 0x89);
}

void Manim_SpellWarpStartFlashy(ProcPtr proc)
{
    PlaySoundEffect(0xB4);

    gManimSt.unk_60 = gBattleTarget.changeHP;
    gManimSt.unk_61 = gBattleTarget.changePow;

    StartManimWarpFlashy(
        gManimSt.actor[gManimSt.defender_actor].unit,
        gManimSt.actor[gManimSt.defender_actor].unit->xPos,
        gManimSt.actor[gManimSt.defender_actor].unit->yPos);
}

void Manim_SpellWarpStartFlashyAtNewPos(ProcPtr proc)
{
    StartManimWarpFlashy(gManimSt.actor[gManimSt.defender_actor].unit, gManimSt.unk_60, gManimSt.unk_61);
}

void Manim_CallSpellAssocTorch(ProcPtr proc)
{
    StartManimTorchFx(gManimSt.actor[gManimSt.attacker_actor].unit);
}

void Manim_CallSpellAssocUnlock(ProcPtr proc)
{
    StartManimUnlockFx(gManimSt.unk_60, gManimSt.unk_61);
}

void Manim_CallSpellAssocBerserk(ProcPtr proc)
{
    StartManimBerserkFx(gManimSt.actor[gManimSt.defender_actor].unit);
}

void Manim_CallSpellAssocRestore(ProcPtr proc)
{
    StartManimRestoreFx(gManimSt.actor[gManimSt.defender_actor].unit);
}

void Manim_CallSpellAssocSleep(ProcPtr proc)
{
    StartManimSleepFx(gManimSt.actor[gManimSt.defender_actor].unit);
}

void Manim_CallSpellAssocRepair(ProcPtr proc)
{
    StartManimRepairFx(gManimSt.actor[gManimSt.defender_actor].unit);
}

void Manim_SpellWarpStartFlashFade(ProcPtr proc)
{
    StartMuFadeIntoFlash(gManimSt.actor[gManimSt.defender_actor].mu, 0);
}

void Manim_SpellWarpEndFlashFade(ProcPtr proc)
{
    StartMuFadeFromFlash(gManimSt.actor[gManimSt.defender_actor].mu);
}

void Manim_SpellWarpMuHide(ProcPtr proc)
{
    HideMu(gManimSt.actor[gManimSt.defender_actor].mu);
}

void Manim_SpellWarpStartExplosion(ProcPtr proc)
{
    StartManimStarExplosion(
        gManimSt.actor[gManimSt.defender_actor].unit->xPos * 16 - gBmSt.camera.x + 8,
        gManimSt.actor[gManimSt.defender_actor].unit->yPos * 16 - gBmSt.camera.y + 8);
}

void Manim_SpellWarpStartImplosion(ProcPtr proc)
{
    PlaySoundEffect(0xB5);

    StartManimStarImplosion(
        gManimSt.actor[gManimSt.defender_actor].unit->xPos * 16 - gBmSt.camera.x + 8,
        gManimSt.actor[gManimSt.defender_actor].unit->yPos * 16 - gBmSt.camera.y + 8);
}

void Manim_SpellWarpMuShow(ProcPtr proc)
{
    ShowMu(gManimSt.actor[gManimSt.defender_actor].mu);
}

void Manim_SpellWarpSetNewPosition(ProcPtr proc)
{
    struct Unit * unit = gManimSt.actor[gManimSt.defender_actor].unit;

    SetMuScreenPosition(gManimSt.actor[gManimSt.defender_actor].mu, gManimSt.unk_60 * 16, gManimSt.unk_61 * 16);

    unit->xPos = gManimSt.unk_60;
    unit->yPos = gManimSt.unk_61;
}

void Manim_StartSpellAssocFade(ProcPtr proc)
{
    StartManimSpellAssocFadeExt(proc);
}

void Manim_SpellAssocResetPal(ProcPtr proc)
{
    StartManimSpellAssocResetPalExt(proc);
}
