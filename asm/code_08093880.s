	.include "macro.inc"

	.syntax unified

	thumb_func_start ProcPrepUnit_InitScreen
ProcPrepUnit_InitScreen: @ 0x08093880
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08093A58 @ =0x08CC3B18
	bl InitBgs
	ldr r4, _08093A5C @ =0x03002870
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r4, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r4, #1]
	adds r0, r5, #0
	bl sub_080937CC
	ldr r0, _08093A60 @ =0x02022C60
	movs r1, #0
	bl TmFill
	ldr r0, _08093A64 @ =0x02023460
	movs r1, #0
	bl TmFill
	ldr r0, _08093A68 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r4, #0xc]
	ands r0, r2
	movs r2, #2
	orrs r0, r2
	strb r0, [r4, #0xc]
	adds r0, r1, #0
	ldrb r3, [r4, #0x10]
	ands r0, r3
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r4, #0x14]
	movs r0, #3
	ldrb r1, [r4, #0x18]
	orrs r0, r1
	strb r0, [r4, #0x18]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldrh r2, [r5, #0x30]
	subs r2, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl PrepUnit_InitTexts
	bl PrepUnit_InitGfx
	movs r1, #0x80
	lsls r1, r1, #7
	adds r0, r5, #0
	bl sub_08093250
	movs r0, #7
	bl EnableBgSync
	adds r2, r4, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r3, [r2]
	ands r0, r3
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x44
	movs r3, #0
	movs r0, #0xe
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x46
	strb r3, [r0]
	ldr r0, _08093A6C @ =0x0000FFE0
	ldrh r1, [r4, #0x3c]
	ands r0, r1
	ldr r1, _08093A70 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r4, #0x3c]
	movs r1, #0x21
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r3, [r2]
	ands r0, r3
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r2, [r0]
	ands r1, r2
	strb r1, [r0]
	adds r0, r5, #0
	bl PrepUnit_InitSMS
	ldr r0, _08093A74 @ =PrepUnit_DrawSMSAndObjs
	adds r1, r5, #0
	bl StartParallelWorker
	adds r0, r5, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	ldrh r1, [r5, #0x2e]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsrs r1, r1, #1
	lsls r1, r1, #4
	ldrh r2, [r5, #0x30]
	subs r2, #0x18
	subs r1, r1, r2
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #7
	bl ShowSysHandCursor
	adds r0, r5, #0
	bl StartMenuScrollBar
	movs r0, #0xe2
	movs r1, #0x20
	bl PutMenuScrollBarAt
	ldrh r4, [r5, #0x30]
	bl PrepGetUnitAmount
	adds r2, r0, #0
	subs r2, #1
	lsrs r0, r2, #0x1f
	adds r2, r2, r0
	asrs r2, r2, #1
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0xa
	adds r1, r4, #0
	movs r3, #6
	bl UpdateMenuScrollBarConfig
	movs r0, #0x80
	lsls r0, r0, #2
	movs r1, #2
	bl InitMenuScrollBarImg
	movs r0, #0x20
	movs r1, #0x8c
	adds r2, r5, #0
	bl StartHelpPromptSprite
	ldrh r0, [r5, #0x2e]
	bl GetUnitFromPrepList
	bl PrepUnit_DrawUnitItems
	ldrh r0, [r5, #0x2e]
	bl GetUnitFromPrepList
	bl PrepUnit_DrawLeftUnitName
	bl sub_08093734
	movs r4, #0
_08093A24:
	ldrh r3, [r5, #0x30]
	lsrs r1, r3, #4
	adds r1, r1, r4
	adds r0, r5, #0
	bl PrepUnit_DrawUnitListNames
	adds r4, #1
	cmp r4, #5
	ble _08093A24
	adds r0, r5, #0
	movs r1, #0
	bl PrepUnit_DrawPickLeftBar
	adds r0, r5, #0
	bl StartGreenText
	ldr r0, _08093A78 @ =0x06015000
	movs r1, #5
	bl LoadHelpBoxGfx
	bl PrepRestartMuralBackground
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08093A58: .4byte 0x08CC3B18
_08093A5C: .4byte 0x03002870
_08093A60: .4byte 0x02022C60
_08093A64: .4byte 0x02023460
_08093A68: .4byte 0x02023C60
_08093A6C: .4byte 0x0000FFE0
_08093A70: .4byte 0x0000E0FF
_08093A74: .4byte PrepUnit_DrawSMSAndObjs
_08093A78: .4byte 0x06015000
