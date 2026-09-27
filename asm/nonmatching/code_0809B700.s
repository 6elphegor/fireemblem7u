	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809B700
sub_0809B700: @ 0x0809B700
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r4, _0809B930 @ =0x03002870
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r4]
	ands r0, r1
	strb r0, [r4]
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
	ldrb r2, [r4, #0xc]
	ands r0, r2
	strb r0, [r4, #0xc]
	movs r2, #3
	ldrb r0, [r4, #0x10]
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r5, [r4, #0x14]
	ands r1, r5
	movs r0, #1
	orrs r1, r0
	strb r1, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	orrs r2, r0
	strb r2, [r4, #0x18]
	bl InitFaces
	bl ResetText
	bl InitIcons
	bl UnpackUiWindowFrameGraphics
	bl ApplySystemObjectsGraphics
	movs r0, #0xe
	bl ApplyIconPalettes
	adds r0, r7, #0
	bl sub_0809B670
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r1, _0809B934 @ =0x0000FFD8
	ldr r2, [r7, #0x34]
	subs r2, #0x4c
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	bl SetBgOffset
	bl PrepRestartMuralBackground
	bl ApplyUnitSpritePalettes
	bl ResetUnitSprites
	adds r0, r7, #0
	bl sub_0809B440
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_08091944
	ldr r0, _0809B938 @ =0x02023460
	ldr r1, _0809B93C @ =0x0840EBE8
	movs r2, #0xa5
	lsls r2, r2, #7
	bl sub_080AACD8
	movs r0, #7
	bl EnableBgSync
	bl GetSupportScreenUnitCount
	cmp r0, #0
	beq _0809B826
	adds r0, r7, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	ldr r4, [r7, #0x38]
	adds r0, r4, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r5, r0, #0
	adds r5, #0x14
	adds r0, r4, #0
	movs r1, #3
	bl __divsi3
	ldr r1, [r7, #0x34]
	cmp r1, #0
	bge _0809B812
	adds r1, #0xf
_0809B812:
	asrs r1, r1, #4
	subs r1, r0, r1
	lsls r1, r1, #4
	adds r1, #0x4c
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r5, #0
	movs r2, #7
	bl ShowSysHandCursor
_0809B826:
	ldr r1, _0809B930 @ =0x03002870
	mov ip, r1
	movs r6, #0x20
	ldrb r0, [r1, #1]
	orrs r0, r6
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, ip
	strb r0, [r2, #1]
	mov r0, ip
	adds r0, #0x2d
	movs r5, #0
	mov r8, r5
	mov r1, r8
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x31
	movs r0, #0x4c
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x8c
	strb r0, [r1]
	movs r2, #0x34
	add r2, ip
	mov sb, r2
	movs r0, #1
	ldrb r1, [r2]
	orrs r1, r0
	movs r5, #2
	orrs r1, r5
	movs r2, #4
	orrs r1, r2
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	movs r2, #0x36
	add r2, ip
	mov sl, r2
	ldrb r5, [r2]
	orrs r0, r5
	movs r2, #2
	orrs r0, r2
	subs r2, #7
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	orrs r1, r6
	mov r5, sb
	strb r1, [r5]
	orrs r0, r6
	mov r1, sl
	strb r0, [r1]
	mov r1, ip
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x44
	mov r5, r8
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	adds r1, #0xa
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _0809B940 @ =0x0000FFE0
	mov r1, ip
	ldrh r1, [r1, #0x3c]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	mov r2, ip
	strh r0, [r2, #0x3c]
	adds r6, r7, #0
	adds r6, #0x42
	movs r5, #0x43
	adds r5, r5, r7
	mov r8, r5
	ldr r5, _0809B944 @ =0x020129A8
	movs r4, #0xe
_0809B8D8:
	adds r0, r5, #0
	movs r1, #5
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0809B8D8
	ldr r4, _0809B948 @ =0x02012A90
	adds r0, r4, #0
	movs r1, #5
	bl InitText
	adds r4, #8
	adds r0, r4, #0
	movs r1, #9
	bl InitText
	bl DrawSupportScreenText
	movs r3, #0xa
	rsbs r3, r3, #0
	ldr r0, _0809B94C @ =0x00000901
	str r0, [sp]
	movs r0, #0
	movs r1, #0x41
	movs r2, #0x38
	bl StartBmFace
	movs r0, #0x28
	movs r1, #0
	movs r2, #1
	bl InitTalk
	ldr r0, _0809B950 @ =0x08403A48
	ldr r1, _0809B954 @ =0x06017800
	bl Decompress
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #0
	beq _0809B95C
	ldr r0, _0809B958 @ =0x00000F6F
	b _0809B95E
	.align 2, 0
_0809B930: .4byte 0x03002870
_0809B934: .4byte 0x0000FFD8
_0809B938: .4byte 0x02023460
_0809B93C: .4byte 0x0840EBE8
_0809B940: .4byte 0x0000FFE0
_0809B944: .4byte 0x020129A8
_0809B948: .4byte 0x02012A90
_0809B94C: .4byte 0x00000901
_0809B950: .4byte 0x08403A48
_0809B954: .4byte 0x06017800
_0809B958: .4byte 0x00000F6F
_0809B95C:
	ldr r0, _0809B9B0 @ =0x00000FC4
_0809B95E:
	str r0, [r7, #0x30]
	ldr r0, _0809B9B4 @ =DrawSupportScreenUnitSprites
	adds r1, r7, #0
	bl StartParallelWorker
	adds r0, r7, #0
	bl StartMenuScrollBar
	movs r0, #0x80
	lsls r0, r0, #2
	movs r1, #4
	bl InitMenuScrollBarImg
	movs r0, #0xd8
	movs r1, #0x54
	bl PutMenuScrollBarAt
	ldrh r4, [r7, #0x34]
	bl GetSupportScreenUnitCount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #6
	adds r1, r4, #0
	movs r3, #4
	bl UpdateMenuScrollBarConfig
	bl TryHideMenuScrollBar
	ldr r1, [r7, #0x34]
	cmp r1, #0
	bge _0809B9AC
	adds r1, #0xf
_0809B9AC:
	asrs r4, r1, #4
	b _0809B9C2
	.align 2, 0
_0809B9B0: .4byte 0x00000FC4
_0809B9B4: .4byte DrawSupportScreenUnitSprites
_0809B9B8:
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_0809BE80
	adds r4, #1
_0809B9C2:
	ldr r0, [r7, #0x34]
	cmp r0, #0
	bge _0809B9CA
	adds r0, #0xf
_0809B9CA:
	asrs r0, r0, #4
	adds r0, #4
	cmp r4, r0
	blt _0809B9B8
	adds r0, r7, #0
	bl StartGreenText
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
	ldr r0, _0809BA1C @ =0x06014800
	movs r1, #0xa
	bl LoadHelpBoxGfx
	ldr r2, _0809BA20 @ =0x03002870
	movs r0, #1
	ldrb r5, [r2, #1]
	orrs r0, r5
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #0x10
	movs r1, #0x8c
	adds r2, r7, #0
	bl StartHelpPromptSprite
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809BA1C: .4byte 0x06014800
_0809BA20: .4byte 0x03002870
