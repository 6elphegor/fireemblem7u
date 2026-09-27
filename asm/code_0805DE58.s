	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805DE58
sub_0805DE58: @ 0x0805DE58
	ldr r1, _0805DE64 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_0805DE64: .4byte 0x0201774C
