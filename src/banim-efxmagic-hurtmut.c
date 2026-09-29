#include "gbafe.h"

/* auto-decls */
void NewEfxSpellCast(void);
void NewEfxFarAttackWithDistance(struct Anim * anim, s16 arg);
void EfxPlayHittedSFX(struct Anim * anim);
void RegisterEfxSpellCastEnd(void);
extern const struct ProcCmd ProcScr_efxHurtmut[];
extern int gEfxBgSemaphore;
extern const struct ProcCmd ProcScr_efxHurtmutOBJ[];
extern u32 AnimScr_EfxBindingBlade_Left[];
extern u32 AnimScr_EfxBindingBlade_Right[];
extern u16 Pal_FireBreathSprites[];
extern u16 Img_BreathSprites[];

void StartSpellAnimHurtmut(struct Anim * anim);
void efxHurtmut_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxHurtmutOBJ(struct Anim * anim);
void efxHurtmutOBJ_Loop(struct ProcEfxOBJ * proc);



// 9.99 efxmagic-bindingblade:StartSpellAnimBindingBlade
void StartSpellAnimHurtmut(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxHurtmut, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

// 0.95 efxmagic-bindingblade:efxHurtmut_Loop_Main
void efxHurtmut_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }

    if (proc->timer == duration + 1)
    {
        PlaySFX(0x10D, 0x100, anim->xPosition, 1);
        StartSubSpell_efxHurtmutOBJ(anim);

        NewEfxFlashBgWhite(proc->anim, 6);

        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (proc->timer == duration + 28)
    {
        NewEfxALPHA(anim, 0, 14, 16, 0, 0);
    }
    else if (proc->timer == duration + 50)
    {
        return;
    }
    else if (proc->timer == duration + 55)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}

// 0.88 efxmagic-bindingblade:StartSubSpell_efxHurtmutOBJ
void StartSubSpell_efxHurtmutOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    u32 * scr;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxHurtmutOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 52;

    if (GetAnimPosition(anim) == 0)
    {
        scr = AnimScr_EfxBindingBlade_Left;
    }
    else
    {
        scr = AnimScr_EfxBindingBlade_Right;
    }

    proc->anim2 = EfxCreateFrontAnim(anim, scr, scr, scr, scr);

    SpellFx_RegisterObjPal(Pal_FireBreathSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BreathSprites, 32 * 4 * CHR_SIZE);

    return;
}

// 9.99 efxmagic-bindingblade:efxHurtmutOBJ_Loop
void efxHurtmutOBJ_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        AnimDelete(proc->anim2);
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}

SECTION(".rodata.08BA1874")
const struct ProcCmd ProcScr_efxHurtmut[] = {
    PROC_19,
    PROC_REPEAT(efxHurtmut_Loop_Main),
    PROC_END,
};

SECTION(".rodata.08BA188C")
const struct ProcCmd ProcScr_efxHurtmutOBJ[] = {
    PROC_19,
    PROC_REPEAT(efxHurtmutOBJ_Loop),
    PROC_END,
};
