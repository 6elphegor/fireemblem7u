	.include "macro.inc"

	.syntax unified

	thumb_func_start Get8
Get8: @ 0x0801B244
	movs r0, #8
	bx lr
