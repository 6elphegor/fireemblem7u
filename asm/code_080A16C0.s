	.include "macro.inc"

	.syntax unified

	thumb_func_start ReadSuspendSavePackedUnit
ReadSuspendSavePackedUnit: @ 0x080A16C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x48
	adds r6, r1, #0
	ldr r1, _080A18D0 @ =0x03005E70
	ldr r3, [r1]
	mov r1, sp
	movs r2, #0x34
	bl _call_via_r3
	mov r0, sp
	ldrb r0, [r0]
	bl GetCharacterData
	str r0, [r6]
	mov r0, sp
	ldrb r0, [r0, #1]
	bl GetClassData
	str r0, [r6, #4]
	add r0, sp, #0x24
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1b
	strb r0, [r6, #8]
	mov r0, sp
	ldrb r0, [r0, #0x10]
	strb r0, [r6, #9]
	ldr r0, [sp, #4]
	str r0, [r6, #0xc]
	mov r0, sp
	ldrh r0, [r0, #0x24]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x1a
	strb r0, [r6, #0x10]
	ldr r0, [sp, #0x24]
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x1a
	strb r0, [r6, #0x11]
	mov r0, sp
	ldrb r0, [r0, #0xe]
	strb r0, [r6, #0x12]
	mov r0, sp
	ldrb r0, [r0, #0xf]
	strb r0, [r6, #0x13]
	mov r0, sp
	adds r0, #0x26
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	strb r0, [r6, #0x14]
	mov r0, sp
	ldrh r0, [r0, #0x26]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x1b
	strb r0, [r6, #0x15]
	mov r0, sp
	adds r0, #0x27
	ldrb r0, [r0]
	lsrs r0, r0, #3
	strb r0, [r6, #0x16]
	add r0, sp, #0x28
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1b
	strb r0, [r6, #0x17]
	mov r0, sp
	ldrh r0, [r0, #0x28]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x1b
	strb r0, [r6, #0x18]
	mov r0, sp
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1b
	strb r0, [r6, #0x19]
	ldr r0, [sp, #0x28]
	lsls r0, r0, #0xc
	lsrs r0, r0, #0x1b
	strb r0, [r6, #0x1a]
	mov r0, sp
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r1, r0, #0x19
	adds r2, r6, #0
	adds r2, #0x30
	mov r0, sp
	ldrh r0, [r0, #0x2a]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x1d
	lsls r0, r0, #4
	lsrs r1, r1, #0x1d
	orrs r1, r0
	strb r1, [r2]
	mov r0, sp
	adds r0, #0x2b
	ldrb r0, [r0]
	lsls r1, r0, #0x1b
	adds r2, #1
	lsrs r0, r0, #5
	lsls r0, r0, #4
	lsrs r1, r1, #0x1d
	orrs r1, r0
	strb r1, [r2]
	mov r0, sp
	ldrb r0, [r0, #3]
	strb r0, [r6, #0x1b]
	add r0, sp, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	strb r0, [r6, #0x1d]
	add r0, sp, #0x30
	ldrb r2, [r0]
	movs r0, #0x7f
	ands r0, r2
	strb r0, [r6, #0x1c]
	mov r0, sp
	ldrh r5, [r0, #8]
	ldr r1, _080A18D4 @ =0x00003FFF
	adds r0, r1, #0
	ands r0, r5
	strh r0, [r6, #0x1e]
	mov r0, sp
	ldrh r4, [r0, #0xa]
	adds r0, r1, #0
	ands r0, r4
	strh r0, [r6, #0x20]
	mov r0, sp
	ldrh r3, [r0, #0xc]
	ands r1, r3
	strh r1, [r6, #0x22]
	ldr r0, [sp, #0x2c]
	lsls r0, r0, #0xe
	lsrs r0, r0, #0x12
	strh r0, [r6, #0x24]
	mov r0, sp
	ldrh r1, [r0, #0x2e]
	lsrs r0, r1, #2
	strh r0, [r6, #0x26]
	movs r1, #0x80
	ands r1, r2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1f
	movs r2, #0xc0
	lsls r2, r2, #8
	adds r0, r2, #0
	ands r0, r5
	lsrs r0, r0, #0xd
	orrs r0, r1
	adds r1, r2, #0
	ands r1, r4
	lsrs r1, r1, #0xb
	orrs r1, r0
	ands r2, r3
	lsrs r2, r2, #9
	orrs r2, r1
	adds r0, r6, #0
	adds r0, #0x39
	strb r2, [r0]
	movs r2, #0
	movs r0, #0x1a
	add r0, sp
	mov sl, r0
	mov r1, sp
	adds r1, #0x21
	str r1, [sp, #0x34]
	mov r0, sp
	adds r0, #0x22
	str r0, [sp, #0x38]
	adds r1, #2
	str r1, [sp, #0x3c]
	adds r0, #0xf
	str r0, [sp, #0x40]
	adds r4, r6, #0
	adds r4, #0x28
	mov r3, sp
	adds r3, #0x12
_080A182C:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #7
	ble _080A182C
	movs r2, #0
	adds r5, r6, #0
	adds r5, #0x42
	movs r1, #0x43
	adds r1, r1, r6
	mov ip, r1
	adds r7, r6, #0
	adds r7, #0x44
	movs r0, #0x45
	adds r0, r0, r6
	mov r8, r0
	movs r1, #0x40
	adds r1, r1, r6
	mov sb, r1
	adds r0, r6, #0
	adds r0, #0x46
	str r0, [sp, #0x44]
	adds r4, r6, #0
	adds r4, #0x32
	mov r3, sl
_080A1862:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #6
	ble _080A1862
	mov r0, sp
	ldrb r0, [r0, #2]
	strb r0, [r5]
	ldr r1, [sp, #0x34]
	ldrb r0, [r1]
	mov r1, ip
	strb r0, [r1]
	ldr r1, [sp, #0x38]
	ldrb r0, [r1]
	strb r0, [r7]
	ldr r1, [sp, #0x3c]
	ldrb r0, [r1]
	mov r1, r8
	strb r0, [r1]
	mov r0, sp
	ldrh r0, [r0, #0x32]
	mov r1, sb
	strh r0, [r1]
	ldr r1, [sp, #0x40]
	ldrb r0, [r1]
	ldr r1, [sp, #0x44]
	strb r0, [r1]
	mov r0, sp
	ldrb r0, [r0, #0x11]
	strb r0, [r6, #0xa]
	ldrb r0, [r6, #9]
	cmp r0, #0x7f
	bne _080A18AC
	movs r0, #0xff
	strb r0, [r6, #9]
_080A18AC:
	ldrb r0, [r6, #0x10]
	cmp r0, #0x3f
	bne _080A18B6
	movs r0, #0xff
	strb r0, [r6, #0x10]
_080A18B6:
	ldrb r0, [r6, #0x11]
	cmp r0, #0x3f
	bne _080A18C0
	movs r0, #0xff
	strb r0, [r6, #0x11]
_080A18C0:
	add sp, #0x48
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A18D0: .4byte 0x03005E70
_080A18D4: .4byte 0x00003FFF
