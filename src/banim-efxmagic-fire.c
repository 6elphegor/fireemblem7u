#include "gbafe.h"

extern const struct AnimSpriteData AnimSprite_EfxElfireObjLeft_08BB5548[],
    AnimSprite_EfxElfireObjLeft_08BB556C[], AnimSprite_EfxElfireObjLeft_08BB55A8[],
    AnimSprite_EfxElfireObjLeft_08BB55FC[], AnimSprite_EfxElfireObjLeft_08BB5668[],
    AnimSprite_EfxElfireObjLeft_08BB56EC[], AnimSprite_EfxElfireObjLeft_08BB5770[],
    AnimSprite_EfxElfireObjLeft_08BB57F4[], AnimSprite_EfxElfireObjLeft_08BB5878[],
    AnimSprite_EfxElfireObjLeft_08BB58FC[], AnimSprite_EfxElfireObjLeft_08BB5980[],
    AnimSprite_EfxElfireObjLeft_08BB5A04[], AnimSprite_EfxElfireObjLeft_08BB5A88[],
    AnimSprite_EfxElfireObjLeft_08BB5B0C[], AnimSprite_EfxElfireObjLeft_08BB5B78[],
    AnimSprite_EfxElfireObjLeft_08BB5BCC[], AnimSprite_EfxElfireObjLeft_08BB5C08[],
    AnimSprite_EfxElfireObjLeft_08BB5C2C[], AnimSprite_EfxElfireObjLeft_08BB5C44[],
    AnimSprite_EfxElfireObjLeft_08BB5C68[], AnimSprite_EfxElfireObjLeft_08BB5CA4[],
    AnimSprite_EfxElfireObjLeft_08BB5CF8[], AnimSprite_EfxElfireObjLeft_08BB5D64[],
    AnimSprite_EfxElfireObjLeft_08BB5DE8[], AnimSprite_EfxElfireObjLeft_08BB5EF0[],
    AnimSprite_EfxElfireObjLeft_08BB5F74[], AnimSprite_EfxElfireObjLeft_08BB5FF8[],
    AnimSprite_EfxElfireObjLeft_08BB607C[], AnimSprite_EfxElfireObjLeft_08BB6100[],
    AnimSprite_EfxElfireObjRight_08BB4728[], AnimSprite_EfxElfireObjRight_08BB474C[],
    AnimSprite_EfxElfireObjRight_08BB4788[], AnimSprite_EfxElfireObjRight_08BB47DC[],
    AnimSprite_EfxElfireObjRight_08BB4848[], AnimSprite_EfxElfireObjRight_08BB48CC[],
    AnimSprite_EfxElfireObjRight_08BB4950[], AnimSprite_EfxElfireObjRight_08BB49D4[],
    AnimSprite_EfxElfireObjRight_08BB4A58[], AnimSprite_EfxElfireObjRight_08BB4ADC[],
    AnimSprite_EfxElfireObjRight_08BB4B60[], AnimSprite_EfxElfireObjRight_08BB4BE4[],
    AnimSprite_EfxElfireObjRight_08BB4C68[], AnimSprite_EfxElfireObjRight_08BB4CEC[],
    AnimSprite_EfxElfireObjRight_08BB4D58[], AnimSprite_EfxElfireObjRight_08BB4DAC[],
    AnimSprite_EfxElfireObjRight_08BB4DE8[], AnimSprite_EfxElfireObjRight_08BB4E0C[],
    AnimSprite_EfxElfireObjRight_08BB4E24[], AnimSprite_EfxElfireObjRight_08BB4E48[],
    AnimSprite_EfxElfireObjRight_08BB4E84[], AnimSprite_EfxElfireObjRight_08BB4ED8[],
    AnimSprite_EfxElfireObjRight_08BB4F44[], AnimSprite_EfxElfireObjRight_08BB4FC8[],
    AnimSprite_EfxElfireObjRight_08BB50D0[], AnimSprite_EfxElfireObjRight_08BB5154[],
    AnimSprite_EfxElfireObjRight_08BB51D8[], AnimSprite_EfxElfireObjRight_08BB525C[],
    AnimSprite_EfxElfireObjRight_08BB52E0[], AnimSprite_EfxFireOBJ_L_Back_08BB41F8[],
    AnimSprite_EfxFireOBJ_L_Back_08BB424C[], AnimSprite_EfxFireOBJ_L_Back_08BB42AC[],
    AnimSprite_EfxFireOBJ_L_Back_08BB4300[], AnimSprite_EfxFireOBJ_L_Front_08BB4018[],
    AnimSprite_EfxFireOBJ_L_Front_08BB4030[], AnimSprite_EfxFireOBJ_L_Front_08BB4054[],
    AnimSprite_EfxFireOBJ_L_Front_08BB4078[], AnimSprite_EfxFireOBJ_L_Front_08BB409C[],
    AnimSprite_EfxFireOBJ_L_Front_08BB40C0[], AnimSprite_EfxFireOBJ_L_Front_08BB4114[],
    AnimSprite_EfxFireOBJ_L_Front_08BB4174[], AnimSprite_EfxFireOBJ_L_Front_08BB41C8[],
    AnimSprite_EfxFireOBJ_L_Front_08BB41E0[], AnimSprite_EfxFireOBJ_R_Back_08BB4580[],
    AnimSprite_EfxFireOBJ_R_Back_08BB45D4[], AnimSprite_EfxFireOBJ_R_Back_08BB4634[],
    AnimSprite_EfxFireOBJ_R_Back_08BB4688[], AnimSprite_EfxFireOBJ_R_Front_08BB43A0[],
    AnimSprite_EfxFireOBJ_R_Front_08BB43B8[], AnimSprite_EfxFireOBJ_R_Front_08BB43DC[],
    AnimSprite_EfxFireOBJ_R_Front_08BB4400[], AnimSprite_EfxFireOBJ_R_Front_08BB4424[],
    AnimSprite_EfxFireOBJ_R_Front_08BB4448[], AnimSprite_EfxFireOBJ_R_Front_08BB449C[],
    AnimSprite_EfxFireOBJ_R_Front_08BB44FC[], AnimSprite_EfxFireOBJ_R_Front_08BB4550[],
    AnimSprite_EfxFireOBJ_R_Front_08BB4568[];

