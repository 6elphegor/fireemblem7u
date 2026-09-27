	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitEquippedWeapon
GetUnitEquippedWeapon: @ 0x08016764
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
_0801676A:
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r4, r0, r1
	ldrh r1, [r4]
	adds r0, r6, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08016786
	ldrh r0, [r4]
	b _0801678E
_08016786:
	adds r5, #1
	cmp r5, #4
	ble _0801676A
	movs r0, #0
_0801678E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
