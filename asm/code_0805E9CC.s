	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805E9CC
sub_0805E9CC: @ 0x0805E9CC
	ldr r1, _0805E9D8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_0805E9D8: .4byte 0x0201774C
