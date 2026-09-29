#include "gbafe.h"

/* auto-decls */
extern const struct ProcCmd ProcScr_efxGespenstBG4[];
extern u16 Img_GespenstBg4[];
extern u16 Pal_GespenstBg4[];
extern u16 Tsa_GespenstBg4[];
extern const struct ProcCmd ProcScr_efxGespenstBGCOL2[];
extern u16 Pal_0829B13C[];
void NewEfxSpellCast(void);
void NewEfxFarAttackWithDistance(struct Anim * anim, s16 arg);
void EfxPlayHittedSFX(struct Anim * anim);
void RegisterEfxSpellCastEnd(void);
extern int gEfxBgSemaphore;
extern AnimScr FramScr_Unk5D4F90[];
extern const struct ProcCmd ProcScr_efxGespenst[];
extern const struct ProcCmd ProcScr_efxGespenstBG[];
extern const struct ProcCmd ProcScr_efxGespenstBG2[];
extern const struct ProcCmd ProcScr_efxGespenstOBJ[];
extern struct ProcCmd ProcScr_efxGespenstOBJ2[];
extern const s16 FrameConfig_GespenstBG[];
extern u16 * TsaArray_GespenstBG[];
extern u16 Img_GespenstBG[];
extern u16 Pal_GespenstBG[];
extern u16 Img_GespenstBG2[];
extern u16 Pal_GespenstBG2[];
extern u16 Tsa_GespenstBG2[];
extern AnimScr AnimScr_GespenstOBJ[];
extern u16 Pal_GespenstOBJ[];
extern u16 Img_GespenstOBJ[];
extern u16 Pal_GespenstOBJ2[];
extern u16 Img_GespenstOBJ2[];
extern AnimScr AnimScr_GespenstOBJ2_A[];
extern AnimScr AnimScr_GespenstOBJ2_B[];
extern AnimScr AnimScr_GespenstOBJ2_C[];

void StartSubSpell_efxGespenstBG(struct Anim * anim);
void StartSubSpell_efxGespenstBG2(struct Anim * anim, int terminator);
void StartSubSpell_efxGespenstOBJ(struct Anim * anim, int terminator);
void StartSubSpell_efxGespenstOBJ2(struct Anim * anim);

void StartSubSpell_efxGespenstBG4(struct Anim * anim, int terminator);
void efxGespenstBG4_OnEnd(void);
void efxGespenstBG4_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxGespenstBGCOL2(struct Anim * anim);
void efxGespenstBGCOL2_Loop(struct ProcEfxBGCOL * proc);

extern const u16 StartSubSpell_efxGespenstBGCOL2_frames[];

void StartSpellAnimGespenst(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxGespenst, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));
}

void efxGespenst_Loop(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
        NewEfxFarAttackWithDistance(proc->anim, -1);

    if (proc->timer == duration + 1)
    {
        StartSubSpell_efxGespenstBG(anim);
        StartSubSpell_efxGespenstOBJ2(anim);
        SetBlendAlpha(0, 16);
        NewEfxALPHA(anim, 0, 20, 0, 16, 0);
        NewEfxALPHA(anim, 50, 10, 16, 0, 0);
        PlaySFX(0x2C7, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 0x45)
    {
        StartSpellThing_MagicQuake(proc->anim, 90, 10);
        StartSubSpell_efxGespenstBG2(anim, 84);
        SetBlendAlpha(0, 16);
        NewEfxALPHA(anim, 0, 20, 0, 16, 0);
        PlaySFX(0x2C8, 0x100, 0x78, 1);
    }
    else if (proc->timer == duration + 0x58)
    {
        StartSubSpell_efxGespenstOBJ(anim, 50);
    }
    else if (proc->timer == duration + 0x5D)
    {
        NewEfxFlashBgWhite(anim, 5);
    }
    else if (proc->timer == duration + 0x6C)
    {
        NewEfxFlashBgWhite(anim, 5);
    }
    else if (proc->timer == duration + 0x99)
    {
        NewEfxFlashBgWhite(anim, 10);
        anim->state3 |= ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED;
        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (proc->hitted == 0)
            EfxPlayHittedSFX(anim);
    }
    else if (proc->timer == duration + 0x9F)
    {
        if (proc->hitted != 0)
        {
            SpellFx_Finish();
            RegisterEfxSpellCastEnd();
            Proc_Break(proc);
        }
    }
    else if (proc->timer == duration + 0xA3)
    {
        StartSpellThing_MagicQuake(proc->anim, 15, 9);
        StartSubSpell_efxGespenstBG4(anim, 30);
        StartSubSpell_efxGespenstBGCOL2(anim);
        PlaySFX(0x2C9, 0x100, 0x78, 1);
    }
    else if (proc->timer == duration + 0xB3)
    {
        StartSpellThing_MagicQuake(proc->anim, 15, 8);
    }
    else if (proc->timer == duration + 0xCC)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }
}

