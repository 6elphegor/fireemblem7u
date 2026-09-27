	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805E410
sub_0805E410: @ 0x0805E410
	ldr r1, _0805E41C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_0805E41C: .4byte 0x0201774C
