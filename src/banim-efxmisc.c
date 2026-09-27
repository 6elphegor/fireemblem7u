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

/**
 * Maybe unused banim commands?
 */
extern struct ProcCmd ProcScr_efxSongOBJ2[];
extern struct ProcCmd ProcScr_efxDanceOBJ[];
extern const AnimScr AnimScr_EfxSongObj2[];
extern const AnimScr AnimScr_EfxDanceObj[];
extern const u16 Pal_EfxDanceObj[];
extern const u8 Img_EfxDanceObj[];

void NewEfxSongOBJ2(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxSongOBJ2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0x28;
    proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_EfxSongObj2, AnimScr_EfxSongObj2, AnimScr_EfxSongObj2, AnimScr_EfxSongObj2);
    SpellFx_RegisterObjPal(Pal_EfxDanceObj, 0x20);
    SpellFx_RegisterObjGfx(Img_EfxDanceObj, 0x1000);
    PlaySFX(0xEE, 0x100, proc->anim->xPosition, 0x1);
}

void EfxSongOBJ2Main(struct ProcEfxOBJ * proc)
{
    if (++proc->timer == 0x18)
        PlaySFX(0xEE, 0x100, proc->anim->xPosition, 0x1);

    if (proc->timer > proc->terminator)
    {
        AnimDelete(proc->anim2);
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}

void NewEfxDanceOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxDanceOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0x19;
    proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_EfxDanceObj, AnimScr_EfxDanceObj, AnimScr_EfxDanceObj, AnimScr_EfxDanceObj);
    SpellFx_RegisterObjPal(Pal_EfxDanceObj, 0x20);
    SpellFx_RegisterObjGfx(Img_EfxDanceObj, 0x1000);
    PlaySFX(0xE1, 0x100, proc->anim->xPosition, 0x1);
}

void EfxDanceOBJMain(struct ProcEfxOBJ * proc)
{
    if (++proc->timer > proc->terminator)
    {
        AnimDelete(proc->anim2);
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}

/**
 * Shinning effect for legend weapon
 */
extern struct ProcCmd ProcScr_efxSpecalEffect[];
extern struct ProcCmd ProcScr_efxSRankWeaponEffect[];
extern struct ProcCmd ProcScr_efxSRankWeaponEffectBG[];
extern struct ProcCmd ProcScr_efxSRankWeaponEffectSCR[];
extern struct ProcCmd ProcScr_efxSRankWeaponEffectSCR2[];
extern const u8 Img_EfxSRankWeaponEffectBG[];
extern const u16 Pal_EfxSRankWeaponEffectBG[];
extern const u16 Tsa_EfxSRankWeaponEffectBG[];
extern const s16 gUnknown_085D9154[];

struct ProcEfxSRankSCR2 {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);

    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;

    STRUCT_PAD(0x30, 0x5C);

    /* 5C */ struct ProcEfx * seff_scr1;
};

void EfxSRankWeaponEffectSCR2Main(struct ProcEfxSRankSCR2 * proc);

void NewEfxSpecalEffect(struct Anim * anim)
{
    struct BattleUnit * bu;
    struct ProcEfx * proc;
    struct Anim * anim1;
    struct Anim * anim2;

    if (gEfxSpecalEffectExist[GetAnimPosition(anim)] == false)
    {
        gEfxSpecalEffectExist[GetAnimPosition(anim)] = true;

        if (GetAnimPosition(anim) == EKR_POS_L)
            bu = gpEkrBattleUnitLeft;
        else
            bu = gpEkrBattleUnitRight;

        if (IsWeaponLegency(bu->weaponBefore) == false)
        {
            anim1 = gAnims[GetAnimPosition(anim) * 2];
            anim2 = gAnims[GetAnimPosition(anim) * 2 + 1];

            anim1->state3 |= ANIM_BIT3_BLOCKEND;
            anim2->state3 |= ANIM_BIT3_BLOCKEND;
            return;
        }
    }
    else
    {
        anim1 = gAnims[GetAnimPosition(anim) * 2];
        anim2 = gAnims[GetAnimPosition(anim) * 2 + 1];

        anim1->state3 |= ANIM_BIT3_BLOCKEND;
        anim2->state3 |= ANIM_BIT3_BLOCKEND;
        return;
    }

    proc = Proc_Start(ProcScr_efxSpecalEffect, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0x0;
    PlaySFX(0xF0, 0x100, 0x78, 0x0);
    NewEfxSRankWeaponEffect(anim);
}

void EfxSpecalEffectMain(ProcPtr proc)
{
    Proc_Break(proc);
}

void NewEfxSRankWeaponEffect(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_SetBG1Position();
    proc = Proc_Start(ProcScr_efxSRankWeaponEffect, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0x0;
}

void EfxSRankWeaponEffectMain(struct ProcEfx * proc)
{
    int time = ++proc->timer;

    if (time == 1)
    {
        NewEfxSRankWeaponEffectBG(proc->anim);
        return;
    }

    if (time == 0x15)
    {
        NewEfxRestWINH_(proc->anim, 0x2D, 0x1);
        NewEfxSRankWeaponEffectSCR();
        return;
    }

    if (time == 0x46)
    {
        struct Anim * anim1;
        struct Anim * anim2;

        anim1 = gAnims[GetAnimPosition(proc->anim) * 2];
        anim2 = gAnims[GetAnimPosition(proc->anim) * 2 + 1];

        anim1->state3 |= ANIM_BIT3_BLOCKEND;
        anim2->state3 |= ANIM_BIT3_BLOCKEND;
        Proc_Break(proc);
    }
}

void NewEfxSRankWeaponEffectBG(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    proc = Proc_Start(ProcScr_efxSRankWeaponEffectBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    SpellFx_RegisterBgGfx(Img_EfxSRankWeaponEffectBG, 0x2000);
    SpellFx_RegisterBgPal(Pal_EfxSRankWeaponEffectBG, 0x20);
    SpellFx_WriteBgMap(proc->anim, Tsa_EfxSRankWeaponEffectBG, Tsa_EfxSRankWeaponEffectBG);
    SpellFx_SetSomeColorEffect();
}

void EfxSRankWeaponEffectBGMain(struct ProcEfxBG * proc)
{
    if (++proc->timer == 0x3C)
    {
        SpellFx_ClearBG1();
        SpellFx_ClearColorEffects();
        Proc_Break(proc);
    }
}

void NewEfxSRankWeaponEffectSCR(void)
{
    struct ProcEfx * proc;

    proc = Proc_Start(ProcScr_efxSRankWeaponEffectSCR, PROC_TREE_3);
    proc->timer = 0;
    proc->step = 0;
    proc->unk44 = 0;
    NewEfxSRankWeaponEffectSCR2(proc);
}

void EfxSRankWeaponEffectSCRMain(struct ProcEfx * proc)
{
    u32 i;
    u16 * dst = !gEkrBg1ScrollFlip
        ? gpBg1ScrollOffsetList1
        : gpBg1ScrollOffsetList2;

    for (i = 0; i < 160; dst++, i++)
    {
        if (i < 120)
        {
            s16 ref = gUnknown_085D9154[i] * proc->unk44 >> 0xC;

            if (ref)
            {
                if (i < 60)
                {
                    if (ref < i - 0x88)
                        ref = i + -0x88; // required for matching
                }
                else
                {
                    if (ref > 0x88 - i)
                        ref = 0x88 - i;
                }
            }
            *dst = ref;
        }
        else
        {
            *dst = 0;
        }
    }
}

void NewEfxSRankWeaponEffectSCR2(struct ProcEfx * seff_scr)
{
    struct ProcEfxSRankSCR2 * proc;

    proc = Proc_Start(ProcScr_efxSRankWeaponEffectSCR2, PROC_TREE_3);
    proc->timer = 0;
    proc->terminator = 0x28;
    proc->seff_scr1 = seff_scr;
}

void EfxSRankWeaponEffectSCR2Main(struct ProcEfxSRankSCR2 * proc)
{
    struct ProcEfx * seff_scr = proc->seff_scr1;

    seff_scr->unk44 = Interpolate(INTERPOLATE_LINEAR, 0, 0x40000, proc->timer, proc->terminator);

    if (++proc->timer > proc->terminator)
    {
        Proc_End(seff_scr);
        Proc_Break(proc);
    }
}

extern struct ProcCmd ProcScr_efxMagdhisEffect[];
extern struct ProcCmd ProcScr_efxMagdhisEffectBG[];
extern u16 * TsaLut_EfxMagdhisEffectBG[];
extern const u16 FrameConf_EfxMagdhisEffectBG[];
extern const u16 Pal_EfxMagdhisEffectBG[];
extern const u8 Img_EfxMagdhisEffectBG[];

void M4aPlayWithPostionCtrl(int songid, int x, int flag);

void NewEfxMagdhisEffect(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_SetBG1Position();
    proc = Proc_Start(ProcScr_efxMagdhisEffect, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
}

void EfxMagdhisEffectMain(struct ProcEfx * proc)
{
    if (++proc->timer == 0x11)
    {
        NewEfxMagdhisEffectBG(proc->anim, 0x49);
        EfxPlaySE(0x140, 0x100);
        M4aPlayWithPostionCtrl(0x140, proc->anim->xPosition, 1);
    }

    if (proc->timer == 0x64)
        Proc_Break(proc);
}

void NewEfxMagdhisEffectBG(struct Anim * anim, int duration)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMagdhisEffectBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0;
    proc->unk30 = duration;
    proc->frame = 0;
    proc->frame_config = FrameConf_EfxMagdhisEffectBG;
    proc->tsal = TsaLut_EfxMagdhisEffectBG;
    proc->tsar = TsaLut_EfxMagdhisEffectBG;

    SpellFx_RegisterBgPal(Pal_EfxMagdhisEffectBG, 0x20);
    SpellFx_RegisterBgGfx(Img_EfxMagdhisEffectBG, 0x2000);
    SpellFx_SetSomeColorEffect();

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg2_ct.priority = 1;
    gDispIo.bg1_ct.priority = 2;
    gDispIo.bg3_ct.priority = 3;
    SetBgOffset(BG_1, 0x10, 0x0);
}

void EfxMagdhisEffectBGMain(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, (const s16 *)proc->frame_config);

    if (ret >= 0)
    {
        u16 ** buf1 = proc->tsal;
        u16 ** buf2 = proc->tsar;
        SpellFx_WriteBgMap(proc->anim, buf1[ret], buf2[ret]);
    }

    if (++proc->terminator == proc->unk30)
    {
        gDispIo.bg0_ct.priority = 0;
        gDispIo.bg1_ct.priority = 1;
        gDispIo.bg3_ct.priority = 2;
        gDispIo.bg2_ct.priority = 3;
        SpellFx_ClearBG1();
        gEfxBgSemaphore--;
        SpellFx_ClearColorEffects();
        Proc_Break(proc);
    }
}

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
