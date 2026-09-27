	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805C594
sub_0805C594: @ 0x0805C594
	ldr r1, _0805C5A0 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_0805C5A0: .4byte 0x0201774C
