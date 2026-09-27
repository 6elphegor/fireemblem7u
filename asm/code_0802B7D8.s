	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802B7D8
sub_0802B7D8: @ 0x0802B7D8
	push {lr}
	adds r1, r0, #0
	ldr r0, _0802B7E8 @ =0x08B943D0
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0802B7E8: .4byte 0x08B943D0
