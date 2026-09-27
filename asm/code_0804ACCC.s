	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804ACCC
sub_0804ACCC: @ 0x0804ACCC
	adds r1, r0, #0
	adds r1, #0x61
	adds r0, #0x62
	ldrb r0, [r0]
	ldrb r1, [r1]
	eors r0, r1
	adds r1, r0, #0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0
