	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A6004
sub_080A6004: @ 0x080A6004
	adds r2, r0, #0
	adds r2, #0x30
	ldrb r3, [r2]
	orrs r1, r3
	strb r1, [r2]
	adds r0, #0x31
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr
