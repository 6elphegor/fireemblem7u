	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepMapMenu_OnBPress
PrepMapMenu_OnBPress: @ 0x08030410
	push {lr}
	movs r1, #0x33
	bl Proc_Goto
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
