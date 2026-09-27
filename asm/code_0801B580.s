	.include "macro.inc"

	.syntax unified

	thumb_func_start EndMenuAndClear
EndMenuAndClear: @ 0x0801B580
	push {lr}
	bl EndMenu
	movs r0, #0
	bl EndFaceById
	bl ClearUi
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
