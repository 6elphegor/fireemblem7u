	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08041C5C
sub_08041C5C: @ 0x08041C5C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	ldr r1, _08041E80 @ =0x081D53D3
	add r0, sp, #8
	movs r2, #7
	bl memcpy
	bl ClearSioBG
	bl sub_08047B34
	ldr r4, _08041E84 @ =0x081C6A18
	movs r0, #1
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, _08041E88 @ =0x06000C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _08041E8C @ =0x081C7FC4
	movs r1, #0x80
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r0, _08041E90 @ =0x081C7F84
	movs r1, #0xc0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08041E94 @ =0x081C5BE0
	ldr r1, _08041E98 @ =0x06014800
	bl Decompress
	ldr r0, _08041E9C @ =0x081C7B4C
	ldr r1, _08041EA0 @ =0x06016000
	bl Decompress
	ldr r0, _08041EA4 @ =0x081C80E4
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #0
	movs r1, #0
	bl sub_08047BD4
	ldr r0, _08041EA8 @ =0x02023D62
	ldr r1, _08041EAC @ =0x081C87A0
	movs r2, #0x80
	lsls r2, r2, #5
	bl TmApplyTsa_thm
	ldr r0, _08041EB0 @ =0x0203DA60
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	adds r1, r7, #0
	adds r1, #0x34
	movs r4, #0
	movs r0, #5
	strb r0, [r1]
	movs r1, #0
	movs r0, #0x8c
	lsls r0, r0, #1
	strh r0, [r7, #0x36]
	adds r0, r7, #0
	adds r0, #0x39
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	ldr r0, [r7, #0x3c]
	bl sub_08041C44
	adds r1, r7, #0
	adds r1, #0x35
	strb r0, [r1]
	str r4, [r7, #0x40]
	ldrh r2, [r7, #0x36]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r5, _08041EB4 @ =0x0203DA10
	movs r4, #9
_08041D1A:
	adds r0, r5, #0
	movs r1, #0x18
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _08041D1A
	ldr r4, _08041EB8 @ =0x0203DC08
	adds r0, r4, #0
	movs r1, #0x18
	bl InitText
	adds r0, r4, #0
	adds r0, #8
	movs r1, #0x18
	bl InitText
	adds r0, r4, #0
	bl ClearText
	ldr r0, _08041EBC @ =0x0000077F
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
	ldr r0, _08041EC0 @ =0x00000781
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x78
	movs r2, #0
	bl Text_InsertDrawString
	ldr r0, _08041EC4 @ =0x00000782
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x96
	movs r2, #0
	bl Text_InsertDrawString
	ldr r1, _08041EC8 @ =0x02022DAA
	adds r0, r4, #0
	bl PutText
	ldr r0, _08041ECC @ =0x0203DB68
	bl sub_080A1F2C
	bl sub_08041880
	ldr r1, _08041ED0 @ =0x03002870
	mov ip, r1
	movs r0, #0x20
	ldrb r2, [r1, #1]
	orrs r0, r2
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	mov r0, ip
	adds r0, #0x2d
	movs r2, #0
	mov r8, r2
	mov r1, r8
	strb r1, [r0]
	adds r0, #4
	movs r2, #0x38
	mov sl, r2
	mov r1, sl
	strb r1, [r0]
	subs r0, #5
	movs r6, #0xf0
	strb r6, [r0]
	mov r1, ip
	adds r1, #0x30
	movs r0, #0x88
	strb r0, [r1]
	mov r3, ip
	adds r3, #0x34
	movs r2, #1
	ldrb r0, [r3]
	orrs r0, r2
	movs r1, #2
	orrs r0, r1
	movs r5, #4
	orrs r0, r5
	movs r4, #8
	orrs r0, r4
	movs r1, #0x10
	mov sb, r1
	mov r1, sb
	orrs r0, r1
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x2f
	mov r1, r8
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x33
	movs r0, #0x18
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2e
	strb r6, [r0]
	adds r0, #4
	mov r1, sl
	strb r1, [r0]
	mov r6, ip
	adds r6, #0x35
	ldrb r0, [r6]
	orrs r0, r2
	movs r3, #3
	rsbs r3, r3, #0
	ands r0, r3
	orrs r0, r5
	orrs r0, r4
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r6]
	mov r0, ip
	adds r0, #0x36
	ldrb r1, [r0]
	orrs r2, r1
	ands r2, r3
	orrs r2, r5
	orrs r2, r4
	mov r1, sb
	orrs r2, r1
	strb r2, [r0]
	ldr r0, _08041ED4 @ =0x0203D90C
	ldrb r0, [r0]
	str r0, [sp]
	str r7, [sp, #4]
	add r0, sp, #8
	movs r1, #7
	movs r2, #0
	movs r3, #8
	bl sub_08047E84
	ldr r1, [r7, #0x3c]
	lsls r1, r1, #4
	subs r1, #0x18
	movs r0, #0xe
	adds r2, r7, #0
	bl sub_080491F0
	str r0, [r7, #0x2c]
	movs r0, #0xf
	bl EnableBgSync
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041E80: .4byte 0x081D53D3
_08041E84: .4byte 0x081C6A18
_08041E88: .4byte 0x06000C00
_08041E8C: .4byte 0x081C7FC4
_08041E90: .4byte 0x081C7F84
_08041E94: .4byte 0x081C5BE0
_08041E98: .4byte 0x06014800
_08041E9C: .4byte 0x081C7B4C
_08041EA0: .4byte 0x06016000
_08041EA4: .4byte 0x081C80E4
_08041EA8: .4byte 0x02023D62
_08041EAC: .4byte 0x081C87A0
_08041EB0: .4byte 0x0203DA60
_08041EB4: .4byte 0x0203DA10
_08041EB8: .4byte 0x0203DC08
_08041EBC: .4byte 0x0000077F
_08041EC0: .4byte 0x00000781
_08041EC4: .4byte 0x00000782
_08041EC8: .4byte 0x02022DAA
_08041ECC: .4byte 0x0203DB68
_08041ED0: .4byte 0x03002870
_08041ED4: .4byte 0x0203D90C
