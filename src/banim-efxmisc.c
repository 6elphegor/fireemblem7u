#include "gbafe.h"

/**
 * Misc banim effects (fireemblem8u: banim-efxmisc.c)
 */

extern int gEfxBgSemaphore;
extern s16 gEfxSpecalEffectExist[2];
extern s16 gBanimTerrain[2];
extern struct Anim * gUnknown_02000010[2];

void EfxYushaSpinShieldMain(struct ProcEfx * proc);
void NewEfxYushaSpinShieldOBJ(struct Anim * anim, int type);
void efxYushaSpinShieldOBJ_806CD14(struct ProcEfxOBJ * proc);
void efxYushaSpinShieldOBJ_806CD7C(struct ProcEfxOBJ * proc);
void efxYushaSpinShieldOBJ_806CDA4(struct ProcEfxOBJ * proc);
void efxYushaSpinShieldOBJ_806CE08(struct ProcEfxOBJ * proc);
void EfxHurtmutEff00Main(struct ProcEfx * proc);
void NewEfxHurtmutEff00OBJ(struct Anim * anim);
void efxHurtmutEff00OBJ_806CEC4(struct ProcEfxOBJ * proc);
void efxHurtmutEff00OBJ_806CF10(struct ProcEfxOBJ * proc);
void efxHurtmutEff00OBJ_806CF5C(struct ProcEfxOBJ * proc);
void NewEfxHurtmutEff01OBJ(struct Anim * anim);
void efxHurtmutEff01OBJ_806CFC4(struct ProcEfxOBJ * proc);
void efxHurtmutEff01OBJ_806D010(struct ProcEfxOBJ * proc);
void efxHurtmutEff01OBJ_806D05C(struct ProcEfxOBJ * proc);
void EfxMagfcastMain(struct ProcEfx * proc);
void NewEfxMagfcastBG(struct Anim * anim, u32 type);
void EfxMagfcastBGMain(struct ProcEfxBG * proc);
void EfxSunakemuriMain(struct ProcEfx * proc);
void NewEfxSunakemuriOBJ(struct Anim * anim, int type);
void EfxSunakemuriOBJMain(struct ProcEfxOBJ * proc);
void EfxLokmsunaMain(struct ProcEfx * proc);
void NewEfxLokmsunaOBJ(struct Anim * anim);
void EfxLokmsunaIOBJMain(struct ProcEfxOBJ * proc);
void EfxKingPikaMain(struct ProcEfx * proc);
void EfxFlashFXMain(struct ProcEfx * proc);
void NewEfxSongOBJ2(struct Anim * anim);
void EfxSongOBJ2Main(struct ProcEfxOBJ * proc);
void NewEfxDanceOBJ(struct Anim * anim);
void EfxDanceOBJMain(struct ProcEfxOBJ * proc);
void EfxSpecalEffectMain(ProcPtr proc);
void NewEfxSRankWeaponEffect(struct Anim * anim);
void EfxSRankWeaponEffectMain(struct ProcEfx * proc);
void NewEfxSRankWeaponEffectBG(struct Anim * anim);
void EfxSRankWeaponEffectBGMain(struct ProcEfxBG * proc);
void NewEfxSRankWeaponEffectSCR(void);
void EfxSRankWeaponEffectSCRMain(struct ProcEfx * proc);
void NewEfxSRankWeaponEffectSCR2(struct ProcEfx * seff_scr);
void NewEfxMagdhisEffect(struct Anim * anim);
void EfxMagdhisEffectMain(struct ProcEfx * proc);
void NewEfxMagdhisEffectBG(struct Anim * anim, int duration);
void EfxMagdhisEffectBGMain(struct ProcEfxBG * proc);
void EfxMantBatabata_Loop1(struct ProcEfxOBJ * proc);
void EfxMantBatabata_Loop2(struct ProcEfxOBJ * proc);
void EfxChillEffectMain(struct ProcEfx * proc);
void NewEfxChillEffectBG(struct Anim * anim);
void EfxChillEffectBGMain(struct ProcEfxBG * proc);
void NewEfxChillEffectBGCOL(struct Anim * anim);
void EfxChillEffectBGCOL_Loop(struct ProcEfxBGCOL * proc);
void EfxChillAnime_Loop(struct ProcEfxOBJ * proc);

