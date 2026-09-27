	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080131F8
sub_080131F8: @ 0x080131F8
	lsls r3, r1, #5
	ldr r2, [r0]
	adds r2, r2, r3
	str r2, [r0]
	ldr r2, [r0, #4]
	adds r1, r2, r1
	str r1, [r0, #4]
	adds r0, r2, #0
	bx lr
	.align 2, 0
