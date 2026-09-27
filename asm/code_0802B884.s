	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802B884
sub_0802B884: @ 0x0802B884
	push {lr}
	adds r1, r0, #0
	ldr r0, _0802B894 @ =0x08B944C8
	bl StartEventInternal
	pop {r0}
	bx r0
	.align 2, 0
_0802B894: .4byte 0x08B944C8
