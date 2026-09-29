#include "gbafe.h"

/* auto-decls */
void NewEfxSpellCast(void);
void NewEfxFarAttackWithDistance(struct Anim * anim, s16 arg);
void StopBGM1(void);
void RegisterEfxSpellCastEnd(void);
void NewEfxFlashUnit(struct Anim * anim, u16 dura1, u16 dura2, int c);
ProcPtr NewefxRestRST(struct Anim *anim, int unk44, int unk48, int frame, int speed);
extern const struct ProcCmd ProcScr_efxSilence[];
extern int gEfxBgSemaphore;
extern const struct ProcCmd ProcScr_efxSilenceBG[];
extern u16 * TsaArray_SilenceBg[];
extern u16 Pal_Silence[];
extern u16 Img_SilenceBg[];
extern const struct ProcCmd ProcScr_efxSilenceOBJ[];
extern u32 AnimScr_EfxSilenceOBJ[];
extern u16 Img_SilenceSprites[];
extern const struct ProcCmd ProcScr_efxSleep[];
extern const struct ProcCmd ProcScr_efxSleepBG[];
extern u16 * TsaArray_SleepBg[];
extern u16 Pal_SleepBg[];
extern u16 Img_SleepBg[];
extern const struct ProcCmd ProcScr_efxSleepOBJ[];
extern u32 AnimScr_EfxSleepOBJ1[];
extern u16 Pal_SleepSprites[];
extern u16 Img_SleepSprites[];
extern const struct ProcCmd ProcScr_efxSleepOBJ2[];
extern u32 AnimScr_EfxSleepOBJ2[];
extern const struct ProcCmd ProcScr_efxSleepSE[];
extern const struct ProcCmd ProcScr_efxHammarne[];
extern const struct ProcCmd ProcScr_efxHammarneBG[];
extern u16 * TsaArray_HammerneBg[];
extern u16 * ImgArray_HammerneBg[];
extern u16 Pal_HammerneBg[];
extern const struct ProcCmd ProcScr_efxHammarneOBJ[];
extern u32 AnimScr_EfxHammarneOBJ[];
extern u16 Pal_HammerneSprites[];
extern const struct ProcCmd ProcScr_efxBerserk[];
extern const struct ProcCmd ProcScr_efxBerserkBG[];
extern u16 Pal_BerserkBg[];
extern u16 Img_082739E4[];
extern u16 Tsa_08273AE4[];
extern const struct ProcCmd ProcScr_efxBerserkCLONE[];
extern const struct ProcCmd ProcScr_efxBerserkOBJ[];
extern AnimScr FramScr_Unk5D4F90[];
extern u32 AnimScr_EfxBerserk1[];
extern u16 Pal_BerserkSprites[];
extern u16 Img_BerserkSprites_A[];
extern u32 AnimScr_EfxBerserk2[];
extern u32 AnimScr_EfxBerserk3[];
extern u32 AnimScr_EfxBerserk4[];
extern u32 AnimScr_EfxBerserk5[];
extern u32 AnimScr_EfxBerserk6[];
extern u16 Img_BerserkSprites_B[];
extern u32 AnimScr_EfxBerserk7[];
extern u32 AnimScr_EfxBerserk8[];
extern u32 AnimScr_EfxBerserk9[];
extern u32 AnimScr_EfxBerserk10[];
extern const struct ProcCmd ProcScr_efxMshield[];
extern const struct ProcCmd ProcScr_efxMshieldBG[];
extern u16 * TsaArray_BarrierBg[];
extern u16 Pal_BarrierBg[];
extern u16 Img_BarrierBg[];
extern const struct ProcCmd ProcScr_efxMshieldBGOBJ[];
extern u32 AnimScr_EfxMshield1[];
extern u16 Img_EfxMshield[];
extern const struct ProcCmd ProcScr_efxMshieldBGOBJ2[];
extern u32 AnimScr_EfxMshield2[];

