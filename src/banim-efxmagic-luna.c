#include "gbafe.h"

/* auto-decls */
void NewEfxSpellCast(void);
void NewEfxFarAttackWithDistance(struct Anim * anim, s16 arg);
ProcPtr NewefxRestRST(struct Anim *anim, int unk44, int unk48, int frame, int speed);
void NewEfxRestWINH(struct Anim *anim, int a, s16 b, u32 c);
void EfxPlayHittedSFX(struct Anim * anim);
void RegisterEfxSpellCastEnd(void);
extern const struct ProcCmd ProcScr_efxLuna[];
extern int gEfxBgSemaphore;
extern const struct ProcCmd ProcScr_efxLunaBG[];
extern u16 * TsaArray_LunaBg1[];
extern u16 Pal_LunaBg1[];
extern u16 Img_LunaBg1[];
extern const struct ProcCmd ProcScr_efxLunaSCR[];
extern s16 gLunaBgScrollOffsets[];
extern const struct ProcCmd ProcScr_efxLunaSCR2[];
extern const struct ProcCmd ProcScr_efxLunaBG2[];
extern u16 Img_LunaBg2[];
extern u16 Pal_LunaBg2[];
extern u16 Tsa_LunaBg2[];
extern const struct ProcCmd ProcScr_efxLunaBGCOL[];
extern const struct ProcCmd ProcScr_efxLunaBG3[];
extern u16 * TsaArray_LunaBg3[];
extern u16 * ImgArray_LunaBg3[];
extern u16 Pal_LunaBg3[];
extern const struct ProcCmd ProcScr_efxLunaOBJ[];
extern u16 Pal_LunaSprites[];
extern u16 Img_LunaSprites[];
extern u32 AnimScr_EfxLuna1[];
extern u32 AnimScr_EfxLuna4[];
extern u32 AnimScr_EfxLuna2[];
extern const struct ProcCmd ProcScr_efxLunaRST[];

void StartSpellAnimLuna(struct Anim * anim);
void efxLuna_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxLunaBG(struct Anim * anim);
void efxLunaBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxLunaSCR(void);
void efxLunaSCR_Loop(struct ProcEfx * proc);
void StartSubSpell_efxLunaSCR2(ProcPtr proc);
void efxLunaSCR2_Loop(struct ProcEfxSCR * proc);
void StartSubSpell_efxLunaBG2(struct Anim * anim, int terminator);
void efxLunaBG2_OnEnd(void);
void efxLunaBG2_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxLunaBGCOL(struct Anim * anim, int terminator);
void efxLunaBGCOL_OnEnd(void);
void efxLunaBGCOL_Loop(struct ProcEfxBGCOL * proc);
void StartSubSpell_efxLunaBG3(struct Anim * anim);
void efxLunaBG3_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxLunaOBJ(struct Anim * anim);
void efxLunaOBJ_Loop_A(struct ProcEfxOBJ * proc);
void efxLunaOBJ_Loop_B(struct ProcEfxOBJ * proc);
void efxLunaOBJ_Loop_C(struct ProcEfxOBJ * proc);
void efxLunaOBJ_Loop_D(struct ProcEfxOBJ * proc);
void StartSubSpell_efxLunaRST(struct Anim * anim, ProcPtr efxproc, int duration);
void efxLunaRST_Loop(struct ProcEfxRST * proc);

extern const u16 StartSubSpell_efxLunaBG_frames[];
extern const u16 StartSubSpell_efxLunaBGCOL_frames[];
extern const u16 StartSubSpell_efxLunaBG3_frames[];