extern struct ProcCmd ProcScr_efxYushaSpinShield[];
extern struct ProcCmd ProcScr_efxYushaSpinShieldOBJ[];
extern const AnimScr AnimScr_YushaSpinShieldOBJ_LeftTypeA[];
extern const AnimScr AnimScr_YushaSpinShieldOBJ_RightTypeA[];
extern const AnimScr AnimScr_YushaSpinShieldOBJ_LeftTypeB[];
extern const AnimScr AnimScr_YushaSpinShieldOBJ_RightTypeB[];
extern const AnimScr AnimScr_YushaSpinShieldOBJ2_LeftTypeA[];
extern const AnimScr AnimScr_YushaSpinShieldOBJ2_RightTypeA[];
extern const AnimScr AnimScr_YushaSpinShieldOBJ2_LeftTypeB[];
extern const AnimScr AnimScr_YushaSpinShieldOBJ2_RightTypeB[];
extern const AnimScr AnimScr_YushaSpinShieldOBJ3_LeftTypeA[];
extern const AnimScr AnimScr_YushaSpinShieldOBJ3_RightTypeA[];
extern const AnimScr AnimScr_YushaSpinShieldOBJ3_LeftTypeB[];
extern const AnimScr AnimScr_YushaSpinShieldOBJ3_RightTypeB[];

extern struct ProcCmd ProcScr_efxHurtmutEff00[];
extern struct ProcCmd ProcScr_efxHurtmutEff00OBJ[];
extern struct ProcCmd ProcScr_efxHurtmutEff01OBJ[];
extern const AnimScr FramScr_Unk5D4F90[];
extern const AnimScr AnimScr_HurtmutEff00OBJ1_Right[];
extern const AnimScr AnimScr_HurtmutEff00OBJ1_Left[];
extern const AnimScr AnimScr_HurtmutEff00OBJ2_Right[];
extern const AnimScr AnimScr_HurtmutEff00OBJ2_Left[];
extern const AnimScr AnimScr_HurtmutEff01OBJ1_Right[];
extern const AnimScr AnimScr_HurtmutEff01OBJ1_Left[];
extern const AnimScr AnimScr_HurtmutEff01OBJ2_Right[];
extern const AnimScr AnimScr_HurtmutEff01OBJ2_Left[];
extern const u16 Pal_EfxHurtmutEff00OBJ[];
extern const u8 Img_EfxHurtmutEff00OBJ1[];
extern const u8 Img_EfxHurtmutEff00OBJ2[];

/**
 * C26: banim_code_toss_sword
 * C27: banim_code_toss_shield
 */
void NewEfxYushaSpinShield(struct Anim * anim, int type)
{
    struct ProcEfx * proc;
    proc = Proc_Start(ProcScr_efxYushaSpinShield, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    NewEfxYushaSpinShieldOBJ(anim, type);
}

void EfxYushaSpinShieldMain(struct ProcEfx * proc)
{
    Proc_Break(proc);
}

void NewEfxYushaSpinShieldOBJ(struct Anim * anim, int type)
{
    const AnimScr * scr1;
    const AnimScr * scr2;
    struct ProcEfxOBJ * proc;
    struct Anim * anim2;

    proc = Proc_Start(ProcScr_efxYushaSpinShieldOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->unk29 = type;

    if (type == 0)
    {
        scr1 = AnimScr_YushaSpinShieldOBJ_LeftTypeA;
        scr2 = AnimScr_YushaSpinShieldOBJ_RightTypeA;
    }
    else
    {
        scr1 = AnimScr_YushaSpinShieldOBJ_LeftTypeB;
        scr2 = AnimScr_YushaSpinShieldOBJ_RightTypeB;
    }

    anim2 = EfxCreateFrontAnim(anim, scr2, scr1, scr2, scr1);
    proc->anim2 = anim2;

    anim2->oam2Base &= 0xC00;

    if (GetAnimPosition(anim) == EKR_POS_L)
        anim2->oam2Base |= 0x7200;
    else
        anim2->oam2Base |= 0x9300;
}

void efxYushaSpinShieldOBJ_806CD14(struct ProcEfxOBJ * proc)
{
    struct Anim * anim2 = proc->anim2;

    if (++proc->timer != 0x45)
        return;

    if (proc->unk29 == 0)
    {
        if (GetAnimPosition(proc->anim) == EKR_POS_L)
        {
            anim2->pScrStart = AnimScr_YushaSpinShieldOBJ2_LeftTypeA;
            anim2->pScrCurrent = AnimScr_YushaSpinShieldOBJ2_LeftTypeA;
        }
        else
        {
            anim2->pScrStart = AnimScr_YushaSpinShieldOBJ2_RightTypeA;
            anim2->pScrCurrent = AnimScr_YushaSpinShieldOBJ2_RightTypeA;
        }
    }
    else
    {
        if (GetAnimPosition(proc->anim) == EKR_POS_L)
        {
            anim2->pScrStart = AnimScr_YushaSpinShieldOBJ2_LeftTypeB;
            anim2->pScrCurrent = AnimScr_YushaSpinShieldOBJ2_LeftTypeB;
        }
        else
        {
            anim2->pScrStart = AnimScr_YushaSpinShieldOBJ2_RightTypeB;
            anim2->pScrCurrent = AnimScr_YushaSpinShieldOBJ2_RightTypeB;
        }
    }

    anim2->timer = 0;
    proc->timer = 0;
    Proc_Break(proc);
}

void efxYushaSpinShieldOBJ_806CD7C(struct ProcEfxOBJ * proc)
{
    if (!(proc->anim->state3 & ANIM_BIT3_C01_BLOCKING_IN_BATTLE))
        return;

    if (!(proc->anim->state3 & ANIM_BIT3_HIT_EFFECT_APPLIED))
        return;

    proc->timer = 0;
    Proc_Break(proc);
}

void efxYushaSpinShieldOBJ_806CDA4(struct ProcEfxOBJ * proc)
{
    struct Anim * anim2 = proc->anim2;

    if (CheckEkrHitDone() != true)
        return;

    if (proc->unk29 == 0)
    {
        if (GetAnimPosition(proc->anim) == EKR_POS_L)
        {
            anim2->pScrStart = AnimScr_YushaSpinShieldOBJ3_LeftTypeA;
            anim2->pScrCurrent = AnimScr_YushaSpinShieldOBJ3_LeftTypeA;
        }
        else
        {
            anim2->pScrStart = AnimScr_YushaSpinShieldOBJ3_RightTypeA;
            anim2->pScrCurrent = AnimScr_YushaSpinShieldOBJ3_RightTypeA;
        }
    }
    else
    {
        if (GetAnimPosition(proc->anim) == EKR_POS_L)
        {
            anim2->pScrStart = AnimScr_YushaSpinShieldOBJ3_LeftTypeB;
            anim2->pScrCurrent = AnimScr_YushaSpinShieldOBJ3_LeftTypeB;
        }
        else
        {
            anim2->pScrStart = AnimScr_YushaSpinShieldOBJ3_RightTypeB;
            anim2->pScrCurrent = AnimScr_YushaSpinShieldOBJ3_RightTypeB;
        }
    }

    anim2->timer = 0;
    proc->timer = 0;
    Proc_Break(proc);
}

void efxYushaSpinShieldOBJ_806CE08(struct ProcEfxOBJ * proc)
{
    if (++proc->timer == 0x14)
    {
        proc->timer = 0;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }
}

/**
 * C2C: banim_code_effect_sealed_sword_fire
 */
void NewEfxHurtmutEff00(struct Anim * anim)
{
    struct ProcEfx * proc;

    if (gEfxBgSemaphore != 0)
        return;

    proc = Proc_Start(ProcScr_efxHurtmutEff00, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    if (gEkrDistanceType == EKR_DISTANCE_CLOSE)
        NewEfxHurtmutEff00OBJ(anim);
    else
        NewEfxHurtmutEff01OBJ(anim);
}

void EfxHurtmutEff00Main(struct ProcEfx * proc)
{
    Proc_Break(proc);
}

void NewEfxHurtmutEff00OBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxHurtmutEff00OBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->anim2 = EfxCreateFrontAnim(anim, FramScr_Unk5D4F90, FramScr_Unk5D4F90, FramScr_Unk5D4F90, FramScr_Unk5D4F90);
}

void efxHurtmutEff00OBJ_806CEC4(struct ProcEfxOBJ * proc)
{
    struct Anim * anim2 = proc->anim2;

    if (GetAnimPosition(proc->anim) == EKR_POS_R)
    {
        anim2->pScrStart = AnimScr_HurtmutEff00OBJ1_Right;
        anim2->pScrCurrent = AnimScr_HurtmutEff00OBJ1_Right;
    }
    else
    {
        anim2->pScrStart = AnimScr_HurtmutEff00OBJ1_Left;
        anim2->pScrCurrent = AnimScr_HurtmutEff00OBJ1_Left;
    }

    anim2->timer = 0;

    SpellFx_RegisterObjPal(Pal_EfxHurtmutEff00OBJ, 0x20);
    SpellFx_RegisterObjGfx(Img_EfxHurtmutEff00OBJ1, 0x1000);
    Proc_Break(proc);
}

void efxHurtmutEff00OBJ_806CF10(struct ProcEfxOBJ * proc)
{
    struct Anim * anim2 = proc->anim2;

    if (GetAnimPosition(proc->anim) == EKR_POS_R)
    {
        anim2->pScrStart = AnimScr_HurtmutEff00OBJ2_Right;
        anim2->pScrCurrent = AnimScr_HurtmutEff00OBJ2_Right;
    }
    else
    {
        anim2->pScrStart = AnimScr_HurtmutEff00OBJ2_Left;
        anim2->pScrCurrent = AnimScr_HurtmutEff00OBJ2_Left;
    }

    anim2->timer = 0;

    SpellFx_RegisterObjPal(Pal_EfxHurtmutEff00OBJ, 0x20);
    SpellFx_RegisterObjGfx(Img_EfxHurtmutEff00OBJ2, 0x1000);
    Proc_Break(proc);
}

void efxHurtmutEff00OBJ_806CF5C(struct ProcEfxOBJ * proc)
{
    gEfxBgSemaphore--;
    AnimDelete(proc->anim2);
    Proc_Break(proc);
}

void NewEfxHurtmutEff01OBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxHurtmutEff01OBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->anim2 = EfxCreateFrontAnim(anim, FramScr_Unk5D4F90, FramScr_Unk5D4F90, FramScr_Unk5D4F90, FramScr_Unk5D4F90);
}

void efxHurtmutEff01OBJ_806CFC4(struct ProcEfxOBJ * proc)
{
    struct Anim * anim2 = proc->anim2;

    if (GetAnimPosition(proc->anim) == EKR_POS_R)
    {
        anim2->pScrStart = AnimScr_HurtmutEff01OBJ1_Right;
        anim2->pScrCurrent = AnimScr_HurtmutEff01OBJ1_Right;
    }
    else
    {
        anim2->pScrStart = AnimScr_HurtmutEff01OBJ1_Left;
        anim2->pScrCurrent = AnimScr_HurtmutEff01OBJ1_Left;
    }

    anim2->timer = 0;

    SpellFx_RegisterObjPal(Pal_EfxHurtmutEff00OBJ, 0x20);
    SpellFx_RegisterObjGfx(Img_EfxHurtmutEff00OBJ1, 0x1000);
    Proc_Break(proc);
}

void efxHurtmutEff01OBJ_806D010(struct ProcEfxOBJ * proc)
{
    struct Anim * anim2 = proc->anim2;

    if (GetAnimPosition(proc->anim) == EKR_POS_R)
    {
        anim2->pScrStart = AnimScr_HurtmutEff01OBJ2_Right;
        anim2->pScrCurrent = AnimScr_HurtmutEff01OBJ2_Right;
    }
    else
    {
        anim2->pScrStart = AnimScr_HurtmutEff01OBJ2_Left;
        anim2->pScrCurrent = AnimScr_HurtmutEff01OBJ2_Left;
    }

    anim2->timer = 0;

    SpellFx_RegisterObjPal(Pal_EfxHurtmutEff00OBJ, 0x20);
    SpellFx_RegisterObjGfx(Img_EfxHurtmutEff00OBJ2, 0x1000);
    Proc_Break(proc);
}

void efxHurtmutEff01OBJ_806D05C(struct ProcEfxOBJ * proc)
{
    gEfxBgSemaphore--;
    AnimDelete(proc->anim2);
    Proc_Break(proc);
}

/**
 * C2E: banim_code_effect_magic_rune_normal
 * C2F: banim_code_effect_magic_rune_critical
 */
extern struct ProcCmd ProcScr_efxMagfcast[];
extern struct ProcCmd ProcScr_efxMagfcastBG[];
extern const u16 FrameConfig_EfxMagFcastBg1[];
extern const u16 FrameConfig_EfxMagFcastBg2[];
extern const u16 FrameConfig_EfxMagFcastBg3[];
extern const u16 FrameConfig_EfxMagFcastBg4[];
extern u16 * TsaLut1_EfxMagfcastBG[];
extern u16 * TsaLut2_EfxMagfcastBG[];
extern const u8 Img_EfxMagfcastBG[];
extern const u16 Pal_EfxMagfcastBG[];

void NewEfxMagfcast(struct Anim * anim, int type)
{
    struct ProcEfx * proc;

    if (gEfxBgSemaphore != 0)
        return;

    SpellFx_SetBG1Position();
    proc = Proc_Start(ProcScr_efxMagfcast, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;

    switch (gBanimIdx[GetAnimPosition(anim)])
    {
    case 0x57:
    case 0x58:
        NewEfxMagfcastBG(proc->anim, type);
        break;

    /* Just for switch case align */
    case 0x59:
    case 0x5A:
    default:
        NewEfxMagfcastBG(proc->anim, type + 2);
        break;
    }
}

void EfxMagfcastMain(struct ProcEfx * proc)
{
    if (++proc->timer == 0x14)
        Proc_Break(proc);
}

void NewEfxMagfcastBG(struct Anim * anim, u32 type)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxMagfcastBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;

    switch (type)
    {
    case 0:
        proc->frame_config = FrameConfig_EfxMagFcastBg1;
        proc->tsal = TsaLut1_EfxMagfcastBG;
        proc->tsar = TsaLut1_EfxMagfcastBG;
        break;

    case 1:
        proc->frame_config = FrameConfig_EfxMagFcastBg2;
        proc->tsal = TsaLut1_EfxMagfcastBG;
        proc->tsar = TsaLut1_EfxMagfcastBG;
        break;

    case 2:
        proc->frame_config = FrameConfig_EfxMagFcastBg3;
        proc->tsal = TsaLut2_EfxMagfcastBG;
        proc->tsar = TsaLut2_EfxMagfcastBG;
        break;

    case 3:
        proc->frame_config = FrameConfig_EfxMagFcastBg4;
        proc->tsal = TsaLut2_EfxMagfcastBG;
        proc->tsar = TsaLut2_EfxMagfcastBG;
        EfxPlaySEwithCmdCtrl(anim, anim->commandQueue[anim->commandQueueSize - 1]);
        break;

    default:
        break;
    }

    SpellFx_RegisterBgGfx(Img_EfxMagfcastBG, 0x2000);
    SpellFx_RegisterBgPal(Pal_EfxMagfcastBG, 0x20);
    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE)
    {
        if (GetAnimPosition(proc->anim) == EKR_POS_L)
            SetBgOffset(BG_1, 0x18, 0);
        else
            SetBgOffset(BG_1, 0xE8, 0);
    }
}

void EfxMagfcastBGMain(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, (const s16 *)proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsa1 = proc->tsal;
        u16 ** tsa2 = proc->tsar;

        SpellFx_WriteBgMap(proc->anim, tsa1[ret], tsa2[ret]);
        return;
    }

    if (ret == -1)
    {
        SpellFx_ClearBG1();
        gEfxBgSemaphore--;
        SpellFx_ClearColorEffects();
        Proc_End(proc);
    }
}

/**
 * C30: banim_code_effect_dirt_kick
 * C31: banim_code_effect_dirt_wave_small
 * C32: banim_code_effect_dirt_wave_medium
 */
extern struct ProcCmd ProcScr_efxSunakemuri[];
extern struct ProcCmd ProcScr_efxSunakemuriOBJ[];
extern const AnimScr AnimScr_EfxSunakemuriOBJ1_R[];
extern const AnimScr AnimScr_EfxSunakemuriOBJ2_R[];
extern const AnimScr AnimScr_EfxSunakemuriOBJ3_R[];
extern const AnimScr AnimScr_EfxSunakemuriOBJ1_L[];
extern const AnimScr AnimScr_EfxSunakemuriOBJ2_L[];
extern const AnimScr AnimScr_EfxSunakemuriOBJ3_L[];
extern const u16 Pal_EfxSunakemuriOBJ1[];
extern const u16 Pal_EfxSunakemuriOBJ2[];
extern const u16 Pal_EfxSunakemuriOBJ3[];
extern const u8 Img_EfxSunakemuriOBJ[];

int IsAnimSoundInPositionMaybe(struct Anim * anim);

void NewEfxSunakemuri(struct Anim * anim, int type)
{
    struct ProcEfx * proc;

    if (gEfxBgSemaphore == 0)
    {
        proc = Proc_Start(ProcScr_efxSunakemuri, PROC_TREE_3);
        proc->anim = anim;
        proc->timer = 0;
        NewEfxSunakemuriOBJ(anim, type);
    }
}

void EfxSunakemuriMain(struct ProcEfx * proc)
{
    Proc_Break(proc);
}

void NewEfxSunakemuriOBJ(struct Anim * anim, int type)
{
    const AnimScr * scr1;
    const AnimScr * scr2;
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxSunakemuriOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    scr1 = AnimScr_EfxSunakemuriOBJ1_R;
    if (type != 0)
    {
        scr1 = AnimScr_EfxSunakemuriOBJ3_R;
        if (type == 1)
            scr1 = AnimScr_EfxSunakemuriOBJ2_R;
    }

    scr2 = AnimScr_EfxSunakemuriOBJ1_L;
    if (type != 0)
    {
        scr2 = AnimScr_EfxSunakemuriOBJ3_L;
        if (type == 1)
            scr2 = AnimScr_EfxSunakemuriOBJ2_L;
    }

    proc->anim2 = EfxCreateFrontAnim(anim, scr2, scr1, scr2, scr1);

    switch (gBanimTerrain[GetAnimPosition(proc->anim)])
    {
    case 0x01: case 0x02: case 0x03: case 0x04: case 0x05:
    case 0x0A:
    case 0x0C: case 0x0D: case 0x0E: case 0x0F:
    case 0x11: case 0x12: case 0x13:
    case 0x19: case 0x1A: case 0x1B: case 0x1C:
    case 0x22: case 0x23:
    case 0x25: case 0x26: case 0x27: case 0x28: case 0x29: case 0x2A: case 0x2B:
    case 0x2F:
    case 0x33:
    case 0x38: case 0x39: case 0x3A: case 0x3B:
    case 0x3D:
    case 0x3F: case 0x40:
        SpellFx_RegisterObjPal(Pal_EfxSunakemuriOBJ1, 0x20);
        break;

    case 0x14:
        if (IsAnimSoundInPositionMaybe(proc->anim) != EKR_POS_L)
            SpellFx_RegisterObjPal(Pal_EfxSunakemuriOBJ1, 0x20);
        else
            SpellFx_RegisterObjPal(Pal_EfxSunakemuriOBJ2, 0x20);
        break;

    case 0x10: case 0x15: case 0x16: case 0x36: case 0x3C:
        SpellFx_RegisterObjPal(Pal_EfxSunakemuriOBJ2, 0x20);
        break;

    case 0x06: case 0x07: case 0x08: case 0x09:
    case 0x0B:
    case 0x17: case 0x18:
    case 0x1D: case 0x1E: case 0x1F: case 0x20: case 0x21:
    case 0x24:
    case 0x2D:
    case 0x30: case 0x31: case 0x32:
    case 0x37:
    case 0x3E:
        SpellFx_RegisterObjPal(Pal_EfxSunakemuriOBJ3, 0x20);
        break;

    case 0x00:
    default:
        break;
    }

    SpellFx_RegisterObjGfx(Img_EfxSunakemuriOBJ, 0x1000);
}

void EfxSunakemuriOBJMain(struct ProcEfxOBJ * proc)
{
    if (++proc->timer == 0x9)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }
}

/**
 * C4E: banim_code_effect_dirt_wave
 */
extern struct ProcCmd ProcScr_efxLokmsuna[];
extern struct ProcCmd ProcScr_efxLokmsunaOBJ[];
extern const AnimScr AnimScr_EfxLokmsunaObjLeft[];
extern const AnimScr AnimScr_EfxLokmsunaObjRight[];
extern const u8 Img_EfxLokmsunaObj[];

void NewEfxLokmsuna(struct Anim * anim)
{
    struct ProcEfx * proc;

    if (gEfxBgSemaphore == 0)
    {
        proc = Proc_Start(ProcScr_efxLokmsuna, PROC_TREE_3);
        proc->anim = anim;
        proc->timer = 0;
        NewEfxLokmsunaOBJ(anim);
    }
}

void EfxLokmsunaMain(struct ProcEfx * proc)
{
    Proc_Break(proc);
}

void NewEfxLokmsunaOBJ(struct Anim * anim)
{
    const AnimScr * scr1;
    const AnimScr * scr2;
    struct Anim * anim2;
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxLokmsunaOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    scr1 = AnimScr_EfxLokmsunaObjLeft;
    scr2 = AnimScr_EfxLokmsunaObjRight;
    anim2 = EfxCreateFrontAnim(anim, scr2, scr1, scr2, scr1);
    proc->anim2 = anim2;

    anim2->oam2Base &= 0xFFF;

    if (GetAnimPosition(anim) == EKR_POS_L)
        anim2->oam2Base |= 0x7000;
    else
        anim2->oam2Base |= 0x9000;

    SpellFx_RegisterObjGfx(Img_EfxLokmsunaObj, 0x1000);
}

