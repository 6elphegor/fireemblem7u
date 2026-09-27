	.include "macro.inc"

	.syntax unified

	thumb_func_start EndPrepScreenMenu_
EndPrepScreenMenu_: @ 0x080303A8
	push {lr}
	bl EndPrepScreenMenu
	pop {r0}
	bx r0
	.align 2, 0