void StartSpellAnimSilence(struct Anim * anim);
void efxSilence_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxSilenceBG(struct Anim * anim);
void efxSilenceBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxSilenceOBJ(struct Anim * anim);
void efxSilenceOBJ_OnEnd(struct ProcEfxOBJ * proc);
void StartSpellAnimSleep(struct Anim * anim);
void efxSleep_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxSleepBG(struct Anim * anim);
void efxSleepBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxSleepOBJ(struct Anim * anim);
void StartSubSpell_efxSleepOBJ2(struct Anim * anim);
void efxSleepOBJ_OnEnd(void);
void StartSubSpell_efxSleepSE(struct Anim * anim);
void efxSleepSE_PlaySE(struct ProcEfx * proc);
void efxSleepSE_OnEnd(void);
void StartSpellAnimHammerne(struct Anim * anim);
void efxHammarne_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxHammarneBG(struct Anim * anim);
void efxHammarneBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxHammarneOBJ(struct Anim * anim);
void efxHammarneOBJ_OnEnd(void);
void StartSpellAnimBerserk(struct Anim * anim);
void efxBerserk_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxBerserkBG(struct Anim * anim, int terminator);
void efxBerserkBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxBerserkCLONE(struct Anim * anim, int terminator);
void efxBerserkCLONE_Loop(struct ProcEfxBG * proc);
void efxBerserkCLONE_OnEnd(void);
void StartSubSpell_efxBerserkOBJ(struct Anim * anim);
void efxBerserkOBJ_OnEnd(struct ProcEfxOBJ * proc);
void efxBerserkOBJ_Loop_A(struct ProcEfxOBJ * proc);
void efxBerserkOBJ_Loop_C(struct ProcEfxOBJ * proc);
void efxBerserkOBJ_Loop_E(struct ProcEfxOBJ * proc);
void efxBerserkOBJ_Loop_G(struct ProcEfxOBJ * proc);
void efxBerserkOBJ_Loop_I(struct ProcEfxOBJ * proc);
void efxBerserkOBJ_Loop_B(struct ProcEfxOBJ * proc);
void efxBerserkOBJ_Loop_D(struct ProcEfxOBJ * proc);
void efxBerserkOBJ_Loop_F(struct ProcEfxOBJ * proc);
void efxBerserkOBJ_Loop_H(struct ProcEfxOBJ * proc);
void efxBerserkOBJ_Loop_J(struct ProcEfxOBJ * proc);
void StartSpellAnimBarrier(struct Anim * anim);
void efxMshield_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxMshieldBG(struct Anim * anim);
void efxMshieldBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxMshieldBGOBJ(struct Anim * anim);
void StartSubSpell_efxMshieldBGOBJ2(struct Anim * anim);
void efxMshieldBGOBJ_OnEnd(struct ProcEfxOBJ * proc);

extern const u16 StartSubSpell_efxSilenceBG_frames[];
extern const u16 StartSubSpell_efxSleepBG_frames[];
extern const u16 StartSubSpell_efxHammarneBG_frames[];
extern const u16 StartSubSpell_efxMshieldBG_frames[];

// 9.99 efxmagic-effectstaves:StartSpellAnimSilence
void StartSpellAnimSilence(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxSilence, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

// 9.99 efxmagic-effectstaves:efxSilence_Loop_Main
void efxSilence_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        StartSubSpell_efxSilenceOBJ(proc->anim);
        PlaySFX(0xfa, 0x100, proc->anim->xPosition, 1);
    }

    if (proc->timer == 41)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }
    else if (proc->timer == duration + 68)
    {
        StartSubSpell_efxSilenceBG(proc->anim);
        PlaySFX(0xfb, 0x100, anim->xPosition, 1);
        NewEfxALPHA(proc->anim, 66, 20, 16, 0, 0);
    }
    else if (proc->timer == duration + 134)
    {
        PlaySFX(0xfc, 0x100, anim->xPosition, 1);
        StopBGM1();

        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimStatusChgHitEffects(anim, proc->hitted);
        NewEfxFlashBgWhite(proc->anim, 10);

        if (!proc->hitted && (GetUnitEfxDebuff(anim) == 0))
        {
            SetUnitEfxDebuff(anim, 3);
        }
    }
    else if (proc->timer == duration + 158)
    {
        anim->state3 |= ANIM_BIT3_NEXT_ROUND_START;

        SpellFx_Finish();
        RegisterEfxSpellCastEnd();

        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-effectstaves:StartSubSpell_efxSilenceBG
void StartSubSpell_efxSilenceBG(struct Anim * anim)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSilenceBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxSilenceBG_frames;

    proc->tsal = TsaArray_SilenceBg;
    proc->tsar = TsaArray_SilenceBg;

    SpellFx_RegisterBgPal(Pal_Silence, PLTT_SIZE_4BPP);
    SpellFx_RegisterBgGfx(Img_SilenceBg, 32 * 8 * CHR_SIZE);

    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType != 0)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            SetBgOffset(BG_1, 232, 0);
        }
        else
        {
            SetBgOffset(BG_1, 24, 0);
        }
    }

    return;
}

