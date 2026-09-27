	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepMapMenu_OnSave
PrepMapMenu_OnSave: @ 0x080304C0
	push {lr}
	movs r1, #9
	str r1, [r0, #0x58]
	movs r1, #0x3b
	bl Proc_Goto
	pop {r0}
	bx r0
