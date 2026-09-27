	.include "macro.inc"

	.syntax unified

	thumb_func_start ClearTalkFaceRefs
ClearTalkFaceRefs: @ 0x08007DD4
	push {r4, lr}
	movs r2, #0
	ldr r4, _08007DF4 @ =0x08B909B8
	movs r3, #0
_08007DDC:
	ldr r0, [r4]
	lsls r1, r2, #2
	adds r0, #0x18
	adds r0, r0, r1
	str r3, [r0]
	adds r2, #1
	cmp r2, #7
	ble _08007DDC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08007DF4: .4byte 0x08B909B8

	thumb_func_start InitTalk
InitTalk: @ 0x08007DF8
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	ldr r4, _08007E7C @ =0x030000E8
	movs r0, #0
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, _08007E80 @ =0x000003FF
	ands r0, r5
	lsls r0, r0, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r0, r0, r2
	adds r1, r1, r0
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #2
	bl InitTextFont
	bl SetInitTalkTextFont
	ldr r0, _08007E84 @ =0x08B909B8
	ldr r0, [r0]
	strb r6, [r0, #0xa]
	cmp r6, #0
	ble _08007E4E
	ldr r4, _08007E88 @ =0x030000C8
	adds r5, r6, #0
_08007E36:
	adds r0, r4, #0
	movs r1, #0x1e
	bl InitText
	adds r0, r4, #0
	movs r1, #1
	bl Text_SetColor
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bne _08007E36
_08007E4E:
	cmp r7, #0
	beq _08007E70
	ldr r4, _08007E8C @ =0x083FBD34
	movs r0, #1
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, _08007E90 @ =0x06000200
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _08007E94 @ =0x083FBFD0
	movs r1, #0x60
	movs r2, #0x20
	bl ApplyPaletteExt
_08007E70:
	bl ClearTalkFaceRefs
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08007E7C: .4byte 0x030000E8
_08007E80: .4byte 0x000003FF
_08007E84: .4byte 0x08B909B8
_08007E88: .4byte 0x030000C8
_08007E8C: .4byte 0x083FBD34
_08007E90: .4byte 0x06000200
_08007E94: .4byte 0x083FBFD0

	thumb_func_start InitSpriteTalk
InitSpriteTalk: @ 0x08007E98
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r4, r2, #0
	ldr r5, _08007F28 @ =0x030000E8
	ldr r1, _08007F2C @ =0x000003FF
	ands r1, r0
	lsls r1, r1, #5
	ldr r0, _08007F30 @ =0x06010000
	adds r1, r1, r0
	adds r0, r5, #0
	bl InitSpriteTextFont
	adds r0, r5, #0
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	ldr r0, _08007F34 @ =0x08194694
	adds r4, #0x10
	lsls r1, r4, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r2, _08007F38 @ =0x02022860
	lsls r4, r4, #4
	adds r0, r4, #4
	lsls r0, r0, #1
	adds r0, r0, r2
	ldr r1, _08007F3C @ =0x00007247
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0xe
	lsls r0, r0, #1
	adds r0, r0, r2
	ldr r1, _08007F40 @ =0x000031AE
	strh r1, [r0]
	adds r4, #0xf
	lsls r4, r4, #1
	adds r4, r4, r2
	ldr r0, _08007F44 @ =0x00007FFF
	strh r0, [r4]
	ldr r0, _08007F48 @ =0x08B909B8
	ldr r0, [r0]
	strb r6, [r0, #0xa]
	movs r5, #0
	cmp r5, r6
	bge _08007F20
_08007EF8:
	lsls r4, r5, #3
	ldr r0, _08007F4C @ =0x030000C8
	adds r4, r4, r0
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	bl SpriteText_DrawBackground
	adds r0, r4, #0
	movs r1, #6
	bl Text_SetColor
	adds r0, r4, #0
	movs r1, #4
	bl Text_SetCursor
	adds r5, #1
	cmp r5, r6
	blt _08007EF8
_08007F20:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08007F28: .4byte 0x030000E8
_08007F2C: .4byte 0x000003FF
_08007F30: .4byte 0x06010000
_08007F34: .4byte 0x08194694
_08007F38: .4byte 0x02022860
_08007F3C: .4byte 0x00007247
_08007F40: .4byte 0x000031AE
_08007F44: .4byte 0x00007FFF
_08007F48: .4byte 0x08B909B8
_08007F4C: .4byte 0x030000C8

	thumb_func_start sub_08007F50
sub_08007F50: @ 0x08007F50
	push {lr}
	ldr r0, _08007F60 @ =0x08194674
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r0}
	bx r0
	.align 2, 0
_08007F60: .4byte 0x08194674

	thumb_func_start SetInitTalkTextFont
SetInitTalkTextFont: @ 0x08007F64
	push {lr}
	ldr r0, _08007F74 @ =0x030000E8
	bl SetTextFont
	bl InitTalkTextFont
	pop {r0}
	bx r0
	.align 2, 0
_08007F74: .4byte 0x030000E8

	thumb_func_start StartTalkExt
StartTalkExt: @ 0x08007F78
	push {r4, r5, r6, r7, lr}
	adds r7, r3, #0
	ldr r4, _08008000 @ =0x08B909B8
	ldr r3, [r4]
	movs r5, #0
	strb r0, [r3, #0xc]
	ldr r0, [r4]
	strb r1, [r0, #0xd]
	ldr r0, [r4]
	str r2, [r0]
	str r5, [r0, #4]
	movs r6, #1
	strb r6, [r0, #8]
	ldr r0, [r4]
	strb r5, [r0, #9]
	ldr r0, [r4]
	adds r0, #0x82
	strb r5, [r0]
	ldr r0, [r4]
	strb r5, [r0, #0xb]
	bl GetTextPrintDelay
	ldr r1, [r4]
	strb r0, [r1, #0x13]
	ldr r0, [r4]
	strb r5, [r0, #0x14]
	movs r0, #0xff
	bl SetActiveTalkFace
	ldr r1, [r4]
	movs r0, #0xff
	strb r0, [r1, #0xf]
	ldr r0, [r4]
	strb r5, [r0, #0x15]
	ldr r0, [r4]
	strb r5, [r0, #0x12]
	ldr r0, [r4]
	strb r6, [r0, #0x16]
	ldr r0, [r4]
	strb r5, [r0, #0x17]
	ldr r0, [r4]
	adds r1, r0, #0
	adds r1, #0x80
	movs r2, #0
	strh r5, [r1]
	str r5, [r0, #0x38]
	adds r0, #0x83
	strb r2, [r0]
	ldr r0, [r4]
	ldr r0, [r0]
	movs r1, #0
	bl GetStrTalkLen
	adds r0, #7
	movs r1, #8
	bl Div
	ldr r1, [r4]
	adds r0, #2
	strb r0, [r1, #0xe]
	cmp r7, #0
	bne _08008008
	ldr r0, _08008004 @ =0x08B909D4
	movs r1, #3
	bl Proc_Start
	b _08008010
	.align 2, 0
_08008000: .4byte 0x08B909B8
_08008004: .4byte 0x08B909D4
_08008008:
	ldr r0, _08008018 @ =0x08B909D4
	adds r1, r7, #0
	bl Proc_StartBlocking
_08008010:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08008018: .4byte 0x08B909D4

	thumb_func_start StartTalkMsg
StartTalkMsg: @ 0x0800801C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r2, #0
	bl DecodeMsg
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl StartTalkExt
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start StartTalkMsgExt
StartTalkMsgExt: @ 0x0800803C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r2, #0
	adds r6, r3, #0
	bl DecodeMsg
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	adds r3, r6, #0
	bl StartTalkExt
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start StartTalk
StartTalk: @ 0x0800805C
	push {lr}
	movs r3, #0
	bl StartTalkExt
	pop {r1}
	bx r1

	thumb_func_start EndTalk
EndTalk: @ 0x08008068
	push {lr}
	ldr r0, _08008074 @ =0x08B909D4
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08008074: .4byte 0x08B909D4

	thumb_func_start SetTalkLines
SetTalkLines: @ 0x08008078
	ldr r1, _08008080 @ =0x08B909B8
	ldr r1, [r1]
	strb r0, [r1, #0xa]
	bx lr
	.align 2, 0
_08008080: .4byte 0x08B909B8

	thumb_func_start ClearAllTalkFlags
ClearAllTalkFlags: @ 0x08008084
	ldr r0, _08008090 @ =0x08B909B8
	ldr r0, [r0]
	adds r0, #0x80
	movs r1, #0
	strh r1, [r0]
	bx lr
	.align 2, 0
_08008090: .4byte 0x08B909B8

