	.include "macro.inc"

	.syntax unified

	thumb_func_start SaveMenuGetValidMenuAmt
SaveMenuGetValidMenuAmt: @ 0x080A6634
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r1, #0
	movs r2, #1
	cmp r2, r3
	bge _080A665A
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r4, [r0]
_080A664A:
	adds r0, r4, #0
	ands r0, r2
	cmp r0, #0
	beq _080A6654
	adds r1, #1
_080A6654:
	lsls r2, r2, #1
	cmp r2, r3
	blt _080A664A
_080A665A:
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
