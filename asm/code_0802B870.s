	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802B870
sub_0802B870: @ 0x0802B870
	push {lr}
	adds r1, r0, #0
	ldr r0, _0802B880 @ =0x08B9446C
	bl StartEventInternal
	pop {r0}
	bx r0
	.align 2, 0
_0802B880: .4byte 0x08B9446C
