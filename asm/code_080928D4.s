	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080928D4
sub_080928D4: @ 0x080928D4
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r1, r4, #0
	bl sub_08098588
	pop {r4}
	pop {r0}
	bx r0
