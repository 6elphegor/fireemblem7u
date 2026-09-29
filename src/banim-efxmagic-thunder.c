#include "gbafe.h"

extern const struct AnimSpriteData AnimSprite_EfxThunderOBJ_L_08BB34EC[],
    AnimSprite_EfxThunderOBJ_L_08BB351C[], AnimSprite_EfxThunderOBJ_L_08BB3588[],
    AnimSprite_EfxThunderOBJ_L_08BB35E8[], AnimSprite_EfxThunderOBJ_L_08BB3648[],
    AnimSprite_EfxThunderOBJ_L_08BB36A8[], AnimSprite_EfxThunderOBJ_L_08BB3708[],
    AnimSprite_EfxThunderOBJ_L_08BB3768[], AnimSprite_EfxThunderOBJ_L_08BB37C8[],
    AnimSprite_EfxThunderOBJ_L_08BB3828[], AnimSprite_EfxThunderOBJ_L_08BB3888[],
    AnimSprite_EfxThunderOBJ_L_08BB38E8[], AnimSprite_EfxThunderOBJ_L_08BB3948[],
    AnimSprite_EfxThunderOBJ_L_08BB39A8[], AnimSprite_EfxThunderOBJ_L_08BB3A08[],
    AnimSprite_EfxThunderOBJ_L_08BB3A68[], AnimSprite_EfxThunderOBJ_L_08BB3AD4[],
    AnimSprite_EfxThunderOBJ_L_08BB3AEC[], AnimSprite_EfxThunderOBJ_L_08BB3B4C[],
    AnimSprite_EfxThunderOBJ_L_08BB3BAC[], AnimSprite_EfxThunderOBJ_L_08BB3C0C[],
    AnimSprite_EfxThunderOBJ_L_08BB3C6C[], AnimSprite_EfxThunderOBJ_L_08BB3CCC[],
    AnimSprite_EfxThunderOBJ_L_08BB3D2C[], AnimSprite_EfxThunderOBJ_L_08BB3D8C[],
    AnimSprite_EfxThunderOBJ_L_08BB3DEC[], AnimSprite_EfxThunderOBJ_L_08BB3E4C[],
    AnimSprite_EfxThunderOBJ_L_08BB3EAC[], AnimSprite_EfxThunderOBJ_L_08BB3EC4[],
    AnimSprite_EfxThunderOBJ_R_08BB29C0[], AnimSprite_EfxThunderOBJ_R_08BB29F0[],
    AnimSprite_EfxThunderOBJ_R_08BB2A5C[], AnimSprite_EfxThunderOBJ_R_08BB2ABC[],
    AnimSprite_EfxThunderOBJ_R_08BB2B1C[], AnimSprite_EfxThunderOBJ_R_08BB2B7C[],
    AnimSprite_EfxThunderOBJ_R_08BB2BDC[], AnimSprite_EfxThunderOBJ_R_08BB2C3C[],
    AnimSprite_EfxThunderOBJ_R_08BB2C9C[], AnimSprite_EfxThunderOBJ_R_08BB2CFC[],
    AnimSprite_EfxThunderOBJ_R_08BB2D5C[], AnimSprite_EfxThunderOBJ_R_08BB2DBC[],
    AnimSprite_EfxThunderOBJ_R_08BB2E1C[], AnimSprite_EfxThunderOBJ_R_08BB2E7C[],
    AnimSprite_EfxThunderOBJ_R_08BB2EDC[], AnimSprite_EfxThunderOBJ_R_08BB2F3C[],
    AnimSprite_EfxThunderOBJ_R_08BB2FA8[], AnimSprite_EfxThunderOBJ_R_08BB2FC0[],
    AnimSprite_EfxThunderOBJ_R_08BB3020[], AnimSprite_EfxThunderOBJ_R_08BB3080[],
    AnimSprite_EfxThunderOBJ_R_08BB30E0[], AnimSprite_EfxThunderOBJ_R_08BB3140[],
    AnimSprite_EfxThunderOBJ_R_08BB31A0[], AnimSprite_EfxThunderOBJ_R_08BB3200[],
    AnimSprite_EfxThunderOBJ_R_08BB3260[], AnimSprite_EfxThunderOBJ_R_08BB32C0[],
    AnimSprite_EfxThunderOBJ_R_08BB3320[], AnimSprite_EfxThunderOBJ_R_08BB3380[],
    AnimSprite_EfxThunderOBJ_R_08BB3398[];

