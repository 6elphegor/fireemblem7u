	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809D7A0
sub_0809D7A0: @ 0x0809D7A0
	adds r2, r0, #0
	ldr r1, [r2, #0xc]
	movs r0, #0xd
	muls r0, r1, r0
	adds r0, #1
	movs r1, #0xff
	ands r0, r1
	str r0, [r2, #0xc]
	bx lr
	.align 2, 0
