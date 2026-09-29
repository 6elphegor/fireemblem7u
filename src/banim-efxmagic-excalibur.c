#include "gbafe.h"

extern const struct AnimSpriteData AnimSprite_EfxExcalibur_08BD2C3C[],
    AnimSprite_EfxExcalibur_08BD2C90[], AnimSprite_EfxExcalibur_08BD2CE4[],
    AnimSprite_EfxExcalibur_08BD2D38[], AnimSprite_EfxExcalibur_08BD2D8C[],
    AnimSprite_EfxExcalibur_08BD2DE0[], AnimSprite_EfxExcalibur_08BD2E34[],
    AnimSprite_EfxExcalibur_08BD2E88[], AnimSprite_EfxExcalibur_08BD2EDC[],
    AnimSprite_EfxExcalibur_08BD2F30[], AnimSprite_EfxExcalibur_08BD2F84[],
    AnimSprite_EfxExcalibur_08BD2FD8[], AnimSprite_EfxExcalibur_08BD302C[],
    AnimSprite_EfxExcalibur_08BD3080[], AnimSprite_EfxExcalibur_08BD30D4[],
    AnimSprite_EfxExcalibur_08BD3128[], AnimSprite_EfxExcalibur_08BD317C[],
    AnimSprite_EfxExcalibur_08BD31D0[], AnimSprite_EfxExcalibur_08BD3224[],
    AnimSprite_EfxExcalibur_08BD3278[], AnimSprite_EfxExcalibur_08BD32CC[],
    AnimSprite_EfxExcalibur_08BD3320[], AnimSprite_EfxExcalibur_08BD3374[],
    AnimSprite_EfxExcalibur_08BD33C8[], AnimSprite_EfxExcalibur_08BD341C[],
    AnimSprite_EfxExcalibur_08BD3470[], AnimSprite_EfxExcalibur_08BD34B8[],
    AnimSprite_EfxExcalibur_08BD350C[], AnimSprite_EfxExcalibur_08BD3560[],
    AnimSprite_EfxExcalibur_08BD35B4[], AnimSprite_EfxExcalibur_08BD3608[],
    AnimSprite_EfxExcalibur_08BD365C[], AnimSprite_EfxExcalibur_08BD36B0[],
    AnimSprite_EfxExcalibur_08BD3704[];

/* auto-decls */
void NewEfxSpellCast(void);
void NewEfxFarAttackWithDistance(struct Anim * anim, s16 arg);
void StartSubSpell_efxExcaliburBG0(struct Anim * anim);
void EfxPlayHittedSFX(struct Anim * anim);
void RegisterEfxSpellCastEnd(void);
extern const struct ProcCmd ProcScr_efxExcalibur[];
extern int gEfxBgSemaphore;
extern const struct ProcCmd ProcScr_efxExcaliburBG[];
extern u16 Img_ExcaliburBg1[];
extern u16 Tsa_ExcaliburBg1[];
extern const struct ProcCmd ProcScr_efxExcaliburBGCOL[];
extern u16 Pal_ExcaliburBg1[];
extern const struct ProcCmd ProcScr_efxExcaliburSCR[];
extern s16 gExcaliburBgScrollOffsets[];
extern const struct ProcCmd ProcScr_efxExcaliburSCR2[];
extern const struct ProcCmd ProcScr_efxExcaliburBG2[];
extern const u8 Img_ExcaliburBg2[];
extern u16 Tsa_ExcaliburBg2_Left[];
extern u16 Tsa_ExcaliburBg2_Right[];
extern const struct ProcCmd ProcScr_efxExcaliburBGCOL2[];
extern u16 Pal_ExcaliburBg2[];
extern const struct ProcCmd ProcScr_efxExcaliburBG3[];
extern u16 Img_ShineBg1[];
extern u16 Tsa_ShineBg1_Left[];
extern u16 Tsa_ShineBg1_Right[];
extern const struct ProcCmd ProcScr_efxExcaliburBGCOL3[];
extern u16 Pal_ExcaliburBg3[];
extern const struct ProcCmd ProcScr_efxExcaliburOBJ[];
extern const AnimScr AnimScr_EfxExcalibur[];
extern u16 Pal_ExcaliburSprites[];
extern u16 Img_ExcaliburSprites[];

