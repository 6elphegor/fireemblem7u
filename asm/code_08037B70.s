	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08037B70
sub_08037B70: @ 0x08037B70
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr
