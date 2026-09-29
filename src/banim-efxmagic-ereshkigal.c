#include "gbafe.h"

extern u16 Img_EreshkigalBG_00[], Img_EreshkigalBG_02[], Img_EreshkigalBG_03[],
    Img_EreshkigalBG_04[], Img_EreshkigalBG_05[], Img_EreshkigalBG_06[], Img_EreshkigalBG_07[],
    Img_EreshkigalBG_08[], Img_EreshkigalBG_09[], Img_EreshkigalBg3_00[], Img_EreshkigalBg3_01[],
    Img_EreshkigalBg3_02[], Img_EreshkigalBg3_03[], Img_EreshkigalBg3_04[], Img_EreshkigalBg3_05[],
    Img_EreshkigalBg3_06[], Img_EreshkigalBg3_07[], Img_EreshkigalBg3_08[], Img_EreshkigalBg3_09[],
    Tsa_EreshkigalBG_00[], Tsa_EreshkigalBG_01[], Tsa_EreshkigalBG_02[], Tsa_EreshkigalBG_03[],
    Tsa_EreshkigalBG_04[], Tsa_EreshkigalBG_05[], Tsa_EreshkigalBG_06[], Tsa_EreshkigalBG_07[],
    Tsa_EreshkigalBG_08[], Tsa_EreshkigalBG_09[], Tsa_EreshkigalBg3_00[], Tsa_EreshkigalBg3_01[],
    Tsa_EreshkigalBg3_02[], Tsa_EreshkigalBg3_03[], Tsa_EreshkigalBg3_04[], Tsa_EreshkigalBg3_05[],
    Tsa_EreshkigalBg3_06[], Tsa_EreshkigalBg3_07[], Tsa_EreshkigalBg3_08[], Tsa_EreshkigalBg3_09[];

extern const struct AnimSpriteData gUnk_08BD6004[], gUnk_08BD6028[], gUnk_08BD604C[],
    gUnk_08BD6070[], gUnk_08BD6094[], gUnk_08BD60AC[], gUnk_08BD60D0[], gUnk_08BD60F4[],
    gUnk_08BD6118[], gUnk_08BD613C[], gUnk_08BD6160[], gUnk_08BD6184[], gUnk_08BD61A8[],
    gUnk_08BD61CC[], gUnk_08BD61F0[], gUnk_08BD6214[], gUnk_08BD6238[], gUnk_08BD625C[],
    gUnk_08BD6280[], gUnk_08BD62A4[], gUnk_08BD62C8[], gUnk_08BD62EC[], gUnk_08BD6310[],
    gUnk_08BD6328[], gUnk_08BD634C[], gUnk_08BD6370[], gUnk_08BD6394[], gUnk_08BD63B8[],
    gUnk_08BD63D0[], gUnk_08BD63F4[], gUnk_08BD6418[], gUnk_08BD643C[], gUnk_08BD6460[],
    gUnk_08BD6478[], gUnk_08BD649C[], gUnk_08BD64C0[], gUnk_08BD64E4[], gUnk_08BD6508[],
    gUnk_08BD652C[], gUnk_08BD6550[], gUnk_08BD6574[], gUnk_08BD6598[], gUnk_08BD65BC[],
    gUnk_08BD65E0[], gUnk_08BD6604[], gUnk_08BD6628[], gUnk_08BD664C[], gUnk_08BD6670[],
    gUnk_08BD6694[], gUnk_08BD66B8[], gUnk_08BD66DC[], gUnk_08BD6700[], gUnk_08BD6718[],
    gUnk_08BD673C[], gUnk_08BD6760[], gUnk_08BD6784[], gUnk_08BD67A8[], gUnk_08BD67CC[],
    gUnk_08BD67F0[], gUnk_08BD6814[], gUnk_08BD6838[], gUnk_08BD685C[], gUnk_08BD6880[],
    gUnk_08BD68A4[];

extern const struct AnimSpriteData AnimSprite_EreshkigalOBJ2_A_08BD68C8[],
    AnimSprite_EreshkigalOBJ2_A_08BD68EC[], AnimSprite_EreshkigalOBJ2_A_08BD6910[],
    AnimSprite_EreshkigalOBJ2_A_08BD6934[], AnimSprite_EreshkigalOBJ2_A_08BD6958[],
    AnimSprite_EreshkigalOBJ2_A_08BD6970[], AnimSprite_EreshkigalOBJ2_A_08BD69DC[],
    AnimSprite_EreshkigalOBJ2_B_08BD6A48[], AnimSprite_EreshkigalOBJ2_B_08BD6A84[],
    AnimSprite_EreshkigalOBJ2_B_08BD6AC0[], AnimSprite_EreshkigalOBJ3_08BD6FD0[],
    AnimSprite_EreshkigalOBJ3_08BD700C[], gUnk_08BD6E2C[], gUnk_08BD6E74[], gUnk_08BD6F70[],
    gUnk_08BD6FB8[];

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
    /* 4C */ u16 * const * tsal;
    /* 50 */ u16 * const * tsar;
    /* 54 */ u16 * const * img;
    /* 58 */ u16 * pal;
    /* 5C */ struct Anim * anim;
};

