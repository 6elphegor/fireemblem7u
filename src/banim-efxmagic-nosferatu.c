#include "gbafe.h"

// ROM data referenced below, defined in data/ (see tools/datasplit.py)
extern const u8 Img_NosferatuBg_A[];
extern const u8 Img_NosferatuBg_B[];
extern const u8 Img_NosferatuBg_C[];
extern const u8 Img_NosferatuBg_D[];
extern const u8 Img_NosferatuBg_E[];
extern const u8 Img_NosferatuBg_F[];
extern const u8 Img_NosferatuBg_G[];
extern const u8 Img_NosferatuBg_H[];
extern const u8 Img_NosferatuBg_I[];
extern const u8 Img_NosferatuBg_J[];
extern const u8 Img_NosferatuBg_K[];
extern const u8 Img_NosferatuBg_L[];
extern const u8 Img_NosferatuBg_M[];
extern const u8 Tsa_NosferatuBg_00[];
extern const u8 Tsa_NosferatuBg_01[];
extern const u8 Tsa_NosferatuBg_02[];
extern const u8 Tsa_NosferatuBg_03[];
extern const u8 Tsa_NosferatuBg_04[];
extern const u8 Tsa_NosferatuBg_05[];
extern const u8 Tsa_NosferatuBg_06[];
extern const u8 Tsa_NosferatuBg_07[];
extern const u8 Tsa_NosferatuBg_08[];
extern const u8 Tsa_NosferatuBg_09[];
extern const u8 Tsa_NosferatuBg_0A[];
extern const u8 Tsa_NosferatuBg_0B[];
extern const u8 Tsa_NosferatuBg_0C[];
extern const u8 Tsa_NosferatuBg_0D[];
extern const u8 Tsa_NosferatuBg_0E[];
extern const u8 Tsa_NosferatuBg_0F[];
extern const u8 Tsa_NosferatuBg_10[];
extern const u8 Tsa_NosferatuBg_11[];
extern const u8 Tsa_NosferatuBg_12[];
extern const u8 Tsa_NosferatuBg_13[];
extern const u8 Tsa_NosferatuBg_14[];
extern const u8 Tsa_NosferatuBg_15[];
extern const u8 Tsa_NosferatuBg_16[];
extern const u8 Tsa_NosferatuBg_17[];
extern const u8 Tsa_NosferatuBg_18[];
extern const u8 Tsa_NosferatuBg_19[];
extern const u8 Tsa_NosferatuBg_1A[];
extern const u8 Tsa_NosferatuBg_1B[];
extern const u8 Tsa_NosferatuBg_1C[];
extern const u8 Tsa_NosferatuBg_1D[];
extern const u8 Tsa_NosferatuBg_1E[];
extern const u8 Tsa_NosferatuBg_1F[];
extern const u8 Tsa_NosferatuBg_20[];
extern const u8 Tsa_NosferatuBg_21[];
extern const u8 Tsa_NosferatuBg_22[];
extern const u8 Tsa_NosferatuBg_23[];
extern const u8 Tsa_NosferatuBg_24[];
extern const u8 Tsa_NosferatuBg_25[];
extern const u8 Tsa_NosferatuBg_26[];
extern const u8 Tsa_NosferatuBg_27[];
extern const u8 Tsa_NosferatuBg_28[];
extern const u8 Tsa_NosferatuBg_29[];
extern const u8 Tsa_NosferatuBg_2A[];
extern const u8 Tsa_NosferatuBg_2B[];
extern const u8 Tsa_NosferatuBg_2C[];
extern const u8 Tsa_NosferatuBg_2D[];
extern const u8 Tsa_NosferatuBg_2E[];
extern const u8 Tsa_NosferatuBg_2F[];
extern const u8 Tsa_NosferatuBg_30[];
extern const u8 Tsa_NosferatuBg_31[];
extern const u8 Tsa_NosferatuBg_32[];

/* auto-decls */
void NewEfxSpellCast(void);
void NewEfxFarAttackWithDistance(struct Anim * anim, s16 arg);
ProcPtr NewefxRestRST(struct Anim *anim, int unk44, int unk48, int frame, int speed);
void NewEfxRestWINH(struct Anim *anim, int a, s16 b, u32 c);
void EfxPlayHittedSFX(struct Anim * anim);
void RegisterEfxSpellCastEnd(void);
extern int gEfxBgSemaphore;
extern u16 Pal_NosferatuBg[];
extern u32 gEfxHpBarResireFlag;
extern const u16 gFrameConfig_081E8570[];

