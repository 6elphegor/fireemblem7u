#include "gbafe.h"

extern u16 Tsa_LuceBG_00[], Tsa_LuceBG_01[], Tsa_LuceBG_02[], Tsa_LuceBG_03[], Tsa_LuceBG_04[],
    Tsa_LuceBG_05[], Tsa_LuceBG_06[], Tsa_LuceBG_07[], Tsa_LuceBG_08[], Tsa_LuceBG_09[],
    Tsa_LuceBG_0A[], Tsa_LuceBG_0B[];

extern const struct AnimSpriteData AnimSprite_LuceOBJ_A_08BD4B7C[], AnimSprite_LuceOBJ_A_08BD4BE8[],
    AnimSprite_LuceOBJ_A_08BD4C54[], AnimSprite_LuceOBJ_A_08BD4CC0[],
    AnimSprite_LuceOBJ_A_08BD4D2C[], AnimSprite_LuceOBJ_A_08BD4D98[],
    AnimSprite_LuceOBJ_A_08BD4E04[], AnimSprite_LuceOBJ_A_08BD4E70[],
    AnimSprite_LuceOBJ_A_08BD4EDC[], AnimSprite_LuceOBJ_A_08BD4F48[],
    AnimSprite_LuceOBJ_A_08BD4F84[], AnimSprite_LuceOBJ_A_08BD4FF0[],
    AnimSprite_LuceOBJ_A_08BD505C[], AnimSprite_LuceOBJ_A_08BD50C8[],
    AnimSprite_LuceOBJ_A_08BD5134[], AnimSprite_LuceOBJ_A_08BD51A0[],
    AnimSprite_LuceOBJ_A_08BD51B8[], AnimSprite_LuceOBJ_A_08BD5224[],
    AnimSprite_LuceOBJ_A_08BD5290[], AnimSprite_LuceOBJ_A_08BD52FC[],
    AnimSprite_LuceOBJ_A_08BD5368[], AnimSprite_LuceOBJ_B_08BD4354[],
    AnimSprite_LuceOBJ_B_08BD439C[], AnimSprite_LuceOBJ_B_08BD4414[],
    AnimSprite_LuceOBJ_B_08BD44C8[], AnimSprite_LuceOBJ_B_08BD45F4[],
    AnimSprite_LuceOBJ_B_08BD4774[], AnimSprite_LuceOBJ_B_08BD4948[];

/* auto-decls */
void NewEfxSpellCast(void);
void NewEfxFarAttackWithDistance(struct Anim * anim, s16 arg);
void EfxPlayHittedSFX(struct Anim * anim);
void RegisterEfxSpellCastEnd(void);
void sub_0805067C(const u16 * src, u16 * dst, u32 cur, u32 len_src, u32 len_dst);
extern int gEfxBgSemaphore;
extern struct Anim * gUnknown_02000010[2];
extern const struct ProcCmd ProcScr_efxLuce[];
extern const struct ProcCmd ProcScr_efxLuceBG[];
extern const struct ProcCmd ProcScr_efxLuceBG2[];
extern const struct ProcCmd ProcScr_efxLuceBGCOL[];
extern const struct ProcCmd ProcScr_efxLuceOBJ[];
extern const struct ProcCmd ProcScr_efxLuceWOUT[];
extern const s16 FrameConfig_LuceBG[];
extern const s16 FrameConfig_LuceBGCOL[];
extern u16 * const TsaArray_LuceBG[];
extern u16 Img_AuraBg1[];
extern u16 Pal_AuraBg1[];
extern u16 Img_LuceBG2[];
extern u16 Pal_LuceBG2[];
extern u16 Tsa_LuceBG2[];
extern u16 Img_LuceBGCOL[];
extern u16 Pal_LuceBGCOL[];
extern u16 Tsa_LuceBGCOL[];
extern const AnimScr AnimScr_LuceOBJ_A[];
extern const AnimScr AnimScr_LuceOBJ_B[];
extern u16 Pal_LuceOBJ[];
extern u16 Img_LuceOBJ[];

void StartSpellBG_LuceBG(struct Anim * anim);
void StartSubSpell_efxLuceBG2(struct Anim * anim, int terminator);
void sub_08061760(struct Anim * anim, int terminator);
void sub_080617DC(struct Anim * anim, int terminator);
void StartSubSpell_efxLuceWOUT(struct Anim * anim, int duration, int terminator);
void StartSubSpell_efxLuceBGCOL(struct Anim * anim, int terminator);