// ROM data referenced below, defined in data/ (see tools/datasplit.py)
extern const u8 Tsa_EfxThuderBg1[];
extern const u8 Tsa_EfxThuderBg2[];

/* auto-decls */
#define TILEMAP_INDEX(aX, aY) (0x20 * (aY) + (aX))
#define TILEMAP_LOCATED(aMap, aX, aY) (TILEMAP_INDEX((aX), (aY)) + (aMap))
void NewEfxSpellCast(void);
void NewEfxFarAttackWithDistance(struct Anim * anim, s16 arg);
void EfxPlayHittedSFX(struct Anim * anim);
void RegisterEfxSpellCastEnd(void);
extern int gEfxBgSemaphore;
extern u16 Img_ThunderSpellBg[];
extern u16 Pal_ThunderSpellBg[];
extern const AnimScr AnimScr_EfxThunderOBJ_L[];
extern const AnimScr AnimScr_EfxThunderOBJ_R[];
extern u16 Pal_BoltingSprites[];
extern u16 Img_BoltingSprites[];

void StartSpellAnimThunder(struct Anim *anim);
void Loop6C_efxThunder(struct ProcEfx * proc);
void NewEfxThunderBG(struct Anim *anim);
void EfxThunderBGMain(struct ProcEfxBG * proc);
void NewEfxThunderBGCOL(struct Anim * anim);
void EfxThunderBGCOL_Loop(struct ProcEfxBGCOL * proc);
void NewEfxThunderOBJ(struct Anim *anim);
void EfxThunderOBJMain(struct ProcEfxOBJ * proc);

extern const u16 NewEfxThunderBG_frame_config[];
extern const u16 NewEfxThunderBGCOL_frame_config[];

CONST_DATA struct ProcCmd ProcScr_efxThunder[] = {
    PROC_19,
    PROC_REPEAT(Loop6C_efxThunder),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_efxThunderBG[] = {
    PROC_19,
    PROC_REPEAT(EfxThunderBGMain),
    PROC_END,
};

CONST_DATA u16 * NewEfxThunderBG_tsa_l[] = {
    (u16 *) Tsa_EfxThuderBg1,
    (u16 *) Tsa_EfxThuderBg2,
};

CONST_DATA u16 * NewEfxThunderBG_tsa_r[] = {
    (u16 *) Tsa_EfxThuderBg1,
    (u16 *) Tsa_EfxThuderBg2,
};

CONST_DATA struct ProcCmd ProcScr_efxThunderBGCOL[] = {
    PROC_19,
    PROC_MARK(10),
    PROC_REPEAT(EfxThunderBGCOL_Loop),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_efxThunderOBJ[] = {
    PROC_19,
    PROC_REPEAT(EfxThunderOBJMain),
    PROC_END,
};

// 9.99 efxmagic-thunder:StartSpellAnimThunder
void StartSpellAnimThunder(struct Anim *anim)
{
    struct ProcEfx *proc;
    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxThunder, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));
}

// 9.99 efxmagic-thunder:Loop6C_efxThunder
void Loop6C_efxThunder(struct ProcEfx * proc)
{
    struct Anim *animc = GetAnimAnotherSide(proc->anim);
    int cur, frame = EfxGetCamMovDuration();

    if (++proc->timer == 1)
        NewEfxFarAttackWithDistance(proc->anim, -1);
    
    cur = proc->timer;
    if (cur == (frame + 1)) {
        NewEfxThunderBG(animc);
        NewEfxThunderBGCOL(animc);
        NewEfxThunderOBJ(animc);
        return;
    }

    if (cur == (frame + 4)) {
        animc->state3 |= ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED;
        StartBattleAnimHitEffectsDefault(animc, proc->hitted);
        PlaySFX(0xF5, 0x100, animc->xPosition, 1);

        if (proc->hitted == (0))
            EfxPlayHittedSFX(animc);
        
        return;
    }

    if (cur == (frame + 0x50))
        return;
    
    if (cur == (frame + 0x60)) {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }
}

// 0.87 efxmagic-thunder:NewEfxThunderBG
void NewEfxThunderBG(struct Anim *anim)
{



    struct ProcEfxBG *proc;
    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxThunderBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = NewEfxThunderBG_frame_config;
    proc->tsal = NewEfxThunderBG_tsa_l;
    proc->tsar = NewEfxThunderBG_tsa_r;

    SpellFx_RegisterBgGfx(Img_ThunderSpellBg, 0x10C0);
    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE) {
        if (GetAnimPosition(proc->anim) == EKR_POS_L)
            SetBgOffset(BG_1, 0x18, 0x0);
        else
            SetBgOffset(BG_1, 0xE8, 0x0);
    }
}

