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

ASM_FUNC("asm/nonmatching/code_08062C18.s");
ASM_FUNC("asm/nonmatching/code_08062C78.s");
ASM_FUNC("asm/nonmatching/code_08062C94.s");
ASM_FUNC("asm/nonmatching/code_08062D74.s");
ASM_FUNC("asm/nonmatching/code_08062DCC.s");
ASM_FUNC("asm/nonmatching/code_08062DFC.s");
ASM_FUNC("asm/nonmatching/code_08062E08.s");
ASM_FUNC("asm/nonmatching/code_08062FEC.s");
ASM_FUNC("asm/nonmatching/code_0806301C.s");
ASM_FUNC("asm/nonmatching/code_08063048.s");
ASM_FUNC("asm/nonmatching/code_08063054.s");
ASM_FUNC("asm/nonmatching/code_080630D8.s");
ASM_FUNC("asm/nonmatching/code_08063108.s");
ASM_FUNC("asm/nonmatching/code_08063124.s");
ASM_FUNC("asm/nonmatching/code_08063194.s");
ASM_FUNC("asm/nonmatching/code_080631B0.s");
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
