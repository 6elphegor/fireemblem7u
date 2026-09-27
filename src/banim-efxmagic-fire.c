#include "gbafe.h"

/* auto-decls */
void NewEfxSpellCast(void);
void NewEfxFarAttackWithDistance(struct Anim * anim, s16 arg);
void EfxPlayHittedSFX(struct Anim * anim);
void RegisterEfxSpellCastEnd(void);
extern struct ProcCmd ProcScr_efxFire[];
extern int gEfxBgSemaphore;
extern struct ProcCmd ProcScr_efxFireBG[];
extern u16 Pal_FireSpellBg[];
extern u16 Img_FireSpellBg[];
extern struct ProcCmd ProcScr_efxFireOBJ[];
extern AnimScr AnimScr_EfxFireOBJ_R_Front[];
extern AnimScr AnimScr_EfxFireOBJ_L_Front[];
extern u32 AnimScr_EfxFireOBJ_R_Back[];
extern u32 AnimScr_EfxFireOBJ_L_Back[];
extern u16 Pal_FireSpellSprites[];
extern u16 Img_FireSpellSprites[];
extern struct ProcCmd ProcScr_efxFireHITBG[];
extern const u16 FrameConfig_AnimaHitBG[];
extern u16 * TsaLut_AnimaHitBG[];
extern u16 * ImgLut_AnimaHitBG[];
extern u16 Pal_EfxFireHitBG[];
extern struct ProcCmd ProcScr_efxElfireBG[];
extern u16 Img_EkrElfireBG[];
extern u16 Tsa_EkrElfireBG[];
extern struct ProcCmd ProcScr_efxElfireBGCOL[];
extern u16 Pal_EkrElfireBG[];
extern struct ProcCmd ProcScr_efxElfireOBJ[];
extern u32 AnimScr_EfxElfireObjLeft[];
extern u32 AnimScr_EfxElfireObjRight[];
extern u16 Pal_EfxElfireOBJ[];
extern u16 Img_EfxElfireOBJ[];
#define TILEMAP_INDEX(aX, aY) (0x20 * (aY) + (aX))
#define TILEMAP_LOCATED(aMap, aX, aY) (TILEMAP_INDEX((aX), (aY)) + (aMap))

void StartSpellAnimFire(struct Anim * anim);
void StartSpellAnimElfire(struct Anim * anim);
void Loop6C_efxFire(struct ProcEfx * proc);
void NewEfxFireBG(struct Anim * anim);
void Loop6C_efxFireBG(struct ProcEfxBG * proc);
void NewEfxFireOBJ(struct Anim * anim);
void EfxFireOBJ_Loop(struct ProcEfxOBJ * proc);
void StartSubSpell_efxFireHITBG(struct Anim * anim);
void sub_080586E0(struct ProcEfxBG * proc);
void StartSubSpell_efxElfireBG(struct Anim * anim);
void EfxElfireBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxElfireBGCOL(struct Anim * anim);
void EfxElfireBGCOL_Loop(struct ProcEfxBGCOL * proc);
void StartSubSpell_efxElfireOBJ(struct Anim * anim);
void EfxElfireObj_Loop(struct ProcEfxOBJ * proc);

extern const u16 NewEfxFireBG_frame_config[];
extern u16 * NewEfxFireBG_tsal[];
extern u16 * NewEfxFireBG_tsar[];
extern const u16 StartSubSpell_efxElfireBGCOL_frame_config[];

// 9.99 efxmagic-fire:StartSpellAnimFire
void StartSpellAnimFire(struct Anim * anim)
{
    struct ProcEfx * proc;
    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxFire, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->type = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));
}

// 9.99 efxmagic-fire:StartSpellAnimElfire
void StartSpellAnimElfire(struct Anim * anim)
{
    struct ProcEfx * proc;
    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxFire, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->type = 1;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));
}

// 9.99 efxmagic-fire:Loop6C_efxFire
void Loop6C_efxFire(struct ProcEfx * proc)
{
    int r5, r7, r8, r9, time;
    struct Anim *animc = GetAnimAnotherSide(proc->anim);

    if (0 == gEkrDistanceType) {
        r5 = 0x20;
        r7 = 0x34;
        r8 = 0x36;
        r9 = 0x55;
    } else {
        r5 = 0x28;
        r7 = 0x3C;
        r8 = 0x41;
        r9 = 0x60;
    }

    if (++proc->timer == 1) {
        NewEfxFireBG(proc->anim);
        NewEfxFireOBJ(proc->anim);
        PlaySFX(0xF1, 0x100, proc->anim->xPosition, 1);
    }

    time = proc->timer;
    if (time == r5) {
        NewEfxFarAttackWithDistance(proc->anim, -1);
        return;
    }

    if (time == r7) {
        animc->state3 |= ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED;
        StartBattleAnimHitEffectsDefault(animc, proc->hitted);

        if (proc->hitted != (0))
            return;

        if (proc->type == 0) {
            PlaySFX(0xF7, 0x100, animc->xPosition, 1);
            StartSubSpell_efxFireHITBG(animc);
        } else {
            PlaySFX(0xF8, 0x100, animc->xPosition, 1);
            StartSubSpell_efxElfireBG(animc);
            StartSubSpell_efxElfireBGCOL(animc);
            StartSubSpell_efxElfireOBJ(animc);
        }
        EfxPlayHittedSFX(animc);
        return;
    }

    if (time == r8)
        return;

    if (time == r9) {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }
}

// 9.99 efxmagic-fire:NewEfxFireBG
void NewEfxFireBG(struct Anim * anim)
{



    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxFireBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = NewEfxFireBG_frame_config;
    proc->tsal = NewEfxFireBG_tsal;
    proc->tsar = NewEfxFireBG_tsar;

    SpellFx_RegisterBgPal(Pal_FireSpellBg, 0x20);
    SpellFx_RegisterBgGfx(Img_FireSpellBg, 0x2000);
    SpellFx_SetSomeColorEffect();
}

// 9.99 efxmagic-fire:Loop6C_efxFireBG
void Loop6C_efxFireBG(struct ProcEfxBG * proc)
{
    int ret;
    ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);
    if (ret >= 0) {
        u16 **buf1 = proc->tsal;
        u16 **buf2 = proc->tsar;
        SpellFx_WriteBgMap(proc->anim, buf1[ret], buf2[ret]);
        return;
    }

    if (ret == -1) {
        SpellFx_ClearBG1();
        gEfxBgSemaphore--;
        SpellFx_ClearColorEffects();
        Proc_Break(proc);
    }
}

// 9.99 efxmagic-fire:NewEfxFireOBJ
void NewEfxFireOBJ(struct Anim * anim)
{
    struct Anim *anim2;
    struct ProcEfxOBJ * proc;
    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxFireOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    anim2 = EfxCreateFrontAnim(anim, AnimScr_EfxFireOBJ_R_Front, AnimScr_EfxFireOBJ_L_Front, AnimScr_EfxFireOBJ_R_Back, AnimScr_EfxFireOBJ_L_Back);
    proc->anim2 = anim2;

    if (GetAnimPosition(anim) == EKR_POS_L)
        anim2->xPosition = anim->xPosition - 0x8;
    else
        anim2->xPosition = anim->xPosition + 0x8;
    
    anim2->yPosition = anim->yPosition + 0x8;

    SpellFx_RegisterObjPal(Pal_FireSpellSprites, 0x20);
    SpellFx_RegisterObjGfx(Img_FireSpellSprites, 0x1000);
}

// 9.99 efxmagic-fire:EfxFireOBJ_Loop
void EfxFireOBJ_Loop(struct ProcEfxOBJ * proc)
{
    int time = ++proc->timer;
    if (time == 0x25) {
        PlaySFX(0xF2, 0x100, proc->anim->xPosition, 0x1);
        return;
    }

    if (time > 0x32) {
        AnimDelete(proc->anim2);
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}

// 9.99 efxmagic-fire:StartSubSpell_efxFireHITBG
void StartSubSpell_efxFireHITBG(struct Anim * anim)
{
    struct ProcEfxBG * proc;
    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxFireHITBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = FrameConfig_AnimaHitBG;
    proc->tsal = TsaLut_AnimaHitBG;
    proc->tsar = TsaLut_AnimaHitBG;
    proc->img = ImgLut_AnimaHitBG;

    SpellFx_RegisterBgPal(Pal_EfxFireHitBG, 0x20);
    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType == EKR_DISTANCE_CLOSE)
        return;
    
    if (GetAnimPosition(proc->anim) == EKR_POS_L)
        SetBgOffset(BG_1, 0x18, 0x0);
    else
        SetBgOffset(BG_1, 0xE8, 0x0);
}

