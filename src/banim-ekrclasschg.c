#include "gbafe.h"

/**
 * Class change (promotion) battle animation (fireemblem8u: banim-ekrclasschg.c)
 */

struct ProcEkrClasschg {
    PROC_HEADER;

    /* 29 */ u8 done;

    STRUCT_PAD(0x2A, 0x2C);

    /* 2C */ s16 timer;

    STRUCT_PAD(0x2E, 0x5C);

    /* 5C */ struct Anim * anim;
};

struct ProcEfxClasschgInOutUnit {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);

    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;
    /* 30 */ STRUCT_PAD(0x30, 0x32);
    /* 32 */ s16 start;
    /* 34 */ s16 end;

    STRUCT_PAD(0x36, 0x5C);

    /* 5C */ struct Anim * anim;
};

struct ProcSubEkrClasschgRST {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x4C);

    /* 4C */ int unk4C;
};

struct ProcEkrClasschgRST {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);

    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;

    STRUCT_PAD(0x30, 0x44);

    /* 44 */ int start;
    /* 48 */ int end;

    STRUCT_PAD(0x4C, 0x5C);

    /* 5C */ struct Anim * anim;

    STRUCT_PAD(0x60, 0x64);

    /* 64 */ struct ProcSubEkrClasschgRST * subproc;
};

extern struct ProcEkrClasschg * gpProcEkrClasschg;
extern int gEfxBgSemaphore;

extern const u16 FrameLut_EkrClasschgBG1[];
extern const u16 FrameLut_EkrClasschgBG2[];
extern AnimScr AnimScr_EfxClasschgOBJ[];
extern const u16 Pal_BoltingSprites[];
extern const u8 Img_BoltingSprites[];
extern const u16 Pal_EfxClasschgFIN[];
extern const u8 Img_EfxClasschgFIN[];
extern const u16 Tsa_EfxClasschgFIN[];

void NewEfxSpellCast(void);
void RegisterEfxSpellCastEnd(void);
void NewEfxWhiteOUT(struct Anim * anim, int duartion, int duartion2);
ProcPtr NewefxRestRST(struct Anim * anim, int duration, int a, int b, int c);
void PlaySFX(int songid, int volume, int locate, int type);
void NewEkrClasschgBG1(struct Anim * anim);
void NewEkrClasschgBG2(struct Anim * anim);
void NewEfxClasschgBGSE00(struct Anim * anim);
void NewEfxClasschgBGSE01(struct Anim * anim);
void NewEfxClasschgOBJ(struct Anim * anim);
void NewEfxClasschgFIN(struct Anim * anim, int duration);
void NewEfxClasschgCLONE(struct Anim * anim, int duration);
void NewEfxBlackInOutUnit(struct Anim * anim, int duration, int arg);
void NewEfxClasschgRST(struct Anim * anim, struct ProcSubEkrClasschgRST * subproc, int duration, int start, int end);

void EfxBlackInOutUnitMain(struct ProcEfxClasschgInOutUnit * proc);
void EfxClasschgBGSE00Main(struct ProcEfxBG * proc);
void EfxClasschgBGSE01Main(struct ProcEfxBG * proc);
void EfxClasschgBgMain(struct ProcEfxBG * proc);
void EfxClasschgCloneCallBack(void);
void EfxClasschgCloneMain(struct ProcEfxBG * proc);
void EfxClasschgFinMain(struct ProcEfxBG * proc);
void EfxClasschgOBJMain(struct ProcEfxOBJ * proc);
void EfxClasschgRSTMain(struct ProcEkrClasschgRST * proc);
void EkrClasschgMain(struct ProcEkrClasschg * proc);
void EkrClasschgRegisterDone(struct ProcEkrClasschg * proc);

CONST_DATA struct ProcCmd ProcScr_ekrClasschg[] = {
    PROC_19,
    PROC_REPEAT(EkrClasschgMain),
    PROC_REPEAT(EkrClasschgRegisterDone),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_efxClasschgBG[] = {
    PROC_19,
    PROC_REPEAT(EfxClasschgBgMain),
    PROC_END,
};

CONST_DATA u16 * TsaLut_EkrClasschgBG[] = {
    (u16 *) 0x081F65C0,
    (u16 *) 0x081F6778,
    (u16 *) 0x081F690C,
    (u16 *) 0x081F6AC4,
    (u16 *) 0x081F6C88,
    (u16 *) 0x081F6DC4,
    (u16 *) 0x081F6E5C,
    (u16 *) 0x081F6F50,
    (u16 *) 0x081F7040,
    (u16 *) 0x081F7130,
    (u16 *) 0x081F7298,
    (u16 *) 0x081F73AC,
    (u16 *) 0x081F7528,
    (u16 *) 0x081F7650,
    (u16 *) 0x081F7834,
    (u16 *) 0x081F7984,
    (u16 *) 0x081F7B10,
    (u16 *) 0x081F7BFC,
    (u16 *) 0x081F7CDC,
    (u16 *) 0x081F7DD4,
    (u16 *) 0x081F7EF8,
    (u16 *) 0x081F8044,
    (u16 *) 0x081F81B4,
};

CONST_DATA u16 * ImgLut_EkrClasschgBG[] = {
    (u16 *) 0x081F4254,
    (u16 *) 0x081F4254,
    (u16 *) 0x081F4254,
    (u16 *) 0x081F4254,
    (u16 *) 0x081F4254,
    (u16 *) 0x081F4254,
    (u16 *) 0x081F4254,
    (u16 *) 0x081F4254,
    (u16 *) 0x081F4254,
    (u16 *) 0x081F4254,
    (u16 *) 0x081F4254,
    (u16 *) 0x081F4254,
    (u16 *) 0x081F4254,
    (u16 *) 0x081F4254,
    (u16 *) 0x081F4254,
    (u16 *) 0x081F4254,
    (u16 *) 0x081F4254,
    (u16 *) 0x081F57E4,
    (u16 *) 0x081F57E4,
    (u16 *) 0x081F57E4,
    (u16 *) 0x081F57E4,
    (u16 *) 0x081F57E4,
    (u16 *) 0x081F57E4,
};

CONST_DATA u16 * PalLut_EkrClasschgBG[] = {
    (u16 *) 0x081F6560,
    (u16 *) 0x081F6560,
    (u16 *) 0x081F6560,
    (u16 *) 0x081F6560,
    (u16 *) 0x081F6560,
    (u16 *) 0x081F6560,
    (u16 *) 0x081F6560,
    (u16 *) 0x081F6560,
    (u16 *) 0x081F6560,
    (u16 *) 0x081F6560,
    (u16 *) 0x081F6560,
    (u16 *) 0x081F6560,
    (u16 *) 0x081F6560,
    (u16 *) 0x081F6560,
    (u16 *) 0x081F6560,
    (u16 *) 0x081F6560,
    (u16 *) 0x081F6560,
    (u16 *) 0x081F6580,
    (u16 *) 0x081F6580,
    (u16 *) 0x081F6580,
    (u16 *) 0x081F6580,
    (u16 *) 0x081F6580,
    (u16 *) 0x081F6580,
};

CONST_DATA struct ProcCmd ProcScr_efxClasschgBGSE00[] = {
    PROC_19,
    PROC_REPEAT(EfxClasschgBGSE00Main),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_efxClasschgBGSE01[] = {
    PROC_19,
    PROC_REPEAT(EfxClasschgBGSE01Main),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_efxClasschgOBJ[] = {
    PROC_19,
    PROC_SLEEP(100),
    PROC_REPEAT(EfxClasschgOBJMain),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_efxClasschgFIN[] = {
    PROC_19,
    PROC_REPEAT(EfxClasschgFinMain),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_efxClasschgCLONE[] = {
    PROC_19,
    PROC_SET_END_CB(EfxClasschgCloneCallBack),
    PROC_REPEAT(EfxClasschgCloneMain),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_efxBlackInOutUnit[] = {
    PROC_19,
    PROC_REPEAT(EfxBlackInOutUnitMain),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_efxClasschgRST[] = {
    PROC_19,
    PROC_REPEAT(EfxClasschgRSTMain),
    PROC_END,
};

bool EkrClasschgFinished(void)
{
    if (gpProcEkrClasschg->done == true)
        return true;

    return false;
}

void EndEkrClasschg(void)
{
    Proc_End(gpProcEkrClasschg);
}

void NewEkrClassChg(struct Anim * anim)
{
    NewEfxSpellCast();
    gpProcEkrClasschg = Proc_Start(ProcScr_ekrClasschg, PROC_TREE_3);
    gpProcEkrClasschg->anim = anim;
    gpProcEkrClasschg->timer = 0;
    gpProcEkrClasschg->done = false;
}

void EkrClasschgMain(struct ProcEkrClasschg * proc)
{
    struct ProcSubEkrClasschgRST * sub;
    struct Anim * anim1 = GetAnimAnotherSide(proc->anim);

    proc->timer++;

    if (proc->timer == 0x01)
    {
        DisableEfxStatusUnits(proc->anim);
        DisableEfxStatusUnits(anim1);
        NewEkrClasschgBG1(anim1);
        NewEfxClasschgBGSE00(anim1);
        SetWinEnable(0, 0, 0);
    }
    else if (proc->timer == 0x5F)
    {
        NewEfxFlashBgWhite(proc->anim, 0xA);
        PlaySFX(0x13B, 0x100, proc->anim->xPosition, 1);
        SetBgOffset(1, 0, 8);
    }
    else if (proc->timer == 0x6A)
    {
        proc->anim->oam2Base &= 0xF3FF;
        proc->anim->oam2Base |= 0x400;
    }
    else if (proc->timer == 0x74)
        NewEfxBlackInOutUnit(proc->anim, 0xC, 0);
    else if (proc->timer == 0x78)
        NewEfxClasschgOBJ(proc->anim);
    else if (proc->timer == 0x80)
        SetAnimStateHidden(POS_R);
    else if (proc->timer == 0x7E)
    {
        sub = NewefxRestRST(proc->anim, 0x38, 7, 0, 2);
        NewEfxClasschgRST(proc->anim, sub, 0x38, 0, 0x40);
        NewEfxRestWINH_(proc->anim, 0x38, 0);
        NewEfxALPHA(proc->anim, 0, 0x38, 0x10, 0, 0);
    }
    else if (proc->timer == 0xF2)
    {
        NewEkrClasschgBG2(proc->anim);
        NewEfxClasschgBGSE01(proc->anim);
        SetWinEnable(0, 0, 0);
        sub = NewefxRestRST(proc->anim, 0x38, 7, 0x40, 2);
        NewEfxClasschgRST(proc->anim, sub, 0x38, 0x40, 0);
        NewEfxRestWINH_(proc->anim, 0x38, 0);
        SetBlendConfig(1, 0, 0x10, 0);
        NewEfxALPHA(proc->anim, 0, 0x38, 0, 0x10, 0);
        PlaySFX(0x13C, 0x100, anim1->xPosition, 1);
    }
    else if (proc->timer == 0x138)
    {
        SetAnimStateUnHidden(POS_L);
        anim1->oam2Base &= 0xF3FF;
        anim1->oam2Base |= 0x400;
        NewEfxBlackInOutUnit(anim1, 0xC, 1);
    }
    else if (proc->timer == 0x13E)
    {
        NewEfxClasschgOBJ(anim1);
        NewEfxFlashBgWhite(proc->anim, 0xA);
        SetBgOffset(1, 0, 0);
    }
    else if (proc->timer == 0x14A)
    {
        anim1->oam2Base &= 0xF3FF;
        anim1->oam2Base |= 0x800;
    }
    else if (proc->timer == 0x15A)
    {
        RegisterEfxSpellCastEnd();
        NewEfxWhiteOUT(anim1, 0xA, 0x46);
    }
    else if (proc->timer == 0x164)
    {
        NewEfxClasschgFIN(anim1, 0x82);
        NewEfxClasschgCLONE(anim1, 0x82);
        NewEfxALPHA(anim1, 0x5A, 0x28, 0xE, 0, 2);
        NewefxRestRST(anim1, 0x82, 0xA, 0x100, 1);
        NewEfxRestWINH_(anim1, 0x82, 0);
        PlaySFX(0x13D, 0x100, anim1->xPosition, 1);
    }
    else if (proc->timer == 0x250)
        Proc_Break(proc);
}

void EkrClasschgRegisterDone(struct ProcEkrClasschg * proc)
{
    proc->done = true;
}

void NewEkrClasschgBG1(struct Anim * anim)
{
    struct ProcEfxBG * proc;
    proc = Proc_Start(ProcScr_efxClasschgBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = FrameLut_EkrClasschgBG1;
    proc->tsal = TsaLut_EkrClasschgBG;
    proc->tsar = TsaLut_EkrClasschgBG;
    proc->img = ImgLut_EkrClasschgBG;
    proc->pal = PalLut_EkrClasschgBG;
    SpellFx_SetSomeColorEffect();
}

void NewEkrClasschgBG2(struct Anim * anim)
{
    struct ProcEfxBG * proc;
    proc = Proc_Start(ProcScr_efxClasschgBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = FrameLut_EkrClasschgBG2;
    proc->tsal = TsaLut_EkrClasschgBG;
    proc->tsar = TsaLut_EkrClasschgBG;
    proc->img = ImgLut_EkrClasschgBG;
    proc->pal = PalLut_EkrClasschgBG;
    SpellFx_SetSomeColorEffect();
}

void EfxClasschgBgMain(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut(&proc->timer, (s16 *)&proc->frame, proc->frame_config);
    if (ret >= 0)
    {
        u16 ** tsal = proc->tsal;
        u16 ** tsar = proc->tsar;
        u16 ** img  = proc->img;
        u16 ** pal  = proc->pal;

        SpellFx_RegisterBgGfx(img[ret], 0x2000);
        SpellFx_RegisterBgPal(pal[ret], 0x20);
        SpellFx_WriteBgMap(proc->anim, tsal[ret], tsar[ret]);
        return;
    }

    if (ret == -1)
    {
        SpellFx_ClearBG1();
        SpellFx_ClearColorEffects();
        Proc_End(proc);
        return;
    }
}

void NewEfxClasschgBGSE00(struct Anim * anim)
{
    struct ProcEfxBG * proc;
    proc = Proc_Start(ProcScr_efxClasschgBGSE00, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
}

void EfxClasschgBGSE00Main(struct ProcEfxBG * proc)
{
    proc->timer++;

    if (proc->timer == 0x01)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 1);
    else if (proc->timer == 0x11)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 1);
    else if (proc->timer == 0x22)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 1);
    else if (proc->timer == 0x28)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 1);
    else if (proc->timer == 0x2E)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 1);
    else if (proc->timer == 0x34)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 1);
    else if (proc->timer == 0x3A)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 1);
    else if (proc->timer == 0x3E)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 1);
    else if (proc->timer == 0x42)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 1);
    else if (proc->timer == 0x44)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 1);
    else if (proc->timer == 0x46)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 1);
    else if (proc->timer == 0x48)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 1);
    else if (proc->timer == 0x50)
        Proc_Break(proc);
}

void NewEfxClasschgBGSE01(struct Anim * anim)
{
    struct ProcEfxBG * proc;
    proc = Proc_Start(ProcScr_efxClasschgBGSE01, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
}

void EfxClasschgBGSE01Main(struct ProcEfxBG * proc)
{
    proc->timer++;

    if (proc->timer == 0x56)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 1);
    else if (proc->timer == 0x58)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 1);
    else if (proc->timer == 0x5A)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 1);
    else if (proc->timer == 0x5C)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 1);
    else if (proc->timer == 0x5E)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 1);
    else if (proc->timer == 0x60)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 1);
    else if (proc->timer == 0x62)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 1);
    else if (proc->timer == 0x64)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 1);
    else if (proc->timer == 0x66)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 1);
    else if (proc->timer == 0x68)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 1);
    else if (proc->timer == 0x6A)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 1);
    else if (proc->timer == 0x6E)
        Proc_Break(proc);
}

void NewEfxClasschgOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    AnimScr * scr;

    proc = Proc_Start(ProcScr_efxClasschgOBJ, PROC_TREE_3);
    proc->anim = anim;
    scr = AnimScr_EfxClasschgOBJ;
    proc->anim2 = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    SpellFx_RegisterObjPal(Pal_BoltingSprites, 0x20);
    SpellFx_RegisterObjGfx(Img_BoltingSprites, 0x1000);
}

