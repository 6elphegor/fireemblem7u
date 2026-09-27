	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08055900
sub_08055900: @ 0x08055900
	ldr r1, _0805590C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_0805590C: .4byte 0x0201774C
