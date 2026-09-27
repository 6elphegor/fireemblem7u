#include "gbafe.h"

/* auto-decls */
extern u16 Img_Spell11Bg[];
extern u16 Tsa_Spell11Bg[];
void NewEfxFarAttackWithDistance(struct Anim * anim, s16 arg);
void sub_08057514(struct Anim * anim, int a);
void sub_08057608(struct Anim * anim, int a);
void NewEfxSpellCast(void);
void StartSubSpell_efxIcebreathOBJ(struct Anim * anim);
void EfxPlayHittedSFX(struct Anim * anim);
void RegisterEfxSpellCastEnd(void);
extern int gEfxBgSemaphore;
extern u16 Pal_Spell11Bg[];

void sub_0805743C(struct Anim *anim);
void sub_08057478(struct ProcEfx * proc);
void sub_08057714(struct Anim * anim);
void sub_08057750(struct ProcEfxBGCOL * proc);

extern const u16 sub_08057714_frame_config[];

void sub_080575D4(struct ProcEfxBG * proc);
void sub_0805764C(struct ProcEfxOBJ * proc);

CONST_DATA struct ProcCmd ProcScr_efxSpell11[] = {
    PROC_19,
    PROC_REPEAT(sub_08057478),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_efxSpell11BG[] = {
    PROC_19,
    PROC_REPEAT(sub_080575D4),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_efxSpell11BGScroll[] = {
    PROC_19,
    PROC_REPEAT(sub_0805764C),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_efxSpell11BGCOL[] = {
    PROC_19,
    PROC_MARK(10),
    PROC_REPEAT(sub_08057750),
    PROC_END,
};

// 9.99 efxmagic-thunder:StartSpellAnimThunder
void sub_0805743C(struct Anim *anim)
{
    struct ProcEfx *proc;
    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxSpell11, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));
}

void sub_08057478(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int cur = ++proc->timer;

    if (cur == 1)
    {
        NewEfxFlashBgWhite(proc->anim, 6);
        return;
    }

    if (cur == 6)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
        sub_08057514(anim, 9);
        sub_08057608(anim, 9);
        sub_08057714(anim);
        PlaySFX(0x10C, 0x100, anim->xPosition, 1);
        return;
    }

    if (cur == 10)
    {
        anim->state3 |= ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED;
        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (proc->hitted == 0)
            EfxPlayHittedSFX(anim);

        return;
    }

    if (cur == 25)
        return;

    if (cur == 30)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }
}

void sub_08057514(struct Anim * anim, int terminator)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSpell11BG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;

    SpellFx_RegisterBgPal(Pal_Spell11Bg, 0x20);
    SpellFx_RegisterBgGfx(Img_Spell11Bg, 0x2000);
    LZ77UnCompWram(Tsa_Spell11Bg, gEkrTsaBuffer);

    if (GetAnimPosition(proc->anim) == 0)
        EfxTmCpyBG(gEkrTsaBuffer, gBg1Tm, 32, 20, 1, 0x100);
    else
        EfxTmCpyBgHFlip(gEkrTsaBuffer, gBg1Tm, 32, 20, 1, 0x100);

    EnableBgSync(BG1_SYNC_BIT);
    SpellFx_SetSomeColorEffect();
    SetWinEnable(0, 0, 0);
}

void sub_080575D4(struct ProcEfxBG * proc)
{
    proc->timer++;
    if (proc->timer == proc->terminator)
    {
        SpellFx_ClearBG1();
        gEfxBgSemaphore--;
        SpellFx_ClearColorEffects();
        Proc_Break(proc);
    }
}

void sub_08057608(struct Anim * anim, int terminator)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSpell11BGScroll, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;

    if (GetAnimPosition(anim) == 0)
        proc->unk44 = 0xD8;
    else
        proc->unk44 = -0xD8;
}

void sub_0805764C(struct ProcEfxOBJ * proc)
{
    int x;

    gDispIo.bg_off[1].x = Interpolate(0, 0, proc->unk44, proc->timer, proc->terminator);

    if (GetAnimPosition(proc->anim) == 0)
        x = (gDispIo.bg_off[1].x >> 3) + 30;
    else
        x = (gDispIo.bg_off[1].x >> 3) - 1;

    FillBGRect(gBg1Tm + (x & 0x1F), 1, 20, 1, 0x100);
    FillBGRect(gBg1Tm + ((x + 1) & 0x1F), 1, 20, 1, 0x100);
    FillBGRect(gBg1Tm + ((x + 2) & 0x1F), 1, 20, 1, 0x100);
    EnableBgSync(BG1_SYNC_BIT);

    if (++proc->timer > proc->terminator)
    {
        gEfxBgSemaphore--;
        SpellFx_ClearBG1();
        Proc_Break(proc);
    }
}

// 9.99 efxmagic-thunder:NewEfxThunderBGCOL
void sub_08057714(struct Anim * anim)
{

    struct ProcEfxBGCOL *proc;
    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxSpell11BGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = sub_08057714_frame_config;
    proc->pal = Pal_Spell11Bg;
}

// 9.99 efxmagic-thunder:EfxThunderBGCOL_Loop
void sub_08057750(struct ProcEfxBGCOL * proc)
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