/* auto-decls */
void NewEfxTwobaiRST(struct Anim *anim, int unk44);
extern const struct ProcCmd ProcScr_efxSuperdruidBG3[];
extern u16 * const TsaArray_EreshkigalBg3[];
extern u16 * const ImgArray_EreshkigalBg3[];
extern u16 Pal_EreshkigalBg3[];
extern const struct ProcCmd ProcScr_efxSuperdruidOBJ2[];
extern const AnimScr AnimScr_08BD7078[];
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
extern const AnimScr * const AnimScrArray_EreshkigalOBJChild[];
extern const AnimScr AnimScr_EreshkigalOBJ2_A[];
extern const AnimScr AnimScr_EreshkigalOBJ2_B[];
extern const AnimScr AnimScr_EreshkigalOBJ3[];
extern u16 Img_EreshkigalOBJ[];
extern u16 Pal_EreshkigalOBJ[];
extern const s16 FrameConfig_EreshkigalBG[];
extern u16 * const TsaArray_EreshkigalBG[];
extern u16 * const ImgArray_EreshkigalBG[];
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
    const AnimScr * scr;

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
        u16 * const * tsaL = proc->tsal;
        u16 * const * tsaR = proc->tsar;

        u16 * const * img = proc->img;

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
        u16 * const * tsaL = proc->tsal;
        u16 * const * tsaR = proc->tsar;

        u16 * const * img = proc->img;

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
    const AnimScr * scr;

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
    const AnimScr * scr;

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

SECTION(".rodata.08BD6CF4")
const AnimScr AnimScr_EreshkigalOBJ2_A[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EreshkigalOBJ2_A_08BD68C8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EreshkigalOBJ2_A_08BD68EC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EreshkigalOBJ2_A_08BD6910, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EreshkigalOBJ2_A_08BD6934, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EreshkigalOBJ2_A_08BD6958, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EreshkigalOBJ2_A_08BD6970, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EreshkigalOBJ2_A_08BD69DC, 2),
    ANIMSCR_LOOP,
};

SECTION(".rodata.08BD6D14")
const AnimScr AnimScr_EreshkigalOBJ2_B[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EreshkigalOBJ2_B_08BD6A48, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EreshkigalOBJ2_B_08BD6A84, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EreshkigalOBJ2_B_08BD6AC0, 3),
    ANIMSCR_LOOP,
};

SECTION(".rodata.08BD7078")
const AnimScr AnimScr_08BD7078[] = {
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6E2C, 3),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6E74, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6FB8, 5),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6F70, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6FB8, 2),
    ANIMSCR_END,
};

SECTION(".rodata.08BD7090")
const AnimScr AnimScr_EreshkigalOBJ3[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EreshkigalOBJ3_08BD6FD0, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EreshkigalOBJ3_08BD700C, 2),
    ANIMSCR_END,
};

extern const AnimScr AnimScr_EreshkigalOBJChild_0[];
extern const AnimScr AnimScr_EreshkigalOBJChild_1[];
extern const AnimScr AnimScr_EreshkigalOBJChild_2[];
extern const AnimScr AnimScr_EreshkigalOBJChild_3[];
extern const AnimScr AnimScr_EreshkigalOBJChild_4[];
extern const AnimScr AnimScr_EreshkigalOBJChild_5[];

SECTION(".rodata.08BD6AFC")
const AnimScr AnimScr_EreshkigalOBJChild_0[] = {
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6004, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6028, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD604C, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6070, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6094, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD60AC, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD60D0, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD60F4, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6118, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD613C, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6160, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6184, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD61A8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD61CC, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD61F0, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6214, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6238, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD625C, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6280, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD62A4, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD62C8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD62EC, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6310, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6328, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD634C, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6370, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6394, 1),
    ANIMSCR_LOOP,
};

SECTION(".rodata.08BD6BD4")
const AnimScr AnimScr_EreshkigalOBJChild_1[] = {
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63D0, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63F4, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6418, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD643C, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6460, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6478, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD649C, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD64C0, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD64E4, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6508, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD652C, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6550, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6574, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6598, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD65BC, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD65E0, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6604, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6628, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD664C, 1),
    ANIMSCR_LOOP,
};

