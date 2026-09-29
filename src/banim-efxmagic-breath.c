#include "gbafe.h"

extern u16 Tsa_DarkBreathBg_00[], Tsa_DarkBreathBg_01[], Tsa_DarkBreathBg_02[],
    Tsa_DarkBreathBg_03[], Tsa_DarkBreathBg_04[], Tsa_DarkBreathBg_05[], Tsa_DarkBreathBg_06[],
    Tsa_DarkBreathBg_07[], Tsa_DarkBreathBg_08[], Tsa_DarkBreathBg_09[], Tsa_DarkBreathBg_0A[],
    Tsa_DarkBreathBg_0B[];

extern const struct AnimSpriteData AnimSprite_DarkBreath_08BABB74[],
    AnimSprite_DarkBreath_08BABB8C[], AnimSprite_DarkBreath_08BABBB0[],
    AnimSprite_DarkBreath_08BABBF8[], AnimSprite_DarkBreath_08BABC4C[],
    AnimSprite_DarkBreath_08BABCAC[], AnimSprite_DarkBreath_08BABCF4[],
    AnimSprite_DarkBreath_08BABD6C[], AnimSprite_DarkBreath_08BABE14[],
    AnimSprite_DarkBreath_08BABEC8[], AnimSprite_DarkBreath_08BABF7C[],
    AnimSprite_DarkBreath_08BAC06C[], AnimSprite_DarkBreath_08BAC108[],
    AnimSprite_DarkBreath_08BAC180[], AnimSprite_DarkBreath_08BAC228[],
    AnimSprite_DarkBreath_08BAC30C[], AnimSprite_DarkBreath_08BAC3E4[],
    AnimSprite_DarkBreath_08BAC450[], AnimSprite_DarkBreath_08BAC4C8[],
    AnimSprite_DarkBreath_08BAC57C[], AnimSprite_DarkBreath_08BAC5D0[],
    AnimSprite_DarkBreath_08BAC624[], AnimSprite_DarkBreath_08BAC660[],
    AnimSprite_DarkBreath_08BAC6C0[], AnimSprite_DarkBreath_08BAC6F0[],
    AnimSprite_DarkBreath_08BAC708[], AnimSprite_FirebreathOBJ_Left_08BA8B14[],
    AnimSprite_FirebreathOBJ_Left_08BA8B2C[], AnimSprite_FirebreathOBJ_Left_08BA8B50[],
    AnimSprite_FirebreathOBJ_Left_08BA8B98[], AnimSprite_FirebreathOBJ_Left_08BA8BEC[],
    AnimSprite_FirebreathOBJ_Left_08BA8C4C[], AnimSprite_FirebreathOBJ_Left_08BA8C94[],
    AnimSprite_FirebreathOBJ_Left_08BA8D0C[], AnimSprite_FirebreathOBJ_Left_08BA8DB4[],
    AnimSprite_FirebreathOBJ_Left_08BA8E38[], AnimSprite_FirebreathOBJ_Left_08BA8EF8[],
    AnimSprite_FirebreathOBJ_Left_08BA8FE8[], AnimSprite_FirebreathOBJ_Left_08BA9084[],
    AnimSprite_FirebreathOBJ_Left_08BA90FC[], AnimSprite_FirebreathOBJ_Left_08BA91A4[],
    AnimSprite_FirebreathOBJ_Left_08BA9288[], AnimSprite_FirebreathOBJ_Left_08BA9360[],
    AnimSprite_FirebreathOBJ_Left_08BA93CC[], AnimSprite_FirebreathOBJ_Left_08BA9444[],
    AnimSprite_FirebreathOBJ_Left_08BA94F8[], AnimSprite_FirebreathOBJ_Left_08BA954C[],
    AnimSprite_FirebreathOBJ_Left_08BA95A0[], AnimSprite_FirebreathOBJ_Left_08BA95DC[],
    AnimSprite_FirebreathOBJ_Left_08BA963C[], AnimSprite_FirebreathOBJ_Left_08BA9654[],
    AnimSprite_FirebreathOBJ_Left_08BA966C[], AnimSprite_FirebreathOBJ_Right_08BA9714[],
    AnimSprite_FirebreathOBJ_Right_08BA972C[], AnimSprite_FirebreathOBJ_Right_08BA9750[],
    AnimSprite_FirebreathOBJ_Right_08BA9798[], AnimSprite_FirebreathOBJ_Right_08BA97EC[],
    AnimSprite_FirebreathOBJ_Right_08BA984C[], AnimSprite_FirebreathOBJ_Right_08BA9894[],
    AnimSprite_FirebreathOBJ_Right_08BA990C[], AnimSprite_FirebreathOBJ_Right_08BA99B4[],
    AnimSprite_FirebreathOBJ_Right_08BA9A38[], AnimSprite_FirebreathOBJ_Right_08BA9AF8[],
    AnimSprite_FirebreathOBJ_Right_08BA9BE8[], AnimSprite_FirebreathOBJ_Right_08BA9C84[],
    AnimSprite_FirebreathOBJ_Right_08BA9CFC[], AnimSprite_FirebreathOBJ_Right_08BA9DA4[],
    AnimSprite_FirebreathOBJ_Right_08BA9E88[], AnimSprite_FirebreathOBJ_Right_08BA9F60[],
    AnimSprite_FirebreathOBJ_Right_08BA9FCC[], AnimSprite_FirebreathOBJ_Right_08BAA044[],
    AnimSprite_FirebreathOBJ_Right_08BAA0F8[], AnimSprite_FirebreathOBJ_Right_08BAA14C[],
    AnimSprite_FirebreathOBJ_Right_08BAA1A0[], AnimSprite_FirebreathOBJ_Right_08BAA1DC[],
    AnimSprite_FirebreathOBJ_Right_08BAA23C[], AnimSprite_FirebreathOBJ_Right_08BAA254[],
    AnimSprite_FirebreathOBJ_Right_08BAA26C[], AnimSprite_IcebreathOBJ_Left_08BAAF44[],
    AnimSprite_IcebreathOBJ_Left_08BAAF5C[], AnimSprite_IcebreathOBJ_Left_08BAAF80[],
    AnimSprite_IcebreathOBJ_Left_08BAAFC8[], AnimSprite_IcebreathOBJ_Left_08BAB01C[],
    AnimSprite_IcebreathOBJ_Left_08BAB07C[], AnimSprite_IcebreathOBJ_Left_08BAB0C4[],
    AnimSprite_IcebreathOBJ_Left_08BAB13C[], AnimSprite_IcebreathOBJ_Left_08BAB1E4[],
    AnimSprite_IcebreathOBJ_Left_08BAB28C[], AnimSprite_IcebreathOBJ_Left_08BAB340[],
    AnimSprite_IcebreathOBJ_Left_08BAB430[], AnimSprite_IcebreathOBJ_Left_08BAB4CC[],
    AnimSprite_IcebreathOBJ_Left_08BAB544[], AnimSprite_IcebreathOBJ_Left_08BAB5EC[],
    AnimSprite_IcebreathOBJ_Left_08BAB6D0[], AnimSprite_IcebreathOBJ_Left_08BAB7A8[],
    AnimSprite_IcebreathOBJ_Left_08BAB814[], AnimSprite_IcebreathOBJ_Left_08BAB88C[],
    AnimSprite_IcebreathOBJ_Left_08BAB940[], AnimSprite_IcebreathOBJ_Left_08BAB994[],
    AnimSprite_IcebreathOBJ_Left_08BAB9E8[], AnimSprite_IcebreathOBJ_Left_08BABA24[],
    AnimSprite_IcebreathOBJ_Left_08BABA84[], AnimSprite_IcebreathOBJ_Left_08BABAB4[],
    AnimSprite_IcebreathOBJ_Left_08BABACC[], AnimSprite_IcebreathOBJ_Right_08BAA314[],
    AnimSprite_IcebreathOBJ_Right_08BAA32C[], AnimSprite_IcebreathOBJ_Right_08BAA350[],
    AnimSprite_IcebreathOBJ_Right_08BAA398[], AnimSprite_IcebreathOBJ_Right_08BAA3EC[],
    AnimSprite_IcebreathOBJ_Right_08BAA44C[], AnimSprite_IcebreathOBJ_Right_08BAA494[],
    AnimSprite_IcebreathOBJ_Right_08BAA50C[], AnimSprite_IcebreathOBJ_Right_08BAA5B4[],
    AnimSprite_IcebreathOBJ_Right_08BAA65C[], AnimSprite_IcebreathOBJ_Right_08BAA710[],
    AnimSprite_IcebreathOBJ_Right_08BAA800[], AnimSprite_IcebreathOBJ_Right_08BAA89C[],
    AnimSprite_IcebreathOBJ_Right_08BAA914[], AnimSprite_IcebreathOBJ_Right_08BAA9BC[],
    AnimSprite_IcebreathOBJ_Right_08BAAAA0[], AnimSprite_IcebreathOBJ_Right_08BAAB78[],
    AnimSprite_IcebreathOBJ_Right_08BAABE4[], AnimSprite_IcebreathOBJ_Right_08BAAC5C[],
    AnimSprite_IcebreathOBJ_Right_08BAAD10[], AnimSprite_IcebreathOBJ_Right_08BAAD64[],
    AnimSprite_IcebreathOBJ_Right_08BAADB8[], AnimSprite_IcebreathOBJ_Right_08BAADF4[],
    AnimSprite_IcebreathOBJ_Right_08BAAE54[], AnimSprite_IcebreathOBJ_Right_08BAAE84[],
    AnimSprite_IcebreathOBJ_Right_08BAAE9C[];

