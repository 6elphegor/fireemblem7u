	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08022ABC
sub_08022ABC: @ 0x08022ABC
	push {lr}
	bl ItemSelectMenu_TextDraw
	pop {r1}
	bx r1
	.align 2, 0
