	.include "macro.inc"

	.syntax unified

	thumb_func_start ClearBallistaOccupied
ClearBallistaOccupied: @ 0x0803485C
	movs r1, #0
	strb r1, [r0, #5]
	bx lr
	.align 2, 0
