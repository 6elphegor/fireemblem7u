	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08055A40
sub_08055A40: @ 0x08055A40
	ldr r1, _08055A4C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08055A4C: .4byte 0x0201774C
