#include "gbafe.h"

extern u16 Img_FimbulvetrBg_A[], Img_FimbulvetrBg_B[], Img_FimbulvetrBg_C[], Img_FimbulvetrBg_D[],
    Img_FimbulvetrBg_Tornado_A[], Img_FimbulvetrBg_Tornado_B[], Img_FimbulvetrBg_Tornado_C[],
    Img_FimbulvetrBg_Tornado_D[], Img_FimbulvetrBg_Tornado_E[], Img_FimbulvetrBg_Tornado_F[],
    Tsa_FimbulvetrBg_A[], Tsa_FimbulvetrBg_B[], Tsa_FimbulvetrBg_C[], Tsa_FimbulvetrBg_D[],
    Tsa_FimbulvetrBg_E[], Tsa_FimbulvetrBg_F[], Tsa_FimbulvetrBg_G[], Tsa_FimbulvetrBg_H[],
    Tsa_FimbulvetrBg_I[], Tsa_FimbulvetrBg_J[], Tsa_FimbulvetrBg_K[], Tsa_FimbulvetrBg_Tornado_A[],
    Tsa_FimbulvetrBg_Tornado_B[], Tsa_FimbulvetrBg_Tornado_C[], Tsa_FimbulvetrBg_Tornado_D[],
    Tsa_FimbulvetrBg_Tornado_E[], Tsa_FimbulvetrBg_Tornado_F[];

extern const struct AnimSpriteData AnimSprite_FimbulvetrOBJ1_08BB7410[],
    AnimSprite_FimbulvetrOBJ1_08BB7488[], AnimSprite_FimbulvetrOBJ1_08BB7584[],
    AnimSprite_FimbulvetrOBJ1_08BB7698[], AnimSprite_FimbulvetrOBJ1_08BB77C4[],
    AnimSprite_FimbulvetrOBJ1_08BB7908[], AnimSprite_FimbulvetrOBJ1_08BB7A34[],
    AnimSprite_FimbulvetrOBJ1_08BB7B60[], AnimSprite_FimbulvetrOBJ1_08BB7C8C[],
    AnimSprite_FimbulvetrOBJ1_08BB7DB8[], AnimSprite_FimbulvetrOBJ1_08BB7ED8[],
    AnimSprite_FimbulvetrOBJ1_08BB8004[], AnimSprite_FimbulvetrOBJ1_08BB8130[],
    AnimSprite_FimbulvetrOBJ1_08BB8250[], AnimSprite_FimbulvetrOBJ1_08BB837C[],
    AnimSprite_FimbulvetrOBJ1_08BB84A8[], AnimSprite_FimbulvetrOBJ1_08BB85D4[],
    AnimSprite_FimbulvetrOBJ1_08BB8700[], AnimSprite_FimbulvetrOBJ1_08BB882C[],
    AnimSprite_FimbulvetrOBJ1_08BB8958[], AnimSprite_FimbulvetrOBJ1_08BB8A78[],
    AnimSprite_FimbulvetrOBJ1_08BB8B98[], AnimSprite_FimbulvetrOBJ1_08BB8CD0[],
    AnimSprite_FimbulvetrOBJ1_08BB8DF0[], AnimSprite_FimbulvetrOBJ1_08BB8F10[],
    AnimSprite_FimbulvetrOBJ1_08BB9030[], AnimSprite_FimbulvetrOBJ2Fall_TypeA_08BB9258[],
    AnimSprite_FimbulvetrOBJ2Fall_TypeB_08BB9270[], AnimSprite_FimbulvetrOBJ2_08BB8CB8[],
    AnimSprite_FimbulvetrOBJ2_08BB915C[], AnimSprite_FimbulvetrOBJ2_08BB9174[],
    AnimSprite_FimbulvetrOBJ2_08BB918C[], AnimSprite_FimbulvetrOBJ2_08BB91A4[];

/* auto-decls */
void NewEfxSpellCast(void);
void NewEfxFarAttackWithDistance(struct Anim * anim, s16 arg);
void EfxPlayHittedSFX(struct Anim * anim);
void RegisterEfxSpellCastEnd(void);
extern const struct ProcCmd ProcScr_efxFimbulvetr[];
extern int gEfxBgSemaphore;
extern const struct ProcCmd ProcScr_efxFimbulvetrBGTR[];
extern u16 * const TsaArray_FimbulvetrBg_Tornado[];
extern u16 * const ImgArray_FimbulvetrBg_Tornado[];
extern u16 Pal_FimbulvetrBg_Tornado[];
extern const struct ProcCmd ProcScr_efxFimbulvetrBG[];
extern u16 * const TsaArray_FimbulvetrBg[];
extern u16 * const ImgArray_FimbulvetrBg[];
extern u16 Pal_FimbulvetrBg[];
extern const struct ProcCmd ProcScr_efxFimbulvetrOBJ[];
extern const AnimScr AnimScr_FimbulvetrOBJ1[];
extern u16 Pal_HealSprites_Sparkles[];
extern u16 Img_FimbulvetrSprites_Snow[];
extern const struct ProcCmd ProcScr_efxFimbulvetrOBJ2[];
extern const struct ProcCmd ProcScr_efxFimbulvetrOBJ2Fall[];
extern const AnimScr AnimScr_FimbulvetrOBJ2[];
extern const AnimScr AnimScr_FimbulvetrOBJ2Fall_TypeA[];
extern const AnimScr AnimScr_FimbulvetrOBJ2Fall_TypeB[];

void StartSpellAnimFimbulvetr(struct Anim * anim);
void efxFimbulvetr_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxFimbulvetrBGTR(struct Anim * anim);
void efxFimbulvetrBGTR_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxFimbulvetrBG(struct Anim * anim);
void efxFimbulvetrBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxFimbulvetrOBJ(struct Anim * anim);
void efxFimbulvetrOBJ_Loop(struct ProcEfxOBJ * proc);
void StartSubSpell_efxFimbulvetrOBJ2(struct Anim * anim);
void efxFimbulvetrOBJ2_Loop(struct ProcEfxOBJ * proc);
void StartSubSpell_efxFimbulvetrOBJ2Fall(struct Anim * anim, int unk);
void efxFimbulvetrOBJ2Fall_Loop(struct ProcEfxOBJ * proc);

extern const u16 StartSubSpell_efxFimbulvetrBGTR_frames[];
extern const u16 StartSubSpell_efxFimbulvetrBG_frames[];

// 9.99 efxmagic-fimbulvetr:StartSpellAnimFimbulvetr
void StartSpellAnimFimbulvetr(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();

    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxFimbulvetr, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

// 9.99 efxmagic-fimbulvetr:efxFimbulvetr_Loop_Main
void efxFimbulvetr_Loop_Main(struct ProcEfx * proc)
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
        StartSubSpell_efxFimbulvetrBGTR(anim);
        StartSubSpell_efxFimbulvetrOBJ2(anim);
        SetBlendAlpha(0, 16);
        NewEfxALPHA(anim, 0, 16, 0, 16, 0);
        PlaySFX(0x122, 0x100, anim->xPosition, 1);
    }

    if (proc->timer == duration + 82)
    {
        NewEfxFlashBgWhite(proc->anim, 4);
    }
    else if (proc->timer == duration + 85)
    {
        StartSubSpell_efxFimbulvetrBG(anim);
        StartSubSpell_efxFimbulvetrOBJ(anim);
        NewEfxALPHA(anim, 24, 16, 16, 0, 0);
        PlaySFX(0x123, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 88)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);
        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if ((proc->timer != duration + 136) && (proc->timer == duration + 161))
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-fimbulvetr:StartSubSpell_efxFimbulvetrBGTR
void StartSubSpell_efxFimbulvetrBGTR(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    // clang-format off
    // clang-format on

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFimbulvetrBGTR, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxFimbulvetrBGTR_frames;
    proc->tsal = TsaArray_FimbulvetrBg_Tornado;
    proc->tsar = TsaArray_FimbulvetrBg_Tornado;
    proc->img = ImgArray_FimbulvetrBg_Tornado;

    SpellFx_RegisterBgPal(Pal_FimbulvetrBg_Tornado, PLTT_SIZE_4BPP);

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

// 9.99 efxmagic-fimbulvetr:efxFimbulvetrBGTR_Loop
void efxFimbulvetrBGTR_Loop(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 * const * tsaL = proc->tsal;
        u16 * const * tsaR = proc->tsar;
        u16 * const * img = proc->img;
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

// 9.99 efxmagic-fimbulvetr:StartSubSpell_efxFimbulvetrBG
void StartSubSpell_efxFimbulvetrBG(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    // clang-format off
    // clang-format on

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFimbulvetrBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxFimbulvetrBG_frames;
    proc->tsal = TsaArray_FimbulvetrBg;
    proc->tsar = TsaArray_FimbulvetrBg;
    proc->img = ImgArray_FimbulvetrBg;

    SpellFx_RegisterBgPal(Pal_FimbulvetrBg, PLTT_SIZE_4BPP);

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

void efxFimbulvetrBG_Loop(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 * const * tsaL = proc->tsal;
        u16 * const * tsaR = proc->tsar;
        u16 * const * img = proc->img;
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
}

// 9.99 efxmagic-fimbulvetr:StartSubSpell_efxFimbulvetrOBJ
void StartSubSpell_efxFimbulvetrOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFimbulvetrOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_FimbulvetrOBJ1, AnimScr_FimbulvetrOBJ1, AnimScr_FimbulvetrOBJ1, AnimScr_FimbulvetrOBJ1);
    proc->anim2->xPosition += 24;

    SpellFx_RegisterObjPal(Pal_HealSprites_Sparkles, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_FimbulvetrSprites_Snow, 32 * 4 * CHR_SIZE);

    return;
}

// 9.99 efxmagic-fimbulvetr:efxFimbulvetrOBJ_Loop
void efxFimbulvetrOBJ_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer > 51)
    {
        AnimDelete(proc->anim2);
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-fimbulvetr:StartSubSpell_efxFimbulvetrOBJ2
void StartSubSpell_efxFimbulvetrOBJ2(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFimbulvetrOBJ2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0;
    proc->unk44 = 1;
    proc->unk48 = 0;

    SpellFx_RegisterObjPal(Pal_HealSprites_Sparkles, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_FimbulvetrSprites_Snow, 32 * 4 * CHR_SIZE);

    return;
}

// 9.99 efxmagic-fimbulvetr:efxFimbulvetrOBJ2_Loop
void efxFimbulvetrOBJ2_Loop(struct ProcEfxOBJ * proc)
{
    int i;

    for (i = 0; i < 28; i++)
    {
        StartSubSpell_efxFimbulvetrOBJ2Fall(proc->anim, i);
    }

    gEfxBgSemaphore--;

    Proc_Break(proc);

    return;
}

// 9.99 efxmagic-fimbulvetr:StartSubSpell_efxFimbulvetrOBJ2Fall
void StartSubSpell_efxFimbulvetrOBJ2Fall(struct Anim * anim, int unk)
{
    struct ProcEfxOBJ * proc;
    struct Anim * anim2;

    u8 array[8] = { 0, 0, 0, 0, 0, 0, 1, 1 };

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFimbulvetrOBJ2Fall, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 100;
    proc->unk29 = array[unk & 7];

    anim2 = AnimCreate(AnimScr_FimbulvetrOBJ2, 120);
    proc->anim2 = anim2;
    anim2->oam2Base = OAM2_CHR(0x40) + OAM2_LAYER(2) + OAM2_PAL(2);
    anim2->xPosition = 256;
    anim2->yPosition = 256;

    proc->unk32 = sub_080672E8(UINT16_MAX);
    proc->unk3A = sub_080672E8(UINT16_MAX);

    if (array[unk & 7] == 0)
    {
        proc->unk34 = (sub_080672E8(UINT16_MAX) & 0x1FF) + 0x700;
    }
    else
    {
        proc->unk34 = (sub_080672E8(UINT16_MAX) & 0x1FF) + 0xa00;
    }

    proc->unk3C = (sub_080672E8(UINT16_MAX - 240) & 0x3FF) - 0x100;
    proc->unk36 = sub_080672E8(UINT16_MAX - 240);
    proc->unk3E = sub_080672E8(UINT16_MAX - 240);

    if (array[unk & 7] == 0)
    {
        proc->unk38 = (sub_080672E8(UINT16_MAX - 240) & 0x1FF) + 0x700;
    }
    else
    {
        proc->unk38 = (sub_080672E8(UINT16_MAX - 240) & 0x1FF) + 0xa00;
    }

    proc->unk40 = (sub_080672E8(UINT16_MAX - 240) & 0x3FF) - 0x100;

    return;
}

// 9.99 efxmagic-fimbulvetr:efxFimbulvetrOBJ2Fall_Loop
void efxFimbulvetrOBJ2Fall_Loop(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        gEfxBgSemaphore--;
        AnimDelete(anim);
        Proc_Break(proc);
    }
    else
    {
        if (!(proc->timer & 1))
        {
            if (proc->unk29 == 0)
            {
                anim->pScrStart = AnimScr_FimbulvetrOBJ2Fall_TypeA;
                anim->pScrCurrent = AnimScr_FimbulvetrOBJ2Fall_TypeA;
            }
            else
            {
                anim->pScrStart = AnimScr_FimbulvetrOBJ2Fall_TypeB;
                anim->pScrCurrent = AnimScr_FimbulvetrOBJ2Fall_TypeB;
            }

            anim->timer = 0;

            proc->unk32 += proc->unk34;
            proc->unk3A += proc->unk3C;
            anim->xPosition = proc->unk32 >> 8;
            anim->yPosition = proc->unk3A >> 8;
        }
        else
        {
            if (proc->unk29 == 0)
            {
                anim->pScrStart = AnimScr_FimbulvetrOBJ2Fall_TypeA;
                anim->pScrCurrent = AnimScr_FimbulvetrOBJ2Fall_TypeA;
            }
            else
            {
                anim->pScrStart = AnimScr_FimbulvetrOBJ2Fall_TypeB;
                anim->pScrCurrent = AnimScr_FimbulvetrOBJ2Fall_TypeB;
            }

            anim->timer = 0;

            proc->unk3E += proc->unk38;
            proc->unk3E += proc->unk40;
            anim->xPosition = proc->unk36 >> 8;
            anim->yPosition = proc->unk3E >> 8;
        }
    }

    return;
}

SECTION(".rodata.08BA1C0C")
const struct ProcCmd ProcScr_efxFimbulvetr[] = {
    PROC_19,
    PROC_REPEAT(efxFimbulvetr_Loop_Main),
    PROC_END,
};

SECTION(".rodata.08BA1C24")
const struct ProcCmd ProcScr_efxFimbulvetrBGTR[] = {
    PROC_19,
    PROC_REPEAT(efxFimbulvetrBGTR_Loop),
    PROC_END,
};

SECTION(".rodata.08BA1C6C")
const struct ProcCmd ProcScr_efxFimbulvetrBG[] = {
    PROC_19,
    PROC_REPEAT(efxFimbulvetrBG_Loop),
    PROC_END,
};

SECTION(".rodata.08BA1CDC")
const struct ProcCmd ProcScr_efxFimbulvetrOBJ[] = {
    PROC_19,
    PROC_REPEAT(efxFimbulvetrOBJ_Loop),
    PROC_END,
};

SECTION(".rodata.08BA1CF4")
const struct ProcCmd ProcScr_efxFimbulvetrOBJ2[] = {
    PROC_19,
    PROC_REPEAT(efxFimbulvetrOBJ2_Loop),
    PROC_END,
};

SECTION(".rodata.08BA1D0C")
const struct ProcCmd ProcScr_efxFimbulvetrOBJ2Fall[] = {
    PROC_19,
    PROC_REPEAT(efxFimbulvetrOBJ2Fall_Loop),
    PROC_END,
};

SECTION(".rodata.08BB91BC")
const AnimScr AnimScr_FimbulvetrOBJ1[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_FimbulvetrOBJ1_08BB7410, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FimbulvetrOBJ1_08BB7488, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FimbulvetrOBJ1_08BB7584, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FimbulvetrOBJ1_08BB7698, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FimbulvetrOBJ1_08BB77C4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FimbulvetrOBJ1_08BB7908, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FimbulvetrOBJ1_08BB7A34, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FimbulvetrOBJ1_08BB7B60, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FimbulvetrOBJ1_08BB7C8C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FimbulvetrOBJ1_08BB7DB8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FimbulvetrOBJ1_08BB7ED8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FimbulvetrOBJ1_08BB8004, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FimbulvetrOBJ1_08BB8130, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FimbulvetrOBJ1_08BB8250, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FimbulvetrOBJ1_08BB837C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FimbulvetrOBJ1_08BB84A8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FimbulvetrOBJ1_08BB85D4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FimbulvetrOBJ1_08BB8700, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FimbulvetrOBJ1_08BB882C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FimbulvetrOBJ1_08BB8958, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FimbulvetrOBJ1_08BB8A78, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FimbulvetrOBJ1_08BB8B98, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FimbulvetrOBJ1_08BB8CD0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FimbulvetrOBJ1_08BB8DF0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FimbulvetrOBJ1_08BB8F10, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FimbulvetrOBJ1_08BB9030, 2),
    ANIMSCR_LOOP,
};

SECTION(".rodata.08BB9228")
const AnimScr AnimScr_FimbulvetrOBJ2[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_FimbulvetrOBJ2_08BB915C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FimbulvetrOBJ2_08BB8CB8, 1),
    ANIMSCR_LOOP,
    ANIMSCR_FORCE_SPRITE(AnimSprite_FimbulvetrOBJ2_08BB9174, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FimbulvetrOBJ2_08BB8CB8, 1),
    ANIMSCR_LOOP,
    ANIMSCR_FORCE_SPRITE(AnimSprite_FimbulvetrOBJ2_08BB8CB8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FimbulvetrOBJ2_08BB918C, 1),
    ANIMSCR_LOOP,
    ANIMSCR_FORCE_SPRITE(AnimSprite_FimbulvetrOBJ2_08BB8CB8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FimbulvetrOBJ2_08BB91A4, 1),
    ANIMSCR_LOOP,
};

SECTION(".rodata.08BB9288")
const AnimScr AnimScr_FimbulvetrOBJ2Fall_TypeA[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_FimbulvetrOBJ2Fall_TypeA_08BB9258, 1),
    ANIMSCR_LOOP,
};

SECTION(".rodata.08BB9290")
const AnimScr AnimScr_FimbulvetrOBJ2Fall_TypeB[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_FimbulvetrOBJ2Fall_TypeB_08BB9270, 4),
    ANIMSCR_LOOP,
};

SECTION(".rodata.08BA1C3C")
u16 * const TsaArray_FimbulvetrBg_Tornado[] = {
    Tsa_FimbulvetrBg_Tornado_A,
    Tsa_FimbulvetrBg_Tornado_B,
    Tsa_FimbulvetrBg_Tornado_C,
    Tsa_FimbulvetrBg_Tornado_D,
    Tsa_FimbulvetrBg_Tornado_E,
    Tsa_FimbulvetrBg_Tornado_F,
};

SECTION(".rodata.08BA1C54")
u16 * const ImgArray_FimbulvetrBg_Tornado[] = {
    Img_FimbulvetrBg_Tornado_A,
    Img_FimbulvetrBg_Tornado_B,
    Img_FimbulvetrBg_Tornado_C,
    Img_FimbulvetrBg_Tornado_D,
    Img_FimbulvetrBg_Tornado_E,
    Img_FimbulvetrBg_Tornado_F,
};

SECTION(".rodata.08BA1C84")
u16 * const TsaArray_FimbulvetrBg[] = {
    Tsa_FimbulvetrBg_A,
    Tsa_FimbulvetrBg_B,
    Tsa_FimbulvetrBg_C,
    Tsa_FimbulvetrBg_D,
    Tsa_FimbulvetrBg_E,
    Tsa_FimbulvetrBg_F,
    Tsa_FimbulvetrBg_G,
    Tsa_FimbulvetrBg_H,
    Tsa_FimbulvetrBg_I,
    Tsa_FimbulvetrBg_J,
    Tsa_FimbulvetrBg_K,
};

SECTION(".rodata.08BA1CB0")
u16 * const ImgArray_FimbulvetrBg[] = {
    Img_FimbulvetrBg_A,
    Img_FimbulvetrBg_A,
    Img_FimbulvetrBg_A,
    Img_FimbulvetrBg_A,
    Img_FimbulvetrBg_A,
    Img_FimbulvetrBg_A,
    Img_FimbulvetrBg_B,
    Img_FimbulvetrBg_B,
    Img_FimbulvetrBg_C,
    Img_FimbulvetrBg_D,
    Img_FimbulvetrBg_D,
};
