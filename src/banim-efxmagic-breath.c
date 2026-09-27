#include "gbafe.h"

/* auto-decls */
void NewEfxFarAttackWithDistance(struct Anim * anim, s16 arg);
void EfxPlayHittedSFX(struct Anim * anim);
void NewEfxSpellCast(void);
void RegisterEfxSpellCastEnd(void);
extern struct ProcCmd ProcScr_efxFirebreath[];
extern int gEfxBgSemaphore;
extern struct ProcCmd ProcScr_efxFirebreathOBJ[];
extern u32 AnimScr_FirebreathOBJ_Left[];
extern u32 AnimScr_FirebreathOBJ_Right[];
extern u16 Pal_FireBreathSprites[];
extern u16 Img_BreathSprites[];
extern struct ProcCmd ProcScr_efxFirebreathBG[];
extern u16 Img_FireBreathBg[];
extern u16 Tsa_FireBreathBg[];
extern struct ProcCmd ProcScr_efxFirebreathBGCOL[];
extern u16 Pal_FireBreathBg[];
extern struct ProcCmd ProcScr_efxIcebreath[];
extern struct ProcCmd ProcScr_efxIcebreathOBJ[];
extern u32 AnimScr_IcebreathOBJ_Right[];
extern u32 AnimScr_IcebreathOBJ_Left[];
extern u16 Pal_IceBreathSprites[];
extern struct ProcCmd ProcScr_efxDarkbreath[];
extern struct ProcCmd ProcScr_efxDarkbreathBG[];
extern u16 * TsaArray_DarkBreathBg[];
extern u16 Img_DarkBreathBg[];
extern struct ProcCmd ProcScr_efxDarkbreathBGCOL[];
extern u16 Pal_BoltingBg[];
extern struct ProcCmd ProcScr_efxDarkbreathOBJ[];
extern u32 AnimScr_DarkBreath[];
extern u16 Pal_DarkBreathSprites[];

void StartSpellAnimFireBreath(struct Anim * anim);
void efxFirebreath_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxFirebreathOBJ(struct Anim * anim);
void efxFirebreathOBJ_Loop(struct ProcEfxOBJ * proc);
void StartSubSpell_efxFirebreathBG(struct Anim * anim);
void efxFirebreathBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxFirebreathBGCOL(struct Anim * anim);
void efxFirebreathBGCOL_Loop(struct ProcEfxBGCOL * proc);
void StartSpellAnimIceBreath(struct Anim * anim);
void efxIcebreath_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxIcebreathOBJ(struct Anim * anim);
void efxIcebreathOBJ_OnEnd(struct ProcEfxOBJ * proc);
void StartSpellAnimDarkBreath(struct Anim * anim);
void efxDarkbreath_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxDarkbreathBG(struct Anim * anim);
void efxDarkbreathBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxDarkbreathBGCOL(struct Anim * anim);
void efxDarkbreathBGCOL_Loop(struct ProcEfxBGCOL * proc);
void StartSubSpell_efxDarkbreathOBJ(struct Anim * anim);
void efxDarkbreathOBJ_Loop(struct ProcEfxOBJ * proc);

extern const u16 StartSubSpell_efxFirebreathBGCOL_frames[];
extern const u16 StartSubSpell_efxDarkbreathBG_frames[];
extern const u16 StartSubSpell_efxDarkbreathBGCOL_frames[];

