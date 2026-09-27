	.include "macro.inc"

	.syntax unified

	thumb_func_start Text_GetChrOffset
Text_GetChrOffset: @ 0x0800555C
	ldrb r2, [r0, #4]
	ldrb r3, [r0, #6]
	adds r1, r2, #0
	muls r1, r3, r1
	ldrh r0, [r0]
	adds r1, r0, r1
	lsls r1, r1, #1
	adds r0, r1, #0
	bx lr
	.align 2, 0
