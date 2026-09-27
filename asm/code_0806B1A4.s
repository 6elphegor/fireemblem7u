	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawBattlePopup
DrawBattlePopup: @ 0x0806B1A4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp]
	mov r8, r1
	mov sb, r2
	ldr r0, _0806B200 @ =0x081DB588
	ldr r1, _0806B204 @ =0x06002000
	bl LZ77UnCompVram
	ldr r0, _0806B208 @ =0x081DB704
	ldr r1, _0806B20C @ =0x02019784
	bl LZ77UnCompWram
	ldr r0, _0806B210 @ =0x02017648
	ldr r1, _0806B214 @ =0x060020C0
	movs r2, #0x83
	lsls r2, r2, #1
	movs r3, #1
	bl InitTextFont
	bl SetTextDrawNoClear
	ldr r0, _0806B218 @ =0x081DB6E4
	ldr r1, _0806B21C @ =0x02022880
	movs r2, #8
	bl CpuFastSet
	mov r0, r8
	cmp r0, #0
	bne _0806B220
	movs r1, #0
	str r1, [sp, #4]
	movs r0, #0xea
	lsls r0, r0, #3
	bl DecodeMsg
	adds r5, r0, #0
	bl GetStringTextLen
	adds r4, r0, #0
	adds r4, #0x10
	b _0806B268
	.align 2, 0
_0806B200: .4byte 0x081DB588
_0806B204: .4byte 0x06002000
_0806B208: .4byte 0x081DB704
_0806B20C: .4byte 0x02019784
_0806B210: .4byte 0x02017648
_0806B214: .4byte 0x060020C0
_0806B218: .4byte 0x081DB6E4
_0806B21C: .4byte 0x02022880
_0806B220:
	mov r2, r8
	cmp r2, #1
	bne _0806B254
	movs r3, #0
	str r3, [sp, #4]
	mov r0, sb
	movs r1, #1
	bl GetItemNameWithArticle
	adds r5, r0, #0
	bl GetStringTextLen
	adds r4, r0, #0
	adds r4, #0x10
	ldr r0, _0806B250 @ =0x00000751
	bl DecodeMsg
	adds r5, r0, #0
	bl GetStringTextLen
	adds r0, r0, r4
	adds r4, r0, #4
	b _0806B268
	.align 2, 0
_0806B250: .4byte 0x00000751
_0806B254:
	ldr r0, _0806B2AC @ =0x0000075A
	bl DecodeMsg
	adds r5, r0, #0
	bl GetStringTextLen
	adds r1, r0, #2
	str r1, [sp, #4]
	adds r4, r0, #0
	adds r4, #0x12
_0806B268:
	adds r0, r4, #7
	asrs r7, r0, #3
	ldr r0, _0806B2B0 @ =0x02023460
	lsls r1, r7, #0x10
	lsrs r1, r1, #0x10
	bl MakeBattlePopupTileMapFromTSA
	ldr r6, _0806B2B4 @ =0x02017660
	adds r0, r6, #0
	adds r1, r7, #0
	bl InitText
	lsls r0, r7, #3
	subs r0, r0, r4
	asrs r0, r0, #1
	mov sl, r0
	adds r0, r6, #0
	mov r1, sl
	bl Text_SetCursor
	ldr r0, _0806B2B8 @ =0x081DB5E4
	ldr r1, _0806B2BC @ =0x060020C0
	bl LZ77UnCompVram
	mov r2, r8
	cmp r2, #0
	bne _0806B2C0
	adds r0, r6, #0
	movs r1, #0x10
	bl Text_Skip
	movs r0, #0xea
	lsls r0, r0, #3
	b _0806B2F2
	.align 2, 0
_0806B2AC: .4byte 0x0000075A
_0806B2B0: .4byte 0x02023460
_0806B2B4: .4byte 0x02017660
_0806B2B8: .4byte 0x081DB5E4
_0806B2BC: .4byte 0x060020C0
_0806B2C0:
	mov r3, r8
	cmp r3, #1
	bne _0806B310
	adds r0, r6, #0
	movs r1, #0x10
	bl Text_Skip
	mov r0, sb
	movs r1, #1
	bl GetItemNameWithArticle
	adds r5, r0, #0
	adds r0, r6, #0
	movs r1, #1
	bl Text_SetColor
	adds r0, r6, #0
	adds r1, r5, #0
	bl Text_DrawString
	adds r0, r6, #0
	movs r1, #4
	bl Text_Skip
	ldr r0, _0806B30C @ =0x00000751
_0806B2F2:
	bl DecodeMsg
	adds r5, r0, #0
	adds r0, r6, #0
	movs r1, #0
	bl Text_SetColor
	adds r0, r6, #0
	adds r1, r5, #0
	bl Text_DrawString
	b _0806B328
	.align 2, 0
_0806B30C: .4byte 0x00000751
_0806B310:
	ldr r0, _0806B364 @ =0x0000075A
	bl DecodeMsg
	adds r5, r0, #0
	adds r0, r6, #0
	movs r1, #0
	bl Text_SetColor
	adds r0, r6, #0
	adds r1, r5, #0
	bl Text_DrawString
_0806B328:
	adds r1, r7, #2
	lsls r1, r1, #3
	movs r0, #0xf0
	subs r0, r0, r1
	asrs r5, r0, #1
	rsbs r1, r5, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, _0806B368 @ =0x0000FFD0
	movs r0, #1
	bl SetBgOffset
	movs r0, #2
	bl EnableBgSync
	bl InitIcons
	mov r0, r8
	cmp r0, #0
	bne _0806B36C
	movs r0, #1
	movs r1, #0x12
	bl ApplyIconPalette
	mov r0, sb
	bl GetItemType
	adds r0, #0x70
	b _0806B380
	.align 2, 0
_0806B364: .4byte 0x0000075A
_0806B368: .4byte 0x0000FFD0
_0806B36C:
	mov r1, r8
	cmp r1, #1
	bne _0806B388
	movs r0, #0
	movs r1, #0x12
	bl ApplyIconPalette
	mov r0, sb
	bl GetItemIconId
_0806B380:
	movs r1, #0x40
	bl PutIconObjImg
	b _0806B39A
_0806B388:
	movs r0, #1
	movs r1, #0x12
	bl ApplyIconPalette
	mov r0, sb
	adds r0, #0x70
	movs r1, #0x40
	bl PutIconObjImg
_0806B39A:
	ldr r0, _0806B404 @ =0x08BDCD4C
	movs r1, #0x96
	bl AnimCreate
	ldr r2, [sp]
	str r0, [r2, #0x60]
	movs r4, #0
	movs r1, #0x91
	lsls r1, r1, #6
	strh r1, [r0, #8]
	mov r1, sl
	adds r1, #8
	adds r1, r5, r1
	ldr r3, [sp, #4]
	adds r1, r1, r3
	strh r1, [r0, #2]
	movs r1, #0x38
	strh r1, [r0, #4]
	bl EnablePalSync
	ldr r2, _0806B408 @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806B404: .4byte 0x08BDCD4C
_0806B408: .4byte 0x03002870
