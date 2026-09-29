#include "gbafe.h"

// ROM data referenced below, defined in data/ (see tools/datasplit.py)
extern const u8 Img_BoltingBg_A[];
extern const u8 Img_BoltingBg_B[];
extern const u8 Img_BoltingBg_C[];
extern const u8 Tsa_BoltingBg_A[];
extern const u8 Tsa_BoltingBg_B[];
extern const u8 Tsa_BoltingBg_C[];
extern const u8 Tsa_BoltingBg_D[];
extern const u8 Tsa_BoltingBg_E[];
extern const u8 Tsa_BoltingBg_F[];
extern const u8 Tsa_BoltingBg_G[];
extern const u8 Tsa_BoltingBg_H[];
extern const u8 Tsa_BoltingBg_I[];
extern const u8 Tsa_BoltingBg_J[];
extern const u8 Tsa_BoltingBg_K[];

/* auto-decls */
void NewEfxSpellCast(void);
void NewEfxFarAttackWithDistance(struct Anim * anim, s16 arg);
void EfxPlayHittedSFX(struct Anim * anim);
void RegisterEfxSpellCastEnd(void);
extern int gEfxBgSemaphore;
extern u16 Pal_BoltingBg[];
extern const AnimScr AnimScr_EfxClasschgOBJ[];
extern u16 Pal_BoltingSprites[];
extern u16 Img_BoltingSprites[];

void StartSpellAnimBolting(struct Anim * anim);
void efxThunderstorm_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxThunderstormBG(struct Anim * anim);
void efxThunderstormBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxThunderstormOBJ(struct Anim * anim);
void efxThunderstormOBJ_Loop(struct ProcEfxOBJ * proc);
void efxThunderstormOBJ_End(struct ProcEfxOBJ * proc);
void StartSubSpell_efxThunderstormCOLOR(struct Anim * anim);
void efxThunderstormColor_Loop_A(struct ProcEfxBGCOL * proc);
void efxThunderstormColor_Loop_B(struct ProcEfxBGCOL * proc);
void efxThunderstormColor_Loop_C(struct ProcEfxBGCOL * proc);
void StartSubSpell_efxThunderstormDARK(struct Anim * anim, int timer, int terminator);
void efxThunderstormDark_Loop_A(struct ProcEfxBGCOL * proc);
void efxThunderstormDark_Loop_B(struct ProcEfxBGCOL * proc);

extern const u16 StartSubSpell_efxThunderstormBG_frames[];

CONST_DATA struct ProcCmd gProcScr_efxThunderstorm[] = {
    PROC_19,
    PROC_REPEAT(efxThunderstorm_Loop_Main),
    PROC_END,
};

CONST_DATA struct ProcCmd gProcScr_efxThunderstormBG[] = {
    PROC_19,
    PROC_REPEAT(efxThunderstormBG_Loop),
    PROC_END,
};

CONST_DATA u16 * ImgArray_BoltingBg[] = {
    (u16 *) Img_BoltingBg_A,
    (u16 *) Img_BoltingBg_A,
    (u16 *) Img_BoltingBg_A,
    (u16 *) Img_BoltingBg_A,
    (u16 *) Img_BoltingBg_B,
    (u16 *) Img_BoltingBg_B,
    (u16 *) Img_BoltingBg_B,
    (u16 *) Img_BoltingBg_B,
    (u16 *) Img_BoltingBg_B,
    (u16 *) Img_BoltingBg_B,
    (u16 *) Img_BoltingBg_C,
};

CONST_DATA u16 * TsaArray_BoltingBg[] = {
    (u16 *) Tsa_BoltingBg_A,
    (u16 *) Tsa_BoltingBg_B,
    (u16 *) Tsa_BoltingBg_C,
    (u16 *) Tsa_BoltingBg_D,
    (u16 *) Tsa_BoltingBg_E,
    (u16 *) Tsa_BoltingBg_F,
    (u16 *) Tsa_BoltingBg_G,
    (u16 *) Tsa_BoltingBg_H,
    (u16 *) Tsa_BoltingBg_I,
    (u16 *) Tsa_BoltingBg_J,
    (u16 *) Tsa_BoltingBg_K,
};

CONST_DATA struct ProcCmd gProcScr_efxThunderstormOBJ[] = {
    PROC_19,
    PROC_REPEAT(efxThunderstormOBJ_Loop),
    PROC_SLEEP(100),
    PROC_REPEAT(efxThunderstormOBJ_End),
    PROC_END,
};

CONST_DATA struct ProcCmd gProcScr_efxThunderstormCOLOR[] = {
    PROC_19,
    PROC_SLEEP(94),
    PROC_REPEAT(efxThunderstormColor_Loop_A),
    PROC_SLEEP(3),
    PROC_REPEAT(efxThunderstormColor_Loop_B),
    PROC_SLEEP(20),
    PROC_REPEAT(efxThunderstormColor_Loop_C),
    PROC_END,
};

CONST_DATA struct ProcCmd gProcScr_efxThunderstormDARK[] = {
    PROC_19,
    PROC_REPEAT(efxThunderstormDark_Loop_A),
    PROC_REPEAT(efxThunderstormDark_Loop_B),
    PROC_END,
};

