#include "gbafe.h"

/* auto-decls */
void NewEfxFarAttackWithDistance(struct Anim * anim, s16 arg);
void EfxPlayHittedSFX(struct Anim * anim);
extern const struct ProcCmd ProcScr_efxShooter[];
extern int gEfxBgSemaphore;
extern const struct ProcCmd ProcScr_efxShooterOBJ[];
extern u32 AnimScr_08BA5D9C[];
extern u32 AnimScr_08BA5E38[];

void StartSpellAnimBallista(struct Anim * anim);
void efxShooter_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxShooterOBJ(struct Anim * anim);
void efxShooterOBJ_Loop(struct ProcEfxOBJ * proc);



// 0.94 efxmagic-ballista:StartSpellAnimBallista
void StartSpellAnimBallista(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxShooter, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    PlaySFX(0x136, 0x100, proc->anim->xPosition, 1);

    return;
}

// 0.95 efxmagic-ballista:efxShooter_Loop_Main
void efxShooter_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);

    proc->timer++;

    if (proc->timer == 2)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
        return;
    }
    else
    {
        int timer = proc->timer;

        if (timer == 34)
        {
            PlaySFX(0x137, 0x100, proc->anim->xPosition, 1);
        }
        else if (timer == 42)
        {
            StartSubSpell_efxShooterOBJ(anim);
        }
        else if (timer == 45)
        {
            anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

            StartBattleAnimHitEffectsDefault(anim, proc->hitted);

            if (GetEfxHpChangeType(anim) != 2)
            {
                if (CheckRoundCrit(proc->anim) == 1)
                {
                    NewEfxPierceCritical(anim);
                }
                else
                {
                    if (proc->hitted)
                    {
                        return;
                    }

                    NewEfxNormalEffect(proc->anim);
                }
            }

            if (!proc->hitted)
            {
                EfxPlayHittedSFX(anim);
            }
        }
        else if (timer == 62)
        {
            return;
        }
        else if (timer == 64)
        {
            SpellFx_Finish();
            Proc_Break(proc);
        }
    }

    return;
}

// 0.77 efxmagic-ballista:StartSubSpell_efxShooterOBJ
void StartSubSpell_efxShooterOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxShooterOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    frontAnim = EfxCreateFrontAnim(anim, AnimScr_08BA5D9C, AnimScr_08BA5E38, AnimScr_08BA5D9C, AnimScr_08BA5E38);
    proc->anim2 = frontAnim;

    frontAnim->yPosition += 16;

    frontAnim->oam2Base &= OAM2_LAYER(3);

    if (GetAnimPosition(anim) == 1)
    {
        frontAnim->oam2Base |= OAM2_CHR(0x200) + OAM2_PAL(7);
    }
    else
    {
        frontAnim->oam2Base |= OAM2_CHR(0x300) + OAM2_PAL(9);
    }

    return;
}

// 0.95 efxmagic-ballista:efxShooterOBJ_Loop
void efxShooterOBJ_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer > 10)
    {
        AnimDelete(proc->anim2);
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}

SECTION(".rodata.08BA17DC")
const struct ProcCmd ProcScr_efxShooter[] = {
    PROC_19,
    PROC_REPEAT(efxShooter_Loop_Main),
    PROC_END,
};

SECTION(".rodata.08BA17F4")
const struct ProcCmd ProcScr_efxShooterOBJ[] = {
    PROC_19,
    PROC_REPEAT(efxShooterOBJ_Loop),
    PROC_END,
};
