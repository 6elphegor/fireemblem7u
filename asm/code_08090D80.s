	.include "macro.inc"

	.syntax unified

	thumb_func_start CountUnitUsableWeapons
CountUnitUsableWeapons: @ 0x08090D80
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
	movs r4, #0
_08090D88:
	lsls r1, r4, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl IsWeaponUsable
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08090DA2
	adds r6, #1
_08090DA2:
	adds r4, #1
	cmp r4, #4
	ble _08090D88
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
