	.include "macro.inc"

	.syntax unified

	thumb_func_start SetBallistaOccupied
SetBallistaOccupied: @ 0x08034864
	movs r1, #1
	strb r1, [r0, #5]
	bx lr
	.align 2, 0
