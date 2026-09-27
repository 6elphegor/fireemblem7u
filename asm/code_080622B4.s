	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080622B4
sub_080622B4: @ 0x080622B4
	ldr r1, _080622C0 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_080622C0: .4byte 0x0201774C
