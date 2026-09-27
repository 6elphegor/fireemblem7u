	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800AD28
sub_0800AD28: @ 0x0800AD28
	ldr r1, _0800AD30 @ =0x03000108
	strh r0, [r1]
	bx lr
	.align 2, 0
_0800AD30: .4byte 0x03000108
