	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809A9A8
sub_0809A9A8: @ 0x0809A9A8
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	bl GetChapterDivinationPortrait
	adds r6, r0, #0
	ldr r4, _0809AAD8 @ =0x03002870
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
	adds r0, r1, #0
	ldrb r2, [r4, #0x10]
	ands r0, r2
	movs r2, #2
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	strb r1, [r4, #0x14]
	movs r0, #3
	ldrb r1, [r4, #0x18]
	orrs r0, r1
	strb r0, [r4, #0x18]
	bl InitFaces
	bl ResetText
	bl InitIcons
	bl UnpackUiWindowFrameGraphics
	bl ApplySystemObjectsGraphics
	ldr r2, _0809AADC @ =0x0000FFFC
	movs r0, #0
	movs r1, #4
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #4
	bl ApplyIconPalettes
	bl PrepRestartMuralBackground
	movs r0, #7
	bl EnableBgSync
	adds r0, r5, #0
	bl StartGreenText
	ldr r0, _0809AAE0 @ =0x02012A90
	movs r1, #8
	bl InitText
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r0, #0
	str r0, [sp]
	str r5, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl StartSysBrownBox
	movs r0, #0
	movs r1, #0x90
	movs r2, #0x10
	movs r3, #0
	bl EnableSysBrownBox
	movs r0, #0xe0
	lsls r0, r0, #7
	movs r1, #1
	bl sub_0809A924
	ldr r4, _0809AAE4 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r2, [r4, #0x1b]
	cmp r2, #3
	bne _0809AAA0
	movs r1, #1
_0809AAA0:
	adds r0, #0x84
	adds r0, r0, r1
	ldrb r0, [r0]
	str r0, [r5, #0x30]
	movs r0, #0xf0
	lsls r0, r0, #7
	movs r1, #2
	bl DrawAtMenuUpfx
	ldr r0, _0809AAE8 @ =sub_0809A8E4
	adds r1, r5, #0
	bl StartParallelWorker
	movs r0, #0x80
	lsls r0, r0, #2
	movs r1, #3
	movs r2, #1
	bl InitTalk
	ldrb r0, [r4, #0xe]
	cmp r0, #0x2e
	bne _0809AAEC
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b _0809AB1C
	.align 2, 0
_0809AAD8: .4byte 0x03002870
_0809AADC: .4byte 0x0000FFFC
_0809AAE0: .4byte 0x02012A90
_0809AAE4: .4byte 0x0202BBF8
_0809AAE8: .4byte sub_0809A8E4
_0809AAEC:
	cmp r6, #0x4b
	bne _0809AAF8
	movs r0, #0x99
	bl SetFlag
	b _0809AB1C
_0809AAF8:
	movs r0, #0x99
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809AB1C
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	cmp r0, #0x2a
	bgt _0809AB1C
	movs r6, #0x4b
	movs r0, #0x99
	bl ClearFlag
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
_0809AB1C:
	ldr r3, _0809AB34 @ =0x00000202
	movs r0, #0
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #0xd4
	movs r2, #0x52
	bl StartTalkFace
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809AB34: .4byte 0x00000202
