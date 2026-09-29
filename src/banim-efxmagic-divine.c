#include "gbafe.h"

extern const struct AnimSpriteData AnimSprite_EfxDevineOBJ_08BB9B60[],
    AnimSprite_EfxDevineOBJ_08BB9BE4[], AnimSprite_EfxDevineOBJ_08BB9C68[],
    AnimSprite_EfxDevineOBJ_08BB9CD4[], AnimSprite_EfxDevineOBJ_08BB9D40[],
    AnimSprite_EfxDevineOBJ_08BB9DAC[], AnimSprite_EfxDevineOBJ_08BB9E00[],
    AnimSprite_EfxDevineOBJ_08BB9E6C[], AnimSprite_EfxDevineOBJ_08BB9ED8[],
    AnimSprite_EfxDevineOBJ_08BB9F14[], AnimSprite_EfxDevineOBJ_08BB9F98[],
    AnimSprite_EfxDevineOBJ_08BBA028[], AnimSprite_EfxDevineOBJ_08BBA094[],
    AnimSprite_EfxDevineOBJ_08BBA0D0[], AnimSprite_EfxDevineOBJ_08BBA0F4[];

/* auto-decls */
void NewEfxSpellCast(void);
void NewEfxFarAttackWithDistance(struct Anim * anim, s16 arg);
void EfxPlayHittedSFX(struct Anim * anim);
void RegisterEfxSpellCastEnd(void);
extern const struct ProcCmd ProcScr_efxDivine[];
extern int gEfxBgSemaphore;
extern const struct ProcCmd ProcScr_efxDivineBG[];
extern u16 * TsaArray_DivineBg[];
extern u16 * ImgArray_DivineBg[];
extern u16 Pal_DivineBg[];
extern u16 * TsaArray_DivineBg2[];
extern u16 * ImgArray_DivineBg2[];
extern u16 * TsaArray_DivineBg3[];
extern u16 * ImgArray_DivineBg3[];
extern u16 Pal_DivineBg3[];
extern const struct ProcCmd ProcScr_efxDivineOBJ[];
extern const AnimScr AnimScr_EfxDevineOBJ[];
extern u16 Pal_DivineSprites[];
extern u16 Img_DivineSprites[];
#define TILEMAP_INDEX(aX, aY) (0x20 * (aY) + (aX))
#define TILEMAP_LOCATED(aMap, aX, aY) (TILEMAP_INDEX((aX), (aY)) + (aMap))

void StartSpellAnimDivine(struct Anim * anim);
void efxDivine_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxDivineBG(struct Anim * anim);
void StartSubSpell_efxDivineBG_2(struct Anim * anim);
void StartSubSpell_efxDivineBG_3(struct Anim * anim);
void efxDivineBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxDivineOBJ(struct Anim * anim);
void efxDivineOBJ_Loop(struct ProcEfxOBJ * proc);

extern const u16 StartSubSpell_efxDivineBG_frames[];
extern const u16 StartSubSpell_efxDivineBG_2_frames[];
extern const u16 StartSubSpell_efxDivineBG_3_frames[];

// 9.99 efxmagic-light:StartSpellAnimDivine
void StartSpellAnimDivine(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxDivine, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

// 9.99 efxmagic-light:efxDivine_Loop_Main
void efxDivine_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        PlaySFX(0x127, 0x100, proc->anim->xPosition, 1);
        StartSubSpell_efxDivineBG(anim);
        StartSubSpell_efxDivineOBJ(proc->anim);
        return;
    }

    if (proc->timer == 20)
    {
        PlaySFX(0x128, 0x100, proc->anim->xPosition, 1);
        return;
    }

    if (proc->timer == 50)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
        return;
    }

    if (proc->timer == duration + 70)
    {
        StartSubSpell_efxDivineBG_2(anim);
        PlaySFX(0x129, 0x100, anim->xPosition, 1);
        return;
    }

    if (proc->timer == duration + 73)
    {
        NewEfxFlashBgWhite(proc->anim, 10);
        return;
    }

    if (proc->timer == duration + 75)
    {
        StartSubSpell_efxDivineBG_3(anim);

        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }

        return;
    }

    if ((proc->timer != duration + 90) && (proc->timer == 100))
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-light:StartSubSpell_efxDivineBG
void StartSubSpell_efxDivineBG(struct Anim * anim)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDivineBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxDivineBG_frames;
    proc->tsal = TsaArray_DivineBg;
    proc->tsar = TsaArray_DivineBg;
    proc->img = ImgArray_DivineBg;

    SpellFx_RegisterBgPal(Pal_DivineBg, PLTT_SIZE_4BPP);

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

    SpellFx_SetSomeColorEffect();

    return;
}

