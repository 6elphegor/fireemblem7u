	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepMapMenu_OnStartPress
PrepMapMenu_OnStartPress: @ 0x08030400
	push {lr}
	movs r1, #0x37
	bl Proc_Goto
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
