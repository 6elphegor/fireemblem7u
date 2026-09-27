	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08041920
sub_08041920: @ 0x08041920
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	ldr r1, _08041AF4 @ =0x081D53CB
	add r0, sp, #8
	movs r2, #8
	bl memcpy
	bl ClearSioBG
	bl sub_08047B34
	ldr r4, _08041AF8 @ =0x081C6A18
	movs r0, #1
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, _08041AFC @ =0x06000C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _08041B00 @ =0x081C7FC4
	movs r1, #0x80
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r0, _08041B04 @ =0x081C7F84
	movs r1, #0xc0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08041B08 @ =0x081C5BE0
	ldr r1, _08041B0C @ =0x06014800
	bl Decompress
	ldr r0, _08041B10 @ =0x081C7F04
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x80
	bl ApplyPaletteExt
	movs r0, #0
	movs r1, #2
	bl sub_08047BD4
	ldr r0, _08041B14 @ =0x02023D62
	ldr r1, _08041B18 @ =0x081C87A0
	movs r2, #0x80
	lsls r2, r2, #5
	bl TmApplyTsa_thm
	ldr r0, _08041B1C @ =0x0203DA60
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	movs r1, #0
	movs r0, #0xc8
	strh r0, [r7, #0x36]
	adds r0, r7, #0
	adds r0, #0x39
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	subs r0, #4
	strb r1, [r0]
	ldrh r2, [r7, #0x36]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r5, _08041B20 @ =0x0203DA10
	movs r4, #9
_080419B8:
	adds r0, r5, #0
	movs r1, #0x16
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _080419B8
	ldr r4, _08041B24 @ =0x0203DC08
	adds r0, r4, #0
	movs r1, #0x18
	bl InitText
	adds r0, r4, #0
	adds r0, #8
	movs r1, #0x18
	bl InitText
	adds r0, r4, #0
	bl ClearText
	ldr r0, _08041B28 @ =0x0000077F
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x10
	movs r2, #0
	bl Text_InsertDrawString
	movs r0, #0xf0
	lsls r0, r0, #3
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x54
	movs r2, #0
	bl Text_InsertDrawString
	ldr r0, _08041B2C @ =0x00000781
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x78
	movs r2, #0
	bl Text_InsertDrawString
	ldr r0, _08041B30 @ =0x00000782
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x96
	movs r2, #0
	bl Text_InsertDrawString
	ldr r1, _08041B34 @ =0x02022DAA
	adds r0, r4, #0
	bl PutText
	ldr r0, _08041B38 @ =0x000003C2
	movs r1, #1
	bl PutSioText
	ldr r0, _08041B3C @ =0x0203DB68
	bl sub_080A1F2C
	bl sub_08041880
	ldr r1, _08041B40 @ =0x03002870
	mov ip, r1
	movs r0, #0x20
	ldrb r2, [r1, #1]
	orrs r0, r2
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x38
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x88
	strb r0, [r1]
	mov r5, ip
	adds r5, #0x34
	movs r1, #1
	ldrb r0, [r5]
	orrs r0, r1
	movs r2, #2
	orrs r0, r2
	movs r6, #4
	orrs r0, r6
	movs r4, #8
	orrs r0, r4
	movs r3, #0x10
	orrs r0, r3
	strb r0, [r5]
	mov r2, ip
	adds r2, #0x36
	ldrb r0, [r2]
	orrs r1, r0
	movs r0, #3
	rsbs r0, r0, #0
	ands r1, r0
	orrs r1, r6
	orrs r1, r4
	orrs r1, r3
	strb r1, [r2]
	ldrh r0, [r7, #0x36]
	adds r0, #0x38
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	str r7, [sp, #4]
	movs r0, #0xd8
	movs r1, #0x38
	movs r2, #0xa
	movs r3, #5
	bl StartLinkArenaMenuScrollBar
	adds r0, r7, #0
	movs r1, #5
	bl sub_08047D80
	ldr r0, _08041B44 @ =0x0203D90C
	ldrb r0, [r0]
	str r0, [sp]
	str r7, [sp, #4]
	add r0, sp, #8
	movs r1, #8
	movs r2, #0
	movs r3, #8
	bl sub_08047E84
	movs r0, #0xc0
	movs r1, #0x10
	adds r2, r7, #0
	bl StartLinkArenaButtonSpriteDraw
	movs r0, #0xf
	bl EnableBgSync
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041AF4: .4byte 0x081D53CB
_08041AF8: .4byte 0x081C6A18
_08041AFC: .4byte 0x06000C00
_08041B00: .4byte 0x081C7FC4
_08041B04: .4byte 0x081C7F84
_08041B08: .4byte 0x081C5BE0
_08041B0C: .4byte 0x06014800
_08041B10: .4byte 0x081C7F04
_08041B14: .4byte 0x02023D62
_08041B18: .4byte 0x081C87A0
_08041B1C: .4byte 0x0203DA60
_08041B20: .4byte 0x0203DA10
_08041B24: .4byte 0x0203DC08
_08041B28: .4byte 0x0000077F
_08041B2C: .4byte 0x00000781
_08041B30: .4byte 0x00000782
_08041B34: .4byte 0x02022DAA
_08041B38: .4byte 0x000003C2
_08041B3C: .4byte 0x0203DB68
_08041B40: .4byte 0x03002870
_08041B44: .4byte 0x0203D90C