void StartSubSpell_efxLuceWOUT(struct Anim * anim, int duration, int terminator);
void efxLuceWOUT_Loop(struct ProcEfxOBJ * proc);



void StartSpellAnimLuce(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxLuce, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));
}

void efxLuce_Loop(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
        NewEfxFarAttackWithDistance(proc->anim, -1);

    if (proc->timer == duration + 1)
    {
        NewEfxFlashBgWhite(anim, 10);
    }
    else if (proc->timer == duration + 11)
    {
        StartSpellBG_LuceBG(anim);
        PlaySFX(0x2C4, 0x100, 0x78, 0);
    }
    else if (proc->timer == duration + 26)
    {
        StartSubSpell_efxLuceBGCOL(anim, 114);
        SetBlendAlpha(0, 16);
        NewEfxALPHA(anim, 10, 10, 0, 16, 0);
        PlaySFX(0x2C5, 0x100, 0x78, 0);
    }
    else if (proc->timer == duration + 76)
    {
        sub_08061760(anim, 60);
        sub_080617DC(anim, 60);
    }
    else if (proc->timer == duration + 86)
    {
        StartSubSpell_efxLuceWOUT(anim, 55, 45);
    }
    else if (proc->timer == duration + 141)
    {
        anim->state3 |= ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED;
        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (proc->hitted == 0)
            EfxPlayHittedSFX(anim);
    }
    else if (proc->timer == duration + 142)
    {
        StartSpellThing_MagicQuake(anim, 100, 10);
        StartSubSpell_efxLuceBG2(anim, 100);
        NewEfxALPHA(anim, 80, 20, 16, 0, 0);
        PlaySFX(0x2C6, 0x100, 0x78, 0);
    }
    else if (proc->timer == duration + 245)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }
}

void StartSpellBG_LuceBG(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxLuceBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = FrameConfig_LuceBG;
    proc->tsal = TsaArray_LuceBG;
    proc->tsar = TsaArray_LuceBG;

    SpellFx_RegisterBgGfx(Img_AuraBg1, 0x2000);
    SpellFx_RegisterBgPal(Pal_AuraBg1, 0x20);
    SetBgOffset(BG_1, 0, 0);
    SpellFx_SetSomeColorEffect();
}

void efxLuceBG_Loop(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 * const * tsaL = proc->tsal;
        u16 * const * tsaR = proc->tsar;
        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
    }
    else if (ret == -1)
    {
        SpellFx_ClearBG1();
        gEfxBgSemaphore--;
        SpellFx_ClearColorEffects();
        Proc_Break(proc);
    }
}

void StartSubSpell_efxLuceBG2(struct Anim * anim, int terminator)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxLuceBG2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;

    SpellFx_RegisterBgGfx(Img_LuceBG2, 0x2000);
    SpellFx_RegisterBgPal(Pal_LuceBG2, 0x20);
    SpellFx_ClearBG1();
    LZ77UnCompWram(Tsa_LuceBG2, gEkrTsaBuffer);
    EfxTmCpyBG(gEkrTsaBuffer, gBg1Tm, 32, 32, 1, 0x100);
    EnableBgSync(BG1_SYNC_BIT);
    SpellFx_SetSomeColorEffect();
    SetBgOffset(BG_1, 0, 0);
    SetWinEnable(0, 0, 0);
}

void efxLuceBG2_OnEnd(void)
{
    SpellFx_ClearBG1();
    gEfxBgSemaphore--;
    SpellFx_ClearColorEffects();
}

void efxLuceBG2_Loop(struct ProcEfxBG * proc)
{
    if (GetAnimPosition(proc->anim) == EKR_POS_L)
        gDispIo.bg_off[BG_1].x += 12;
    else
        gDispIo.bg_off[BG_1].x -= 12;

    if (++proc->timer > proc->terminator)
        Proc_Break(proc);
}

void sub_08061760(struct Anim * anim, int terminator)
{
    struct ProcEfxOBJ * proc;
    struct Anim * front;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxLuceOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;

    front = proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_LuceOBJ_A, AnimScr_LuceOBJ_A, AnimScr_LuceOBJ_A, AnimScr_LuceOBJ_A);
    front->xPosition = 0x78;
    front->yPosition = 0x48;
    front->oam2Base = (front->oam2Base & ~0xC00) | 0x400;

    SpellFx_RegisterObjPal(Pal_LuceOBJ, 0x20);
    SpellFx_RegisterObjGfx(Img_LuceOBJ, 0x1000);
}

