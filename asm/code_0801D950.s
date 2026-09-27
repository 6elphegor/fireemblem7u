	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801D950
sub_0801D950: @ 0x0801D950
	push {lr}
	bl ItemSelectMenu_TextDraw
	pop {r1}
	bx r1
	.align 2, 0
