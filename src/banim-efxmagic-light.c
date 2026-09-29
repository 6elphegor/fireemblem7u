#include "gbafe.h"

extern u16 Img_LightningBg_00[], Img_LightningBg_03[], Img_LightningBg_06[], Img_LightningBg_0A[],
    Img_LightningBg_0D[], Img_LightningBg_10[], Img_LightningBg_19[], Img_LightningBg_1C[],
    Img_PurgeBg_30[], Img_PurgeBg_32[], Img_PurgeBg_34[], Img_PurgeBg_36[], Img_PurgeBg_38[],
    Img_PurgeBg_3F[], Img_PurgeBg_40[], Img_PurgeBg_41[], Img_PurgeBg_42[], Img_PurgeBg_43[],
    Img_PurgeBg_44[], Img_PurgeBg_46[], Img_PurgeBg_48[], Img_PurgeBg_49[], Img_PurgeBg_4A[],
    Img_PurgeBg_4B[], Img_PurgeBg_4C[], Img_PurgeBg_4D[], Tsa_LightningBg_00[],
    Tsa_LightningBg_01[], Tsa_LightningBg_02[], Tsa_LightningBg_03[], Tsa_LightningBg_04[],
    Tsa_LightningBg_05[], Tsa_LightningBg_06[], Tsa_LightningBg_07[], Tsa_LightningBg_08[],
    Tsa_LightningBg_09[], Tsa_LightningBg_0A[], Tsa_LightningBg_0B[], Tsa_LightningBg_0C[],
    Tsa_LightningBg_0D[], Tsa_LightningBg_0E[], Tsa_LightningBg_0F[], Tsa_LightningBg_10[],
    Tsa_LightningBg_11[], Tsa_LightningBg_12[], Tsa_LightningBg_13[], Tsa_LightningBg_14[],
    Tsa_LightningBg_15[], Tsa_LightningBg_16[], Tsa_LightningBg_17[], Tsa_LightningBg_18[],
    Tsa_LightningBg_19[], Tsa_LightningBg_1A[], Tsa_LightningBg_1B[], Tsa_LightningBg_1C[],
    Tsa_LightningBg_1D[], Tsa_LightningBg_1E[], Tsa_LightningBg_1F[], Tsa_LightningBg_20[],
    Tsa_PurgeBg_00[], Tsa_PurgeBg_01[], Tsa_PurgeBg_02[], Tsa_PurgeBg_03[], Tsa_PurgeBg_04[],
    Tsa_PurgeBg_05[], Tsa_PurgeBg_06[], Tsa_PurgeBg_07[], Tsa_PurgeBg_08[], Tsa_PurgeBg_09[],
    Tsa_PurgeBg_0A[], Tsa_PurgeBg_0B[], Tsa_PurgeBg_0C[], Tsa_PurgeBg_0D[], Tsa_PurgeBg_0E[],
    Tsa_PurgeBg_0F[], Tsa_PurgeBg_10[], Tsa_PurgeBg_11[], Tsa_PurgeBg_12[], Tsa_PurgeBg_13[],
    Tsa_PurgeBg_14[], Tsa_PurgeBg_15[], Tsa_PurgeBg_16[], Tsa_PurgeBg_17[], Tsa_PurgeBg_18[],
    Tsa_PurgeBg_19[], Tsa_PurgeBg_1A[], Tsa_PurgeBg_1B[], Tsa_PurgeBg_1C[], Tsa_PurgeBg_1D[],
    Tsa_PurgeBg_1E[], Tsa_PurgeBg_1F[], Tsa_PurgeBg_20[], Tsa_PurgeBg_21[], Tsa_PurgeBg_22[],
    Tsa_PurgeBg_23[], Tsa_PurgeBg_24[], Tsa_PurgeBg_25[], Tsa_PurgeBg_26[], Tsa_PurgeBg_27[],
    Tsa_PurgeBg_28[], Tsa_PurgeBg_29[], Tsa_PurgeBg_2A[], Tsa_PurgeBg_2B[], Tsa_PurgeBg_2C[],
    Tsa_PurgeBg_2D[], Tsa_PurgeBg_2E[], Tsa_PurgeBg_2F[], Tsa_PurgeBg_30[], Tsa_PurgeBg_31[],
    Tsa_PurgeBg_32[], Tsa_PurgeBg_33[], Tsa_PurgeBg_34[], Tsa_PurgeBg_35[], Tsa_PurgeBg_36[],
    Tsa_PurgeBg_37[], Tsa_PurgeBg_38[], Tsa_PurgeBg_39[], Tsa_PurgeBg_3F[], Tsa_PurgeBg_40[],
    Tsa_PurgeBg_41[], Tsa_PurgeBg_42[], Tsa_PurgeBg_43[], Tsa_PurgeBg_44[], Tsa_PurgeBg_45[],
    Tsa_PurgeBg_46[], Tsa_PurgeBg_47[], Tsa_PurgeBg_48[], Tsa_PurgeBg_49[], Tsa_PurgeBg_4A[],
    Tsa_PurgeBg_4B[], Tsa_PurgeBg_4C[], Tsa_PurgeBg_4D[], gUnk_082215D0[], gUnk_082215F0[],
    gUnk_08262794[], gUnk_082627B4[];