void sub_080617DC(struct Anim * anim, int terminator)
{
    struct ProcEfxOBJ * proc;
    struct Anim * front;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxLuceOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;

    front = proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_LuceOBJ_B, AnimScr_LuceOBJ_B, AnimScr_LuceOBJ_B, AnimScr_LuceOBJ_B);
    front->xPosition = 0x78;
    front->yPosition = 0x48;
    front->oam2Base = (front->oam2Base & ~0xC00) | 0x400;
}

void efxLuceOBJ_Loop(struct ProcEfxOBJ * proc)
{
    if (++proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }
}

// 9.99 efxmagic-ivaldi:StartSubSpell_efxIvaldiWOUT
void StartSubSpell_efxLuceWOUT(struct Anim * anim, int duration, int terminator)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxLuceWOUT, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;

    NewEfxFlashBgWhite(anim, duration);

    return;
}

// 9.99 efxmagic-ivaldi:efxIvaldiWOUT_Loop
void efxLuceWOUT_Loop(struct ProcEfxOBJ * proc)
{
    int val = Interpolate(INTERPOLATE_LINEAR, 0, 16, proc->timer, proc->terminator);

    CpuFastCopy(gPal, gEfxPal, 0x400);
    EfxPalWhiteInOut(gEfxPal, 0, 0x20, val);

    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}

void StartSubSpell_efxLuceBGCOL(struct Anim * anim, int terminator)
{
    struct ProcEfxBGCOL * proc;
    struct Anim * other;
    struct Anim * anim3;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxLuceBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->timer2 = 0;
    proc->terminator = terminator;
    proc->frame = 0;
    proc->frame_config = FrameConfig_LuceBGCOL;
    proc->pal = Pal_LuceBGCOL + 0x10;

    SpellFx_RegisterBgGfx(Img_LuceBGCOL, 0x2000);
    SpellFx_RegisterBgPal(Pal_LuceBGCOL, 0x20);
    SpellFx_WriteBgMap(proc->anim, Tsa_LuceBGCOL, Tsa_LuceBGCOL);

    if (GetEkrDragonStatusType(gAnims[0]) == 0)
    {
        gDispIo.bg0_ct.priority = 0;
        gDispIo.bg2_ct.priority = 1;
        gDispIo.bg1_ct.priority = 2;
        gDispIo.bg3_ct.priority = 3;
    }
    else
    {
        gDispIo.bg0_ct.priority = 0;
        gDispIo.bg3_ct.priority = 1;
        gDispIo.bg1_ct.priority = 2;
        gDispIo.bg2_ct.priority = 3;
    }

    other = GetAnimAnotherSide(proc->anim);
    anim->oam2Base &= ~OAM2_LAYER(3);
    anim->oam2Base |= OAM2_LAYER(1);
    other->oam2Base &= ~OAM2_LAYER(3);
    other->oam2Base |= OAM2_LAYER(1);

    anim3 = gUnknown_02000010[GetAnimPosition(other)];
    if (anim3 != NULL)
    {
        anim3->oam2Base &= ~OAM2_LAYER(3);
        anim3->oam2Base |= OAM2_LAYER(1);
    }
}

void efxLuceBGCOL_Loop(struct ProcEfxBGCOL * proc)
{
    s16 ret;
    struct Anim * other = GetAnimAnotherSide(proc->anim);
    struct Anim * anim3 = gUnknown_02000010[GetAnimPosition(other)];

    if (anim3 != NULL)
        anim3->oam2Base = (anim3->oam2Base & 0xF3FF) | 0x400;

    ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
        sub_0805067C(proc->pal, gPal + 1, ret, 15, 15);

    if (++proc->timer2 > proc->terminator)
    {
        gEfxBgSemaphore--;

        if (GetEkrDragonStatusType(gAnims[0]) == 0)
        {
            gDispIo.bg0_ct.priority = 0;
            gDispIo.bg1_ct.priority = 1;
            gDispIo.bg2_ct.priority = 2;
            gDispIo.bg3_ct.priority = 3;
        }
        else
        {
            gDispIo.bg0_ct.priority = 0;
            gDispIo.bg1_ct.priority = 1;
            gDispIo.bg3_ct.priority = 2;
            gDispIo.bg2_ct.priority = 3;
        }

        proc->anim->oam2Base &= 0xF3FF;
        proc->anim->oam2Base |= 0x800;
        other->oam2Base = (other->oam2Base & 0xF3FF) | 0x800;

        if (anim3 != NULL)
            anim3->oam2Base = (anim3->oam2Base & 0xF3FF) | 0x800;

        Proc_Break(proc);
    }
}

