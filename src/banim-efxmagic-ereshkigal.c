#include "gbafe.h"

struct ProcEfxEclipseBG
{
    PROC_HEADER;

    /* 29 */ u8 unk29;
    STRUCT_PAD(0x2A, 0x2C);
    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;
    /* 30 */ s16 unk30;
    STRUCT_PAD(0x32, 0x44);
    /* 44 */ u32 frame;
    /* 48 */ const u16 * frame_config;
    /* 4C */ u16 ** tsal;
    /* 50 */ u16 ** tsar;
    /* 54 */ u16 ** img;
    /* 58 */ u16 * pal;
    /* 5C */ struct Anim * anim;
};

/* auto-decls */
void NewEfxTwobaiRST(struct Anim *anim, int unk44);
extern const struct ProcCmd ProcScr_efxSuperdruidBG3[];
extern u16 * TsaArray_EreshkigalBg3[];
extern u16 * ImgArray_EreshkigalBg3[];
extern u16 Pal_EreshkigalBg3[];
extern const struct ProcCmd ProcScr_efxSuperdruidOBJ2[];
extern u32 AnimScr_08BD7078[];
extern u16 Img_082D9C94[];
extern u16 Pal_082DA240[];
#define TILEMAP_INDEX(aX, aY) (0x20 * (aY) + (aX))
#define TILEMAP_LOCATED(aMap, aX, aY) (TILEMAP_INDEX((aX), (aY)) + (aMap))
void StartEfxSpellCastBg(void);
void NewEfxFarAttackWithDistance(struct Anim * anim, s16 arg);
void EfxPlayHittedSFX(struct Anim * anim);
void sub_0804FD54(void);
void sub_0804FD6C(void);
extern int gEfxBgSemaphore;
extern const struct ProcCmd ProcScr_efxEreshkigal[];
extern const struct ProcCmd ProcScr_efxEreshkigalOBJ[];
extern const struct ProcCmd ProcScr_efxEreshkigalOBJChild[];
extern const struct ProcCmd ProcScr_efxEreshkigalOBJ2[];
extern const struct ProcCmd ProcScr_efxEreshkigalOBJ3[];
extern const struct ProcCmd ProcScr_efxEreshkigalBG[];
extern const struct ProcCmd ProcScr_efxEreshkigalWhiteOut[];
extern const int gEreshkigalOBJConfig[];
extern AnimScr * AnimScrArray_EreshkigalOBJChild[];
extern AnimScr AnimScr_EreshkigalOBJ2_A[];
extern AnimScr AnimScr_EreshkigalOBJ2_B[];
extern AnimScr AnimScr_EreshkigalOBJ3[];
extern u16 Img_EreshkigalOBJ[];
extern u16 Pal_EreshkigalOBJ[];
extern const s16 FrameConfig_EreshkigalBG[];
extern u16 * TsaArray_EreshkigalBG[];
extern u16 * ImgArray_EreshkigalBG[];
extern u16 Pal_EreshkigalBG[];

void StartSubSpell_efxEreshkigalOBJ(struct Anim * anim);
void StartSubSpell_efxEreshkigalOBJChild(struct Anim * anim, int x, int y, int type, int oam2);
void StartSubSpell_efxEreshkigalOBJ2(struct Anim * anim);
void StartSubSpell_efxEreshkigalBG(struct Anim * anim);
void StartSubSpell_efxEreshkigalWhiteOut(struct Anim * anim, int terminator, int duration);
void StartSubSpell_efxGespenstBG4(struct Anim * anim, int terminator);
void StartSubSpell_efxGespenstBGCOL2(struct Anim * anim);

void efxEreshkigalBG_Loop(struct ProcEfxEclipseBG * proc);
void StartSubSpell_efxSuperdruidBG3(struct Anim * anim);
void efxSuperdruidBG3_Loop(struct ProcEfxEclipseBG * proc);
void StartSubSpell_efxSuperdruidOBJ2(struct Anim * anim);
void efxSuperdruidOBJ2_OnEnd(void);
void StartSubSpell_efxEreshkigalOBJ3(struct Anim * anim);
void efxEreshkigalOBJ3_OnEnd(void);

extern const u16 StartSubSpell_efxSuperdruidBG3_frames[];

