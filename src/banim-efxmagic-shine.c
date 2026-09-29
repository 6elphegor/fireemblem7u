#include "gbafe.h"

extern u16 Img_ShineBg1[], Tsa_ShineBg1_Left[], Tsa_ShineBg1_Right[], Tsa_ShineBg2_A[],
    Tsa_ShineBg2_B[], Tsa_ShineBg2_C[], Tsa_ShineBg2_D[], Tsa_ShineBg2_E[], Tsa_ShineBg2_F[],
    Tsa_ShineBg2_G[], Tsa_ShineBg2_H[], Tsa_ShineBg2_I[];

extern const struct AnimSpriteData AnimSprite_EfxShine_08BD24E8[], AnimSprite_EfxShine_08BD250C[],
    AnimSprite_EfxShine_08BD2530[], AnimSprite_EfxShine_08BD2554[], AnimSprite_EfxShine_08BD2578[],
    AnimSprite_EfxShine_08BD259C[], AnimSprite_EfxShine_08BD25C0[], AnimSprite_EfxShine_08BD25E4[],
    AnimSprite_EfxShine_08BD2608[], AnimSprite_EfxShine_08BD262C[], AnimSprite_EfxShine_08BD2650[],
    AnimSprite_EfxShine_08BD2674[], AnimSprite_EfxShine_08BD2698[], AnimSprite_EfxShine_08BD26BC[],
    AnimSprite_EfxShine_08BD26E0[], AnimSprite_EfxShine_08BD2704[], AnimSprite_EfxShine_08BD2728[],
    AnimSprite_EfxShine_08BD274C[], AnimSprite_EfxShine_08BD2770[], AnimSprite_EfxShine_08BD2794[];

/* auto-decls */
void NewEfxSpellCast(void);
void NewEfxFarAttackWithDistance(struct Anim * anim, s16 arg);
void EfxPlayHittedSFX(struct Anim * anim);
void RegisterEfxSpellCastEnd(void);
extern const struct ProcCmd ProcScr_efxShine[];
extern int gEfxBgSemaphore;
extern const struct ProcCmd ProcScr_efxShineBG[];
extern u16 * const TsaArray_ShineBg_Left[];
extern u16 * const TsaArray_ShineBg_Right[];
extern u16 * const ImgArray_ShineBg[];
extern const struct ProcCmd ProcScr_efxShineBG2[];
extern u16 * const TsaArray_ShineBg2[];
extern u16 Pal_ShineBg2[];
extern u16 Img_ShineBg2[];
extern const struct ProcCmd ProcScr_efxShineBGCOL[];
extern u16 Pal_ShineBg_0828FD00[];
extern const struct ProcCmd ProcScr_efxShineOBJRND[];
extern u16 Pal_ShineSprites[];
extern u16 Img_ShineSprites[];
extern s16 gShineSpriteCoords[];
extern const struct ProcCmd ProcScr_efxShineOBJ[];
extern const AnimScr AnimScr_EfxShine[];
#define TILEMAP_INDEX(aX, aY) (0x20 * (aY) + (aX))
#define TILEMAP_LOCATED(aMap, aX, aY) (TILEMAP_INDEX((aX), (aY)) + (aMap))

void StartSpellAnimShine(struct Anim * anim);
void efxShine_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxShineBG(struct Anim * anim);
void efxShineBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxShineBG2(struct Anim * anim);
void efxShineBG2_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxShineBGCOL(struct Anim * anim);
void efxShineBGCOL_Loop(struct ProcEfxBGCOL * proc);
void StartSubSpell_efxShineOBJRND(struct Anim * anim);
void efxShineOBJRND_Loop(struct ProcEfxOBJ * proc);
void StartSubSpell_efxShineOBJ(struct Anim * anim, int x, int y);
void efxShineOBJ_Loop(struct ProcEfxOBJ * proc);

