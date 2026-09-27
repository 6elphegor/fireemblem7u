	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807A318
sub_0807A318: @ 0x0807A318
	ldr r0, _0807A330 @ =0x03004690
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	lsrs r1, r1, #0xe
	movs r0, #1
	bics r0, r1
	bx lr
	.align 2, 0
_0807A330: .4byte 0x03004690
