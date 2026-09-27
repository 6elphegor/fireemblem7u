	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08042728
sub_08042728: @ 0x08042728
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r1, _080427C4 @ =0x081D5426
	add r0, sp, #8
	movs r2, #5
	bl memcpy
	ldr r4, _080427C8 @ =0x0203DA0C
	adds r0, r4, #0
	bl sub_080A1F90
	ldrb r4, [r4]
	lsls r0, r4, #0x1c
	lsrs r0, r0, #0x1f
	adds r5, r6, #0
	adds r5, #0x59
	movs r4, #0
	strb r0, [r5]
	bl sub_08047B34
	ldr r0, _080427CC @ =0x081C50C4
	ldr r1, _080427D0 @ =0x06014800
	bl Decompress
	ldr r0, _080427D4 @ =0x081C7EA4
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x60
	bl ApplyPaletteExt
	movs r0, #0
	movs r1, #4
	bl sub_08047BD4
	ldr r0, _080427D8 @ =0x0203DA60
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	bl sub_0803DCF0
	str r4, [r6, #0x4c]
	bl IsMultiArenaSaveReady
	adds r2, r6, #0
	adds r2, #0x58
	strb r0, [r2]
	adds r1, r6, #0
	adds r1, #0x40
	movs r0, #1
	strb r0, [r1]
	movs r1, #0
	ldrsb r1, [r2, r1]
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r6, #0
	adds r0, #0x41
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _080427DC
	movs r1, #0
	movs r0, #3
	b _080427E0
	.align 2, 0
_080427C4: .4byte 0x081D5426
_080427C8: .4byte 0x0203DA0C
_080427CC: .4byte 0x081C50C4
_080427D0: .4byte 0x06014800
_080427D4: .4byte 0x081C7EA4
_080427D8: .4byte 0x0203DA60
_080427DC:
	movs r1, #1
	movs r0, #4
_080427E0:
	str r0, [r6, #0x50]
	adds r0, r6, #0
	adds r0, #0x44
	strb r1, [r0]
	ldr r0, _080428AC @ =0x0203D90C
	ldrb r0, [r0, #1]
	str r0, [r6, #0x48]
	adds r2, r6, #0
	adds r2, #0x40
	adds r0, r2, r0
	movs r1, #2
	strb r1, [r0]
	ldr r1, [r6, #0x48]
	lsls r1, r1, #1
	movs r5, #4
	mov sb, r2
	ldr r2, _080428B0 @ =0x081D541C
	adds r0, r1, #1
	adds r0, r0, r2
	mov r8, r0
	adds r4, r6, #0
	adds r4, #0x3c
	adds r1, r1, r2
	mov sl, r1
_08042810:
	lsls r3, r5, #0x18
	lsrs r3, r3, #0x18
	mov r1, sb
	adds r0, r1, r5
	ldrb r0, [r0]
	str r0, [sp]
	adds r0, r6, #0
	mov r2, sl
	ldrb r1, [r2]
	mov r7, r8
	ldrb r2, [r7]
	bl StartSioMenuItem
	str r0, [r4]
	subs r4, #4
	subs r5, #1
	cmp r5, #0
	bge _08042810
	ldr r0, [r6, #0x2c]
	movs r1, #0
	bl StartLinkArenaTitleBanner
	ldr r1, _080428B0 @ =0x081D541C
	ldr r0, [r6, #0x48]
	lsls r0, r0, #1
	adds r0, #1
	adds r0, r0, r1
	ldrb r3, [r0]
	adds r3, #8
	movs r4, #0
	str r4, [sp]
	ldr r0, [r6, #0x2c]
	str r0, [sp, #4]
	add r0, sp, #8
	movs r1, #5
	movs r2, #0
	bl sub_08047E84
	ldr r0, _080428B4 @ =0x08B99620
	bl SetFaceConfig
	movs r0, #2
	str r0, [sp]
	movs r0, #3
	movs r1, #0xdf
	movs r2, #0xd0
	movs r3, #0x50
	bl StartFace
	adds r0, r6, #0
	movs r1, #0
	bl SioMenu_GetItemHelpText
	movs r1, #0
	bl PutSioText
	adds r0, r6, #0
	movs r1, #1
	bl SioMenu_GetItemHelpText
	movs r1, #1
	bl PutSioText
	bl sub_08044FFC
	movs r0, #0x47
	movs r1, #0
	bl StartBgm
	str r4, [r6, #0x54]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080428AC: .4byte 0x0203D90C
_080428B0: .4byte 0x081D541C
_080428B4: .4byte 0x08B99620
