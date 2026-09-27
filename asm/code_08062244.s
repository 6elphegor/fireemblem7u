	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08062244
sub_08062244: @ 0x08062244
	ldr r1, _08062250 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08062250: .4byte 0x0201774C
