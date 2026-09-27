	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepMapMenu_OnOptions
PrepMapMenu_OnOptions: @ 0x08030480
	push {lr}
	movs r1, #8
	str r1, [r0, #0x58]
	movs r1, #0x39
	bl Proc_Goto
	pop {r0}
	bx r0