/* auto-decls */
void NewEfxSpellCast(void);
void NewEfxFarAttackWithDistance(struct Anim * anim, s16 arg);
void EfxPlayHittedSFX(struct Anim * anim);
void RegisterEfxSpellCastEnd(void);
extern const struct ProcCmd ProcScr_efxFire[];
extern int gEfxBgSemaphore;
extern const struct ProcCmd ProcScr_efxFireBG[];
extern u16 Pal_FireSpellBg[];
extern u16 Img_FireSpellBg[];
extern const struct ProcCmd ProcScr_efxFireOBJ[];
extern const AnimScr AnimScr_EfxFireOBJ_R_Front[];
extern const AnimScr AnimScr_EfxFireOBJ_L_Front[];
extern const AnimScr AnimScr_EfxFireOBJ_R_Back[];
extern const AnimScr AnimScr_EfxFireOBJ_L_Back[];
extern u16 Pal_FireSpellSprites[];
extern u16 Img_FireSpellSprites[];
extern const struct ProcCmd ProcScr_efxFireHITBG[];
extern const u16 FrameConfig_AnimaHitBG[];
extern u16 * TsaLut_AnimaHitBG[];
extern u16 * ImgLut_AnimaHitBG[];
extern u16 Pal_EfxFireHitBG[];
extern const struct ProcCmd ProcScr_efxElfireBG[];
extern u16 Img_EkrElfireBG[];
extern u16 Tsa_EkrElfireBG[];
extern const struct ProcCmd ProcScr_efxElfireBGCOL[];
extern u16 Pal_EkrElfireBG[];
extern const struct ProcCmd ProcScr_efxElfireOBJ[];
extern const AnimScr AnimScr_EfxElfireObjLeft[];
extern const AnimScr AnimScr_EfxElfireObjRight[];
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
void efxFireHITBG_Loop(struct ProcEfxBG * proc);
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
void efxFireHITBG_Loop(struct ProcEfxBG * proc)
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

SECTION(".rodata.08BA1A54")
const struct ProcCmd ProcScr_efxFire[] = {
    PROC_19,
    PROC_REPEAT(Loop6C_efxFire),
    PROC_END,
};

SECTION(".rodata.08BA1A6C")
const struct ProcCmd ProcScr_efxFireBG[] = {
    PROC_19,
    PROC_REPEAT(Loop6C_efxFireBG),
    PROC_END,
};

SECTION(".rodata.08BA1AE4")
const struct ProcCmd ProcScr_efxFireOBJ[] = {
    PROC_19,
    PROC_REPEAT(EfxFireOBJ_Loop),
    PROC_END,
};

SECTION(".rodata.08BA1AFC")
const struct ProcCmd ProcScr_efxFireHITBG[] = {
    PROC_19,
    PROC_REPEAT(efxFireHITBG_Loop),
    PROC_END,
};

