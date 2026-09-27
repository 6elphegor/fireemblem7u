	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A6018
sub_080A6018: @ 0x080A6018
	adds r2, r0, #0
	adds r2, #0x32
	ldrb r3, [r2]
	orrs r1, r3
	strb r1, [r2]
	adds r0, #0x33
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr
