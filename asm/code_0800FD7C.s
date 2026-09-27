	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800FD7C
sub_0800FD7C: @ 0x0800FD7C
	ldr r1, [r0, #0x30]
	ldr r3, [r1, #4]
	ldr r2, [r0, #0x2c]
	str r2, [r0, #0x34]
	adds r1, #8
	str r1, [r0, #0x38]
	str r3, [r0, #0x30]
	str r3, [r0, #0x2c]
	movs r0, #1
	bx lr
