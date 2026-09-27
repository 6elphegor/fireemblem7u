	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802B7EC
sub_0802B7EC: @ 0x0802B7EC
	push {lr}
	adds r1, r0, #0
	ldr r0, _0802B7FC @ =0x08B943E8
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0802B7FC: .4byte 0x08B943E8
