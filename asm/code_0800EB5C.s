	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_OnSkipFunc
EvtCmd_OnSkipFunc: @ 0x0800EB5C
	ldr r1, [r0, #0x30]
	ldr r1, [r1, #4]
	str r1, [r0, #0x3c]
	movs r0, #0
	bx lr
	.align 2, 0
