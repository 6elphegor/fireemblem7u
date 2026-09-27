	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08022A38
sub_08022A38: @ 0x08022A38
	push {lr}
	bl HideMoveRangeGraphics
	movs r0, #0
	pop {r1}
	bx r1
