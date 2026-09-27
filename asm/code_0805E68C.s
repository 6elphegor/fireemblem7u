	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805E68C
sub_0805E68C: @ 0x0805E68C
	ldr r1, _0805E698 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_0805E698: .4byte 0x0201774C
