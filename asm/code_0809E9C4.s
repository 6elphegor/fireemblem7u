	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809E9C4
sub_0809E9C4: @ 0x0809E9C4
	push {r4, lr}
	adds r4, r0, #0
	bl GetConvoyItemArray
	adds r1, r4, #0
	movs r2, #0xc8
	bl WriteAndVerifySramFast
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
