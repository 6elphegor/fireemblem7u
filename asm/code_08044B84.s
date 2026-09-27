	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08044B84
sub_08044B84: @ 0x08044B84
	ldr r1, _08044B94 @ =0x0300141C
	movs r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	strb r0, [r1, #3]
	strb r0, [r1, #2]
	bx lr
	.align 2, 0
_08044B94: .4byte 0x0300141C
