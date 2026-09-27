	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitEquippedWeaponSlot
GetUnitEquippedWeaponSlot: @ 0x08016794
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_0801679A:
	lsls r1, r4, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl CanUnitUseWeaponNow
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080167B6
	adds r0, r4, #0
	b _080167C0
_080167B6:
	adds r4, #1
	cmp r4, #4
	ble _0801679A
	movs r0, #1
	rsbs r0, r0, #0
_080167C0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