SECTION(".rodata.08BD6C6C")
const AnimScr AnimScr_EreshkigalOBJChild_2[] = {
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6670, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6694, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD66B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD66DC, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6700, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6718, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD673C, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6760, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6784, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD67A8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD67CC, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD67F0, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6814, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6838, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD685C, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6880, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63B8, 1),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD68A4, 1),
    ANIMSCR_LOOP,
};

SECTION(".rodata.08BD6D24")
const AnimScr AnimScr_EreshkigalOBJChild_3[] = {
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6004, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6028, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD604C, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6070, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6094, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD60AC, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD60D0, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD60F4, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6118, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD613C, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6160, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6184, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD61A8, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD61CC, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD61F0, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6214, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6238, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD625C, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6280, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD62A4, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD62C8, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD62EC, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6310, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6328, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD634C, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6370, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6394, 2),
    ANIMSCR_LOOP,
};

SECTION(".rodata.08BD6D94")
const AnimScr AnimScr_EreshkigalOBJChild_4[] = {
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63D0, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD63F4, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6418, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD643C, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6460, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6478, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD649C, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD64C0, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD64E4, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6508, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD652C, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6550, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6574, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6598, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD65BC, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD65E0, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6604, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6628, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD664C, 2),
    ANIMSCR_LOOP,
};

SECTION(".rodata.08BD6DE4")
const AnimScr AnimScr_EreshkigalOBJChild_5[] = {
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6670, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6694, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD66B8, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD66DC, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6700, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6718, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD673C, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6760, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6784, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD67A8, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD67CC, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD67F0, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6814, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6838, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD685C, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD6880, 2),
    ANIMSCR_FORCE_SPRITE(gUnk_08BD68A4, 2),
    ANIMSCR_LOOP,
};

SECTION(".rodata.08BA402C")
const AnimScr * const AnimScrArray_EreshkigalOBJChild[] = {
    AnimScr_EreshkigalOBJChild_0,
    AnimScr_EreshkigalOBJChild_1,
    AnimScr_EreshkigalOBJChild_2,
    AnimScr_EreshkigalOBJChild_3,
    AnimScr_EreshkigalOBJChild_4,
    AnimScr_EreshkigalOBJChild_5,
};

SECTION(".rodata.08BA40AC")
u16 * const ImgArray_EreshkigalBG[] = {
    Img_EreshkigalBG_00,
    Img_EreshkigalBG_00,
    Img_EreshkigalBG_02,
    Img_EreshkigalBG_03,
    Img_EreshkigalBG_04,
    Img_EreshkigalBG_05,
    Img_EreshkigalBG_06,
    Img_EreshkigalBG_07,
    Img_EreshkigalBG_08,
    Img_EreshkigalBG_09,
};

SECTION(".rodata.08BA40D4")
u16 * const TsaArray_EreshkigalBG[] = {
    Tsa_EreshkigalBG_00,
    Tsa_EreshkigalBG_01,
    Tsa_EreshkigalBG_02,
    Tsa_EreshkigalBG_03,
    Tsa_EreshkigalBG_04,
    Tsa_EreshkigalBG_05,
    Tsa_EreshkigalBG_06,
    Tsa_EreshkigalBG_07,
    Tsa_EreshkigalBG_08,
    Tsa_EreshkigalBG_09,
};

SECTION(".rodata.08BA4114")
u16 * const ImgArray_EreshkigalBg3[] = {
    Img_EreshkigalBg3_00,
    Img_EreshkigalBg3_01,
    Img_EreshkigalBg3_02,
    Img_EreshkigalBg3_03,
    Img_EreshkigalBg3_04,
    Img_EreshkigalBg3_05,
    Img_EreshkigalBg3_06,
    Img_EreshkigalBg3_07,
    Img_EreshkigalBg3_08,
    Img_EreshkigalBg3_09,
};

SECTION(".rodata.08BA413C")
u16 * const TsaArray_EreshkigalBg3[] = {
    Tsa_EreshkigalBg3_00,
    Tsa_EreshkigalBg3_01,
    Tsa_EreshkigalBg3_02,
    Tsa_EreshkigalBg3_03,
    Tsa_EreshkigalBg3_04,
    Tsa_EreshkigalBg3_05,
    Tsa_EreshkigalBg3_06,
    Tsa_EreshkigalBg3_07,
    Tsa_EreshkigalBg3_08,
    Tsa_EreshkigalBg3_09,
};
