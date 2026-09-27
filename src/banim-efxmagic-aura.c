#include "gbafe.h"

/* auto-decls */
void NewEfxSpellCast(void);
void NewEfxFarAttackWithDistance(struct Anim * anim, s16 arg);
void EfxPlayHittedSFX(struct Anim * anim);
void NewEfxTwobaiRST(struct Anim *anim, int unk44);
void RegisterEfxSpellCastEnd(void);
extern int gEfxBgSemaphore;
extern u16 Img_AuraBg1[];
extern u16 Pal_AuraBg1[];
extern u16 Img_ShineBg1[];
extern u16 Tsa_ShineBg1_Left[];
extern u16 Tsa_ShineBg1_Right[];
extern u16 Pal_ShineBg_0828FD00[];
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

CONST_DATA struct ProcCmd ProcScr_efxOura[] = {
    PROC_19,
    PROC_REPEAT(efxOura_Loop_Main),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_efxOuraBG[] = {
    PROC_19,
    PROC_REPEAT(efxOuraBG_Loop),
    PROC_END,
};

CONST_DATA u16 * TsaArray_AuraBg1[] = {
    (u16 *) 0x0829E770,
    (u16 *) 0x0829E810,
    (u16 *) 0x0829E8B8,
    (u16 *) 0x0829E960,
    (u16 *) 0x0829EA0C,
    (u16 *) 0x0829EAC4,
    (u16 *) 0x0829EB7C,
    (u16 *) 0x0829EC2C,
    (u16 *) 0x0829ECD8,
    (u16 *) 0x0829ED80,
    (u16 *) 0x0829EE20,
    (u16 *) 0x0829EEBC,
    (u16 *) 0x0829EF54,
    (u16 *) 0x0829F06C,
    (u16 *) 0x0829F1A8,
    (u16 *) 0x0829F2F8,
    (u16 *) 0x0829F434,
    (u16 *) 0x0829F538,
    (u16 *) 0x0829F5DC,
    (u16 *) 0x0829F678,
    (u16 *) 0x0829F714,
    (u16 *) 0x0829F7B0,
    (u16 *) 0x0829F84C,
    (u16 *) 0x0829F8E8,
    (u16 *) 0x0829F9A4,
    (u16 *) 0x0829FA94,
    (u16 *) 0x0829FB98,
    (u16 *) 0x0829FC9C,
};

CONST_DATA struct ProcCmd ProcScr_efxOuraBG2[] = {
    PROC_19,
    PROC_SET_END_CB(efxOuraBG2_OnEnd),
    PROC_REPEAT(efxOuraBG2_Loop),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_efxOuraBGCOL[] = {
    PROC_19,
    PROC_MARK(10),
    PROC_REPEAT(efxOuraBGCOL_Loop),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_efxOuraBG3[] = {
    PROC_19,
    PROC_REPEAT(efxOuraBG3_Loop),
    PROC_END,
};

CONST_DATA u16 * TsaArray_AuraBg3[] = {
    (u16 *) 0x082AEF80,
    (u16 *) 0x082AF1F8,
    (u16 *) 0x082AF470,
    (u16 *) 0x082AF6E8,
    (u16 *) 0x082AF960,
    (u16 *) 0x082AFBD0,
    (u16 *) 0x082AFE2C,
    (u16 *) 0x082B00A4,
    (u16 *) 0x082B031C,
    (u16 *) 0x082B0594,
    (u16 *) 0x082B080C,
    (u16 *) 0x082B0A84,
};

CONST_DATA u16 * ImgArray_AuraBg3[] = {
    (u16 *) 0x0829FDA0,
    (u16 *) 0x082A11B4,
    (u16 *) 0x082A26E0,
    (u16 *) 0x082A3C5C,
    (u16 *) 0x082A51E4,
    (u16 *) 0x082A65D4,
    (u16 *) 0x082A78E0,
    (u16 *) 0x082A8C54,
    (u16 *) 0x082AA140,
    (u16 *) 0x082AB4EC,
    (u16 *) 0x082AC89C,
    (u16 *) 0x082ADBB8,
};

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
