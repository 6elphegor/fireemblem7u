#include "gbafe.h"
#include "gbafe/banim_ekrdragon.h"

/**
 * Unit status (poison, sleep, ...) flashing in battle (fireemblem8u: banim-efxstatusunit.c)
 */

extern const u16 gFrameLut_EfxStatusUnit[];
extern s8 gFadeComponents[0x600];
extern s16 gEkrDebugModeMaybe;

void EfxStatusUnitEnd(struct ProcEfxStatusUnit * proc);

CONST_DATA struct ProcCmd ProcScr_efxStatusUnit[] = {
    PROC_19,
    PROC_MARK(10),
    PROC_SET_END_CB(EfxStatusUnitEnd),
    PROC_REPEAT(EfxStatusUnit_Loop),
    PROC_END,
};

void NewEfxStatusUnit(struct Anim * anim)
{
    struct Unit * unit;
    struct ProcEfxStatusUnit * proc;

    if (GetAnimPosition(anim) == EKR_POS_L)
        unit = &gpEkrBattleUnitLeft->unit;
    else
        unit = &gpEkrBattleUnitRight->unit;

    proc = Proc_Start(ProcScr_efxStatusUnit, PROC_TREE_3);

    proc->invalid = 0;
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_lut = gFrameLut_EfxStatusUnit;
    proc->debuff = unit->statusIndex;

    if (gEkrDebugModeMaybe == 1)
        proc->debuff = UNIT_STATUS_NONE;

    proc->debuf_bak = 0;
    proc->blue = 0;
    proc->green = 0;
    proc->red = 0;
    gpProcEfxStatusUnits[GetAnimPosition(anim)] = proc;

    if (GetAnimPosition(anim) == EKR_POS_L) {
        EfxSplitColor(gpEfxUnitPaletteBackup[EKR_POS_L], (u8 *)&gFadeComponents[0], 0x10);
        EfxSplitColorPetrify(gpEfxUnitPaletteBackup[EKR_POS_L], (u8 *)&gFadeComponents[0x30], 0x10);
        sub_080671AC((s8 *)&gFadeComponents[0], (s8 *)&gFadeComponents[0x30], (void *)&gFadeComponents[0x180], 0x10, 0x10);
    } else {
        EfxSplitColor(gpEfxUnitPaletteBackup[EKR_POS_R], (u8 *)&gFadeComponents[0x60], 0x10);
        EfxSplitColorPetrify(gpEfxUnitPaletteBackup[EKR_POS_R], (u8 *)&gFadeComponents[0x90], 0x10);
        sub_080671AC((s8 *)&gFadeComponents[0x60], (s8 *)&gFadeComponents[0x90], (void *)&gFadeComponents[0x300], 0x10, 0x10);
    }
}

void EndEfxStatusUnits(struct Anim * anim)
{
    if (gpProcEfxStatusUnits[GetAnimPosition(anim)]) {
        Proc_End(gpProcEfxStatusUnits[GetAnimPosition(anim)]);
        gpProcEfxStatusUnits[GetAnimPosition(anim)] = NULL;
    }
}

void DisableEfxStatusUnits(struct Anim * anim)
{
    struct ProcEfxStatusUnit ** procs = gpProcEfxStatusUnits;
    procs[GetAnimPosition(anim)]->invalid = true;
}

void EnableEfxStatusUnits(struct Anim * anim)
{
    struct ProcEfxStatusUnit ** procs = gpProcEfxStatusUnits;
    procs[GetAnimPosition(anim)]->invalid = false;
}

void SetUnitEfxDebuff(struct Anim * anim, int debuff)
{
    struct ProcEfxStatusUnit ** procs = gpProcEfxStatusUnits;
    procs[GetAnimPosition(anim)]->debuff = debuff;

    if (debuff == UNIT_STATUS_NONE)
        EfxStatusUnitFlashing(anim, 0, 0, 0);
}

u32 GetUnitEfxDebuff(struct Anim * anim)
{
    struct ProcEfxStatusUnit ** procs = gpProcEfxStatusUnits;
    return procs[GetAnimPosition(anim)]->debuff;
}

void EfxStatusUnitFlashing(struct Anim * anim, int r, int g, int b)
{
    if (GetAnimPosition(anim) == EKR_POS_L)
    {
        CpuFastCopy(gpEfxUnitPaletteBackup[EKR_POS_L], &PAL_COLOR(0x17, 0), 0x20);
        EfxPalFlashingInOut(&PAL_COLOR(0, 0), 0x17, 1, r, g, b);

        if (CheckInEkrDragon() != 0)
        {
            BanimSetFrontPaletteForDragon(anim);
            EfxPalFlashingInOut(&PAL_COLOR(0, 0), 0x6, 1, r, g, b);
        }
    }
    else
    {
        CpuFastCopy(gpEfxUnitPaletteBackup[EKR_POS_R], &PAL_COLOR(0x19, 0), 0x20);
        EfxPalFlashingInOut(&PAL_COLOR(0, 0), 0x19, 1, r, g, b);
    }
}

void EfxStatusUnit_Loop(struct ProcEfxStatusUnit * proc)
{
    int ret;

    if (GetUnitEfxDebuff(proc->anim) == UNIT_STATUS_NONE || proc->invalid == true)
        return;

    if (proc->debuff != proc->debuf_bak) {
        proc->timer = 0;
        proc->frame = 0;
        proc->debuf_bak = proc->debuff;
    }

    ret = EfxAdvanceFrameLut((void *)&proc->timer, (void *)&proc->frame, (const s16 *)proc->frame_lut);
    if (ret >= 0) {
        switch ((int)proc->debuff) {
        case UNIT_STATUS_POISON:
            proc->red = ret;
            proc->green = 0;
            proc->blue = ret;
            break;

        case UNIT_STATUS_SLEEP:
            proc->red = 0;
            proc->green = 0;
            proc->blue = ret;
            break;

        case UNIT_STATUS_BERSERK:
            proc->red = ret;
            proc->green = 0;
            proc->blue = 0;
            break;

        case UNIT_STATUS_SILENCED:
        default:
            proc->red = ret;
            proc->green = ret;
            proc->blue = ret;
            break;
        }
    }

    switch ((int)proc->debuff) {
    case UNIT_STATUS_POISON:
    case UNIT_STATUS_SLEEP:
    case UNIT_STATUS_BERSERK:
        EfxStatusUnitFlashing(proc->anim, proc->red, proc->green, proc->blue);
        break;

    case UNIT_STATUS_SILENCED:
        if (GetAnimPosition(proc->anim) == EKR_POS_L)
            EfxDecodeSplitedPalette(
                PAL_OBJ(0x7),
                (s8 *)gFadeComponents,
                (s8 *)&gFadeComponents[0x30],
                (s16 *)&gFadeComponents[0x180],
                16, proc->red, 16);
        else
            EfxDecodeSplitedPalette(
                PAL_OBJ(0x9),
                (s8 *)&gFadeComponents[0x60],
                (s8 *)&gFadeComponents[0x90],
                (s16 *)&gFadeComponents[0x300],
                16, proc->red, 16);
        break;

    default:
        break;
    }

    EnablePalSync();
}

void EfxStatusUnitEnd(struct ProcEfxStatusUnit * proc)
{
    if (GetAnimPosition(proc->anim) == EKR_POS_L)
        CpuFastCopy(gpEfxUnitPaletteBackup[EKR_POS_L], &PAL_COLOR(0x17, 0), 0x20);
    else
        CpuFastCopy(gpEfxUnitPaletteBackup[EKR_POS_R], &PAL_COLOR(0x19, 0), 0x20);

    BanimSetFrontPaletteForDragon(proc->anim);
    EnablePalSync();
}
