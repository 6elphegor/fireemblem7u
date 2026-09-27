	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitMagRange
GetUnitMagRange: @ 0x080184B4
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemPowBonus
	movs r1, #0x14
	ldrsb r1, [r4, r1]
	adds r1, r1, r0
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r0, r1, #1
	cmp r0, #4
	bgt _080184D6
	movs r0, #5
_080184D6:
	pop {r4}
	pop {r1}
	bx r1
