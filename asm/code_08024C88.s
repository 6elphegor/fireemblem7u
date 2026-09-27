	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08024C88
sub_08024C88: @ 0x08024C88
	ldr r1, _08024C94 @ =0x0203A3D0
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08024C94: .4byte 0x0203A3D0