void StartSubSpell_efxGespenstBG(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxGespenstBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = FrameConfig_GespenstBG;
    proc->tsal = TsaArray_GespenstBG;
    proc->tsar = TsaArray_GespenstBG;

    SpellFx_RegisterBgGfx(Img_GespenstBG, 0x2000);
    SpellFx_RegisterBgPal(Pal_GespenstBG, 0x20);
    SetBgOffset(BG_1, 0, 0);

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE)
    {
        if (GetAnimPosition(proc->anim) == EKR_POS_L)
            SetBgOffset(BG_1, 0x18, 0);
        else
            SetBgOffset(BG_1, 0xE8, 0);
    }

    SpellFx_SetSomeColorEffect();
}

void efxGespenstBG_Loop(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));

        if (gEkrDistanceType != EKR_DISTANCE_CLOSE)
        {
            int pos = GetAnimPosition(proc->anim);

            if (pos == EKR_POS_L)
                FillBGRect(gBg1Tm, 3, 20, 0, pos);
            else
                FillBGRect(gBg1Tm + 29, 3, 20, 0, 0);

            EnableBgSync(BG1_SYNC_BIT);
        }
    }
    else if (ret == -1)
    {
        SpellFx_ClearBG1();
        gEfxBgSemaphore--;
        SpellFx_ClearColorEffects();
        Proc_Break(proc);
    }
}

void StartSubSpell_efxGespenstBG2(struct Anim * anim, int terminator)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxGespenstBG2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;

    SpellFx_RegisterBgGfx(Img_GespenstBG2, 0x2000);
    SpellFx_RegisterBgPal(Pal_GespenstBG2, 0x20);
    SpellFx_ClearBG1();
    LZ77UnCompWram(Tsa_GespenstBG2, gEkrTsaBuffer);
    EfxTmCpyBgHFlip(gEkrTsaBuffer, gBg1Tm, 32, 32, 1, 0x100);
    EnableBgSync(BG1_SYNC_BIT);
    SpellFx_SetSomeColorEffect();
    SetBgOffset(BG_1, 0, 0);
    SetWinEnable(0, 0, 0);
}

void efxGespenstBG2_OnEnd(void)
{
    SpellFx_ClearBG1();
    gEfxBgSemaphore--;
    SpellFx_ClearColorEffects();
}

void efxGespenstBG2_Loop(struct ProcEfxBG * proc)
{
    if (GetAnimPosition(proc->anim) == EKR_POS_L)
        gDispIo.bg_off[BG_1].x += 2;
    else
        gDispIo.bg_off[BG_1].x -= 2;

    if (++proc->timer > proc->terminator)
        Proc_Break(proc);
}

// 9.99 efxmagic-gespenst:StartSubSpell_efxGespenstBG4
void StartSubSpell_efxGespenstBG4(struct Anim * anim, int terminator)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxGespenstBG4, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;

    SpellFx_RegisterBgGfx(Img_GespenstBg4, 32 * 8 * CHR_SIZE);
    SpellFx_RegisterBgPal(Pal_GespenstBg4, PLTT_SIZE_4BPP);
    SpellFx_ClearBG1();

    LZ77UnCompWram(Tsa_GespenstBg4, gEkrTsaBuffer);
    EfxTmCpyBgHFlip(gEkrTsaBuffer, gBg1Tm, 30, 20, 1, 0x100);

    EnableBgSync(BG1_SYNC_BIT);
    SpellFx_SetSomeColorEffect();

    SetBgOffset(BG_1, 0, 0);
    SetWinEnable(0, 0, 0);

    return;
}

// 9.99 efxmagic-gespenst:efxGespenstBG4_OnEnd
void efxGespenstBG4_OnEnd(void)
{
    SpellFx_ClearBG1();
    gEfxBgSemaphore--;
    SpellFx_ClearColorEffects();
    return;
}