extern const struct AnimSpriteData AnimSprite_EfxPurge_08BBB6AC[], AnimSprite_EfxPurge_08BBB6D0[],
    AnimSprite_EfxPurge_08BBB6F4[], AnimSprite_EfxPurge_08BBB718[], AnimSprite_EfxPurge_08BBB73C[],
    AnimSprite_EfxPurge_08BBB760[], AnimSprite_EfxPurge_08BBB784[], AnimSprite_EfxPurge_08BBB7A8[],
    AnimSprite_EfxPurge_08BBB7CC[], AnimSprite_EfxPurge_08BBB7F0[], AnimSprite_EfxPurge_08BBB808[],
    AnimSprite_EfxPurge_08BBB82C[], AnimSprite_EfxPurge_08BBB850[], AnimSprite_EfxPurge_08BBB874[],
    AnimSprite_EfxPurge_08BBB898[], AnimSprite_EfxPurge_08BBB8BC[], AnimSprite_EfxPurge_08BBB8E0[],
    AnimSprite_EfxPurge_08BBB904[], AnimSprite_EfxPurge_08BBB928[], AnimSprite_EfxPurge_08BBB94C[];

/* auto-decls */
void NewEfxSpellCast(void);
void NewEfxFarAttackWithDistance(struct Anim * anim, s16 arg);
void EfxPlayHittedSFX(struct Anim * anim);
void RegisterEfxSpellCastEnd(void);
extern const struct ProcCmd ProcScr_efxLightning[];
extern int gEfxBgSemaphore;
extern const struct ProcCmd ProcScr_efxLightningBG[];
extern u16 * const TsaArray_LightningBg[];
extern u16 * const ImgArray_LightningBg[];
extern u16 * const PalArray_LightningBg[];
extern const struct ProcCmd ProcScr_efxPurge[];
extern int gUnknown_02020038;
extern const struct ProcCmd ProcScr_efxPurgeBG[];
extern u16 * const TsaArray_PurgeBg[];
extern u16 * const ImgArray_PurgeBg[];
extern u16 * const PalArray_PurgeBg[];
extern const struct ProcCmd ProcScr_efxPurgeOBJRND[];
extern int gPurgeAnimSpriteCoordinates[];
extern const struct ProcCmd ProcScr_efxPurgeOBJ[];
extern const AnimScr AnimScr_EfxPurge[];
extern u16 Pal_PurgeSprites[];
extern u16 Img_PurgeSprites[];
#define TILEMAP_INDEX(aX, aY) (0x20 * (aY) + (aX))
#define TILEMAP_LOCATED(aMap, aX, aY) (TILEMAP_INDEX((aX), (aY)) + (aMap))

void StartSpellAnimLightning(struct Anim * anim);
void efxLightning_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxLightningBG(struct Anim * anim);
void efxLightningBG_Loop(struct ProcEfxBG * proc);
void StartSpellAnimPurge(struct Anim * anim);
void sub_0805A094(int location, int type);
void efxPurge_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxPurgeBG(struct Anim * anim);
void efxPurgeBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxPurgeOBJRND(struct Anim * anim);
void efxPurgeOBJRND_Loop(struct ProcEfxOBJ * proc);
void StartSubSpell_efxPurgeOBJ(struct Anim * anim, int x, int y);
void efxPurgeOBJ_OnEnd(struct ProcEfxOBJ * proc);

extern const u16 StartSubSpell_efxLightningBG_frames[];
extern const u16 StartSubSpell_efxPurgeBG_frames[];

// 9.99 efxmagic-light:StartSpellAnimLightning
void StartSpellAnimLightning(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxLightning, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

// 9.99 efxmagic-light:efxLightning_Loop_Main
void efxLightning_Loop_Main(struct ProcEfx * proc)
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
        PlaySFX(0x120, 0x100, anim->xPosition, 1);
        StartSubSpell_efxLightningBG(anim);
    }
    else if (proc->timer == duration + 26)
    {
        PlaySFX(0x00000121, 0x100, anim->xPosition, 1);
        NewEfxFlashBgWhite(proc->anim, 4);

        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if ((proc->timer != duration + 47) && (proc->timer == duration + 48))
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-light:StartSubSpell_efxLightningBG
void StartSubSpell_efxLightningBG(struct Anim * anim)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxLightningBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxLightningBG_frames;
    proc->tsal = TsaArray_LightningBg;
    proc->tsar = TsaArray_LightningBg;
    proc->img = ImgArray_LightningBg;
    proc->pal = PalArray_LightningBg;

    SpellFx_SetSomeColorEffect();

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

    return;
}

// 9.99 efxmagic-light:efxLightningBG_Loop
void efxLightningBG_Loop(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 * const * tsaL = proc->tsal;
        u16 * const * tsaR = proc->tsar;
        u16 * const * img = proc->img;
        u16 * const * pal = proc->pal;

        SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
        SpellFx_RegisterBgPal(*(pal + ret), PLTT_SIZE_4BPP);
        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));

        if (gEkrDistanceType != EKR_DISTANCE_CLOSE)
        {
            if (GetAnimPosition(proc->anim) == EKR_POS_L)
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
            Proc_End(proc);
        }
    }

    return;
}

// 9.99 efxmagic-light:StartSpellAnimPurge
void StartSpellAnimPurge(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxPurge, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    gUnknown_02020038 = 0;

    return;
}

// 9.99 efxmagic-light:sub_805FB24
void sub_0805A094(int location, int type)
{
    if (gUnknown_02020038 & 1)
    {
        PlaySFX(0xfe, 0x100, location, type);
    }
    else
    {
        PlaySFX(0xff, 0x100, location, type);
    }

    gUnknown_02020038++;

    return;
}

// 9.99 efxmagic-light:efxPurge_Loop_Main
void efxPurge_Loop_Main(struct ProcEfx * proc)
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
        NewEfxFlashBgWhite(anim, 4);
        StartSubSpell_efxPurgeBG(anim);
        StartSubSpell_efxPurgeOBJRND(anim);
        sub_0805A094(0x30, 0);
        return;
    }
    else if (proc->timer == duration + 21)
    {
        NewEfxFlashBgWhite(anim, 4);
        sub_0805A094(0xa0, 0);
        return;
    }
    else if (proc->timer == duration + 41)
    {
        NewEfxFlashBgWhite(anim, 4);
        sub_0805A094(0x70, 0);
        return;
    }

    if (proc->timer == duration + 61)
    {
        NewEfxFlashBgWhite(anim, 4);
        NewEfxALPHA(anim, 3, 10, 0, 16, 0);
        PlaySFX(0x100, 0x100, anim->xPosition, 1);
        return;
    }

    if (proc->timer == duration + 94)
    {
        NewEfxFlashBgWhite(anim, 4);
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        PlaySFX(0x101, 0x100, anim->xPosition, 1);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }

        return;
    }

    if (proc->timer == duration + 105)
    {
        NewEfxALPHA(anim, 0, 20, 8, 0, 0);
        return;
    }

    if (proc->timer != duration + 113)
    {
        return;
    }

    SpellFx_Finish();
    RegisterEfxSpellCastEnd();
    Proc_Break(proc);

    return;
}

// 9.99 efxmagic-light:StartSubSpell_efxPurgeBG
void StartSubSpell_efxPurgeBG(struct Anim * anim)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxPurgeBG, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxPurgeBG_frames;

    proc->tsal = TsaArray_PurgeBg;
    proc->tsar = TsaArray_PurgeBg;
    proc->img = ImgArray_PurgeBg;
    proc->pal = PalArray_PurgeBg;

    SpellFx_SetSomeColorEffect();

    return;
}

// 9.99 efxmagic-light:efxPurgeBG_Loop
void efxPurgeBG_Loop(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 * const * tsaL = proc->tsal;
        u16 * const * tsaR = proc->tsar;
        u16 * const * img = proc->img;
        u16 * const * pal = proc->pal;

        SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
        SpellFx_RegisterBgPal(*(pal + ret), PLTT_SIZE_4BPP);
        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
    }
    else
    {
        if (ret == -1)
        {
            SpellFx_ClearBG1();
            gEfxBgSemaphore--;
            SpellFx_ClearColorEffects();
            Proc_End(proc);
        }
    }

    return;
}

// 9.99 efxmagic-light:StartSubSpell_efxPurgeOBJRND
void StartSubSpell_efxPurgeOBJRND(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxPurgeOBJRND, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->unk44 = 7;
    proc->terminator = 0;
    proc->unk48 = 6;

    return;
}

// 9.99 efxmagic-light:efxPurgeOBJRND_Loop
void efxPurgeOBJRND_Loop(struct ProcEfxOBJ * proc)
{
    if (++proc->timer > proc->unk44)
    {
        int x;
        int y;

        proc->timer = 0;

        x = gPurgeAnimSpriteCoordinates[proc->terminator * 2];
        y = gPurgeAnimSpriteCoordinates[proc->terminator * 2 + 1];

        StartSubSpell_efxPurgeOBJ(proc->anim2, x, y);
        sub_0805A094(x, 1);

        if (++proc->terminator > proc->unk48)
        {
            gEfxBgSemaphore--;
            Proc_Break(proc);
        }
    }

    return;
}

// 9.99 efxmagic-light:StartSubSpell_efxPurgeOBJ
void StartSubSpell_efxPurgeOBJ(struct Anim * anim, int x, int y)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxPurgeOBJ, PROC_TREE_3);
    proc->anim = anim;

    frontAnim = EfxCreateFrontAnim(anim, AnimScr_EfxPurge, AnimScr_EfxPurge, AnimScr_EfxPurge, AnimScr_EfxPurge);

    proc->anim2 = frontAnim;
    frontAnim->xPosition = x;
    frontAnim->yPosition = y;

    SpellFx_RegisterObjPal(Pal_PurgeSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_PurgeSprites, 32 * 4 * CHR_SIZE);

    return;
}

// 9.99 efxmagic-light:efxPurgeOBJ_OnEnd
void efxPurgeOBJ_OnEnd(struct ProcEfxOBJ * proc)
{
    AnimDelete(proc->anim2);
    gEfxBgSemaphore--;

    return;
}

SECTION(".rodata.08BA2234")
const struct ProcCmd ProcScr_efxLightning[] = {
    PROC_19,
    PROC_REPEAT(efxLightning_Loop_Main),
    PROC_END,
};

SECTION(".rodata.08BA224C")
const struct ProcCmd ProcScr_efxLightningBG[] = {
    PROC_19,
    PROC_REPEAT(efxLightningBG_Loop),
    PROC_END,
};

SECTION(".rodata.08BA23F0")
const struct ProcCmd ProcScr_efxPurge[] = {
    PROC_19,
    PROC_REPEAT(efxPurge_Loop_Main),
    PROC_END,
};

SECTION(".rodata.08BA2408")
const struct ProcCmd ProcScr_efxPurgeBG[] = {
    PROC_19,
    PROC_REPEAT(efxPurgeBG_Loop),
    PROC_END,
};

SECTION(".rodata.08BA27C8")
const struct ProcCmd ProcScr_efxPurgeOBJRND[] = {
    PROC_19,
    PROC_REPEAT(efxPurgeOBJRND_Loop),
    PROC_SLEEP(69),
    PROC_END,
};

SECTION(".rodata.08BA2820")
const struct ProcCmd ProcScr_efxPurgeOBJ[] = {
    PROC_19,
    PROC_SET_END_CB(efxPurgeOBJ_OnEnd),
    PROC_SLEEP(69),
    PROC_END,
};

SECTION(".rodata.08BBB964")
const AnimScr AnimScr_EfxPurge[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxPurge_08BBB6AC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxPurge_08BBB6D0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxPurge_08BBB6F4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxPurge_08BBB718, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxPurge_08BBB73C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxPurge_08BBB760, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxPurge_08BBB784, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxPurge_08BBB7A8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxPurge_08BBB7CC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxPurge_08BBB7F0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxPurge_08BBB808, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxPurge_08BBB82C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxPurge_08BBB850, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxPurge_08BBB874, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxPurge_08BBB898, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxPurge_08BBB8BC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxPurge_08BBB8E0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxPurge_08BBB904, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxPurge_08BBB928, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxPurge_08BBB94C, 31),
    ANIMSCR_WAIT(0x13),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BA2264")
u16 * const ImgArray_LightningBg[] = {
    Img_LightningBg_00,
    Img_LightningBg_00,
    Img_LightningBg_00,
    Img_LightningBg_03,
    Img_LightningBg_03,
    Img_LightningBg_03,
    Img_LightningBg_06,
    Img_LightningBg_06,
    Img_LightningBg_06,
    Img_LightningBg_06,
    Img_LightningBg_0A,
    Img_LightningBg_0A,
    Img_LightningBg_0A,
    Img_LightningBg_0D,
    Img_LightningBg_0D,
    Img_LightningBg_0D,
    Img_LightningBg_10,
    Img_LightningBg_10,
    Img_LightningBg_10,
    Img_LightningBg_10,
    Img_LightningBg_10,
    Img_LightningBg_10,
    Img_LightningBg_10,
    Img_LightningBg_10,
    Img_LightningBg_10,
    Img_LightningBg_19,
    Img_LightningBg_19,
    Img_LightningBg_19,
    Img_LightningBg_1C,
    Img_LightningBg_1C,
    Img_LightningBg_1C,
    Img_LightningBg_1C,
    Img_LightningBg_1C,
};

SECTION(".rodata.08BA22E8")
u16 * const PalArray_LightningBg[] = {
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215F0,
    gUnk_082215F0,
    gUnk_082215F0,
    gUnk_082215F0,
    gUnk_082215F0,
    gUnk_082215F0,
    gUnk_082215F0,
    gUnk_082215F0,
};

SECTION(".rodata.08BA236C")
u16 * const TsaArray_LightningBg[] = {
    Tsa_LightningBg_00,
    Tsa_LightningBg_01,
    Tsa_LightningBg_02,
    Tsa_LightningBg_03,
    Tsa_LightningBg_04,
    Tsa_LightningBg_05,
    Tsa_LightningBg_06,
    Tsa_LightningBg_07,
    Tsa_LightningBg_08,
    Tsa_LightningBg_09,
    Tsa_LightningBg_0A,
    Tsa_LightningBg_0B,
    Tsa_LightningBg_0C,
    Tsa_LightningBg_0D,
    Tsa_LightningBg_0E,
    Tsa_LightningBg_0F,
    Tsa_LightningBg_10,
    Tsa_LightningBg_11,
    Tsa_LightningBg_12,
    Tsa_LightningBg_13,
    Tsa_LightningBg_14,
    Tsa_LightningBg_15,
    Tsa_LightningBg_16,
    Tsa_LightningBg_17,
    Tsa_LightningBg_18,
    Tsa_LightningBg_19,
    Tsa_LightningBg_1A,
    Tsa_LightningBg_1B,
    Tsa_LightningBg_1C,
    Tsa_LightningBg_1D,
    Tsa_LightningBg_1E,
    Tsa_LightningBg_1F,
    Tsa_LightningBg_20,
};

SECTION(".rodata.08BA2420")
u16 * const ImgArray_PurgeBg[] = {
    Img_LightningBg_00,
    Img_LightningBg_00,
    Img_LightningBg_00,
    Img_LightningBg_03,
    Img_LightningBg_03,
    Img_LightningBg_03,
    Img_LightningBg_06,
    Img_LightningBg_06,
    Img_LightningBg_06,
    Img_LightningBg_06,
    Img_LightningBg_0A,
    Img_LightningBg_0A,
    Img_LightningBg_0A,
    Img_LightningBg_0D,
    Img_LightningBg_0D,
    Img_LightningBg_0D,
    Img_LightningBg_00,
    Img_LightningBg_00,
    Img_LightningBg_00,
    Img_LightningBg_03,
    Img_LightningBg_03,
    Img_LightningBg_03,
    Img_LightningBg_06,
    Img_LightningBg_06,
    Img_LightningBg_06,
    Img_LightningBg_06,
    Img_LightningBg_0A,
    Img_LightningBg_0A,
    Img_LightningBg_0A,
    Img_LightningBg_0D,
    Img_LightningBg_0D,
    Img_LightningBg_0D,
    Img_LightningBg_00,
    Img_LightningBg_00,
    Img_LightningBg_00,
    Img_LightningBg_03,
    Img_LightningBg_03,
    Img_LightningBg_03,
    Img_LightningBg_06,
    Img_LightningBg_06,
    Img_LightningBg_06,
    Img_LightningBg_06,
    Img_LightningBg_0A,
    Img_LightningBg_0A,
    Img_LightningBg_0A,
    Img_LightningBg_0D,
    Img_LightningBg_0D,
    Img_LightningBg_0D,
    Img_PurgeBg_30,
    Img_PurgeBg_30,
    Img_PurgeBg_32,
    Img_PurgeBg_32,
    Img_PurgeBg_34,
    Img_PurgeBg_34,
    Img_PurgeBg_36,
    Img_PurgeBg_36,
    Img_PurgeBg_38,
    Img_PurgeBg_38,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    Img_PurgeBg_3F,
    Img_PurgeBg_40,
    Img_PurgeBg_41,
    Img_PurgeBg_42,
    Img_PurgeBg_43,
    Img_PurgeBg_44,
    Img_PurgeBg_44,
    Img_PurgeBg_46,
    Img_PurgeBg_46,
    Img_PurgeBg_48,
    Img_PurgeBg_49,
    Img_PurgeBg_4A,
    Img_PurgeBg_4B,
    Img_PurgeBg_4C,
    Img_PurgeBg_4D,
};

SECTION(".rodata.08BA2558")
u16 * const PalArray_PurgeBg[] = {
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_08262794,
    gUnk_08262794,
    gUnk_08262794,
    gUnk_08262794,
    gUnk_08262794,
    gUnk_08262794,
    gUnk_08262794,
    gUnk_08262794,
    gUnk_08262794,
    gUnk_08262794,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    gUnk_082627B4,
    gUnk_082627B4,
    gUnk_082627B4,
    gUnk_082627B4,
    gUnk_082627B4,
    gUnk_082627B4,
    gUnk_082627B4,
    gUnk_082627B4,
    gUnk_082627B4,
    gUnk_082627B4,
    gUnk_082627B4,
    gUnk_082627B4,
    gUnk_082627B4,
    gUnk_082627B4,
    gUnk_082627B4,
};

SECTION(".rodata.08BA2690")
u16 * const TsaArray_PurgeBg[] = {
    Tsa_PurgeBg_00,
    Tsa_PurgeBg_01,
    Tsa_PurgeBg_02,
    Tsa_PurgeBg_03,
    Tsa_PurgeBg_04,
    Tsa_PurgeBg_05,
    Tsa_PurgeBg_06,
    Tsa_PurgeBg_07,
    Tsa_PurgeBg_08,
    Tsa_PurgeBg_09,
    Tsa_PurgeBg_0A,
    Tsa_PurgeBg_0B,
    Tsa_PurgeBg_0C,
    Tsa_PurgeBg_0D,
    Tsa_PurgeBg_0E,
    Tsa_PurgeBg_0F,
    Tsa_PurgeBg_10,
    Tsa_PurgeBg_11,
    Tsa_PurgeBg_12,
    Tsa_PurgeBg_13,
    Tsa_PurgeBg_14,
    Tsa_PurgeBg_15,
    Tsa_PurgeBg_16,
    Tsa_PurgeBg_17,
    Tsa_PurgeBg_18,
    Tsa_PurgeBg_19,
    Tsa_PurgeBg_1A,
    Tsa_PurgeBg_1B,
    Tsa_PurgeBg_1C,
    Tsa_PurgeBg_1D,
    Tsa_PurgeBg_1E,
    Tsa_PurgeBg_1F,
    Tsa_PurgeBg_20,
    Tsa_PurgeBg_21,
    Tsa_PurgeBg_22,
    Tsa_PurgeBg_23,
    Tsa_PurgeBg_24,
    Tsa_PurgeBg_25,
    Tsa_PurgeBg_26,
    Tsa_PurgeBg_27,
    Tsa_PurgeBg_28,
    Tsa_PurgeBg_29,
    Tsa_PurgeBg_2A,
    Tsa_PurgeBg_2B,
    Tsa_PurgeBg_2C,
    Tsa_PurgeBg_2D,
    Tsa_PurgeBg_2E,
    Tsa_PurgeBg_2F,
    Tsa_PurgeBg_30,
    Tsa_PurgeBg_31,
    Tsa_PurgeBg_32,
    Tsa_PurgeBg_33,
    Tsa_PurgeBg_34,
    Tsa_PurgeBg_35,
    Tsa_PurgeBg_36,
    Tsa_PurgeBg_37,
    Tsa_PurgeBg_38,
    Tsa_PurgeBg_39,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    Tsa_PurgeBg_3F,
    Tsa_PurgeBg_40,
    Tsa_PurgeBg_41,
    Tsa_PurgeBg_42,
    Tsa_PurgeBg_43,
    Tsa_PurgeBg_44,
    Tsa_PurgeBg_45,
    Tsa_PurgeBg_46,
    Tsa_PurgeBg_47,
    Tsa_PurgeBg_48,
    Tsa_PurgeBg_49,
    Tsa_PurgeBg_4A,
    Tsa_PurgeBg_4B,
    Tsa_PurgeBg_4C,
    Tsa_PurgeBg_4D,
};
