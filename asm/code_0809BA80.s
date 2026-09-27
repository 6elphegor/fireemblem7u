	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809BA80
sub_0809BA80: @ 0x0809BA80
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	bl GetSupportScreenUnitCount
	cmp r0, #0
	bne _0809BA96
	b _0809BDB8
_0809BA96:
	adds r0, r6, #0
	adds r0, #0x40
	movs r4, #0
	ldrsb r4, [r0, r4]
	mov r8, r0
	cmp r4, #0
	beq _0809BAA6
	b _0809BD44
_0809BAA6:
	ldr r0, [r6, #0x38]
	mov sl, r0
	ldr r3, _0809BAF0 @ =0x08B857F8
	ldr r1, [r3]
	ldrh r5, [r1, #6]
	adds r2, r6, #0
	adds r2, #0x41
	movs r0, #4
	strb r0, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r7, [r1, #4]
	ands r0, r7
	cmp r0, #0
	beq _0809BACA
	ldrh r5, [r1, #4]
	movs r0, #8
	strb r0, [r2]
_0809BACA:
	adds r0, r6, #0
	adds r0, #0x43
	movs r1, #0
	ldrsb r1, [r0, r1]
	mov sb, r0
	cmp r1, #0
	beq _0809BAF4
	ldr r1, [r3]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0809BBB4
	bl CloseHelpBox
	mov r0, sb
	strb r4, [r0]
	b _0809BDE0
	.align 2, 0
_0809BAF0: .4byte 0x08B857F8
_0809BAF4:
	ldr r0, [r3]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809BB54
	ldr r7, [r6, #0x38]
	adds r0, r7, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r0, #0x14
	mov r8, r0
	adds r0, r7, #0
	movs r1, #3
	bl __divsi3
	adds r1, r0, #0
	ldr r0, [r6, #0x34]
	cmp r0, #0
	bge _0809BB24
	adds r0, #0xf
_0809BB24:
	asrs r4, r0, #4
	subs r4, r1, r4
	lsls r4, r4, #4
	adds r4, #0x4c
	ldr r5, _0809BB50 @ =0x08BDCE4C
	adds r0, r7, #0
	bl GetSupportScreenCharIdAt
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r5
	ldrh r2, [r0, #2]
	mov r0, r8
	adds r1, r4, #0
	bl StartHelpBox
	movs r0, #1
	mov r1, sb
	strb r0, [r1]
	b _0809BDE0
	.align 2, 0
_0809BB50: .4byte 0x08BDCE4C
_0809BB54:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809BB84
	adds r0, r6, #0
	movs r1, #2
	bl Proc_Goto
	ldr r0, _0809BB7C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0809BB72
	b _0809BDE0
_0809BB72:
	ldr r0, _0809BB80 @ =0x0000038A
	bl m4aSongNumStart
	b _0809BDE0
	.align 2, 0
_0809BB7C: .4byte 0x0202BBF8
_0809BB80: .4byte 0x0000038A
_0809BB84:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809BBB4
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Goto
	ldr r0, _0809BBAC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0809BBA2
	b _0809BDE0
_0809BBA2:
	ldr r0, _0809BBB0 @ =0x0000038B
	bl m4aSongNumStart
	b _0809BDE0
	.align 2, 0
_0809BBAC: .4byte 0x0202BBF8
_0809BBB0: .4byte 0x0000038B
_0809BBB4:
	movs r0, #0x20
	ands r0, r5
	cmp r0, #0
	beq _0809BBCE
	ldr r4, [r6, #0x38]
	adds r0, r4, #0
	movs r1, #3
	bl __modsi3
	cmp r0, #0
	beq _0809BBCE
	subs r0, r4, #1
	str r0, [r6, #0x38]
_0809BBCE:
	movs r0, #0x10
	ands r0, r5
	cmp r0, #0
	beq _0809BBFA
	ldr r4, [r6, #0x38]
	adds r0, r4, #0
	movs r1, #3
	bl __modsi3
	cmp r0, #2
	beq _0809BBFA
	adds r0, r4, #1
	str r0, [r6, #0x38]
	bl GetSupportScreenUnitCount
	ldr r1, [r6, #0x38]
	cmp r1, r0
	blt _0809BBFA
	bl GetSupportScreenUnitCount
	subs r0, #1
	str r0, [r6, #0x38]
_0809BBFA:
	movs r0, #0x40
	ands r0, r5
	cmp r0, #0
	beq _0809BC0C
	ldr r0, [r6, #0x38]
	cmp r0, #2
	ble _0809BC0C
	subs r0, #3
	str r0, [r6, #0x38]
_0809BC0C:
	movs r0, #0x80
	ands r5, r0
	cmp r5, #0
	beq _0809BC26
	ldr r4, [r6, #0x38]
	adds r4, #3
	bl GetSupportScreenUnitCount
	cmp r4, r0
	bge _0809BC26
	ldr r0, [r6, #0x38]
	adds r0, #3
	str r0, [r6, #0x38]
_0809BC26:
	ldr r0, [r6, #0x38]
	cmp sl, r0
	bne _0809BC2E
	b _0809BD3A
_0809BC2E:
	movs r1, #3
	bl __divsi3
	adds r1, r0, #0
	ldr r0, [r6, #0x34]
	cmp r0, #0
	bge _0809BC3E
	adds r0, #0xf
_0809BC3E:
	asrs r0, r0, #4
	subs r0, r1, r0
	lsls r4, r0, #4
	movs r0, #0
	mov r7, r8
	strb r0, [r7]
	ldr r0, _0809BC80 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809BC5C
	ldr r0, _0809BC84 @ =0x00000385
	bl m4aSongNumStart
_0809BC5C:
	cmp r4, #0xf
	bgt _0809BC88
	ldr r1, [r6, #0x34]
	cmp r1, #0
	beq _0809BC88
	cmp r1, #0
	bge _0809BC6C
	adds r1, #0xf
_0809BC6C:
	asrs r1, r1, #4
	subs r1, #1
	adds r0, r6, #0
	bl sub_0809BE80
	movs r0, #0xff
	mov r1, r8
	strb r0, [r1]
	b _0809BCB8
	.align 2, 0
_0809BC80: .4byte 0x0202BBF8
_0809BC84: .4byte 0x00000385
_0809BC88:
	cmp r4, #0x2f
	ble _0809BCCA
	bl GetSupportScreenUnitCount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	subs r0, #3
	lsls r0, r0, #4
	ldr r1, [r6, #0x34]
	cmp r1, r0
	beq _0809BCCA
	cmp r1, #0
	bge _0809BCA8
	adds r1, #0xf
_0809BCA8:
	asrs r1, r1, #4
	adds r1, #4
	adds r0, r6, #0
	bl sub_0809BE80
	movs r0, #1
	mov r7, r8
	strb r0, [r7]
_0809BCB8:
	ldr r0, [r6, #0x38]
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r0, #0x14
	bl SetSysHandCursorXPos
	b _0809BCE4
_0809BCCA:
	ldr r0, [r6, #0x38]
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r0, #0x14
	adds r1, r4, #0
	adds r1, #0x4c
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #7
	bl ShowSysHandCursor
_0809BCE4:
	mov r1, sb
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0809BD3A
	ldr r7, [r6, #0x38]
	adds r0, r7, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r0, #0x14
	mov sb, r0
	adds r0, r7, #0
	movs r1, #3
	bl __divsi3
	ldr r4, [r6, #0x34]
	cmp r4, #0
	bge _0809BD0E
	adds r4, #0xf
_0809BD0E:
	asrs r4, r4, #4
	subs r4, r0, r4
	lsls r4, r4, #4
	mov r1, r8
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	subs r0, #0x4c
	subs r4, r4, r0
	ldr r5, _0809BDB0 @ =0x08BDCE4C
	adds r0, r7, #0
	bl GetSupportScreenCharIdAt
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r5
	ldrh r2, [r0, #2]
	mov r0, sb
	adds r1, r4, #0
	bl StartHelpBox
_0809BD3A:
	mov r7, r8
	movs r0, #0
	ldrsb r0, [r7, r0]
	cmp r0, #0
	beq _0809BDE0
_0809BD44:
	mov r2, r8
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bge _0809BD5A
	adds r1, r6, #0
	adds r1, #0x41
	ldr r0, [r6, #0x34]
	ldrb r1, [r1]
	subs r0, r0, r1
	str r0, [r6, #0x34]
_0809BD5A:
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	ble _0809BD6E
	adds r1, r6, #0
	adds r1, #0x41
	ldr r0, [r6, #0x34]
	ldrb r1, [r1]
	adds r0, r1, r0
	str r0, [r6, #0x34]
_0809BD6E:
	ldr r1, [r6, #0x34]
	movs r0, #0xf
	ands r1, r0
	cmp r1, #0
	bne _0809BD7C
	mov r0, r8
	strb r1, [r0]
_0809BD7C:
	ldrh r4, [r6, #0x34]
	bl GetSupportScreenUnitCount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #6
	adds r1, r4, #0
	movs r3, #4
	bl UpdateMenuScrollBarConfig
	ldr r1, _0809BDB4 @ =0x0000FFD8
	ldr r2, [r6, #0x34]
	subs r2, #0x4c
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl SetBgOffset
	b _0809BDE0
	.align 2, 0
_0809BDB0: .4byte 0x08BDCE4C
_0809BDB4: .4byte 0x0000FFD8
_0809BDB8:
	ldr r0, _0809BDF0 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0809BDE0
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Goto
	ldr r0, _0809BDF4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809BDE0
	ldr r0, _0809BDF8 @ =0x0000038B
	bl m4aSongNumStart
_0809BDE0:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809BDF0: .4byte 0x08B857F8
_0809BDF4: .4byte 0x0202BBF8
_0809BDF8: .4byte 0x0000038B
