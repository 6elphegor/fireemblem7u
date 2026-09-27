	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080672E8
sub_080672E8: @ 0x080672E8
	push {r4, lr}
	adds r4, r0, #0
	bl RandNextB
	adds r4, #1
	adds r1, r4, #0
	bl DivRem
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
