	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800A608
sub_0800A608: @ 0x0800A608
	ldr r1, _0800A614 @ =0x08B90C98
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_0800A614: .4byte 0x08B90C98
