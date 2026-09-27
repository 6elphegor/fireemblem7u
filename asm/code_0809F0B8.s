	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809F0B8
sub_0809F0B8: @ 0x0809F0B8
	asrs r2, r1, #5
	lsls r2, r2, #2
	adds r0, r0, r2
	movs r2, #0x1f
	ands r2, r1
	movs r3, #1
	lsls r3, r2
	ldr r1, [r0]
	orrs r1, r3
	str r1, [r0]
	bx lr
	.align 2, 0