// 0.91 efxmagic-thunder:EfxThunderBGMain
void EfxThunderBGMain(struct ProcEfxBG * proc)
{
    int val, ret;

    val = 0;
    ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);
    if (ret >= 0) {
        u16 * const * buf1 = proc->tsal;
        u16 * const * buf2 = proc->tsar;
        SpellFx_WriteBgMap(proc->anim, buf1[ret], buf2[ret]);

        if (ret == 0)
            val = 0x11F;
        
        if (ret == 1)
            val = 0x150;
        
        FillBGRect(TILEMAP_LOCATED(gBg1Tm, 0x1E, 0x0), 0x2, 0x14, 0x1, val);
        return;
    }

    if (ret == -1) {
        SpellFx_ClearBG1();
        gEfxBgSemaphore--;
        SpellFx_ClearColorEffects();
        Proc_Break(proc);
    }
}

// 9.99 efxmagic-thunder:NewEfxThunderBGCOL
void NewEfxThunderBGCOL(struct Anim * anim)
{

    struct ProcEfxBGCOL *proc;
    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxThunderBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = NewEfxThunderBGCOL_frame_config;
    proc->pal = Pal_ThunderSpellBg;
}

// 9.99 efxmagic-thunder:EfxThunderBGCOL_Loop
void EfxThunderBGCOL_Loop(struct ProcEfxBGCOL * proc)
{
    int ret;
    ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);
    if (ret >= 0) {
        u16 * pal = proc->pal;
        SpellFx_RegisterBgPal(&PAL_BUF_COLOR(pal, ret, 0), 0x20);
        return;
    }

    if (ret == -1) {
        SpellFx_ClearColorEffects();
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}

// 0.84 efxmagic-thunder:NewEfxThunderOBJ
void NewEfxThunderOBJ(struct Anim *anim)
{
    struct ProcEfxOBJ *proc;
    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxThunderOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_EfxThunderOBJ_L, AnimScr_EfxThunderOBJ_R, AnimScr_EfxThunderOBJ_L, AnimScr_EfxThunderOBJ_R);

    SpellFx_RegisterObjPal(Pal_BoltingSprites, 0x20);
    SpellFx_RegisterObjGfx(Img_BoltingSprites, 0x1000);
}

// 0.95 efxmagic-thunder:EfxThunderOBJMain
void EfxThunderOBJMain(struct ProcEfxOBJ * proc)
{
    if (++proc->timer > 0x32) {
        AnimDelete(proc->anim2);
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}

SECTION(".rodata.08BB3404")
const AnimScr AnimScr_EfxThunderOBJ_R[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB2FA8, 14),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB29C0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB2FA8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB29F0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB2FA8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB2A5C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB2FA8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB2ABC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB2FA8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB2B1C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB2FA8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB2B7C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB2FA8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB2BDC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB2FA8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB2C3C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB2FA8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB2C9C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB2FA8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB2CFC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB2FA8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB2D5C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB2FA8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB2DBC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB2FA8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB2E1C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB2FA8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB2E7C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB2FA8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB2EDC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB2FA8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB2F3C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB2FA8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB2FC0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB2FA8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB3020, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB2FA8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB3080, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB2FA8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB30E0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB2FA8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB3140, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB2FA8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB31A0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB2FA8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB3200, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB2FA8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB3260, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB2FA8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB32C0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB2FA8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB3320, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB2FA8, 1),
    ANIMSCR_BLOCKED,
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB3380, 1),
    ANIMSCR_BLOCKED,
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_08BB3398, 1),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BB3F30")
const AnimScr AnimScr_EfxThunderOBJ_L[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3AD4, 14),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB34EC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3AD4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB351C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3AD4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3588, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3AD4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB35E8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3AD4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3648, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3AD4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB36A8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3AD4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3708, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3AD4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3768, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3AD4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB37C8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3AD4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3828, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3AD4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3888, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3AD4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB38E8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3AD4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3948, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3AD4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB39A8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3AD4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3A08, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3AD4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3A68, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3AD4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3AEC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3AD4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3B4C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3AD4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3BAC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3AD4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3C0C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3AD4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3C6C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3AD4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3CCC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3AD4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3D2C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3AD4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3D8C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3AD4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3DEC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3AD4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3E4C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3AD4, 1),
    ANIMSCR_BLOCKED,
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3EAC, 1),
    ANIMSCR_BLOCKED,
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_08BB3EC4, 1),
    ANIMSCR_BLOCKED,
};
