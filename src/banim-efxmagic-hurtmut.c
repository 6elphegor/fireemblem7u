#include "gbafe.h"

extern const struct AnimSpriteData AnimSprite_EfxBindingBlade_Left_08BA66C4[],
    AnimSprite_EfxBindingBlade_Left_08BA66DC[], AnimSprite_EfxBindingBlade_Left_08BA66F4[],
    AnimSprite_EfxBindingBlade_Left_08BA673C[], AnimSprite_EfxBindingBlade_Left_08BA6778[],
    AnimSprite_EfxBindingBlade_Left_08BA67D8[], AnimSprite_EfxBindingBlade_Left_08BA685C[],
    AnimSprite_EfxBindingBlade_Left_08BA68BC[], AnimSprite_EfxBindingBlade_Left_08BA691C[],
    AnimSprite_EfxBindingBlade_Left_08BA69D0[], AnimSprite_EfxBindingBlade_Left_08BA6A60[],
    AnimSprite_EfxBindingBlade_Left_08BA6B2C[], AnimSprite_EfxBindingBlade_Left_08BA6C64[],
    AnimSprite_EfxBindingBlade_Left_08BA6D30[], AnimSprite_EfxBindingBlade_Left_08BA6DF0[],
    AnimSprite_EfxBindingBlade_Left_08BA6EA4[], AnimSprite_EfxBindingBlade_Left_08BA6F64[],
    AnimSprite_EfxBindingBlade_Left_08BA6FF4[], AnimSprite_EfxBindingBlade_Left_08BA709C[],
    AnimSprite_EfxBindingBlade_Left_08BA70E4[], AnimSprite_EfxBindingBlade_Left_08BA712C[],
    AnimSprite_EfxBindingBlade_Left_08BA7198[], AnimSprite_EfxBindingBlade_Left_08BA71F8[],
    AnimSprite_EfxBindingBlade_Left_08BA721C[], AnimSprite_EfxBindingBlade_Left_08BA7264[],
    AnimSprite_EfxBindingBlade_Left_08BA727C[], AnimSprite_EfxBindingBlade_Right_08BA7324[],
    AnimSprite_EfxBindingBlade_Right_08BA733C[], AnimSprite_EfxBindingBlade_Right_08BA7354[],
    AnimSprite_EfxBindingBlade_Right_08BA739C[], AnimSprite_EfxBindingBlade_Right_08BA73D8[],
    AnimSprite_EfxBindingBlade_Right_08BA7438[], AnimSprite_EfxBindingBlade_Right_08BA74BC[],
    AnimSprite_EfxBindingBlade_Right_08BA751C[], AnimSprite_EfxBindingBlade_Right_08BA757C[],
    AnimSprite_EfxBindingBlade_Right_08BA7630[], AnimSprite_EfxBindingBlade_Right_08BA76C0[],
    AnimSprite_EfxBindingBlade_Right_08BA778C[], AnimSprite_EfxBindingBlade_Right_08BA78C4[],
    AnimSprite_EfxBindingBlade_Right_08BA7990[], AnimSprite_EfxBindingBlade_Right_08BA7A50[],
    AnimSprite_EfxBindingBlade_Right_08BA7B04[], AnimSprite_EfxBindingBlade_Right_08BA7BC4[],
    AnimSprite_EfxBindingBlade_Right_08BA7C54[], AnimSprite_EfxBindingBlade_Right_08BA7CFC[],
    AnimSprite_EfxBindingBlade_Right_08BA7D44[], AnimSprite_EfxBindingBlade_Right_08BA7D8C[],
    AnimSprite_EfxBindingBlade_Right_08BA7DF8[], AnimSprite_EfxBindingBlade_Right_08BA7E58[],
    AnimSprite_EfxBindingBlade_Right_08BA7E7C[], AnimSprite_EfxBindingBlade_Right_08BA7EC4[],
    AnimSprite_EfxBindingBlade_Right_08BA7EDC[];

/* auto-decls */
void NewEfxSpellCast(void);
void NewEfxFarAttackWithDistance(struct Anim * anim, s16 arg);
void EfxPlayHittedSFX(struct Anim * anim);
void RegisterEfxSpellCastEnd(void);
extern const struct ProcCmd ProcScr_efxHurtmut[];
extern int gEfxBgSemaphore;
extern const struct ProcCmd ProcScr_efxHurtmutOBJ[];
extern const AnimScr AnimScr_EfxBindingBlade_Left[];
extern const AnimScr AnimScr_EfxBindingBlade_Right[];
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
    const AnimScr * scr;

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

SECTION(".rodata.08BA72B8")
const AnimScr AnimScr_EfxBindingBlade_Left[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Left_08BA66C4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Left_08BA66DC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Left_08BA66F4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Left_08BA673C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Left_08BA6778, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Left_08BA67D8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Left_08BA685C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Left_08BA68BC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Left_08BA691C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Left_08BA69D0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Left_08BA6A60, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Left_08BA6B2C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Left_08BA6C64, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Left_08BA6D30, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Left_08BA6DF0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Left_08BA6EA4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Left_08BA6F64, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Left_08BA6FF4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Left_08BA709C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Left_08BA70E4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Left_08BA712C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Left_08BA7198, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Left_08BA71F8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Left_08BA721C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Left_08BA7264, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Left_08BA727C, 2),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BA7F18")
const AnimScr AnimScr_EfxBindingBlade_Right[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right_08BA7324, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right_08BA733C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right_08BA7354, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right_08BA739C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right_08BA73D8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right_08BA7438, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right_08BA74BC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right_08BA751C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right_08BA757C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right_08BA7630, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right_08BA76C0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right_08BA778C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right_08BA78C4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right_08BA7990, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right_08BA7A50, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right_08BA7B04, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right_08BA7BC4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right_08BA7C54, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right_08BA7CFC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right_08BA7D44, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right_08BA7D8C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right_08BA7DF8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right_08BA7E58, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right_08BA7E7C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right_08BA7EC4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right_08BA7EDC, 2),
    ANIMSCR_BLOCKED,
};
