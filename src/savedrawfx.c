#include "gbafe.h"

#include "gbafe/savemenu.h"

struct SaveDrawCursorProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2D);
    /* 2D */ u8 unk_2d;
    /* 2E */ u8 unk_2e;
    /* 2F */ u8 unk_2f;
    /* 30 */ u8 unk_30;
    /* 31 */ u8 unk_31;
    /* 32 */ u8 unk_32;
    /* 33 */ u8 unk_33;
    /* 34 */ u8 unk_34;
    /* 35 */ u8 unk_35;
};

struct SaveDrawProcFx
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x34);
    /* 34 */ struct SaveDrawCursorProc * unk_34;
};

struct SqMaskProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 unk_29;
    /* 2A */ u8 unk_2a;
    /* 2B */ u8 unk_2b;
};

extern struct ProcCmd CONST_DATA ProcScr_SaveDrawCursor[];
extern struct ProcCmd CONST_DATA ProcScr_SqMask[];
extern struct ProcCmd CONST_DATA ProcScr_SaveBgUp[];
extern int CONST_DATA SaveMenuSubSelBoxTexts[];
extern struct Font gSaveMenuSubBoxFont;
extern struct Text gSaveMenuSubBoxText;

void SaveMenuDrawSubSelBoxExt(int msgId, s8 draw_en);

void SpinRotation_Init(struct ProcSpinRotation * proc)
{
    proc->unk_39 = 0;
    proc->ro = 0;
    proc->unk_35 = 0;
    proc->unk_36 = 0;
    proc->unk_37 = 0;
    proc->unk_38 = 0;
    proc->unk_3A = 0;
    proc->unk_3B = 0;
    proc->unk_3D = 0;
    proc->unk_34 = 0;
}

void SpinRotation_Loop(struct ProcSpinRotation * proc)
{
    proc->ro++;
    proc->angle -= 4;

    /**
     * The spin image is slightly scaled down.
     *
     * Rate = (0x10000/0x180)/0x100 = 66.7%
     */
    BgAffinRotScaling(BG_2, proc->angle, 0, 0, 0x180, 0x180);
    BgAffinScaling(BG_2, 2 << 8, 1 << 8);

    /**
     * [120, 160] is the author in screen space, where the pattern need to display
     * [76, 76] is the center of the spin image
     */
    BgAffinAnchoring(BG_2, 120, 160, 76, 76);

    SyncDispIo();
}

struct ProcCmd CONST_DATA ProcScr_SpinRotation[] = {
    PROC_NAME_DEBUG("SpinRotation"),
    PROC_MARK(13),
    PROC_CALL(SpinRotation_Init),
    PROC_REPEAT(SpinRotation_Loop),
    PROC_END,
};

ProcPtr StartSpinRotation(ProcPtr parent)
{
    struct ProcSpinRotation * proc;
    proc = Proc_Start(ProcScr_SpinRotation, PROC_TREE_VSYNC);
    proc->savedraw = parent;
    return proc;
}

ASM_FUNC("asm/nonmatching/code_080A5CF8.s");
ASM_FUNC("asm/nonmatching/code_080A5D2C.s");
void sub_080A5E8C(int a, int b, int c, struct SaveDrawProcFx * proc)
{
    struct SaveDrawCursorProc * cursor = proc->unk_34;

    cursor->unk_2f = c;
    cursor->unk_2d = b;
    cursor->unk_31 = 1;
    cursor->unk_35 = a;
}
void sub_080A5EAC(int a, int b, struct SaveDrawProcFx * proc)
{
    struct SaveDrawCursorProc * cursor = proc->unk_34;

    cursor->unk_32 = b;
    cursor->unk_33 = 1;
    cursor->unk_35 = a;
    cursor->unk_34 = 0;
}
ProcPtr StartSaveDrawCursor(ProcPtr parent)
{
    return Proc_Start(ProcScr_SaveDrawCursor, parent);
}
void SaveMenuInitSubBoxText(void)
{
    InitTextFont(&gSaveMenuSubBoxFont, (void *) 0x0600C020, 1, 4);
    InitText(&gSaveMenuSubBoxText, 10);
}
ASM_FUNC("asm/nonmatching/code_080A5F18.s");
void SaveMenuDrawSubSelBox(struct SaveMenuProc * proc, s8 flag)
{
    SaveMenuDrawSubSelBoxExt(SaveMenuSubSelBoxTexts[BitfileToIndex(proc->action_flag)], flag);

    if (flag == 0)
        proc->unk_36 = 0;
}
void sub_080A5FD0(void)
{
    CpuFastFill(0, (void *) 0x06008000, 0x800);
    CpuFastFill(0, (void *) 0x0600C000, 0x800);
}
void AddMainMenuOption(struct SaveMenuProc * proc, int option)
{
    proc->unk_30 |= option;
    proc->unk_31++;
}
void AddExtraMenuOption(struct SaveMenuProc * proc, int option)
{
    proc->unk_32 |= option;
    proc->unk_33++;
}
ASM_FUNC("asm/nonmatching/code_080A602C.s");
ASM_FUNC("asm/nonmatching/code_080A6114.s");
ASM_FUNC("asm/nonmatching/code_080A6184.s");
bool SaveMenuHasOptions(struct SaveMenuProc * proc)
{
    if (proc->action_flag & proc->unk_30)
        return true;

    return false;
}
ASM_FUNC("asm/nonmatching/code_080A6238.s");
void StartSqMask(ProcPtr parent, u8 b, u8 c)
{
    struct SqMaskProc * proc = Proc_StartBlocking(ProcScr_SqMask, parent);

    proc->unk_2a = b;
    proc->unk_2b = c;
    proc->unk_29 = 0;
}
void SaveBgUp_Loop(void)
{
    RegisterDataMove(gBg2Tm, (void *) 0x06007000, 0x800);
}
ProcPtr StartSaveBgUp(ProcPtr parent)
{
    return Proc_Start(ProcScr_SaveBgUp, parent);
}
