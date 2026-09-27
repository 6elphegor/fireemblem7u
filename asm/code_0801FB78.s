	.include "macro.inc"

	.syntax unified

	thumb_func_start ChapterIntro_InitMapDisplay
ChapterIntro_InitMapDisplay: @ 0x0801FB78
	push {r4, r5, lr}
	ldr r3, _0801FC4C @ =0x03002870
	movs r0, #1
	ldrb r1, [r3, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r3, #1]
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
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	ldr r0, _0801FC50 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #2
	orrs r0, r1
	ldr r1, _0801FC54 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	adds r1, r3, #0
	adds r1, #0x3d
	movs r0, #0x20
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _0801FC58 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	bl DisableTilesetPalAnim
	ldr r4, _0801FC5C @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl UnpackChapterMapGraphics
	bl ApplyUnitSpritePalettes
	bl ApplySystemObjectsGraphics
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	ldrb r0, [r0, #0x10]
	lsls r0, r0, #4
	bl GetCameraCenteredX
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r0, #0xf
	movs r1, #0xf8
	lsls r1, r1, #1
	ands r0, r1
	ldr r5, _0801FC60 @ =0x0202BBB8
	strh r0, [r5, #0xc]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #4
	bl GetCameraCenteredY
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r0, #0xf
	movs r1, #0xfc
	lsls r1, r1, #2
	ands r0, r1
	strh r0, [r5, #0xe]
	bl RefreshEntityMaps
	bl RenderMap
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801FC4C: .4byte 0x03002870
_0801FC50: .4byte 0x0000FFE0
_0801FC54: .4byte 0x0000E0FF
_0801FC58: .4byte 0x02023C60
_0801FC5C: .4byte 0x0202BBF8
_0801FC60: .4byte 0x0202BBB8
