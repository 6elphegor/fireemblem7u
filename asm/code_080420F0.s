	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080420F0
sub_080420F0: @ 0x080420F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	mov r8, r0
	add r6, sp, #0xc
	ldr r1, _08042264 @ =0x081D53E4
	adds r0, r6, #0
	movs r2, #0xe
	bl memcpy
	bl ClearSioBG
	bl sub_08047B34
	ldr r4, _08042268 @ =0x081C6A18
	movs r0, #1
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, _0804226C @ =0x06000C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _08042270 @ =0x081C7F84
	movs r1, #0xc0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08042274 @ =0x081C5BE0
	ldr r1, _08042278 @ =0x06014800
	bl Decompress
	ldr r0, _0804227C @ =0x081C7F04
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x80
	bl ApplyPaletteExt
	movs r0, #0
	bl sub_08047C38
	ldr r0, _08042280 @ =0x0203DA60
	bl SetTextFont
	bl ResetTextFont
	bl sub_0803DCF0
	movs r0, #0
	mov r1, r8
	str r0, [r1, #0x30]
	mov r0, r8
	bl StartRuleSettingSpriteDrawInteractive
	mov r2, r8
	str r0, [r2, #0x2c]
	movs r0, #1
	movs r1, #0xfe
	movs r2, #0
	bl SetBgOffset
	add r0, sp, #8
	bl sub_08041FD4
	mov r3, r8
	ldr r0, [r3, #0x2c]
	ldr r4, [r3, #0x30]
	movs r2, #0x30
	ldrsh r1, [r3, r2]
	ldr r5, _08042284 @ =0x081D5358
	mov r3, sp
	adds r3, r3, r4
	adds r3, #8
	lsls r2, r4, #2
	adds r2, r2, r4
	ldrb r3, [r3]
	adds r2, r3, r2
	lsls r2, r2, #2
	adds r3, r5, #4
	adds r2, r2, r3
	ldr r2, [r2]
	lsls r2, r2, #0x13
	asrs r2, r2, #0x10
	lsls r3, r4, #1
	adds r3, r3, r4
	lsls r3, r3, #0x13
	movs r4, #0xc0
	lsls r4, r4, #0xe
	adds r3, r3, r4
	asrs r3, r3, #0x10
	bl UpdateRuleSettingSprites
	movs r7, #0
	mov sl, r6
	movs r6, #0xc0
	lsls r6, r6, #1
_080421B8:
	lsls r4, r7, #3
	ldr r0, _08042288 @ =0x0203D918
	mov sb, r0
	add r4, sb
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	ldr r0, [r5]
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	ldr r1, _0804228C @ =0x02022C6C
	adds r1, r6, r1
	adds r0, r4, #0
	bl PutText
	mov r0, sp
	adds r0, r0, r7
	adds r0, #8
	ldrb r1, [r0]
	adds r0, r7, #0
	bl sub_0804203C
	adds r6, #0xc0
	adds r5, #0x14
	adds r7, #1
	cmp r7, #2
	ble _080421B8
	ldr r5, _08042284 @ =0x081D5358
	ldr r0, [r5, #0x18]
	lsls r0, r0, #1
	ldr r4, _08042290 @ =0x0202369C
	adds r0, r0, r4
	movs r1, #0
	bl sub_080417BC
	ldr r0, [r5, #0x1c]
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #1
	bl sub_080417BC
	mov r1, r8
	ldr r0, [r1, #0x2c]
	movs r1, #6
	bl sub_08047D80
	mov r0, sb
	subs r0, #0xc
	ldrb r0, [r0]
	str r0, [sp]
	mov r2, r8
	ldr r0, [r2, #0x2c]
	str r0, [sp, #4]
	mov r0, sl
	movs r1, #0xe
	movs r2, #0
	movs r3, #8
	bl sub_08047E84
	mov r3, r8
	ldr r0, [r3, #0x30]
	ldr r4, _08042294 @ =0x000003C3
	adds r0, r0, r4
	movs r1, #1
	bl PutSioText
	movs r0, #0xf
	bl EnableBgSync
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08042264: .4byte 0x081D53E4
_08042268: .4byte 0x081C6A18
_0804226C: .4byte 0x06000C00
_08042270: .4byte 0x081C7F84
_08042274: .4byte 0x081C5BE0
_08042278: .4byte 0x06014800
_0804227C: .4byte 0x081C7F04
_08042280: .4byte 0x0203DA60
_08042284: .4byte 0x081D5358
_08042288: .4byte 0x0203D918
_0804228C: .4byte 0x02022C6C
_08042290: .4byte 0x0202369C
_08042294: .4byte 0x000003C3
