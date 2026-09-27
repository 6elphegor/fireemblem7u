	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_Jump
EvtCmd_Jump: @ 0x0800D91C
	ldr r1, [r0, #0x30]
	ldr r1, [r1, #4]
	str r1, [r0, #0x30]
	str r1, [r0, #0x2c]
	movs r0, #1
	bx lr