// 9.99 efxmagic-luna:StartSpellAnimLuna
void StartSpellAnimLuna(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxLuna, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

// 9.99 efxmagic-luna:efxLuna_Loop_Main
void efxLuna_Loop_Main(struct ProcEfx * proc)
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
        StartSubSpell_efxLunaBG(anim);

        SetWinEnable(0, 0, 0);

        SetBlendAlpha(0, 16);

        NewEfxALPHA(anim, 0, 10, 0, 0x10, 0);
        StartSubSpell_efxLunaRST(anim, NewefxRestRST(anim, 20, 15, 0x100, 2), 20);
        NewEfxRestWINH(anim, 20, gDispIo.bg_off[BG_1].x, 0);

        PlaySFX(0x2BD, 0x100, 120, 1);
    }
    else if (proc->timer == duration + 41)
    {
        StartSubSpell_efxLunaSCR();
        NewEfxRestWINH_(anim, 21, 1);
        StartSubSpell_efxLunaOBJ(anim);
        NewEfxALPHA(anim, 0, 25, 16, 0, 0);
    }
    else if (proc->timer == duration + 55)
    {
        PlaySFX(0x2BE, 0x100, anim->xPosition, 0);
    }
    else if (proc->timer == duration + 70)
    {
        StartSubSpell_efxLunaBG2(anim, 65);
        StartSubSpell_efxLunaBGCOL(anim, 65);

        SetBlendAlpha(0, 16);
        NewEfxALPHA(anim, 0, 10, 0, 16, 0);
        NewefxRestRST(anim, 65, 2, 128, 1);
        NewEfxRestWINH_(anim, 68, 0);
    }
    else if (proc->timer == duration + 135)
    {
        NewEfxFlashBgWhite(anim, 5);

        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);
        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (proc->timer == duration + 140)
    {
        SetBgOffset(BG_1, 0, 0);
        StartSubSpell_efxLunaBG3(proc->anim);
    }
    else if (proc->timer == duration + 190)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-luna:StartSubSpell_efxLunaBG
void StartSubSpell_efxLunaBG(struct Anim * anim)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxLunaBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxLunaBG_frames;

    proc->tsal = TsaArray_LunaBg1;
    proc->tsar = TsaArray_LunaBg1;

    SpellFx_RegisterBgPal(Pal_LunaBg1, PLTT_SIZE_4BPP);
    SpellFx_RegisterBgGfx(Img_LunaBg1, 32 * 8 * CHR_SIZE);

    SpellFx_SetSomeColorEffect();

    return;
}

// 9.99 efxmagic-luna:efxLunaBG_Loop
void efxLunaBG_Loop(struct ProcEfxBG * proc)
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

// 9.99 efxmagic-luna:StartSubSpell_efxLunaSCR
void StartSubSpell_efxLunaSCR(void)
{
    struct ProcEfx * proc = Proc_Start(ProcScr_efxLunaSCR, PROC_TREE_3);

    proc->timer = 0;
    proc->step = 0;
    proc->unk44 = 0;

    StartSubSpell_efxLunaSCR2(proc);

    return;
}