void StartSpellAnimExcalibur(struct Anim * anim);
void efxExcalibur_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxExcaliburBG(struct Anim * anim);
void efxExcaliburBG_OnEnd(void);
void efxExcaliburBG_Loop_A(struct ProcEfxBG * proc);
void efxExcaliburBG_Loop_B(struct ProcEfxBG * proc);
void efxExcaliburBG_Loop_C(struct ProcEfxBG * proc);
void StartSubSpell_efxExcaliburBGCOL(struct Anim * anim);
void efxExcaliburBGCOL_OnEnd(void);
void efxExcaliburBGCOL_Loop(struct ProcEfxBGCOL * proc);
void StartSubSpell_efxExcaliburSCR(int unk);
void efxExcaliburSCR_Loop(struct ProcEfx * proc);
void StartSubSpell_efxExcaliburSCR2(struct ProcEfx * proc, int b);
void efxExcaliburSCR2_Loop(struct ProcEfxSCR * proc);
void StartSubSpell_efxExcaliburBG2(struct Anim * anim);
void efxExcaliburBG2_OnEnd(void);
void efxExcaliburBG2_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxExcaliburBGCOL2(struct Anim * anim);
void efxExcaliburBGCOL2_Loop(struct ProcEfxBGCOL * proc);
void StartSubSpell_efxExcaliburBG3(struct Anim * anim);
void efxExcaliburBG3_OnEnd(void);
void efxExcaliburBG3_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxExcaliburBGCOL3(struct Anim * anim);
void efxExcaliburBGCOL3_Loop(struct ProcEfxBGCOL * proc);
void StartSubSpell_efxExcaliburOBJ(struct Anim * anim);
void efxExcaliburOBJ_Loop(struct ProcEfxOBJ * proc);

extern const u16 StartSubSpell_efxExcaliburBGCOL_frames[];
extern const u16 StartSubSpell_efxExcaliburBGCOL2_frames[];
extern const u16 StartSubSpell_efxExcaliburBGCOL3_frames[];

// 9.99 efxmagic-excalibur:StartSpellAnimExcalibur
void StartSpellAnimExcalibur(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxExcalibur, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

// 9.99 efxmagic-excalibur:efxExcalibur_Loop_Main
void efxExcalibur_Loop_Main(struct ProcEfx * proc)
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
        StartSubSpell_efxExcaliburSCR(15);
        NewEfxRestWINH_(anim, 15, 1);
    }
    else if (proc->timer == duration + 2)
    {
        StartSubSpell_efxExcaliburBG(anim);
        StartSubSpell_efxExcaliburBGCOL(anim);
        PlaySFX(0x2BF, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 46)
    {
        PlaySFX(0x2c0, 0x100, proc->anim->xPosition, 1);
    }

    if (!proc->hitted)
    {
        if (proc->timer == duration + 51)
        {
            StartSubSpell_efxExcaliburOBJ(anim);
            StartSubSpell_efxExcaliburBG2(anim);
            StartSubSpell_efxExcaliburBGCOL2(anim);
        }
        if (proc->timer == duration + 84)
        {
            NewEfxFlashBgWhite(anim, 5);
            anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);
            StartBattleAnimHitEffectsDefault(anim, proc->hitted);
            EfxPlayHittedSFX(anim);
        }
        if (proc->timer == duration + 90)
        {
            StartSubSpell_efxExcaliburBG3(anim);
            StartSubSpell_efxExcaliburBGCOL3(anim);
        }
        if (proc->timer == duration + 105)
        {
            SpellFx_Finish();
            RegisterEfxSpellCastEnd();
            Proc_Break(proc);
        }
    }
    else
    {
        if (proc->timer == duration + 50)
        {
            anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);
            StartBattleAnimHitEffectsDefault(anim, proc->hitted);
        }
        if (proc->timer == duration + 51)
        {
            SpellFx_Finish();
            RegisterEfxSpellCastEnd();
            Proc_Break(proc);
        }
    }
}

// 9.99 efxmagic-excalibur:StartSubSpell_efxExcaliburBG
void StartSubSpell_efxExcaliburBG(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxExcaliburBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 40;

    SpellFx_RegisterBgGfx(Img_ExcaliburBg1, 32 * 8 * CHR_SIZE);
    SpellFx_ClearBG1();

    LZ77UnCompWram(Tsa_ExcaliburBg1, gEkrTsaBuffer);

    SpellFx_SetSomeColorEffect();

    SetWinEnable(0, 0, 0);

    return;
}

