#include "gbafe.h"

struct ProcCmd CONST_DATA ProcScr_ViewCounter[] = {
    PROC_19,
    PROC_YIELD,
    PROC_REPEAT(ViewCounter_Loop),
    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_PrepHelpboxListener[] = {
    PROC_SLEEP(1),
    PROC_REPEAT(PrepHbKeyListener_Loop),
    PROC_END,
};

struct PrepItemTypePageEnt CONST_DATA gPrepItemTypePageLut[] = {
    [0] = { ITYPE_SWORD,  ITYPE_SWORD },
    [1] = { ITYPE_LANCE,  ITYPE_LANCE },
    [2] = { ITYPE_AXE,    ITYPE_AXE   },
    [3] = { ITYPE_BOW,    ITYPE_BOW   },
    [4] = { ITYPE_STAFF,  ITYPE_STAFF },
    [5] = { ITYPE_ANIMA,  ITYPE_ANIMA },
    [6] = { ITYPE_LIGHT,  ITYPE_LIGHT },
    [7] = { ITYPE_DARK,   ITYPE_DARK  },
    [8] = { ITYPE_ITEM,   ITYPE_12    },
};

ASM_FUNC("asm/nonmatching/code_08090C44.s");
ASM_FUNC("asm/nonmatching/code_08090C48.s");
ASM_FUNC("asm/nonmatching/code_08090C58.s");
ASM_FUNC("asm/nonmatching/code_08090C94.s");
ASM_FUNC("asm/nonmatching/code_08090CD4.s");
ASM_FUNC("asm/nonmatching/code_08090CE4.s");
ASM_FUNC("asm/nonmatching/code_08090CF8.s");
ASM_FUNC("asm/nonmatching/code_08090D20.s");
ASM_FUNC("asm/nonmatching/code_08090D58.s");
ASM_FUNC("asm/nonmatching/code_08090D80.s");
ASM_FUNC("asm/nonmatching/code_08090DB0.s");
ASM_FUNC("asm/nonmatching/code_08090DEC.s");
ASM_FUNC("asm/nonmatching/code_08090E90.s");
ASM_FUNC("asm/nonmatching/code_08090EE8.s");
ASM_FUNC("asm/nonmatching/code_08090F30.s");
ASM_FUNC("asm/nonmatching/code_08090F68.s");
ASM_FUNC("asm/nonmatching/code_08090F9C.s");
ASM_FUNC("asm/nonmatching/code_08091138.s");
ASM_FUNC("asm/nonmatching/code_0809120C.s");
ASM_FUNC("asm/nonmatching/code_08091250.s");
ASM_FUNC("asm/nonmatching/code_08091270.s");
ASM_FUNC("asm/nonmatching/code_08091298.s");
ASM_FUNC("asm/nonmatching/code_080912CC.s");
ASM_FUNC("asm/nonmatching/code_080912EC.s");
