	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08013380
sub_08013380: @ 0x08013380
	adds r0, #0x4c
	strh r1, [r0]
	bx lr
	.align 2, 0