void StartSpellAnimEreshkigal(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    StartEfxSpellCastBg();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxEreshkigal, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));
}

void efxEreshkigal_Loop(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
        NewEfxFarAttackWithDistance(proc->anim, -1);

    if (proc->timer == duration + 20)
    {
        StartSubSpell_efxEreshkigalOBJ3(anim);
        PlaySFX(0x2FD, 0x100, 0x78, 0);
    }
    else if (proc->timer == duration + 40)
    {
        StartSubSpell_efxEreshkigalBG(anim);
        StartSubSpell_efxEreshkigalOBJ(anim);
        StartSubSpell_efxEreshkigalOBJ2(anim);
        sub_0804FD54();
    }
    else if (proc->timer == duration + 145)
    {
        StartSubSpell_efxEreshkigalWhiteOut(anim, 30, 20);
    }
    else if (proc->timer == duration + 175)
    {
        anim->state3 |= ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED;
        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (proc->hitted == 0)
            EfxPlayHittedSFX(anim);
    }
    else if (proc->timer == duration + 176)
    {
        if (proc->hitted != 0)
        {
            SpellFx_Finish();
            sub_0804FD6C();
            Proc_Break(proc);
        }
    }
    else if (proc->timer == duration + 177)
    {
        StartSpellThing_MagicQuake(proc->anim, 80, 9);
        StartSubSpell_efxGespenstBG4(anim, 30);
        StartSubSpell_efxGespenstBGCOL2(anim);
        PlaySFX(0x2FE, 0x100, 0x78, 0);
    }
    else if (proc->timer == duration + 205)
    {
        NewEfxFlashBgWhite(proc->anim, 10);
    }
    else if (proc->timer == duration + 215)
    {
        NewEfxRestWINH_(proc->anim, 70, 1);
        NewEfxTwobaiRST(proc->anim, 50);
        StartSubSpell_efxSuperdruidBG3(proc->anim);
        NewEfxALPHA(anim, 16, 10, 16, 0, 0);
    }
    else if (proc->timer == duration + 225)
    {
        StartSubSpell_efxSuperdruidOBJ2(anim);
    }
    else if (proc->timer == duration + 240)
    {
        sub_0804FD6C();
    }
    else if (proc->timer == duration + 267)
    {
        SpellFx_Finish();
        Proc_Break(proc);
    }
}

void StartSubSpell_efxEreshkigalOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxEreshkigalOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->unk44 = 7;
    proc->terminator = 0;
    proc->unk48 = 5;

    SpellFx_RegisterObjGfx(Img_EreshkigalOBJ, 0x1000);
    SpellFx_RegisterObjPal(Pal_EreshkigalOBJ, 0x20);
}

void efxEreshkigalOBJ_Loop(struct ProcEfxOBJ * proc)
{
    if (++proc->timer > proc->unk44)
    {
        int a, b, c, d;

        proc->timer = 0;

        a = gEreshkigalOBJConfig[proc->terminator * 4 + 0];
        b = gEreshkigalOBJConfig[proc->terminator * 4 + 1];
        c = gEreshkigalOBJConfig[proc->terminator * 4 + 2];
        d = gEreshkigalOBJConfig[proc->terminator * 4 + 3];
        StartSubSpell_efxEreshkigalOBJChild(proc->anim2, a, b, c, d);

        if (++proc->terminator > proc->unk48)
        {
            gEfxBgSemaphore--;
            Proc_Break(proc);
        }
    }
}

void StartSubSpell_efxEreshkigalOBJChild(struct Anim * anim, int x, int y, int type, int oam2)
{
    struct ProcEfxOBJ * proc;
    struct Anim * front;
    AnimScr * scr;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxEreshkigalOBJChild, PROC_TREE_3);
    proc->anim = anim;

    scr = AnimScrArray_EreshkigalOBJChild[type];
    front = proc->anim2 = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    front->xPosition = x;
    front->yPosition = y;
    front->oam2Base = (front->oam2Base & 0xF3FF) | oam2;
}

void efxEreshkigalOBJChild_OnEnd(struct ProcEfxOBJ * proc)
{
    AnimDelete(proc->anim2);
    gEfxBgSemaphore--;
}

