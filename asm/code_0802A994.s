	.include "macro.inc"

	.syntax unified

	thumb_func_start UnitLevelUp
UnitLevelUp: @ 0x0802A994
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #0x14
	bne _0802A9AA
	b _0802AB7E
_0802A9AA:
	movs r0, #0
	strb r0, [r4, #9]
	adds r0, r1, #1
	strb r0, [r4, #8]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r2, [r4]
	cmp r0, #0x14
	beq _0802A9C2
	ldrb r0, [r2, #4]
	cmp r0, #0x28
	bne _0802A9C6
_0802A9C2:
	movs r0, #0xff
	strb r0, [r4, #9]
_0802A9C6:
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #6
	ands r0, r1
	movs r6, #0
	cmp r0, #0
	beq _0802A9D6
	movs r6, #5
_0802A9D6:
	ldrb r2, [r2, #0x1c]
	adds r0, r2, r6
	bl GetStatIncrease
	mov r8, r0
	ldr r0, [r4]
	ldrb r0, [r0, #0x1d]
	adds r0, r0, r6
	bl GetStatIncrease
	str r0, [sp]
	adds r5, r0, #0
	add r5, r8
	ldr r0, [r4]
	ldrb r0, [r0, #0x1e]
	adds r0, r0, r6
	bl GetStatIncrease
	str r0, [sp, #4]
	adds r5, r5, r0
	ldr r0, [r4]
	ldrb r0, [r0, #0x1f]
	adds r0, r0, r6
	bl GetStatIncrease
	mov sl, r0
	add r5, sl
	ldr r0, [r4]
	adds r0, #0x20
	ldrb r0, [r0]
	adds r0, r0, r6
	bl GetStatIncrease
	mov sb, r0
	add r5, sb
	ldr r0, [r4]
	adds r0, #0x21
	ldrb r0, [r0]
	adds r0, r0, r6
	bl GetStatIncrease
	adds r7, r0, #0
	adds r5, r5, r7
	ldr r0, [r4]
	adds r0, #0x22
	ldrb r0, [r0]
	adds r0, r0, r6
	bl GetStatIncrease
	adds r6, r0, #0
	adds r5, r5, r6
	cmp r5, #0
	bne _0802AAB0
	b _0802AA82
_0802AA42:
	ldr r0, [r4]
	ldrb r0, [r0, #0x1f]
	bl GetStatIncrease
	mov sl, r0
	cmp r0, #0
	bne _0802AAB0
	ldr r0, [r4]
	adds r0, #0x20
	ldrb r0, [r0]
	bl GetStatIncrease
	mov sb, r0
	cmp r0, #0
	bne _0802AAB0
	ldr r0, [r4]
	adds r0, #0x21
	ldrb r0, [r0]
	bl GetStatIncrease
	adds r7, r0, #0
	cmp r7, #0
	bne _0802AAB0
	ldr r0, [r4]
	adds r0, #0x22
	ldrb r0, [r0]
	bl GetStatIncrease
	adds r6, r0, #0
	cmp r6, #0
	bne _0802AAB0
	adds r5, #1
_0802AA82:
	cmp r5, #1
	bgt _0802AAB0
	ldr r0, [r4]
	ldrb r0, [r0, #0x1c]
	bl GetStatIncrease
	mov r8, r0
	cmp r0, #0
	bne _0802AAB0
	ldr r0, [r4]
	ldrb r0, [r0, #0x1d]
	bl GetStatIncrease
	str r0, [sp]
	cmp r0, #0
	bne _0802AAB0
	ldr r0, [r4]
	ldrb r0, [r0, #0x1e]
	bl GetStatIncrease
	str r0, [sp, #4]
	cmp r0, #0
	beq _0802AA42
_0802AAB0:
	movs r2, #0x12
	ldrsb r2, [r4, r2]
	mov r1, r8
	adds r3, r2, r1
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0x80
	bne _0802AACA
	cmp r3, #0x78
	bgt _0802AACE
	b _0802AAE0
_0802AACA:
	cmp r3, #0x3c
	ble _0802AAE0
_0802AACE:
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0x80
	bne _0802AADA
	movs r0, #0x78
	b _0802AADC
_0802AADA:
	movs r0, #0x3c
_0802AADC:
	subs r0, r0, r2
	mov r8, r0
_0802AAE0:
	movs r2, #0x14
	ldrsb r2, [r4, r2]
	ldr r1, [sp]
	adds r0, r2, r1
	ldr r3, [r4, #4]
	movs r1, #0x14
	ldrsb r1, [r3, r1]
	cmp r0, r1
	ble _0802AAF6
	subs r1, r1, r2
	str r1, [sp]
_0802AAF6:
	movs r2, #0x15
	ldrsb r2, [r4, r2]
	ldr r1, [sp, #4]
	adds r0, r2, r1
	movs r1, #0x15
	ldrsb r1, [r3, r1]
	cmp r0, r1
	ble _0802AB0A
	subs r1, r1, r2
	str r1, [sp, #4]
_0802AB0A:
	movs r2, #0x16
	ldrsb r2, [r4, r2]
	mov r1, sl
	adds r0, r2, r1
	movs r1, #0x16
	ldrsb r1, [r3, r1]
	cmp r0, r1
	ble _0802AB1E
	subs r1, r1, r2
	mov sl, r1
_0802AB1E:
	movs r2, #0x17
	ldrsb r2, [r4, r2]
	mov r1, sb
	adds r0, r2, r1
	movs r1, #0x17
	ldrsb r1, [r3, r1]
	cmp r0, r1
	ble _0802AB32
	subs r1, r1, r2
	mov sb, r1
_0802AB32:
	movs r2, #0x18
	ldrsb r2, [r4, r2]
	adds r0, r2, r7
	movs r1, #0x18
	ldrsb r1, [r3, r1]
	cmp r0, r1
	ble _0802AB42
	subs r7, r1, r2
_0802AB42:
	movs r1, #0x19
	ldrsb r1, [r4, r1]
	adds r0, r1, r6
	cmp r0, #0x1e
	ble _0802AB50
	movs r0, #0x1e
	subs r6, r0, r1
_0802AB50:
	ldrb r0, [r4, #0x12]
	add r0, r8
	strb r0, [r4, #0x12]
	ldrb r2, [r4, #0x14]
	ldr r1, [sp]
	adds r0, r2, r1
	strb r0, [r4, #0x14]
	ldrb r2, [r4, #0x15]
	ldr r1, [sp, #4]
	adds r0, r2, r1
	strb r0, [r4, #0x15]
	ldrb r0, [r4, #0x16]
	add r0, sl
	strb r0, [r4, #0x16]
	ldrb r0, [r4, #0x17]
	add r0, sb
	strb r0, [r4, #0x17]
	ldrb r2, [r4, #0x18]
	adds r0, r2, r7
	strb r0, [r4, #0x18]
	ldrb r1, [r4, #0x19]
	adds r0, r1, r6
	strb r0, [r4, #0x19]
_0802AB7E:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