// 9.99 efxmagic-breath:StartSpellAnimFireBreath
void StartSpellAnimFireBreath(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxFirebreath, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

// 9.99 efxmagic-breath:efxFirebreath_Loop_Main
void efxFirebreath_Loop_Main(struct ProcEfx * proc)
{
    int timer;
    struct Anim * anim = GetAnimAnotherSide(proc->anim);

    proc->timer++;

    if (proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }

    timer = proc->timer;

    if (timer == 1)
    {
        StartSpellThing_MagicQuake(proc->anim, 90, 10);

        StartSubSpell_efxFirebreathOBJ(anim);
        StartSubSpell_efxFirebreathBG(anim);
        StartSubSpell_efxFirebreathBGCOL(anim);

        NewEfxALPHA(anim, 40, 15, 16, 0, 0);

        PlaySFX(0x11D, 0x100, anim->xPosition, 1);
    }
    else if (timer == 15)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (timer == 130)
    {
        SpellFx_Finish();
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-breath:StartSubSpell_efxFirebreathOBJ
void StartSubSpell_efxFirebreathOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    u32 * scr;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFirebreathOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 52;

    if (GetAnimPosition(anim) == 0)
    {
        scr = AnimScr_FirebreathOBJ_Left;
    }
    else
    {
        scr = AnimScr_FirebreathOBJ_Right;
    }

    frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;

    if (gEkrDistanceType == 0)
    {
        if (GetAnimPosition(anim) == 0)
        {
            frontAnim->xPosition += 16;
        }
        else
        {
            frontAnim->xPosition -= 16;
        }
    }
    else
    {
        if (GetAnimPosition(anim) == 0)
        {
            frontAnim->xPosition += 72;
        }
        else
        {
            frontAnim->xPosition -= 72;
        }
    }

    SpellFx_RegisterObjPal(Pal_FireBreathSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BreathSprites, 32 * 4 * CHR_SIZE);

    return;
}

// 9.99 efxmagic-breath:efxFirebreathOBJ_Loop
void efxFirebreathOBJ_Loop(struct ProcEfxOBJ * proc)
{
    if (gEkrDistanceType != 0)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            proc->anim2->xPosition = proc->anim->xPosition + 72;
        }
        else
        {
            proc->anim2->xPosition = proc->anim->xPosition - 72;
        }
    }

    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        AnimDelete(proc->anim2);
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-breath:StartSubSpell_efxFirebreathBG
void StartSubSpell_efxFirebreathBG(struct Anim * anim)
{
    struct ProcEfxBG * proc;
    u16 * tsa;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFirebreathBG, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 112;

    SpellFx_RegisterBgGfx(Img_FireBreathBg, 32 * 8 * CHR_SIZE);

    tsa = Tsa_FireBreathBg;
    SpellFx_WriteBgMap(proc->anim, tsa, tsa);

    SpellFx_SetBG1Position();
    SpellFx_SetSomeColorEffect();

    return;
}

// 9.99 efxmagic-breath:efxFirebreathBG_Loop
void efxFirebreathBG_Loop(struct ProcEfxBG * proc)
{
    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        SpellFx_ClearBG1();
        SpellFx_ClearColorEffects();
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-breath:StartSubSpell_efxFirebreathBGCOL
void StartSubSpell_efxFirebreathBGCOL(struct Anim * anim)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFirebreathBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxFirebreathBGCOL_frames;

    proc->pal = Pal_FireBreathBg;

    return;
}

// 9.99 efxmagic-breath:efxFirebreathBGCOL_Loop
void efxFirebreathBGCOL_Loop(struct ProcEfxBGCOL * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        CpuFastSet(proc->pal, gEfxPal, 8);
        EfxPalWhiteInOut(gEfxPal, 0, 1, ret);
        SpellFx_RegisterBgPal(gEfxPal, PLTT_SIZE_4BPP);
    }
    else
    {
        if (ret == -1)
        {
            gEfxBgSemaphore--;
            Proc_Break(proc);
        }
    }

    return;
}

// 9.99 efxmagic-breath:StartSpellAnimIceBreath
void StartSpellAnimIceBreath(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxIcebreath, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

// 9.99 efxmagic-breath:efxIcebreath_Loop_Main
void efxIcebreath_Loop_Main(struct ProcEfx * proc)
{
    int timer;
    struct Anim * anim = GetAnimAnotherSide(proc->anim);

    proc->timer++;

    if (proc->timer == 1)
    {
        StartSpellThing_MagicQuake(proc->anim, 90, 10);
        StartSubSpell_efxIcebreathOBJ(proc->anim);

        PlaySFX(0x11e, 0x100, anim->xPosition, 1);
    }

    timer = proc->timer;

    if (timer == 4)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (timer == 50)
    {
        return;
    }
    else if (timer == 60)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-breath:StartSubSpell_efxIcebreathOBJ
void StartSubSpell_efxIcebreathOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    u32 * scrA;
    u32 * scrB;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxIcebreathOBJ, PROC_TREE_3);
    proc->anim = anim;

    scrB = AnimScr_IcebreathOBJ_Right;
    scrA = AnimScr_IcebreathOBJ_Left;
    frontAnim = EfxCreateFrontAnim(anim, scrA, scrB, scrA, scrB);
    proc->anim2 = frontAnim;

    if (GetAnimPosition(anim) == 0)
    {
        frontAnim->xPosition += 32;
    }
    else
    {
        frontAnim->xPosition -= 32;
    }

    SpellFx_RegisterObjPal(Pal_IceBreathSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BreathSprites, 32 * 4 * CHR_SIZE);

    return;
}

