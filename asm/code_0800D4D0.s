	.include "macro.inc"

	.syntax unified

	thumb_func_start Event43_Goto
Event43_Goto: @ 0x0800D4D0
	push {lr}
	ldr r1, [r0, #0x30]
	ldr r1, [r1, #4]
	bl EventGotoLabel
	pop {r1}
	bx r1
	.align 2, 0