// 9.99 efxmagic-effectstaves:efxSilenceBG_Loop
void efxSilenceBG_Loop(struct ProcEfxBG * proc)
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

// 9.99 efxmagic-effectstaves:StartSubSpell_efxSilenceOBJ
void StartSubSpell_efxSilenceOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSilenceOBJ, PROC_TREE_3);
    proc->anim = anim;

    proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_EfxSilenceOBJ, AnimScr_EfxSilenceOBJ, AnimScr_EfxSilenceOBJ, AnimScr_EfxSilenceOBJ);

    SpellFx_RegisterObjPal(Pal_Silence, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_SilenceSprites, 32 * 4 * CHR_SIZE);

    return;
}

// 9.99 efxmagic-effectstaves:efxSilenceOBJ_OnEnd
void efxSilenceOBJ_OnEnd(struct ProcEfxOBJ * proc)
{
    AnimDelete(proc->anim2);
    gEfxBgSemaphore--;
    return;
}

// 9.99 efxmagic-effectstaves:StartSpellAnimSleep
void StartSpellAnimSleep(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxSleep, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

// 9.99 efxmagic-effectstaves:efxSleep_Loop_Main
void efxSleep_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        StartSubSpell_efxSleepOBJ(proc->anim);
        PlaySFX(0x11B, 0x100, proc->anim->xPosition, 1);
    }

    if (proc->timer == 100)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }

    if (proc->timer == duration + 130)
    {
        StartSubSpell_efxSleepOBJ2(anim);
        StartSubSpell_efxSleepSE(anim);

        StartSubSpell_efxSleepBG(proc->anim);

        NewEfxALPHA(anim, 0, 20, 0, 16, 0);
        NewEfxALPHA(anim, 230, 20, 16, 0, 0);
    }
    else if (proc->timer == duration + 330)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimStatusChgHitEffects(anim, proc->hitted);

        if (!proc->hitted && GetUnitEfxDebuff(anim) == 0)
        {
            SetUnitEfxDebuff(anim, 2);
        }
    }
    else if (proc->timer == duration + 370)
    {
        anim->state3 |= ANIM_BIT3_NEXT_ROUND_START;

        SpellFx_Finish();
        RegisterEfxSpellCastEnd();

        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-effectstaves:StartSubSpell_efxSleepBG
void StartSubSpell_efxSleepBG(struct Anim * anim)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBG * proc;
    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSleepBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxSleepBG_frames;

    proc->tsal = TsaArray_SleepBg;
    proc->tsar = TsaArray_SleepBg;

    SpellFx_RegisterBgPal(Pal_SleepBg, PLTT_SIZE_4BPP);
    SpellFx_RegisterBgGfx(Img_SleepBg, 32 * 8 * CHR_SIZE);

    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType != 0)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            SetBgOffset(BG_1, 232, 0);
        }
        else
        {
            SetBgOffset(BG_1, 24, 0);
        }
    }

    return;
}

// 9.99 efxmagic-effectstaves:efxSleepBG_Loop
void efxSleepBG_Loop(struct ProcEfxBG * proc)
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

// 9.99 efxmagic-effectstaves:sub_8062898
void StartSubSpell_efxSleepOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSleepOBJ, PROC_TREE_3);
    proc->anim = anim;

    proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_EfxSleepOBJ1, AnimScr_EfxSleepOBJ1, AnimScr_EfxSleepOBJ1, AnimScr_EfxSleepOBJ1);

    SpellFx_RegisterObjPal(Pal_SleepSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_SleepSprites, 32 * 2 * CHR_SIZE);

    return;
}