extern const u16 StartSubSpell_efxShineBG_frames[];
extern const u16 StartSubSpell_efxShineBG2_frames[];
extern const u16 StartSubSpell_efxShineBGCOL_frames[];

// 9.99 efxmagic-shine:StartSpellAnimShine
void StartSpellAnimShine(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxShine, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

// 9.99 efxmagic-shine:efxShine_Loop_Main
void efxShine_Loop_Main(struct ProcEfx * proc)
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
        NewEfxFlashBgWhite(anim, 10);
    }
    else if (proc->timer == duration + 11)
    {
        StartSubSpell_efxShineBG2(anim);
        PlaySFX(0x2BC, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 23)
    {
        NewEfxFlashBgWhite(anim, 5);
        StartSubSpell_efxShineOBJRND(anim);
    }
    else if (proc->timer == duration + 29)
    {
        StartSubSpell_efxShineBG(anim);
        StartSubSpell_efxShineBGCOL(anim);
    }
    else if (proc->timer == duration + 30)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (proc->timer == duration + 35)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-shine:StartSubSpell_efxShineBG
void StartSubSpell_efxShineBG(struct Anim * anim)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxShineBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxShineBG_frames;

    proc->tsal = TsaArray_ShineBg_Left;
    proc->tsar = TsaArray_ShineBg_Right;
    proc->img = ImgArray_ShineBg;

    SetBgOffset(BG_1, 0, 0);
    SpellFx_SetSomeColorEffect();

    return;
}

// 9.99 efxmagic-shine:efxShineBG_Loop
void efxShineBG_Loop(struct ProcEfxBG * proc)
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

// 9.99 efxmagic-shine:StartSubSpell_efxShineBG2
void StartSubSpell_efxShineBG2(struct Anim * anim)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxShineBG2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxShineBG2_frames;

    proc->tsal = TsaArray_ShineBg2;
    proc->tsar = TsaArray_ShineBg2;

    SpellFx_RegisterBgPal(Pal_ShineBg2, PLTT_SIZE_4BPP);
    SpellFx_RegisterBgGfx(Img_ShineBg2, 32 * 8 * CHR_SIZE);

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

// 9.99 efxmagic-shine:efxShineBG2_Loop
void efxShineBG2_Loop(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 * const * tsaL = proc->tsal;
        u16 * const * tsaR = proc->tsar;
        u16 * const * img = proc->img;
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

// 9.99 efxmagic-shine:StartSubSpell_efxShineBGCOL
void StartSubSpell_efxShineBGCOL(struct Anim * anim)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxShineBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->timer2 = 0;
    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxShineBGCOL_frames;

    proc->pal = Pal_ShineBg_0828FD00;
    SpellFx_RegisterBgPal(Pal_ShineBg_0828FD00, PLTT_SIZE_4BPP);

    return;
}

// 9.99 efxmagic-shine:efxShineBGCOL_Loop
void efxShineBGCOL_Loop(struct ProcEfxBGCOL * proc)
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

// 9.99 efxmagic-shine:StartSubSpell_efxShineOBJRND
void StartSubSpell_efxShineOBJRND(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxShineOBJRND, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 2;
    proc->unk30 = 0;

    SpellFx_RegisterObjPal(Pal_ShineSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_ShineSprites, 32 * 4 * CHR_SIZE);

    return;
}

// 9.99 efxmagic-shine:efxShineOBJRND_Loop
void efxShineOBJRND_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        int x;
        int y;
        if (GetAnimPosition(proc->anim) == 0)
        {
            x = proc->anim->xPosition + gShineSpriteCoords[(s16)proc->unk30];
            y = proc->anim->yPosition + gShineSpriteCoords[(s16)proc->unk30 + 1];
            StartSubSpell_efxShineOBJ(proc->anim, x, y);
        }
        else
        {
            x = proc->anim->xPosition - gShineSpriteCoords[(s16)proc->unk30];
            y = proc->anim->yPosition + gShineSpriteCoords[(s16)proc->unk30 + 1];
            StartSubSpell_efxShineOBJ(proc->anim, x, y);
        }

        proc->timer = 0;

        proc->unk30 = (s16) proc->unk30 + 2;

        if ((s16)proc->unk30 > 7)
        {
            gEfxBgSemaphore--;
            Proc_Break(proc);
        }
    }

    return;
}

