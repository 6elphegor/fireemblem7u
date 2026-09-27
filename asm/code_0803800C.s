	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803800C
sub_0803800C: @ 0x0803800C
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr
