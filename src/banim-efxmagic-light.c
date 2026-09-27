#include "gbafe.h"

/* auto-decls */
void NewEfxSpellCast(void);
void NewEfxFarAttackWithDistance(struct Anim * anim, s16 arg);
void EfxPlayHittedSFX(struct Anim * anim);
void RegisterEfxSpellCastEnd(void);
extern struct ProcCmd ProcScr_efxLightning[];
extern int gEfxBgSemaphore;
extern struct ProcCmd ProcScr_efxLightningBG[];
extern u16 * TsaArray_LightningBg[];
extern u16 * ImgArray_LightningBg[];
extern u16 * PalArray_LightningBg[];
extern struct ProcCmd ProcScr_efxPurge[];
extern int gUnknown_02020038;
extern struct ProcCmd ProcScr_efxPurgeBG[];
extern u16 * TsaArray_PurgeBg[];
extern u16 * ImgArray_PurgeBg[];
extern u16 * PalArray_PurgeBg[];
extern struct ProcCmd ProcScr_efxPurgeOBJRND[];
extern int gPurgeAnimSpriteCoordinates[];
extern struct ProcCmd ProcScr_efxPurgeOBJ[];
extern u32 AnimScr_EfxPurge[];
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
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;
        u16 ** pal = proc->pal;

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
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;
        u16 ** pal = proc->pal;

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
