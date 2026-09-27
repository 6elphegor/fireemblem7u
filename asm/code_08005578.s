	.include "macro.inc"

	.syntax unified

	thumb_func_start Text_Skip
Text_Skip: @ 0x08005578
	ldrb r2, [r0, #2]
	adds r1, r2, r1
	strb r1, [r0, #2]
	bx lr
