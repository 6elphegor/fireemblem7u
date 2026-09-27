	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809CC30
sub_0809CC30: @ 0x0809CC30
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, _0809CDB4 @ =0x03002870
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r4]
	ands r0, r1
	strb r0, [r4]
	movs r0, #0
	bl InitBgs
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r4, #0xc]
	ands r0, r2
	movs r3, #1
	orrs r0, r3
	strb r0, [r4, #0xc]
	movs r2, #3
	ldrb r0, [r4, #0x10]
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	orrs r1, r3
	strb r1, [r4, #0x14]
	ldrb r1, [r4, #0x18]
	orrs r2, r1
	strb r2, [r4, #0x18]
	bl ResetText
	bl InitIcons
	bl UnpackUiWindowFrameGraphics
	bl ApplySystemObjectsGraphics
	bl ApplyUnitSpritePalettes
	bl sub_0809CBD8
	movs r0, #0xd
	bl ApplyIconPalettes
	adds r0, r5, #0
	bl StartGreenText
	adds r0, r5, #0
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0809CCFC
	ldr r2, _0809CDB8 @ =0x0202BBF8
	adds r2, #0x40
	movs r0, #0x61
	rsbs r0, r0, #0
	ldrb r4, [r2]
	ands r0, r4
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	adds r0, r5, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	movs r0, #1
	bl ConfigSysHandCursorShadowEnabled
	adds r1, r5, #0
	adds r1, #0x3a
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809CCFC
	adds r0, r5, #0
	adds r0, #0x39
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	lsls r0, r0, #3
	adds r0, #0xc4
	lsrs r1, r1, #2
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x18
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #1
	bl ShowSysHandCursor
_0809CCFC:
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
	ldr r3, _0809CDB4 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r6, #0
	strb r6, [r0]
	adds r0, #1
	strb r6, [r0]
	adds r0, #1
	strb r6, [r0]
	ldr r0, _0809CDBC @ =0x0000FFE0
	ldrh r4, [r3, #0x3c]
	ands r0, r4
	ldr r1, _0809CDC0 @ =0x0000E0FF
	ands r0, r1
	movs r4, #0x80
	lsls r4, r4, #4
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r1, #0x21
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r4, [r2]
	ands r0, r4
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x3d
	ldrb r2, [r0]
	ands r1, r2
	strb r1, [r0]
	bl PrepRestartMuralBackground
	movs r0, #0x80
	lsls r0, r0, #7
	movs r1, #5
	bl sub_08091944
	ldr r0, _0809CDC4 @ =0x02023460
	ldr r1, _0809CDC8 @ =0x0840ECC4
	movs r2, #0xa4
	lsls r2, r2, #7
	bl sub_080AACD8
	ldr r4, _0809CDCC @ =0x08BDCE4C
	ldr r0, [r5, #0x2c]
	bl GetSupportScreenCharIdAt
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r4
	ldrh r4, [r0, #6]
	adds r0, r4, #0
	bl ShouldFaceBeRaised
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809CDD0
	adds r0, r5, #0
	adds r0, #0x3f
	strb r6, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x38
	movs r3, #0
	bl StartBmFace
	b _0809CDE8
	.align 2, 0
_0809CDB4: .4byte 0x03002870
_0809CDB8: .4byte 0x0202BBF8
_0809CDBC: .4byte 0x0000FFE0
_0809CDC0: .4byte 0x0000E0FF
_0809CDC4: .4byte 0x02023460
_0809CDC8: .4byte 0x0840ECC4
_0809CDCC: .4byte 0x08BDCE4C
_0809CDD0:
	adds r1, r5, #0
	adds r1, #0x3f
	movs r0, #8
	strb r0, [r1]
	adds r0, #0xfc
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x38
	movs r3, #8
	bl StartBmFace
_0809CDE8:
	ldr r0, _0809CE20 @ =0x0840EDB8
	ldr r1, _0809CE24 @ =0x06017000
	bl Decompress
	ldr r0, _0809CE28 @ =0x0840E40C
	ldr r1, _0809CE2C @ =0x06017800
	bl Decompress
	ldr r0, _0809CE30 @ =0x0840E4EC
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r0, r5, #0
	bl sub_0809CAB8
	adds r0, r5, #0
	bl DrawSupportSubScreenRemainingText
	ldr r0, _0809CE34 @ =sub_0809C544
	adds r1, r5, #0
	bl StartParallelWorker
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809CE20: .4byte 0x0840EDB8
_0809CE24: .4byte 0x06017000
_0809CE28: .4byte 0x0840E40C
_0809CE2C: .4byte 0x06017800
_0809CE30: .4byte 0x0840E4EC
_0809CE34: .4byte sub_0809C544
