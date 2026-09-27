	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepItemScreen_SetupGfx
PrepItemScreen_SetupGfx: @ 0x080913FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	mov r8, r0
	add r1, sp, #8
	ldr r0, _080917C0 @ =0x0840F394
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	ldr r0, _080917C4 @ =0x08CC3B18
	bl InitBgs
	ldr r4, _080917C8 @ =0x03002870
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r4]
	ands r0, r1
	strb r0, [r4]
	add r0, sp, #8
	bl SetFaceConfig
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r4, #1]
	ands r0, r2
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
	ldr r0, _080917CC @ =0x06017800
	movs r1, #0
	bl SetupDebugFontForOBJ
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r3, [r4, #0xc]
	ands r0, r3
	strb r0, [r4, #0xc]
	adds r0, r1, #0
	ldrb r2, [r4, #0x10]
	ands r0, r2
	movs r2, #2
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r3, [r4, #0x14]
	ands r1, r3
	strb r1, [r4, #0x14]
	movs r0, #3
	ldrb r1, [r4, #0x18]
	orrs r0, r1
	strb r0, [r4, #0x18]
	bl ResetText
	bl InitIcons
	movs r0, #4
	bl ApplyIconPalettes
	bl UnpackUiWindowFrameGraphics
	bl ApplySystemObjectsGraphics
	bl MakePrepUnitList
	bl PrepGetLatestCharId
	bl UnitGetIndexInPrepList
	mov r1, r8
	adds r1, #0x29
	movs r4, #0
	strb r0, [r1]
	mov r0, r8
	bl ResetSysHandCursor
	ldr r0, _080917D0 @ =PrepItem_DrawSMS
	mov r1, r8
	bl StartParallelWorker
	mov r0, r8
	bl StartUiCursorHand
	movs r0, #0
	bl SetOnHBlankA
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
	ldr r0, _080917D4 @ =0x02022860
	strh r4, [r0]
	bl EnablePalSync
	mov r2, sp
	adds r2, #0x28
	str r2, [sp, #0x2c]
	ldr r5, _080917D8 @ =0x020129A8
	movs r4, #0xe
_080914F6:
	adds r0, r5, #0
	movs r1, #5
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _080914F6
	movs r3, #0x2a
	add r3, r8
	mov sb, r3
	mov r4, r8
	adds r4, #0x2b
	str r4, [sp, #0x30]
	ldr r0, _080917DC @ =0x02012A20
	adds r6, r0, #0
	adds r6, #0x28
	adds r5, r0, #0
	movs r4, #4
_0809151C:
	adds r0, r5, #0
	movs r1, #7
	bl InitText
	adds r0, r6, #0
	movs r1, #7
	bl InitText
	adds r6, #8
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0809151C
	ldr r4, _080917E0 @ =0x02012A70
	adds r0, r4, #0
	movs r1, #8
	bl InitTextDb
	adds r0, r4, #0
	adds r0, #8
	movs r1, #8
	bl InitTextDb
	ldr r0, _080917E4 @ =0x02012A80
	movs r1, #8
	bl InitText
	ldr r0, _080917E8 @ =0x02012A90
	movs r1, #7
	bl InitText
	adds r0, r4, #0
	adds r0, #0x28
	movs r1, #5
	bl InitText
	ldr r0, _080917EC @ =0x06014000
	movs r1, #1
	rsbs r1, r1, #0
	bl LoadHelpBoxGfx
	ldr r7, _080917C8 @ =0x03002870
	movs r0, #0x3c
	adds r0, r0, r7
	mov sl, r0
	movs r1, #0x21
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r2, sl
	ldrb r2, [r2]
	ands r0, r2
	mov r3, sl
	strb r0, [r3]
	adds r0, r7, #0
	adds r0, #0x3d
	ldrb r4, [r0]
	ands r1, r4
	strb r1, [r0]
	ldr r0, _080917F0 @ =0x0000FFE0
	ldrh r1, [r7, #0x3c]
	ands r0, r1
	ldr r2, _080917F4 @ =0x0000E0FF
	ands r0, r2
	strh r0, [r7, #0x3c]
	movs r3, #0x36
	adds r3, r3, r7
	mov ip, r3
	movs r0, #0x20
	ldrb r2, [r3]
	orrs r2, r0
	ldrb r4, [r7, #1]
	orrs r0, r4
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	adds r0, r7, #0
	adds r0, #0x2d
	movs r1, #0
	strb r1, [r0]
	adds r1, r7, #0
	adds r1, #0x31
	movs r4, #4
	movs r0, #4
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x44
	strb r0, [r1]
	adds r5, r7, #0
	adds r5, #0x34
	movs r6, #1
	ldrb r0, [r5]
	orrs r0, r6
	movs r3, #2
	orrs r0, r3
	orrs r0, r4
	movs r4, #8
	orrs r0, r4
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r5]
	orrs r2, r6
	orrs r2, r3
	movs r0, #5
	rsbs r0, r0, #0
	ands r2, r0
	orrs r2, r4
	orrs r2, r1
	mov r3, ip
	strb r2, [r3]
	ldr r2, _080917F8 @ =0x0000FFFC
	movs r0, #0
	movs r1, #4
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r1, _080917FC @ =0x0000FFD8
	mov r4, r8
	ldrh r2, [r4, #0x32]
	subs r2, #4
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl SetBgOffset
	movs r0, #7
	bl EnableBgSync
	bl ApplyUnitSpritePalettes
	movs r0, #0
	str r0, [sp, #0x28]
	ldr r1, _08091800 @ =0x02022BC0
	ldr r2, _08091804 @ =0x01000008
	ldr r0, [sp, #0x2c]
	bl CpuFastSet
	bl ForceSyncUnitSpriteSheet
	ldr r0, _08091808 @ =0x0840E098
	ldr r1, _0809180C @ =0x06013E00
	bl Decompress
	movs r0, #0x3c
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0xd0
	bl UiCursorHand_SetPosition
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	bl PrepRestartMuralBackground
	mov r1, sb
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _080916BA
	adds r5, r0, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x14
	mov r3, r8
	ldrh r0, [r3, #0x32]
	subs r0, #4
	subs r2, r2, r0
	movs r0, #0
	adds r1, r4, #0
	movs r3, #2
	bl SetUiCursorHandConfig
	mov r4, sb
	ldrb r0, [r4]
	bl GetUnitFromPrepList
	adds r1, r0, #0
	ldr r0, _08091810 @ =0x00000503
	str r0, [sp]
	movs r0, #0
	movs r2, #0x44
	movs r3, #0x4e
	bl UpdatePrepItemScreenFace
_080916BA:
	mov r0, r8
	bl StartMenuScrollBar
	movs r5, #0x80
	lsls r5, r5, #2
	adds r0, r5, #0
	movs r1, #4
	bl InitMenuScrollBarImg
	movs r0, #0xd8
	movs r1, #0xc
	bl PutMenuScrollBarAt
	mov r0, r8
	ldrh r4, [r0, #0x32]
	bl PrepGetUnitAmount
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
	bl PrepUpdateSMS
	movs r0, #0x3f
	mov r1, sl
	ldrb r1, [r1]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	mov r2, sl
	strb r0, [r2]
	adds r0, r7, #0
	adds r0, #0x44
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	movs r3, #0
	strb r3, [r0]
	ldr r0, _080917F0 @ =0x0000FFE0
	ldrh r4, [r7, #0x3c]
	ands r0, r4
	movs r1, #2
	orrs r0, r1
	ldr r1, _080917F4 @ =0x0000E0FF
	ands r0, r1
	orrs r0, r5
	strh r0, [r7, #0x3c]
	ldr r0, _08091814 @ =PrepItemScreen_OnHBlank
	bl SetOnHBlankA
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [sp]
	mov r2, r8
	str r2, [sp, #4]
	movs r0, #6
	movs r2, #8
	bl StartSysBrownBox
	movs r0, #0
	movs r1, #1
	bl SetSysBrownBoxWidth
	ldr r0, _080917E8 @ =0x02012A90
	movs r1, #3
	bl Text_SetColor
	ldr r0, _08091818 @ =0x00001259
	bl DecodeMsg
	adds r1, r0, #0
	ldr r0, _080917E8 @ =0x02012A90
	bl Text_DrawString
	movs r1, #0
	ldr r3, [sp, #0x30]
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #0
	bne _0809177E
	movs r1, #1
_0809177E:
	ldr r0, _080917E4 @ =0x02012A80
	bl Text_SetColor
	ldr r0, _080917E4 @ =0x02012A80
	movs r1, #0
	bl Text_SetCursor
	ldr r0, _0809181C @ =0x0000125A
	bl DecodeMsg
	adds r1, r0, #0
	ldr r0, _080917E4 @ =0x02012A80
	bl Text_DrawString
	ldr r0, _080917E4 @ =0x02012A80
	movs r1, #0x20
	bl Text_SetCursor
	ldr r0, _08091820 @ =0x0000125B
	bl DecodeMsg
	adds r1, r0, #0
	ldr r0, _080917E4 @ =0x02012A80
	bl Text_DrawString
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080917C0: .4byte 0x0840F394
_080917C4: .4byte 0x08CC3B18
_080917C8: .4byte 0x03002870
_080917CC: .4byte 0x06017800
_080917D0: .4byte PrepItem_DrawSMS
_080917D4: .4byte 0x02022860
_080917D8: .4byte 0x020129A8
_080917DC: .4byte 0x02012A20
_080917E0: .4byte 0x02012A70
_080917E4: .4byte 0x02012A80
_080917E8: .4byte 0x02012A90
_080917EC: .4byte 0x06014000
_080917F0: .4byte 0x0000FFE0
_080917F4: .4byte 0x0000E0FF
_080917F8: .4byte 0x0000FFFC
_080917FC: .4byte 0x0000FFD8
_08091800: .4byte 0x02022BC0
_08091804: .4byte 0x01000008
_08091808: .4byte 0x0840E098
_0809180C: .4byte 0x06013E00
_08091810: .4byte 0x00000503
_08091814: .4byte PrepItemScreen_OnHBlank
_08091818: .4byte 0x00001259
_0809181C: .4byte 0x0000125A
_08091820: .4byte 0x0000125B
