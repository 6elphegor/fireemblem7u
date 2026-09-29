#include "gbafe.h"

extern const struct AnimSpriteData AnimSprite_EfxSong_08BD709C[], AnimSprite_EfxSong_08BD70B4[],
    AnimSprite_EfxSong_08BD70D8[], AnimSprite_EfxSong_08BD70FC[], AnimSprite_EfxSong_08BD712C[],
    AnimSprite_EfxSong_08BD7168[], AnimSprite_EfxSong_08BD71A4[], AnimSprite_EfxSong_08BD71EC[],
    AnimSprite_EfxSong_08BD7234[], AnimSprite_EfxSong_08BD7288[], AnimSprite_EfxSong_08BD72E8[],
    AnimSprite_EfxSong_08BD7354[], AnimSprite_EfxSong_08BD73C0[], AnimSprite_EfxSong_08BD7438[],
    AnimSprite_EfxSong_08BD74B0[], AnimSprite_EfxSong_08BD7528[], AnimSprite_EfxSong_08BD75AC[],
    AnimSprite_EfxSong_08BD7630[], AnimSprite_EfxSong_08BD76CC[], AnimSprite_EfxSong_08BD7768[],
    AnimSprite_EfxSong_08BD7804[], AnimSprite_EfxSong_08BD78A0[], AnimSprite_EfxSong_08BD7948[],
    AnimSprite_EfxSong_08BD79F0[], AnimSprite_EfxSong_08BD7A98[], AnimSprite_EfxSong_08BD7B4C[],
    AnimSprite_EfxSong_08BD7C00[], AnimSprite_EfxSong_08BD7CC0[], AnimSprite_EfxSong_08BD7D80[],
    AnimSprite_EfxSong_08BD7E40[], AnimSprite_EfxSong_08BD7F0C[], AnimSprite_EfxSong_08BD7FD8[],
    AnimSprite_EfxSong_08BD80A4[], AnimSprite_EfxSong_08BD8170[], AnimSprite_EfxSong_08BD823C[],
    AnimSprite_EfxSong_08BD8308[], AnimSprite_EfxSong_08BD83E0[], AnimSprite_EfxSong_08BD84B8[],
    AnimSprite_EfxSong_08BD8590[], AnimSprite_EfxSong_08BD8668[], AnimSprite_EfxSong_08BD874C[],
    AnimSprite_EfxSong_08BD8830[], AnimSprite_EfxSong_08BD8914[], AnimSprite_EfxSong_08BD89F8[],
    AnimSprite_EfxSong_08BD8AD0[], AnimSprite_EfxSong_08BD8B90[], AnimSprite_EfxSong_08BD8C44[],
    AnimSprite_EfxSong_08BD8CEC[], AnimSprite_EfxSong_08BD8D7C[], AnimSprite_EfxSong_08BD8E00[],
    AnimSprite_EfxSong_08BD8E78[], AnimSprite_EfxSong_08BD8EE4[], AnimSprite_EfxSong_08BD8F38[],
    AnimSprite_EfxSong_08BD8F80[], AnimSprite_EfxSong_08BD8FB0[], AnimSprite_EfxSong_08BD8FD4[];

/* auto-decls */
void NewEfxTwobaiRST(struct Anim *anim, int unk44);
extern const struct ProcCmd ProcScr_efxSong[];
extern int gEfxBgSemaphore;
extern const struct ProcCmd ProcScr_efxSongBG[];
extern u16 * TsaArray_SongBg[];
extern u16 * ImgArray_SongBg[];
extern u16 Pal_SongSprites[];
extern const struct ProcCmd ProcScr_efxSongOBJ[];
extern const AnimScr AnimScr_EfxSong[];
extern u16 Img_SongSprites[];
extern const struct ProcCmd ProcScr_efxDance[];

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

void StartSpellAnimSong(struct Anim * anim);
void efxSong_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxSongBG(struct Anim * anim, int kind);
void efxSongBG_Loop(struct ProcEfxEclipseBG * proc);
void StartSubSpell_efxSongOBJ(struct Anim * anim, int kind);
void efxSongOBJ_Loop(struct ProcEfxOBJ * proc);
void StartSpellAnimDance(struct Anim * anim);
void efxDance_Loop_Main(struct ProcEfx * proc);

extern const u16 StartSubSpell_efxSongBG_frames[];

// 9.99 efxmagic-refresh:StartSpellAnimSong
void StartSpellAnimSong(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxSong, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

// 9.99 efxmagic-refresh:efxSong_Loop_Main
void efxSong_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);

    proc->timer++;

    if (proc->timer == 39)
    {
        StartSubSpell_efxSongBG(anim, 0);
        StartSubSpell_efxSongOBJ(anim, 0);

        NewEfxRestWINH_(anim, 130, 1);
        NewEfxTwobaiRST(anim, 100);

        SetBlendAlpha(0, 16);
        NewEfxALPHA(anim, 0, 8, 0, 16, 0);
        NewEfxALPHA(anim, 60, 40, 16, 0, 0);

        PlaySFX(0xef, 0x100, anim->xPosition, 1);
    }

    if (proc->timer == 139)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimStatusChgHitEffects(anim, proc->hitted);

        if (GetAnimPosition(anim) == 0)
        {
            CpuFastCopy(gpEfxUnitPaletteBackup[0], gPal + PAL_OFFSET(0x17), 0x20);
        }
        else
        {
            CpuFastCopy(gpEfxUnitPaletteBackup[1], gPal + PAL_OFFSET(0x19), 0x20);
        }

        EnableEfxStatusUnits(anim);
    }
    else if (proc->timer == 179)
    {
        anim->state3 |= ANIM_BIT3_NEXT_ROUND_START;
        SpellFx_Finish();
        Proc_Break(proc);
    }

    return;
}

