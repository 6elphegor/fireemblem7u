	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800AD1C
sub_0800AD1C: @ 0x0800AD1C
	ldr r1, _0800AD24 @ =0x03000104
	str r0, [r1]
	bx lr
	.align 2, 0
_0800AD24: .4byte 0x03000104
