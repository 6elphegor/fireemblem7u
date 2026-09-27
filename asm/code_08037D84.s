	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08037D84
sub_08037D84: @ 0x08037D84
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr
