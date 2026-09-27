	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08027674
sub_08027674: @ 0x08027674
	ldr r1, _0802767C @ =0x0203A85C
	movs r0, #0x17
	strb r0, [r1, #0x11]
	bx lr
	.align 2, 0
_0802767C: .4byte 0x0203A85C