// 9.99 efxmagic-light:StartSubSpell_efxDivineBG_2
void StartSubSpell_efxDivineBG_2(struct Anim * anim)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDivineBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxDivineBG_2_frames;
    proc->tsal = TsaArray_DivineBg2;
    proc->tsar = TsaArray_DivineBg2;
    proc->img = ImgArray_DivineBg2;

    SpellFx_RegisterBgPal(Pal_DivineBg, PLTT_SIZE_4BPP);

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

    SpellFx_SetSomeColorEffect();

    return;
}

// 9.99 efxmagic-light:StartSubSpell_efxDivineBG_3
void StartSubSpell_efxDivineBG_3(struct Anim * anim)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDivineBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxDivineBG_3_frames;

    proc->tsal = TsaArray_DivineBg3;
    proc->tsar = TsaArray_DivineBg3;
    proc->img = ImgArray_DivineBg3;

    SpellFx_RegisterBgPal(Pal_DivineBg3, PLTT_SIZE_4BPP);

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

    SpellFx_SetSomeColorEffect();

    return;
}

// 9.99 efxmagic-light:efxDivineBG_Loop
void efxDivineBG_Loop(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;

        SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));

        if (gEkrDistanceType != EKR_DISTANCE_CLOSE)
        {
            int pos = GetAnimPosition(proc->anim);
            if (pos == 0)
            {
                FillBGRect(gBg1Tm, 3, 20, 0, pos);
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

// 9.99 efxmagic-light:StartSubSpell_efxDivineOBJ
void StartSubSpell_efxDivineOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDivineOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    frontAnim = EfxCreateFrontAnim(anim, AnimScr_EfxDevineOBJ, AnimScr_EfxDevineOBJ, AnimScr_EfxDevineOBJ, AnimScr_EfxDevineOBJ);
    proc->anim2 = frontAnim;

    if (GetAnimPosition(anim) == 0)
    {
        frontAnim->xPosition -= 6;
    }
    else
    {
        frontAnim->xPosition += 6;
    }

    SpellFx_RegisterObjPal(Pal_DivineSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_DivineSprites, 32 * 4 * CHR_SIZE);

    return;
}

// 9.99 efxmagic-light:efxDivineOBJ_Loop
void efxDivineOBJ_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == 44)
    {
        AnimDelete(proc->anim2);
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}

SECTION(".rodata.08BA29A8")
const struct ProcCmd ProcScr_efxDivine[] = {
    PROC_19,
    PROC_REPEAT(efxDivine_Loop_Main),
    PROC_END,
};

SECTION(".rodata.08BA29C0")
const struct ProcCmd ProcScr_efxDivineBG[] = {
    PROC_19,
    PROC_REPEAT(efxDivineBG_Loop),
    PROC_END,
};

SECTION(".rodata.08BA2B38")
const struct ProcCmd ProcScr_efxDivineOBJ[] = {
    PROC_19,
    PROC_REPEAT(efxDivineOBJ_Loop),
    PROC_END,
};

SECTION(".rodata.08BBA10C")
const AnimScr AnimScr_EfxDevineOBJ[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxDevineOBJ_08BBA0F4, 29),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxDevineOBJ_08BB9B60, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxDevineOBJ_08BB9BE4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxDevineOBJ_08BB9C68, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxDevineOBJ_08BB9CD4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxDevineOBJ_08BB9D40, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxDevineOBJ_08BB9DAC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxDevineOBJ_08BB9E00, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxDevineOBJ_08BB9E6C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxDevineOBJ_08BB9ED8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxDevineOBJ_08BB9F14, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxDevineOBJ_08BB9F98, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxDevineOBJ_08BBA028, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxDevineOBJ_08BBA094, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxDevineOBJ_08BBA0D0, 1),
    ANIMSCR_BLOCKED,
};
