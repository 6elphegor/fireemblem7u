	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AF99C
sub_080AF99C: @ 0x080AF99C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x3c
	mov sb, r0
	movs r0, #0
	str r0, [sp, #0x34]
	add r1, sp, #4
	ldr r0, _080AF9D0 @ =0x084218A8
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	mov r1, sb
	ldr r0, [r1, #0x34]
	ldr r0, [r0, #0x18]
	str r0, [r1, #0x38]
	movs r7, #4
	b _080AF9D6
	.align 2, 0
_080AF9D0: .4byte 0x084218A8
_080AF9D4:
	adds r7, #1
_080AF9D6:
	cmp r7, #7
	bgt _080AF9F2
	mov r2, sb
	ldr r0, [r2, #0x34]
	ldrb r0, [r0, #0xb]
	bl GetClassData
	adds r0, #0x2c
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	beq _080AF9D4
	movs r3, #1
	str r3, [sp, #0x34]
_080AF9F2:
	movs r4, #0
	movs r0, #0
	mov r1, sb
	strh r0, [r1, #0x2a]
	strh r0, [r1, #0x2c]
	adds r1, #0x46
	movs r0, #0xfa
	strb r0, [r1]
	ldr r6, _080AFBD4 @ =0x02022C60
	adds r0, r6, #0
	movs r1, #0
	bl TmFill
	ldr r0, _080AFBD8 @ =0x02023460
	movs r1, #0
	bl TmFill
	ldr r2, _080AFBDC @ =0x02023C60
	mov r8, r2
	mov r0, r8
	movs r1, #0
	bl TmFill
	ldr r5, _080AFBE0 @ =0x03002870
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r3, [r5, #1]
	ands r0, r3
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r5, #1]
	adds r1, r5, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	bl ResetTextFont
	bl ResetText
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r3, [r5, #0xc]
	ands r0, r3
	movs r2, #2
	orrs r0, r2
	strb r0, [r5, #0xc]
	adds r0, r1, #0
	ldrb r4, [r5, #0x10]
	ands r0, r4
	orrs r0, r2
	strb r0, [r5, #0x10]
	ldrb r0, [r5, #0x14]
	ands r1, r0
	orrs r1, r2
	strb r1, [r5, #0x14]
	movs r0, #3
	ldrb r1, [r5, #0x18]
	orrs r0, r1
	strb r0, [r5, #0x18]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r4, _080AFBE4 @ =0x08407440
	movs r0, #3
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r5, #0xc0
	lsls r5, r5, #0x13
	adds r1, r1, r5
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080AFBE8 @ =0x0841F524
	movs r1, #0xa0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080AFBEC @ =0x02024460
	ldr r1, _080AFBF0 @ =0x0841F544
	movs r2, #0xa0
	lsls r2, r2, #8
	bl TmApplyTsa_thm
	ldr r4, _080AFBF4 @ =0x0841EE04
	movs r0, #2
	bl GetBgChrOffset
	adds r1, r0, #0
	adds r1, r1, r5
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080AFBF8 @ =0x0841EFEC
	movs r1, #0x90
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, _080AFBFC @ =0x0841F00C
	movs r2, #0x90
	lsls r2, r2, #8
	mov r0, r8
	bl TmApplyTsa_thm
	movs r0, #0xf
	bl EnableBgSync
	adds r0, r6, #0
	movs r1, #0
	bl TmFill
	mov r2, sb
	ldr r0, [r2, #0x34]
	ldrb r0, [r0, #0xb]
	bl GetClassData
	ldrb r0, [r0, #0xb]
	mov r4, sb
	adds r4, #0x40
	strb r0, [r4]
	mov r3, sb
	ldr r0, [r3, #0x34]
	ldrb r0, [r0, #0xb]
	bl GetClassData
	ldrb r0, [r0, #0xc]
	mov r1, sb
	adds r1, #0x41
	strb r0, [r1]
	mov r1, sb
	ldr r0, [r1, #0x34]
	ldrb r0, [r0, #0xb]
	bl GetClassData
	ldrb r0, [r0, #0xd]
	mov r1, sb
	adds r1, #0x42
	strb r0, [r1]
	mov r2, sb
	ldr r0, [r2, #0x34]
	ldrb r0, [r0, #0xb]
	bl GetClassData
	ldrb r0, [r0, #0xe]
	mov r1, sb
	adds r1, #0x43
	strb r0, [r1]
	mov r3, sb
	ldr r0, [r3, #0x34]
	ldrb r0, [r0, #0xb]
	bl GetClassData
	ldrb r1, [r0, #0xf]
	mov r0, sb
	adds r0, #0x44
	strb r1, [r0]
	mov r1, sb
	ldr r0, [r1, #0x34]
	ldrb r0, [r0, #0xb]
	bl GetClassData
	ldrb r0, [r0, #0x10]
	mov r1, sb
	adds r1, #0x45
	strb r0, [r1]
	movs r7, #0
	str r4, [sp, #0x38]
	movs r2, #0x4a
	adds r2, r2, r6
	mov sl, r2
	adds r6, #0x42
	mov r8, r6
	movs r6, #0
	movs r4, #0
_080AFB98:
	ldr r0, _080AFC00 @ =0x0200FB68
	adds r5, r4, r0
	adds r0, r5, #0
	movs r1, #3
	bl InitText
	adds r0, r5, #0
	bl ClearText
	adds r0, r5, #0
	movs r1, #3
	bl Text_SetColor
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetCursor
	ldr r3, [sp, #0x34]
	cmp r3, #0
	beq _080AFC04
	add r0, sp, #0x1c
	adds r0, r0, r6
	ldr r0, [r0]
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	b _080AFC18
	.align 2, 0
_080AFBD4: .4byte 0x02022C60
_080AFBD8: .4byte 0x02023460
_080AFBDC: .4byte 0x02023C60
_080AFBE0: .4byte 0x03002870
_080AFBE4: .4byte 0x08407440
_080AFBE8: .4byte 0x0841F524
_080AFBEC: .4byte 0x02024460
_080AFBF0: .4byte 0x0841F544
_080AFBF4: .4byte 0x0841EE04
_080AFBF8: .4byte 0x0841EFEC
_080AFBFC: .4byte 0x0841F00C
_080AFC00: .4byte 0x0200FB68
_080AFC04:
	mov r0, sp
	adds r0, r0, r6
	adds r0, #4
	ldr r0, [r0]
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
_080AFC18:
	ldr r0, _080AFD7C @ =0x0200FB68
	adds r0, r4, r0
	mov r1, r8
	bl PutText
	ldr r1, [sp, #0x38]
	adds r0, r1, r7
	ldrb r2, [r0]
	mov r0, sl
	movs r1, #0
	bl PutNumber
	movs r2, #0x80
	add sl, r2
	add r8, r2
	adds r6, #4
	adds r4, #8
	adds r7, #1
	cmp r7, #5
	ble _080AFB98
	movs r5, #0
	mov r0, sb
	bl sub_080B0294
	mov r3, sb
	str r0, [r3, #0x3c]
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #2
	movs r2, #0
	bl InitTalk
	bl SetInitTalkTextFont
	bl ClearTalkText
	bl EndTalk
	mov r4, sb
	ldr r0, [r4, #0x34]
	ldr r2, [r0, #4]
	movs r0, #2
	movs r1, #0xf
	bl StartTalkMsg
	movs r0, #0
	bl SetTalkPrintColor
	movs r0, #1
	bl SetTalkFlag
	movs r0, #2
	bl SetTalkFlag
	movs r0, #4
	bl SetTalkFlag
	movs r0, #8
	bl SetTalkFlag
	movs r0, #0x40
	bl SetTalkFlag
	movs r0, #4
	bl SetTalkPrintDelay
	ldr r0, _080AFD80 @ =0x02000040
	ldr r3, [r4, #0x34]
	movs r1, #0xa
	ldrsb r1, [r3, r1]
	strh r1, [r0, #8]
	movs r1, #0x82
	lsls r1, r1, #1
	strh r1, [r0, #2]
	movs r1, #0x58
	strh r1, [r0, #4]
	ldrb r1, [r3, #0xd]
	strh r1, [r0, #6]
	movs r1, #6
	strh r1, [r0, #0xa]
	ldrb r1, [r3, #0xc]
	strb r1, [r0, #1]
	movs r4, #1
	strh r4, [r0, #0xc]
	movs r1, #0xc0
	lsls r1, r1, #1
	strh r1, [r0, #0xe]
	movs r1, #2
	strh r1, [r0, #0x10]
	ldr r1, _080AFD84 @ =0x02000078
	str r1, [r0, #0x1c]
	ldr r1, _080AFD88 @ =0x02002078
	str r1, [r0, #0x24]
	ldr r1, _080AFD8C @ =0x02007878
	str r1, [r0, #0x20]
	ldr r1, _080AFD90 @ =0x02007918
	str r1, [r0, #0x28]
	ldr r1, _080AFD94 @ =0x0200A318
	str r1, [r0, #0x30]
	ldrb r2, [r3, #0xe]
	strh r2, [r1]
	ldrb r2, [r3, #0xf]
	strh r2, [r1, #2]
	ldrb r2, [r3, #0x10]
	strh r2, [r1, #4]
	ldrb r2, [r3, #0x11]
	strh r2, [r1, #6]
	ldrb r2, [r3, #0x12]
	strh r2, [r1, #8]
	movs r2, #0xa0
	lsls r2, r2, #2
	strh r2, [r1, #0xe]
	movs r3, #0xf
	strh r3, [r1, #0x10]
	subs r2, #0x80
	strh r2, [r1, #0xa]
	strh r3, [r1, #0xc]
	strh r4, [r1, #0x12]
	ldr r2, _080AFD98 @ =0x02023460
	str r2, [r1, #0x14]
	ldr r2, _080AFD9C @ =0x0200A340
	str r2, [r1, #0x18]
	ldr r2, _080AFDA0 @ =0x0200C340
	str r2, [r1, #0x1c]
	ldr r2, _080AFDA4 @ =0x0200CB40
	str r2, [r1, #0x20]
	ldr r2, _080AFDA8 @ =sub_080AF8C4
	str r2, [r1, #0x24]
	bl NewEkrUnitMainMini
	ldr r4, _080AFDAC @ =0x0200DB40
	mov r0, sb
	ldr r1, [r0, #0x34]
	ldrb r0, [r1, #0x13]
	strh r0, [r4]
	movs r0, #0xa
	strh r0, [r4, #2]
	movs r0, #0xe0
	lsls r0, r0, #2
	strh r0, [r4, #4]
	ldrb r0, [r1, #0x14]
	strh r0, [r4, #6]
	movs r0, #0xb
	strh r0, [r4, #8]
	movs r0, #0xf0
	lsls r0, r0, #2
	strh r0, [r4, #0xa]
	strh r5, [r4, #0xc]
	ldr r0, _080AFDB0 @ =0x0000FFFF
	strh r0, [r4, #0xe]
	ldr r0, _080AFDB4 @ =0x06010000
	str r0, [r4, #0x1c]
	ldr r0, _080AFDB8 @ =0x0200DB68
	str r0, [r4, #0x20]
	adds r0, r4, #0
	bl sub_08054F30
	movs r3, #0x98
	lsls r3, r3, #1
	movs r0, #0x68
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xd0
	movs r2, #0x68
	bl sub_08055308
	ldr r0, _080AFDBC @ =sub_080AF864
	bl SetOnHBlankA
	add sp, #0x3c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AFD7C: .4byte 0x0200FB68
_080AFD80: .4byte 0x02000040
_080AFD84: .4byte 0x02000078
_080AFD88: .4byte 0x02002078
_080AFD8C: .4byte 0x02007878
_080AFD90: .4byte 0x02007918
_080AFD94: .4byte 0x0200A318
_080AFD98: .4byte 0x02023460
_080AFD9C: .4byte 0x0200A340
_080AFDA0: .4byte 0x0200C340
_080AFDA4: .4byte 0x0200CB40
_080AFDA8: .4byte sub_080AF8C4
_080AFDAC: .4byte 0x0200DB40
_080AFDB0: .4byte 0x0000FFFF
_080AFDB4: .4byte 0x06010000
_080AFDB8: .4byte 0x0200DB68
_080AFDBC: .4byte sub_080AF864
