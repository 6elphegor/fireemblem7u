	.include "macro.inc"

	.syntax unified

	thumb_func_start LoadSavedUnit
LoadSavedUnit: @ 0x080A0E9C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x24
	adds r4, r1, #0
	ldr r1, _080A10D0 @ =0x03005E70
	ldr r3, [r1]
	mov r1, sp
	movs r2, #0x24
	bl _call_via_r3
	mov r0, sp
	ldrb r0, [r0, #0x14]
	bl GetCharacterData
	str r0, [r4]
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	bl GetClassData
	str r0, [r4, #4]
	mov r0, sp
	ldrh r0, [r0]
	lsls r0, r0, #0x14
	lsrs r0, r0, #0x1b
	strb r0, [r4, #8]
	ldr r0, [sp]
	lsls r0, r0, #0xd
	lsrs r3, r0, #0x19
	strb r3, [r4, #9]
	mov r0, sp
	ldrh r0, [r0, #2]
	lsls r0, r0, #0x17
	lsrs r0, r0, #0x1a
	strb r0, [r4, #0x10]
	mov r0, sp
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1a
	strb r0, [r4, #0x11]
	ldr r0, [sp, #4]
	lsls r0, r0, #0xe
	lsrs r0, r0, #0x1a
	strb r0, [r4, #0x12]
	mov r0, sp
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1b
	strb r0, [r4, #0x14]
	mov r0, sp
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x14
	lsrs r0, r0, #0x1b
	strb r0, [r4, #0x15]
	mov r1, sp
	ldrb r0, [r1, #7]
	lsrs r2, r0, #4
	movs r5, #1
	adds r0, r5, #0
	ldrb r1, [r1, #8]
	ands r0, r1
	lsls r0, r0, #4
	orrs r0, r2
	strb r0, [r4, #0x16]
	mov r0, sp
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	strb r0, [r4, #0x17]
	mov r0, sp
	ldrh r0, [r0, #8]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x1b
	strb r0, [r4, #0x18]
	mov r0, sp
	ldrb r0, [r0, #9]
	lsrs r0, r0, #3
	strb r0, [r4, #0x19]
	mov r0, sp
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1b
	strb r0, [r4, #0x1a]
	mov r0, sp
	ldrh r0, [r0, #0xa]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x1b
	strb r0, [r4, #0x1d]
	mov r0, sp
	ldrb r2, [r0, #0xb]
	lsrs r1, r2, #2
	ldrb r0, [r0, #0xc]
	lsls r0, r0, #6
	orrs r0, r1
	strh r0, [r4, #0x1e]
	ldr r0, [sp, #0xc]
	lsls r0, r0, #0xa
	lsrs r0, r0, #0x12
	strh r0, [r4, #0x20]
	mov r1, sp
	ldrh r0, [r1, #0xe]
	lsrs r2, r0, #6
	movs r0, #0xf
	ldrb r1, [r1, #0x10]
	ands r0, r1
	lsls r0, r0, #0xa
	orrs r0, r2
	strh r0, [r4, #0x22]
	ldr r0, [sp, #0x10]
	lsls r0, r0, #0xe
	lsrs r0, r0, #0x12
	strh r0, [r4, #0x24]
	mov r0, sp
	ldrh r0, [r0, #0x12]
	lsrs r0, r0, #2
	strh r0, [r4, #0x26]
	cmp r3, #0x63
	bls _080A0F90
	movs r0, #0xff
	strb r0, [r4, #9]
_080A0F90:
	movs r0, #0
	str r0, [r4, #0xc]
	mov r2, sp
	ldrb r1, [r2, #3]
	lsrs r1, r1, #7
	ldr r3, _080A10D4 @ =0x00000FFF
	adds r0, r3, #0
	ldrh r2, [r2, #4]
	ands r0, r2
	lsls r0, r0, #1
	orrs r0, r1
	ands r0, r5
	cmp r0, #0
	beq _080A0FB0
	movs r0, #5
	str r0, [r4, #0xc]
_080A0FB0:
	mov r0, sp
	adds r1, r3, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	beq _080A0FCA
	ldr r0, [r4, #0xc]
	movs r1, #9
	orrs r0, r1
	str r0, [r4, #0xc]
_080A0FCA:
	mov r0, sp
	adds r1, r3, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	movs r0, #4
	ands r1, r0
	cmp r1, #0
	beq _080A0FE6
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #7
	orrs r0, r1
	str r0, [r4, #0xc]
_080A0FE6:
	mov r0, sp
	adds r1, r3, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq _080A1002
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #8
	orrs r0, r1
	str r0, [r4, #0xc]
_080A1002:
	mov r0, sp
	adds r1, r3, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	movs r0, #0x10
	ands r1, r0
	cmp r1, #0
	beq _080A101E
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r4, #0xc]
_080A101E:
	mov r0, sp
	adds r1, r3, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	movs r0, #0x20
	ands r1, r0
	cmp r1, #0
	beq _080A103A
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #9
	orrs r0, r1
	str r0, [r4, #0xc]
_080A103A:
	mov r0, sp
	adds r1, r3, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	movs r0, #0x40
	ands r1, r0
	cmp r1, #0
	beq _080A1056
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0x12
	orrs r0, r1
	str r0, [r4, #0xc]
_080A1056:
	movs r2, #0
	adds r6, r4, #0
	adds r6, #0x32
	mov r7, sp
	adds r7, #0x1d
	movs r1, #0x39
	adds r1, r1, r4
	mov r8, r1
	adds r5, r4, #0
	adds r5, #0x28
	mov r3, sp
	adds r3, #0x15
_080A106E:
	adds r0, r5, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #7
	ble _080A106E
	movs r2, #0
	adds r5, r6, #0
	adds r3, r7, #0
_080A1082:
	adds r0, r5, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #6
	ble _080A1082
	adds r0, r4, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r4, #0
	bl SetUnitHp
	movs r0, #0
	mov r2, r8
	strb r0, [r2]
	ldrb r0, [r4, #9]
	cmp r0, #0x7f
	bne _080A10AE
	movs r0, #0xff
	strb r0, [r4, #9]
_080A10AE:
	ldrb r0, [r4, #0x10]
	cmp r0, #0x3f
	bne _080A10B8
	movs r0, #0xff
	strb r0, [r4, #0x10]
_080A10B8:
	ldrb r0, [r4, #0x11]
	cmp r0, #0x3f
	bne _080A10C2
	movs r0, #0xff
	strb r0, [r4, #0x11]
_080A10C2:
	add sp, #0x24
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A10D0: .4byte 0x03005E70
_080A10D4: .4byte 0x00000FFF