/* auto-decls */
void NewEfxFarAttackWithDistance(struct Anim * anim, s16 arg);
void EfxPlayHittedSFX(struct Anim * anim);
void NewEfxSpellCast(void);
void RegisterEfxSpellCastEnd(void);
extern const struct ProcCmd ProcScr_efxFirebreath[];
extern int gEfxBgSemaphore;
extern const struct ProcCmd ProcScr_efxFirebreathOBJ[];
extern const AnimScr AnimScr_FirebreathOBJ_Left[];
extern const AnimScr AnimScr_FirebreathOBJ_Right[];
extern u16 Pal_FireBreathSprites[];
extern u16 Img_BreathSprites[];
extern const struct ProcCmd ProcScr_efxFirebreathBG[];
extern u16 Img_FireBreathBg[];
extern u16 Tsa_FireBreathBg[];
extern const struct ProcCmd ProcScr_efxFirebreathBGCOL[];
extern u16 Pal_FireBreathBg[];
extern const struct ProcCmd ProcScr_efxIcebreath[];
extern const struct ProcCmd ProcScr_efxIcebreathOBJ[];
extern const AnimScr AnimScr_IcebreathOBJ_Right[];
extern const AnimScr AnimScr_IcebreathOBJ_Left[];
extern u16 Pal_IceBreathSprites[];
extern const struct ProcCmd ProcScr_efxDarkbreath[];
extern const struct ProcCmd ProcScr_efxDarkbreathBG[];
extern u16 * const TsaArray_DarkBreathBg[];
extern u16 Img_DarkBreathBg[];
extern const struct ProcCmd ProcScr_efxDarkbreathBGCOL[];
extern u16 Pal_BoltingBg[];
extern const struct ProcCmd ProcScr_efxDarkbreathOBJ[];
extern const AnimScr AnimScr_DarkBreath[];
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
    const AnimScr * scr;

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
    const AnimScr * scrA;
    const AnimScr * scrB;

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
        u16 * const * tsaL = proc->tsal;
        u16 * const * tsaR = proc->tsar;
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