// 9.99 efxmagic-effectstaves:StartSubSpell_efxSleepOBJ2
void StartSubSpell_efxSleepOBJ2(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSleepOBJ2, PROC_TREE_3);
    proc->anim = anim;

    frontAnim = EfxCreateFrontAnim(anim, AnimScr_EfxSleepOBJ2, AnimScr_EfxSleepOBJ2, AnimScr_EfxSleepOBJ2, AnimScr_EfxSleepOBJ2);
    proc->anim2 = frontAnim;
    frontAnim->yPosition -= 8;

    return;
}

// 9.99 efxmagic-effectstaves:efxSleepOBJ_OnEnd
void efxSleepOBJ_OnEnd(void)
{
    gEfxBgSemaphore--;
    return;
}

// 9.99 efxmagic-effectstaves:StartSubSpell_efxSleepSE
void StartSubSpell_efxSleepSE(struct Anim * anim)
{
    struct ProcEfx * proc;
    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSleepSE, PROC_TREE_3);
    proc->anim = anim;

    return;
}

// 9.99 efxmagic-effectstaves:efxSleepSE_PlaySE
void efxSleepSE_PlaySE(struct ProcEfx * proc)
{
    PlaySFX(0x11c, 0x100, proc->anim->xPosition, 1);
    return;
}

// 9.99 efxmagic-effectstaves:efxSleepSE_OnEnd
void efxSleepSE_OnEnd(void)
{
    gEfxBgSemaphore--;
    return;
}

// 9.99 efxmagic-effectstaves:StartSpellAnimHammerne
void StartSpellAnimHammerne(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxHammarne, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

// 9.99 efxmagic-effectstaves:efxHammarne_Loop_Main
void efxHammarne_Loop_Main(struct ProcEfx * proc)
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
        StartSubSpell_efxHammarneBG(anim);

        NewEfxALPHA(anim, 40, 30, 16, 8, 0);
        NewEfxALPHA(anim, 71, 30, 8, 16, 0);
        NewEfxALPHA(anim, 102, 30, 16, 8, 0);
        NewEfxALPHA(anim, 133, 30, 8, 16, 0);
        NewEfxALPHA(anim, 164, 60, 16, 0, 0);

        PlaySFX(0x103, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 80)
    {
        StartSubSpell_efxHammarneOBJ(anim);
    }
    else if (proc->timer == duration + 164)
    {
        NewEfxFlashUnit(anim, 1, 5, 0);
    }
    else if (proc->timer == duration + 200)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);
        StartBattleAnimStatusChgHitEffects(anim, proc->hitted);
    }
    else if (proc->timer == duration + 300)
    {
        anim->state3 |= ANIM_BIT3_NEXT_ROUND_START;

        SpellFx_Finish();
        RegisterEfxSpellCastEnd();

        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-effectstaves:StartSubSpell_efxHammarneBG
void StartSubSpell_efxHammarneBG(struct Anim * anim)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxHammarneBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxHammarneBG_frames;

    proc->tsal = TsaArray_HammerneBg;
    proc->tsar = TsaArray_HammerneBg;

    proc->img = ImgArray_HammerneBg;

    SpellFx_RegisterBgPal(Pal_HammerneBg, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    return;
}

// 9.99 efxmagic-effectstaves:efxHammarneBG_Loop
void efxHammarneBG_Loop(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;

        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
        SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
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

// 9.99 efxmagic-effectstaves:StartSubSpell_efxHammarneOBJ
void StartSubSpell_efxHammarneOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxHammarneOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_EfxHammarneOBJ, AnimScr_EfxHammarneOBJ, AnimScr_EfxHammarneOBJ, AnimScr_EfxHammarneOBJ);

    SpellFx_RegisterObjPal(Pal_HammerneSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_SleepSprites, 32 * 2 * CHR_SIZE);

    return;
}

// 9.99 efxmagic-effectstaves:efxHammarneOBJ_OnEnd
void efxHammarneOBJ_OnEnd(void)
{
    gEfxBgSemaphore--;
    return;
}

// 9.99 efxmagic-effectstaves:StartSpellAnimBerserk
void StartSpellAnimBerserk(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxBerserk, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

// 9.99 efxmagic-effectstaves:efxBerserk_Loop_Main
void efxBerserk_Loop_Main(struct ProcEfx * proc)
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
        StartSubSpell_efxBerserkOBJ(anim);
        StartSubSpell_efxBerserkBG(anim, 74);
        StartSubSpell_efxBerserkCLONE(anim, 74);

        NewefxRestRST(anim, 74, 10, 0x100, 1);
        NewEfxRestWINH_(anim, 74, 0);

        PlaySFX(0xf9, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 74)
    {
        NewEfxFlashBgWhite(anim, 5);
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimStatusChgHitEffects(anim, proc->hitted);

        if (!proc->hitted && (GetUnitEfxDebuff(anim) == 0))
        {
            SetUnitEfxDebuff(anim, 4);
        }
    }
    else if (proc->timer == duration + 90)
    {
        anim->state3 |= ANIM_BIT3_NEXT_ROUND_START;

        SpellFx_Finish();
        RegisterEfxSpellCastEnd();

        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-effectstaves:StartSubSpell_efxBerserkBG
void StartSubSpell_efxBerserkBG(struct Anim * anim, int terminator)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxBerserkBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;

    SpellFx_RegisterBgPal(Pal_BerserkBg, PLTT_SIZE_4BPP);
    SpellFx_RegisterBgGfx(Img_082739E4, 32 * 8 * CHR_SIZE);

    EfxTmCpyBG(Tsa_08273AE4, gBg1Tm, 0x20, 0x20, 1, 0x100);

    EnableBgSync(BG1_SYNC_BIT);

    SpellFx_SetSomeColorEffect();
    SetBlendAlpha(14, 8);

    gDispIo.win_ct.wobj_enable_blend = 1;
    SetWinEnable(0, 0, 1);
    SetWObjLayers(0, 1, 1, 1, 1);

    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 1, 1);

    gDispIo.blend_ct.target2_enable_bd = 1;

    anim->oamBase |= OAM0_WINDOW;

    anim->oam2Base &= ~OAM2_LAYER(3);
    anim->oam2Base |= OAM2_LAYER(1);

    return;
}

// 9.99 efxmagic-effectstaves:efxBerserkBG_Loop
void efxBerserkBG_Loop(struct ProcEfxBG * proc)
{
    struct Anim * anim = proc->anim;

    gDispIo.bg_off[BG_1].y--;

    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        SpellFx_ClearBG1();
        SpellFx_ClearColorEffects();

        anim->oamBase &= ~OAM0_WINDOW;

        anim->oam2Base &= ~OAM2_LAYER(3);
        anim->oam2Base |= OAM2_LAYER(2);

        gEfxBgSemaphore--;

        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-effectstaves:StartSubSpell_efxBerserkCLONE
void StartSubSpell_efxBerserkCLONE(struct Anim * anim, int terminator)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxBerserkCLONE, PROC_TREE_4);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;

    return;
}

// 9.99 efxmagic-effectstaves:efxBerserkCLONE_Loop
void efxBerserkCLONE_Loop(struct ProcEfxBG * proc)
{
    struct Anim clone;

    struct Anim * anim = proc->anim;

    clone.xPosition = anim->xPosition;
    clone.yPosition = anim->yPosition;

    clone.pSpriteData = anim->pSpriteData;

    clone.oamBase = anim->oamBase & ~(OAM0_WINDOW);

    clone.oam2Base = anim->oam2Base;
    clone.oam2Base &= ~OAM2_LAYER(3);
    clone.oam2Base |= OAM2_LAYER(2);

    AnimDisplay(&clone);

    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-effectstaves:efxBerserkCLONE_OnEnd
void efxBerserkCLONE_OnEnd(void)
{
    gEfxBgSemaphore--;
    return;
}

// 9.99 efxmagic-effectstaves:StartSubSpell_efxBerserkOBJ
void StartSubSpell_efxBerserkOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    u32 * scr;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxBerserkOBJ, PROC_TREE_3);
    proc->anim = anim;

    GetAnimAnotherSide(anim);

    scr = FramScr_Unk5D4F90;
    frontAnim = EfxCreateFrontAnim(proc->anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;

    frontAnim->oam2Base &= ~OAM2_LAYER(3);
    frontAnim->oam2Base |= OAM2_LAYER(1);

    return;
}

// 9.99 efxmagic-effectstaves:efxBerserkOBJ_OnEnd
void efxBerserkOBJ_OnEnd(struct ProcEfxOBJ * proc)
{
    gEfxBgSemaphore--;
    AnimDelete(proc->anim2);
    return;
}

// 9.99 efxmagic-effectstaves:efxBerserkOBJ_Loop_A
void efxBerserkOBJ_Loop_A(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = AnimScr_EfxBerserk1;
    anim->pScrCurrent = AnimScr_EfxBerserk1;
    anim->timer = 0;

    SpellFx_RegisterObjPal(Pal_BerserkSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BerserkSprites_A, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

// 9.99 efxmagic-effectstaves:efxBerserkOBJ_Loop_C
void efxBerserkOBJ_Loop_C(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = AnimScr_EfxBerserk2;
    anim->pScrCurrent = AnimScr_EfxBerserk2;
    anim->timer = 0;

    SpellFx_RegisterObjPal(Pal_BerserkSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BerserkSprites_A, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

// 9.99 efxmagic-effectstaves:efxBerserkOBJ_Loop_E
void efxBerserkOBJ_Loop_E(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = AnimScr_EfxBerserk3;
    anim->pScrCurrent = AnimScr_EfxBerserk3;
    anim->timer = 0;

    SpellFx_RegisterObjPal(Pal_BerserkSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BerserkSprites_A, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

// 9.99 efxmagic-effectstaves:efxBerserkOBJ_Loop_G
void efxBerserkOBJ_Loop_G(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = AnimScr_EfxBerserk4;
    anim->pScrCurrent = AnimScr_EfxBerserk4;
    anim->timer = 0;

    SpellFx_RegisterObjPal(Pal_BerserkSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BerserkSprites_A, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

// 9.99 efxmagic-effectstaves:efxBerserkOBJ_Loop_I
void efxBerserkOBJ_Loop_I(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = AnimScr_EfxBerserk5;
    anim->pScrCurrent = AnimScr_EfxBerserk5;
    anim->timer = 0;

    SpellFx_RegisterObjPal(Pal_BerserkSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BerserkSprites_A, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

// 9.99 efxmagic-effectstaves:efxBerserkOBJ_Loop_B
void efxBerserkOBJ_Loop_B(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = AnimScr_EfxBerserk6;
    anim->pScrCurrent = AnimScr_EfxBerserk6;
    anim->timer = 0;

    SpellFx_RegisterObjPal(Pal_BerserkSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BerserkSprites_B, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

// 9.99 efxmagic-effectstaves:efxBerserkOBJ_Loop_D
void efxBerserkOBJ_Loop_D(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = AnimScr_EfxBerserk7;
    anim->pScrCurrent = AnimScr_EfxBerserk7;
    anim->timer = 0;

    SpellFx_RegisterObjPal(Pal_BerserkSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BerserkSprites_B, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

// 9.99 efxmagic-effectstaves:efxBerserkOBJ_Loop_F
void efxBerserkOBJ_Loop_F(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = AnimScr_EfxBerserk8;
    anim->pScrCurrent = AnimScr_EfxBerserk8;
    anim->timer = 0;

    SpellFx_RegisterObjPal(Pal_BerserkSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BerserkSprites_B, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

// 9.99 efxmagic-effectstaves:efxBerserkOBJ_Loop_H
void efxBerserkOBJ_Loop_H(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = AnimScr_EfxBerserk9;
    anim->pScrCurrent = AnimScr_EfxBerserk9;
    anim->timer = 0;

    SpellFx_RegisterObjPal(Pal_BerserkSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BerserkSprites_B, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

// 9.99 efxmagic-effectstaves:efxBerserkOBJ_Loop_J
void efxBerserkOBJ_Loop_J(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = AnimScr_EfxBerserk10;
    anim->pScrCurrent = AnimScr_EfxBerserk10;
    anim->timer = 0;

    SpellFx_RegisterObjPal(Pal_BerserkSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BerserkSprites_B, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

// 9.99 efxmagic-effectstaves:StartSpellAnimBarrier
void StartSpellAnimBarrier(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxMshield, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

// 9.99 efxmagic-effectstaves:efxMshield_Loop_Main
void efxMshield_Loop_Main(struct ProcEfx * proc)
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
        StartSubSpell_efxMshieldBG(proc->anim);
        StartSubSpell_efxMshieldBGOBJ(anim);
        StartSubSpell_efxMshieldBGOBJ2(anim);
        PlaySFX(0x102, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 40)
    {
        StartSubSpell_efxMshieldBGOBJ2(anim);
    }
    else if (proc->timer == duration + 80)
    {
        StartSubSpell_efxMshieldBGOBJ2(anim);
    }
    else if (proc->timer == duration + 176)
    {
        NewEfxFlashUnit(anim, 1, 5, 0);
    }
    else if (proc->timer == duration + 225)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);
        StartBattleAnimStatusChgHitEffects(anim, proc->hitted);
    }
    else if (proc->timer == duration + 230)
    {
        anim->state3 |= ANIM_BIT3_NEXT_ROUND_START;

        SpellFx_Finish();
        RegisterEfxSpellCastEnd();

        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-effectstaves:StartSubSpell_efxMshieldBG
void StartSubSpell_efxMshieldBG(struct Anim * anim)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMshieldBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxMshieldBG_frames;

    proc->tsal = TsaArray_BarrierBg;
    proc->tsar = TsaArray_BarrierBg;

    SpellFx_RegisterBgPal(Pal_BarrierBg, PLTT_SIZE_4BPP);
    SpellFx_RegisterBgGfx(Img_BarrierBg, 32 * 8 * CHR_SIZE);

    SpellFx_SetSomeColorEffect();

    return;
}

// 9.99 efxmagic-effectstaves:efxMshieldBG_Loop
void efxMshieldBG_Loop(struct ProcEfxBG * proc)
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

// 9.99 efxmagic-effectstaves:StartSubSpell_efxMshieldBGOBJ
void StartSubSpell_efxMshieldBGOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMshieldBGOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_EfxMshield1, AnimScr_EfxMshield1, AnimScr_EfxMshield1, AnimScr_EfxMshield1);

    SpellFx_RegisterObjPal(Img_EfxMshield, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_SleepSprites, 32 * 2 * CHR_SIZE);

    return;
}

// 9.99 efxmagic-effectstaves:StartSubSpell_efxMshieldBGOBJ2
void StartSubSpell_efxMshieldBGOBJ2(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMshieldBGOBJ2, PROC_TREE_3);
    proc->anim = anim;
    proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_EfxMshield2, AnimScr_EfxMshield2, AnimScr_EfxMshield2, AnimScr_EfxMshield2);

    return;
}

// 9.99 efxmagic-effectstaves:efxMshieldBGOBJ_OnEnd
void efxMshieldBGOBJ_OnEnd(struct ProcEfxOBJ * proc)
{
    AnimDelete(proc->anim2);
    gEfxBgSemaphore--;
    return;
}

SECTION(".rodata.08BA32D4")
const struct ProcCmd ProcScr_efxSilence[] = {
    PROC_19,
    PROC_REPEAT(efxSilence_Loop_Main),
    PROC_END,
};

SECTION(".rodata.08BA32EC")
const struct ProcCmd ProcScr_efxSilenceBG[] = {
    PROC_19,
    PROC_REPEAT(efxSilenceBG_Loop),
    PROC_END,
};

SECTION(".rodata.08BA334C")
const struct ProcCmd ProcScr_efxSilenceOBJ[] = {
    PROC_19,
    PROC_SET_END_CB(efxSilenceOBJ_OnEnd),
    PROC_SLEEP(40),
    PROC_END,
};

SECTION(".rodata.08BA336C")
const struct ProcCmd ProcScr_efxSleep[] = {
    PROC_19,
    PROC_REPEAT(efxSleep_Loop_Main),
    PROC_END,
};

SECTION(".rodata.08BA3384")
const struct ProcCmd ProcScr_efxSleepBG[] = {
    PROC_19,
    PROC_REPEAT(efxSleepBG_Loop),
    PROC_END,
};

SECTION(".rodata.08BA33DC")
const struct ProcCmd ProcScr_efxSleepOBJ[] = {
    PROC_19,
    PROC_SET_END_CB(efxSleepOBJ_OnEnd),
    PROC_SLEEP(80),
    PROC_END,
};

SECTION(".rodata.08BA33FC")
const struct ProcCmd ProcScr_efxSleepOBJ2[] = {
    PROC_19,
    PROC_SET_END_CB(efxSleepOBJ_OnEnd),
    PROC_SLEEP(200),
    PROC_END,
};

SECTION(".rodata.08BA341C")
const struct ProcCmd ProcScr_efxSleepSE[] = {
    PROC_19,
    PROC_SET_END_CB(efxSleepSE_OnEnd),
    PROC_SLEEP(1),
    PROC_CALL(efxSleepSE_PlaySE),
    PROC_SLEEP(54),
    PROC_CALL(efxSleepSE_PlaySE),
    PROC_SLEEP(65),
    PROC_CALL(efxSleepSE_PlaySE),
    PROC_END,
};

SECTION(".rodata.08BA3464")
const struct ProcCmd ProcScr_efxHammarne[] = {
    PROC_19,
    PROC_REPEAT(efxHammarne_Loop_Main),
    PROC_END,
};

SECTION(".rodata.08BA347C")
const struct ProcCmd ProcScr_efxHammarneBG[] = {
    PROC_19,
    PROC_REPEAT(efxHammarneBG_Loop),
    PROC_END,
};

SECTION(".rodata.08BA34FC")
const struct ProcCmd ProcScr_efxHammarneOBJ[] = {
    PROC_19,
    PROC_SET_END_CB(efxHammarneOBJ_OnEnd),
    PROC_SLEEP(80),
    PROC_END,
};

SECTION(".rodata.08BA351C")
const struct ProcCmd ProcScr_efxBerserk[] = {
    PROC_19,
    PROC_REPEAT(efxBerserk_Loop_Main),
    PROC_END,
};

SECTION(".rodata.08BA3534")
const struct ProcCmd ProcScr_efxBerserkBG[] = {
    PROC_19,
    PROC_REPEAT(efxBerserkBG_Loop),
    PROC_END,
};

SECTION(".rodata.08BA354C")
const struct ProcCmd ProcScr_efxBerserkCLONE[] = {
    PROC_19,
    PROC_SET_END_CB(efxBerserkCLONE_OnEnd),
    PROC_REPEAT(efxBerserkCLONE_Loop),
    PROC_END,
};

SECTION(".rodata.08BA356C")
const struct ProcCmd ProcScr_efxBerserkOBJ[] = {
    PROC_19,
    PROC_SET_END_CB(efxBerserkOBJ_OnEnd),
    PROC_REPEAT(efxBerserkOBJ_Loop_A),
    PROC_SLEEP(7),
    PROC_REPEAT(efxBerserkOBJ_Loop_B),
    PROC_SLEEP(3),
    PROC_REPEAT(efxBerserkOBJ_Loop_C),
    PROC_SLEEP(7),
    PROC_REPEAT(efxBerserkOBJ_Loop_D),
    PROC_SLEEP(3),
    PROC_REPEAT(efxBerserkOBJ_Loop_E),
    PROC_SLEEP(7),
    PROC_REPEAT(efxBerserkOBJ_Loop_F),
    PROC_SLEEP(3),
    PROC_REPEAT(efxBerserkOBJ_Loop_G),
    PROC_SLEEP(7),
    PROC_REPEAT(efxBerserkOBJ_Loop_H),
    PROC_SLEEP(3),
    PROC_REPEAT(efxBerserkOBJ_Loop_I),
    PROC_SLEEP(7),
    PROC_REPEAT(efxBerserkOBJ_Loop_J),
    PROC_SLEEP(17),
    PROC_END,
};

SECTION(".rodata.08BA3624")
const struct ProcCmd ProcScr_efxMshield[] = {
    PROC_19,
    PROC_REPEAT(efxMshield_Loop_Main),
    PROC_END,
};

SECTION(".rodata.08BA363C")
const struct ProcCmd ProcScr_efxMshieldBG[] = {
    PROC_19,
    PROC_REPEAT(efxMshieldBG_Loop),
    PROC_END,
};

SECTION(".rodata.08BA3668")
const struct ProcCmd ProcScr_efxMshieldBGOBJ[] = {
    PROC_19,
    PROC_SET_END_CB(efxMshieldBGOBJ_OnEnd),
    PROC_SLEEP(220),
    PROC_END,
};

SECTION(".rodata.08BA3688")
const struct ProcCmd ProcScr_efxMshieldBGOBJ2[] = {
    PROC_19,
    PROC_SET_END_CB(efxMshieldBGOBJ_OnEnd),
    PROC_SLEEP(110),
    PROC_END,
};
