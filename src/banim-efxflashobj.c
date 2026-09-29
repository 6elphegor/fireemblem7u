#include "gbafe.h"
#include "gbafe/banim_ekrdragon.h"

// ROM data referenced below, defined in data/ (see tools/datasplit.py)
extern const u8 Tsa_EfxSpellCastBg_00[];
extern const u8 Tsa_EfxSpellCastBg_01[];
extern const u8 Tsa_EfxSpellCastBg_02[];
extern const u8 Tsa_EfxSpellCastBg_03[];

/**
 * Weapon icon flashing and spell-cast background dimming (fireemblem8u: banim-efxflashobj.c)
 */

struct ProcEfxWeaponIcon {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);
    /* 2C */ s16 timer;
    STRUCT_PAD(0x2E, 0x44);
    /* 44 */ u32 frame;
    /* 48 */ const u16 * frame_lut;
    /* 4C */ u32 unk4C;
    /* 50 */ u32 invalid;
    /* 54 */ int eff1;
    /* 58 */ int eff2;
};
PROC_SIZE_CHECK(struct ProcEfxWeaponIcon);

struct ProcEfxSpellCast {
    PROC_HEADER;

    /* 29 */ u8 done;
    STRUCT_PAD(0x2A, 0x2C);
    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;
    STRUCT_PAD(0x30, 0x44);
    /* 44 */ u32 frame;
    /* 48 */ const u16 * frame_lut;
    /* 4C */ const void * const * tsa_list;
};
PROC_SIZE_CHECK(struct ProcEfxSpellCast);

extern const u16 gFrameLut_EfxWeaponIcon[];
extern const u16 gFrameLut_EfxSpellCastBg[];
extern const u8 Img_EfxSpellCastBg[];
extern const u16 Pal_EfxSpellCastBg[];

extern struct ProcEfxWeaponIcon * gpProcEfxWeaponIcon;
extern struct ProcEfxSpellCast * gpProcEfxSpellCast;
extern u16 gPal_Banim[0xA0];
extern u16 gEkrTmBuf_0201B784[];
extern s16 gBanimBackgroundIndex;

void PutBanimBgPAL(int index);
void PutBanimBG(int index);

void EfxWeaponIcon_Loop(struct ProcEfxWeaponIcon * proc);
void EfxWeaponIcon_OnEnd(struct ProcEfxWeaponIcon * proc);
void efxSpellCast_Loop_A(struct ProcEfxSpellCast * proc);
void efxSpellCast_Loop_B(struct ProcEfxSpellCast * proc);
void efxSpellCast_Loop_C(struct ProcEfxSpellCast * proc);
void efxSpellCastBg_Loop_A(struct ProcEfxSpellCast * proc);
void efxSpellCastBg_Loop_B(struct ProcEfxSpellCast * proc);
void efxSpellCastBg_Loop_C(struct ProcEfxSpellCast * proc);
void efxSpellCastBg_Loop_D(struct ProcEfxSpellCast * proc);
void efxSpellCastBg_Loop_E(struct ProcEfxSpellCast * proc);

