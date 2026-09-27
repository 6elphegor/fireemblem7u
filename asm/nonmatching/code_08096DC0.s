	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08096DC0
sub_08096DC0: @ 0x08096DC0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	adds r7, r4, #0
	adds r7, #0x35
	ldrb r0, [r7]
	lsls r1, r0, #1
	movs r2, #0x3a
	adds r2, r2, r4
	mov r8, r2
	adds r0, r2, r1
	ldrh r0, [r0]
	mov sl, r0
	adds r5, r4, #0
	adds r5, #0x4c
	adds r6, r5, r1
	movs r3, #0xf
	ldrh r0, [r6]
	ands r0, r3
	mov sb, r0
	cmp r0, #0
	beq _08096DF4
	b _08096FEC
_08096DF4:
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _08096DFE
	cmp r0, #0xff
	bne _08096EA0
_08096DFE:
	ldr r1, _08096E38 @ =0x08B857F8
	ldr r0, [r1]
	ldrh r3, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	mov r8, r1
	cmp r0, #0
	beq _08096E60
	ldr r0, _08096E3C @ =0x02012466
	ldrh r0, [r0]
	cmp r0, #0
	beq _08096E44
	ldr r1, _08096E40 @ =0x020117E4
	mov r2, sl
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrh r2, [r0, #2]
	mov r3, sl
	lsls r1, r3, #4
	ldrh r0, [r6]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	bl StartItemHelpBox
	movs r0, #1
	strh r0, [r4, #0x38]
	b _0809713E
	.align 2, 0
_08096E38: .4byte 0x08B857F8
_08096E3C: .4byte 0x02012466
_08096E40: .4byte 0x020117E4
_08096E44:
	ldr r0, _08096E5C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _08096E52
	b _0809713E
_08096E52:
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _0809713E
	.align 2, 0
_08096E5C: .4byte 0x0202BBF8
_08096E60:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _08096E70
	adds r0, r4, #0
	bl sub_08096C60
	b _0809713E
_08096E70:
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _08096EC0
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _08096E98 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08096E92
	ldr r0, _08096E9C @ =0x0000038B
	bl m4aSongNumStart
_08096E92:
	mov r0, sb
	strh r0, [r4, #0x38]
	b _0809713E
	.align 2, 0
_08096E98: .4byte 0x0202BBF8
_08096E9C: .4byte 0x0000038B
_08096EA0:
	ldr r2, _08096EBC @ =0x08B857F8
	ldr r1, [r2]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	mov r8, r2
	cmp r0, #0
	beq _08096EC0
	bl CloseHelpBox
	mov r1, sb
	strh r1, [r4, #0x38]
	b _0809713E
	.align 2, 0
_08096EBC: .4byte 0x08B857F8
_08096EC0:
	mov r3, r8
	ldr r2, [r3]
	ldrh r1, [r2, #6]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _08096F0C
	movs r0, #0
	bl SetUiSpinningArrowFastMaybe
	ldr r0, _08096F04 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08096EEA
	ldr r0, _08096F08 @ =0x00000387
	bl m4aSongNumStart
_08096EEA:
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	adds r1, r4, #0
	adds r1, #0x34
	movs r0, #0
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_08096950
	b _0809713E
	.align 2, 0
_08096F04: .4byte 0x0202BBF8
_08096F08: .4byte 0x00000387
_08096F0C:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08096F4C
	movs r0, #1
	bl SetUiSpinningArrowFastMaybe
	ldr r0, _08096F44 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08096F2C
	ldr r0, _08096F48 @ =0x00000387
	bl m4aSongNumStart
_08096F2C:
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	adds r0, r4, #0
	adds r0, #0x34
	strb r5, [r0]
	adds r0, r4, #0
	bl sub_080969F4
	b _0809713E
	.align 2, 0
_08096F44: .4byte 0x0202BBF8
_08096F48: .4byte 0x00000387
_08096F4C:
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r2, [r2, #4]
	ands r0, r2
	cmp r0, #0
	beq _08096F60
	adds r1, r4, #0
	adds r1, #0x32
	movs r0, #8
	b _08096F66
_08096F60:
	adds r1, r4, #0
	adds r1, #0x32
	movs r0, #4
_08096F66:
	strb r0, [r1]
	adds r5, r1, #0
	mov r0, r8
	ldr r1, [r0]
	movs r2, #0x40
	adds r0, r2, #0
	ldrh r3, [r1, #6]
	ands r0, r3
	cmp r0, #0
	bne _08096F92
	adds r0, r2, #0
	ldrh r1, [r1, #4]
	ands r0, r1
	adds r7, r4, #0
	adds r7, #0x35
	adds r6, r4, #0
	adds r6, #0x3a
	cmp r0, #0
	beq _08096FAE
	ldrb r0, [r5]
	cmp r0, #8
	bne _08096FAE
_08096F92:
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r2, [r0]
	lsls r1, r2, #1
	adds r2, r4, #0
	adds r2, #0x3a
	adds r3, r2, r1
	ldrh r1, [r3]
	adds r7, r0, #0
	adds r6, r2, #0
	cmp r1, #0
	beq _08096FAE
	subs r0, r1, #1
	strh r0, [r3]
_08096FAE:
	mov r3, r8
	ldr r1, [r3]
	movs r2, #0x80
	adds r0, r2, #0
	ldrh r3, [r1, #6]
	ands r0, r3
	cmp r0, #0
	bne _08096FCE
	adds r0, r2, #0
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _0809704A
	ldrb r5, [r5]
	cmp r5, #8
	bne _0809704A
_08096FCE:
	ldrb r1, [r7]
	lsls r0, r1, #1
	adds r2, r6, r0
	ldrh r1, [r2]
	ldr r0, _08096FE8 @ =0x02012466
	ldrh r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge _0809704A
	adds r0, r1, #1
	strh r0, [r2]
	b _0809704A
	.align 2, 0
_08096FE8: .4byte 0x02012466
_08096FEC:
	mov r2, sl
	lsls r0, r2, #4
	ldrh r2, [r6]
	adds r1, r2, #0
	subs r1, #0x28
	subs r0, r0, r1
	cmp r0, #0x37
	bgt _0809700A
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r2, r0
	strh r0, [r6]
_0809700A:
	ldrb r3, [r7]
	lsls r2, r3, #1
	mov r1, r8
	adds r0, r1, r2
	ldrh r0, [r0]
	lsls r1, r0, #4
	adds r3, r5, r2
	ldrh r2, [r3]
	adds r0, r2, #0
	subs r0, #0x28
	subs r1, r1, r0
	cmp r1, #0x78
	ble _08097032
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r2, r0
	strh r0, [r3]
_08097032:
	ldrb r2, [r7]
	lsls r0, r2, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	mov r6, r8
_0809704A:
	ldrb r3, [r7]
	lsls r0, r3, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	cmp sl, r0
	beq _0809713E
	ldr r1, _080970B0 @ =0x020117E4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	mov sb, r0
	ldr r0, _080970B4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08097072
	ldr r0, _080970B8 @ =0x00000386
	bl m4aSongNumStart
_08097072:
	ldrb r0, [r7]
	lsls r1, r0, #1
	adds r0, r6, r1
	ldrh r5, [r0]
	lsls r3, r5, #4
	adds r2, r4, #0
	adds r2, #0x4c
	adds r1, r2, r1
	ldrh r0, [r1]
	subs r0, #0x28
	subs r1, r3, r0
	mov r8, r2
	cmp r1, #0x37
	bgt _080970BC
	cmp r5, #0
	beq _080970BC
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _080970A2
	adds r1, #0x10
	movs r0, #0x80
	mov r2, sb
	bl StartItemHelpBox
_080970A2:
	adds r0, r4, #0
	adds r0, #0x32
	movs r1, #0
	ldrsb r1, [r0, r1]
	rsbs r1, r1, #0
	b _080970F4
	.align 2, 0
_080970B0: .4byte 0x020117E4
_080970B4: .4byte 0x0202BBF8
_080970B8: .4byte 0x00000386
_080970BC:
	ldrb r1, [r7]
	lsls r0, r1, #1
	adds r1, r6, r0
	ldrh r2, [r1]
	lsls r1, r2, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	cmp r1, #0x78
	ble _08097100
	ldr r0, _080970FC @ =0x02012466
	ldrh r0, [r0]
	subs r0, #1
	cmp r2, r0
	beq _08097100
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _080970EC
	subs r1, #0x10
	movs r0, #0x80
	mov r2, sb
	bl StartItemHelpBox
_080970EC:
	adds r0, r4, #0
	adds r0, #0x32
	movs r1, #0
	ldrsb r1, [r0, r1]
_080970F4:
	adds r0, r4, #0
	bl sub_08096BB0
	b _0809713E
	.align 2, 0
_080970FC: .4byte 0x02012466
_08097100:
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _08097120
	ldrb r2, [r7]
	lsls r0, r2, #1
	adds r1, r6, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	mov r2, sb
	bl StartItemHelpBox
_08097120:
	ldrb r7, [r7]
	lsls r0, r7, #1
	adds r1, r6, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl ShowSysHandCursor
_0809713E:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