// 9.99 efxmagic-shine:StartSubSpell_efxShineOBJ
void StartSubSpell_efxShineOBJ(struct Anim * anim, int x, int y)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxShineOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 70;

    frontAnim = EfxCreateFrontAnim(anim, AnimScr_EfxShine, AnimScr_EfxShine, AnimScr_EfxShine, AnimScr_EfxShine);
    proc->anim2 = frontAnim;
    frontAnim->xPosition = x;
    frontAnim->yPosition = y;

    return;
}

// 9.99 efxmagic-shine:efxShineOBJ_Loop
void efxShineOBJ_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}

SECTION(".rodata.08BA36A8")
const struct ProcCmd ProcScr_efxShine[] = {
    PROC_19,
    PROC_REPEAT(efxShine_Loop_Main),
    PROC_END,
};

SECTION(".rodata.08BA36C0")
const struct ProcCmd ProcScr_efxShineBG[] = {
    PROC_19,
    PROC_REPEAT(efxShineBG_Loop),
    PROC_END,
};

SECTION(".rodata.08BA36E4")
const struct ProcCmd ProcScr_efxShineBG2[] = {
    PROC_19,
    PROC_REPEAT(efxShineBG2_Loop),
    PROC_END,
};

SECTION(".rodata.08BA3720")
const struct ProcCmd ProcScr_efxShineBGCOL[] = {
    PROC_19,
    PROC_MARK(10),
    PROC_REPEAT(efxShineBGCOL_Loop),
    PROC_END,
};

SECTION(".rodata.08BA3740")
const struct ProcCmd ProcScr_efxShineOBJRND[] = {
    PROC_19,
    PROC_REPEAT(efxShineOBJRND_Loop),
    PROC_END,
};

SECTION(".rodata.08BA3768")
const struct ProcCmd ProcScr_efxShineOBJ[] = {
    PROC_19,
    PROC_REPEAT(efxShineOBJ_Loop),
    PROC_END,
};

SECTION(".rodata.08BD27AC")
const AnimScr AnimScr_EfxShine[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxShine_08BD24E8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxShine_08BD250C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxShine_08BD2530, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxShine_08BD2554, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxShine_08BD2578, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxShine_08BD259C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxShine_08BD25C0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxShine_08BD25E4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxShine_08BD2608, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxShine_08BD262C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxShine_08BD2650, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxShine_08BD2674, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxShine_08BD2698, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxShine_08BD26BC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxShine_08BD26E0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxShine_08BD2704, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxShine_08BD2728, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxShine_08BD274C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxShine_08BD2770, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxShine_08BD2794, 31),
    ANIMSCR_WAIT(0x13),
    ANIMSCR_END,
};

SECTION(".rodata.08BA36D8")
u16 * const TsaArray_ShineBg_Left[] = {
    Tsa_ShineBg1_Left,
};

SECTION(".rodata.08BA36DC")
u16 * const TsaArray_ShineBg_Right[] = {
    Tsa_ShineBg1_Right,
};

SECTION(".rodata.08BA36E0")
u16 * const ImgArray_ShineBg[] = {
    Img_ShineBg1,
};

SECTION(".rodata.08BA36FC")
u16 * const TsaArray_ShineBg2[] = {
    Tsa_ShineBg2_A,
    Tsa_ShineBg2_B,
    Tsa_ShineBg2_C,
    Tsa_ShineBg2_D,
    Tsa_ShineBg2_E,
    Tsa_ShineBg2_F,
    Tsa_ShineBg2_G,
    Tsa_ShineBg2_H,
    Tsa_ShineBg2_I,
};
