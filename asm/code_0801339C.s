	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801339C
sub_0801339C: @ 0x0801339C
	adds r0, #0x4c
	ldrh r1, [r0]
	subs r1, #1
	strh r1, [r0]
	bx lr
	.align 2, 0
