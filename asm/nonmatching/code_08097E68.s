	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08097E68
sub_08097E68: @ 0x08097E68
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x33
	ldrb r0, [r6]
	lsls r1, r0, #1
	movs r2, #0x38
	adds r2, r2, r4
	mov r8, r2
	adds r0, r2, r1
	ldrh r0, [r0]
	mov sb, r0
	adds r5, r4, #0
	adds r5, #0x4a
	adds r7, r5, r1
	movs r3, #0xf
	ldrh r0, [r7]
	ands r0, r3
	mov sl, r0
	cmp r0, #0
	beq _08097E9C
	b _080980F0
_08097E9C:
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _08097EA8
	cmp r0, #0xff
	beq _08097EA8
	b _08097FA4
_08097EA8:
	ldr r1, _08097EE4 @ =0x08B857F8
	ldr r0, [r1]
	ldrh r3, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	mov r8, r1
	cmp r0, #0
	beq _08097EF0
	ldr r0, _08097EE8 @ =0x02012466
	ldrh r0, [r0]
	cmp r0, #0
	beq _08097F00
	ldr r1, _08097EEC @ =0x020117E4
	mov r2, sb
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrh r2, [r0, #2]
	mov r3, sb
	lsls r1, r3, #4
	ldrh r0, [r7]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	bl StartItemHelpBox
	movs r0, #1
	strh r0, [r4, #0x36]
	b _08098266
	.align 2, 0
_08097EE4: .4byte 0x08B857F8
_08097EE8: .4byte 0x02012466
_08097EEC: .4byte 0x020117E4
_08097EF0:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _08097F74
	ldr r0, _08097F18 @ =0x02012466
	ldrh r0, [r0]
	cmp r0, #0
	bne _08097F20
_08097F00:
	ldr r0, _08097F1C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _08097F0E
	b _08098266
_08097F0E:
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _08098266
	.align 2, 0
_08097F18: .4byte 0x02012466
_08097F1C: .4byte 0x0202BBF8
_08097F20:
	ldr r0, _08097F48 @ =0x020117E4
	mov r2, sb
	lsls r1, r2, #2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	bne _08097F4C
	lsls r2, r2, #4
	ldrh r0, [r7]
	subs r0, #0x28
	subs r2, r2, r0
	movs r0, #0
	movs r1, #0x80
	movs r3, #2
	bl SetUiCursorHandConfig
	adds r0, r4, #0
	movs r1, #7
	b _08097F50
	.align 2, 0
_08097F48: .4byte 0x020117E4
_08097F4C:
	adds r0, r4, #0
	movs r1, #6
_08097F50:
	bl Proc_Goto
	ldr r0, _08097F6C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _08097F62
	b _08098266
_08097F62:
	ldr r0, _08097F70 @ =0x0000038A
	bl m4aSongNumStart
	b _08098266
	.align 2, 0
_08097F6C: .4byte 0x0202BBF8
_08097F70: .4byte 0x0000038A
_08097F74:
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _08097FC4
	adds r0, r4, #0
	movs r1, #8
	bl Proc_Goto
	ldr r0, _08097F9C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08097F96
	ldr r0, _08097FA0 @ =0x0000038B
	bl m4aSongNumStart
_08097F96:
	mov r3, sl
	strh r3, [r4, #0x36]
	b _08098266
	.align 2, 0
_08097F9C: .4byte 0x0202BBF8
_08097FA0: .4byte 0x0000038B
_08097FA4:
	ldr r2, _08097FC0 @ =0x08B857F8
	ldr r1, [r2]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	mov r8, r2
	cmp r0, #0
	beq _08097FC4
	bl CloseHelpBox
	mov r0, sl
	strh r0, [r4, #0x36]
	b _08098266
	.align 2, 0
_08097FC0: .4byte 0x08B857F8
_08097FC4:
	mov r1, r8
	ldr r2, [r1]
	ldrh r1, [r2, #6]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _08098010
	movs r0, #0
	bl SetUiSpinningArrowFastMaybe
	ldr r0, _08098008 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08097FEE
	ldr r0, _0809800C @ =0x00000387
	bl m4aSongNumStart
_08097FEE:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	adds r1, r4, #0
	adds r1, #0x32
	movs r0, #0
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_08097B64
	b _08098266
	.align 2, 0
_08098008: .4byte 0x0202BBF8
_0809800C: .4byte 0x00000387
_08098010:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08098050
	movs r0, #1
	bl SetUiSpinningArrowFastMaybe
	ldr r0, _08098048 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08098030
	ldr r0, _0809804C @ =0x00000387
	bl m4aSongNumStart
_08098030:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
	adds r0, r4, #0
	adds r0, #0x32
	strb r5, [r0]
	adds r0, r4, #0
	bl sub_08097C08
	b _08098266
	.align 2, 0
_08098048: .4byte 0x0202BBF8
_0809804C: .4byte 0x00000387
_08098050:
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r2, [r2, #4]
	ands r0, r2
	cmp r0, #0
	beq _08098064
	adds r1, r4, #0
	adds r1, #0x31
	movs r0, #8
	b _0809806A
_08098064:
	adds r1, r4, #0
	adds r1, #0x31
	movs r0, #4
_0809806A:
	strb r0, [r1]
	adds r5, r1, #0
	mov r2, r8
	ldr r1, [r2]
	movs r2, #0x40
	adds r0, r2, #0
	ldrh r3, [r1, #6]
	ands r0, r3
	cmp r0, #0
	bne _08098096
	adds r0, r2, #0
	ldrh r1, [r1, #4]
	ands r0, r1
	adds r7, r4, #0
	adds r7, #0x33
	adds r6, r4, #0
	adds r6, #0x38
	cmp r0, #0
	beq _080980B2
	ldrb r0, [r5]
	cmp r0, #8
	bne _080980B2
_08098096:
	adds r0, r4, #0
	adds r0, #0x33
	ldrb r2, [r0]
	lsls r1, r2, #1
	adds r2, r4, #0
	adds r2, #0x38
	adds r3, r2, r1
	ldrh r1, [r3]
	adds r7, r0, #0
	adds r6, r2, #0
	cmp r1, #0
	beq _080980B2
	subs r0, r1, #1
	strh r0, [r3]
_080980B2:
	mov r3, r8
	ldr r1, [r3]
	movs r2, #0x80
	adds r0, r2, #0
	ldrh r3, [r1, #6]
	ands r0, r3
	cmp r0, #0
	bne _080980D2
	adds r0, r2, #0
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _08098150
	ldrb r5, [r5]
	cmp r5, #8
	bne _08098150
_080980D2:
	ldrb r1, [r7]
	lsls r0, r1, #1
	adds r2, r6, r0
	ldrh r1, [r2]
	ldr r0, _080980EC @ =0x02012466
	ldrh r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge _08098150
	adds r0, r1, #1
	strh r0, [r2]
	b _08098150
	.align 2, 0
_080980EC: .4byte 0x02012466
_080980F0:
	mov r2, sb
	lsls r0, r2, #4
	ldrh r2, [r7]
	adds r1, r2, #0
	subs r1, #0x28
	subs r0, r0, r1
	cmp r0, #0x37
	bgt _0809810E
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r2, r0
	strh r0, [r7]
_0809810E:
	ldrb r3, [r6]
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
	ble _08098136
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r2, r0
	strh r0, [r3]
_08098136:
	ldrb r2, [r6]
	lsls r0, r2, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	adds r7, r6, #0
	mov r6, r8
_08098150:
	ldrb r3, [r7]
	lsls r0, r3, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	cmp sb, r0
	bne _0809815E
	b _08098266
_0809815E:
	ldr r5, _080981D8 @ =0x020117E4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrh r0, [r0, #2]
	mov sl, r0
	ldr r0, _080981DC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809817A
	ldr r0, _080981E0 @ =0x00000386
	bl m4aSongNumStart
_0809817A:
	ldrb r1, [r7]
	lsls r0, r1, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r5
	mov r2, sb
	lsls r0, r2, #2
	adds r0, r0, r5
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	beq _0809819A
	adds r0, r4, #0
	bl PrepItemList_DrawCurrentOwnerText
_0809819A:
	ldrb r3, [r7]
	lsls r1, r3, #1
	adds r0, r6, r1
	ldrh r5, [r0]
	lsls r3, r5, #4
	adds r2, r4, #0
	adds r2, #0x4a
	adds r1, r2, r1
	ldrh r0, [r1]
	subs r0, #0x28
	subs r1, r3, r0
	mov r8, r2
	cmp r1, #0x37
	bgt _080981E4
	cmp r5, #0
	beq _080981E4
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _080981CA
	adds r1, #0x10
	movs r0, #0x80
	mov r2, sl
	bl StartItemHelpBox
_080981CA:
	adds r0, r4, #0
	adds r0, #0x31
	movs r1, #0
	ldrsb r1, [r0, r1]
	rsbs r1, r1, #0
	b _0809821C
	.align 2, 0
_080981D8: .4byte 0x020117E4
_080981DC: .4byte 0x0202BBF8
_080981E0: .4byte 0x00000386
_080981E4:
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
	ble _08098228
	ldr r0, _08098224 @ =0x02012466
	ldrh r0, [r0]
	subs r0, #1
	cmp r2, r0
	beq _08098228
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _08098214
	subs r1, #0x10
	movs r0, #0x80
	mov r2, sl
	bl StartItemHelpBox
_08098214:
	adds r0, r4, #0
	adds r0, #0x31
	movs r1, #0
	ldrsb r1, [r0, r1]
_0809821C:
	adds r0, r4, #0
	bl sub_08097D30
	b _08098266
	.align 2, 0
_08098224: .4byte 0x02012466
_08098228:
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _08098248
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
	mov r2, sl
	bl StartItemHelpBox
_08098248:
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
_08098266:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
