	.include "macro.inc"

	.syntax unified

	thumb_func_start ComputeBattleUnitSpecialWeaponStats
ComputeBattleUnitSpecialWeaponStats: @ 0x08028EEC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r5, [r4, #0x4c]
	movs r0, #0x40
	ands r5, r0
	cmp r5, #0
	beq _08028F34
	adds r0, r4, #0
	adds r0, #0x48
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x10
	blt _08028F7C
	cmp r0, #0x11
	ble _08028F12
	cmp r0, #0x99
	bne _08028F7C
_08028F12:
	adds r2, r4, #0
	adds r2, #0x5a
	movs r0, #0x14
	ldrsb r0, [r4, r0]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r1, [r2]
	subs r0, r1, r0
	movs r1, #0
	strh r0, [r2]
	adds r0, r4, #0
	adds r0, #0x66
	strh r1, [r0]
	adds r0, #4
	strh r1, [r0]
	b _08028F7C
_08028F34:
	adds r0, r4, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemWeaponEffect
	cmp r0, #3
	bne _08028F68
	movs r0, #0x13
	ldrsb r0, [r6, r0]
	adds r0, #1
	asrs r0, r0, #1
	adds r1, r4, #0
	adds r1, #0x5a
	strh r0, [r1]
	cmp r0, #0
	bne _08028F58
	movs r0, #1
	strh r0, [r1]
_08028F58:
	adds r0, r6, #0
	adds r0, #0x5c
	strh r5, [r0]
	adds r0, r4, #0
	adds r0, #0x66
	strh r5, [r0]
	adds r0, #4
	strh r5, [r0]
_08028F68:
	ldr r0, [r4, #0x4c]
	movs r1, #0x80
	lsls r1, r1, #0xa
	ands r0, r1
	cmp r0, #0
	beq _08028F7C
	adds r1, r6, #0
	adds r1, #0x5c
	movs r0, #0
	strh r0, [r1]
_08028F7C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