void StartSubSpell_efxEreshkigalOBJ2(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * front;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxEreshkigalOBJ2, PROC_TREE_3);
    proc->anim = anim;

    front = proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_EreshkigalOBJ2_A, AnimScr_EreshkigalOBJ2_A, AnimScr_EreshkigalOBJ2_A, AnimScr_EreshkigalOBJ2_A);
    front->xPosition = 0x78;
    front->yPosition = 0x3C;
    front->oam2Base = (front->oam2Base & 0xF3FF) | 0xC00;
    front->drawLayerPriority = 20;
    AnimSort();
}

void efxEreshkigalOBJ2_OnEnd(struct ProcEfxOBJ * proc)
{
    AnimDelete(proc->anim2);
    gEfxBgSemaphore--;
}

void efxEreshkigalOBJ2_Loop(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrCurrent = anim->pScrStart = AnimScr_EreshkigalOBJ2_B;
    anim->timer = 0;
    Proc_Break(proc);
}

void StartSubSpell_efxEreshkigalBG(struct Anim * anim)
{
    struct ProcEfxEclipseBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxEreshkigalBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = FrameConfig_EreshkigalBG;

    proc->tsal = TsaArray_EreshkigalBG;
    proc->tsar = TsaArray_EreshkigalBG;

    proc->img = ImgArray_EreshkigalBG;
    proc->pal = NULL;

    SpellFx_RegisterBgPal(Pal_EreshkigalBG, 0x20);
    SpellFx_SetSomeColorEffect();
}

// 9.99 efxmagic-eclipse:efxHazymoonBG_Loop
void efxEreshkigalBG_Loop(struct ProcEfxEclipseBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;

        u16 ** img = proc->img;

        if (proc->pal != *(img + ret))
        {
            SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
        }

        proc->pal = *(img + ret);

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

// 9.99 efxmagic-ereshkigal:StartSubSpell_efxSuperdruidBG3
void StartSubSpell_efxSuperdruidBG3(struct Anim * anim)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSuperdruidBG3, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxSuperdruidBG3_frames;

    proc->tsal = TsaArray_EreshkigalBg3;
    proc->tsar = TsaArray_EreshkigalBg3;
    proc->img = ImgArray_EreshkigalBg3;

    proc->pal = NULL;
    SpellFx_RegisterBgPal(Pal_EreshkigalBg3, PLTT_SIZE_4BPP);

    SpellFx_SetSomeColorEffect();
    SetBgOffset(BG_1, 0, 0);

    return;
}

// 9.99 efxmagic-ereshkigal:efxSuperdruidBG3_Loop
void efxSuperdruidBG3_Loop(struct ProcEfxEclipseBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;

        u16 ** img = proc->img;

        if (proc->pal != *(img + ret))
        {
            SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
        }

        proc->pal = *(img + ret);

        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));

        if (gEkrDistanceType != 0)
        {
            if (GetAnimPosition(proc->anim) == 0)
            {
                FillBGRect(gBg1Tm, 3, 20, 0, 0);
            }
            else
            {
                FillBGRect(TILEMAP_LOCATED(gBg1Tm, 29, 0), 3, 20, 0, 0);
            }

            EnableBgSync(BG1_SYNC_BIT);
        }
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

void StartSubSpell_efxEreshkigalWhiteOut(struct Anim * anim, int terminator, int duration)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxEreshkigalWhiteOut, PROC_TREE_4);
    proc->anim = anim;
    proc->timer = 0;

    CpuFastCopy(gPal, gEfxPal, 0x400);

    proc->terminator = duration;
    proc->unk30 = terminator;
}

void efxEreshkigalWhiteOut_Loop(struct ProcEfxBG * proc)
{
    int ret;
    u16 t;

    if (proc->timer > proc->terminator)
        t = proc->terminator;
    else
        t = proc->timer;

    ret = Interpolate(0, 0, 16, t, proc->terminator);

    CpuFastCopy(gEfxPal, gPal, 0x400);
    EfxPalWhiteInOut(gPal, 0, 32, ret);

    if (++proc->timer > proc->unk30)
    {
        CpuFastCopy(gEfxPal, gPal, 0x400);
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}

// 9.99 efxmagic-ereshkigal:StartSubSpell_efxSuperdruidOBJ2
void StartSubSpell_efxSuperdruidOBJ2(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    u32 * scr;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSuperdruidOBJ2, PROC_TREE_3);
    proc->anim = anim;

    scr = AnimScr_08BD7078;
    frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;

    frontAnim->xPosition = anim->xPosition;
    frontAnim->yPosition = anim->yPosition;

    SpellFx_RegisterObjGfx(Img_082D9C94, 32 * 4 * CHR_SIZE);
    SpellFx_RegisterObjPal(Pal_082DA240, PLTT_SIZE_4BPP);

    return;
}