void EfxLokmsunaIOBJMain(struct ProcEfxOBJ * proc)
{
    if (++proc->timer == 0xF)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }
}

/**
 * C39: banim_code_hit_fake
 */
extern struct ProcCmd ProcScr_efxKingPika[];
extern struct ProcCmd ProcScr_efxFlashFX[];

void NewEfxFlashUnit(struct Anim * anim, int a, int b, int c);

void NewEfxKingPika(struct Anim * anim)
{
    struct ProcEfx * proc;
    proc = Proc_Start(ProcScr_efxKingPika, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
}

void EfxKingPikaMain(struct ProcEfx * proc)
{
    struct Anim * anim = proc->anim;
    int time = ++proc->timer;

    if (time == 0x1)
    {
        NewEfxFlashUnit(anim, 0x1, 0x28, 0x0);
        return;
    }

    if (time == 0xA)
    {
        NewEfxFlashBgWhite(anim, 0x14);
        return;
    }

    if (time == 0x2D)
    {
        struct Anim * anim1 = gAnims[GetAnimPosition(anim) * 2];
        struct Anim * anim2 = gAnims[GetAnimPosition(anim) * 2 + 1];

        anim1->state3 |= ANIM_BIT3_BLOCKEND;
        anim2->state3 |= ANIM_BIT3_BLOCKEND;
        Proc_Break(proc);
    }
}

/**
 * C51: banim_code_flash_white
 */
void NewEfxFlashFX(struct Anim * anim)
{
    struct ProcEfx * proc;
    proc = Proc_Start(ProcScr_efxFlashFX, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
}

void EfxFlashFXMain(struct ProcEfx * proc)
{
    struct Anim * anim = proc->anim;
    int time = ++proc->timer;

    if (time == 0x1)
    {
        NewEfxFlashBgWhite(anim, 0x5);
        return;
    }

    if (time == 0x6)
    {
        struct Anim * anim1 = gAnims[GetAnimPosition(anim) * 2];
        struct Anim * anim2 = gAnims[GetAnimPosition(anim) * 2 + 1];

        anim1->state3 |= ANIM_BIT3_BLOCKEND;
        anim2->state3 |= ANIM_BIT3_BLOCKEND;
        Proc_Break(proc);
    }
}

ASM_FUNC("asm/nonmatching/code_08063210.s");
ASM_FUNC("asm/nonmatching/code_08063284.s");
ASM_FUNC("asm/nonmatching/code_080632D4.s");
ASM_FUNC("asm/nonmatching/code_08063348.s");
ASM_FUNC("asm/nonmatching/code_0806337C.s");
ASM_FUNC("asm/nonmatching/code_0806342C.s");
ASM_FUNC("asm/nonmatching/code_08063438.s");
ASM_FUNC("asm/nonmatching/code_08063458.s");
ASM_FUNC("asm/nonmatching/code_080634C8.s");
ASM_FUNC("asm/nonmatching/code_08063514.s");
ASM_FUNC("asm/nonmatching/code_0806353C.s");
ASM_FUNC("asm/nonmatching/code_0806355C.s");
ASM_FUNC("asm/nonmatching/code_080635E0.s");
ASM_FUNC("asm/nonmatching/code_08063600.s");
ASM_FUNC("asm/nonmatching/code_08063644.s");
ASM_FUNC("asm/nonmatching/code_08063664.s");
ASM_FUNC("asm/nonmatching/code_080636AC.s");
ASM_FUNC("asm/nonmatching/code_08063748.s");
ASM_FUNC("asm/nonmatching/code_080637D4.s");
ASM_FUNC("asm/nonmatching/code_08063958.s");
ASM_FUNC("asm/nonmatching/code_08063984.s");
ASM_FUNC("asm/nonmatching/code_080639C8.s");
ASM_FUNC("asm/nonmatching/code_080639E8.s");
ASM_FUNC("asm/nonmatching/code_08063A2C.s");
ASM_FUNC("asm/nonmatching/code_08063A84.s");
ASM_FUNC("asm/nonmatching/code_08063ADC.s");
ASM_FUNC("asm/nonmatching/code_08063B0C.s");
ASM_FUNC("asm/nonmatching/code_08063B48.s");
ASM_FUNC("asm/nonmatching/code_08063BF4.s");
