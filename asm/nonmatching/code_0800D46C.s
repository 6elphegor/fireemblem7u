	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_Stop
EvtCmd_Stop: @ 0x0800D46C
	movs r0, #3
	bx lr
