#include "gbafe.h"
#include "gbafe/banim_ekrdragon.h"

/**
 * Unit / hp-bar flashing effects (fireemblem8u: banim-efxflashunit.c)
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

struct ProcEfxHpBarColorChange {
    PROC_HEADER;

    /* 29 */ u8 disabled;
    STRUCT_PAD(0x2A, 0x2C);
    /* 2C */ s16 timer1;
    /* 2E */ s16 timer2;
    /* 30 */ s16 terminator2;
    STRUCT_PAD(0x32, 0x44);
    /* 44 */ u32 frame1;
    /* 48 */ const u16 * frame_lut1;
    /* 4C */ u32 frame2;
    /* 50 */ const u16 * frame_lut2;
    /* 54 */ u32 unk54;
    /* 58 */ u32 unk58;
    /* 5C */ struct Anim * anim;
};
PROC_SIZE_CHECK(struct ProcEfxHpBarColorChange);

extern struct ProcEfxHpBarColorChange * gpProcEfxHpBarColorChange;
extern s16 gEkrGaugeHp[2];

extern u16 Pal_EfxHpBar[];
extern u16 Pal_EfxHpBarGreen[];
extern u16 Pal_EfxHpBarFlash[];
extern u16 Pal_EfxHpBarPurple[];
extern const u16 gFrameLut_EfxHPBarColorChange1[];
extern const u16 gFrameLut_EfxHPBarColorChange2[];

extern u8 gEfxSplitedColorBufA[];
extern u8 gEfxSplitedColorBufB[];
extern u16 gEfxSplitedColorBufC[];
extern u8 gEfxSplitedColorBufD[];
extern u8 gEfxSplitedColorBufE[];
extern u16 gEfxSplitedColorBufF[];

void EfxFlashHPBarDelay(struct ProcEfxFlashing * proc);
void EfxFlashHPBarMain1(struct ProcEfxFlashing * proc);
void EfxFlashHPBarRestorePal(struct ProcEfxFlashing * proc);
void EfxFlashUnitMain(struct ProcEfxFlashing * proc);
void EfxFlashUnitRestorePal(struct ProcEfxFlashing * proc);
void EfxHPBarColorChangeMain(struct ProcEfxHpBarColorChange * proc);

CONST_DATA struct ProcCmd ProcScr_efxFlashHPBar[] = {
    PROC_19,
    PROC_MARK(10),
    PROC_REPEAT(EfxFlashHPBarDelay),
    PROC_REPEAT(EfxFlashHPBarMain1),
    PROC_REPEAT(EfxFlashHPBarRestorePal),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_efxHPBarColorChange[] = {
    PROC_19,
    PROC_MARK(10),
    PROC_REPEAT(EfxHPBarColorChangeMain),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_efxFlashUnit[] = {
    PROC_19,
    PROC_MARK(10),
    PROC_REPEAT(EfxFlashUnitMain),
    PROC_REPEAT(EfxFlashUnitRestorePal),
    PROC_END,
};

void NewEfxFlashHPBar(struct Anim * anim, int duartion, int duartion2)
{
    struct ProcEfxFlashing * proc;
    u16 _duartion = duartion;
    u16 _duartion2 = duartion2;

    proc = Proc_Start(ProcScr_efxFlashHPBar, PROC_TREE_4);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = _duartion;
    proc->terminator2 = _duartion2;

    if (_duartion == 0)
        Proc_Break(proc);
}

void EfxFlashHPBarDelay(struct ProcEfxFlashing * proc)
{
    if (++proc->timer >= proc->terminator)
        Proc_Break(proc);
}

void EfxFlashHPBarMain1(struct ProcEfxFlashing * proc)
{
    if (GetAnimPosition(proc->anim) == EKR_POS_L)
    {
        if (gEkrGaugeHp[EKR_POS_L] <= 80)
            CpuCopy16(Pal_EfxHpBarGreen, PAL_OBJ(0xB), 0x20);
        else
            CpuCopy16(Pal_EfxHpBarPurple, PAL_OBJ(0xB), 0x20);
    }
    else
    {
        if (gEkrGaugeHp[EKR_POS_R] <= 80)
            CpuCopy16(Pal_EfxHpBarGreen, PAL_OBJ(0xC), 0x20);
        else
            CpuCopy16(Pal_EfxHpBarPurple, PAL_OBJ(0xC), 0x20);
    }

    EnablePalSync();

    if (++proc->timer >= proc->terminator2)
        Proc_Break(proc);
}

void EfxFlashHPBarRestorePal(struct ProcEfxFlashing * proc)
{
    if (GetAnimPosition(proc->anim) == EKR_POS_L)
    {
        if (gEkrGaugeHp[EKR_POS_L] <= 80)
            CpuCopy16(&PAL_BUF_COLOR(Pal_EfxHpBar, gBanimFactionPal[EKR_POS_L], 0), PAL_OBJ(0xB), 0x20);
        else
            CpuCopy16(Pal_EfxHpBarPurple, PAL_OBJ(0xC), 0x20);
    }
    else
    {
        if (gEkrGaugeHp[EKR_POS_R] <= 80)
            CpuCopy16(&PAL_BUF_COLOR(Pal_EfxHpBar, gBanimFactionPal[EKR_POS_R], 0), PAL_OBJ(0xC), 0x20);
        else
            CpuCopy16(Pal_EfxHpBarPurple, PAL_OBJ(0xC), 0x20);
    }

    EnablePalSync();
    Proc_Break(proc);
}

void NewEfxHpBarColorChange(struct Anim * anim)
{
    struct ProcEfxHpBarColorChange * proc;
    gpProcEfxHpBarColorChange = proc = Proc_Start(ProcScr_efxHPBarColorChange, PROC_TREE_3);
    proc->anim = anim;
    proc->timer1 = 0;
    proc->frame1 = 0;
    proc->frame_lut1 = gFrameLut_EfxHPBarColorChange1;
    proc->unk54 = 0;
    proc->timer2 = 0;
    proc->frame2 = 0;
    proc->frame_lut2 = gFrameLut_EfxHPBarColorChange2;
    proc->unk58 = 0;
    proc->disabled = false;

    EfxSplitColor(Pal_EfxHpBar + gBanimFactionPal[EKR_POS_L] * 0x10, gEfxSplitedColorBufA, 0x10);
    EfxSplitColor(Pal_EfxHpBarFlash + gBanimFactionPal[EKR_POS_L] * 0x10, gEfxSplitedColorBufB, 0x10);
    sub_080671AC(gEfxSplitedColorBufA, gEfxSplitedColorBufB, gEfxSplitedColorBufC, 0x10, 5);

    EfxSplitColor(Pal_EfxHpBar + gBanimFactionPal[EKR_POS_R] * 0x10, gEfxSplitedColorBufD, 0x10);
    EfxSplitColor(Pal_EfxHpBarFlash + gBanimFactionPal[EKR_POS_R] * 0x10, gEfxSplitedColorBufE, 0x10);
    sub_080671AC(gEfxSplitedColorBufD, gEfxSplitedColorBufE, gEfxSplitedColorBufF, 0x10, 5);
}

void EndEfxHPBarColorChange(void)
{
    Proc_End(gpProcEfxHpBarColorChange);
}

void DisableEfxHpBarColorChange(void)
{
    gpProcEfxHpBarColorChange->disabled = true;
}

void EnableEfxHpBarColorChange(void)
{
    gpProcEfxHpBarColorChange->disabled = false;
}

void EfxHPBarColorChangeMain(struct ProcEfxHpBarColorChange * proc)
{
    int ret;
    u8 *buf1, *buf2;
    u16 *buf3;

    if (proc->disabled == true)
        return;

    ret = EfxAdvanceFrameLut(&proc->timer1, (s16 *)&proc->frame1, (const s16 *)proc->frame_lut1);
    if (ret >= 0)
        proc->unk54 = ret;

    ret = EfxAdvanceFrameLut(&proc->timer2, (s16 *)&proc->frame2, (const s16 *)proc->frame_lut2);
    if (ret >= 0)
        proc->unk58 = ret;

    if (gEkrGaugeHp[EKR_POS_L] <= 80)
    {
        buf1 = gEfxSplitedColorBufA;
        buf2 = gEfxSplitedColorBufB;
        buf3 = gEfxSplitedColorBufC;

        EfxDecodeSplitedPalette(PAL_OBJ(0xB), (s8 *)buf1, (s8 *)buf2, (s16 *)buf3, 0x10, proc->unk54, 5);
    }
    else
        CpuFastCopy(Pal_EfxHpBarPurple + proc->unk58 * 0x10, PAL_OBJ(0xB), 0x20);

    if (gEkrGaugeHp[EKR_POS_R] <= 80)
    {
        buf1 = gEfxSplitedColorBufD;
        buf2 = gEfxSplitedColorBufE;
        buf3 = gEfxSplitedColorBufF;

        EfxDecodeSplitedPalette(PAL_OBJ(0xC), (s8 *)buf1, (s8 *)buf2, (s16 *)buf3, 0x10, proc->unk54, 5);
    }
    else
        CpuFastCopy(Pal_EfxHpBarPurple + proc->unk58 * 0x10, PAL_OBJ(0xC), 0x20);

    EnablePalSync();
}

void NewEfxFlashUnit(struct Anim * anim, u16 dura1, u16 dura2, int c)
{
    struct ProcEfxFlashing * proc = Proc_Start(ProcScr_efxFlashUnit, PROC_TREE_4);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = dura1;
    proc->terminator2 = dura2;
    proc->unk29 = c;
}

void EfxFlashUnitMain(struct ProcEfxFlashing * proc)
{
    if (++proc->timer < proc->terminator)
        return;

    if (GetAnimPosition(proc->anim) == EKR_POS_L)
    {
        CpuFastCopy(Pal_EkrDragon, PAL_OBJ(0x7), 0x20);
        EkrDragonUpdateFlashingUnit(proc->anim);
    }
    else
    {
        CpuFastCopy(Pal_EkrDragon, PAL_OBJ(0x9), 0x20);
        EkrDragonUpdateFlashingUnit(proc->anim);
    }

    EnablePalSync();

    if (proc->timer >= proc->terminator2)
        Proc_Break(proc);
}

void EfxFlashUnitRestorePal(struct ProcEfxFlashing * proc)
{
    if (GetAnimPosition(proc->anim) == EKR_POS_L)
    {
        CpuFastCopy(gpEfxUnitPaletteBackup[EKR_POS_L], PAL_OBJ(0x7), 0x20);
        BanimSetFrontPaletteForDragon(proc->anim);
    }
    else
    {
        CpuFastCopy(gpEfxUnitPaletteBackup[EKR_POS_R], PAL_OBJ(0x9), 0x20);
        BanimSetFrontPaletteForDragon(proc->anim);
    }

    EnablePalSync();
    Proc_Break(proc);
}