// 9.99 efxmagic-luna:efxLunaSCR_Loop
void efxLunaSCR_Loop(struct ProcEfx * proc)
{
    u32 i;

    u16 * bg2Scroll = (gEkrBg1ScrollFlip == 0) ? gpBg2ScrollOffsetTable1 : gpBg2ScrollOffsetTable2;
    u16 * bg1Scroll = (gEkrBg1ScrollFlip == 0) ? gpBg1ScrollOffsetList1 : gpBg1ScrollOffsetList2;

    for (i = 0; i < DISPLAY_HEIGHT; i++)
    {
        if (i < 16)
        {
            *bg2Scroll++ = 0;
            *bg1Scroll++ = 0;
        }
        else if (i < 112)
        {
            s16 val = gLunaBgScrollOffsets[i - 16] * proc->unk44 >> 12;

            if (val != 0)
            {
                if (i < 64)
                {
                    if (val < -112 + i)
                    {
                        val = -112 + i;
                    }
                }
                else
                {
                    if (val > 112 - i)
                    {
                        val = 112 - i;
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

// 9.99 efxmagic-luna:StartSubSpell_efxLunaSCR2
void StartSubSpell_efxLunaSCR2(ProcPtr proc)
{
    struct ProcEfxSCR * otherProc = Proc_Start(ProcScr_efxLunaSCR2, PROC_TREE_3);

    otherProc->timer = 0;
    otherProc->unk2E = 20;
    otherProc->unk5C = proc;

    return;
}

// 9.99 efxmagic-luna:efxLunaSCR2_Loop
void efxLunaSCR2_Loop(struct ProcEfxSCR * proc)
{
    struct ProcEfx * otherProc = proc->unk5C;
    otherProc->unk44 = Interpolate(INTERPOLATE_LINEAR, 0, 0x4000, proc->timer, proc->unk2E);

    proc->timer++;

    if (proc->timer > proc->unk2E)
    {
        Proc_End(otherProc);
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-luna:StartSubSpell_efxLunaBG2
void StartSubSpell_efxLunaBG2(struct Anim * anim, int terminator)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxLunaBG2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;

    SpellFx_RegisterBgGfx(Img_LunaBg2, 32 * 8 * CHR_SIZE);
    SpellFx_RegisterBgPal(Pal_LunaBg2, PLTT_SIZE_4BPP);

    SpellFx_ClearBG1();

    LZ77UnCompWram(Tsa_LunaBg2, gEkrTsaBuffer);

    if (GetAnimPosition(proc->anim) == 0)
    {
        EfxTmCpyBgHFlip(gEkrTsaBuffer, gBg1Tm, 30, 32, 1, 0x100);
    }
    else
    {
        EfxTmCpyBG(gEkrTsaBuffer, gBg1Tm, 30, 32, 1, 0x100);
    }

    EnableBgSync(BG1_SYNC_BIT);
    SpellFx_SetSomeColorEffect();

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

    SetWinEnable(0, 0, 0);

    return;
}

// 9.99 efxmagic-luna:efxLunaBG2_OnEnd
void efxLunaBG2_OnEnd(void)
{
    SpellFx_ClearBG1();
    gEfxBgSemaphore--;
    SpellFx_ClearColorEffects();

    return;
}

// 9.99 efxmagic-luna:efxLunaBG2_Loop
void efxLunaBG2_Loop(struct ProcEfxBG * proc)
{
    gDispIo.bg_off[BG_1].y++;

    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-luna:StartSubSpell_efxLunaBGCOL
void StartSubSpell_efxLunaBGCOL(struct Anim * anim, int terminator)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxLunaBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->timer2 = 0;
    proc->terminator = terminator;

    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxLunaBGCOL_frames;

    proc->pal = Pal_LunaBg2;
    SpellFx_RegisterBgPal(Pal_LunaBg2, PLTT_SIZE_4BPP);

    return;
}

// 9.99 efxmagic-luna:efxLunaBGCOL_OnEnd
void efxLunaBGCOL_OnEnd(void)
{
    gEfxBgSemaphore--;
    return;
}

// 9.99 efxmagic-luna:efxLunaBGCOL_Loop
void efxLunaBGCOL_Loop(struct ProcEfxBGCOL * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 * pal = proc->pal;
        SpellFx_RegisterBgPal(pal + ret * 0x10, PLTT_SIZE_4BPP);
    }

    proc->timer2++;

    if (proc->timer2 > proc->terminator)
    {
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-luna:StartSubSpell_efxLunaBG3
void StartSubSpell_efxLunaBG3(struct Anim * anim)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxLunaBG3, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxLunaBG3_frames;

    proc->tsal = TsaArray_LunaBg3;
    proc->tsar = TsaArray_LunaBg3;

    proc->img = ImgArray_LunaBg3;

    SpellFx_RegisterBgPal(Pal_LunaBg3, PLTT_SIZE_4BPP);

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

// 9.99 efxmagic-luna:efxLunaBG3_Loop
void efxLunaBG3_Loop(struct ProcEfxBG * proc)
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

// 9.99 efxmagic-luna:StartSubSpell_efxLunaOBJ
void StartSubSpell_efxLunaOBJ(struct Anim * anim)
{
    u32 i;

    for (i = 0; i < 8; i++)
    {
        struct ProcEfxOBJ * proc = Proc_Start(ProcScr_efxLunaOBJ, PROC_TREE_3);
        proc->anim = anim;
        proc->unk44 = i;
    }

    SpellFx_RegisterObjPal(Pal_LunaSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_LunaSprites, 32 * 4 * CHR_SIZE);

    return;
}

// 9.99 efxmagic-luna:efxLunaOBJ_Loop_A
void efxLunaOBJ_Loop_A(struct ProcEfxOBJ * proc)
{
    struct Anim * anim;
    u32 * scr;

    gEfxBgSemaphore++;

    proc->timer = 0;
    proc->terminator = 0;

    proc->unk30 = proc->unk44 * 0x2AAA;

    scr = AnimScr_EfxLuna1;
    anim = EfxCreateFrontAnim(proc->anim, scr, scr, scr, scr);
    proc->anim2 = anim;

    anim->timer = 0;

    anim->oam2Base &= ~OAM2_LAYER(3);
    anim->oam2Base |= OAM2_LAYER(2);

    anim->xPosition = 256;
    anim->yPosition = 256;

    proc->unk32 = proc->anim->xPosition;
    proc->unk3A = proc->anim->yPosition;

    Proc_Break(proc);

    return;
}

// 9.99 efxmagic-luna:efxLunaOBJ_Loop_B
void efxLunaOBJ_Loop_B(struct ProcEfxOBJ * proc)
{
    int x;
    int y;
    s16 a;
    s16 b;
    s16 sin;
    s16 cos;
    s16 hm;

    struct Anim * anim = proc->anim2;

    s16 ret = Interpolate(INTERPOLATE_RSQUARE, 0, 50, proc->timer, 20);

    proc->unk30 = proc->unk30 + 0x200;

    hm = proc->unk30 / 0x100;

    sin = gSinLut[proc->unk30 / 0x100];
    cos = gSinLut[0x40 + proc->unk30 / 0x100];

    a = (sin * ret) >> 12;
    b = (cos * ret) >> 12;

    x = a + proc->unk32;
    y = b + proc->unk3A;

    anim->xPosition = x;
    anim->yPosition = y;

    if (++proc->timer > 20)
    {
        proc->timer = 20;
    }

    if (++proc->terminator > 20)
    {
        proc->timer = 0;
        proc->terminator = 0;

        anim->pScrStart = AnimScr_EfxLuna4;
        anim->pScrCurrent = AnimScr_EfxLuna4;
        anim->timer = 0;

        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-luna:efxLunaOBJ_Loop_C
void efxLunaOBJ_Loop_C(struct ProcEfxOBJ * proc)
{
    int x;
    int y;
    s16 a;
    s16 b;
    s16 sin;
    s16 cos;
    s16 hm;

    struct Anim * anim = proc->anim2;

    s16 ret = 50;

    proc->unk30 = proc->unk30 + 0x200;

    hm = proc->unk30 / 0x100;

    sin = gSinLut[proc->unk30 / 0x100];
    cos = gSinLut[0x40 + proc->unk30 / 0x100];

    a = (sin * ret) >> 12;
    b = (cos * ret) >> 12;

    x = a + proc->unk32;
    y = b + proc->unk3A;

    anim->xPosition = x;
    anim->yPosition = y;

    if (++proc->timer > 60)
    {
        proc->timer = 60;
    }

    if (++proc->terminator > 60)
    {
        proc->timer = 0;
        proc->terminator = 0;

        anim->pScrStart = AnimScr_EfxLuna2;
        anim->pScrCurrent = AnimScr_EfxLuna2;
        anim->timer = 0;

        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-luna:efxLunaOBJ_Loop_D
void efxLunaOBJ_Loop_D(struct ProcEfxOBJ * proc)
{
    int x;
    int y;
    s16 a;
    s16 b;
    s16 sin;
    s16 cos;
    s16 hm;

    struct Anim * anim = proc->anim2;

    s16 ret = Interpolate(INTERPOLATE_SQUARE, 50, 0, proc->timer, 10);

    proc->unk30 = proc->unk30 + 0x400;

    hm = proc->unk30 / 0x100;

    sin = gSinLut[proc->unk30 / 0x100];
    cos = gSinLut[0x40 + proc->unk30 / 0x100];

    a = (sin * ret) >> 12;
    b = (cos * ret) >> 12;

    x = a + proc->unk32;
    y = b + proc->unk3A;

    anim->xPosition = x;
    anim->yPosition = y;

    if (++proc->timer > 10)
    {
        proc->timer = 10;
    }

    if (++proc->terminator > 10)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-luna:StartSubSpell_efxLunaRST
void StartSubSpell_efxLunaRST(struct Anim * anim, ProcPtr efxproc, int duration)
{
    struct ProcEfxRST * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxLunaRST, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->duration = duration;
    proc->efxproc = efxproc;
}

// 9.99 efxmagic-luna:efxLunaRST_Loop
void efxLunaRST_Loop(struct ProcEfxRST * proc)
{
    struct ProcEfx * otherProc = proc->efxproc;
    otherProc->frame = Interpolate(INTERPOLATE_RSQUARE, 0x80, 0, proc->timer, proc->duration);

    proc->timer++;

    if (proc->timer > proc->duration)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}

SECTION(".rodata.08BA3780")
const struct ProcCmd ProcScr_efxLuna[] = {
    PROC_19,
    PROC_REPEAT(efxLuna_Loop_Main),
    PROC_END,
};

SECTION(".rodata.08BA3798")
const struct ProcCmd ProcScr_efxLunaBG[] = {
    PROC_19,
    PROC_REPEAT(efxLunaBG_Loop),
    PROC_END,
};

SECTION(".rodata.08BA37B4")
const struct ProcCmd ProcScr_efxLunaSCR[] = {
    PROC_19,
    PROC_REPEAT(efxLunaSCR_Loop),
    PROC_END,
};

SECTION(".rodata.08BA37CC")
const struct ProcCmd ProcScr_efxLunaSCR2[] = {
    PROC_19,
    PROC_REPEAT(efxLunaSCR2_Loop),
    PROC_END,
};

SECTION(".rodata.08BA38A4")
const struct ProcCmd ProcScr_efxLunaBG2[] = {
    PROC_19,
    PROC_SET_END_CB(efxLunaBG2_OnEnd),
    PROC_REPEAT(efxLunaBG2_Loop),
    PROC_END,
};

SECTION(".rodata.08BA38C4")
const struct ProcCmd ProcScr_efxLunaBGCOL[] = {
    PROC_19,
    PROC_MARK(10),
    PROC_SET_END_CB(efxLunaBGCOL_OnEnd),
    PROC_REPEAT(efxLunaBGCOL_Loop),
    PROC_END,
};

SECTION(".rodata.08BA38EC")
const struct ProcCmd ProcScr_efxLunaBG3[] = {
    PROC_19,
    PROC_REPEAT(efxLunaBG3_Loop),
    PROC_END,
};

SECTION(".rodata.08BA3964")
const struct ProcCmd ProcScr_efxLunaOBJ[] = {
    PROC_19,
    PROC_REPEAT(efxLunaOBJ_Loop_A),
    PROC_REPEAT(efxLunaOBJ_Loop_B),
    PROC_REPEAT(efxLunaOBJ_Loop_C),
    PROC_REPEAT(efxLunaOBJ_Loop_D),
    PROC_END,
};

SECTION(".rodata.08BA3994")
const struct ProcCmd ProcScr_efxLunaRST[] = {
    PROC_19,
    PROC_REPEAT(efxLunaRST_Loop),
    PROC_END,
};