// 9.99 efxmagic-ereshkigal:efxSuperdruidOBJ2_OnEnd
void efxSuperdruidOBJ2_OnEnd(void)
{
    gEfxBgSemaphore--;
    return;
}

// 9.99 efxmagic-ereshkigal:StartSubSpell_efxSuperdruidOBJ2
void StartSubSpell_efxEreshkigalOBJ3(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    u32 * scr;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxEreshkigalOBJ3, PROC_TREE_3);
    proc->anim = anim;

    scr = AnimScr_EreshkigalOBJ3;
    frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;

    frontAnim->xPosition = anim->xPosition;
    frontAnim->yPosition = anim->yPosition;

    SpellFx_RegisterObjGfx(Img_082D9C94, 32 * 4 * CHR_SIZE);
    SpellFx_RegisterObjPal(Pal_082DA240, PLTT_SIZE_4BPP);

    return;
}

// 9.99 efxmagic-ereshkigal:efxSuperdruidOBJ2_OnEnd
void efxEreshkigalOBJ3_OnEnd(void)
{
    gEfxBgSemaphore--;
    return;
}

SECTION(".rodata.08BA3F24")
const struct ProcCmd ProcScr_efxEreshkigal[] = {
    PROC_19,
    PROC_REPEAT(efxEreshkigal_Loop),
    PROC_END,
};

SECTION(".rodata.08BA3F3C")
const struct ProcCmd ProcScr_efxEreshkigalOBJ[] = {
    PROC_19,
    PROC_REPEAT(efxEreshkigalOBJ_Loop),
    PROC_SLEEP(69),
    PROC_END,
};

SECTION(".rodata.08BA4044")
const struct ProcCmd ProcScr_efxEreshkigalOBJChild[] = {
    PROC_19,
    PROC_SET_END_CB(efxEreshkigalOBJChild_OnEnd),
    PROC_SLEEP(59),
    PROC_END,
};

SECTION(".rodata.08BA4064")
const struct ProcCmd ProcScr_efxEreshkigalOBJ2[] = {
    PROC_19,
    PROC_SET_END_CB(efxEreshkigalOBJ2_OnEnd),
    PROC_SLEEP(13),
    PROC_REPEAT(efxEreshkigalOBJ2_Loop),
    PROC_SLEEP(110),
    PROC_END,
};

SECTION(".rodata.08BA4094")
const struct ProcCmd ProcScr_efxEreshkigalBG[] = {
    PROC_19,
    PROC_REPEAT(efxEreshkigalBG_Loop),
    PROC_END,
};

SECTION(".rodata.08BA40FC")
const struct ProcCmd ProcScr_efxSuperdruidBG3[] = {
    PROC_19,
    PROC_REPEAT(efxSuperdruidBG3_Loop),
    PROC_END,
};

SECTION(".rodata.08BA4164")
const struct ProcCmd ProcScr_efxEreshkigalWhiteOut[] = {
    PROC_19,
    PROC_REPEAT(efxEreshkigalWhiteOut_Loop),
    PROC_END,
};

SECTION(".rodata.08BA417C")
const struct ProcCmd ProcScr_efxSuperdruidOBJ2[] = {
    PROC_19,
    PROC_SET_END_CB(efxSuperdruidOBJ2_OnEnd),
    PROC_SLEEP(13),
    PROC_END,
};

SECTION(".rodata.08BA419C")
const struct ProcCmd ProcScr_efxEreshkigalOBJ3[] = {
    PROC_19,
    PROC_SET_END_CB(efxEreshkigalOBJ3_OnEnd),
    PROC_SLEEP(13),
    PROC_END,
};
