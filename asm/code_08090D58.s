	.include "macro.inc"

	.syntax unified

	thumb_func_start IsWeaponUsable
IsWeaponUsable: @ 0x08090D58
	push {r4, lr}
	adds r4, r1, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08090D78
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #0x80
	ands r1, r0
	cmp r1, #0
	bne _08090D78
	movs r0, #1
	b _08090D7A
_08090D78:
	movs r0, #0
_08090D7A:
	pop {r4}
	pop {r1}
	bx r1
