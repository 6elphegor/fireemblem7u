	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08096370
sub_08096370: @ 0x08096370
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
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
	adds r0, #0x35
	ldrb r0, [r0]
	lsls r1, r0, #1
	adds r0, r7, #0
	adds r0, #0x4c
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	ldr r0, _080965D4 @ =0x06016000
	movs r1, #1
	rsbs r1, r1, #0
	bl LoadHelpBoxGfx
	movs r0, #4
	bl ApplyIconPalettes
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_08091944
	movs r0, #0xc0
	lsls r0, r0, #6
	movs r1, #0xa
	bl sub_08091994
	ldr r0, _080965D8 @ =0x02023460
	ldr r1, _080965DC @ =0x0840E5D4
	movs r2, #0xa5
	lsls r2, r2, #7
	bl sub_080AACD8
	movs r0, #7
	bl EnableBgSync
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r0, #0
	mov sb, r0
	str r0, [sp]
	str r7, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl StartSysBrownBox
	movs r0, #0
	movs r1, #0x98
	movs r2, #6
	movs r3, #2
	bl EnableSysBrownBox
	ldr r0, [r7, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r0, r7, #0
	bl StartUiCursorHand
	adds r0, r7, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	ldr r1, _080965E0 @ =0x03002870
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
	mov r1, ip
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
	movs r5, #0x34
	add r5, ip
	mov r8, r5
	movs r0, #1
	ldrb r1, [r5]
	orrs r1, r0
	movs r2, #2
	orrs r1, r2
	movs r2, #4
	orrs r1, r2
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	movs r5, #0x36
	add r5, ip
	mov sl, r5
	ldrb r2, [r5]
	orrs r0, r2
	movs r5, #2
	orrs r0, r5
	movs r2, #5
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	orrs r1, r6
	mov r2, r8
	strb r1, [r2]
	orrs r0, r6
	mov r5, sl
	strb r0, [r5]
	mov r1, ip
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x44
	mov r5, sb
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	adds r1, #0xa
	movs r0, #8
	strb r0, [r1]
	adds r0, r7, #0
	bl StartGreenText
	movs r0, #0xc8
	movs r1, #0x90
	adds r2, r7, #0
	bl StartHelpPromptSprite
	ldr r4, _080965E4 @ =0x02012B68
	adds r0, r4, #0
	movs r1, #4
	bl InitText
	adds r0, r4, #0
	adds r0, #8
	movs r1, #4
	bl InitText
	bl sub_08095F90
	adds r4, #0x10
	movs r5, #4
_080964EA:
	adds r0, r4, #0
	movs r1, #7
	bl InitText
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _080964EA
	adds r6, r7, #0
	adds r6, #0x35
	movs r0, #0x4c
	adds r0, r0, r7
	mov r8, r0
	ldr r4, _080965E8 @ =0x02012BA0
	movs r5, #7
_08096508:
	adds r0, r4, #0
	movs r1, #7
	bl InitTextDb
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _08096508
	ldr r0, _080965EC @ =sub_08095ED8
	bl SetOnHBlankA
	movs r4, #0x80
	lsls r4, r4, #7
	adds r0, r4, #0
	movs r1, #6
	bl StoreConvoyWeaponIconGraphics
	ldr r5, _080965F0 @ =0x02022D3E
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #6
	bl sub_08096260
	ldr r0, _080965F4 @ =0x08405754
	ldr r1, _080965F8 @ =0x06015000
	bl Decompress
	adds r0, r7, #0
	bl StartMenuScrollBar
	movs r0, #0xb0
	lsls r0, r0, #7
	movs r1, #6
	bl InitMenuScrollBarImg
	movs r0, #0xe2
	movs r1, #0x30
	bl PutMenuScrollBarAt
	bl TryHideMenuScrollBar
	ldr r0, [r7, #0x2c]
	ldrb r1, [r6]
	movs r2, #1
	bl SomethingPrepListRelated
	ldr r4, _080965E8 @ =0x02012BA0
	ldr r1, _080965FC @ =0x02023C7E
	ldrb r6, [r6]
	lsls r0, r6, #1
	add r0, r8
	ldrh r0, [r0]
	lsrs r2, r0, #4
	ldr r3, [r7, #0x2c]
	adds r0, r4, #0
	bl sub_08095CA8
	movs r0, #4
	bl EnableBgSync
	movs r1, #0xb3
	lsls r1, r1, #1
	adds r5, r5, r1
	subs r4, #0x28
	ldr r2, [r7, #0x2c]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r3, #0
	bl DrawPrepScreenItems
	bl sub_08096054
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
	ldr r0, _08096600 @ =sub_080961D0
	adds r1, r7, #0
	bl StartParallelWorker
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080965D4: .4byte 0x06016000
_080965D8: .4byte 0x02023460
_080965DC: .4byte 0x0840E5D4
_080965E0: .4byte 0x03002870
_080965E4: .4byte 0x02012B68
_080965E8: .4byte 0x02012BA0
_080965EC: .4byte sub_08095ED8
_080965F0: .4byte 0x02022D3E
_080965F4: .4byte 0x08405754
_080965F8: .4byte 0x06015000
_080965FC: .4byte 0x02023C7E
_08096600: .4byte sub_080961D0
