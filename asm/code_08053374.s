	.include "macro.inc"

	.syntax unified

	thumb_func_start IsItemDisplayedInBattle
IsItemDisplayedInBattle: @ 0x08053374
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r5, r4, #0
	adds r0, r4, #0
	bl GetItemIndex
	cmp r0, #0x7c
	beq _080533A8
	adds r0, r4, #0
	bl GetItemIndex
	cmp r0, #0x7d
	beq _080533A8
	adds r0, r4, #0
	bl GetItemIndex
	cmp r0, #0x7e
	beq _080533A8
	adds r0, r5, #0
	bl GetItemIndex
	cmp r0, #0x7f
	beq _080533A8
	movs r0, #0
	b _080533AA
_080533A8:
	movs r0, #1
_080533AA:
	pop {r4, r5}
	pop {r1}
	bx r1
