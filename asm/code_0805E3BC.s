	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805E3BC
sub_0805E3BC: @ 0x0805E3BC
	ldr r1, _0805E3C8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_0805E3C8: .4byte 0x0201774C