// 9.99 efxmagic-fire:sub_805DE74
void sub_080586E0(struct ProcEfxBG * proc)
{
    int ret;
    ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);
    if (ret >= 0) {
        u16 **buf1 = proc->tsal;
        u16 **buf2 = proc->tsar;
        SpellFx_RegisterBgGfx(proc->img[ret], 0x2000);
        SpellFx_WriteBgMap(proc->anim, buf1[ret], buf2[ret]);
        return;
    }

    if (ret == -1) {
        SpellFx_ClearBG1();
        gEfxBgSemaphore--;
        SpellFx_ClearColorEffects();
        Proc_End(proc);
    }
}

// 9.99 efxmagic-fire:StartSubSpell_efxElfireBG
void StartSubSpell_efxElfireBG(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxElfireBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    SpellFx_RegisterBgGfx(Img_EkrElfireBG, 0x2000);
    SpellFx_WriteBgMap(proc->anim, Tsa_EkrElfireBG, Tsa_EkrElfireBG);
    SpellFx_SetBG1Position();
    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType == EKR_DISTANCE_CLOSE)
        return;
    
    if (GetAnimPosition(proc->anim) == EKR_POS_L)
        SetBgOffset(BG_1, 0x18, 0x0);
    else
        SetBgOffset(BG_1, 0xE8, 0x0);
    
    sub_080669F4(TILEMAP_LOCATED(gBg1Tm, 0x1E, 0x0), 2, 0x14, 0x1, 0x100);
}

// 9.99 efxmagic-fire:EfxElfireBG_Loop
void EfxElfireBG_Loop(struct ProcEfxBG * proc)
{
    if (++proc->timer == 0x28) {
        SpellFx_ClearBG1();
        SpellFx_ClearColorEffects();
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}

// 9.99 efxmagic-fire:StartSubSpell_efxElfireBGCOL
void StartSubSpell_efxElfireBGCOL(struct Anim * anim)
{
    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxElfireBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxElfireBGCOL_frame_config;
    proc->pal = Pal_EkrElfireBG;
    SpellFx_RegisterBgPal(Pal_EkrElfireBG, 0x20);
}

// 9.99 efxmagic-fire:EfxElfireBGCOL_Loop
void EfxElfireBGCOL_Loop(struct ProcEfxBGCOL * proc)
{
    int ret;
    ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);
    if (ret >= 0) {
        u16 * pal = proc->pal;
        SpellFx_RegisterBgPal(&PAL_BUF_COLOR(pal, ret, 0), 0x20);
        return;
    }

    if (ret == -1) {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}

// 9.99 efxmagic-fire:StartSubSpell_efxElfireOBJ
void StartSubSpell_efxElfireOBJ(struct Anim * anim)
{
    struct Anim * anim2;
    struct ProcEfxOBJ * proc;
    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxElfireOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    anim2 = EfxCreateFrontAnim(anim, AnimScr_EfxElfireObjLeft, AnimScr_EfxElfireObjRight, AnimScr_EfxElfireObjLeft, AnimScr_EfxElfireObjRight);
    proc->anim2 = anim2;

    if (GetAnimPosition(anim) == EKR_POS_L)
        anim2->xPosition = anim2->xPosition - 0x8;
    else
        anim2->xPosition = anim2->xPosition + 0x8;
    
    anim2->oamBase = anim2->oamBase | 0x400;

    SpellFx_RegisterObjPal(Pal_EfxElfireOBJ, 0x20);
    SpellFx_RegisterObjGfx(Img_EfxElfireOBJ, 0x800);
}

// 9.99 efxmagic-fire:EfxElfireObj_Loop
void EfxElfireObj_Loop(struct ProcEfxOBJ * proc)
{
    if (++proc->timer > 0x28) {
        AnimDelete(proc->anim2);
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}