void StartSpellAnimNosferatu(struct Anim * anim);
void efxResire_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxResireBG(struct Anim * anim, int type);
void StartSubSpell_efxResireBG2(struct Anim * anim);
void efxResireBG_Loop_A(struct ProcEfxBG * proc);
void efxResireBG_Loop_B(struct ProcEfxBG * proc);
void efxResireBG_Loop_C(struct ProcEfxBG * proc);
void efxResireBG_Loop_D(struct ProcEfxBG * proc);
void efxResireBG2_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxResireRST(struct Anim * anim, ProcPtr efxproc, int c);
void efxResireRST_Loop(struct ProcEfxRST * proc);

extern const u16 StartSubSpell_efxResireBG_frames[];
extern const u16 StartSubSpell_efxResireBG2_frames[];

CONST_DATA struct ProcCmd ProcScr_efxResire[] = {
    PROC_19,
    PROC_REPEAT(efxResire_Loop_Main),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_efxResireBG[] = {
    PROC_19,
    PROC_REPEAT(efxResireBG_Loop_A),
    PROC_REPEAT(efxResireBG_Loop_B),
    PROC_REPEAT(efxResireBG_Loop_C),
    PROC_REPEAT(efxResireBG_Loop_D),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_efxResireBG2[] = {
    PROC_19,
    PROC_REPEAT(efxResireBG2_Loop),
    PROC_END,
};

CONST_DATA u16 * ImgArray_NosferatuBg[] = {
    (u16 *) Img_NosferatuBg_A,
    (u16 *) Img_NosferatuBg_A,
    (u16 *) Img_NosferatuBg_A,
    (u16 *) Img_NosferatuBg_A,
    (u16 *) Img_NosferatuBg_A,
    (u16 *) Img_NosferatuBg_A,
    (u16 *) Img_NosferatuBg_A,
    (u16 *) Img_NosferatuBg_A,
    (u16 *) Img_NosferatuBg_B,
    (u16 *) Img_NosferatuBg_B,
    (u16 *) Img_NosferatuBg_B,
    (u16 *) Img_NosferatuBg_C,
    (u16 *) Img_NosferatuBg_C,
    (u16 *) Img_NosferatuBg_D,
    (u16 *) Img_NosferatuBg_D,
    (u16 *) Img_NosferatuBg_E,
    (u16 *) Img_NosferatuBg_E,
    (u16 *) Img_NosferatuBg_F,
    (u16 *) Img_NosferatuBg_F,
    (u16 *) Img_NosferatuBg_F,
    (u16 *) Img_NosferatuBg_G,
    (u16 *) Img_NosferatuBg_G,
    (u16 *) Img_NosferatuBg_G,
    (u16 *) Img_NosferatuBg_H,
    (u16 *) Img_NosferatuBg_H,
    (u16 *) Img_NosferatuBg_H,
    (u16 *) Img_NosferatuBg_H,
    (u16 *) Img_NosferatuBg_H,
    (u16 *) Img_NosferatuBg_I,
    (u16 *) Img_NosferatuBg_I,
    (u16 *) Img_NosferatuBg_I,
    (u16 *) Img_NosferatuBg_I,
    (u16 *) Img_NosferatuBg_I,
    (u16 *) Img_NosferatuBg_I,
    (u16 *) Img_NosferatuBg_I,
    (u16 *) Img_NosferatuBg_I,
    (u16 *) Img_NosferatuBg_J,
    (u16 *) Img_NosferatuBg_J,
    (u16 *) Img_NosferatuBg_J,
    (u16 *) Img_NosferatuBg_J,
    (u16 *) Img_NosferatuBg_K,
    (u16 *) Img_NosferatuBg_K,
    (u16 *) Img_NosferatuBg_K,
    (u16 *) Img_NosferatuBg_L,
    (u16 *) Img_NosferatuBg_L,
    (u16 *) Img_NosferatuBg_L,
    (u16 *) Img_NosferatuBg_M,
    (u16 *) Img_NosferatuBg_M,
    (u16 *) Img_NosferatuBg_M,
    (u16 *) Img_NosferatuBg_M,
    (u16 *) Img_NosferatuBg_M,
};

CONST_DATA u16 * TsaArray_NosferatuBg[] = {
    (u16 *) Tsa_NosferatuBg_00,
    (u16 *) Tsa_NosferatuBg_01,
    (u16 *) Tsa_NosferatuBg_02,
    (u16 *) Tsa_NosferatuBg_03,
    (u16 *) Tsa_NosferatuBg_04,
    (u16 *) Tsa_NosferatuBg_05,
    (u16 *) Tsa_NosferatuBg_06,
    (u16 *) Tsa_NosferatuBg_07,
    (u16 *) Tsa_NosferatuBg_08,
    (u16 *) Tsa_NosferatuBg_09,
    (u16 *) Tsa_NosferatuBg_0A,
    (u16 *) Tsa_NosferatuBg_0B,
    (u16 *) Tsa_NosferatuBg_0C,
    (u16 *) Tsa_NosferatuBg_0D,
    (u16 *) Tsa_NosferatuBg_0E,
    (u16 *) Tsa_NosferatuBg_0F,
    (u16 *) Tsa_NosferatuBg_10,
    (u16 *) Tsa_NosferatuBg_11,
    (u16 *) Tsa_NosferatuBg_12,
    (u16 *) Tsa_NosferatuBg_13,
    (u16 *) Tsa_NosferatuBg_14,
    (u16 *) Tsa_NosferatuBg_15,
    (u16 *) Tsa_NosferatuBg_16,
    (u16 *) Tsa_NosferatuBg_17,
    (u16 *) Tsa_NosferatuBg_18,
    (u16 *) Tsa_NosferatuBg_19,
    (u16 *) Tsa_NosferatuBg_1A,
    (u16 *) Tsa_NosferatuBg_1B,
    (u16 *) Tsa_NosferatuBg_1C,
    (u16 *) Tsa_NosferatuBg_1D,
    (u16 *) Tsa_NosferatuBg_1E,
    (u16 *) Tsa_NosferatuBg_1F,
    (u16 *) Tsa_NosferatuBg_20,
    (u16 *) Tsa_NosferatuBg_21,
    (u16 *) Tsa_NosferatuBg_22,
    (u16 *) Tsa_NosferatuBg_23,
    (u16 *) Tsa_NosferatuBg_24,
    (u16 *) Tsa_NosferatuBg_25,
    (u16 *) Tsa_NosferatuBg_26,
    (u16 *) Tsa_NosferatuBg_27,
    (u16 *) Tsa_NosferatuBg_28,
    (u16 *) Tsa_NosferatuBg_29,
    (u16 *) Tsa_NosferatuBg_2A,
    (u16 *) Tsa_NosferatuBg_2B,
    (u16 *) Tsa_NosferatuBg_2C,
    (u16 *) Tsa_NosferatuBg_2D,
    (u16 *) Tsa_NosferatuBg_2E,
    (u16 *) Tsa_NosferatuBg_2F,
    (u16 *) Tsa_NosferatuBg_30,
    (u16 *) Tsa_NosferatuBg_31,
    (u16 *) Tsa_NosferatuBg_32,
};

CONST_DATA struct ProcCmd ProcScr_efxResireRST[] = {
    PROC_19,
    PROC_REPEAT(efxResireRST_Loop),
    PROC_END,
};

// 9.99 efxmagic-nosferatu:StartSpellAnimNosferatu
void StartSpellAnimNosferatu(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxResire, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

// 9.99 efxmagic-nosferatu:efxResire_Loop_Main
void efxResire_Loop_Main(struct ProcEfx * proc)
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
        SetBlendAlpha(0, 16);
        NewEfxALPHA(anim, 0, 10, 0, 16, 0);
        NewEfxALPHA(anim, 35, 20, 16, 0, 0);
        StartSubSpell_efxResireBG2(anim);
        PlaySFX(0x124, 0x100, anim->xPosition, 1);
        return;
    }

    if (proc->timer == duration + 15)
    {
        StartSubSpell_efxResireRST(anim, NewefxRestRST(anim, 42, 15, 0, 2), 30);
        NewEfxRestWINH(anim, 43, gDispIo.bg_off[BG_1].x, 0);
        return;
    }

    if (proc->timer == duration + 60)
    {
        StartSubSpell_efxResireBG(anim, proc->hitted);
        PlaySFX(0x125, 0x100, anim->xPosition, 1);
        return;
    }

    if (proc->timer == duration + 65)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimResireHitEffects(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
            return;
        }
    }
    else if ((proc->timer != duration + 110) && (proc->timer == duration + 130))
    {
        SpellFx_Finish();
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-nosferatu:StartSubSpell_efxResireBG
void StartSubSpell_efxResireBG(struct Anim * anim, int type)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxResireBG, PROC_TREE_3);
    proc->anim = anim;
    proc->unk29 = type;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxResireBG_frames;
    proc->tsal = TsaArray_NosferatuBg;
    proc->tsar = TsaArray_NosferatuBg;
    proc->img = ImgArray_NosferatuBg;

    SpellFx_RegisterBgPal(Pal_NosferatuBg, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE)
    {
        if (GetAnimPosition(proc->anim) == EKR_POS_L)
        {
            SetBgOffset(BG_1, 24, 0);
        }
        else
        {
            SetBgOffset(BG_1, 232, 0);
        }
    }

    return;
}