// 9.99 efxmagic-breath:efxIcebreathOBJ_OnEnd
void efxIcebreathOBJ_OnEnd(struct ProcEfxOBJ * proc)
{
    gEfxBgSemaphore--;
    AnimDelete(proc->anim2);
    return;
}

// 9.99 efxmagic-breath:StartSpellAnimDarkBreath
void StartSpellAnimDarkBreath(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxDarkbreath, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

// 9.99 efxmagic-breath:efxDarkbreath_Loop_Main
void efxDarkbreath_Loop_Main(struct ProcEfx * proc)
{
    int timer;
    struct Anim * anim = GetAnimAnotherSide(proc->anim);

    proc->timer++;

    if (proc->timer == 1)
    {
        StartSpellThing_MagicQuake(proc->anim, 90, 10);
        StartSubSpell_efxDarkbreathBG(proc->anim);
        StartSubSpell_efxDarkbreathBGCOL(proc->anim);
        StartSubSpell_efxDarkbreathOBJ(proc->anim);

        PlaySFX(0x11F, 0x100, anim->xPosition, 1);
    }

    timer = proc->timer;

    if (timer == 4)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (timer == 32)
    {
        return;
    }
    else if (timer == 48)
    {
        SpellFx_Finish();
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-breath:StartSubSpell_efxDarkbreathBG
void StartSubSpell_efxDarkbreathBG(struct Anim * anim)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDarkbreathBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxDarkbreathBG_frames;

    proc->tsal = TsaArray_DarkBreathBg;
    proc->tsar = TsaArray_DarkBreathBg;

    SpellFx_RegisterBgGfx(Img_DarkBreathBg, 32 * 8 * CHR_SIZE);
    SpellFx_SetSomeColorEffect();

    return;
}

// 9.99 efxmagic-breath:efxDarkbreathBG_Loop
void efxDarkbreathBG_Loop(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
    }
    else
    {
        if (ret == -1)
        {
            SpellFx_ClearBG1();
            gEfxBgSemaphore--;
            SpellFx_ClearColorEffects();
            Proc_Break(proc);
        }
    }

    return;
}

// 9.99 efxmagic-breath:StartSubSpell_efxDarkbreathBGCOL
void StartSubSpell_efxDarkbreathBGCOL(struct Anim * anim)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDarkbreathBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxDarkbreathBGCOL_frames;

    proc->pal = Pal_BoltingBg;

    return;
}

// 9.99 efxmagic-breath:efxDarkbreathBGCOL_Loop
void efxDarkbreathBGCOL_Loop(struct ProcEfxBGCOL * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 * pal = proc->pal;
        SpellFx_RegisterBgPal(pal + ret * 0x10, PLTT_SIZE_4BPP);
    }
    else
    {
        if (ret == -1)
        {
            SpellFx_ClearColorEffects();
            gEfxBgSemaphore--;
            Proc_Break(proc);
        }
    }

    return;
}

void StartSubSpell_efxDarkbreathOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDarkbreathOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 55;

    frontAnim = EfxCreateFrontAnim(anim, AnimScr_DarkBreath, AnimScr_DarkBreath, AnimScr_DarkBreath, AnimScr_DarkBreath);
    proc->anim2 = frontAnim;

    if (GetAnimPosition(anim) == 0)
        frontAnim->xPosition += 36;
    else
        frontAnim->xPosition -= 36;

    frontAnim->yPosition += 12;

    SpellFx_RegisterObjPal(Pal_DarkBreathSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BreathSprites, 32 * 4 * CHR_SIZE);
}

void efxDarkbreathOBJ_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }
}
