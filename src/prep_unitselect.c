#include "gbafe.h"

u16 CONST_DATA Sprite_08CC4818[] =
{
    3,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, 0,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x4),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(64), OAM2_CHR(0x8),
};

u16 CONST_DATA Sprite_08CC482C[] =
{
    3,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0xC),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x10),
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16 + OAM1_X(64), OAM2_CHR(0x14),
};

u16 CONST_DATA Sprite_08CC4840[] =
{
    3,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0xC),
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16 + OAM1_X(32), OAM2_CHR(0x10),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(48), OAM2_CHR(0x17),
};

struct ProcCmd CONST_DATA ProcScr_PrepUnitScreen[] = {
    PROC_YIELD,
    PROC_SET_END_CB(ProcPrepUnit_OnEnd),
PROC_LABEL(0),
    PROC_CALL(ProcPrepUnit_OnInit),
    PROC_CALL(ProcPrepUnit_InitScreen),
    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),
PROC_LABEL(1),
    PROC_REPEAT(ProcPrepUnit_Idle),
PROC_LABEL(2),
    PROC_CALL(sub_08093DE8),
    PROC_REPEAT(sub_08093D54),
    PROC_REPEAT(sub_08093E2C),
    PROC_REPEAT(sub_08093D9C),
    PROC_CALL(sub_08093E00),
    PROC_GOTO(1),
PROC_LABEL(3),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),
    PROC_CALL(sub_08093A7C),
    PROC_CALL(sub_08093ED8),
    PROC_YIELD,
    PROC_CALL(sub_08093EF8),
    PROC_CALL(ProcPrepUnit_InitScreen),
    PROC_YIELD,
    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),
    PROC_GOTO(1),
PROC_LABEL(4),
    PROC_CALL(PrepUnitDisableDisp),
    PROC_SLEEP(2),
    PROC_CALL(sub_08093A7C),
    PROC_CALL(sub_08093F84),
    PROC_YIELD,
    PROC_CALL(sub_08093FA0),
    PROC_CALL(ProcPrepUnit_InitScreen),
    PROC_SLEEP(2),
    PROC_CALL(PrepUnitEnableDisp),
    PROC_GOTO(1),
PROC_LABEL(99),
    PROC_CALL(ProcPrepUnit_OnGameStart),
    PROC_SLEEP(30),
    PROC_CALL_ARG(NewFadeOut, 8),
    PROC_WHILE(FadeOutExists),
    PROC_GOTO(100),
PROC_LABEL(10),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),
PROC_LABEL(100),
    PROC_END,
};

ASM_FUNC("asm/nonmatching/code_08092F50.s");
ASM_FUNC("asm/nonmatching/code_08093014.s");
ASM_FUNC("asm/nonmatching/code_0809303C.s");
ASM_FUNC("asm/nonmatching/code_080931A8.s");
ASM_FUNC("asm/nonmatching/code_08093208.s");
ASM_FUNC("asm/nonmatching/code_08093250.s");
ASM_FUNC("asm/nonmatching/code_080932BC.s");
ASM_FUNC("asm/nonmatching/code_080932F4.s");
ASM_FUNC("asm/nonmatching/code_080933B4.s");
ASM_FUNC("asm/nonmatching/code_080933C4.s");
ASM_FUNC("asm/nonmatching/code_080934BC.s");
ASM_FUNC("asm/nonmatching/code_080935A4.s");
ASM_FUNC("asm/nonmatching/code_08093618.s");
ASM_FUNC("asm/nonmatching/code_08093690.s");
ASM_FUNC("asm/nonmatching/code_08093734.s");
ASM_FUNC("asm/nonmatching/code_08093794.s");
ASM_FUNC("asm/nonmatching/code_080937CC.s");
ASM_FUNC("asm/nonmatching/code_08093814.s");
ASM_FUNC("asm/nonmatching/code_08093840.s");
ASM_FUNC("asm/nonmatching/code_08093880.s");
ASM_FUNC("asm/nonmatching/code_08093A7C.s");
ASM_FUNC("asm/nonmatching/code_08093AA0.s");
ASM_FUNC("asm/nonmatching/code_08093D54.s");
ASM_FUNC("asm/nonmatching/code_08093D9C.s");
ASM_FUNC("asm/nonmatching/code_08093DE4.s");
ASM_FUNC("asm/nonmatching/code_08093DE8.s");
ASM_FUNC("asm/nonmatching/code_08093E00.s");
ASM_FUNC("asm/nonmatching/code_08093E2C.s");
ASM_FUNC("asm/nonmatching/code_08093E8C.s");
ASM_FUNC("asm/nonmatching/code_08093EB8.s");
ASM_FUNC("asm/nonmatching/code_08093ED8.s");
ASM_FUNC("asm/nonmatching/code_08093EF8.s");
ASM_FUNC("asm/nonmatching/code_08093F40.s");
ASM_FUNC("asm/nonmatching/code_08093F64.s");
ASM_FUNC("asm/nonmatching/code_08093F84.s");
ASM_FUNC("asm/nonmatching/code_08093FA0.s");