void EfxClasschgOBJMain(struct ProcEfxOBJ * proc)
{
    AnimDelete(proc->anim2);
    Proc_Break(proc);
}

void NewEfxClasschgFIN(struct Anim * anim, int duration)
{
    struct ProcEfxBG * proc;
    proc = Proc_Start(ProcScr_efxClasschgFIN, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = duration;

    SpellFx_RegisterBgPal(Pal_EfxClasschgFIN, 0x20);
    SpellFx_RegisterBgGfx(Img_EfxClasschgFIN, 0x2000);
    EfxTmCpyBG(Tsa_EfxClasschgFIN, gBg1Tm, 0x20, 0x20, 1, 0x100);
    EnableBgSync(BG1_SYNC_BIT);
    SpellFx_SetSomeColorEffect();

    SetBlendConfig(1, 0xE, 0x8, 0);
    gDispIo.win_ct.wobj_enable_blend = 1;
    SetWinEnable(0, 0, 1);
    SetWObjLayers(0, 1, 1, 1, 1);
    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 1, 1);
    gDispIo.blend_ct.target2_enable_bd = 1;

    anim->oamBase  |= 0x0800;
    anim->oam2Base &= 0xF3FF;
    anim->oam2Base |= 0x0400;
}

void EfxClasschgFinMain(struct ProcEfxBG * proc)
{
    struct Anim * anim = proc->anim;

    gDispIo.bg_off[1].y--;

    if (++proc->timer == proc->terminator)
    {
        SpellFx_ClearBG1();
        SpellFx_ClearColorEffects();
        anim->oamBase  &= ~0x800;
        anim->oam2Base &= 0xF3FF;
        anim->oam2Base |= 0x0800;
        Proc_Break(proc);
    }
}