CONST_DATA struct ProcCmd ProcScr_EfxWeaponIcon[] = {
    PROC_19,
    PROC_MARK(10),
    PROC_SET_END_CB(EfxWeaponIcon_OnEnd),
    PROC_REPEAT(EfxWeaponIcon_Loop),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_efxSpellCast[] = {
    PROC_19,
    PROC_MARK(10),
    PROC_REPEAT(efxSpellCast_Loop_A),
    PROC_REPEAT(efxSpellCast_Loop_B),
    PROC_REPEAT(efxSpellCast_Loop_C),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_efxSpellCastBg[] = {
    PROC_19,
    PROC_MARK(10),
    PROC_REPEAT(efxSpellCastBg_Loop_A),
    PROC_REPEAT(efxSpellCastBg_Loop_B),
    PROC_REPEAT(efxSpellCastBg_Loop_C),
    PROC_REPEAT(efxSpellCastBg_Loop_D),
    PROC_REPEAT(efxSpellCastBg_Loop_E),
    PROC_END,
};

CONST_DATA const void * const TsaList_EfxSpellCastBg[] = {
    (const void * const) Tsa_EfxSpellCastBg_00,
    (const void * const) Tsa_EfxSpellCastBg_01,
    (const void * const) Tsa_EfxSpellCastBg_02,
    (const void * const) Tsa_EfxSpellCastBg_03,
};

void NewEfxWeaponIcon(s16 effective1, s16 effective2)
{
    struct ProcEfxWeaponIcon * proc;
    proc = Proc_Start(ProcScr_EfxWeaponIcon, PROC_TREE_3);

    proc->timer = 0;
    proc->frame = 0;
    proc->frame_lut = gFrameLut_EfxWeaponIcon;
    proc->unk4C = 0;
    proc->invalid = false;
    proc->eff1 = effective1;
    proc->eff2 = effective2;

    gpProcEfxWeaponIcon = proc;
}

void EndProcEfxWeaponIcon(void)
{
    if (gpProcEfxWeaponIcon != NULL) {
        Proc_End(gpProcEfxWeaponIcon);
        gpProcEfxWeaponIcon = NULL;
    }
}

void DisableEfxWeaponIcon(void)
{
    gpProcEfxWeaponIcon->invalid = true;
}

void EnableEfxWeaponIcon(void)
{
    gpProcEfxWeaponIcon->invalid = false;
}

void EfxWeaponIcon_Loop(struct ProcEfxWeaponIcon * proc)
{
    int ret;

    if (true == proc->invalid)
        return;

    InitIcons();
    ret = EfxAdvanceFrameLut(&proc->timer, (s16 *)&proc->frame, (const s16 *)proc->frame_lut);
    if (ret >= 0)
        proc->unk4C = ret;

    if (proc->eff1 != 0) {
        ApplyIconPalette(0, 0x1D);
        EfxPalWhiteInOut(PAL_BG(0), 0x1D, 0x1, proc->unk4C);
    }

    if (proc->eff2 != 0) {
        ApplyIconPalette(0, 0x1E);
        EfxPalWhiteInOut(PAL_BG(0), 0x1E, 0x1, proc->unk4C);
    }

    EnablePalSync();
}

void EfxWeaponIcon_OnEnd(struct ProcEfxWeaponIcon * proc)
{
    InitIcons();

    if (proc->eff1 != 0)
        ApplyIconPalette(0, 0x1D);

    if (proc->eff2 != 0)
        ApplyIconPalette(0, 0x1E);

    EnablePalSync();
}

void NewEfxSpellCast(void)
{
    struct ProcEfxSpellCast * proc;

    if (CheckInEkrDragon() != 0)
        return;

    proc = Proc_Start(ProcScr_efxSpellCast, PROC_TREE_4);
    proc->done = 0;
    proc->timer = 0;
    proc->terminator = 4;

    if (NULL == gpProcEfxSpellCast)
        CpuFastCopy(PAL_BG(0x6), gPal_Banim, 0x140);
    else
        Proc_End(gpProcEfxSpellCast);

    gpProcEfxSpellCast = proc;
}

void RegisterEfxSpellCastEnd(void)
{
    if (NULL == gpProcEfxSpellCast)
        return;

    gpProcEfxSpellCast->done = true;
}

void EndEfxSpellCast(void)
{
    ProcPtr proc = gpProcEfxSpellCast;

    if (NULL == proc)
        return;

    gpProcEfxSpellCast = NULL;

    /* bug: ends nothing */
    Proc_End(NULL);
}

void efxSpellCast_Loop_A(struct ProcEfxSpellCast * proc)
{
    int val = Interpolate(INTERPOLATE_LINEAR, 0, 0x8, proc->timer, proc->terminator);

    CpuFastCopy(gPal_Banim, PAL_BG(0x6), 0x140);
    EfxPalBlackInOut(PAL_BG(0x0), 0x6, 0xA, val);
    EnablePalSync();

    if (++proc->timer == (proc->terminator + 1))
        Proc_Break(proc);
}

void efxSpellCast_Loop_B(struct ProcEfxSpellCast * proc)
{
    CpuFastCopy(gPal_Banim, PAL_BG(0x6), 0x140);
    EfxPalBlackInOut(PAL_BG(0x0), 0x6, 0xA, 0x8);

    if (true == proc->done) {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void efxSpellCast_Loop_C(struct ProcEfxSpellCast * proc)
{
    int val = Interpolate(INTERPOLATE_LINEAR, 0x8, 0, proc->timer, proc->terminator);

    CpuFastCopy(gPal_Banim, PAL_BG(0x6), 0x140);
    EfxPalBlackInOut(PAL_BG(0x0), 0x6, 0xA, val);
    EnablePalSync();

    if (++proc->timer == (proc->terminator + 1)) {
        gpProcEfxSpellCast = NULL;
        CpuFastCopy(gPal_Banim, PAL_BG(0x6), 0x140);
        EnablePalSync();
        Proc_Break(proc);
    }
}

void StartEfxSpellCastBg(void)
{
    struct ProcEfxSpellCast * proc;

    proc = Proc_Start(ProcScr_efxSpellCastBg, PROC_TREE_4);
    proc->done = 0;
    proc->timer = 0;
    proc->terminator = 4;

    if (gpProcEfxSpellCast != NULL)
        Proc_End(gpProcEfxSpellCast);

    gpProcEfxSpellCast = proc;
}

void sub_0804FD54(void)
{
    if (NULL == gpProcEfxSpellCast)
        return;

    gpProcEfxSpellCast->done = 1;
}

void sub_0804FD6C(void)
{
    if (NULL == gpProcEfxSpellCast)
        return;

    gpProcEfxSpellCast->done = 2;
}

void sub_0804FD84(void)
{
    ProcPtr proc = gpProcEfxSpellCast;

    if (NULL == proc)
        return;

    gpProcEfxSpellCast = NULL;
    Proc_End(NULL);
}

void efxSpellCastBg_Loop_A(struct ProcEfxSpellCast * proc)
{
    int val;

    if (gBanimBackgroundIndex == 0) {
        val = Interpolate(INTERPOLATE_LINEAR, 4, 0x10, proc->timer, proc->terminator);
        EfxChapterMapFadeOUT(val);
    } else {
        val = Interpolate(INTERPOLATE_LINEAR, 0, 0x10, proc->timer, proc->terminator);
        PutBanimBgPAL(gBanimBackgroundIndex - 1);
        EfxPalBlackInOut(PAL_BG(0x0), 0x6, 0xA, val);
        EnablePalSync();
    }

    if (++proc->timer == (proc->terminator + 1))
        Proc_Break(proc);
}

void efxSpellCastBg_Loop_B(struct ProcEfxSpellCast * proc)
{
    if (proc->done == 1) {
        proc->timer = 0;
        proc->frame = 0;
        proc->frame_lut = gFrameLut_EfxSpellCastBg;
        proc->tsa_list = TsaList_EfxSpellCastBg;

        LZ77UnCompVram(Img_EfxSpellCastBg, (void *)0x06008000);
        CpuFastCopy(Pal_EfxSpellCastBg, PAL_BG(0x6), 0x20);
        Proc_Break(proc);
    }
}

void efxSpellCastBg_Loop_C(struct ProcEfxSpellCast * proc)
{
    u16 * buf = gEkrTmBuf_0201B784;
    int ret = EfxAdvanceFrameLut(&proc->timer, (s16 *)&proc->frame, (const s16 *)proc->frame_lut);

    if (ret >= 0) {
        LZ77UnCompWram(proc->tsa_list[ret], buf);
        EfxTmCpyBG(buf, gBg3Tm, 30, 20, 6, 0);
        EnableBgSync(BG3_SYNC_BIT);
    }

    if (proc->done == 2) {
        TmFill(gBg3Tm, 0x601F);
        EnableBgSync(BG3_SYNC_BIT);
        EfxPalBlackInOut(PAL_BG(0x0), 0x6, 0xA, 0x10);
        EnablePalSync();
        Proc_Break(proc);
    }
}

void efxSpellCastBg_Loop_D(struct ProcEfxSpellCast * proc)
{
    if (gBanimBackgroundIndex == 0) {
        UnpackChapterMapGraphics(gPlaySt.chapterIndex);
        RenderMap();
    } else {
        PutBanimBG(gBanimBackgroundIndex - 1);
    }

    EfxPalBlackInOut(PAL_BG(0x0), 0x6, 0xA, 0x10);
    EnablePalSync();

    proc->timer = 0;
    proc->terminator = 4;
    Proc_Break(proc);
}

void efxSpellCastBg_Loop_E(struct ProcEfxSpellCast * proc)
{
    int val;

    if (gBanimBackgroundIndex == 0) {
        val = Interpolate(INTERPOLATE_LINEAR, 0x10, 4, proc->timer, proc->terminator);
        EfxChapterMapFadeOUT(val);
    } else {
        val = Interpolate(INTERPOLATE_LINEAR, 0x10, 0, proc->timer, proc->terminator);
        PutBanimBgPAL(gBanimBackgroundIndex - 1);
        EfxPalBlackInOut(PAL_BG(0x0), 0x6, 0xA, val);
        EnablePalSync();
    }

    if (++proc->timer == (proc->terminator + 1)) {
        gpProcEfxSpellCast = NULL;
        Proc_Break(proc);
    }
}
