	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080ACF5C
sub_080ACF5C: @ 0x080ACF5C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0
	bl InitBgs
	ldr r0, _080AD17C @ =0x0840F9A0
	movs r1, #0xc0
	lsls r1, r1, #1
	movs r2, #0x60
	bl ApplyPaletteExt
	ldr r0, _080AD180 @ =0x08418E44
	ldr r1, _080AD184 @ =0x06008000
	bl Decompress
	ldr r0, _080AD188 @ =0x02024460
	ldr r1, _080AD18C @ =0x0840FA00
	movs r2, #0xc0
	lsls r2, r2, #8
	bl TmApplyTsa_thm
	movs r0, #8
	bl EnableBgSync
	bl UnpackUiWindowFrameGraphics
	bl ResetText
	bl InitIcons
	movs r0, #4
	bl ApplyIconPalettes
	bl ApplySystemObjectsGraphics
	bl sub_080ACAF8
	bl sub_080ACF08
	ldr r0, _080AD190 @ =0x03002870
	mov ip, r0
	movs r0, #0x21
	rsbs r0, r0, #0
	mov r1, ip
	ldrb r1, [r1, #1]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, ip
	strb r0, [r2, #1]
	mov r5, ip
	adds r5, #0x35
	movs r1, #1
	ldrb r0, [r5]
	orrs r0, r1
	movs r4, #2
	orrs r0, r4
	movs r2, #4
	orrs r0, r2
	movs r3, #8
	orrs r0, r3
	movs r2, #0x10
	orrs r0, r2
	strb r0, [r5]
	adds r5, #1
	ldrb r0, [r5]
	orrs r1, r0
	orrs r1, r4
	movs r0, #5
	rsbs r0, r0, #0
	ands r1, r0
	orrs r1, r3
	orrs r1, r2
	strb r1, [r5]
	mov r1, ip
	adds r1, #0x2f
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
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r2, ip
	ldrb r2, [r2, #0xc]
	ands r0, r2
	mov r3, ip
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	orrs r0, r4
	strb r0, [r3, #0x10]
	ldrb r3, [r3, #0x14]
	ands r1, r3
	mov r0, ip
	strb r1, [r0, #0x14]
	movs r0, #3
	mov r1, ip
	ldrb r1, [r1, #0x18]
	orrs r0, r1
	mov r2, ip
	strb r0, [r2, #0x18]
	bl InitBonusClaimData
	movs r5, #0
	ldr r0, _080AD194 @ =0x08CE5780
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r5, r0
	bge _080AD086
	ldr r7, _080AD198 @ =0x08CE5784
_080AD058:
	lsls r0, r5, #4
	ldr r4, [r7]
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #7
	bl InitText
	adds r4, #8
	adds r0, r4, #0
	movs r1, #0xa
	bl InitText
	adds r0, r5, #0
	bl DrawBonusClaimItemText
	adds r5, #1
	cmp r5, #5
	bgt _080AD086
	ldr r0, _080AD194 @ =0x08CE5780
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r5, r0
	blt _080AD058
_080AD086:
	adds r3, r6, #0
	adds r3, #0x29
	str r3, [sp]
	movs r0, #0x2e
	adds r0, r0, r6
	mov sl, r0
	movs r1, #0x2a
	adds r1, r1, r6
	mov r8, r1
	movs r2, #0x2b
	adds r2, r2, r6
	mov sb, r2
	ldr r7, _080AD198 @ =0x08CE5784
	movs r4, #0x60
	movs r5, #1
_080AD0A4:
	ldr r0, [r7]
	adds r0, r0, r4
	movs r1, #6
	bl InitText
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _080AD0A4
	movs r5, #2
	ldr r0, _080AD198 @ =0x08CE5784
	ldr r0, [r0]
	adds r0, #0x70
	movs r1, #0xf
	bl InitText
	ldr r0, _080AD19C @ =PutChapterBannerSprites
	adds r1, r6, #0
	bl StartParallelWorker
	movs r0, #2
	bl EnableBgSync
	ldr r0, _080AD1A0 @ =sub_080ACB64
	bl SetOnHBlankA
	movs r0, #0
	ldr r3, [sp]
	strb r0, [r3]
	movs r1, #0
	strh r0, [r6, #0x2c]
	mov r2, sl
	strb r1, [r2]
	mov r3, r8
	strb r1, [r3]
	mov r1, sb
	strb r5, [r1]
	str r0, [r6, #0x34]
	ldr r1, _080AD1A4 @ =0x0000FFC0
	ldrh r2, [r6, #0x2c]
	subs r2, #0x38
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl SetBgOffset
	adds r0, r6, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	ldr r2, [sp]
	ldrb r2, [r2]
	lsls r1, r2, #4
	movs r3, #0x2c
	ldrsh r0, [r6, r3]
	subs r0, #0x38
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x40
	movs r2, #0xd
	bl ShowSysHandCursor
	adds r0, r6, #0
	bl StartGreenText
	adds r0, r6, #0
	bl StartMenuScrollBar
	movs r0, #0xb0
	movs r1, #0x44
	bl PutMenuScrollBarAt
	movs r0, #0x80
	lsls r0, r0, #2
	movs r1, #2
	bl InitMenuScrollBarImg
	ldrh r1, [r6, #0x2c]
	ldr r0, _080AD194 @ =0x08CE5780
	ldr r0, [r0]
	ldrh r2, [r0]
	movs r0, #7
	movs r3, #5
	bl UpdateMenuScrollBarConfig
	adds r0, r6, #0
	bl StartUiCursorHand
	adds r0, r6, #0
	bl SetupBonusClaimTargets
	ldr r0, _080AD1A8 @ =0x06013800
	movs r1, #5
	bl LoadHelpBoxGfx
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AD17C: .4byte 0x0840F9A0
_080AD180: .4byte 0x08418E44
_080AD184: .4byte 0x06008000
_080AD188: .4byte 0x02024460
_080AD18C: .4byte 0x0840FA00
_080AD190: .4byte 0x03002870
_080AD194: .4byte 0x08CE5780
_080AD198: .4byte 0x08CE5784
_080AD19C: .4byte PutChapterBannerSprites
_080AD1A0: .4byte sub_080ACB64
_080AD1A4: .4byte 0x0000FFC0
_080AD1A8: .4byte 0x06013800