SECTION(".rodata.08BA18A4")
const struct ProcCmd ProcScr_efxFirebreath[] = {
    PROC_19,
    PROC_REPEAT(efxFirebreath_Loop_Main),
    PROC_END,
};

SECTION(".rodata.08BA18BC")
const struct ProcCmd ProcScr_efxFirebreathOBJ[] = {
    PROC_19,
    PROC_REPEAT(efxFirebreathOBJ_Loop),
    PROC_END,
};

SECTION(".rodata.08BA18D4")
const struct ProcCmd ProcScr_efxFirebreathBG[] = {
    PROC_19,
    PROC_REPEAT(efxFirebreathBG_Loop),
    PROC_END,
};

SECTION(".rodata.08BA18EC")
const struct ProcCmd ProcScr_efxFirebreathBGCOL[] = {
    PROC_19,
    PROC_MARK(10),
    PROC_REPEAT(efxFirebreathBGCOL_Loop),
    PROC_END,
};

SECTION(".rodata.08BA190C")
const struct ProcCmd ProcScr_efxIcebreath[] = {
    PROC_19,
    PROC_REPEAT(efxIcebreath_Loop_Main),
    PROC_END,
};

SECTION(".rodata.08BA1924")
const struct ProcCmd ProcScr_efxIcebreathOBJ[] = {
    PROC_19,
    PROC_SET_END_CB(efxIcebreathOBJ_OnEnd),
    PROC_SLEEP(52),
    PROC_END,
};

SECTION(".rodata.08BA1944")
const struct ProcCmd ProcScr_efxDarkbreath[] = {
    PROC_19,
    PROC_REPEAT(efxDarkbreath_Loop_Main),
    PROC_END,
};

SECTION(".rodata.08BA195C")
const struct ProcCmd ProcScr_efxDarkbreathBG[] = {
    PROC_19,
    PROC_REPEAT(efxDarkbreathBG_Loop),
    PROC_END,
};

SECTION(".rodata.08BA19A4")
const struct ProcCmd ProcScr_efxDarkbreathBGCOL[] = {
    PROC_19,
    PROC_MARK(10),
    PROC_REPEAT(efxDarkbreathBGCOL_Loop),
    PROC_END,
};

SECTION(".rodata.08BA19C4")
const struct ProcCmd ProcScr_efxDarkbreathOBJ[] = {
    PROC_19,
    PROC_REPEAT(efxDarkbreathOBJ_Loop),
    PROC_END,
};

