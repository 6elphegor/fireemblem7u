	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08098908
sub_08098908: @ 0x08098908
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r0
	ldr r7, _08098B54 @ =0x03002870
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r7]
	ands r0, r1
	strb r0, [r7]
	movs r0, #0
	bl InitBgs
	movs r0, #0
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r7, #0xc]
	ands r0, r2
	strb r0, [r7, #0xc]
	adds r0, r1, #0
	ldrb r3, [r7, #0x10]
	ands r0, r3
	movs r6, #2
	mov r8, r6
	mov r2, r8
	orrs r0, r2
	strb r0, [r7, #0x10]
	ldrb r3, [r7, #0x14]
	ands r1, r3
	strb r1, [r7, #0x14]
	movs r0, #3
	ldrb r6, [r7, #0x18]
	orrs r0, r6
	strb r0, [r7, #0x18]
	bl InitFaces
	bl ResetText
	bl InitIcons
	bl UnpackUiWindowFrameGraphics
	bl ApplySystemObjectsGraphics
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
	ldr r0, _08098B58 @ =0x06012800
	movs r1, #1
	rsbs r1, r1, #0
	bl LoadHelpBoxGfx
	movs r0, #4
	bl ApplyIconPalettes
	bl PrepRestartMuralBackground
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_08091944
	movs r0, #0x80
	lsls r0, r0, #7
	movs r1, #0xa
	bl sub_08091994
	ldr r0, _08098B5C @ =0x02023460
	ldr r1, _08098B60 @ =0x0840E6AC
	movs r2, #0xa5
	lsls r2, r2, #7
	bl sub_080AACD8
	movs r0, #7
	bl EnableBgSync
	mov r1, sb
	ldr r0, [r1, #0x2c]
	bl GetUnitPortraitId
	adds r1, r0, #0
	ldr r0, _08098B64 @ =0x00000503
	str r0, [sp]
	movs r0, #0
	movs r2, #0x44
	movs r3, #0x4a
	bl StartBmFace
	mov r0, sb
	bl StartUiCursorHand
	mov r0, sb
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	movs r5, #0x20
	ldrb r0, [r7, #1]
	orrs r0, r5
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	adds r1, r7, #0
	adds r1, #0x2d
	movs r0, #0x80
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xe0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	movs r2, #0x34
	adds r2, r2, r7
	mov sl, r2
	movs r0, #1
	ldrb r1, [r2]
	orrs r1, r0
	mov r3, r8
	orrs r1, r3
	movs r2, #4
	orrs r1, r2
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	movs r6, #0x36
	adds r6, r6, r7
	mov ip, r6
	ldrb r2, [r6]
	orrs r0, r2
	mov r6, r8
	orrs r0, r6
	movs r2, #5
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	orrs r1, r5
	mov r2, sl
	strb r1, [r2]
	orrs r0, r5
	mov r3, ip
	strb r0, [r3]
	adds r1, r7, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r6, [r1]
	ands r0, r6
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x44
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	mov r0, sb
	bl StartGreenText
	movs r0, #0xc8
	movs r1, #0x90
	mov r2, sb
	bl StartHelpPromptSprite
	ldr r4, _08098B68 @ =0x02012B68
	adds r0, r4, #0
	movs r1, #4
	bl InitText
	adds r0, r4, #0
	adds r0, #8
	movs r1, #2
	bl InitText
	bl sub_08098660
	adds r4, #0x10
	movs r5, #4
_08098AC4:
	adds r0, r4, #0
	movs r1, #7
	bl InitText
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _08098AC4
	movs r0, #0
	bl SetOnHBlankA
	ldr r0, _08098B6C @ =sub_08098618
	bl SetOnHBlankA
	movs r0, #4
	bl EnableBgSync
	ldr r0, _08098B70 @ =0x02022EA4
	ldr r1, _08098B74 @ =0x02012B78
	mov r3, sb
	ldr r2, [r3, #0x2c]
	movs r3, #0
	bl DrawPrepScreenItems
	bl sub_080988A8
	ldr r0, _08098B78 @ =sub_08098790
	mov r1, sb
	bl StartParallelWorker
	mov r6, sb
	ldr r0, [r6, #0x2c]
	mov r1, sb
	adds r1, #0x30
	ldrb r1, [r1]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl WmSell_DrawItemGoldValue
	bl sub_08098868
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r0, #0
	str r0, [sp]
	str r6, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl StartSysBrownBox
	movs r0, #0
	movs r1, #1
	bl SetSysBrownBoxWidth
	movs r0, #0
	movs r1, #0x88
	movs r2, #0x36
	movs r3, #2
	bl EnableSysBrownBox
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08098B54: .4byte 0x03002870
_08098B58: .4byte 0x06012800
_08098B5C: .4byte 0x02023460
_08098B60: .4byte 0x0840E6AC
_08098B64: .4byte 0x00000503
_08098B68: .4byte 0x02012B68
_08098B6C: .4byte sub_08098618
_08098B70: .4byte 0x02022EA4
_08098B74: .4byte 0x02012B78
_08098B78: .4byte sub_08098790
