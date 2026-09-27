	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_ClearOnSkipFunc
EvtCmd_ClearOnSkipFunc: @ 0x0800EB68
	movs r1, #0
	str r1, [r0, #0x3c]
	movs r0, #0
	bx lr
