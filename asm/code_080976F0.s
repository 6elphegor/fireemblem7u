	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080976F0
sub_080976F0: @ 0x080976F0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, _08097A30 @ =0x03002870
	mov r8, r0
	movs r0, #8
	rsbs r0, r0, #0
	mov r1, r8
	ldrb r1, [r1]
	ands r0, r1
	mov r2, r8
	strb r0, [r2]
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
	mov r3, r8
	ldrb r3, [r3, #0xc]
	ands r0, r3
	movs r4, #1
	orrs r0, r4
	mov r2, r8
	strb r0, [r2, #0xc]
	adds r0, r1, #0
	ldrb r3, [r2, #0x10]
	ands r0, r3
	movs r2, #2
	mov sb, r2
	mov r3, sb
	orrs r0, r3
	mov r2, r8
	strb r0, [r2, #0x10]
	ldrb r3, [r2, #0x14]
	ands r1, r3
	strb r1, [r2, #0x14]
	movs r0, #3
	ldrb r1, [r2, #0x18]
	orrs r0, r1
	strb r0, [r2, #0x18]
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
	adds r0, r7, #0
	adds r0, #0x33
	ldrb r0, [r0]
	lsls r1, r0, #1
	adds r0, r7, #0
	adds r0, #0x4a
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	ldr r0, _08097A34 @ =0x06012000
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
	ldr r0, _08097A38 @ =0x02023460
	ldr r1, _08097A3C @ =0x0840E780
	movs r2, #0xa5
	lsls r2, r2, #7
	bl sub_080AACD8
	movs r0, #7
	bl EnableBgSync
	adds r0, r7, #0
	bl StartUiCursorHand
	adds r0, r7, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	movs r0, #0x20
	mov r2, r8
	ldrb r2, [r2, #1]
	orrs r0, r2
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r3, r8
	strb r0, [r3, #1]
	mov r1, r8
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
	mov r2, r8
	adds r2, #0x34
	ldrb r0, [r2]
	orrs r0, r4
	mov r1, sb
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r5, #8
	orrs r0, r5
	movs r3, #0x10
	orrs r0, r3
	strb r0, [r2]
	mov r1, r8
	adds r1, #0x36
	ldrb r2, [r1]
	orrs r4, r2
	mov r0, sb
	orrs r4, r0
	movs r0, #5
	rsbs r0, r0, #0
	ands r4, r0
	orrs r4, r5
	orrs r4, r3
	strb r4, [r1]
	adds r0, r7, #0
	bl StartGreenText
	movs r0, #0xc8
	movs r1, #0x90
	adds r2, r7, #0
	bl StartHelpPromptSprite
	ldr r4, _08097A40 @ =0x02012B68
	adds r0, r4, #0
	movs r1, #6
	bl InitText
	adds r0, r4, #0
	adds r0, #8
	movs r1, #5
	bl InitText
	adds r0, r4, #0
	adds r0, #0x78
	movs r1, #4
	bl InitText
	adds r4, #0x10
	movs r5, #4
_0809788C:
	adds r0, r4, #0
	movs r1, #7
	bl InitText
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _0809788C
	movs r1, #0x33
	adds r1, r1, r7
	mov r8, r1
	adds r6, r7, #0
	adds r6, #0x4a
	ldr r4, _08097A44 @ =0x02012BA0
	movs r5, #7
_080978AA:
	adds r0, r4, #0
	movs r1, #7
	bl InitTextDb
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _080978AA
	movs r4, #0x80
	lsls r4, r4, #7
	adds r0, r4, #0
	movs r1, #6
	bl StoreConvoyWeaponIconGraphics
	ldr r2, _08097A48 @ =0x02022D3E
	mov sb, r2
	mov r0, sb
	adds r1, r4, #0
	movs r2, #6
	bl sub_08096260
	ldr r0, _08097A4C @ =0x08405754
	ldr r1, _08097A50 @ =0x06015000
	bl Decompress
	adds r0, r7, #0
	bl StartMenuScrollBar
	movs r0, #0xb0
	lsls r0, r0, #7
	movs r1, #4
	bl InitMenuScrollBarImg
	movs r0, #0xe2
	movs r1, #0x30
	bl PutMenuScrollBarAt
	bl TryHideMenuScrollBar
	ldr r0, [r7, #0x2c]
	mov r3, r8
	ldrb r1, [r3]
	movs r2, #3
	bl SomethingPrepListRelated
	adds r0, r7, #0
	bl sub_08097DD4
	ldr r5, _08097A44 @ =0x02012BA0
	ldr r1, _08097A54 @ =0x02023C7E
	mov r2, r8
	ldrb r2, [r2]
	lsls r0, r2, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	lsrs r2, r0, #4
	ldr r3, [r7, #0x2c]
	adds r0, r5, #0
	bl sub_08095CA8
	movs r0, #4
	bl EnableBgSync
	movs r0, #0xb3
	lsls r0, r0, #1
	add r0, sb
	adds r1, r5, #0
	subs r1, #0x28
	ldr r2, [r7, #0x2c]
	movs r3, #0
	bl DrawPrepScreenItems
	bl sub_08097554
	adds r0, r7, #0
	bl StartUiSpinningArrows
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r0, #0
	movs r2, #2
	bl LoadUiSpinningArrowGfx
	movs r0, #0x78
	movs r1, #0x18
	movs r2, #0xea
	movs r3, #0x18
	bl SetUiSpinningArrowPositions
	movs r0, #3
	bl SetUiSpinningArrowConfig
	ldr r0, _08097A58 @ =sub_08097660
	adds r1, r7, #0
	bl StartParallelWorker
	ldr r0, [r7, #0x2c]
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r3, #4
	rsbs r3, r3, #0
	ldr r0, _08097A5C @ =0x00000203
	str r0, [sp]
	movs r0, #0
	movs r2, #0x40
	bl StartBmFace
	ldr r0, [r7, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	mov r8, r0
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [sp]
	str r7, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl StartSysBrownBox
	movs r1, #0x28
	rsbs r1, r1, #0
	movs r2, #1
	rsbs r2, r2, #0
	movs r0, #0
	movs r3, #1
	bl EnableSysBrownBox
	movs r0, #1
	movs r1, #0x98
	movs r2, #6
	movs r3, #2
	bl EnableSysBrownBox
	ldr r3, _08097A30 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x44
	movs r4, #0
	movs r0, #0xe
	strb r0, [r1]
	adds r1, #1
	movs r0, #4
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r4, [r0]
	ldr r0, _08097A60 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	ldr r1, _08097A64 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #0x30
	mov r1, r8
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	subs r5, #0x38
	str r4, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r5, #0
	ldr r1, _08097A68 @ =0x02022C60
	movs r2, #0
	bl PutDrawText
	adds r0, r7, #0
	bl PrepItemList_DrawCurrentOwnerText
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08097A30: .4byte 0x03002870
_08097A34: .4byte 0x06012000
_08097A38: .4byte 0x02023460
_08097A3C: .4byte 0x0840E780
_08097A40: .4byte 0x02012B68
_08097A44: .4byte 0x02012BA0
_08097A48: .4byte 0x02022D3E
_08097A4C: .4byte 0x08405754
_08097A50: .4byte 0x06015000
_08097A54: .4byte 0x02023C7E
_08097A58: .4byte sub_08097660
_08097A5C: .4byte 0x00000203
_08097A60: .4byte 0x0000FFE0
_08097A64: .4byte 0x0000E0FF
_08097A68: .4byte 0x02022C60