// 9.99 efxmagic-bolting:StartSpellAnimBolting
void StartSpellAnimBolting(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(gProcScr_efxThunderstorm, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

// 9.99 efxmagic-bolting:efxThunderstorm_Loop_Main
void efxThunderstorm_Loop_Main(struct ProcEfx * proc)
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
        PlaySFX(0x119, 0x100, anim->xPosition, 1);
        StartSubSpell_efxThunderstormBG(anim);
        StartSubSpell_efxThunderstormCOLOR(anim);
    }

    if (proc->timer == duration + 89)
    {
        StartSubSpell_efxThunderstormDARK(anim, 2, 3);
    }

    if (proc->timer == duration + 94)
    {
        StartSubSpell_efxThunderstormOBJ(anim);
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);
        StartBattleAnimHitEffectsDefault(anim, proc->hitted);
        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if ((proc->timer != duration + 195) && (proc->timer == duration + 200))
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-bolting:StartSubSpell_efxThunderstormBG
void StartSubSpell_efxThunderstormBG(struct Anim * anim)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gProcScr_efxThunderstormBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxThunderstormBG_frames;
    proc->tsal = TsaArray_BoltingBg;
    proc->tsar = TsaArray_BoltingBg;
    proc->img = ImgArray_BoltingBg;

    SpellFx_RegisterBgPal(Pal_BoltingBg, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    return;
}

// 9.99 efxmagic-bolting:efxThunderstormBG_Loop
void efxThunderstormBG_Loop(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;
        SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
    }
    else
    {
        if (ret == -1)
        {
            gEfxBgSemaphore--;
            Proc_End(proc);
        }
    }
    return;
}

// 9.99 efxmagic-bolting:StartSubSpell_efxThunderstormOBJ
void StartSubSpell_efxThunderstormOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gProcScr_efxThunderstormOBJ, PROC_TREE_3);
    proc->anim = anim;

    return;
}

// 9.99 efxmagic-bolting:efxThunderstormOBJ_Loop
void efxThunderstormOBJ_Loop(struct ProcEfxOBJ * proc)
{
    proc->anim2 = EfxCreateFrontAnim(proc->anim, AnimScr_EfxClasschgOBJ, AnimScr_EfxClasschgOBJ, AnimScr_EfxClasschgOBJ, AnimScr_EfxClasschgOBJ);

    SpellFx_RegisterObjPal(Pal_BoltingSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BoltingSprites, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

// 9.99 efxmagic-bolting:efxThunderstormOBJ_End
void efxThunderstormOBJ_End(struct ProcEfxOBJ * proc)
{
    AnimDelete(proc->anim2);

    gEfxBgSemaphore--;
    Proc_Break(proc);

    return;
}

// 9.99 efxmagic-bolting:StartSubSpell_efxThunderstormCOLOR
void StartSubSpell_efxThunderstormCOLOR(struct Anim * anim)
{
    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gProcScr_efxThunderstormCOLOR, PROC_TREE_3);
    proc->anim = anim;

    return;
}

// 9.99 efxmagic-bolting:efxThunderstormColor_Loop_A
void efxThunderstormColor_Loop_A(struct ProcEfxBGCOL * proc)
{
    PlaySFX(0x11a, 0x100, proc->anim->xPosition, 1);

    NewEfxFlashBgWhite(proc->anim, 38);

    proc->timer = 0;
    proc->timer2 = 5;

    Proc_Break(proc);

    return;
}

// 9.99 efxmagic-bolting:efxThunderstormColor_Loop_B
void efxThunderstormColor_Loop_B(struct ProcEfxBGCOL * proc)
{
    int ret = Interpolate(INTERPOLATE_LINEAR, 16, 0, proc->timer, proc->timer2);

    CpuFastCopy(gPal, gEfxPal, PLTT_SIZE);

    EfxPalWhiteInOut(gEfxPal, 0, 32, ret);

    proc->timer++;

    if (proc->timer > proc->timer2)
    {
        proc->timer = 0;
        proc->timer2 = 10;
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-bolting:efxThunderstormColor_Loop_C
void efxThunderstormColor_Loop_C(struct ProcEfxBGCOL * proc)
{
    int ret = Interpolate(INTERPOLATE_LINEAR, 16, 0, proc->timer, proc->timer2);
    SetBlendAlpha(ret, 16);

    proc->timer++;

    if (proc->timer > proc->timer2)
    {
        SpellFx_ClearBG1();
        SpellFx_ClearColorEffects();

        gEfxBgSemaphore--;

        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-bolting:StartSubSpell_efxThunderstormDARK
void StartSubSpell_efxThunderstormDARK(struct Anim * anim, int timer, int terminator)
{
    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    CpuFastCopy(gPal, gEfxPal, PLTT_SIZE);

    proc = Proc_Start(gProcScr_efxThunderstormDARK, 0);
    proc->anim = anim;
    proc->timer = 0;
    proc->timer2 = timer;
    proc->terminator = terminator;

    return;
}

// 9.99 efxmagic-bolting:efxThunderstormDark_Loop_A
void efxThunderstormDark_Loop_A(struct ProcEfxBGCOL * proc)
{
    int ret = Interpolate(INTERPOLATE_LINEAR, 0, 16, proc->timer, proc->timer2);
    EfxPalBlackInOut(gEfxPal, 0, 32, ret);

    CpuFastCopy(gEfxPal, (u16 *)PLTT, PLTT_SIZE);
    DisablePalSync();

    proc->timer++;

    if (proc->timer > proc->timer2)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-bolting:efxThunderstormDark_Loop_B
void efxThunderstormDark_Loop_B(struct ProcEfxBGCOL * proc)
{
    CpuFastCopy(gEfxPal, (u16 *)PLTT, PLTT_SIZE);
    DisablePalSync();

    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}

void sub_08059408(struct Anim * anim)
{
}
