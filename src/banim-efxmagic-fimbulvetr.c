#include "gbafe.h"

/* auto-decls */
void NewEfxSpellCast(void);
void NewEfxFarAttackWithDistance(struct Anim * anim, s16 arg);
void EfxPlayHittedSFX(struct Anim * anim);
void RegisterEfxSpellCastEnd(void);
extern struct ProcCmd ProcScr_efxFimbulvetr[];
extern int gEfxBgSemaphore;
extern struct ProcCmd ProcScr_efxFimbulvetrBGTR[];
extern u16 * TsaArray_FimbulvetrBg_Tornado[];
extern u16 * ImgArray_FimbulvetrBg_Tornado[];
extern u16 Pal_FimbulvetrBg_Tornado[];
extern struct ProcCmd ProcScr_efxFimbulvetrBG[];
extern u16 * TsaArray_FimbulvetrBg[];
extern u16 * ImgArray_FimbulvetrBg[];
extern u16 Pal_FimbulvetrBg[];
extern struct ProcCmd ProcScr_efxFimbulvetrOBJ[];
extern u32 AnimScr_FimbulvetrOBJ1[];
extern u16 Pal_HealSprites_Sparkles[];
extern u16 Img_FimbulvetrSprites_Snow[];
extern struct ProcCmd ProcScr_efxFimbulvetrOBJ2[];
extern struct ProcCmd ProcScr_efxFimbulvetrOBJ2Fall[];
extern u8 AnimScr_FimbulvetrOBJ2[];
extern u32 AnimScr_FimbulvetrOBJ2Fall_TypeA[];
extern u32 AnimScr_FimbulvetrOBJ2Fall_TypeB[];

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
