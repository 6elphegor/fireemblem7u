#include "gbafe.h"

extern const struct AnimSpriteData AnimSprite_EfxHazymoonOBJ2_1_08BBA14C[],
    AnimSprite_EfxHazymoonOBJ2_1_08BBA1AC[], AnimSprite_EfxHazymoonOBJ2_1_08BBA20C[],
    AnimSprite_EfxHazymoonOBJ2_1_08BBA26C[], AnimSprite_EfxHazymoonOBJ2_2_08BBA2E0[],
    AnimSprite_EfxHazymoonOBJ2_2_08BBA3A0[], AnimSprite_EfxHazymoonOBJ2_2_08BBA460[],
    AnimSprite_EfxHazymoonOBJ2_2_08BBA520[], AnimSprite_EfxHazymoonOBJ2_3_08BBA5E8[],
    AnimSprite_EfxHazymoonOBJ2_3_08BBA6A8[], AnimSprite_EfxHazymoonOBJ2_3_08BBA75C[],
    AnimSprite_EfxHazymoonOBJ2_3_08BBA81C[], AnimSprite_EfxHazymoonOBJ3RND_08BB94E4[],
    AnimSprite_EfxMistyRainObj1_08BB9298[], AnimSprite_EfxMistyRainObj1_08BB92BC[],
    AnimSprite_EfxMistyRainObj1_08BB92E0[], AnimSprite_EfxMistyRainObj1_08BB940C[],
    AnimSprite_EfxMistyRainObj1_08BB9430[], AnimSprite_EfxMistyRainObj1_08BB9454[],
    AnimSprite_EfxMistyRainObj1_08BB9478[], AnimSprite_EfxMistyRainObj1_08BB949C[],
    AnimSprite_EfxMistyRainObj1_08BB94C0[];

/* auto-decls */
void NewEfxSpellCast(void);
void NewEfxFarAttackWithDistance(struct Anim * anim, s16 arg);
void StartSubSpell_efxResireRST(struct Anim * anim, ProcPtr efxproc, int c);
ProcPtr NewefxRestRST(struct Anim *anim, int unk44, int unk48, int frame, int speed);
void EfxPlayHittedSFX(struct Anim * anim);
void RegisterEfxSpellCastEnd(void);
extern const struct ProcCmd ProcScr_efxHazymoon[];
extern int gEfxBgSemaphore;
extern const struct ProcCmd ProcScr_efxHazymoonBG[];
extern u16 * TsaArray_EclipseBg[];
extern u16 * ImgArray_EclipseBg[];
extern u16 Pal_NosferatuBg[];
extern u16 Pal_EclipseBg_B[];
extern u16 Pal_EclipseBg_C[];
extern const struct ProcCmd ProcScr_efxHazymoonOBJ2[];
extern AnimScr FramScr_Unk5D4F90[];
extern const AnimScr AnimScr_EfxHazymoonOBJ2_1[];
extern u16 Pal_EclipseSprites[];
extern u16 Img_EclipseSprites_Swirl[];
extern const AnimScr AnimScr_EfxHazymoonOBJ2_2[];
extern u16 Img_EclipseSprites_0824CD2C[];
extern const AnimScr AnimScr_EfxHazymoonOBJ2_3[];
extern u16 Img_EclipseSprites_0824D1C4[];
extern const struct ProcCmd ProcScr_efxHazymoonOBJ3[];
extern u16 Pal_FluxAnimSprites[];
extern u16 Img_FluxAnimSprites_Orb[];
extern s16 gEclipseAnimSpriteCoordinates[];
extern const struct ProcCmd ProcScr_efxHazymoonOBJ3RND[];
extern const AnimScr AnimScr_EfxHazymoonOBJ3RND[];

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

void StartSpellAnimEclipse(struct Anim * anim);
void efxHazymoon_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxHazymoonBG_A(struct Anim * anim);
void StartSubSpell_efxHazymoonBG_B(struct Anim * anim);
void StartSubSpell_efxHazymoonBG_C(struct Anim * anim);
void efxHazymoonBG_Loop(struct ProcEfxEclipseBG * proc);
void StartSubSpell_efxHazymoonOBJ2(struct Anim * anim);
void efxHazymoonOBJ2_OnEnd(struct ProcEfxOBJ * proc);
void efxHazymoonOBJ2_Loop_A(struct ProcEfxOBJ * proc);
void efxHazymoonOBJ2_Loop_B(struct ProcEfxOBJ * proc);
void efxHazymoonOBJ2_Loop_C(struct ProcEfxOBJ * proc);
void StartSubSpell_efxHazymoonOBJ3(struct Anim * anim);
void efxHazymoonOBJ3_Loop(struct ProcEfxOBJ * proc);
void StartSubSpell_efxHazymoonOBJ3RND(struct Anim * anim, int x, int y);
void efxHazymoonOBJ3RND_OnEnd(struct ProcEfxOBJ * proc);