SECTION(".rodata.08BA96A8")
const AnimScr AnimScr_FirebreathOBJ_Left[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left_08BA8B14, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left_08BA8B2C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left_08BA8B50, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left_08BA8B98, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left_08BA8BEC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left_08BA8C4C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left_08BA8C94, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left_08BA8D0C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left_08BA8DB4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left_08BA8E38, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left_08BA8EF8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left_08BA8FE8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left_08BA9084, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left_08BA90FC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left_08BA91A4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left_08BA9288, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left_08BA9360, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left_08BA93CC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left_08BA9444, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left_08BA94F8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left_08BA954C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left_08BA95A0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left_08BA95DC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left_08BA963C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left_08BA9654, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left_08BA966C, 2),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BAA2A8")
const AnimScr AnimScr_FirebreathOBJ_Right[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Right_08BA9714, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Right_08BA972C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Right_08BA9750, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Right_08BA9798, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Right_08BA97EC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Right_08BA984C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Right_08BA9894, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Right_08BA990C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Right_08BA99B4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Right_08BA9A38, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Right_08BA9AF8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Right_08BA9BE8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Right_08BA9C84, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Right_08BA9CFC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Right_08BA9DA4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Right_08BA9E88, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Right_08BA9F60, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Right_08BA9FCC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Right_08BAA044, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Right_08BAA0F8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Right_08BAA14C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Right_08BAA1A0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Right_08BAA1DC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Right_08BAA23C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Right_08BAA254, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Right_08BAA26C, 2),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BAAED8")
const AnimScr AnimScr_IcebreathOBJ_Right[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Right_08BAA314, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Right_08BAA32C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Right_08BAA350, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Right_08BAA398, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Right_08BAA3EC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Right_08BAA44C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Right_08BAA494, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Right_08BAA50C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Right_08BAA5B4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Right_08BAA65C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Right_08BAA710, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Right_08BAA800, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Right_08BAA89C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Right_08BAA914, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Right_08BAA9BC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Right_08BAAAA0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Right_08BAAB78, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Right_08BAABE4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Right_08BAAC5C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Right_08BAAD10, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Right_08BAAD64, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Right_08BAADB8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Right_08BAADF4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Right_08BAAE54, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Right_08BAAE84, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Right_08BAAE9C, 2),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BABB08")
const AnimScr AnimScr_IcebreathOBJ_Left[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Left_08BAAF44, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Left_08BAAF5C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Left_08BAAF80, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Left_08BAAFC8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Left_08BAB01C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Left_08BAB07C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Left_08BAB0C4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Left_08BAB13C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Left_08BAB1E4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Left_08BAB28C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Left_08BAB340, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Left_08BAB430, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Left_08BAB4CC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Left_08BAB544, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Left_08BAB5EC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Left_08BAB6D0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Left_08BAB7A8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Left_08BAB814, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Left_08BAB88C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Left_08BAB940, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Left_08BAB994, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Left_08BAB9E8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Left_08BABA24, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Left_08BABA84, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Left_08BABAB4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_IcebreathOBJ_Left_08BABACC, 2),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BAC744")
const AnimScr AnimScr_DarkBreath[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_DarkBreath_08BABB74, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_DarkBreath_08BABB8C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_DarkBreath_08BABBB0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_DarkBreath_08BABBF8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_DarkBreath_08BABC4C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_DarkBreath_08BABCAC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_DarkBreath_08BABCF4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_DarkBreath_08BABD6C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_DarkBreath_08BABE14, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_DarkBreath_08BABEC8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_DarkBreath_08BABF7C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_DarkBreath_08BAC06C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_DarkBreath_08BAC108, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_DarkBreath_08BAC180, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_DarkBreath_08BAC228, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_DarkBreath_08BAC30C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_DarkBreath_08BAC3E4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_DarkBreath_08BAC450, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_DarkBreath_08BAC4C8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_DarkBreath_08BAC57C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_DarkBreath_08BAC5D0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_DarkBreath_08BAC624, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_DarkBreath_08BAC660, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_DarkBreath_08BAC6C0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_DarkBreath_08BAC6F0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_DarkBreath_08BAC708, 2),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BA1974")
u16 * const TsaArray_DarkBreathBg[] = {
    Tsa_DarkBreathBg_00,
    Tsa_DarkBreathBg_01,
    Tsa_DarkBreathBg_02,
    Tsa_DarkBreathBg_03,
    Tsa_DarkBreathBg_04,
    Tsa_DarkBreathBg_05,
    Tsa_DarkBreathBg_06,
    Tsa_DarkBreathBg_07,
    Tsa_DarkBreathBg_08,
    Tsa_DarkBreathBg_09,
    Tsa_DarkBreathBg_0A,
    Tsa_DarkBreathBg_0B,
};
