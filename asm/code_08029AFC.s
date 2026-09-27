	.include "macro.inc"

	.syntax unified

	thumb_func_start GetBattleUnitUpdatedWeaponExp
GetBattleUnitUpdatedWeaponExp: @ 0x08029AFC
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r0, #0xc0
	ldrb r1, [r7, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _08029B58
	movs r0, #0x13
	ldrsb r0, [r7, r0]
	cmp r0, #0
	beq _08029B58
	ldr r1, _08029B60 @ =0x0202BBF8
	movs r0, #0x80
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _08029B58
	ldr r1, _08029B64 @ =0x0202BBB8
	movs r0, #0x40
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _08029B58
	ldr r1, _08029B68 @ =0x0203A3D8
	movs r0, #0x20
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08029B6C
	adds r0, r7, #0
	adds r0, #0x52
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08029B58
	ldr r1, [r7, #0x4c]
	movs r0, #5
	ands r0, r1
	cmp r0, #0
	beq _08029B58
	movs r0, #0x88
	lsls r0, r0, #3
	ands r1, r0
	cmp r1, #0
	beq _08029B6C
_08029B58:
	movs r0, #1
	rsbs r0, r0, #0
	b _08029BE0
	.align 2, 0
_08029B60: .4byte 0x0202BBF8
_08029B64: .4byte 0x0202BBB8
_08029B68: .4byte 0x0203A3D8
_08029B6C:
	adds r4, r7, #0
	adds r4, #0x50
	adds r5, r7, #0
	adds r5, #0x28
	ldrb r1, [r4]
	adds r0, r1, r5
	ldrb r6, [r0]
	adds r0, r7, #0
	adds r0, #0x48
	ldrh r0, [r0]
	bl GetItemAwardedExp
	adds r1, r7, #0
	adds r1, #0x7b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	muls r0, r1, r0
	adds r6, r6, r0
	movs r1, #0
	ldrb r3, [r4]
_08029B96:
	ldr r2, [r7, #4]
	cmp r1, r3
	beq _08029BB8
	adds r0, r2, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xfb
	beq _08029BB8
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #0xfa
	bls _08029BB8
	cmp r6, #0xfa
	ble _08029BBE
	movs r6, #0xfa
	b _08029BBE
_08029BB8:
	adds r1, #1
	cmp r1, #7
	ble _08029B96
_08029BBE:
	ldr r0, [r7]
	ldr r0, [r0, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08029BD8
	cmp r6, #0xfb
	ble _08029BDE
	movs r6, #0xfb
	b _08029BDE
_08029BD8:
	cmp r6, #0xb5
	ble _08029BDE
	movs r6, #0xb5
_08029BDE:
	adds r0, r6, #0
_08029BE0:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