// 9.99 efxmagic-excalibur:efxExcaliburBG_OnEnd
void efxExcaliburBG_OnEnd(void)
{
    SpellFx_ClearBG1();
    gEfxBgSemaphore--;
    SpellFx_ClearColorEffects();
    return;
}

// 9.99 efxmagic-excalibur:efxExcaliburBG_Loop_A
void efxExcaliburBG_Loop_A(struct ProcEfxBG * proc)
{
    if (GetAnimPosition(proc->anim) == 0)
    {
        EfxTmCpyBgHFlip(gEkrTsaBuffer, gBg1Tm, 32, 32, 1, 0x100);
    }
    else
    {
        EfxTmCpyBG(gEkrTsaBuffer, gBg1Tm, 32, 32, 1, 0x100);
    }

    EnableBgSync(BG1_SYNC_BIT);

    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        proc->timer = 0;
        proc->terminator = 6;
        proc->unk32 = 0;

        if (GetAnimPosition(proc->anim) == 0)
        {
            proc->unk34 = +128;
        }
        else
        {
            proc->unk34 = -128;
        }

        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-excalibur:efxExcaliburBG_Loop_B
void efxExcaliburBG_Loop_B(struct ProcEfxBG * proc)
{
    gDispIo.bg_off[BG_1].x =
        Interpolate(INTERPOLATE_LINEAR, proc->unk32, proc->unk34, proc->timer, proc->terminator);

    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        proc->timer = 0;
        proc->terminator = 12;
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-excalibur:efxExcaliburBG_Loop_C
void efxExcaliburBG_Loop_C(struct ProcEfxBG * proc)
{
    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-excalibur:StartSubSpell_efxExcaliburBGCOL
void StartSubSpell_efxExcaliburBGCOL(struct Anim * anim)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxExcaliburBGCOL, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->timer2 = 0;

    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxExcaliburBGCOL_frames;

    proc->pal = Pal_ExcaliburBg1;
    SpellFx_RegisterBgPal(Pal_ExcaliburBg1, PLTT_SIZE_4BPP);

    return;
}

// 9.99 efxmagic-excalibur:efxExcaliburBGCOL_OnEnd
void efxExcaliburBGCOL_OnEnd(void)
{
    gEfxBgSemaphore--;
    return;
}

// 9.99 efxmagic-excalibur:efxExcaliburBGCOL_Loop
void efxExcaliburBGCOL_Loop(struct ProcEfxBGCOL * proc)
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
            Proc_Break(proc);
        }
    }

    return;
}

// 9.99 efxmagic-excalibur:StartSubSpell_efxExcaliburSCR
void StartSubSpell_efxExcaliburSCR(int unk)
{
    struct ProcEfx * proc = Proc_Start(ProcScr_efxExcaliburSCR, PROC_TREE_3);
    proc->timer = 0;
    proc->step = 0;
    proc->unk44 = 0;

    StartSubSpell_efxExcaliburSCR2(proc, unk);

    return;
}

// 9.99 efxmagic-excalibur:efxExcaliburSCR_Loop
void efxExcaliburSCR_Loop(struct ProcEfx * proc)
{
    u32 i;

    u16 * bg2Scroll = (gEkrBg1ScrollFlip == 0) ? gpBg2ScrollOffsetTable1 : gpBg2ScrollOffsetTable2;
    u16 * bg1Scroll = (gEkrBg1ScrollFlip == 0) ? gpBg1ScrollOffsetList1 : gpBg1ScrollOffsetList2;

    for (i = 0; i < DISPLAY_HEIGHT; i++)
    {
        if (i < 128)
        {
            s16 val = gExcaliburBgScrollOffsets[i] * proc->unk44 >> 12;

            if (val != 0)
            {
                if (i < 64)
                {
                    if (val < i - 128)
                    {
                        val = -128 + i;
                    }
                }
                else
                {
                    if (val > 128 - i)
                    {
                        val = 128 - i;
                    }
                }
            }

            *bg2Scroll++ = val;
            *bg1Scroll++ = val;
        }
        else
        {
            *bg2Scroll++ = 0;
            *bg1Scroll++ = 0;
        }
    }

    return;
}

