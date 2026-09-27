	.include "macro.inc"

	.syntax unified

	thumb_func_start CheckBattleUnitStatCaps
CheckBattleUnitStatCaps: @ 0x08029970
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	mov ip, r1
	movs r1, #0x12
	ldrsb r1, [r2, r1]
	mov r0, ip
	adds r0, #0x73
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	movs r0, #0xc0
	ldrb r3, [r2, #0xb]
	ands r0, r3
	cmp r0, #0x80
	bne _08029996
	cmp r1, #0x78
	bgt _0802999A
	b _080299B6
_08029996:
	cmp r1, #0x3c
	ble _080299B6
_0802999A:
	movs r1, #0x12
	ldrsb r1, [r2, r1]
	movs r0, #0xc0
	ldrb r6, [r2, #0xb]
	ands r0, r6
	cmp r0, #0x80
	bne _080299AC
	movs r0, #0x78
	b _080299AE
_080299AC:
	movs r0, #0x3c
_080299AE:
	subs r0, r0, r1
	mov r1, ip
	adds r1, #0x73
	strb r0, [r1]
_080299B6:
	movs r0, #0x14
	ldrsb r0, [r2, r0]
	mov r4, ip
	adds r4, #0x74
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	ldr r5, [r2, #4]
	movs r1, #0x14
	ldrsb r1, [r5, r1]
	adds r3, r5, #0
	cmp r0, r1
	ble _080299D8
	ldrb r1, [r3, #0x14]
	ldrb r6, [r2, #0x14]
	subs r0, r1, r6
	strb r0, [r4]
_080299D8:
	movs r0, #0x15
	ldrsb r0, [r2, r0]
	mov r4, ip
	adds r4, #0x75
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	movs r1, #0x15
	ldrsb r1, [r3, r1]
	cmp r0, r1
	ble _080299F6
	ldrb r1, [r3, #0x15]
	ldrb r6, [r2, #0x15]
	subs r0, r1, r6
	strb r0, [r4]
_080299F6:
	movs r0, #0x16
	ldrsb r0, [r2, r0]
	mov r4, ip
	adds r4, #0x76
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	movs r1, #0x16
	ldrsb r1, [r3, r1]
	cmp r0, r1
	ble _08029A14
	ldrb r1, [r3, #0x16]
	ldrb r6, [r2, #0x16]
	subs r0, r1, r6
	strb r0, [r4]
_08029A14:
	movs r0, #0x17
	ldrsb r0, [r2, r0]
	mov r4, ip
	adds r4, #0x77
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	movs r1, #0x17
	ldrsb r1, [r3, r1]
	cmp r0, r1
	ble _08029A32
	ldrb r3, [r3, #0x17]
	ldrb r1, [r2, #0x17]
	subs r0, r3, r1
	strb r0, [r4]
_08029A32:
	movs r0, #0x18
	ldrsb r0, [r2, r0]
	mov r3, ip
	adds r3, #0x78
	movs r1, #0
	ldrsb r1, [r3, r1]
	adds r0, r0, r1
	movs r1, #0x18
	ldrsb r1, [r5, r1]
	cmp r0, r1
	ble _08029A50
	ldrb r5, [r5, #0x18]
	ldrb r6, [r2, #0x18]
	subs r0, r5, r6
	strb r0, [r3]
_08029A50:
	movs r0, #0x19
	ldrsb r0, [r2, r0]
	mov r3, ip
	adds r3, #0x79
	movs r1, #0
	ldrsb r1, [r3, r1]
	adds r0, r0, r1
	cmp r0, #0x1e
	ble _08029A6A
	movs r0, #0x1e
	ldrb r2, [r2, #0x19]
	subs r0, r0, r2
	strb r0, [r3]
_08029A6A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
