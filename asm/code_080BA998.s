	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BA998
sub_080BA998: @ 0x080BA998
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl SetOnHBlankA
	adds r0, r4, #0
	bl Title_StartTextFlame
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
