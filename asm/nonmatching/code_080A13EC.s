	.include "macro.inc"

	.syntax unified

	thumb_func_start EncodeSuspendSavePackedUnit
EncodeSuspendSavePackedUnit: @ 0x080A13EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	adds r6, r0, #0
	mov ip, r1
	ldr r0, [r6]
	cmp r0, #0
	bne _080A1406
	strb r0, [r1]
	b _080A1690
_080A1406:
	ldrb r0, [r0, #4]
	mov r1, ip
	strb r0, [r1]
	ldr r0, [r6, #4]
	ldrb r0, [r0, #4]
	strb r0, [r1, #1]
	movs r1, #8
	ldrsb r1, [r6, r1]
	mov r2, ip
	adds r2, #0x24
	movs r4, #0x1f
	ands r1, r4
	movs r3, #0x20
	rsbs r3, r3, #0
	adds r0, r3, #0
	ldrb r5, [r2]
	ands r0, r5
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r6, #9]
	mov r7, ip
	strb r0, [r7, #0x10]
	ldr r0, [r6, #0xc]
	str r0, [r7, #4]
	movs r1, #0x10
	ldrsb r1, [r6, r1]
	movs r0, #0x3f
	ands r1, r0
	lsls r1, r1, #5
	ldr r0, _080A16A0 @ =0xFFFFF81F
	ldrh r2, [r7, #0x24]
	ands r0, r2
	orrs r0, r1
	strh r0, [r7, #0x24]
	movs r1, #0x3f
	ldrb r5, [r6, #0x11]
	ands r1, r5
	lsls r1, r1, #0xb
	ldr r0, [r7, #0x24]
	ldr r2, _080A16A4 @ =0xFFFE07FF
	ands r0, r2
	orrs r0, r1
	str r0, [r7, #0x24]
	ldrb r0, [r6, #0x12]
	strb r0, [r7, #0xe]
	ldrb r0, [r6, #0x13]
	strb r0, [r7, #0xf]
	movs r1, #0x14
	ldrsb r1, [r6, r1]
	mov r2, ip
	adds r2, #0x26
	ands r1, r4
	lsls r1, r1, #1
	movs r0, #0x3f
	rsbs r0, r0, #0
	ldrb r7, [r2]
	ands r0, r7
	orrs r0, r1
	strb r0, [r2]
	movs r1, #0x15
	ldrsb r1, [r6, r1]
	movs r2, #0x1f
	ands r1, r2
	lsls r1, r1, #6
	ldr r0, _080A16A8 @ =0xFFFFF83F
	mov r5, ip
	ldrh r5, [r5, #0x26]
	ands r0, r5
	orrs r0, r1
	mov r7, ip
	strh r0, [r7, #0x26]
	movs r1, #0x16
	ldrsb r1, [r6, r1]
	movs r0, #0x27
	add r0, ip
	mov r8, r0
	lsls r1, r1, #3
	movs r5, #7
	mov sb, r5
	movs r0, #7
	mov r7, r8
	ldrb r7, [r7]
	ands r0, r7
	orrs r0, r1
	mov r1, r8
	strb r0, [r1]
	movs r0, #0x17
	ldrsb r0, [r6, r0]
	mov r1, ip
	adds r1, #0x28
	ands r0, r4
	ldrb r5, [r1]
	ands r3, r5
	orrs r3, r0
	strb r3, [r1]
	movs r1, #0x18
	ldrsb r1, [r6, r1]
	ands r1, r2
	lsls r1, r1, #5
	ldr r0, _080A16AC @ =0xFFFFFC1F
	mov r7, ip
	ldrh r7, [r7, #0x28]
	ands r0, r7
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x28]
	movs r1, #0x19
	ldrsb r1, [r6, r1]
	mov r2, ip
	adds r2, #0x29
	ands r1, r4
	lsls r1, r1, #2
	movs r0, #0x7d
	rsbs r0, r0, #0
	ldrb r3, [r2]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	movs r2, #0x1a
	ldrsb r2, [r6, r2]
	movs r3, #0x1f
	ands r2, r3
	lsls r2, r2, #0xf
	mov r4, ip
	ldr r0, [r4, #0x28]
	ldr r1, _080A16B0 @ =0xFFF07FFF
	ands r0, r1
	orrs r0, r2
	str r0, [r4, #0x28]
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r2, [r0]
	lsls r1, r2, #0x1c
	lsrs r1, r1, #0x1c
	adds r4, #0x2a
	mov r5, sb
	ands r1, r5
	lsls r1, r1, #4
	movs r0, #0x71
	rsbs r0, r0, #0
	ldrb r7, [r4]
	ands r0, r7
	orrs r0, r1
	strb r0, [r4]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x1c
	movs r0, #7
	ands r2, r0
	lsls r2, r2, #7
	ldr r0, _080A16B4 @ =0xFFFFFC7F
	mov r1, ip
	ldrh r1, [r1, #0x2a]
	ands r0, r1
	orrs r0, r2
	mov r2, ip
	strh r0, [r2, #0x2a]
	adds r0, r6, #0
	adds r0, #0x31
	ldrb r2, [r0]
	lsls r1, r2, #0x1c
	lsrs r1, r1, #0x1c
	adds r4, #1
	ands r1, r5
	lsls r1, r1, #2
	movs r0, #0x1d
	rsbs r0, r0, #0
	ldrb r5, [r4]
	ands r0, r5
	orrs r0, r1
	lsrs r2, r2, #4
	lsls r2, r2, #5
	ands r0, r3
	orrs r0, r2
	strb r0, [r4]
	ldrb r0, [r6, #0x1b]
	mov r7, ip
	strb r0, [r7, #3]
	movs r1, #0x1d
	ldrsb r1, [r6, r1]
	mov r2, ip
	adds r2, #0x2c
	movs r0, #0xf
	ands r1, r0
	movs r0, #0x10
	rsbs r0, r0, #0
	ldrb r3, [r2]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	movs r1, #0x7f
	ldrb r4, [r6, #0x1c]
	ands r1, r4
	adds r0, r6, #0
	adds r0, #0x39
	ldrb r3, [r0]
	movs r0, #1
	ands r0, r3
	lsls r0, r0, #7
	orrs r1, r0
	mov r0, ip
	adds r0, #0x30
	strb r1, [r0]
	ldr r2, _080A16B8 @ =0x00003FFF
	adds r1, r2, #0
	ldrh r5, [r6, #0x1e]
	ands r1, r5
	movs r0, #6
	ands r0, r3
	lsls r0, r0, #0xd
	orrs r1, r0
	strh r1, [r7, #8]
	adds r1, r2, #0
	ldrh r7, [r6, #0x20]
	ands r1, r7
	movs r0, #0x18
	ands r0, r3
	lsls r0, r0, #0xb
	orrs r1, r0
	mov r0, ip
	strh r1, [r0, #0xa]
	adds r1, r2, #0
	ldrh r4, [r6, #0x22]
	ands r1, r4
	movs r0, #0x60
	ands r0, r3
	lsls r0, r0, #9
	orrs r1, r0
	mov r5, ip
	strh r1, [r5, #0xc]
	ldrh r7, [r6, #0x24]
	ands r2, r7
	lsls r2, r2, #4
	ldr r0, [r5, #0x2c]
	ldr r1, _080A16BC @ =0xFFFC000F
	ands r0, r1
	orrs r0, r2
	str r0, [r5, #0x2c]
	ldrh r0, [r6, #0x26]
	lsls r1, r0, #2
	movs r0, #3
	ldrh r2, [r5, #0x2e]
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, #0x2e]
	movs r2, #0
	adds r5, #0x1a
	adds r7, r6, #0
	adds r7, #0x32
	movs r3, #0x42
	adds r3, r3, r6
	mov r8, r3
	adds r4, r6, #0
	adds r4, #0x43
	str r4, [sp, #0xc]
	movs r0, #0x21
	add r0, ip
	mov sb, r0
	adds r1, r6, #0
	adds r1, #0x44
	str r1, [sp, #0x10]
	movs r3, #0x22
	add r3, ip
	mov sl, r3
	adds r4, #2
	str r4, [sp, #0x14]
	mov r0, ip
	adds r0, #0x23
	str r0, [sp]
	subs r1, #4
	str r1, [sp, #8]
	adds r3, r6, #0
	adds r3, #0x46
	str r3, [sp, #0x18]
	mov r4, ip
	adds r4, #0x31
	str r4, [sp, #4]
	ldrb r1, [r6, #0xa]
	mov r0, sp
	strb r1, [r0, #0x1c]
	subs r4, #0x1f
	subs r3, #0x1e
_080A1638:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #7
	ble _080A1638
	movs r2, #0
	adds r4, r5, #0
	adds r3, r7, #0
_080A164C:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #6
	ble _080A164C
	mov r2, r8
	ldrb r0, [r2]
	mov r3, ip
	strb r0, [r3, #2]
	ldr r4, [sp, #0xc]
	ldrb r0, [r4]
	mov r5, sb
	strb r0, [r5]
	ldr r7, [sp, #0x10]
	ldrb r0, [r7]
	mov r1, sl
	strb r0, [r1]
	ldr r2, [sp, #0x14]
	ldrb r0, [r2]
	ldr r3, [sp]
	strb r0, [r3]
	ldr r4, [sp, #8]
	ldrh r0, [r4]
	mov r5, ip
	strh r0, [r5, #0x32]
	ldr r7, [sp, #0x18]
	ldrb r0, [r7]
	ldr r1, [sp, #4]
	strb r0, [r1]
	mov r2, sp
	ldrb r2, [r2, #0x1c]
	strb r2, [r5, #0x11]
_080A1690:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A16A0: .4byte 0xFFFFF81F
_080A16A4: .4byte 0xFFFE07FF
_080A16A8: .4byte 0xFFFFF83F
_080A16AC: .4byte 0xFFFFFC1F
_080A16B0: .4byte 0xFFF07FFF
_080A16B4: .4byte 0xFFFFFC7F
_080A16B8: .4byte 0x00003FFF
_080A16BC: .4byte 0xFFFC000F
