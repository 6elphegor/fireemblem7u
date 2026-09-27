	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08033118
sub_08033118: @ 0x08033118
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bx lr
