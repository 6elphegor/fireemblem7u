	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08038014
sub_08038014: @ 0x08038014
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr
