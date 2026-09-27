	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_ClearMenuOverrides
EvtCmd_ClearMenuOverrides: @ 0x0800FB88
	push {lr}
	bl ClearMenuOverrides
	movs r0, #0
	pop {r1}
	bx r1
