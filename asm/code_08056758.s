	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08056758
sub_08056758: @ 0x08056758
	ldr r1, _08056764 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08056764: .4byte 0x0201774C
