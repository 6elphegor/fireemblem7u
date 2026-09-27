	.include "macro.inc"

	.syntax unified

	thumb_func_start ApplyAffinityBonuses
ApplyAffinityBonuses: @ 0x080269B0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	adds r5, r2, #0
	bl GetAffinityBonuses
	ldrb r2, [r0, #1]
	adds r1, r2, #0
	muls r1, r5, r1
	ldrb r2, [r4, #1]
	adds r1, r2, r1
	strb r1, [r4, #1]
	ldrb r2, [r0, #2]
	adds r1, r2, #0
	muls r1, r5, r1
	ldrb r2, [r4, #2]
	adds r1, r2, r1
	strb r1, [r4, #2]
	ldrb r2, [r0, #3]
	adds r1, r2, #0
	muls r1, r5, r1
	ldrb r2, [r4, #3]
	adds r1, r2, r1
	strb r1, [r4, #3]
	ldrb r2, [r0, #4]
	adds r1, r2, #0
	muls r1, r5, r1
	ldrb r2, [r4, #4]
	adds r1, r2, r1
	strb r1, [r4, #4]
	ldrb r2, [r0, #5]
	adds r1, r2, #0
	muls r1, r5, r1
	ldrb r2, [r4, #5]
	adds r1, r2, r1
	strb r1, [r4, #5]
	ldrb r0, [r0, #6]
	muls r0, r5, r0
	ldrb r1, [r4, #6]
	adds r0, r1, r0
	strb r0, [r4, #6]
	pop {r4, r5}
	pop {r0}
	bx r0
