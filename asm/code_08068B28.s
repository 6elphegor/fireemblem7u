	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08068B28
sub_08068B28: @ 0x08068B28
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r2, r0, #0
	ldr r0, [r2, #0x5c]
	cmp r0, #0
	bne _08068B50
	ldr r0, _08068B44 @ =0x0203E094
	ldr r4, [r0]
	ldr r0, _08068B48 @ =0x02020100
	adds r6, r4, #0
	str r6, [r0]
	ldr r0, _08068B4C @ =0x0203E098
	b _08068B5C
	.align 2, 0
_08068B44: .4byte 0x0203E094
_08068B48: .4byte 0x02020100
_08068B4C: .4byte 0x0203E098
_08068B50:
	ldr r0, _08068C6C @ =0x0203E098
	ldr r4, [r0]
	ldr r0, _08068C70 @ =0x02020100
	adds r6, r4, #0
	str r6, [r0]
	ldr r0, _08068C74 @ =0x0203E094
_08068B5C:
	ldr r1, _08068C78 @ =0x02020104
	ldr r3, [r0]
	str r3, [r1]
	adds r0, r2, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	beq _08068B6E
	b _08068C8C
_08068B6E:
	movs r0, #0xb
	ldrsb r0, [r6, r0]
	bl GetUnit
	adds r6, r0, #0
	ldr r1, _08068C7C @ =0x02020108
	adds r3, r4, #0
	adds r3, #0x70
	movs r0, #0
	ldrsb r0, [r3, r0]
	strh r0, [r1]
	ldr r2, _08068C80 @ =0x0202010C
	movs r0, #0x12
	ldrsb r0, [r6, r0]
	strh r0, [r2]
	movs r0, #0x14
	ldrsb r0, [r6, r0]
	strh r0, [r2, #2]
	movs r0, #0x15
	ldrsb r0, [r6, r0]
	strh r0, [r2, #4]
	movs r0, #0x19
	ldrsb r0, [r6, r0]
	strh r0, [r2, #8]
	movs r0, #0x16
	ldrsb r0, [r6, r0]
	strh r0, [r2, #6]
	movs r0, #0x17
	ldrsb r0, [r6, r0]
	strh r0, [r2, #0xa]
	movs r0, #0x18
	ldrsb r0, [r6, r0]
	strh r0, [r2, #0xc]
	ldr r0, [r6, #4]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r6]
	ldrb r1, [r1, #0x13]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	strh r0, [r2, #0xe]
	ldr r1, _08068C84 @ =0x0202010A
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r0, #1
	strh r0, [r1]
	ldr r2, _08068C88 @ =0x0202011C
	movs r0, #0x12
	ldrsb r0, [r6, r0]
	adds r1, r4, #0
	adds r1, #0x73
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	strh r0, [r2]
	movs r0, #0x14
	ldrsb r0, [r6, r0]
	adds r1, r4, #0
	adds r1, #0x74
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	strh r0, [r2, #2]
	movs r0, #0x15
	ldrsb r0, [r6, r0]
	adds r1, r4, #0
	adds r1, #0x75
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	strh r0, [r2, #4]
	movs r0, #0x19
	ldrsb r0, [r6, r0]
	adds r1, r4, #0
	adds r1, #0x79
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	strh r0, [r2, #8]
	movs r0, #0x16
	ldrsb r0, [r6, r0]
	adds r1, r4, #0
	adds r1, #0x76
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	strh r0, [r2, #6]
	movs r0, #0x17
	ldrsb r0, [r6, r0]
	adds r1, r4, #0
	adds r1, #0x77
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	strh r0, [r2, #0xa]
	movs r0, #0x18
	ldrsb r0, [r6, r0]
	adds r1, r4, #0
	adds r1, #0x78
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	strh r0, [r2, #0xc]
	ldr r0, [r6, #4]
	movs r1, #0x11
	ldrsb r1, [r0, r1]
	ldr r0, [r6]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	adds r0, r4, #0
	adds r0, #0x7a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _08068D16
	.align 2, 0
_08068C6C: .4byte 0x0203E098
_08068C70: .4byte 0x02020100
_08068C74: .4byte 0x0203E094
_08068C78: .4byte 0x02020104
_08068C7C: .4byte 0x02020108
_08068C80: .4byte 0x0202010C
_08068C84: .4byte 0x0202010A
_08068C88: .4byte 0x0202011C
_08068C8C:
	ldr r1, _08068D3C @ =0x02020108
	movs r0, #8
	ldrsb r0, [r6, r0]
	strh r0, [r1]
	ldr r2, _08068D40 @ =0x0202010C
	movs r0, #0x12
	ldrsb r0, [r6, r0]
	strh r0, [r2]
	movs r0, #0x14
	ldrsb r0, [r6, r0]
	strh r0, [r2, #2]
	movs r0, #0x15
	ldrsb r0, [r6, r0]
	strh r0, [r2, #4]
	movs r0, #0x19
	ldrsb r0, [r6, r0]
	strh r0, [r2, #8]
	movs r0, #0x16
	ldrsb r0, [r6, r0]
	strh r0, [r2, #6]
	movs r0, #0x17
	ldrsb r0, [r6, r0]
	strh r0, [r2, #0xa]
	movs r0, #0x18
	ldrsb r0, [r6, r0]
	strh r0, [r2, #0xc]
	ldr r0, [r6, #4]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r6]
	ldrb r1, [r1, #0x13]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	strh r0, [r2, #0xe]
	ldr r1, _08068D44 @ =0x0202010A
	movs r0, #1
	strh r0, [r1]
	ldr r2, _08068D48 @ =0x0202011C
	movs r0, #0x12
	ldrsb r0, [r3, r0]
	strh r0, [r2]
	movs r0, #0x14
	ldrsb r0, [r3, r0]
	strh r0, [r2, #2]
	movs r0, #0x15
	ldrsb r0, [r3, r0]
	strh r0, [r2, #4]
	movs r0, #0x19
	ldrsb r0, [r3, r0]
	strh r0, [r2, #8]
	movs r0, #0x16
	ldrsb r0, [r3, r0]
	strh r0, [r2, #6]
	movs r0, #0x17
	ldrsb r0, [r3, r0]
	strh r0, [r2, #0xa]
	movs r0, #0x18
	ldrsb r0, [r3, r0]
	strh r0, [r2, #0xc]
	ldr r0, [r3, #4]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r3]
	ldrb r1, [r1, #0x13]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
_08068D16:
	adds r0, r0, r1
	strh r0, [r2, #0xe]
	ldr r0, _08068D4C @ =0x02017648
	ldr r1, _08068D50 @ =0x06002400
	movs r2, #0x90
	lsls r2, r2, #1
	movs r3, #0
	bl InitTextFont
	movs r7, #0
_08068D2A:
	adds r0, r6, #0
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08068D58
	ldr r1, _08068D54 @ =0x08BDB5BC
	b _08068D5A
	.align 2, 0
_08068D3C: .4byte 0x02020108
_08068D40: .4byte 0x0202010C
_08068D44: .4byte 0x0202010A
_08068D48: .4byte 0x0202011C
_08068D4C: .4byte 0x02017648
_08068D50: .4byte 0x06002400
_08068D54: .4byte 0x08BDB5BC
_08068D58:
	ldr r1, _08068E98 @ =0x08BDB5DC
_08068D5A:
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	bl DecodeMsg
	adds r5, r0, #0
	lsls r1, r7, #3
	ldr r0, _08068E9C @ =0x02017660
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #3
	bl InitText
	adds r0, r5, #0
	bl GetStringTextLen
	adds r1, r0, #0
	movs r0, #0x10
	subs r0, r0, r1
	asrs r1, r0, #1
	cmp r1, #0
	bge _08068D8A
	movs r1, #0
_08068D8A:
	adds r0, r4, #0
	bl Text_SetCursor
	adds r0, r4, #0
	movs r1, #3
	bl Text_SetColor
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawString
	ldr r1, _08068EA0 @ =0x082E5BF0
	lsls r0, r7, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r1, r0, #1
	ldr r0, _08068EA4 @ =0x02023C60
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
	adds r7, #1
	cmp r7, #7
	ble _08068D2A
	movs r7, #0
_08068DBC:
	lsls r5, r7, #3
	ldr r0, _08068EA8 @ =0x020176A0
	mov r8, r0
	add r5, r8
	adds r0, r5, #0
	movs r1, #2
	bl InitText
	adds r0, r5, #0
	movs r1, #8
	bl Text_SetCursor
	adds r0, r5, #0
	movs r1, #2
	bl Text_SetColor
	ldr r0, _08068EAC @ =0x0202010C
	lsls r4, r7, #1
	adds r0, r4, r0
	ldrh r1, [r0]
	adds r0, r5, #0
	bl Text_DrawNumber
	ldr r0, _08068EA0 @ =0x082E5BF0
	adds r4, r4, r0
	ldrh r4, [r4]
	lsls r1, r4, #1
	ldr r6, _08068EB0 @ =0x02023C66
	adds r1, r1, r6
	adds r0, r5, #0
	bl PutText
	adds r7, #1
	cmp r7, #7
	ble _08068DBC
	mov r4, r8
	adds r4, #0x40
	adds r0, r4, #0
	movs r1, #8
	bl InitText
	ldr r0, _08068EB4 @ =0x02020100
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	movs r0, #0xdf
	lsls r0, r0, #1
	adds r1, r6, r0
	adds r0, r4, #0
	bl PutText
	adds r4, #8
	adds r0, r4, #0
	movs r1, #3
	bl InitText
	adds r0, r4, #0
	movs r1, #3
	bl Text_SetColor
	ldr r0, _08068EB8 @ =0x08CC26D4
	ldr r0, [r0]
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	movs r0, #0xe7
	lsls r0, r0, #1
	adds r1, r6, r0
	adds r0, r4, #0
	bl PutText
	adds r4, #8
	adds r0, r4, #0
	movs r1, #2
	bl InitText
	adds r0, r4, #0
	movs r1, #8
	bl Text_SetCursor
	adds r0, r4, #0
	movs r1, #2
	bl Text_SetColor
	ldr r0, _08068EBC @ =0x02020108
	ldrh r1, [r0]
	adds r0, r4, #0
	bl Text_DrawNumber
	movs r0, #0xea
	lsls r0, r0, #1
	adds r1, r6, r0
	adds r0, r4, #0
	bl PutText
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08068E98: .4byte 0x08BDB5DC
_08068E9C: .4byte 0x02017660
_08068EA0: .4byte 0x082E5BF0
_08068EA4: .4byte 0x02023C60
_08068EA8: .4byte 0x020176A0
_08068EAC: .4byte 0x0202010C
_08068EB0: .4byte 0x02023C66
_08068EB4: .4byte 0x02020100
_08068EB8: .4byte 0x08CC26D4
_08068EBC: .4byte 0x02020108
