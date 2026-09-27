	.include "macro.inc"

	.syntax unified

	thumb_func_start UnitCheckStatCaps
UnitCheckStatCaps: @ 0x08017C64
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r1, #0x12
	ldrsb r1, [r4, r1]
	movs r0, #0xc0
	ldrb r2, [r4, #0xb]
	ands r0, r2
	cmp r0, #0x80
	bne _08017C7C
	cmp r1, #0x78
	bgt _08017C80
	b _08017C90
_08017C7C:
	cmp r1, #0x3c
	ble _08017C90
_08017C80:
	movs r0, #0xc0
	ldrb r1, [r4, #0xb]
	ands r0, r1
	movs r1, #0x3c
	cmp r0, #0x80
	bne _08017C8E
	movs r1, #0x78
_08017C8E:
	strb r1, [r4, #0x12]
_08017C90:
	ldr r7, [r4, #4]
	movs r1, #0x14
	ldrsb r1, [r4, r1]
	ldrb r2, [r7, #0x14]
	movs r0, #0x14
	ldrsb r0, [r7, r0]
	adds r5, r7, #0
	cmp r1, r0
	ble _08017CA4
	strb r2, [r4, #0x14]
_08017CA4:
	movs r1, #0x15
	ldrsb r1, [r4, r1]
	ldrb r2, [r5, #0x15]
	movs r0, #0x15
	ldrsb r0, [r5, r0]
	cmp r1, r0
	ble _08017CB4
	strb r2, [r4, #0x15]
_08017CB4:
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	ldrb r2, [r5, #0x16]
	movs r0, #0x16
	ldrsb r0, [r5, r0]
	cmp r1, r0
	ble _08017CC4
	strb r2, [r4, #0x16]
_08017CC4:
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	ldrb r2, [r5, #0x17]
	movs r0, #0x17
	ldrsb r0, [r5, r0]
	cmp r1, r0
	ble _08017CD4
	strb r2, [r4, #0x17]
_08017CD4:
	movs r1, #0x18
	ldrsb r1, [r4, r1]
	ldrb r2, [r5, #0x18]
	movs r0, #0x18
	ldrsb r0, [r5, r0]
	cmp r1, r0
	ble _08017CE4
	strb r2, [r4, #0x18]
_08017CE4:
	movs r0, #0x19
	ldrsb r0, [r4, r0]
	cmp r0, #0x1e
	ble _08017CF0
	movs r0, #0x1e
	strb r0, [r4, #0x19]
_08017CF0:
	movs r3, #0x1a
	ldrsb r3, [r4, r3]
	movs r2, #0x19
	ldrsb r2, [r5, r2]
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	ldr r6, [r4]
	movs r1, #0x13
	ldrsb r1, [r6, r1]
	adds r0, r0, r1
	subs r2, r2, r0
	cmp r3, r2
	ble _08017D16
	ldrb r2, [r5, #0x11]
	ldrb r6, [r6, #0x13]
	adds r0, r2, r6
	ldrb r5, [r5, #0x19]
	subs r0, r5, r0
	strb r0, [r4, #0x1a]
_08017D16:
	movs r2, #0x1d
	ldrsb r2, [r4, r2]
	movs r1, #0x12
	ldrsb r1, [r7, r1]
	movs r0, #0xf
	subs r0, r0, r1
	cmp r2, r0
	ble _08017D2E
	movs r0, #0xf
	ldrb r7, [r7, #0x12]
	subs r0, r0, r7
	strb r0, [r4, #0x1d]
_08017D2E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
