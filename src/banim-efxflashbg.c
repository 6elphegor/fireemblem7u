#include "gbafe.h"

/**
 * Battle background flashes (fireemblem8u: banim-efxflashbg.c)
 */

struct ProcEfxFlashing {
    PROC_HEADER;

    /* 29 */ u8 unk29;
    STRUCT_PAD(0x2A, 0x2C);
    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;
    /* 30 */ s16 terminator2;
    STRUCT_PAD(0x32, 0x5C);
    /* 5C */ struct Anim * anim;
};
PROC_SIZE_CHECK(struct ProcEfxFlashing);

void EfxFlashBgMain(struct ProcEfxFlashing * proc);
void EfxFlashRestorePalSync(struct ProcEfxFlashing * proc);
void EfxWhiteOutMain1(struct ProcEfxFlashing * proc);
void EfxWhiteOutMain2(struct ProcEfxFlashing * proc);
void EfxWhiteOutRestorePalSync(struct ProcEfxFlashing * proc);

CONST_DATA struct ProcCmd ProcScr_efxFlashBG[] = {
    PROC_19,
    PROC_MARK(10),
    PROC_REPEAT(EfxFlashBgMain),
    PROC_REPEAT(EfxFlashRestorePalSync),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_efxWhiteOUT[] = {
    PROC_19,
    PROC_REPEAT(EfxWhiteOutMain1),
    PROC_REPEAT(EfxWhiteOutMain2),
    PROC_REPEAT(EfxWhiteOutRestorePalSync),
    PROC_END,
};

void NewEfxFlashBgWhite(struct Anim * anim, int duartion)
{
    struct ProcEfxFlashing * proc;
    proc = Proc_Start(ProcScr_efxFlashBG, PROC_TREE_VSYNC);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = duartion;
    CpuFastFill16(-1, gEfxPal, PLTT_SIZE);
}

void NewEfxFlashBgRed(struct Anim * anim, int duartion)
{
    struct ProcEfxFlashing * proc;
    proc = Proc_Start(ProcScr_efxFlashBG, PROC_TREE_VSYNC);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = duartion;
    CpuFastFill16(0x001F001F, gEfxPal, PLTT_SIZE);
}

void NewEfxFlashBgBlack(struct Anim * anim, int duartion)
{
    struct ProcEfxFlashing * proc;
    proc = Proc_Start(ProcScr_efxFlashBG, PROC_TREE_VSYNC);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = duartion;
    CpuFastFill16(0, gEfxPal, PLTT_SIZE);
}

void NewEfxFlashBgDirectly(struct Anim * anim, int duartion)
{
    struct ProcEfxFlashing * proc;
    proc = Proc_Start(ProcScr_efxFlashBG, PROC_TREE_VSYNC);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = duartion;
}

void EfxFlashBgMain(struct ProcEfxFlashing * proc)
{
    CpuFastCopy(gEfxPal, (u16 *)PLTT, PLTT_SIZE);
    DisablePalSync();

    if (++proc->timer >= proc->terminator)
        Proc_Break(proc);
}

void EfxFlashRestorePalSync(struct ProcEfxFlashing * proc)
{
    EnablePalSync();
    Proc_Break(proc);
}

void NewEfxWhiteOUT(struct Anim * anim, int duartion, int duartion2)
{
    struct ProcEfxFlashing * proc;
    proc = Proc_Start(ProcScr_efxWhiteOUT, PROC_TREE_VSYNC);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = duartion;
    proc->terminator2 = duartion2;
}

void EfxWhiteOutMain1(struct ProcEfxFlashing * proc)
{
    CpuFastCopy(gPal, gEfxPal, PLTT_SIZE);
    EfxPalWhiteInOut(gEfxPal, 0x0, 0x20, 0x10);
    CpuFastCopy(gEfxPal, (u16 *)PLTT, PLTT_SIZE);
    DisablePalSync();

    if (++proc->timer > proc->terminator)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void EfxWhiteOutMain2(struct ProcEfxFlashing * proc)
{
    int ret = Interpolate(INTERPOLATE_LINEAR, 0x10, 0, proc->timer, proc->terminator2);
    CpuFastCopy(gPal, gEfxPal, PLTT_SIZE);
    EfxPalWhiteInOut(gEfxPal, 0x0, 0x20, ret);
    CpuFastCopy(gEfxPal, (u16 *)PLTT, PLTT_SIZE);
    DisablePalSync();

    if (++proc->timer > proc->terminator2)
        Proc_Break(proc);
}

void EfxWhiteOutRestorePalSync(struct ProcEfxFlashing * proc)
{
    EnablePalSync();
    Proc_Break(proc);
}
