	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08060114
sub_08060114: @ 0x08060114
	ldr r1, _08060120 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08060120: .4byte 0x0201774C
