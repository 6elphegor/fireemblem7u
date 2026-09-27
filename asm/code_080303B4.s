	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepMapMenu_OnViewMap
PrepMapMenu_OnViewMap: @ 0x080303B4
	push {lr}
	movs r1, #1
	str r1, [r0, #0x58]
	bl Proc_Break
	bl EndPrepScreenMenu_
	pop {r0}
	bx r0
	.align 2, 0