extern const u16 StartSubSpell_efxHazymoonBG_A_frames[];
extern const u16 StartSubSpell_efxHazymoonBG_B_frames[];
extern const u16 StartSubSpell_efxHazymoonBG_C_frames[];

// 9.99 efxmagic-eclipse:StartSpellAnimEclipse
void StartSpellAnimEclipse(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxHazymoon, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

// 9.99 efxmagic-eclipse:efxHazymoon_Loop_Main
void efxHazymoon_Loop_Main(struct ProcEfx * proc)
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
        NewEfxALPHA(anim, 0, 15, 0, 16, 0);
        NewEfxALPHA(anim, 80, 15, 16, 0, 0);
        StartSubSpell_efxHazymoonBG_A(proc->anim);
        StartSubSpell_efxHazymoonOBJ3(proc->anim);
        PlaySFX(0x138, 0x100, 0x78, 0);
    }
    else if (proc->timer == duration + 70)
    {
        StartSubSpell_efxResireRST(anim, NewefxRestRST(anim, 42, 15, 0, 2), 30);
        NewEfxRestWINH_(anim, 43, 0);
    }
    else if (proc->timer == duration + 120)
    {
        StartSubSpell_efxHazymoonBG_B(anim);
    }
    else if (proc->timer == duration + 125)
    {
        PlaySFX(0x139, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 151)
    {
        StartSubSpell_efxHazymoonOBJ2(proc->anim);
    }
    else if (proc->timer == duration + 226)
    {
        PlaySFX(0x2E2, 0x100, anim->xPosition, 1);
        NewEfxFlashBgWhite(anim, 10);
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);
        StartBattleAnimHitEffectsDefault(anim, proc->hitted);
        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (proc->timer == duration + 236)
    {
        StartSubSpell_efxHazymoonBG_C(anim);
        NewEfxALPHA(anim, 16, 10, 16, 0, 0);
    }
    else if (proc->timer == duration + 270)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-eclipse:StartSubSpell_efxHazymoonBG_A
void StartSubSpell_efxHazymoonBG_A(struct Anim * anim)
{
    // clang-format off
    // clang-format on

    struct ProcEfxEclipseBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxHazymoonBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxHazymoonBG_A_frames;

    proc->tsal = TsaArray_EclipseBg;
    proc->tsar = TsaArray_EclipseBg;

    proc->img = ImgArray_EclipseBg;
    proc->pal = NULL;

    SpellFx_RegisterBgPal(Pal_NosferatuBg, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    SetWinEnable(0, 0, 0);

    return;
}

// 9.99 efxmagic-eclipse:StartSubSpell_efxHazymoonBG_B
void StartSubSpell_efxHazymoonBG_B(struct Anim * anim)
{
    // clang-format off
    // clang-format on

    struct ProcEfxEclipseBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxHazymoonBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxHazymoonBG_B_frames;

    proc->tsal = TsaArray_EclipseBg;
    proc->tsar = TsaArray_EclipseBg;

    proc->img = ImgArray_EclipseBg;
    proc->pal = NULL;

    SpellFx_RegisterBgPal(Pal_EclipseBg_B, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    SetBlendAlpha(12, 6);

    return;
}

// 9.99 efxmagic-eclipse:StartSubSpell_efxHazymoonBG_C
void StartSubSpell_efxHazymoonBG_C(struct Anim * anim)
{
    // clang-format off
    // clang-format on

    struct ProcEfxEclipseBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxHazymoonBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxHazymoonBG_C_frames;

    proc->tsal = TsaArray_EclipseBg;
    proc->tsar = TsaArray_EclipseBg;

    proc->img = ImgArray_EclipseBg;
    proc->pal = NULL;

    SpellFx_RegisterBgPal(Pal_EclipseBg_C, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    return;
}

// 9.99 efxmagic-eclipse:efxHazymoonBG_Loop
void efxHazymoonBG_Loop(struct ProcEfxEclipseBG * proc)
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

// 9.99 efxmagic-eclipse:StartSubSpell_efxHazymoonOBJ2
void StartSubSpell_efxHazymoonOBJ2(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * otherAnim;
    struct Anim * frontAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxHazymoonOBJ2, PROC_TREE_3);
    proc->anim = anim;
    otherAnim = GetAnimAnotherSide(anim);
    proc->timer = 0;

    frontAnim = EfxCreateFrontAnim(otherAnim, FramScr_Unk5D4F90, FramScr_Unk5D4F90, FramScr_Unk5D4F90, FramScr_Unk5D4F90);
    proc->anim2 = frontAnim;
    frontAnim->oam2Base &= ~(0xc00);
    frontAnim->oam2Base |= 0x400;

    if (GetAnimPosition(otherAnim) == 0)
    {
        frontAnim->xPosition -= 8;
        frontAnim->yPosition -= 16;
    }
    else
    {
        frontAnim->xPosition += 8;
        frontAnim->yPosition -= 16;
    }

    return;
}

// 9.99 efxmagic-eclipse:efxHazymoonOBJ2_OnEnd
void efxHazymoonOBJ2_OnEnd(struct ProcEfxOBJ * proc)
{
    gEfxBgSemaphore--;
    AnimDelete(proc->anim2);
    return;
}

// 9.99 efxmagic-eclipse:efxHazymoonOBJ2_Loop_A
void efxHazymoonOBJ2_Loop_A(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    proc->timer++;

    if (proc->timer == 1)
    {
        anim->pScrStart = AnimScr_EfxHazymoonOBJ2_1;
        anim->pScrCurrent = AnimScr_EfxHazymoonOBJ2_1;
        anim->timer = 0;

        proc->terminator = 10;

        SpellFx_RegisterObjPal(Pal_EclipseSprites, PLTT_SIZE_4BPP);
        SpellFx_RegisterObjGfx(Img_EclipseSprites_Swirl, 32 * 4 * CHR_SIZE);
    }
    else if (proc->timer == proc->terminator)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-eclipse:efxHazymoonOBJ2_Loop_B
void efxHazymoonOBJ2_Loop_B(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    proc->timer++;

    if (proc->timer == 1)
    {
        anim->pScrStart = AnimScr_EfxHazymoonOBJ2_2;
        anim->pScrCurrent = AnimScr_EfxHazymoonOBJ2_2;
        anim->timer = 0;

        proc->terminator = 10;

        SpellFx_RegisterObjPal(Pal_EclipseSprites, PLTT_SIZE_4BPP);
        SpellFx_RegisterObjGfx(Img_EclipseSprites_0824CD2C, 32 * 4 * CHR_SIZE);
    }
    else if (proc->timer == proc->terminator)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-eclipse:efxHazymoonOBJ2_Loop_C
void efxHazymoonOBJ2_Loop_C(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    proc->timer++;

    if (proc->timer == 1)
    {
        anim->pScrStart = AnimScr_EfxHazymoonOBJ2_3;
        anim->pScrCurrent = AnimScr_EfxHazymoonOBJ2_3;
        anim->timer = 0;

        proc->terminator = 10;

        SpellFx_RegisterObjPal(Pal_EclipseSprites, PLTT_SIZE_4BPP);
        SpellFx_RegisterObjGfx(Img_EclipseSprites_0824D1C4, 32 * 4 * CHR_SIZE);
    }
    else if (proc->timer == proc->terminator)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-eclipse:StartSubSpell_efxHazymoonOBJ3
void StartSubSpell_efxHazymoonOBJ3(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxHazymoonOBJ3, PROC_TREE_3);
    proc->anim = anim;

    proc->timer = 0;
    proc->terminator = 0;

    proc->unk30 = 44;

    SpellFx_RegisterObjPal(Pal_FluxAnimSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_FluxAnimSprites_Orb, 32 * 4 * CHR_SIZE);

    return;
}

// 9.99 efxmagic-eclipse:efxHazymoonOBJ3_Loop
void efxHazymoonOBJ3_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == 8)
    {
        s16 x;
        s16 y;

        proc->timer = 0;

        x = gEclipseAnimSpriteCoordinates[proc->terminator * 2];
        y = gEclipseAnimSpriteCoordinates[proc->terminator * 2 + 1];

        StartSubSpell_efxHazymoonOBJ3RND(proc->anim, x, y);

        proc->terminator++;

        if (proc->terminator == 6)
        {
            gEfxBgSemaphore--;
            Proc_Break(proc);
        }
    }

    return;
}

// 9.99 efxmagic-eclipse:StartSubSpell_efxHazymoonOBJ3RND
void StartSubSpell_efxHazymoonOBJ3RND(struct Anim * anim, int x, int y)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxHazymoonOBJ3RND, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    frontAnim = EfxCreateFrontAnim(anim, AnimScr_EfxHazymoonOBJ3RND, AnimScr_EfxHazymoonOBJ3RND, AnimScr_EfxHazymoonOBJ3RND, AnimScr_EfxHazymoonOBJ3RND);
    proc->anim2 = frontAnim;

    frontAnim->xPosition = x;
    frontAnim->yPosition = y;

    return;
}

// 9.99 efxmagic-eclipse:efxHazymoonOBJ3RND_OnEnd
void efxHazymoonOBJ3RND_OnEnd(struct ProcEfxOBJ * proc)
{
    gEfxBgSemaphore--;
    AnimDelete(proc->anim2);
    return;
}

SECTION(".rodata.08BA2C58")
const struct ProcCmd ProcScr_efxHazymoon[] = {
    PROC_19,
    PROC_REPEAT(efxHazymoon_Loop_Main),
    PROC_END,
};

SECTION(".rodata.08BA2C70")
const struct ProcCmd ProcScr_efxHazymoonBG[] = {
    PROC_19,
    PROC_REPEAT(efxHazymoonBG_Loop),
    PROC_END,
};

SECTION(".rodata.08BA2D60")
const struct ProcCmd ProcScr_efxHazymoonOBJ2[] = {
    PROC_19,
    PROC_SET_END_CB(efxHazymoonOBJ2_OnEnd),
    PROC_REPEAT(efxHazymoonOBJ2_Loop_A),
    PROC_REPEAT(efxHazymoonOBJ2_Loop_B),
    PROC_REPEAT(efxHazymoonOBJ2_Loop_C),
    PROC_REPEAT(efxHazymoonOBJ2_Loop_A),
    PROC_REPEAT(efxHazymoonOBJ2_Loop_B),
    PROC_REPEAT(efxHazymoonOBJ2_Loop_C),
    PROC_END,
};

SECTION(".rodata.08BA2DA8")
const struct ProcCmd ProcScr_efxHazymoonOBJ3[] = {
    PROC_19,
    PROC_REPEAT(efxHazymoonOBJ3_Loop),
    PROC_END,
};

SECTION(".rodata.08BA2DD8")
const struct ProcCmd ProcScr_efxHazymoonOBJ3RND[] = {
    PROC_19,
    PROC_SET_END_CB(efxHazymoonOBJ3RND_OnEnd),
    PROC_SLEEP(44),
    PROC_END,
};

SECTION(".rodata.08BB9534")
const AnimScr AnimScr_EfxHazymoonOBJ3RND[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMistyRainObj1_08BB940C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMistyRainObj1_08BB9430, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMistyRainObj1_08BB9454, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMistyRainObj1_08BB9478, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMistyRainObj1_08BB949C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMistyRainObj1_08BB94C0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMistyRainObj1_08BB9298, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMistyRainObj1_08BB92BC, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMistyRainObj1_08BB92E0, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMistyRainObj1_08BB9298, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMistyRainObj1_08BB92BC, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMistyRainObj1_08BB92E0, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMistyRainObj1_08BB94C0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMistyRainObj1_08BB949C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMistyRainObj1_08BB9478, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMistyRainObj1_08BB9454, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMistyRainObj1_08BB9430, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMistyRainObj1_08BB940C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHazymoonOBJ3RND_08BB94E4, 2),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BBA2CC")
const AnimScr AnimScr_EfxHazymoonOBJ2_1[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHazymoonOBJ2_1_08BBA14C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHazymoonOBJ2_1_08BBA1AC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHazymoonOBJ2_1_08BBA20C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHazymoonOBJ2_1_08BBA26C, 4),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BBA5D4")
const AnimScr AnimScr_EfxHazymoonOBJ2_2[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHazymoonOBJ2_2_08BBA2E0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHazymoonOBJ2_2_08BBA3A0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHazymoonOBJ2_2_08BBA460, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHazymoonOBJ2_2_08BBA520, 4),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BBA8D0")
const AnimScr AnimScr_EfxHazymoonOBJ2_3[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHazymoonOBJ2_3_08BBA5E8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHazymoonOBJ2_3_08BBA6A8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHazymoonOBJ2_3_08BBA75C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHazymoonOBJ2_3_08BBA81C, 4),
    ANIMSCR_BLOCKED,
};