SECTION(".rodata.08BA3E5C")
const struct ProcCmd ProcScr_efxLuce[] = {
    PROC_19,
    PROC_REPEAT(efxLuce_Loop),
    PROC_END,
};

SECTION(".rodata.08BA3E74")
const struct ProcCmd ProcScr_efxLuceBG[] = {
    PROC_19,
    PROC_REPEAT(efxLuceBG_Loop),
    PROC_END,
};

SECTION(".rodata.08BA3EBC")
const struct ProcCmd ProcScr_efxLuceBG2[] = {
    PROC_19,
    PROC_SET_END_CB(efxLuceBG2_OnEnd),
    PROC_REPEAT(efxLuceBG2_Loop),
    PROC_END,
};

SECTION(".rodata.08BA3EDC")
const struct ProcCmd ProcScr_efxLuceOBJ[] = {
    PROC_19,
    PROC_REPEAT(efxLuceOBJ_Loop),
    PROC_END,
};

SECTION(".rodata.08BA3EF4")
const struct ProcCmd ProcScr_efxLuceWOUT[] = {
    PROC_19,
    PROC_REPEAT(efxLuceWOUT_Loop),
    PROC_END,
};

SECTION(".rodata.08BA3F0C")
const struct ProcCmd ProcScr_efxLuceBGCOL[] = {
    PROC_19,
    PROC_REPEAT(efxLuceBGCOL_Loop),
    PROC_END,
};

SECTION(".rodata.08BD53D4")
const AnimScr AnimScr_LuceOBJ_A[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_LuceOBJ_A_08BD4B7C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LuceOBJ_A_08BD4BE8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LuceOBJ_A_08BD4C54, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LuceOBJ_A_08BD4CC0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LuceOBJ_A_08BD4D2C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LuceOBJ_A_08BD4D98, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LuceOBJ_A_08BD4E04, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LuceOBJ_A_08BD4E70, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LuceOBJ_A_08BD4EDC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LuceOBJ_A_08BD4F48, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LuceOBJ_A_08BD51A0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LuceOBJ_A_08BD4F84, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LuceOBJ_A_08BD51A0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LuceOBJ_A_08BD4FF0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LuceOBJ_A_08BD51A0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LuceOBJ_A_08BD505C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LuceOBJ_A_08BD51A0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LuceOBJ_A_08BD50C8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LuceOBJ_A_08BD51A0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LuceOBJ_A_08BD5134, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LuceOBJ_A_08BD51A0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LuceOBJ_A_08BD51B8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LuceOBJ_A_08BD51A0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LuceOBJ_A_08BD5224, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LuceOBJ_A_08BD51A0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LuceOBJ_A_08BD5290, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LuceOBJ_A_08BD51A0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LuceOBJ_A_08BD52FC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LuceOBJ_A_08BD51A0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LuceOBJ_A_08BD5368, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LuceOBJ_A_08BD51A0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LuceOBJ_A_08BD5368, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LuceOBJ_A_08BD51A0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LuceOBJ_A_08BD5368, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LuceOBJ_A_08BD51A0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LuceOBJ_A_08BD5368, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LuceOBJ_A_08BD51A0, 2),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BD546C")
const AnimScr AnimScr_LuceOBJ_B[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_LuceOBJ_A_08BD51A0, 4),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LuceOBJ_B_08BD4354, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LuceOBJ_B_08BD439C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LuceOBJ_B_08BD4414, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LuceOBJ_B_08BD44C8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LuceOBJ_B_08BD45F4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LuceOBJ_B_08BD4774, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_LuceOBJ_B_08BD4948, 31),
    ANIMSCR_WAIT(0x13),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BA3E8C")
u16 * const TsaArray_LuceBG[] = {
    Tsa_LuceBG_00,
    Tsa_LuceBG_01,
    Tsa_LuceBG_02,
    Tsa_LuceBG_03,
    Tsa_LuceBG_04,
    Tsa_LuceBG_05,
    Tsa_LuceBG_06,
    Tsa_LuceBG_07,
    Tsa_LuceBG_08,
    Tsa_LuceBG_09,
    Tsa_LuceBG_0A,
    Tsa_LuceBG_0B,
};
