	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08089E70
sub_08089E70: @ 0x08089E70
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r2, _08089E98 @ =0x08B857F8
	ldr r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r1, #4]
	ands r0, r1
	mov ip, r2
	cmp r0, #0
	beq _08089E9C
	adds r1, r5, #0
	adds r1, #0x31
	movs r0, #2
	b _08089EA2
	.align 2, 0
_08089E98: .4byte 0x08B857F8
_08089E9C:
	adds r1, r5, #0
	adds r1, #0x31
	movs r0, #1
_08089EA2:
	strb r0, [r1]
	mov r8, r1
	mov r0, ip
	ldr r3, [r0]
	ldrh r4, [r3, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r4
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #0
	beq _08089EC4
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b _0808A206
_08089EC4:
	movs r1, #1
	mov sb, r1
	mov r6, sb
	ands r6, r4
	cmp r6, #0
	beq _08089F34
	adds r0, r5, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	beq _08089EEC
	cmp r0, #1
	bgt _08089EE4
	cmp r0, #0
	beq _08089EF4
	b _0808A206
_08089EE4:
	cmp r0, #3
	bne _08089EEA
	b _08089FEA
_08089EEA:
	b _0808A206
_08089EEC:
	adds r0, r5, #0
	bl sub_08089D50
	b _0808A206
_08089EF4:
	ldr r1, _08089F28 @ =0x0200CBF0
	adds r0, r5, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl SetStatScreenLastUnitId
	ldr r0, _08089F2C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08089F20
	ldr r0, _08089F30 @ =0x0000038A
	bl m4aSongNumStart
_08089F20:
	adds r0, r5, #0
	bl Proc_Break
	b _0808A206
	.align 2, 0
_08089F28: .4byte 0x0200CBF0
_08089F2C: .4byte 0x0202BBF8
_08089F30: .4byte 0x0000038A
_08089F34:
	ldrh r1, [r3, #6]
	movs r2, #0x20
	adds r0, r2, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #0
	beq _08089FCC
	adds r0, r5, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #3
	bne _08089F88
	adds r0, r2, #0
	ands r0, r4
	cmp r0, #0
	bne _08089F58
	b _0808A206
_08089F58:
	ldr r1, _08089F80 @ =0x0200CBF0
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r3, [r4]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_08089DD4
	ldrb r1, [r4]
	ldr r2, _08089F84 @ =0x02022C60
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r3, [r0]
	str r6, [sp]
	b _0808A00C
	.align 2, 0
_08089F80: .4byte 0x0200CBF0
_08089F84: .4byte 0x02022C60
_08089F88:
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #1
	bhi _08089F94
	b _0808A206
_08089F94:
	adds r1, r5, #0
	adds r1, #0x36
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
	adds r0, r5, #0
	adds r0, #0x2d
	strb r6, [r0]
	ldr r0, _08089FC4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _08089FBA
	b _0808A206
_08089FBA:
	ldr r0, _08089FC8 @ =0x0000038F
	bl m4aSongNumStart
	b _0808A206
	.align 2, 0
_08089FC4: .4byte 0x0202BBF8
_08089FC8: .4byte 0x0000038F
_08089FCC:
	movs r6, #0x10
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0808A064
	adds r0, r5, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #3
	bne _0808A01C
	adds r0, r6, #0
	ands r0, r4
	cmp r0, #0
	bne _08089FEA
	b _0808A206
_08089FEA:
	ldr r1, _0808A014 @ =0x0200CBF0
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r2, [r4]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	movs r1, #1
	bl sub_08089DD4
	ldrb r1, [r4]
	ldr r2, _0808A018 @ =0x02022C60
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r3, [r0]
	str r7, [sp]
_0808A00C:
	adds r0, r5, #0
	bl sub_0808AD00
	b _0808A206
	.align 2, 0
_0808A014: .4byte 0x0200CBF0
_0808A018: .4byte 0x02022C60
_0808A01C:
	adds r0, r5, #0
	adds r0, #0x2f
	adds r1, r5, #0
	adds r1, #0x2e
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	blo _0808A02E
	b _0808A206
_0808A02E:
	adds r1, r5, #0
	adds r1, #0x36
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x2d
	strb r7, [r0]
	ldr r0, _0808A05C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808A050
	ldr r0, _0808A060 @ =0x0000038F
	bl m4aSongNumStart
_0808A050:
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
	b _0808A206
	.align 2, 0
_0808A05C: .4byte 0x0202BBF8
_0808A060: .4byte 0x0000038F
_0808A064:
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	bne _0808A084
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r3, #4]
	ands r0, r1
	cmp r0, #0
	beq _0808A14E
	adds r0, r7, #0
	ldrh r3, [r3, #0x10]
	ands r0, r3
	cmp r0, #0
	beq _0808A14E
_0808A084:
	adds r6, r5, #0
	adds r6, #0x30
	ldrb r0, [r6]
	cmp r0, #0
	bne _0808A0BC
	adds r0, r7, #0
	ands r0, r4
	cmp r0, #0
	bne _0808A098
	b _0808A206
_0808A098:
	ldr r0, _0808A0B4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808A0AA
	ldr r0, _0808A0B8 @ =0x00000386
	bl m4aSongNumStart
_0808A0AA:
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #3
	strb r0, [r1]
	b _0808A206
	.align 2, 0
_0808A0B4: .4byte 0x0202BBF8
_0808A0B8: .4byte 0x00000386
_0808A0BC:
	subs r0, #1
	strb r0, [r6]
	ldr r0, _0808A13C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808A0D2
	ldr r0, _0808A140 @ =0x00000386
	bl m4aSongNumStart
_0808A0D2:
	adds r0, r5, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	adds r4, r0, #0
	cmp r1, #1
	bhi _0808A148
	ldrh r2, [r5, #0x3e]
	lsrs r0, r2, #4
	cmp r0, #0
	beq _0808A148
	cmp r1, #0
	bne _0808A0F4
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	movs r0, #1
	strb r0, [r4]
_0808A0F4:
	ldrh r3, [r5, #0x3e]
	lsrs r1, r3, #4
	subs r1, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _0808A144 @ =0x02022C60
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r3, [r0]
	mov r0, sb
	str r0, [sp]
	adds r0, r5, #0
	bl sub_0808AD00
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #2
	strb r0, [r1]
	mov r1, r8
	ldrb r1, [r1]
	lsls r2, r1, #2
	ldrh r3, [r5, #0x3e]
	subs r2, r3, r2
	strh r2, [r5, #0x3e]
	subs r2, #0x38
	movs r0, #0xff
	ands r2, r0
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	ldrb r0, [r4]
	cmp r0, #0
	bne _0808A206
	b _0808A202
	.align 2, 0
_0808A13C: .4byte 0x0202BBF8
_0808A140: .4byte 0x00000386
_0808A144: .4byte 0x02022C60
_0808A148:
	ldrb r0, [r4]
	subs r0, #1
	b _0808A204
_0808A14E:
	mov r0, ip
	ldr r2, [r0]
	movs r1, #0x80
	adds r0, r1, #0
	ldrh r3, [r2, #6]
	ands r0, r3
	cmp r0, #0
	bne _0808A174
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r3, [r2, #4]
	ands r0, r3
	cmp r0, #0
	beq _0808A206
	adds r0, r1, #0
	ldrh r2, [r2, #0x10]
	ands r0, r2
	cmp r0, #0
	beq _0808A206
_0808A174:
	adds r6, r5, #0
	adds r6, #0x30
	ldrb r1, [r6]
	ldr r7, _0808A1F0 @ =0x0200E668
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	bge _0808A206
	adds r0, r1, #1
	strb r0, [r6]
	ldr r0, _0808A1F4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808A19A
	ldr r0, _0808A1F8 @ =0x00000386
	bl m4aSongNumStart
_0808A19A:
	adds r0, r5, #0
	adds r0, #0x2c
	adds r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #4
	bne _0808A200
	ldrb r1, [r6]
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	beq _0808A200
	ldrh r2, [r5, #0x3e]
	lsrs r1, r2, #4
	adds r1, #6
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _0808A1FC @ =0x02022C60
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r3, [r0]
	movs r4, #1
	str r4, [sp]
	adds r0, r5, #0
	bl sub_0808AD00
	adds r0, r5, #0
	adds r0, #0x29
	strb r4, [r0]
	mov r3, r8
	ldrb r3, [r3]
	lsls r2, r3, #2
	ldrh r0, [r5, #0x3e]
	adds r2, r0, r2
	strh r2, [r5, #0x3e]
	subs r2, #0x38
	movs r0, #0xff
	ands r2, r0
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	b _0808A206
	.align 2, 0
_0808A1F0: .4byte 0x0200E668
_0808A1F4: .4byte 0x0202BBF8
_0808A1F8: .4byte 0x00000386
_0808A1FC: .4byte 0x02022C60
_0808A200:
	ldrb r0, [r4]
_0808A202:
	adds r0, #1
_0808A204:
	strb r0, [r4]
_0808A206:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
