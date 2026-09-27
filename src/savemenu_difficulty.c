#include "gbafe.h"

#include "gbafe/savemenu.h"

ASM_FUNC("asm/nonmatching/code_080A6398.s");
ASM_FUNC("asm/nonmatching/code_080A649C.s");
ASM_FUNC("asm/nonmatching/code_080A652C.s");
u8 SaveMenuGetValidMenuAmt(u8 endMask, struct SaveMenuProc * proc)
{
    int mask, count = 0;

    for (mask = 1; mask < endMask; mask <<= 1)
    {
        if ((proc->unk_30 & mask) != 0)
            count++;
    }

    return count;
}