void NewEfxClasschgCLONE(struct Anim * anim, int duration)
{
    struct ProcEfxBG * proc;
    proc = Proc_Start(ProcScr_efxClasschgCLONE, PROC_TREE_4);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = duration;
}

void EfxClasschgCloneMain(struct ProcEfxBG * proc)
{
    struct Anim _anim;
    struct Anim * anim = proc->anim;

    _anim.xPosition = anim->xPosition;
    _anim.yPosition = anim->yPosition;
    _anim.pSpriteData = anim->pSpriteData;
    _anim.oamBase = anim->oamBase & ~0x0800;
    _anim.oam2Base = anim->oam2Base;
    _anim.oam2Base &= 0xF3FF;
    _anim.oam2Base |= 0x0800;
    AnimDisplay(&_anim);

    if (++proc->timer == proc->terminator)
        Proc_Break(proc);
}

void EfxClasschgCloneCallBack(void)
{
    return;
}

void NewEfxBlackInOutUnit(struct Anim * anim, int duration, int arg)
{
    struct ProcEfxClasschgInOutUnit * proc;
    proc = Proc_Start(ProcScr_efxBlackInOutUnit, PROC_TREE_4);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = duration;

    if (arg == 0)
    {
        proc->start = 0;
        proc->end = 0x10;
    }
    else
    {
        proc->start = 0x10;
        proc->end = 0;
    }
}

void EfxBlackInOutUnitMain(struct ProcEfxClasschgInOutUnit * proc)
{
    int ret = Interpolate(INTERPOLATE_LINEAR, proc->start, proc->end, proc->timer, proc->terminator);

    if (GetAnimPosition(proc->anim) == POS_L)
    {
        CpuFastCopy(gpEfxUnitPaletteBackup[POS_L], PAL_OBJ(0x7), 0x20);
        EfxPalBlackInOut(PAL_BG(0x0), 0x17, 0x1, ret);
    }
    else
    {
        CpuFastCopy(gpEfxUnitPaletteBackup[POS_R], PAL_OBJ(0x9), 0x20);
        EfxPalBlackInOut(PAL_BG(0x0), 0x19, 0x1, ret);
    }

    EnablePalSync();

    if (++proc->timer > proc->terminator)
        Proc_Break(proc);
}

void NewEfxClasschgRST(struct Anim * anim, struct ProcSubEkrClasschgRST * subproc, int duration, int start, int end)
{
    struct ProcEkrClasschgRST * proc;

    gEfxBgSemaphore = gEfxBgSemaphore + 1;
    proc = Proc_Start(ProcScr_efxClasschgRST, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = duration;
    proc->start = start;
    proc->end = end;
    proc->subproc = subproc;
}

void EfxClasschgRSTMain(struct ProcEkrClasschgRST * proc)
{
    struct ProcSubEkrClasschgRST * subproc = proc->subproc;
    int ret = Interpolate(INTERPOLATE_RSQUARE, proc->start, proc->end, proc->timer, proc->terminator);
    subproc->unk4C = ret;

    if (++proc->timer > proc->terminator)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}
