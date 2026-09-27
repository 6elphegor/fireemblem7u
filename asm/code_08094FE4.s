	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08094FE4
sub_08094FE4: @ 0x08094FE4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	adds r7, r0, #0
	add r1, sp, #8
	ldr r0, _080952EC @ =0x0840F3F0
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r5, r6}
	stm r1!, {r2, r5, r6}
	ldm r0!, {r3, r4}
	stm r1!, {r3, r4}
	ldr r4, _080952F0 @ =0x03002870
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r5, [r4]
	ands r0, r5
	strb r0, [r4]
	ldr r0, _080952F4 @ =0x08CC3B18
	bl InitBgs
	add r0, sp, #8
	bl SetFaceConfig
	movs r0, #0xff
	str r0, [r7, #0x34]
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
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r6, [r4, #0xc]
	ands r0, r6
	movs r1, #1
	orrs r0, r1
	strb r0, [r4, #0xc]
	adds r0, r2, #0
	ldrb r1, [r4, #0x10]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r4, #0x10]
	ldrb r3, [r4, #0x14]
	ands r2, r3
	strb r2, [r4, #0x14]
	movs r0, #3
	ldrb r5, [r4, #0x18]
	orrs r0, r5
	strb r0, [r4, #0x18]
	bl ResetText
	bl InitIcons
	bl UnpackUiWindowFrameGraphics
	bl ApplySystemObjectsGraphics
	bl ApplyUnitSpritePalettes
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
	ldr r0, _080952F8 @ =0x06014000
	movs r1, #1
	rsbs r1, r1, #0
	bl LoadHelpBoxGfx
	movs r0, #4
	bl ApplyIconPalettes
	bl PrepRestartMuralBackground
	ldr r4, _080952FC @ =0x02012A20
	movs r6, #4
	mov sl, r6
_080950B8:
	adds r0, r4, #0
	movs r1, #7
	bl InitTextDb
	adds r4, #8
	movs r0, #1
	rsbs r0, r0, #0
	add sl, r0
	mov r1, sl
	cmp r1, #0
	bge _080950B8
	ldr r4, _08095300 @ =0x020129A8
	movs r2, #7
	mov sl, r2
_080950D4:
	adds r0, r4, #0
	movs r1, #3
	bl InitText
	adds r4, #8
	movs r3, #1
	rsbs r3, r3, #0
	add sl, r3
	mov r5, sl
	cmp r5, #0
	bge _080950D4
	movs r6, #8
	mov sl, r6
	ldr r0, _08095300 @ =0x020129A8
	mov sb, r0
	adds r0, #0x40
	movs r1, #7
	bl InitText
	mov r0, sb
	adds r0, #0xc8
	movs r1, #0xf
	bl InitText
	mov r0, sb
	adds r0, #0xd0
	movs r1, #0xf
	bl InitText
	mov r0, sb
	adds r0, #0xe8
	movs r1, #0xf
	bl InitText
	mov r0, sb
	adds r0, #0xd8
	movs r1, #0xc
	bl InitText
	mov r0, sb
	adds r0, #0xe0
	movs r1, #8
	bl InitText
	ldr r0, [r7, #0x2c]
	bl sub_08094A20
	ldr r0, [r7, #0x2c]
	bl sub_08094D74
	ldr r0, [r7, #0x2c]
	movs r1, #0
	bl DrawPrepScreenItemUseStatBars
	ldr r0, [r7, #0x2c]
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r3, #4
	rsbs r3, r3, #0
	ldr r0, _08095304 @ =0x00000203
	str r0, [sp]
	movs r0, #0
	movs r2, #0x40
	bl StartBmFace
	movs r0, #0xc0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_08091944
	movs r0, #0xc0
	lsls r0, r0, #6
	movs r1, #0xa
	bl sub_08091994
	ldr r0, _08095308 @ =0x02023460
	ldr r1, _0809530C @ =0x0840E50C
	movs r2, #0xa6
	lsls r2, r2, #7
	bl sub_080AACD8
	movs r0, #7
	bl EnableBgSync
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r2, #0
	str r2, [sp]
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
	ldr r0, [r7, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r4, r0, #0
	bl GetStringTextLen
	movs r3, #0x30
	subs r3, r3, r0
	lsrs r0, r3, #0x1f
	adds r3, r3, r0
	asrs r3, r3, #1
	movs r0, #6
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0
	ldr r1, _08095310 @ =0x02022C60
	movs r2, #0
	bl PutDrawText
	adds r0, r7, #0
	bl StartUiCursorHand
	adds r0, r7, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	ldr r0, _08095314 @ =sub_08094FB4
	adds r1, r7, #0
	bl StartParallelWorker
	ldr r3, _080952F0 @ =0x03002870
	mov ip, r3
	movs r0, #0x20
	ldrb r4, [r3, #1]
	orrs r0, r4
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	mov r1, ip
	adds r1, #0x2d
	movs r0, #0x68
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x66
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x9a
	strb r0, [r1]
	movs r0, #1
	ldr r5, _08095318 @ =0x030028A4
	ldrb r1, [r5]
	orrs r1, r0
	movs r6, #2
	orrs r1, r6
	movs r4, #4
	orrs r1, r4
	movs r3, #8
	orrs r1, r3
	movs r2, #0x10
	orrs r1, r2
	movs r5, #0x36
	add r5, ip
	mov r8, r5
	ldrb r6, [r5]
	orrs r0, r6
	movs r5, #2
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	orrs r0, r2
	movs r6, #0x20
	orrs r1, r6
	ldr r2, _08095318 @ =0x030028A4
	strb r1, [r2]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	mov r3, r8
	strb r0, [r3]
	mov r1, ip
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r4, [r1]
	orrs r0, r4
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x44
	movs r5, #0
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	adds r0, #1
	mov r6, sl
	strb r6, [r0]
	ldr r0, _0809531C @ =0x0000FFE0
	mov r1, ip
	ldrh r1, [r1, #0x3c]
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	mov r2, ip
	strh r0, [r2, #0x3c]
	adds r0, r7, #0
	bl StartGreenText
	movs r0, #0xc4
	movs r1, #0x90
	adds r2, r7, #0
	bl StartHelpPromptSprite
	ldr r0, [r7, #0x2c]
	ldr r1, [r7, #0x30]
	bl sub_08094EF4
	mov r1, sb
	adds r1, #0x78
	ldr r2, [r7, #0x2c]
	ldr r0, _08095320 @ =0x02022EA4
	movs r3, #1
	bl DrawPrepScreenItems
	ldr r1, [r7, #0x30]
	asrs r2, r1, #3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #0xb
	bl ShowSysHandCursor
	ldr r0, [r7, #0x2c]
	bl GetUnitSMSId
	bl UseUnitSprite
	bl ForceSyncUnitSpriteSheet
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080952EC: .4byte 0x0840F3F0
_080952F0: .4byte 0x03002870
_080952F4: .4byte 0x08CC3B18
_080952F8: .4byte 0x06014000
_080952FC: .4byte 0x02012A20
_08095300: .4byte 0x020129A8
_08095304: .4byte 0x00000203
_08095308: .4byte 0x02023460
_0809530C: .4byte 0x0840E50C
_08095310: .4byte 0x02022C60
_08095314: .4byte sub_08094FB4
_08095318: .4byte 0x030028A4
_0809531C: .4byte 0x0000FFE0
_08095320: .4byte 0x02022EA4