// 9.99 efxmagic-nosferatu:StartSubSpell_efxResireBG2
void StartSubSpell_efxResireBG2(struct Anim * anim)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxResireBG2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxResireBG2_frames;
    proc->tsal = TsaArray_NosferatuBg;
    proc->tsar = TsaArray_NosferatuBg;
    proc->img = ImgArray_NosferatuBg;

    SpellFx_RegisterBgPal(Pal_NosferatuBg, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    SetWinEnable(0, 0, 0);

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE)
    {
        if (GetAnimPosition(proc->anim) == EKR_POS_L)
        {
            SetBgOffset(BG_1, 24, 0);
        }
        else
        {
            SetBgOffset(BG_1, 232, 0);
        }
    }

    return;
}

// 9.99 efxmagic-nosferatu:efxResireBG_Loop_A
void efxResireBG_Loop_A(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 * const * tsaL = proc->tsal;
        u16 * const * tsaR = proc->tsar;
        u16 * const * img = proc->img;

        SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
    }
    else
    {
        if (ret == -1)
        {
            SpellFx_ClearBG1();

            if (proc->unk29 == 1)
            {
                gEfxBgSemaphore--;

                SpellFx_ClearColorEffects();
                RegisterEfxSpellCastEnd();

                Proc_End(proc);
            }
            else
            {
                proc->timer = 0;
                proc->terminator = 1;
                Proc_Break(proc);
            }
        }
    }

    return;
}

