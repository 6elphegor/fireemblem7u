#include "gbafe.h"

/* auto-decls */
void NewEfxSpellCast(void);
void NewEfxFarAttackWithDistance(struct Anim * anim, s16 arg);
ProcPtr NewefxRestRST(struct Anim *anim, int unk44, int unk48, int frame, int speed);
void NewEfxRestWINH(struct Anim *anim, int a, s16 b, u32 c);
void EfxPlayHittedSFX(struct Anim * anim);
void RegisterEfxSpellCastEnd(void);
extern struct ProcCmd ProcScr_efxResire[];
extern int gEfxBgSemaphore;
extern struct ProcCmd ProcScr_efxResireBG[];
extern u16 * TsaArray_NosferatuBg[];
extern u16 * ImgArray_NosferatuBg[];
extern u16 Pal_NosferatuBg[];
extern struct ProcCmd ProcScr_efxResireBG2[];
extern u32 gEfxHpBarResireFlag;
extern const u16 gFrameConfig_081E8570[];
extern struct ProcCmd ProcScr_efxResireRST[];

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
