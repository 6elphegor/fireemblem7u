	.include "macro.inc"

	.syntax unified

	thumb_func_start BonusClaim_DrawItemSentPopup
BonusClaim_DrawItemSentPopup: @ 0x080AD820
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x29
	ldr r0, _080AD96C @ =0x08CE577C
	ldr r1, [r0]
	ldrb r2, [r6]
	lsls r0, r2, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsb r2, [r0, r2]
	ldr r0, _080AD970 @ =0x08CE5774
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	str r0, [sp, #0x30]
	adds r1, r1, r0
	ldrb r1, [r1, #2]
	str r1, [sp, #0x2c]
	ldr r0, _080AD974 @ =0x08CE5784
	ldr r0, [r0]
	adds r5, r0, #0
	adds r5, #0x70
	ldr r2, _080AD978 @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	ldr r2, _080AD97C @ =0x02022C60
	mov sl, r2
	mov r0, sl
	movs r1, #0
	bl TmFill
	ldr r0, _080AD980 @ =0x02023460
	movs r1, #0
	bl TmFill
	bl sub_080ACF08
	movs r0, #3
	bl EnableBgSync
	adds r0, r4, #0
	bl sub_080AD484
	bl ReadLastGameSaveId
	bl WriteGameSave
	movs r0, #0
	str r0, [r4, #0x30]
	bl DisableUiCursorHand
	ldrb r6, [r6]
	lsls r1, r6, #4
	movs r2, #0x2c
	ldrsh r0, [r4, r2]
	subs r0, #0x38
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x40
	movs r2, #0xd
	bl ShowSysHandCursor
	adds r0, r5, #0
	bl ClearText
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0
	bl Text_SetParams
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetCursor
	ldr r0, _080AD984 @ =0x000010B3
	add r1, sp, #0xc
	bl DecodeMsgInBuffer
	adds r7, r0, #0
	ldr r0, [sp, #0x2c]
	movs r1, #0
	bl GetItemNameWithArticle
	mov r8, r0
	adds r0, r7, #0
	bl GetStringTextLen
	adds r4, r0, #0
	mov r0, r8
	bl GetStringTextLen
	adds r0, r4, r0
	adds r4, r0, #7
	cmp r4, #0
	bge _080AD8FE
	adds r4, #7
_080AD8FE:
	asrs r4, r4, #3
	adds r0, r4, #4
	mov sb, r0
	lsrs r0, r0, #0x1f
	add r0, sb
	asrs r0, r0, #1
	movs r1, #0xf
	subs r6, r1, r0
	adds r0, r5, #0
	adds r1, r7, #0
	bl Text_DrawString
	adds r0, r5, #0
	movs r1, #2
	bl Text_SetColor
	adds r0, r5, #0
	mov r1, r8
	bl Text_DrawString
	lsls r1, r6, #1
	ldr r0, _080AD988 @ =0x00000282
	add r0, sl
	adds r1, r1, r0
	adds r0, r5, #0
	bl PutText
	adds r4, #5
	adds r4, r6, r4
	lsls r4, r4, #1
	movs r0, #0x9e
	lsls r0, r0, #2
	add r0, sl
	adds r4, r4, r0
	ldr r0, [sp, #0x2c]
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl PutIcon
	ldr r1, _080AD970 @ =0x08CE5774
	ldr r0, [r1]
	ldr r2, [sp, #0x30]
	adds r0, r0, r2
	ldrb r0, [r0, #1]
	cmp r0, #0
	blt _080AD9BA
	cmp r0, #1
	ble _080AD98C
	cmp r0, #2
	beq _080AD9A8
	b _080AD9BA
	.align 2, 0
_080AD96C: .4byte 0x08CE577C
_080AD970: .4byte 0x08CE5774
_080AD974: .4byte 0x08CE5784
_080AD978: .4byte 0x03002870
_080AD97C: .4byte 0x02022C60
_080AD980: .4byte 0x02023460
_080AD984: .4byte 0x000010B3
_080AD988: .4byte 0x00000282
_080AD98C:
	ldr r0, _080AD9A0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AD9BA
	ldr r0, _080AD9A4 @ =0x0000037A
	bl m4aSongNumStart
	b _080AD9BA
	.align 2, 0
_080AD9A0: .4byte 0x0202BBF8
_080AD9A4: .4byte 0x0000037A
_080AD9A8:
	ldr r0, _080ADA48 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AD9BA
	movs r0, #0xb9
	bl m4aSongNumStart
_080AD9BA:
	ldr r0, _080ADA4C @ =0x02023460
	movs r1, #3
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	adds r1, r6, #0
	movs r2, #0xa
	mov r3, sb
	bl PutUiWindowFrame
	ldr r0, _080ADA50 @ =0x03002870
	mov ip, r0
	movs r0, #0x20
	mov r1, ip
	ldrb r1, [r1, #1]
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, ip
	strb r0, [r2, #1]
	adds r2, #0x34
	movs r0, #1
	ldrb r1, [r2]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r2]
	lsls r0, r6, #3
	mov r1, ip
	adds r1, #0x2d
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x50
	strb r0, [r1]
	mov r2, sb
	adds r0, r6, r2
	lsls r0, r0, #3
	subs r1, #5
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x68
	strb r0, [r1]
	movs r0, #3
	bl EnableBgSync
	ldr r2, _080ADA54 @ =0x0000FFFC
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ADA48: .4byte 0x0202BBF8
_080ADA4C: .4byte 0x02023460
_080ADA50: .4byte 0x03002870
_080ADA54: .4byte 0x0000FFFC