// 9.99 efxmagic-nosferatu:efxResireBG_Loop_B
void efxResireBG_Loop_B(struct ProcEfxBG * proc)
{
    if (gEfxHpBarResireFlag == 2)
    {
        gEfxBgSemaphore--;

        SpellFx_ClearColorEffects();
        RegisterEfxSpellCastEnd();

        Proc_End(proc);
    }
    else
    {
        proc->timer++;

        if (proc->timer > proc->terminator)
        {
            proc->timer = proc->terminator;
        }

        if ((proc->timer == proc->terminator) && (gEfxHpBarResireFlag == 1))
        {
            proc->timer = 0;
            proc->terminator = 0;
            proc->frame = 0;
            proc->frame_config = gFrameConfig_081E8570;
            proc->tsal = TsaArray_NosferatuBg;
            proc->tsar = TsaArray_NosferatuBg;
            proc->img = ImgArray_NosferatuBg;

            if (gEkrDistanceType != EKR_DISTANCE_CLOSE)
            {
                proc->terminator = EfxGetCamMovDuration();
                NewEfxFarAttackWithDistance(proc->anim, -1);
            }

            Proc_Break(proc);
        }
    }

    return;
}

// 9.99 efxmagic-nosferatu:efxResireBG_Loop_C
void efxResireBG_Loop_C(struct ProcEfxBG * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);

    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        if (gEkrDistanceType != EKR_DISTANCE_CLOSE)
        {
            if (GetAnimPosition(proc->anim) == EKR_POS_L)
            {
                SetBgOffset(BG_1, 232, 0);
            }
            else
            {
                SetBgOffset(BG_1, 24, 0);
            }
        }

        proc->timer = 0;
        PlaySFX(0x126, 0x100, anim->xPosition, 1);

        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-nosferatu:efxResireBG_Loop_D
void efxResireBG_Loop_D(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 * const * tsaL = proc->tsal;
        u16 * const * tsaR = proc->tsar;
        u16 * const * img = proc->img;

        SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
    }
    else
    {
        if (ret == -1)
        {
            SpellFx_ClearBG1();

            gEfxBgSemaphore--;

            SpellFx_ClearColorEffects();
            RegisterEfxSpellCastEnd();

            Proc_Break(proc);
        }
    }

    return;
}

// 9.99 efxmagic-nosferatu:efxResireBG2_Loop
void efxResireBG2_Loop(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 * const * tsaL = proc->tsal;
        u16 * const * tsaR = proc->tsar;
        u16 * const * img = proc->img;

        SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
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

// 9.99 efxmagic-nosferatu:StartSubSpell_efxResireRST
void StartSubSpell_efxResireRST(struct Anim * anim, ProcPtr efxproc, int c)
{
    struct ProcEfxRST * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxResireRST, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->duration = c;
    proc->efxproc = efxproc;

    return;
}

// 9.99 efxmagic-nosferatu:efxResireRST_Loop
void efxResireRST_Loop(struct ProcEfxRST * proc)
{
    struct ProcEfx * otherProc = proc->efxproc;

    otherProc->frame = Interpolate(INTERPOLATE_RSQUARE, 0, 128, proc->timer, proc->duration);

    proc->timer++;

    if (proc->timer > proc->duration)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}
