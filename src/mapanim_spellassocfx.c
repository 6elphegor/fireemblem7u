#include "gbafe.h"

extern struct ManimStarfxConf gManimStarfxConfs[0x10];
extern u16 gManimSpellAssocPalBackup[0xA0];

extern u16 const Pal_AllBlack[];
extern u8 const Img_ManimSpark[];
extern u16 const Pal_ManimSpark[];

CONST_DATA struct ProcCmd ProcScr_ManimSpellAssocFade[] = {
    PROC_CALL(ManimSpellAssocFade_Main),
    PROC_SLEEP(15),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_ManimSpellAssocResetPal[] = {
    PROC_CALL(ManimSpellAssocResetPal_Main),
    PROC_SLEEP(16),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_ManimBgShaker[] = {
    PROC_CALL(ManimBgShaker_Init),
    PROC_REPEAT(ManimBgShaker_Main),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_ManimStarRotation[] = {
    PROC_CALL(LockGame),
    PROC_SLEEP(1),
    PROC_CALL(ManimStarRotation_Init),
    PROC_REPEAT(ManimStarRotation_Main),
    PROC_CALL(UnlockGame),
    PROC_END,
};

void StartManimSpellAssocFadeExt(ProcPtr proc)
{
    if (proc)
        Proc_StartBlocking(ProcScr_ManimSpellAssocFade, proc);
    else
        Proc_Start(ProcScr_ManimSpellAssocFade, PROC_TREE_3);
}

void ManimSpellAssocFade_Main(ProcPtr proc)
{
    int i;

    CpuFastCopy(gPal + 0x60, gManimSpellAssocPalBackup, 0x140);

    for (i = 0; i < 10; i++)
        SetPalFadeStop(StartPalFade(Pal_AllBlack, i + 6, 0x3C, proc), 15);
}

void StartManimSpellAssocResetPalExt(ProcPtr proc)
{
    if (proc)
        Proc_StartBlocking(ProcScr_ManimSpellAssocResetPal, proc);
    else
        Proc_Start(ProcScr_ManimSpellAssocResetPal, PROC_TREE_3);
}

void ManimSpellAssocResetPal_Main(ProcPtr proc)
{
    int i;

    for (i = 0; i < 10; i++)
        StartPalFade(gManimSpellAssocPalBackup + 0x10 * i, i + 6, 15, proc);
}

void StartManimBgShaker(void)
{
    Proc_Start(ProcScr_ManimBgShaker, PROC_TREE_3);
}

void ManimBgShaker_Init(struct ManimShakeProc * proc)
{
    proc->timer = 0;
}

void ManimBgShaker_Main(struct ManimShakeProc * proc)
{
    SetBgOffset(0, DivRem(RandNextB(), 9) - 4, DivRem(RandNextB(), 9) - 4);
    SetBgOffset(1, DivRem(RandNextB(), 9) - 4, DivRem(RandNextB(), 9) - 4);

    if (proc->timer++ > 15)
    {
        SetBgOffset(0, 0, 0);
        SetBgOffset(1, 0, 0);

        Proc_Break(proc);
    }
}

void LoadSparkGfx(void)
{
    Decompress(Img_ManimSpark, OBJ_VRAM0 + 0x1C0 * 0x20);
    ApplyPalette(Pal_ManimSpark, 0x10 + 4);
}

void PutSparkGfx(int x, int y)
{
    if (x < -4)
        return;

    if (x > 235)
        return;

    if (y < -4)
        return;

    if (y > 155)
        return;

    PutOamHiRam((x - 4) & 0x1FF, (y - 4) & 0xFF, Sprite_8x8, TILEREF(0x1C0, 4));
}

void PutSparkGfxRotation(int x_center, int y_center, int distance, int angle)
{
    PutSparkGfx(
        x_center + ((SIN_Q12(angle) * distance) >> 12),
        y_center + ((COS_Q12(angle) * distance) >> 12));
}

void ManimStarRotation_Init(struct ManimStarProc * proc)
{
    int i;

    LoadSparkGfx();

    for (i = 0; i < 16; ++i)
    {
        gManimStarfxConfs[i].distance = 0x10;
        gManimStarfxConfs[i].angle = (i * 16) << 4;
    }

    proc->distance = 0;
    proc->angle = 0;
    proc->timer = proc->start;
}

void ManimStarRotation_Main(struct ManimStarProc * proc)
{
    int i, ret = Interpolate(5, proc->lo, proc->hi, proc->timer, proc->end) << 4;

    proc->distance = ret;
    proc->angle = ret / 2;

    for (i = 0; i < 16; ++i)
    {
        PutSparkGfxRotation(
            proc->x_center, proc->y_center,
            (proc->distance + gManimStarfxConfs[i].distance) >> 4,
            (proc->angle + gManimStarfxConfs[i].angle) >> 4);
    }

    proc->timer++;

    if (proc->timer > proc->terminator)
        Proc_Break(proc);
}

void StartManimStarRotation(int x_center, int y_center, int lo, int hi, int start, int end, int terminator)
{
    struct ManimStarProc * proc = Proc_Start(ProcScr_ManimStarRotation, PROC_TREE_3);

    proc->x_center = x_center;
    proc->y_center = y_center;
    proc->lo = lo;
    proc->hi = hi;
    proc->start = start;
    proc->end = end;
    proc->terminator = terminator;
}

void StartManimStarExplosion(int x, int y)
{
    StartManimStarRotation(x, y, 1, 0xC8, 0, 0x50, 0x28);
}

void StartManimStarImplosion(int x, int y)
{
    StartManimStarRotation(x, y, 0xC8, 1, 0, 0x3C, 0x37);
}
