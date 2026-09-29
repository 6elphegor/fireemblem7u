#include "gbafe.h"

extern const struct AnimSpriteData AnimSprite_Miss_08B9D5B8[], AnimSprite_Miss_08B9D5D0[],
    AnimSprite_Miss_08B9D5E8[], AnimSprite_Miss_08B9D600[], AnimSprite_Miss_08B9D624[],
    AnimSprite_Miss_08B9D648[], AnimSprite_Miss_08B9D66C[], AnimSprite_Miss_08B9D69C[],
    AnimSprite_Miss_08B9D6CC[], AnimSprite_Miss_08B9D6FC[], AnimSprite_Miss_08B9D738[],
    AnimSprite_Miss_08B9D774[], AnimSprite_Miss_08B9D7B0[], AnimSprite_Miss_08B9D7F8[],
    AnimSprite_Miss_08B9D840[], AnimSprite_Miss_08B9D888[], AnimSprite_Miss_08B9D8D0[],
    AnimSprite_Miss_08B9D918[], AnimSprite_Miss_08B9D960[], AnimSprite_Miss_08B9D9A8[],
    AnimSprite_NoDamage_08B9CD00[], AnimSprite_NoDamage_08B9CD24[], AnimSprite_NoDamage_08B9CD48[],
    AnimSprite_NoDamage_08B9CD6C[], AnimSprite_NoDamage_08B9CDA8[], AnimSprite_NoDamage_08B9CDE4[],
    AnimSprite_NoDamage_08B9CE20[], AnimSprite_NoDamage_08B9CE68[], AnimSprite_NoDamage_08B9CEB0[],
    AnimSprite_NoDamage_08B9CEF8[], AnimSprite_NoDamage_08B9CF4C[], AnimSprite_NoDamage_08B9CFA0[],
    AnimSprite_NoDamage_08B9CFF4[], AnimSprite_NoDamage_08B9D054[], AnimSprite_NoDamage_08B9D0B4[],
    AnimSprite_NoDamage_08B9D114[], AnimSprite_NoDamage_08B9D180[], AnimSprite_NoDamage_08B9D1EC[],
    AnimSprite_NoDamage_08B9D258[], AnimSprite_NoDamage_08B9D2D0[], AnimSprite_NoDamage_08B9D348[],
    AnimSprite_NoDamage_08B9D3C0[], AnimSprite_NoDamage_08B9D438[], AnimSprite_NoDamage_08B9D4B0[],
    AnimSprite_NoDamage_08B9D528[], AnimSprite_NoDamage_08B9D5A0[];

/* auto-decls */
// MISSING func GetRoundFlagByAnim
void NewEfxPierceCriticalEffect(struct Anim * anim);
void NewEfxPierceNormalEffect(struct Anim * anim);
extern const struct ProcCmd ProcScr_efxDamageMojiEffect[];
extern u16 Img_NODAMGEMIS[];
extern const struct ProcCmd ProcScr_efxDamageMojiEffectOBJ[];
extern const AnimScr AnimScr_NoDamage[];
extern const AnimScr AnimScr_Miss[];
extern const struct ProcCmd ProcScr_efxCriricalEffect[];
extern const struct ProcCmd ProcScr_efxCriricalEffectBG[];
extern u16 Img_EfxCriricalEffectBG[];
extern u16 Pal_EfxCriricalEffectBG[];
extern u16 Tsa_EfxCriricalEffectBG_L[];
extern u16 Tsa_EfxCriricalEffectBG_R[];
extern const struct ProcCmd ProcScr_efxCriricalEffectBGCOL[];
extern const struct ProcCmd ProcScr_efxNormalEffect[];
extern int gEfxBgSemaphore;
extern const struct ProcCmd ProcScr_efxNormalEffectBG[];
extern u16 * TSAs_EfxNormalEffectBG[];
extern u16 Pal_EfxNormalEffectBG[];
extern u16 Img_EfxNormalEffectBG[];

struct ProcEfxDamageMojiEffectOBJ {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);
    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;
    STRUCT_PAD(0x30, 0x5C);
    /* 5C */ struct Anim * anim;
    /* 60 */ struct ProcEkrSubAnimeEmulator *sub_proc;
};

void NewEfxDamageMojiEffect(struct Anim * anim, int hitted);
void efxDamageMojiEffectMain(struct ProcEfx * proc);
void NewEfxDamageMojiEffectOBJ(struct Anim * anim, int hitted);
void efxDamageMojiEffectOBJMain(struct ProcEfxDamageMojiEffectOBJ * proc);
void efxCriricalEffectMain(struct ProcEfx * proc);
void NewEfxCriricalEffectBG(struct Anim * anim);
void efxCriricalEffectBGMain(struct ProcEfxBG * proc);
void NewEfxCriricalEffectBGCOL(struct Anim * anim);
void efxCriricalEffectBGCOLMain(struct ProcEfxBGCOL * proc);
void efxNormalEffectMain(struct ProcEfx * proc);
void NewEfxNormalEffectBG(struct Anim * anim);
void efxNormalEffectBGMain(struct ProcEfxBG * proc);

