	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08021B9C
sub_08021B9C: @ 0x08021B9C
	push {lr}
	bl HideMoveRangeGraphics
	movs r0, #0
	pop {r1}
	bx r1