// 0.82 efxmagic-refresh:StartSubSpell_efxSongBG
void StartSubSpell_efxSongBG(struct Anim * anim, int kind)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSongBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxSongBG_frames;

    proc->tsal = TsaArray_SongBg;
    proc->tsar = TsaArray_SongBg;

    proc->img = ImgArray_SongBg;
    proc->pal = NULL;

    SpellFx_RegisterBgPal(Pal_SongSprites + kind * 0x10, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    return;
}

// 9.99 efxmagic-refresh:efxSongBG_Loop
void efxSongBG_Loop(struct ProcEfxEclipseBG * proc)
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

// 0.88 efxmagic-refresh:StartSubSpell_efxSongOBJ
void StartSubSpell_efxSongOBJ(struct Anim * anim, int kind)
{
    struct ProcEfxOBJ * proc;
    const AnimScr * scr;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSongOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 56;
    scr = AnimScr_EfxSong;
    proc->anim2 = EfxCreateFrontAnim(anim, scr, scr, scr, scr);

    SpellFx_RegisterObjPal(Pal_SongSprites + kind * 0x10, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_SongSprites, 32 * 4 * CHR_SIZE);

    return;
}

// 9.99 efxmagic-refresh:efxSongOBJ_Loop
void efxSongOBJ_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        AnimDelete(proc->anim2);
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-refresh:StartSpellAnimDance
void StartSpellAnimDance(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxDance, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

// 9.99 efxmagic-refresh:efxDance_Loop_Main
void efxDance_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);

    proc->timer++;

    if (proc->timer == 25)
    {
        StartSubSpell_efxSongBG(anim, 0);
        StartSubSpell_efxSongOBJ(anim, 0);

        NewEfxRestWINH_(anim, 130, 1);
        NewEfxTwobaiRST(anim, 100);

        SetBlendAlpha(0, 16);
        NewEfxALPHA(anim, 0, 8, 0, 16, 0);
        NewEfxALPHA(anim, 60, 40, 16, 0, 0);

        PlaySFX(0xef, 0x100, anim->xPosition, 1);
    }

    if (proc->timer == 125)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimStatusChgHitEffects(anim, proc->hitted);

        if (GetAnimPosition(anim) == 0)
        {
            CpuFastCopy(gpEfxUnitPaletteBackup[0], gPal + PAL_OFFSET(0x17), 0x20);
        }
        else
        {
            CpuFastCopy(gpEfxUnitPaletteBackup[1], gPal + PAL_OFFSET(0x19), 0x20);
        }

        EnableEfxStatusUnits(anim);
    }
    else if (proc->timer == 165)
    {
        anim->state3 |= ANIM_BIT3_NEXT_ROUND_START;
        SpellFx_Finish();
        Proc_Break(proc);
    }

    return;
}

SECTION(".rodata.08BA16A4")
const struct ProcCmd ProcScr_efxSong[] = {
    PROC_19,
    PROC_REPEAT(efxSong_Loop_Main),
    PROC_END,
};

SECTION(".rodata.08BA16BC")
const struct ProcCmd ProcScr_efxSongBG[] = {
    PROC_19,
    PROC_REPEAT(efxSongBG_Loop),
    PROC_END,
};

SECTION(".rodata.08BA17AC")
const struct ProcCmd ProcScr_efxSongOBJ[] = {
    PROC_19,
    PROC_REPEAT(efxSongOBJ_Loop),
    PROC_END,
};

SECTION(".rodata.08BA17C4")
const struct ProcCmd ProcScr_efxDance[] = {
    PROC_19,
    PROC_REPEAT(efxDance_Loop_Main),
    PROC_END,
};

SECTION(".rodata.08BD8FEC")
const AnimScr AnimScr_EfxSong[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD709C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD70B4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD70D8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD70FC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD712C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD7168, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD71A4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD71EC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD7234, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD7288, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD72E8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD7354, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD73C0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD7438, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD74B0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD7528, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD75AC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD7630, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD76CC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD7768, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD7804, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD78A0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD7948, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD79F0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD7A98, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD7B4C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD7C00, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD7CC0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD7D80, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD7E40, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD7F0C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD7FD8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD80A4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD8170, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD823C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD8308, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD83E0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD84B8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD8590, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD8668, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD874C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD8830, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD8914, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD89F8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD8AD0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD8B90, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD8C44, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD8CEC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD8D7C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD8E00, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD8E78, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD8EE4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD8F38, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD8F80, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD8FB0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_08BD8FD4, 1),
    ANIMSCR_BLOCKED,
};
