	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08054E5C
sub_08054E5C: @ 0x08054E5C
	ldr r3, [r0, #0x14]
	movs r2, #8
	ldrh r1, [r3, #0x10]
	orrs r1, r2
	strh r1, [r3, #0x10]
	ldr r3, [r0, #0x18]
	ldrh r0, [r3, #0x10]
	orrs r0, r2
	strh r0, [r3, #0x10]
	bx lr
