#include "gbafe.h"

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
ASM_FUNC("asm/nonmatching/code_080A5E8C.s");
ASM_FUNC("asm/nonmatching/code_080A5EAC.s");
ASM_FUNC("asm/nonmatching/code_080A5EDC.s");
ASM_FUNC("asm/nonmatching/code_080A5EF0.s");
ASM_FUNC("asm/nonmatching/code_080A5F18.s");
ASM_FUNC("asm/nonmatching/code_080A5F98.s");
ASM_FUNC("asm/nonmatching/code_080A5FD0.s");
ASM_FUNC("asm/nonmatching/code_080A6004.s");
ASM_FUNC("asm/nonmatching/code_080A6018.s");
ASM_FUNC("asm/nonmatching/code_080A602C.s");
ASM_FUNC("asm/nonmatching/code_080A6114.s");
ASM_FUNC("asm/nonmatching/code_080A6184.s");
ASM_FUNC("asm/nonmatching/code_080A6220.s");
ASM_FUNC("asm/nonmatching/code_080A6238.s");
ASM_FUNC("asm/nonmatching/code_080A6334.s");
ASM_FUNC("asm/nonmatching/code_080A6368.s");
ASM_FUNC("asm/nonmatching/code_080A6384.s");
