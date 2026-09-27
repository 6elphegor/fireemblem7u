#include "gbafe.h"

int CONST_DATA gHelpTextIds_PrepItemScreen[] = {
	0x385,
	0x389,
	0x38A,
	0x38B,
	0x387,
	0x388,
};

struct ProcCmd CONST_DATA ProcScr_PrepItemScreen[] = {
    PROC_YIELD,
    PROC_CALL(PrepItemScreen_Init),
    PROC_CALL(PrepItemScreen_SetupGfx),
    PROC_CALL(PrepItemScreen_Reinit),
    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),
    PROC_YIELD,
    PROC_GOTO(1),
PROC_LABEL(0),
    PROC_CALL(PrepItemScreen_Reinit),
PROC_LABEL(1),
    PROC_REPEAT(sub_08091DBC),
    PROC_CALL(DisableAllGfx),
    PROC_YIELD,
    PROC_CALL(PrepItemScreen_StartStatScreen),
    PROC_YIELD,
    PROC_CALL(PrepItemScreen_ResumeFromStatScreen),
    PROC_CALL(PrepItemScreen_Reinit),
    PROC_YIELD,
    PROC_CALL(EnableAllGfx),
    PROC_GOTO(1),
PROC_LABEL(2),
    PROC_CALL(sub_0809210C),
    PROC_CALL(PrepItemScreen_DrawFunds),
    PROC_YIELD,
    PROC_CALL(sub_0809218C),
PROC_LABEL(3),
    PROC_REPEAT(sub_08092220),
PROC_LABEL(4),
    PROC_CALL(PrepItemScreen_HideFunds),
    PROC_CALL(sub_080925D0),
    PROC_YIELD,
    PROC_CALL(sub_080926F8),
PROC_LABEL(5),
    PROC_REPEAT(PrepItemScreen_Loop_MainKeyHandler),
    PROC_CALL(DisableAllGfx),
    PROC_YIELD,
    PROC_CALL(PrepItemScreen_StartStatScreen),
    PROC_YIELD,
    PROC_CALL(PrepItemScreen_ResumeFromStatScreen),
    PROC_CALL(sub_080925D0),
    PROC_CALL(sub_080926F8),
    PROC_YIELD,
    PROC_CALL(EnableAllGfx),
    PROC_GOTO(5),
PROC_LABEL(6),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),
    PROC_CALL(StartPrepItemTradeScreen),
    PROC_YIELD,
    PROC_CALL(PrepItemScreen_SetupGfx),
    PROC_YIELD,
    PROC_CALL(sub_080925D0),
    PROC_CALL(sub_080926F8),
    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),
    PROC_GOTO(5),
PROC_LABEL(8),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),
    PROC_CALL(PrepItemScreen_OnEnd),
    PROC_CALL(sub_080928D4),
    PROC_YIELD,
    PROC_CALL(PrepItemScreen_SetupGfx),
    PROC_YIELD,
    PROC_CALL(sub_080921E8),
    PROC_CALL(sub_0809210C),
    PROC_CALL(PrepItemScreen_DrawFunds),
    PROC_CALL(sub_0809218C),
    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),
    PROC_GOTO(3),
PROC_LABEL(9),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),
    PROC_CALL(PrepItemScreen_OnEnd),
    PROC_CALL(sub_0809288C),
    PROC_YIELD,
    PROC_CALL(PrepItemScreen_SetupGfx),
    PROC_YIELD,
    PROC_CALL(sub_080921E8),
    PROC_CALL(sub_0809210C),
    PROC_CALL(PrepItemScreen_DrawFunds),
    PROC_CALL(sub_0809218C),
    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),
    PROC_GOTO(3),
PROC_LABEL(10),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),
    PROC_CALL(PrepItemScreen_OnEnd),
    PROC_CALL(sub_080928A4),
    PROC_YIELD,
    PROC_CALL(PrepItemScreen_SetupGfx),
    PROC_YIELD,
    PROC_CALL(sub_080921E8),
    PROC_CALL(sub_0809210C),
    PROC_CALL(PrepItemScreen_DrawFunds),
    PROC_CALL(sub_0809218C),
    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),
    PROC_GOTO(3),
