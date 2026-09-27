	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800A7BC
sub_0800A7BC: @ 0x0800A7BC
	ldr r1, _0800A7C8 @ =0x03000100
	movs r0, #0
	str r0, [r1]
	movs r0, #1
	bx lr
	.align 2, 0
_0800A7C8: .4byte 0x03000100
