	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802B898
sub_0802B898: @ 0x0802B898
	push {lr}
	adds r1, r0, #0
	ldr r0, _0802B8A8 @ =0x08B9451C
	bl StartEventInternal
	pop {r0}
	bx r0
	.align 2, 0
_0802B8A8: .4byte 0x08B9451C
