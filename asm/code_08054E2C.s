	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08054E2C
sub_08054E2C: @ 0x08054E2C
	lsls r1, r1, #0x10
	ldr r2, [r0, #0x14]
	lsrs r1, r1, #6
	strh r1, [r2, #8]
	ldr r2, [r0, #0x18]
	strh r1, [r2, #8]
	bx lr
	.align 2, 0
