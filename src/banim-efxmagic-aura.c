#include "gbafe.h"

/* auto-decls */
void NewEfxSpellCast(void);
void NewEfxFarAttackWithDistance(struct Anim * anim, s16 arg);
void EfxPlayHittedSFX(struct Anim * anim);
void NewEfxTwobaiRST(struct Anim *anim, int unk44);
void RegisterEfxSpellCastEnd(void);
extern struct ProcCmd ProcScr_efxOura[];
extern int gEfxBgSemaphore;
extern struct ProcCmd ProcScr_efxOuraBG[];
extern u16 * TsaArray_AuraBg1[];
extern u16 Img_AuraBg1[];
extern u16 Pal_AuraBg1[];
extern struct ProcCmd ProcScr_efxOuraBG2[];
extern u16 Img_ShineBg1[];
extern u16 Tsa_ShineBg1_Left[];
extern u16 Tsa_ShineBg1_Right[];
extern struct ProcCmd ProcScr_efxOuraBGCOL[];
extern u16 Pal_ShineBg_0828FD00[];
extern struct ProcCmd ProcScr_efxOuraBG3[];
extern u16 * TsaArray_AuraBg3[];
extern u16 * ImgArray_AuraBg3[];
extern u16 Pal_AuraBg3[];

void StartSpellAnimAura(struct Anim * anim);
void efxOura_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxOuraBG_A(struct Anim * anim);
void StartSubSpell_efxOuraBG_B(struct Anim * anim);
void StartSubSpell_efxOuraBG_C(struct Anim * anim);
void efxOuraBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxOuraBG2(struct Anim * anim);
void efxOuraBG2_OnEnd(void);
void efxOuraBG2_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxOuraBGCOL(struct Anim * anim);
void efxOuraBGCOL_Loop(struct ProcEfxBGCOL * proc);
void StartSubSpell_efxOuraBG3(struct Anim * anim);
void efxOuraBG3_Loop(struct ProcEfxBG * proc);

extern const u16 StartSubSpell_efxOuraBG_A_frames[];
extern const u16 StartSubSpell_efxOuraBG_B_frames[];
extern const u16 StartSubSpell_efxOuraBG_C_frames[];
extern const u16 StartSubSpell_efxOuraBGCOL_frames[];
extern const u16 StartSubSpell_efxOuraBG3_frames[];

// 9.99 efxmagic-aura:StartSpellAnimAura
void StartSpellAnimAura(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxOura, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

// 9.99 efxmagic-aura:efxOura_Loop_Main
void efxOura_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        StartSubSpell_efxOuraBG_A(anim);
        PlaySFX(0x2C1, 0x100, proc->anim->xPosition, 1);
    }
    else if (proc->timer == 14)
    {
        StartSubSpell_efxOuraBG_B(anim);
    }
    else if (proc->timer == 44)
    {
        PlaySFX(0x2C2, 0x100, proc->anim->xPosition, 1);
    }
    else if (proc->timer == 83)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
        NewEfxFlashBgWhite(anim, 10);
    }
    else if (proc->timer == duration + 93)
    {
        StartSubSpell_efxOuraBG_C(anim);
    }
    else if (proc->timer == duration + 103)
    {
        PlaySFX(0x2C3, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 125)
    {
        NewEfxALPHA(anim, 0, 10, 16, 0, 0);
    }
    else if (proc->timer == duration + 137)
    {
        StartSubSpell_efxOuraBG2(anim);
        StartSubSpell_efxOuraBGCOL(anim);
    }
    else if (proc->timer == duration + 144)
    {
        NewEfxFlashBgWhite(anim, 10);
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);
        StartBattleAnimHitEffectsDefault(anim, proc->hitted);
        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (proc->timer == duration + 154)
    {
        NewEfxRestWINH_(proc->anim, 85, 1);
        NewEfxTwobaiRST(proc->anim, 56);
        StartSubSpell_efxOuraBG3(anim);
        NewEfxALPHA(anim, 44, 12, 16, 0, 0);
    }
    else if (proc->timer == duration + 245)
    {

        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-aura:StartSubSpell_efxOuraBG_A
void StartSubSpell_efxOuraBG_A(struct Anim * anim)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxOuraBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxOuraBG_A_frames;

    proc->tsal = TsaArray_AuraBg1;
    proc->tsar = TsaArray_AuraBg1;

    SpellFx_RegisterBgGfx(Img_AuraBg1, 32 * 8 * CHR_SIZE);
    SpellFx_RegisterBgPal(Pal_AuraBg1, PLTT_SIZE_4BPP);

    SetBgOffset(BG_1, 0, 0);

    if (gEkrDistanceType == 0)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            SetBgOffset(BG_1, 24, 0);
        }
        else
        {
            SetBgOffset(BG_1, 232, 0);
        }
    }

    SpellFx_SetSomeColorEffect();

    return;
}

// 9.99 efxmagic-aura:StartSubSpell_efxOuraBG_B
void StartSubSpell_efxOuraBG_B(struct Anim * anim)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxOuraBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxOuraBG_B_frames;

    proc->tsal = TsaArray_AuraBg1;
    proc->tsar = TsaArray_AuraBg1;

    SpellFx_RegisterBgGfx(Img_AuraBg1, 32 * 8 * CHR_SIZE);
    SpellFx_RegisterBgPal(Pal_AuraBg1, PLTT_SIZE_4BPP);

    SetBgOffset(BG_1, 0, 0);

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

    SpellFx_SetSomeColorEffect();

    return;
}

// 9.99 efxmagic-aura:StartSubSpell_efxOuraBG_C
void StartSubSpell_efxOuraBG_C(struct Anim * anim)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxOuraBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxOuraBG_C_frames;

    proc->tsal = TsaArray_AuraBg1;
    proc->tsar = TsaArray_AuraBg1;

    SpellFx_RegisterBgGfx(Img_AuraBg1, 32 * 8 * CHR_SIZE);
    SpellFx_RegisterBgPal(Pal_AuraBg1, PLTT_SIZE_4BPP);

    SetBgOffset(BG_1, 0, 0);

    if (gEkrDistanceType != 0)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            SetBgOffset(BG_1, 24, 0);
        }
        else
        {
            SetBgOffset(BG_1, 232, 0);
        }
    }

    SpellFx_SetSomeColorEffect();

    return;
}

// 9.99 efxmagic-aura:efxOuraBG_Loop
void efxOuraBG_Loop(struct ProcEfxBG * proc)
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

// 9.99 efxmagic-aura:StartSubSpell_efxOuraBG2
void StartSubSpell_efxOuraBG2(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxOuraBG2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 5;

    SpellFx_RegisterBgGfx(Img_ShineBg1, 32 * 8 * CHR_SIZE);
    SpellFx_ClearBG1();

    if (gEkrDistanceType == 0)
    {
        LZ77UnCompWram(Tsa_ShineBg1_Left, gEkrTsaBuffer);
    }
    else
    {
        LZ77UnCompWram(Tsa_ShineBg1_Right, gEkrTsaBuffer);
    }

    if (GetAnimPosition(proc->anim) == 0)
    {
        EfxTmCpyBgHFlip(gEkrTsaBuffer, gBg1Tm, 30, 20, 1, 0x100);
    }
    else
    {
        EfxTmCpyBG(gEkrTsaBuffer, gBg1Tm, 30, 20, 1, 0x100);
    }

    EnableBgSync(BG1_SYNC_BIT);
    SpellFx_SetSomeColorEffect();

    SetBgOffset(BG_1, 0, 0);
    SetWinEnable(0, 0, 0);

    return;
}

// 9.99 efxmagic-aura:efxOuraBG2_OnEnd
void efxOuraBG2_OnEnd(void)
{
    SpellFx_ClearBG1();
    gEfxBgSemaphore--;
    SpellFx_ClearColorEffects();
    return;
}

// 9.99 efxmagic-aura:efxOuraBG2_Loop
void efxOuraBG2_Loop(struct ProcEfxBG * proc)
{
    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-aura:StartSubSpell_efxOuraBGCOL
void StartSubSpell_efxOuraBGCOL(struct Anim * anim)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxOuraBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->timer2 = 0;

    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxOuraBGCOL_frames;

    proc->pal = Pal_ShineBg_0828FD00;
    SpellFx_RegisterBgPal(Pal_ShineBg_0828FD00 + 0x30, PLTT_SIZE_4BPP);

    return;
}

// 9.99 efxmagic-aura:efxOuraBGCOL_Loop
void efxOuraBGCOL_Loop(struct ProcEfxBGCOL * proc)
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
            gEfxBgSemaphore--;
            Proc_Break(proc);
        }
    }

    return;
}

// 9.99 efxmagic-aura:StartSubSpell_efxOuraBG3
void StartSubSpell_efxOuraBG3(struct Anim * anim)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxOuraBG3, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxOuraBG3_frames;

    proc->tsal = TsaArray_AuraBg3;
    proc->tsar = TsaArray_AuraBg3;
    proc->img = ImgArray_AuraBg3;

    SpellFx_RegisterBgPal(Pal_AuraBg3, PLTT_SIZE_4BPP);

    SetBgOffset(BG_1, 0, 0);
    SpellFx_SetSomeColorEffect();

    return;
}

// 9.99 efxmagic-aura:efxOuraBG3_Loop
void efxOuraBG3_Loop(struct ProcEfxBG * proc)
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
