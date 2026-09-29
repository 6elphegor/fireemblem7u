#include "gbafe.h"

/* auto-decls */
void NewEfxSpellCast(void);
void NewEfxFarAttackWithDistance(struct Anim * anim, s16 arg);
ProcPtr NewefxRestRST(struct Anim *anim, int unk44, int unk48, int frame, int speed);
void EfxPlayHittedSFX(struct Anim * anim);
void RegisterEfxSpellCastEnd(void);
extern const struct ProcCmd ProcScr_efxFenrir[];
extern int gEfxBgSemaphore;
extern const struct ProcCmd ProcScr_efxFenrirBG[];
extern u16 Img_FenrirBg_Sigils[];
extern u16 Tsa_FenrirBg_Sigils[];
extern const struct ProcCmd ProcScr_efxFenrirBGCOL[];
extern u16 Pal_EfxFenrirBGCOL[];
extern const struct ProcCmd ProcScr_efxFenrirOBJ[];
extern u32 AnimScr_EfxFenrir3[];
extern u16 Pal_FenrirSprites_A[];
extern u16 Img_FenrirSprites[];
extern const struct ProcCmd ProcScr_efxFenrirBG2[];
extern u16 * TsaArray_FenrirBg[];
extern u16 * ImgArray_FenrirBg[];
extern u16 Pal_FenrirBg[];
extern const u16 FrameConfig_AnimaHitBG[];
extern u16 * TsaLut_AnimaHitBG[];
extern u16 * ImgLut_AnimaHitBG[];
extern u16 Pal_EfxFenrirBG2_B[];
extern const struct ProcCmd ProcScr_efxFenrirOBJ2[];
extern u16 Pal_FenrirSprites_B[];
extern const struct ProcCmd ProcScr_efxFenrirOBJ2Chiri[];
extern int gFenrirSpriteAngles[];
extern u32 AnimScr_EfxFenrir1[];
extern u32 AnimScr_EfxFenrir2[];
#define TILEMAP_INDEX(aX, aY) (0x20 * (aY) + (aX))
#define TILEMAP_LOCATED(aMap, aX, aY) (TILEMAP_INDEX((aX), (aY)) + (aMap))

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

void StartSpellAnimFenrir(struct Anim * anim);
void efxFenrir_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxFenrirBG(struct Anim * anim, int terminator);
void efxFenrirBG_OnEnd(void);
void efxFenrirBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxFenrirBGCOL(struct Anim * anim, int terminator);
void efxFenrirBGCOL_OnEnd(void);
void efxFenrirBGCOL_Loop(struct ProcEfxBGCOL * proc);
void StartSubSpell_efxFenrirOBJ(struct Anim * anim, int terminator);
void efxFenrirOBJ_Loop(struct ProcEfxOBJ * proc);
void StartSubSpell_efxFenrirBG2_A(struct Anim * anim);
void StartSubSpell_efxFenrirBG2_B(struct Anim * anim);
void efxFenrirBG2_Loop(struct ProcEfxEclipseBG * proc);
void StartSubSpell_efxFenrirOBJ2(struct Anim * anim);
void efxFenrirOBJ2_Loop(struct ProcEfxOBJ * proc);
void StartSubSpell_efxFenrirOBJ2Chiri(struct Anim * anim, int idx);
void efxFenrirOBJ2Chiri_Loop(struct ProcEfxOBJ * proc);

extern const u16 StartSubSpell_efxFenrirBGCOL_frames[];
extern const u16 StartSubSpell_efxFenrirBG2_A_frames[];

// 9.99 efxmagic-fenrir:StartSpellAnimFenrir
void StartSpellAnimFenrir(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxFenrir, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

// 9.99 efxmagic-fenrir:efxFenrir_Loop_Main
void efxFenrir_Loop_Main(struct ProcEfx * proc)
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
        StartSubSpell_efxFenrirBG(anim, 100);
        StartSubSpell_efxFenrirBGCOL(anim, 100);

        NewefxRestRST(anim, 100, 2, 0x100, 1);
        NewEfxRestWINH_(anim, 105, 0);

        SetBlendAlpha(0, 16);

        NewEfxALPHA(anim, 0, 15, 0, 16, 0);
        NewEfxALPHA(anim, 70, 15, 16, 0, 0);

        PlaySFX(0x130, 0x100, 120, 0);

        return;
    }

    if (proc->timer == duration + 40)
    {
        StartSubSpell_efxFenrirOBJ(anim, 74);
        PlaySFX(0x131, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 110)
    {
        StartSubSpell_efxFenrirBG2_A(anim);
    }
    else if (proc->timer == duration + 111)
    {
        PlaySFX(0x132, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 125)
    {
        PlaySFX(0x132, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 139)
    {
        PlaySFX(0x132, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 153)
    {
        PlaySFX(0x132, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 167)
    {
        PlaySFX(0x132, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 181)
    {
        PlaySFX(0x132, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 195)
    {
        PlaySFX(0x132, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 209)
    {
        PlaySFX(0x132, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 238)
    {
        NewEfxFlashBgWhite(anim, 10);
        StartSubSpell_efxFenrirOBJ2(anim);

        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);
        PlaySFX(0x133, 0x100, anim->xPosition, 1);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (proc->timer == duration + 248)
    {
        StartSubSpell_efxFenrirBG2_B(anim);
        NewEfxALPHA(anim, 18, 8, 16, 0, 0);
    }
    else if ((proc->timer != duration + 290) && (proc->timer == duration + 300))
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-fenrir:StartSubSpell_efxFenrirBG
void StartSubSpell_efxFenrirBG(struct Anim * anim, int terminator)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFenrirBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;

    SpellFx_RegisterBgGfx(Img_FenrirBg_Sigils, 32 * 8 * CHR_SIZE);
    SpellFx_ClearBG1();

    LZ77UnCompWram(Tsa_FenrirBg_Sigils, gEkrTsaBuffer);
    EfxTmCpyBG(gEkrTsaBuffer, gBg1Tm, 0x20, 0x20, 1, 0x100);

    EnableBgSync(2);

    SpellFx_SetSomeColorEffect();

    SetWinEnable(0, 0, 0);

    return;
}

// 9.99 efxmagic-fenrir:efxFenrirBG_OnEnd
void efxFenrirBG_OnEnd(void)
{
    SpellFx_ClearBG1();
    gEfxBgSemaphore--;
    SpellFx_ClearColorEffects();
    return;
}

// 9.99 efxmagic-fenrir:efxFenrirBG_Loop
void efxFenrirBG_Loop(struct ProcEfxBG * proc)
{
    gDispIo.bg_off[BG_1].y++;
    gDispIo.bg_off[BG_1].x--;

    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-fenrir:StartSubSpell_efxFenrirBGCOL
void StartSubSpell_efxFenrirBGCOL(struct Anim * anim, int terminator)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFenrirBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->timer2 = 0;
    proc->terminator = terminator;

    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxFenrirBGCOL_frames;

    proc->pal = Pal_EfxFenrirBGCOL;
    SpellFx_RegisterBgPal(Pal_EfxFenrirBGCOL, PLTT_SIZE_4BPP);

    return;
}

// 9.99 efxmagic-fenrir:efxFenrirBGCOL_OnEnd
void efxFenrirBGCOL_OnEnd(void)
{
    gEfxBgSemaphore--;
    return;
}

// 9.99 efxmagic-fenrir:efxFenrirBGCOL_Loop
void efxFenrirBGCOL_Loop(struct ProcEfxBGCOL * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret > -1)
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

// 9.99 efxmagic-fenrir:StartSubSpell_efxFenrirOBJ
void StartSubSpell_efxFenrirOBJ(struct Anim * anim, int terminator)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFenrirOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;

    proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_EfxFenrir3, AnimScr_EfxFenrir3, AnimScr_EfxFenrir3, AnimScr_EfxFenrir3);

    SpellFx_RegisterObjPal(Pal_FenrirSprites_A, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_FenrirSprites, 32 * 4 * CHR_SIZE);

    return;
}

// 9.99 efxmagic-fenrir:efxFenrirOBJ_Loop
void efxFenrirOBJ_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-fenrir:StartSubSpell_efxFenrirBG2_A
void StartSubSpell_efxFenrirBG2_A(struct Anim * anim)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFenrirBG2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxFenrirBG2_A_frames;

    proc->tsal = TsaArray_FenrirBg;
    proc->tsar = TsaArray_FenrirBg;
    proc->img = ImgArray_FenrirBg;
    proc->pal = NULL;

    SpellFx_RegisterBgPal(Pal_FenrirBg, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    SetBgOffset(BG_1, 0, 0);

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

// 9.99 efxmagic-fenrir:StartSubSpell_efxFenrirBG2_B
void StartSubSpell_efxFenrirBG2_B(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFenrirBG2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = FrameConfig_AnimaHitBG;

    proc->tsal = TsaLut_AnimaHitBG;
    proc->tsar = TsaLut_AnimaHitBG;
    proc->img = ImgLut_AnimaHitBG;
    proc->pal = NULL;

    SpellFx_RegisterBgPal(Pal_EfxFenrirBG2_B, PLTT_SIZE_4BPP);
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

// 9.99 efxmagic-fenrir:efxFenrirBG2_Loop
void efxFenrirBG2_Loop(struct ProcEfxEclipseBG * proc)
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

// 9.99 efxmagic-fenrir:StartSubSpell_efxFenrirOBJ2
void StartSubSpell_efxFenrirOBJ2(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFenrirOBJ2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0;
    proc->unk44 = 0;

    SpellFx_RegisterObjPal(Pal_FenrirSprites_B, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_FenrirSprites, 32 * 4 * CHR_SIZE);

    return;
}

// 9.99 efxmagic-fenrir:efxFenrirOBJ2_Loop
void efxFenrirOBJ2_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == 2)
    {
        proc->timer = 0;

        StartSubSpell_efxFenrirOBJ2Chiri(proc->anim, proc->unk44++);

        proc->terminator++;

        if (proc->terminator == 8)
        {
            gEfxBgSemaphore--;
            Proc_Break(proc);
        }
    }

    return;
}

// 9.99 efxmagic-fenrir:StartSubSpell_efxFenrirOBJ2Chiri
void StartSubSpell_efxFenrirOBJ2Chiri(struct Anim * anim, int idx)
{
    struct ProcEfxOBJ * proc;
    struct Anim * otherAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFenrirOBJ2Chiri, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 30;

    proc->unk44 = gFenrirSpriteAngles[idx & 7];

    otherAnim = NULL;

    switch (idx & 1)
    {
        case 0:
            otherAnim = AnimCreate(AnimScr_EfxFenrir1, 120);
            proc->anim2 = otherAnim;

            break;

        case 1:
            otherAnim = AnimCreate(AnimScr_EfxFenrir2, 120);
            proc->anim2 = otherAnim;

            break;
    }

    otherAnim->oam2Base = OAM2_CHR(0x40) + OAM2_LAYER(2) + OAM2_PAL(2);

    otherAnim->xPosition = anim->xPosition;
    proc->unk32 = anim->xPosition;

    otherAnim->yPosition = anim->yPosition;
    proc->unk3A = anim->yPosition;

    return;
}

// 9.99 efxmagic-fenrir:efxFenrirOBJ2Chiri_Loop
void efxFenrirOBJ2Chiri_Loop(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    int ret = Interpolate(INTERPOLATE_LINEAR, 0, 300, proc->timer, proc->terminator);

    int x = ret * gSinLut[proc->unk44];
    int y = ret * gSinLut[proc->unk44 + 64];

    anim->xPosition = (x >> 12) + proc->unk32;
    anim->yPosition = (y >> 12) + proc->unk3A;

    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}

SECTION(".rodata.08BA2DF8")
const struct ProcCmd ProcScr_efxFenrir[] = {
    PROC_19,
    PROC_REPEAT(efxFenrir_Loop_Main),
    PROC_END,
};

SECTION(".rodata.08BA2E10")
const struct ProcCmd ProcScr_efxFenrirBG[] = {
    PROC_19,
    PROC_SET_END_CB(efxFenrirBG_OnEnd),
    PROC_REPEAT(efxFenrirBG_Loop),
    PROC_END,
};

SECTION(".rodata.08BA2E30")
const struct ProcCmd ProcScr_efxFenrirBGCOL[] = {
    PROC_19,
    PROC_MARK(10),
    PROC_SET_END_CB(efxFenrirBGCOL_OnEnd),
    PROC_REPEAT(efxFenrirBGCOL_Loop),
    PROC_END,
};

SECTION(".rodata.08BA2E58")
const struct ProcCmd ProcScr_efxFenrirOBJ[] = {
    PROC_19,
    PROC_REPEAT(efxFenrirOBJ_Loop),
    PROC_END,
};

SECTION(".rodata.08BA2E70")
const struct ProcCmd ProcScr_efxFenrirBG2[] = {
    PROC_19,
    PROC_REPEAT(efxFenrirBG2_Loop),
    PROC_END,
};

SECTION(".rodata.08BA3020")
const struct ProcCmd ProcScr_efxFenrirOBJ2[] = {
    PROC_19,
    PROC_REPEAT(efxFenrirOBJ2_Loop),
    PROC_END,
};

SECTION(".rodata.08BA3038")
const struct ProcCmd ProcScr_efxFenrirOBJ2Chiri[] = {
    PROC_19,
    PROC_REPEAT(efxFenrirOBJ2Chiri_Loop),
    PROC_END,
};
