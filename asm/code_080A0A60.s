	.include "macro.inc"

	.syntax unified

	thumb_func_start WriteGameSavePackedUnit
WriteGameSavePackedUnit: @ 0x080A0A60
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x70
	adds r7, r0, #0
	str r1, [sp, #0x6c]
	mov r1, sp
	ldr r0, [r7]
	ldrb r0, [r0, #4]
	strb r0, [r1, #0x14]
	mov r2, sp
	ldr r0, [r7, #4]
	movs r1, #0x7f
	ldrb r0, [r0, #4]
	ands r1, r0
	movs r5, #0x80
	rsbs r5, r5, #0
	adds r0, r5, #0
	ldrb r3, [r2]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldr r4, [r7]
	cmp r4, #0
	bne _080A0AAC
	add r7, sp, #0x24
	adds r0, r7, #0
	bl ClearUnit
	mov r0, sp
	strb r4, [r0, #0x14]
	mov r1, sp
	adds r0, r5, #0
	ldrb r4, [r1]
	ands r0, r4
	strb r0, [r1]
_080A0AAC:
	mov r2, sp
	movs r1, #8
	ldrsb r1, [r7, r1]
	movs r5, #0x1f
	mov r8, r5
	mov r6, r8
	ands r1, r6
	lsls r1, r1, #7
	ldr r3, _080A0E6C @ =0xFFFFF07F
	adds r0, r3, #0
	ldrh r4, [r2]
	ands r0, r4
	orrs r0, r1
	strh r0, [r2]
	movs r5, #0x7f
	mov sb, r5
	mov r1, sb
	ldrb r6, [r7, #9]
	ands r1, r6
	lsls r1, r1, #0xc
	ldr r0, [sp]
	ldr r2, _080A0E70 @ =0xFFF80FFF
	ands r0, r2
	orrs r0, r1
	str r0, [sp]
	mov r4, sp
	movs r1, #0x10
	ldrsb r1, [r7, r1]
	movs r0, #0x3f
	ands r1, r0
	lsls r1, r1, #3
	ldrh r2, [r4, #2]
	ldr r0, _080A0E74 @ =0xFFFFFE07
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #2]
	movs r1, #0x11
	ldrsb r1, [r7, r1]
	movs r0, #0x3f
	ands r1, r0
	lsls r1, r1, #1
	ldrb r2, [r4, #3]
	movs r0, #0x7f
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #3]
	movs r2, #0x12
	ldrsb r2, [r7, r2]
	movs r5, #0x3f
	ands r2, r5
	lsls r2, r2, #0xc
	ldr r0, [sp, #4]
	ldr r1, _080A0E78 @ =0xFFFC0FFF
	ands r0, r1
	orrs r0, r2
	str r0, [sp, #4]
	mov r2, sp
	movs r1, #0x14
	ldrsb r1, [r7, r1]
	movs r4, #0x1f
	ands r1, r4
	lsls r1, r1, #2
	movs r0, #0x7d
	rsbs r0, r0, #0
	ldrb r6, [r2, #6]
	ands r0, r6
	orrs r0, r1
	strb r0, [r2, #6]
	mov r1, sp
	movs r0, #0x15
	ldrsb r0, [r7, r0]
	mov r2, r8
	ands r0, r2
	lsls r0, r0, #7
	ldrh r6, [r1, #6]
	ands r3, r6
	orrs r3, r0
	strh r3, [r1, #6]
	mov r3, sp
	movs r2, #0x16
	ldrsb r2, [r7, r2]
	movs r6, #0xf
	adds r1, r2, #0
	ands r1, r6
	lsls r1, r1, #4
	mov sl, r1
	adds r0, r6, #0
	ldrb r1, [r3, #7]
	ands r0, r1
	mov r1, sl
	orrs r0, r1
	strb r0, [r3, #7]
	lsrs r2, r2, #4
	movs r0, #1
	mov ip, r0
	ands r2, r0
	subs r0, #3
	ldrb r1, [r3, #8]
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, #8]
	movs r1, #0x17
	ldrsb r1, [r7, r1]
	ands r1, r4
	lsls r1, r1, #1
	movs r2, #0x3f
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #8]
	mov r2, sp
	movs r1, #0x18
	ldrsb r1, [r7, r1]
	mov r3, r8
	ands r1, r3
	lsls r1, r1, #6
	ldr r0, _080A0E7C @ =0xFFFFF83F
	ldrh r3, [r2, #8]
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, #8]
	movs r1, #0x19
	ldrsb r1, [r7, r1]
	lsls r1, r1, #3
	movs r0, #7
	ldrb r3, [r2, #9]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #9]
	movs r1, #0x1a
	ldrsb r1, [r7, r1]
	ands r1, r4
	movs r0, #0x20
	rsbs r0, r0, #0
	ldrb r4, [r2, #0xa]
	ands r0, r4
	orrs r0, r1
	strb r0, [r2, #0xa]
	movs r1, #0x1d
	ldrsb r1, [r7, r1]
	mov r0, r8
	ands r1, r0
	lsls r1, r1, #5
	ldr r0, _080A0E80 @ =0xFFFFFC1F
	ldrh r3, [r2, #0xa]
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, #0xa]
	mov r3, sp
	ldrh r2, [r7, #0x1e]
	adds r1, r2, #0
	ands r1, r5
	lsls r1, r1, #2
	mov r8, r1
	movs r4, #3
	adds r0, r4, #0
	ldrb r1, [r3, #0xb]
	ands r0, r1
	mov r1, r8
	orrs r0, r1
	strb r0, [r3, #0xb]
	lsrs r2, r2, #6
	strb r2, [r3, #0xc]
	ldr r3, _080A0E84 @ =0x00003FFF
	adds r1, r3, #0
	ldrh r2, [r7, #0x20]
	ands r1, r2
	lsls r1, r1, #8
	ldr r0, [sp, #0xc]
	ldr r2, _080A0E88 @ =0xFFC000FF
	ands r0, r2
	orrs r0, r1
	str r0, [sp, #0xc]
	mov r2, sp
	ldrh r1, [r7, #0x22]
	ldr r0, _080A0E8C @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #6
	mov r8, r0
	ldrh r0, [r2, #0xe]
	ands r5, r0
	mov r0, r8
	orrs r5, r0
	strh r5, [r2, #0xe]
	lsrs r1, r1, #0xa
	ands r1, r6
	movs r0, #0x10
	rsbs r0, r0, #0
	ldrb r5, [r2, #0x10]
	ands r0, r5
	orrs r0, r1
	strb r0, [r2, #0x10]
	ldrh r6, [r7, #0x24]
	ands r3, r6
	lsls r3, r3, #4
	ldr r0, [sp, #0x10]
	ldr r1, _080A0E90 @ =0xFFFC000F
	ands r0, r1
	orrs r0, r3
	str r0, [sp, #0x10]
	mov r1, sp
	ldrh r2, [r7, #0x26]
	lsls r0, r2, #2
	ldrh r3, [r1, #0x12]
	ands r4, r3
	orrs r4, r0
	strh r4, [r1, #0x12]
	ldrb r0, [r1, #3]
	mov r5, sb
	ands r5, r0
	strb r5, [r1, #3]
	ldr r6, _080A0E94 @ =0xFFFFF000
	adds r0, r6, #0
	ldrh r4, [r1, #4]
	ands r0, r4
	strh r0, [r1, #4]
	ldr r0, [r7, #0xc]
	movs r1, #4
	mov r8, r1
	ands r0, r1
	cmp r0, #0
	beq _080A0C90
	mov r3, sp
	mov r0, sp
	ldr r2, _080A0E98 @ =0x00000FFF
	mov sl, r2
	ldrh r0, [r0, #4]
	ands r2, r0
	mov r4, ip
	lsrs r1, r4, #1
	lsls r0, r4, #7
	orrs r0, r5
	strb r0, [r3, #3]
	orrs r1, r2
	mov r5, sl
	ands r1, r5
	adds r0, r6, #0
	ldrh r2, [r3, #4]
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
_080A0C90:
	ldr r0, [r7, #0xc]
	movs r3, #8
	mov sl, r3
	ands r0, r3
	cmp r0, #0
	beq _080A0CD2
	mov r3, sp
	mov r0, sp
	ldrb r4, [r0, #3]
	lsrs r2, r4, #7
	ldr r5, _080A0E98 @ =0x00000FFF
	adds r1, r5, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	orrs r1, r2
	movs r0, #2
	orrs r1, r0
	adds r2, r1, #0
	mov r0, ip
	ands r2, r0
	lsls r2, r2, #7
	mov r0, sb
	ands r0, r4
	orrs r0, r2
	strb r0, [r3, #3]
	lsrs r1, r1, #1
	ands r1, r5
	adds r0, r6, #0
	ldrh r2, [r3, #4]
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
_080A0CD2:
	ldr r0, [r7, #0xc]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _080A0D14
	mov r3, sp
	mov r0, sp
	ldrb r4, [r0, #3]
	lsrs r2, r4, #7
	ldr r5, _080A0E98 @ =0x00000FFF
	adds r1, r5, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	orrs r1, r2
	mov r0, r8
	orrs r1, r0
	adds r2, r1, #0
	mov r0, ip
	ands r2, r0
	lsls r2, r2, #7
	mov r0, sb
	ands r0, r4
	orrs r0, r2
	strb r0, [r3, #3]
	lsrs r1, r1, #1
	ands r1, r5
	adds r0, r6, #0
	ldrh r2, [r3, #4]
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
_080A0D14:
	ldr r0, [r7, #0xc]
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	beq _080A0D56
	mov r3, sp
	mov r0, sp
	ldrb r4, [r0, #3]
	lsrs r2, r4, #7
	ldr r5, _080A0E98 @ =0x00000FFF
	adds r1, r5, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	orrs r1, r2
	mov r0, sl
	orrs r1, r0
	adds r2, r1, #0
	mov r0, ip
	ands r2, r0
	lsls r2, r2, #7
	mov r0, sb
	ands r0, r4
	orrs r0, r2
	strb r0, [r3, #3]
	lsrs r1, r1, #1
	ands r1, r5
	adds r0, r6, #0
	ldrh r2, [r3, #4]
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
_080A0D56:
	ldr r0, [r7, #0xc]
	movs r1, #0x80
	lsls r1, r1, #6
	ands r0, r1
	cmp r0, #0
	beq _080A0D98
	mov r3, sp
	mov r0, sp
	ldrb r4, [r0, #3]
	lsrs r2, r4, #7
	ldr r5, _080A0E98 @ =0x00000FFF
	adds r1, r5, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	orrs r1, r2
	movs r0, #0x10
	orrs r1, r0
	adds r2, r1, #0
	mov r0, ip
	ands r2, r0
	lsls r2, r2, #7
	mov r0, sb
	ands r0, r4
	orrs r0, r2
	strb r0, [r3, #3]
	lsrs r1, r1, #1
	ands r1, r5
	adds r0, r6, #0
	ldrh r2, [r3, #4]
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
_080A0D98:
	ldr r0, [r7, #0xc]
	movs r1, #0x80
	lsls r1, r1, #9
	ands r0, r1
	cmp r0, #0
	beq _080A0DDA
	mov r3, sp
	mov r0, sp
	ldrb r4, [r0, #3]
	lsrs r2, r4, #7
	ldr r5, _080A0E98 @ =0x00000FFF
	adds r1, r5, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	orrs r1, r2
	movs r0, #0x20
	orrs r1, r0
	adds r2, r1, #0
	mov r0, ip
	ands r2, r0
	lsls r2, r2, #7
	mov r0, sb
	ands r0, r4
	orrs r0, r2
	strb r0, [r3, #3]
	lsrs r1, r1, #1
	ands r1, r5
	adds r0, r6, #0
	ldrh r2, [r3, #4]
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
_080A0DDA:
	ldr r0, [r7, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0x12
	ands r0, r1
	cmp r0, #0
	beq _080A0E1C
	mov r3, sp
	mov r0, sp
	ldrb r4, [r0, #3]
	lsrs r2, r4, #7
	ldr r5, _080A0E98 @ =0x00000FFF
	adds r1, r5, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	orrs r1, r2
	movs r0, #0x40
	orrs r1, r0
	adds r2, r1, #0
	mov r0, ip
	ands r2, r0
	lsls r2, r2, #7
	mov r0, sb
	ands r0, r4
	orrs r0, r2
	strb r0, [r3, #3]
	lsrs r1, r1, #1
	ands r1, r5
	adds r0, r6, #0
	ldrh r2, [r3, #4]
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
_080A0E1C:
	movs r2, #0
	mov r5, sp
	adds r5, #0x1d
	adds r6, r7, #0
	adds r6, #0x32
	mov r4, sp
	adds r4, #0x15
	adds r3, r7, #0
	adds r3, #0x28
_080A0E2E:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #7
	ble _080A0E2E
	movs r2, #0
	adds r4, r5, #0
	adds r3, r6, #0
_080A0E42:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #6
	ble _080A0E42
	mov r0, sp
	ldr r1, [sp, #0x6c]
	movs r2, #0x24
	bl WriteAndVerifySramFast
	add sp, #0x70
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_080A0E6A:
	.byte 0x17, 0xE0
_080A0E6C: .4byte 0xFFFFF07F
_080A0E70: .4byte 0xFFF80FFF
_080A0E74: .4byte 0xFFFFFE07
_080A0E78: .4byte 0xFFFC0FFF
_080A0E7C: .4byte 0xFFFFF83F
_080A0E80: .4byte 0xFFFFFC1F
_080A0E84: .4byte 0x00003FFF
_080A0E88: .4byte 0xFFC000FF
_080A0E8C: .4byte 0x000003FF
_080A0E90: .4byte 0xFFFC000F
_080A0E94: .4byte 0xFFFFF000
_080A0E98: .4byte 0x00000FFF