// 9.99 efxmagic-excalibur:StartSubSpell_efxExcaliburSCR2
void StartSubSpell_efxExcaliburSCR2(struct ProcEfx * proc, int b)
{
    struct ProcEfxSCR * childProc = Proc_Start(ProcScr_efxExcaliburSCR2, PROC_TREE_3);
    childProc->timer = 0;
    childProc->unk2E = b;
    childProc->unk5C = proc;

    return;
}

// 9.99 efxmagic-excalibur:efxExcaliburSCR2_Loop
void efxExcaliburSCR2_Loop(struct ProcEfxSCR * proc)
{
    struct ProcEfx * otherProc = proc->unk5C;

    otherProc->unk44 = Interpolate(INTERPOLATE_RSQUARE, 0x4000, 0, proc->timer, proc->unk2E);

    proc->timer++;

    if (proc->timer > proc->unk2E)
    {
        Proc_End(otherProc);
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-excalibur:StartSubSpell_efxExcaliburBG2
void StartSubSpell_efxExcaliburBG2(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxExcaliburBG2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 12;

    SpellFx_RegisterBgGfx(Img_ExcaliburBg2, 32 * 8 * CHR_SIZE);
    SpellFx_ClearBG1();

    if (gEkrDistanceType == 0)
    {
        LZ77UnCompWram(Tsa_ExcaliburBg2_Left, gEkrTsaBuffer);
    }
    else
    {
        LZ77UnCompWram(Tsa_ExcaliburBg2_Right, gEkrTsaBuffer);
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

// 9.99 efxmagic-excalibur:efxExcaliburBG2_OnEnd
void efxExcaliburBG2_OnEnd(void)
{
    SpellFx_ClearBG1();
    gEfxBgSemaphore--;
    SpellFx_ClearColorEffects();
    return;
}

// 9.99 efxmagic-excalibur:efxExcaliburBG2_Loop
void efxExcaliburBG2_Loop(struct ProcEfxBG * proc)
{
    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-excalibur:StartSubSpell_efxExcaliburBGCOL2
void StartSubSpell_efxExcaliburBGCOL2(struct Anim * anim)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxExcaliburBGCOL2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->timer2 = 0;

    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxExcaliburBGCOL2_frames;

    proc->pal = Pal_ExcaliburBg2;
    SpellFx_RegisterBgPal(Pal_ExcaliburBg2, PLTT_SIZE_4BPP);

    return;
}

// 9.99 efxmagic-excalibur:efxExcaliburBGCOL2_Loop
void efxExcaliburBGCOL2_Loop(struct ProcEfxBGCOL * proc)
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

// 9.99 efxmagic-excalibur:StartSubSpell_efxExcaliburBG3
void StartSubSpell_efxExcaliburBG3(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxExcaliburBG3, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 12;

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

// 9.99 efxmagic-excalibur:efxExcaliburBG3_OnEnd
void efxExcaliburBG3_OnEnd(void)
{
    SpellFx_ClearBG1();
    gEfxBgSemaphore--;
    SpellFx_ClearColorEffects();
    return;
}

// 9.99 efxmagic-excalibur:efxExcaliburBG3_Loop
void efxExcaliburBG3_Loop(struct ProcEfxBG * proc)
{
    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-excalibur:StartSubSpell_efxExcaliburBGCOL3
void StartSubSpell_efxExcaliburBGCOL3(struct Anim * anim)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxExcaliburBGCOL3, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->timer2 = 0;

    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxExcaliburBGCOL3_frames;

    proc->pal = Pal_ExcaliburBg3;
    SpellFx_RegisterBgPal(Pal_ExcaliburBg3, PLTT_SIZE_4BPP);

    return;
}

// 9.99 efxmagic-excalibur:efxExcaliburBGCOL3_Loop
void efxExcaliburBGCOL3_Loop(struct ProcEfxBGCOL * proc)
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

// 9.99 efxmagic-excalibur:StartSubSpell_efxExcaliburOBJ
void StartSubSpell_efxExcaliburOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    const AnimScr * scr;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxExcaliburOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 40;

    scr = AnimScr_EfxExcalibur;
    frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);

    proc->anim2 = frontAnim;
    frontAnim->xPosition = proc->anim->xPosition;
    frontAnim->yPosition = proc->anim->yPosition;

    SpellFx_RegisterObjPal(Pal_ExcaliburSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_ExcaliburSprites, 32 * 4 * CHR_SIZE);

    return;
}

// 9.99 efxmagic-excalibur:efxExcaliburOBJ_Loop
void efxExcaliburOBJ_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}

SECTION(".rodata.08BA39AC")
const struct ProcCmd ProcScr_efxExcalibur[] = {
    PROC_19,
    PROC_REPEAT(efxExcalibur_Loop_Main),
    PROC_END,
};

SECTION(".rodata.08BA39C4")
const struct ProcCmd ProcScr_efxExcaliburBG[] = {
    PROC_19,
    PROC_SET_END_CB(efxExcaliburBG_OnEnd),
    PROC_REPEAT(efxExcaliburBG_Loop_A),
    PROC_REPEAT(efxExcaliburBG_Loop_B),
    PROC_REPEAT(efxExcaliburBG_Loop_C),
    PROC_END,
};

SECTION(".rodata.08BA39F4")
const struct ProcCmd ProcScr_efxExcaliburBGCOL[] = {
    PROC_19,
    PROC_MARK(10),
    PROC_SET_END_CB(efxExcaliburBGCOL_OnEnd),
    PROC_REPEAT(efxExcaliburBGCOL_Loop),
    PROC_END,
};

SECTION(".rodata.08BA3A1C")
const struct ProcCmd ProcScr_efxExcaliburSCR[] = {
    PROC_19,
    PROC_REPEAT(efxExcaliburSCR_Loop),
    PROC_END,
};

SECTION(".rodata.08BA3A34")
const struct ProcCmd ProcScr_efxExcaliburSCR2[] = {
    PROC_19,
    PROC_REPEAT(efxExcaliburSCR2_Loop),
    PROC_END,
};

SECTION(".rodata.08BA3B4C")
const struct ProcCmd ProcScr_efxExcaliburBG2[] = {
    PROC_19,
    PROC_SET_END_CB(efxExcaliburBG2_OnEnd),
    PROC_REPEAT(efxExcaliburBG2_Loop),
    PROC_END,
};

SECTION(".rodata.08BA3B6C")
const struct ProcCmd ProcScr_efxExcaliburBGCOL2[] = {
    PROC_19,
    PROC_MARK(10),
    PROC_REPEAT(efxExcaliburBGCOL2_Loop),
    PROC_END,
};

SECTION(".rodata.08BA3B8C")
const struct ProcCmd ProcScr_efxExcaliburBG3[] = {
    PROC_19,
    PROC_SET_END_CB(efxExcaliburBG3_OnEnd),
    PROC_REPEAT(efxExcaliburBG3_Loop),
    PROC_END,
};

SECTION(".rodata.08BA3BAC")
const struct ProcCmd ProcScr_efxExcaliburBGCOL3[] = {
    PROC_19,
    PROC_MARK(10),
    PROC_REPEAT(efxExcaliburBGCOL3_Loop),
    PROC_END,
};

SECTION(".rodata.08BA3BCC")
const struct ProcCmd ProcScr_efxExcaliburOBJ[] = {
    PROC_19,
    PROC_REPEAT(efxExcaliburOBJ_Loop),
    PROC_END,
};

SECTION(".rodata.08BD3758")
const AnimScr AnimScr_EfxExcalibur[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxExcalibur_08BD3470, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxExcalibur_08BD2C3C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxExcalibur_08BD2C90, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxExcalibur_08BD2CE4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxExcalibur_08BD2D38, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxExcalibur_08BD2D8C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxExcalibur_08BD2DE0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxExcalibur_08BD2E34, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxExcalibur_08BD2E88, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxExcalibur_08BD2EDC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxExcalibur_08BD2F30, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxExcalibur_08BD2F84, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxExcalibur_08BD2FD8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxExcalibur_08BD302C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxExcalibur_08BD3080, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxExcalibur_08BD30D4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxExcalibur_08BD3128, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxExcalibur_08BD317C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxExcalibur_08BD31D0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxExcalibur_08BD3224, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxExcalibur_08BD3278, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxExcalibur_08BD32CC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxExcalibur_08BD3320, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxExcalibur_08BD3374, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxExcalibur_08BD33C8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxExcalibur_08BD341C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxExcalibur_08BD34B8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxExcalibur_08BD350C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxExcalibur_08BD3560, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxExcalibur_08BD35B4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxExcalibur_08BD3608, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxExcalibur_08BD365C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxExcalibur_08BD36B0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxExcalibur_08BD3704, 1),
    ANIMSCR_END,
};
