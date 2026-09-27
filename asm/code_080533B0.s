	.include "macro.inc"

	.syntax unified

	thumb_func_start IsWeaponLegency
IsWeaponLegency: @ 0x080533B0
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r5, r4, #0
	adds r0, r4, #0
	bl GetItemIndex
	cmp r0, #0x84
	beq _080533E4
	adds r0, r4, #0
	bl GetItemIndex
	cmp r0, #0x85
	beq _080533E4
	adds r0, r4, #0
	bl GetItemIndex
	cmp r0, #0x86
	beq _080533E4
	adds r0, r5, #0
	bl GetItemIndex
	cmp r0, #0x3c
	beq _080533E4
	movs r0, #0
	b _080533E6
_080533E4:
	movs r0, #1
_080533E6:
	pop {r4, r5}
	pop {r1}
	bx r1
