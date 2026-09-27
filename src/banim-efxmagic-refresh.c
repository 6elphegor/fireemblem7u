#include "gbafe.h"

/* auto-decls */
void NewEfxTwobaiRST(struct Anim *anim, int unk44);
extern struct ProcCmd ProcScr_efxSong[];
extern int gEfxBgSemaphore;
extern struct ProcCmd ProcScr_efxSongBG[];
extern u16 * TsaArray_SongBg[];
extern u16 * ImgArray_SongBg[];
extern u16 Pal_SongSprites[];
extern struct ProcCmd ProcScr_efxSongOBJ[];
extern u32 AnimScr_EfxSong[];
extern u16 Img_SongSprites[];
extern struct ProcCmd ProcScr_efxDance[];

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
    u32 * scr;

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
