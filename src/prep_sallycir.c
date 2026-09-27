#include "gbafe.h"

struct ProcCmd CONST_DATA ProcScr_SallyCir[] = {
    PROC_19,
    PROC_SLEEP(1),
    PROC_CALL(SallyCir_Init),
    PROC_REPEAT(SallyCir_Loop),
    PROC_CALL(SallyCir_OnEnd),
    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_Unk_08CC43BC[] = {
    PROC_YIELD,
    PROC_YIELD,
    PROC_END,
};

ASM_FUNC("asm/nonmatching/code_080907D4.s");
ASM_FUNC("asm/nonmatching/code_08090818.s");
ASM_FUNC("asm/nonmatching/code_08090968.s");
ASM_FUNC("asm/nonmatching/code_08090A2C.s");
ASM_FUNC("asm/nonmatching/code_08090A38.s");
ASM_FUNC("asm/nonmatching/code_08090A58.s");
ASM_FUNC("asm/nonmatching/code_08090B18.s");