extern const u16 NewEfxCriricalEffectBGCOL_frams[];
extern const u16 NewEfxNormalEffectBG_frames[];

// 9.99 efxhit:NewEfxDamageMojiEffect
void NewEfxDamageMojiEffect(struct Anim * anim, int hitted)
{
    struct ProcEfx * proc;
    proc = Proc_Start(ProcScr_efxDamageMojiEffect, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = hitted;
    LZ77UnCompVram(Img_NODAMGEMIS, OBJ_VRAM0 + 0x2000);
}

// 9.99 efxhit:efxDamageMojiEffectMain
void efxDamageMojiEffectMain(struct ProcEfx * proc)
{
    int time = ++proc->timer;
    if (time == 1) {
        NewEfxDamageMojiEffectOBJ(proc->anim, proc->hitted);
        return;
    }

    if (time == 0xA) {
        Proc_Break(proc);
        return;
    }
}

// 9.99 efxhit:NewEfxDamageMojiEffectOBJ
void NewEfxDamageMojiEffectOBJ(struct Anim * anim, int hitted)
{
    u16 val1;
    const AnimScr * anim_scr;
    struct ProcEfxDamageMojiEffectOBJ * proc;
    proc = Proc_Start(ProcScr_efxDamageMojiEffectOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    if (hitted == 0) {
        proc->terminator = 0x32;
        anim_scr = AnimScr_NoDamage;
    } else {
        proc->terminator = 0x32;
        anim_scr = AnimScr_Miss;
    }

    val1 = GetAnimPosition(anim) == EKR_POS_L ? 0x6100 : 0x5100;
    proc->sub_proc = NewEkrsubAnimeEmulator(
        anim->xPosition,
        anim->yPosition - 0x28,
        anim_scr,
        2, val1, 0, PROC_TREE_3
    );
}

// 9.99 efxhit:efxDamageMojiEffectOBJMain
void efxDamageMojiEffectOBJMain(struct ProcEfxDamageMojiEffectOBJ * proc)
{
    proc->sub_proc->x1 = proc->anim->xPosition;

    if (++proc->timer > proc->terminator) {
        Proc_End(proc->sub_proc);
        Proc_Break(proc);
    }
}

// 9.99 efxhit:NewEfxPierceCritical
void NewEfxPierceCritical(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_SetBG1Position();
    proc = Proc_Start(ProcScr_efxCriricalEffect, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
}

// 9.99 efxhit:efxCriricalEffectMain
void efxCriricalEffectMain(struct ProcEfx * proc)
{
    int time = ++proc->timer;
    if (time == 1) {
        NewEfxCriricalEffectBG(proc->anim);
        NewEfxCriricalEffectBGCOL(proc->anim);
        return;
    }

    if (time == 0x11)
        Proc_Break(proc);
}

// 9.99 efxhit:NewEfxCriricalEffectBG
void NewEfxCriricalEffectBG(struct Anim * anim)
{
    struct ProcEfxBG * proc;
    proc = Proc_Start(ProcScr_efxCriricalEffectBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    SpellFx_RegisterBgGfx(Img_EfxCriricalEffectBG, 0x2000);
    SpellFx_RegisterBgPal(Pal_EfxCriricalEffectBG, 0x20);
    SpellFx_WriteBgMap(proc->anim, Tsa_EfxCriricalEffectBG_L, Tsa_EfxCriricalEffectBG_R);
    SpellFx_SetSomeColorEffect();
}

// 9.99 efxhit:efxCriricalEffectBGMain
void efxCriricalEffectBGMain(struct ProcEfxBG * proc)
{
    if (++proc->timer == 0x11) {
        SpellFx_ClearBG1();
        SpellFx_ClearColorEffects();
        Proc_Break(proc);
    }
}

// 9.99 efxhit:NewEfxCriricalEffectBGCOL
void NewEfxCriricalEffectBGCOL(struct Anim * anim)
{

    struct ProcEfxBGCOL * proc;
    proc = Proc_Start(ProcScr_efxCriricalEffectBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = NewEfxCriricalEffectBGCOL_frams;
    proc->pal = Pal_EfxCriricalEffectBG;
}

// 9.99 efxhit:efxCriricalEffectBGCOLMain
void efxCriricalEffectBGCOLMain(struct ProcEfxBGCOL * proc)
{
    int ret;
    ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);
    if (ret >= 0) {
        u16 *pal = proc->pal;
        SpellFx_RegisterBgPal(&PAL_BUF_COLOR(pal, ret, 0), 0x20);
        return;
    }

    if (ret == -1) {
        Proc_Break(proc);
        return;
    }
}

// 9.99 efxhit:NewEfxNormalEffect
void NewEfxNormalEffect(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_SetBG1Position();
    proc = Proc_Start(ProcScr_efxNormalEffect, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
}

// 9.99 efxhit:efxNormalEffectMain
void efxNormalEffectMain(struct ProcEfx * proc)
{
    int time;
    struct Anim * anim1 = GetAnimAnotherSide(proc->anim);

    time = ++proc->timer;

    if (time == 1) {
        NewEfxFlashBgWhite(proc->anim, 0x4);
        return;
    }

    if (time == 0x4) {
        NewEfxNormalEffectBG(anim1);
        return;
    }

    if (time == 0x18) {
        Proc_Break(proc);
        return;
    }
}

// 9.99 efxhit:NewEfxNormalEffectBG
void NewEfxNormalEffectBG(struct Anim * anim)
{

    struct ProcEfxBG * proc;
    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxNormalEffectBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = NewEfxNormalEffectBG_frames;
    proc->tsal = TSAs_EfxNormalEffectBG;
    proc->tsar = TSAs_EfxNormalEffectBG;

    SpellFx_RegisterBgPal(Pal_EfxNormalEffectBG, 0x20);
    SpellFx_RegisterBgGfx(Img_EfxNormalEffectBG, 0x2000);
    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE) {
        if (GetAnimPosition(proc->anim) == EKR_POS_L)
            SetBgOffset(BG_1, 0x18, 0);
        else
            SetBgOffset(BG_1, 0xE8, 0);
    }
}

// 9.99 efxhit:efxNormalEffectBGMain
void efxNormalEffectBGMain(struct ProcEfxBG * proc)
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

SECTION(".rodata.08BA41D4")
const struct ProcCmd ProcScr_efxDamageMojiEffect[] = {
    PROC_19,
    PROC_REPEAT(efxDamageMojiEffectMain),
    PROC_END,
};

SECTION(".rodata.08BA41EC")
const struct ProcCmd ProcScr_efxDamageMojiEffectOBJ[] = {
    PROC_19,
    PROC_REPEAT(efxDamageMojiEffectOBJMain),
    PROC_END,
};

SECTION(".rodata.08BA4204")
const struct ProcCmd ProcScr_efxCriricalEffect[] = {
    PROC_19,
    PROC_REPEAT(efxCriricalEffectMain),
    PROC_END,
};

SECTION(".rodata.08BA421C")
const struct ProcCmd ProcScr_efxCriricalEffectBG[] = {
    PROC_19,
    PROC_REPEAT(efxCriricalEffectBGMain),
    PROC_END,
};

SECTION(".rodata.08BA4234")
const struct ProcCmd ProcScr_efxCriricalEffectBGCOL[] = {
    PROC_19,
    PROC_MARK(10),
    PROC_REPEAT(efxCriricalEffectBGCOLMain),
    PROC_END,
};

SECTION(".rodata.08BA4254")
const struct ProcCmd ProcScr_efxNormalEffect[] = {
    PROC_19,
    PROC_REPEAT(efxNormalEffectMain),
    PROC_END,
};

SECTION(".rodata.08BA426C")
const struct ProcCmd ProcScr_efxNormalEffectBG[] = {
    PROC_19,
    PROC_REPEAT(efxNormalEffectBGMain),
    PROC_END,
};

SECTION(".rodata.08B9D9F0")
const AnimScr AnimScr_NoDamage[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage_08B9CD00, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage_08B9CD24, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage_08B9CD48, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage_08B9CD6C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage_08B9CDA8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage_08B9CDE4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage_08B9CE20, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage_08B9CE68, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage_08B9CEB0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage_08B9CEF8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage_08B9CF4C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage_08B9CFA0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage_08B9CFF4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage_08B9D054, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage_08B9D0B4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage_08B9D114, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage_08B9D180, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage_08B9D1EC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage_08B9D258, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage_08B9D2D0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage_08B9D348, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage_08B9D3C0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage_08B9D438, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage_08B9D4B0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage_08B9D528, 31),
    ANIMSCR_WAIT(0x13),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage_08B9D5A0, 31),
    ANIMSCR_WAIT(0x13),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08B9DA64")
const AnimScr AnimScr_Miss[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_Miss_08B9D5B8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_Miss_08B9D5D0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_Miss_08B9D5E8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_Miss_08B9D600, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_Miss_08B9D624, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_Miss_08B9D648, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_Miss_08B9D66C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_Miss_08B9D69C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_Miss_08B9D6CC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_Miss_08B9D6FC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_Miss_08B9D738, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_Miss_08B9D774, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_Miss_08B9D7B0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_Miss_08B9D7F8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_Miss_08B9D840, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_Miss_08B9D888, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_Miss_08B9D8D0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_Miss_08B9D918, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_Miss_08B9D960, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_Miss_08B9D9A8, 31),
    ANIMSCR_WAIT(0x13),
    ANIMSCR_FORCE_SPRITE(AnimSprite_NoDamage_08B9D5A0, 31),
    ANIMSCR_WAIT(0x13),
    ANIMSCR_BLOCKED,
};