// 9.99 efxmagic-gespenst:efxGespenstBG4_Loop
void efxGespenstBG4_Loop(struct ProcEfxBG * proc)
{
    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-gespenst:StartSubSpell_efxGespenstBGCOL2
void StartSubSpell_efxGespenstBGCOL2(struct Anim * anim)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxGespenstBGCOL2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->timer2 = 0;

    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxGespenstBGCOL2_frames;

    proc->pal = Pal_GespenstBg4;
    SpellFx_RegisterBgPal(Pal_0829B13C, PLTT_SIZE_4BPP);

    return;
}

// 9.99 efxmagic-gespenst:efxGespenstBGCOL2_Loop
void efxGespenstBGCOL2_Loop(struct ProcEfxBGCOL * proc)
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

void StartSubSpell_efxGespenstOBJ(struct Anim * anim, int terminator)
{
    struct ProcEfxOBJ * proc;
    struct Anim * front;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxGespenstOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;

    front = proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_GespenstOBJ, AnimScr_GespenstOBJ, AnimScr_GespenstOBJ, AnimScr_GespenstOBJ);
    front->xPosition = 0x78;
    front->yPosition = 0x48;

    SpellFx_RegisterObjPal(Pal_GespenstOBJ, 0x20);
    SpellFx_RegisterObjGfx(Img_GespenstOBJ, 0x1000);
}

void efxGespenstOBJ_Loop(struct ProcEfxOBJ * proc)
{
    if (++proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }
}

void StartSubSpell_efxGespenstOBJ2(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * front;
    AnimScr * script;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxGespenstOBJ2, PROC_TREE_3);
    proc->anim = anim;

    GetAnimAnotherSide(anim);
    script = FramScr_Unk5D4F90;
    front = proc->anim2 = EfxCreateFrontAnim(proc->anim, script, script, script, script);
    front->oam2Base = (front->oam2Base & ~0xC00) | 0x400;

    SpellFx_RegisterObjPal(Pal_GespenstOBJ2, 0x20);
    SpellFx_RegisterObjGfx(Img_GespenstOBJ2, 0x1000);
}

void efxGespenstOBJ2_OnEnd(struct ProcEfxOBJ * proc)
{
    gEfxBgSemaphore--;
    AnimDelete(proc->anim2);
}

void efxGespenstOBJ2_Loop_A(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrCurrent = anim->pScrStart = AnimScr_GespenstOBJ2_A;
    anim->timer = 0;
    Proc_Break(proc);
}

void efxGespenstOBJ2_Loop_B(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrCurrent = anim->pScrStart = AnimScr_GespenstOBJ2_B;
    anim->timer = 0;
    Proc_Break(proc);
}

void efxGespenstOBJ2_Loop_C(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrCurrent = anim->pScrStart = AnimScr_GespenstOBJ2_C;
    anim->timer = 0;
    Proc_Break(proc);
}

SECTION(".rodata.08BA3BE4")
const struct ProcCmd ProcScr_efxGespenst[] = {
    PROC_19,
    PROC_REPEAT(efxGespenst_Loop),
    PROC_END,
};

SECTION(".rodata.08BA3BFC")
const struct ProcCmd ProcScr_efxGespenstBG[] = {
    PROC_19,
    PROC_REPEAT(efxGespenstBG_Loop),
    PROC_END,
};

SECTION(".rodata.08BA3C44")
const struct ProcCmd ProcScr_efxGespenstBG2[] = {
    PROC_19,
    PROC_SET_END_CB(efxGespenstBG2_OnEnd),
    PROC_REPEAT(efxGespenstBG2_Loop),
    PROC_END,
};

SECTION(".rodata.08BA3C64")
const struct ProcCmd ProcScr_efxGespenstBG4[] = {
    PROC_19,
    PROC_SET_END_CB(efxGespenstBG4_OnEnd),
    PROC_REPEAT(efxGespenstBG4_Loop),
    PROC_END,
};

SECTION(".rodata.08BA3C84")
const struct ProcCmd ProcScr_efxGespenstBGCOL2[] = {
    PROC_19,
    PROC_MARK(10),
    PROC_REPEAT(efxGespenstBGCOL2_Loop),
    PROC_END,
};

SECTION(".rodata.08BA3CA4")
const struct ProcCmd ProcScr_efxGespenstOBJ[] = {
    PROC_19,
    PROC_REPEAT(efxGespenstOBJ_Loop),
    PROC_END,
};
