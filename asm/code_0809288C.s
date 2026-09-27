	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809288C
sub_0809288C: @ 0x0809288C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r1, r4, #0
	bl sub_080958B0
	pop {r4}
	pop {r0}
	bx r0
