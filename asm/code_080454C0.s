	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080454C0
sub_080454C0: @ 0x080454C0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
_080454C6:
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _080454F2
	adds r0, r6, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080454F2
	movs r0, #1
	b _080454FA
_080454F2:
	adds r5, #1
	cmp r5, #4
	ble _080454C6
	movs r0, #0
_080454FA:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