PROC_LABEL(11),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),
    PROC_CALL(PrepItemScreen_OnEnd),
    PROC_CALL(StartPrepArmory),
    PROC_YIELD,
    PROC_CALL(PrepItemScreen_SetupGfx),
    PROC_YIELD,
    PROC_CALL(sub_080921E8),
    PROC_CALL(sub_0809210C),
    PROC_CALL(PrepItemScreen_DrawFunds),
    PROC_CALL(sub_0809218C),
    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),
    PROC_GOTO(3),
PROC_LABEL(12),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),
    PROC_CALL(PrepItemScreen_OnEnd),
    PROC_END,
};

void PrepItemScreen_OnHBlank(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount > DISPLAY_HEIGHT)
        vcount = 0;

    if (vcount == 0)
        REG_BG0VOFS = 248;

    if (vcount == 72)
        REG_BG0VOFS = 252;
}

ASM_FUNC("asm/nonmatching/code_08091354.s");
ASM_FUNC("asm/nonmatching/code_0809138C.s");
ASM_FUNC("asm/nonmatching/code_080913D8.s");
ASM_FUNC("asm/nonmatching/code_080913FC.s");
ASM_FUNC("asm/nonmatching/code_08091824.s");
ASM_FUNC("asm/nonmatching/code_08091868.s");
ASM_FUNC("asm/nonmatching/code_080918B4.s");
ASM_FUNC("asm/nonmatching/code_080918D4.s");
ASM_FUNC("asm/nonmatching/code_080918F4.s");
ASM_FUNC("asm/nonmatching/code_08091914.s");
ASM_FUNC("asm/nonmatching/code_08091944.s");
ASM_FUNC("asm/nonmatching/code_08091994.s");
ASM_FUNC("asm/nonmatching/code_080919C8.s");
ASM_FUNC("asm/nonmatching/code_08091AD8.s");
ASM_FUNC("asm/nonmatching/code_08091C48.s");
ASM_FUNC("asm/nonmatching/code_08091D70.s");
ASM_FUNC("asm/nonmatching/code_08091D9C.s");
ASM_FUNC("asm/nonmatching/code_08091DBC.s");
ASM_FUNC("asm/nonmatching/code_08091F04.s");
ASM_FUNC("asm/nonmatching/code_08092010.s");
ASM_FUNC("asm/nonmatching/code_0809210C.s");
ASM_FUNC("asm/nonmatching/code_0809218C.s");
ASM_FUNC("asm/nonmatching/code_080921E8.s");
ASM_FUNC("asm/nonmatching/code_08092220.s");
ASM_FUNC("asm/nonmatching/code_08092578.s");
ASM_FUNC("asm/nonmatching/code_080925D0.s");
ASM_FUNC("asm/nonmatching/code_080926F8.s");
ASM_FUNC("asm/nonmatching/code_08092708.s");
ASM_FUNC("asm/nonmatching/code_0809285C.s");
ASM_FUNC("asm/nonmatching/code_0809288C.s");
ASM_FUNC("asm/nonmatching/code_080928A4.s");
ASM_FUNC("asm/nonmatching/code_080928BC.s");
ASM_FUNC("asm/nonmatching/code_080928D4.s");
ASM_FUNC("asm/nonmatching/code_080928EC.s");
ASM_FUNC("asm/nonmatching/code_080929A4.s");
ASM_FUNC("asm/nonmatching/code_080929BC.s");
ASM_FUNC("asm/nonmatching/code_080929D0.s");
ASM_FUNC("asm/nonmatching/code_08092AE4.s");
ASM_FUNC("asm/nonmatching/code_08092B6C.s");
ASM_FUNC("asm/nonmatching/code_08092C34.s");
ASM_FUNC("asm/nonmatching/code_08092C44.s");
ASM_FUNC("asm/nonmatching/code_08092CB8.s");
ASM_FUNC("asm/nonmatching/code_08092ED4.s");
ASM_FUNC("asm/nonmatching/code_08092F08.s");