SECTION(".rodata.08BA1BBC")
const struct ProcCmd ProcScr_efxElfireBG[] = {
    PROC_19,
    PROC_REPEAT(EfxElfireBG_Loop),
    PROC_END,
};

SECTION(".rodata.08BA1BD4")
const struct ProcCmd ProcScr_efxElfireBGCOL[] = {
    PROC_19,
    PROC_MARK(10),
    PROC_REPEAT(EfxElfireBGCOL_Loop),
    PROC_END,
};

SECTION(".rodata.08BA1BF4")
const struct ProcCmd ProcScr_efxElfireOBJ[] = {
    PROC_19,
    PROC_REPEAT(EfxElfireObj_Loop),
    PROC_END,
};

SECTION(".rodata.08BB4348")
const AnimScr AnimScr_EfxFireOBJ_L_Front[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_L_Front_08BB41E0, 25),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_L_Front_08BB4018, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_L_Front_08BB4030, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_L_Front_08BB4054, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_L_Front_08BB4078, 10),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_L_Front_08BB409C, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_L_Front_08BB40C0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_L_Front_08BB4114, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_L_Front_08BB4174, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_L_Front_08BB41C8, 2),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BB4374")
const AnimScr AnimScr_EfxFireOBJ_L_Back[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_L_Front_08BB41E0, 25),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_L_Front_08BB4018, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_L_Front_08BB4030, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_L_Front_08BB4054, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_L_Front_08BB4078, 10),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_L_Front_08BB409C, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_L_Back_08BB41F8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_L_Back_08BB424C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_L_Back_08BB42AC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_L_Back_08BB4300, 2),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BB46D0")
const AnimScr AnimScr_EfxFireOBJ_R_Front[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_R_Front_08BB4568, 25),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_R_Front_08BB43A0, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_R_Front_08BB43B8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_R_Front_08BB43DC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_R_Front_08BB4400, 10),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_R_Front_08BB4424, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_R_Front_08BB4448, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_R_Front_08BB449C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_R_Front_08BB44FC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_R_Front_08BB4550, 2),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BB46FC")
const AnimScr AnimScr_EfxFireOBJ_R_Back[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_R_Front_08BB4568, 25),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_R_Front_08BB43A0, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_R_Front_08BB43B8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_R_Front_08BB43DC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_R_Front_08BB4400, 10),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_R_Front_08BB4424, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_R_Back_08BB4580, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_R_Back_08BB45D4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_R_Back_08BB4634, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_R_Back_08BB4688, 2),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BB54CC")
const AnimScr AnimScr_EfxElfireObjRight[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjRight_08BB4728, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjRight_08BB474C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjRight_08BB474C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjRight_08BB4788, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjRight_08BB47DC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjRight_08BB4848, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjRight_08BB48CC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjRight_08BB4950, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjRight_08BB49D4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjRight_08BB4A58, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjRight_08BB4ADC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjRight_08BB4B60, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjRight_08BB4BE4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjRight_08BB4C68, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjRight_08BB4CEC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjRight_08BB4D58, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjRight_08BB4DAC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjRight_08BB4DE8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjRight_08BB4E0C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjRight_08BB4E24, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjRight_08BB4E48, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjRight_08BB4E84, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjRight_08BB4ED8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjRight_08BB4F44, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjRight_08BB4FC8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjRight_08BB50D0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjRight_08BB5154, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjRight_08BB51D8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjRight_08BB525C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjRight_08BB52E0, 1),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BB62EC")
const AnimScr AnimScr_EfxElfireObjLeft[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjLeft_08BB5548, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjLeft_08BB556C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjLeft_08BB556C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjLeft_08BB55A8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjLeft_08BB55FC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjLeft_08BB5668, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjLeft_08BB56EC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjLeft_08BB5770, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjLeft_08BB57F4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjLeft_08BB5878, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjLeft_08BB58FC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjLeft_08BB5980, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjLeft_08BB5A04, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjLeft_08BB5A88, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjLeft_08BB5B0C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjLeft_08BB5B78, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjLeft_08BB5BCC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjLeft_08BB5C08, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjLeft_08BB5C2C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjLeft_08BB5C44, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjLeft_08BB5C68, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjLeft_08BB5CA4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjLeft_08BB5CF8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjLeft_08BB5D64, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjLeft_08BB5DE8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjLeft_08BB5EF0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjLeft_08BB5F74, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjLeft_08BB5FF8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjLeft_08BB607C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireObjLeft_08BB6100, 1),
    ANIMSCR_BLOCKED,
};
