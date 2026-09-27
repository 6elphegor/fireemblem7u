	.include "macro.inc"

	.syntax unified

	thumb_func_start StartPrepArmory
StartPrepArmory: @ 0x080928BC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r1, r4, #0
	bl sub_08098F70
	pop {r4}
	pop {r0}
	bx r0
