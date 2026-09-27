	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08099400
sub_08099400: @ 0x08099400
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bx lr
