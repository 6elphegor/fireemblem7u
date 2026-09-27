	.include "macro.inc"

	.syntax unified

	thumb_func_start PutBattleForecastWeaponTriangleArrows
PutBattleForecastWeaponTriangleArrows: @ 0x08033CB4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r6, #0
	movs r5, #0
	ldr r0, _08033D50 @ =0x0203A3F0
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _08033CCC
	movs r6, #1
_08033CCC:
	cmp r0, #0
	bge _08033CD2
	movs r6, #2
_08033CD2:
	ldr r0, _08033D54 @ =0x0203A470
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _08033CE2
	movs r5, #1
_08033CE2:
	cmp r0, #0
	bge _08033CE8
	movs r5, #2
_08033CE8:
	cmp r5, #0
	beq _08033D18
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, #8
	lsls r0, r0, #3
	adds r3, r0, #3
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, #0xb
	lsls r1, r0, #3
	movs r2, #0
	cmp r5, #2
	bne _08033D12
	movs r2, #1
_08033D12:
	adds r0, r3, #0
	bl PutSysArrow
_08033D18:
	cmp r6, #0
	beq _08033D48
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, #2
	lsls r0, r0, #3
	adds r3, r0, #3
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, #1
	lsls r1, r0, #3
	movs r2, #0
	cmp r6, #2
	bne _08033D42
	movs r2, #1
_08033D42:
	adds r0, r3, #0
	bl PutSysArrow
_08033D48:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08033D50: .4byte 0x0203A3F0
_08033D54: .4byte 0x0203A470
