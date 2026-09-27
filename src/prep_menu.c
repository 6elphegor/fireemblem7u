#include "gbafe.h"

struct ProcCmd CONST_DATA ProcScr_PrepScreenMenuDummyItem[] = {
    PROC_BLOCK,
    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_PrepMenu[] = {
    PROC_CALL(PrepMenu_OnInit),
    PROC_SET_END_CB(PrepMenu_OnEnd),
    PROC_YIELD,
PROC_LABEL(0),
    PROC_REPEAT(PrepMenu_ShowActiveHand),
PROC_LABEL(1),
    PROC_REPEAT(PrepMenu_CtrlLoop),
PROC_LABEL(2),
    PROC_REPEAT(PrepMenu_ShowFrozenHand),
PROC_LABEL(10),
    PROC_END,
};

ASM_FUNC("asm/nonmatching/code_0808FABC.s");
ASM_FUNC("asm/nonmatching/code_0808FB54.s");
ASM_FUNC("asm/nonmatching/code_0808FB98.s");
ASM_FUNC("asm/nonmatching/code_0808FDE0.s");
ASM_FUNC("asm/nonmatching/code_0808FE08.s");
ASM_FUNC("asm/nonmatching/code_0808FE34.s");
ASM_FUNC("asm/nonmatching/code_0808FE48.s");
ASM_FUNC("asm/nonmatching/code_0808FE6C.s");
ASM_FUNC("asm/nonmatching/code_0808FE88.s");
ASM_FUNC("asm/nonmatching/code_0808FEA4.s");
ASM_FUNC("asm/nonmatching/code_0808FEC0.s");
ASM_FUNC("asm/nonmatching/code_0808FF68.s");
ASM_FUNC("asm/nonmatching/code_0808FFA8.s");
ASM_FUNC("asm/nonmatching/code_0808FFF0.s");
ASM_FUNC("asm/nonmatching/code_0809009C.s");
ASM_FUNC("asm/nonmatching/code_080900B8.s");
ASM_FUNC("asm/nonmatching/code_080900DC.s");
ASM_FUNC("asm/nonmatching/code_08090148.s");
ASM_FUNC("asm/nonmatching/code_08090164.s");
ASM_FUNC("asm/nonmatching/code_08090180.s");
ASM_FUNC("asm/nonmatching/code_0809019C.s");
