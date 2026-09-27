	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepRestartMuralBackground
PrepRestartMuralBackground: @ 0x0808E448
	push {lr}
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808E460
	movs r0, #0
	movs r1, #0
	movs r2, #0xa
	bl StartMuralBackgroundAlt
	b _0808E468
_0808E460:
	movs r0, #0
	movs r1, #0xa
	bl StartPrepMuralBackground
_0808E468:
	pop {r0}
	bx r0

	thumb_func_start EndMuralBackground_
EndMuralBackground_: @ 0x0808E46C
	push {lr}
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808E47E
	bl EndMuralBackground
	b _0808E482
_0808E47E:
	bl EndPrepMuralBackground
_0808E482:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start Prep_DrawChapterGoal
Prep_DrawChapterGoal: @ 0x0808E488
	push {r4, r5, lr}
	sub sp, #0x20
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _0808E500 @ =0x06010000
	adds r2, r2, r0
	mov r0, sp
	adds r1, r2, #0
	adds r2, r4, #0
	bl InitSpriteTextFont
	ldr r0, _0808E504 @ =0x08194674
	adds r4, #0x10
	lsls r4, r4, #5
	adds r1, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	add r5, sp, #0x18
	adds r0, r5, #0
	bl InitSpriteText
	mov r0, sp
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r0, r5, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	ldr r0, _0808E508 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x8e
	ldrh r0, [r0]
	bl DecodeMsg
	adds r4, r0, #0
	movs r0, #0x60
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0
	adds r3, r4, #0
	bl Text_InsertDrawString
	movs r0, #0
	bl SetTextFont
	add sp, #0x20
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808E500: .4byte 0x06010000
_0808E504: .4byte 0x08194674
_0808E508: .4byte 0x0202BBF8

	thumb_func_start PrepAtMenu_OnInit
PrepAtMenu_OnInit: @ 0x0808E50C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl PrepSetLatestCharId
	movs r0, #0
	str r0, [r4, #0x40]
	strh r0, [r4, #0x3c]
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808E52E
	adds r1, r4, #0
	adds r1, #0x2a
	movs r0, #5
	b _0808E536
_0808E52E:
	bl GetChapterAllyUnitCount
	adds r1, r4, #0
	adds r1, #0x2a
_0808E536:
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #2
	strb r1, [r0]
	subs r0, #9
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ResetPrepMenuDescTexts
ResetPrepMenuDescTexts: @ 0x0808E564
	push {r4, r5, lr}
	ldr r5, _0808E590 @ =0x020106B4
	movs r4, #4
_0808E56A:
	adds r0, r5, #0
	bl ClearText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0808E56A
	ldr r0, _0808E594 @ =0x02023DFC
	movs r1, #0xf
	movs r2, #0xa
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #4
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808E590: .4byte 0x020106B4
_0808E594: .4byte 0x02023DFC

	thumb_func_start ParsePrepMenuDescTexts
ParsePrepMenuDescTexts: @ 0x0808E598
	push {r4, lr}
	ldr r4, _0808E5B4 @ =0x020106B4
	bl DecodeMsg
_0808E5A0:
	adds r1, r0, #0
_0808E5A2:
	ldrb r0, [r1]
	cmp r0, #0
	beq _0808E5C0
	cmp r0, #1
	bne _0808E5B8
	adds r4, #8
	adds r1, #1
	b _0808E5A2
	.align 2, 0
_0808E5B4: .4byte 0x020106B4
_0808E5B8:
	adds r0, r4, #0
	bl Text_DrawCharacter
	b _0808E5A0
_0808E5C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start DrawPrepMenuDescTexts
DrawPrepMenuDescTexts: @ 0x0808E5C8
	push {r4, r5, r6, lr}
	movs r6, #0
	movs r5, #0xc0
	lsls r5, r5, #1
	ldr r4, _0808E5F4 @ =0x020106B4
_0808E5D2:
	ldr r1, _0808E5F8 @ =0x02023C7C
	adds r1, r5, r1
	adds r0, r4, #0
	bl PutText
	adds r5, #0x80
	adds r4, #8
	adds r6, #1
	cmp r6, #4
	ble _0808E5D2
	movs r0, #4
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808E5F4: .4byte 0x020106B4
_0808E5F8: .4byte 0x02023C7C

	thumb_func_start sub_0808E5FC
sub_0808E5FC: @ 0x0808E5FC
	push {lr}
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bl ResetPrepMenuDescTexts
	pop {r0}
	bx r0

	thumb_func_start sub_0808E60C
sub_0808E60C: @ 0x0808E60C
	push {lr}
	ldr r0, [r0, #0x58]
	bl DecodeMsg
	pop {r0}
	bx r0

	thumb_func_start sub_0808E618
sub_0808E618: @ 0x0808E618
	push {lr}
	ldr r0, [r0, #0x58]
	bl ParsePrepMenuDescTexts
	pop {r0}
	bx r0

	thumb_func_start sub_0808E624
sub_0808E624: @ 0x0808E624
	push {lr}
	bl DrawPrepMenuDescTexts
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartPrepMenuDescHandler
StartPrepMenuDescHandler: @ 0x0808E630
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r5, _0808E658 @ =0x08CC3B9C
	adds r0, r5, #0
	bl Proc_Find
	cmp r0, #0
	beq _0808E646
	bl Proc_End
_0808E646:
	adds r0, r5, #0
	adds r1, r4, #0
	bl Proc_Start
	str r6, [r0, #0x58]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808E658: .4byte 0x08CC3B9C

	thumb_func_start StartPrepAtSubMenuUI
StartPrepAtSubMenuUI: @ 0x0808E65C
	push {r4, lr}
	adds r4, r0, #0
	bl EndSysBlackBoxs
	bl EndPrepSpecialCharEffect
	bl EndMuralBackground_
	bl GetActivePrepMenuItemIndex
	adds r4, #0x2d
	strb r0, [r4]
	bl EndPrepScreenMenu
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start DrawAtMenuUpfx
DrawAtMenuUpfx: @ 0x0808E680
	push {r4, lr}
	sub sp, #4
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _0808E6C0 @ =0x0840DDA4
	ldr r1, _0808E6C4 @ =0x06010000
	adds r2, r2, r1
	adds r1, r2, #0
	bl Decompress
	ldr r0, _0808E6C8 @ =0x0840E058
	adds r1, r4, #0
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #0
	str r0, [sp]
	adds r4, #1
	lsls r4, r4, #5
	ldr r0, _0808E6CC @ =0x02022A60
	adds r4, r4, r0
	ldr r2, _0808E6D0 @ =0x01000008
	mov r0, sp
	adds r1, r4, #0
	bl CpuFastSet
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808E6C0: .4byte 0x0840DDA4
_0808E6C4: .4byte 0x06010000
_0808E6C8: .4byte 0x0840E058
_0808E6CC: .4byte 0x02022A60
_0808E6D0: .4byte 0x01000008

	thumb_func_start AtMenu_Reinitialize
AtMenu_Reinitialize: @ 0x0808E6D4
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, _0808E8BC @ =0x08CC3B18
	bl InitBgs
	bl ResetText
	bl UnpackUiWindowFrameGraphics
	movs r0, #0
	movs r1, #0xe
	bl LoadHelpBoxGfx
	ldr r2, _0808E8C0 @ =0x03002870
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
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
	strb r0, [r2, #1]
	bl ApplySystemObjectsGraphics
	bl ResetUnitSprites
	bl MakePrepUnitList
	adds r0, r6, #0
	bl PrepAutoCapDeployUnits
	bl ReorderPlayerUnitsBasedOnDeployment
	ldr r0, _0808E8C4 @ =0x02022C60
	movs r1, #0
	bl TmFill
	ldr r0, _0808E8C8 @ =0x02023460
	movs r1, #0
	bl TmFill
	ldr r0, _0808E8CC @ =0x02023C60
	movs r1, #0
	bl TmFill
	ldr r5, _0808E8D0 @ =0x020106B4
	movs r4, #4
_0808E740:
	adds r0, r5, #0
	movs r1, #0xe
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0808E740
	adds r7, r6, #0
	adds r7, #0x35
	ldr r5, _0808E8D4 @ =0x02010694
	movs r4, #3
_0808E758:
	adds r0, r5, #0
	movs r1, #8
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0808E758
	ldr r0, _0808E8D8 @ =0x0201068C
	movs r1, #0xa
	bl InitText
	ldr r0, _0808E8DC @ =0x08405EC4
	ldr r1, _0808E8E0 @ =0x06014800
	bl Decompress
	ldr r0, _0808E8E4 @ =0x0840624C
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x40
	bl ApplyPaletteExt
	movs r0, #0xe0
	lsls r0, r0, #7
	movs r1, #6
	bl DrawAtMenuUpfx
	ldr r0, _0808E8E8 @ =0x0840E0C0
	ldr r1, _0808E8EC @ =0x06016000
	bl Decompress
	ldr r0, _0808E8F0 @ =0x0840E078
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	bl EnablePalSync
	ldr r4, _0808E8C0 @ =0x03002870
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
	movs r0, #1
	orrs r1, r0
	strb r1, [r4, #0x14]
	movs r0, #3
	ldrb r1, [r4, #0x18]
	orrs r0, r1
	strb r0, [r4, #0x18]
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r2, [r4, #1]
	ands r0, r2
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
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
	adds r0, r6, #0
	bl InitPrepScreenMainMenu
	movs r0, #0xf
	bl EnableBgSync
	adds r2, r4, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x44
	movs r2, #0
	movs r0, #0xe
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x46
	strb r2, [r0]
	ldr r0, _0808E8F4 @ =0x0000FFE0
	ldrh r2, [r4, #0x3c]
	ands r0, r2
	ldr r1, _0808E8F8 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4, #0x3c]
	adds r0, r6, #0
	bl StartPrepSpecialCharEffect
	bl PrepRestartMuralBackground
	ldr r0, _0808E8FC @ =0x08404BBC
	movs r1, #0x60
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0808E900 @ =0x08404BDC
	ldr r1, _0808E904 @ =0x06007800
	bl Decompress
	ldr r0, _0808E908 @ =0x02023578
	ldr r1, _0808E90C @ =0x084050D8
	movs r2, #0xcf
	lsls r2, r2, #6
	bl sub_080AACD8
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #0xb
	bl Prep_DrawChapterGoal
	adds r0, r6, #0
	bl NewSysBlackBoxHandler
	movs r0, #0xd0
	lsls r0, r0, #7
	bl SysBlackBoxSetGfx
	movs r2, #0x90
	lsls r2, r2, #3
	movs r0, #3
	str r0, [sp]
	movs r0, #0xc0
	lsls r0, r0, #4
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #4
	movs r3, #0xb
	bl EnableSysBlackBox
	bl GetActivePrepMenuItemIndex
	strb r0, [r7]
	bl GetPrepMainMenuInfoxMsg
	bl ParsePrepMenuDescTexts
	bl DrawPrepMenuDescTexts
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808E8BC: .4byte 0x08CC3B18
_0808E8C0: .4byte 0x03002870
_0808E8C4: .4byte 0x02022C60
_0808E8C8: .4byte 0x02023460
_0808E8CC: .4byte 0x02023C60
_0808E8D0: .4byte 0x020106B4
_0808E8D4: .4byte 0x02010694
_0808E8D8: .4byte 0x0201068C
_0808E8DC: .4byte 0x08405EC4
_0808E8E0: .4byte 0x06014800
_0808E8E4: .4byte 0x0840624C
_0808E8E8: .4byte 0x0840E0C0
_0808E8EC: .4byte 0x06016000
_0808E8F0: .4byte 0x0840E078
_0808E8F4: .4byte 0x0000FFE0
_0808E8F8: .4byte 0x0000E0FF
_0808E8FC: .4byte 0x08404BBC
_0808E900: .4byte 0x08404BDC
_0808E904: .4byte 0x06007800
_0808E908: .4byte 0x02023578
_0808E90C: .4byte 0x084050D8

	thumb_func_start EndPrepAtMenuIfNoUnitAvailable
EndPrepAtMenuIfNoUnitAvailable: @ 0x0808E910
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
	ldr r2, _0808E97C @ =0x03002870
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
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
	strb r0, [r2, #1]
	movs r4, #1
_0808E936:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0808E95A
	ldr r0, [r1]
	cmp r0, #0
	beq _0808E95A
	adds r0, r1, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808E95A
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0808E95A:
	adds r4, #1
	cmp r4, #0x3f
	ble _0808E936
	cmp r5, #0
	bne _0808E974
	adds r1, r6, #0
	adds r1, #0x36
	movs r0, #1
	strb r0, [r1]
	adds r0, r6, #0
	movs r1, #6
	bl Proc_Goto
_0808E974:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808E97C: .4byte 0x03002870

	thumb_func_start AtMenu_UpdateDesc
AtMenu_UpdateDesc: @ 0x0808E980
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl GetActivePrepMenuItemIndex
	adds r6, r0, #0
	adds r4, r5, #0
	adds r4, #0x35
	ldrb r0, [r4]
	cmp r0, r6
	beq _0808E9A0
	bl GetPrepMainMenuInfoxMsg
	adds r1, r5, #0
	bl StartPrepMenuDescHandler
	strb r6, [r4]
_0808E9A0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0808E9A8
sub_0808E9A8: @ 0x0808E9A8
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r5, _0808EA20 @ =0x02010694
	adds r0, #0x2f
	ldrb r0, [r0]
	bl GetPrepOptionCount
	adds r3, r0, #0
	lsls r3, r3, #1
	adds r3, #2
	movs r0, #1
	str r0, [sp]
	movs r0, #5
	movs r1, #6
	movs r2, #9
	bl DrawUiFrame2
	movs r4, #0
	movs r6, #0xe0
	lsls r6, r6, #1
_0808E9D2:
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0808EA0A
	adds r0, r5, #0
	bl ClearText
	ldr r1, _0808EA24 @ =0x08CC50A0
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl DecodeMsg
	ldr r1, _0808EA28 @ =0x02022C6C
	adds r1, r6, r1
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r3, #0
	bl PutDrawText
	adds r5, #8
	adds r6, #0x80
_0808EA0A:
	adds r4, #1
	cmp r4, #3
	ble _0808E9D2
	movs r0, #3
	bl EnableBgSync
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808EA20: .4byte 0x02010694
_0808EA24: .4byte 0x08CC50A0
_0808EA28: .4byte 0x02022C6C

	thumb_func_start CleanupPrepMenuScreen
CleanupPrepMenuScreen: @ 0x0808EA2C
	push {lr}
	ldr r0, _0808EA50 @ =0x02022DEA
	movs r1, #8
	movs r2, #9
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _0808EA54 @ =0x020235EA
	movs r1, #8
	movs r2, #9
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #3
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_0808EA50: .4byte 0x02022DEA
_0808EA54: .4byte 0x020235EA

	thumb_func_start AtMenu_SetupCtrlUI
AtMenu_SetupCtrlUI: @ 0x0808EA58
	push {r4, lr}
	adds r4, r0, #0
	bl ShowPrepScreenMenuFrozenHand
	adds r0, r4, #0
	bl sub_0808E9A8
	adds r4, #0x2e
	ldrb r4, [r4]
	lsls r1, r4, #4
	adds r1, #0x38
	movs r3, #0x80
	lsls r3, r3, #3
	movs r0, #0x2c
	movs r2, #7
	bl ShowSysHandCursor
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start AtMenu_CtrlLoop
AtMenu_CtrlLoop: @ 0x0808EA80
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r6, r0, #0
	add r1, sp, #4
	ldr r0, _0808EAD4 @ =0x0840F384
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	adds r5, r6, #0
	adds r5, #0x2e
	ldrb r0, [r5]
	mov sb, r0
	movs r1, #0x2c
	mov sl, r1
	lsls r0, r0, #4
	adds r7, r0, #0
	adds r7, #0x38
	adds r4, r6, #0
	adds r4, #0x34
	ldrb r2, [r4]
	mov r8, r2
	cmp r2, #0
	beq _0808EADC
	ldr r0, _0808EAD8 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0808EBB4
	bl CloseHelpBox
	movs r0, #0
	strb r0, [r4]
	b _0808EC76
	.align 2, 0
_0808EAD4: .4byte 0x0840F384
_0808EAD8: .4byte 0x08B857F8
_0808EADC:
	ldr r0, _0808EB30 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808EB3C
	ldr r0, _0808EB34 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808EAFC
	ldr r0, _0808EB38 @ =0x0000038A
	bl m4aSongNumStart
_0808EAFC:
	ldrb r0, [r5]
	adds r1, r6, #0
	adds r1, #0x2f
	ldrb r1, [r1]
	bl PrepOptionCountToRealIndexByMask
	cmp r0, #3
	bne _0808EB1E
	movs r2, #0x80
	lsls r2, r2, #1
	mov r3, r8
	str r3, [sp]
	movs r0, #0x5e
	adds r1, r2, #0
	movs r3, #0x20
	bl CallSomeSoundMaybe
_0808EB1E:
	adds r1, r6, #0
	adds r1, #0x33
	movs r0, #4
	strb r0, [r1]
	adds r0, r6, #0
	movs r1, #8
	bl Proc_Goto
	b _0808EC76
	.align 2, 0
_0808EB30: .4byte 0x08B857F8
_0808EB34: .4byte 0x0202BBF8
_0808EB38: .4byte 0x0000038A
_0808EB3C:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808EB68
	movs r0, #1
	strb r0, [r4]
	ldrb r0, [r5]
	adds r1, r6, #0
	adds r1, #0x2f
	ldrb r1, [r1]
	bl PrepOptionCountToRealIndexByMask
	lsls r0, r0, #2
	add r0, sp
	adds r0, #4
	ldr r2, [r0]
	movs r0, #0x2c
	adds r1, r7, #0
	bl StartHelpBox
	b _0808EC76
_0808EB68:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0808EBB4
	adds r0, r6, #0
	bl CleanupPrepMenuScreen
	ldr r0, _0808EBA4 @ =0x02023578
	ldr r1, _0808EBA8 @ =0x084050D8
	movs r2, #0xcf
	lsls r2, r2, #6
	bl sub_080AACD8
	movs r0, #1
	movs r1, #4
	bl DrawPrepScreenMenuFrameAt
	ldr r0, _0808EBAC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808EB9C
	ldr r0, _0808EBB0 @ =0x0000038B
	bl m4aSongNumStart
_0808EB9C:
	adds r0, r6, #0
	bl Proc_Break
	b _0808EC76
	.align 2, 0
_0808EBA4: .4byte 0x02023578
_0808EBA8: .4byte 0x084050D8
_0808EBAC: .4byte 0x0202BBF8
_0808EBB0: .4byte 0x0000038B
_0808EBB4:
	ldr r0, _0808EC10 @ =0x08B857F8
	ldr r1, [r0]
	movs r2, #0x40
	adds r0, r2, #0
	ldrh r4, [r1, #6]
	ands r0, r4
	adds r5, r6, #0
	adds r5, #0x2e
	cmp r0, #0
	beq _0808EBE6
	ldrb r0, [r5]
	cmp r0, #0
	bne _0808EBE2
	adds r0, r2, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0808EBE6
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	bl GetPrepOptionCount
_0808EBE2:
	subs r0, #1
	strb r0, [r5]
_0808EBE6:
	ldr r7, _0808EC10 @ =0x08B857F8
	ldr r1, [r7]
	movs r0, #0x80
	mov r8, r0
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0808EC24
	ldrb r4, [r5]
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	bl GetPrepOptionCount
	subs r0, #1
	cmp r4, r0
	bge _0808EC14
	ldrb r0, [r5]
	adds r0, #1
	b _0808EC22
	.align 2, 0
_0808EC10: .4byte 0x08B857F8
_0808EC14:
	ldr r1, [r7]
	mov r0, r8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0808EC24
	movs r0, #0
_0808EC22:
	strb r0, [r5]
_0808EC24:
	ldrb r2, [r5]
	cmp sb, r2
	beq _0808EC76
	lsls r0, r2, #4
	adds r7, r0, #0
	adds r7, #0x38
	adds r0, r6, #0
	adds r0, #0x34
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808EC56
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	adds r0, r2, #0
	bl PrepOptionCountToRealIndexByMask
	lsls r0, r0, #2
	add r0, sp
	adds r0, #4
	ldr r2, [r0]
	mov r0, sl
	adds r1, r7, #0
	bl StartHelpBox
_0808EC56:
	movs r3, #0x80
	lsls r3, r3, #3
	mov r0, sl
	adds r1, r7, #0
	movs r2, #7
	bl ShowSysHandCursor
	ldr r0, _0808EC88 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808EC76
	ldr r0, _0808EC8C @ =0x00000386
	bl m4aSongNumStart
_0808EC76:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808EC88: .4byte 0x0202BBF8
_0808EC8C: .4byte 0x00000386

	thumb_func_start AtMenuSetUnitStateAndEndFlag
AtMenuSetUnitStateAndEndFlag: @ 0x0808EC90
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #1
_0808EC96:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0808ECB0
	ldr r0, [r2]
	cmp r0, #0
	beq _0808ECB0
	ldr r0, [r2, #0xc]
	ldr r1, _0808ECC4 @ =0xFDFFFFFF
	ands r0, r1
	str r0, [r2, #0xc]
_0808ECB0:
	adds r4, #1
	cmp r4, #0x3f
	ble _0808EC96
	adds r1, r5, #0
	adds r1, #0x36
	movs r0, #1
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808ECC4: .4byte 0xFDFFFFFF

	thumb_func_start AtMenu_ResetScreenEffect
AtMenu_ResetScreenEffect: @ 0x0808ECC8
	push {r4, lr}
	adds r4, r0, #0
	bl EndAllProcChildren
	bl EndMuralBackground_
	bl EndPrepSpecialCharEffect
	movs r0, #0
	bl InitBgs
	ldr r3, _0808ED2C @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0xc0
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _0808ED30 @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #0x20
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808ED24
	adds r0, r4, #0
	bl sub_0807CC38
_0808ED24:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808ED2C: .4byte 0x03002870
_0808ED30: .4byte 0x0000FFE0

	thumb_func_start AtMenu_ResetBmUiEffect
AtMenu_ResetBmUiEffect: @ 0x0808ED34
	push {r4, lr}
	adds r4, r0, #0
	bl ReorderPlayerUnitsBasedOnDeployment
	adds r4, #0x36
	ldrb r0, [r4]
	cmp r0, #0
	beq _0808ED4A
	bl EndPrepScreen
	b _0808ED58
_0808ED4A:
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808ED58
	bl sub_0803DA24
_0808ED58:
	bl SyncUnitDeploymentState
	bl ResetUnitSprites
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start AtMenu_StartSubmenu
AtMenu_StartSubmenu: @ 0x0808ED70
	push {r4, lr}
	adds r4, r0, #0
	bl StartPrepAtSubMenuUI
	adds r0, r4, #0
	adds r0, #0x33
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #4
	bhi _0808EDF8
	lsls r0, r0, #2
	ldr r1, _0808ED90 @ =_0808ED94
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808ED90: .4byte _0808ED94
_0808ED94: @ jump table
	.4byte _0808EDB8 @ case 0
	.4byte _0808EDB0 @ case 1
	.4byte _0808EDE0 @ case 2
	.4byte _0808EDC8 @ case 3
	.4byte _0808EDA8 @ case 4
_0808EDA8:
	adds r0, r4, #0
	bl StartChapterStatusScreen_FromPrep
	b _0808EDF8
_0808EDB0:
	adds r0, r4, #0
	bl StartPrepItemScreen
	b _0808EDF8
_0808EDB8:
	ldr r0, _0808EDC4 @ =0x08CC4854
	adds r1, r4, #0
	bl Proc_StartBlocking
	b _0808EDF8
	.align 2, 0
_0808EDC4: .4byte 0x08CC4854
_0808EDC8:
	adds r0, r4, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x2f
	ldrb r1, [r1]
	bl PrepOptionCountToRealIndexByMask
	adds r1, r4, #0
	bl StartFortuneSubMenu
	b _0808EDF8
_0808EDE0:
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #0x80
	movs r2, #0x20
	movs r3, #0
	bl StartBgmVolumeChange
	bl SyncUnitDeploymentState
	adds r0, r4, #0
	bl sub_080A4E0C
_0808EDF8:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start AtMenu_OnSubmenuEnd
AtMenu_OnSubmenuEnd: @ 0x0808EE04
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x33
	ldrb r0, [r5]
	cmp r0, #3
	bne _0808EE20
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x80
	movs r2, #0x20
	movs r3, #0
	bl StartBgmVolumeChange
_0808EE20:
	ldrb r0, [r5]
	subs r0, #1
	cmp r0, #4
	bhi _0808EE68
	lsls r0, r0, #2
	ldr r1, _0808EE34 @ =_0808EE38
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808EE34: .4byte _0808EE38
_0808EE38: @ jump table
	.4byte _0808EE60 @ case 0
	.4byte _0808EE60 @ case 1
	.4byte _0808EE56 @ case 2
	.4byte _0808EE4C @ case 3
	.4byte _0808EE60 @ case 4
_0808EE4C:
	adds r0, r4, #0
	movs r1, #0xd
	bl Proc_Goto
	b _0808EE68
_0808EE56:
	adds r0, r4, #0
	movs r1, #7
	bl Proc_Goto
	b _0808EE68
_0808EE60:
	adds r0, r4, #0
	movs r1, #9
	bl Proc_Goto
_0808EE68:
	adds r1, r4, #0
	adds r1, #0x33
	movs r0, #0
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0808EE78
sub_0808EE78: @ 0x0808EE78
	ldr r2, _0808EE94 @ =0x03002870
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	bx lr
	.align 2, 0
_0808EE94: .4byte 0x03002870

	thumb_func_start sub_0808EE98
sub_0808EE98: @ 0x0808EE98
	push {lr}
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808EEAC
	bl LockGame
	bl LockBmDisplay
_0808EEAC:
	pop {r0}
	bx r0

	thumb_func_start sub_0808EEB0
sub_0808EEB0: @ 0x0808EEB0
	push {lr}
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808EEC4
	bl UnlockBmDisplay
	bl UnlockGame
_0808EEC4:
	pop {r0}
	bx r0

	thumb_func_start StartPrepAtMenu
StartPrepAtMenu: @ 0x0808EEC8
	push {lr}
	ldr r0, _0808EED8 @ =0x08CC3BDC
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0808EED8: .4byte 0x08CC3BDC

	thumb_func_start StartPrepAtMenuWithConfig
StartPrepAtMenuWithConfig: @ 0x0808EEDC
	push {lr}
	ldr r0, _0808EEF4 @ =0x08CC3BDC
	movs r1, #3
	bl Proc_Start
	bl RemoveSomeUnitItems
	bl ResetSioPidPool
	pop {r0}
	bx r0
	.align 2, 0
_0808EEF4: .4byte 0x08CC3BDC

	thumb_func_start HasConvoyAccess_
HasConvoyAccess_: @ 0x0808EEF8
	push {r4, lr}
	cmp r0, #0
	beq _0808EF04
	cmp r0, #1
	beq _0808EF34
	b _0808EF86
_0808EF04:
	movs r4, #1
_0808EF06:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0808EF28
	ldr r1, [r0]
	cmp r1, #0
	beq _0808EF28
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	bne _0808EF30
_0808EF28:
	adds r4, #1
	cmp r4, #0x3f
	ble _0808EF06
	b _0808EF86
_0808EF30:
	movs r0, #1
	b _0808EF88
_0808EF34:
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808EF86
	ldr r4, _0808EF90 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r4, [r4, #0x1b]
	cmp r4, #3
	bne _0808EF52
	movs r1, #1
_0808EF52:
	adds r0, #0x86
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _0808EF86
	movs r4, #1
_0808EF5E:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0808EF80
	ldr r1, [r0]
	cmp r1, #0
	beq _0808EF80
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	bne _0808EF30
_0808EF80:
	adds r4, #1
	cmp r4, #0x3f
	ble _0808EF5E
_0808EF86:
	movs r0, #0
_0808EF88:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0808EF90: .4byte 0x0202BBF8

	thumb_func_start sub_0808EF94
sub_0808EF94: @ 0x0808EF94
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r2, [r7, #0x5c]
	movs r3, #0x8f
	lsls r3, r3, #6
	movs r0, #0x70
	movs r1, #4
	bl sub_0808F808
	movs r6, #0x8d
	lsls r6, r6, #7
	movs r5, #0x80
	movs r4, #2
_0808EFB0:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x14
	ldr r3, _0808EFF4 @ =0x08B905F8
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _0808EFB0
	adds r2, r7, #0
	adds r2, #0x64
	ldrh r0, [r2]
	cmp r0, #1
	bne _0808EFEC
	ldr r0, _0808EFF8 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0808EFEC
	movs r0, #0
	strh r0, [r2]
	adds r0, r7, #0
	movs r1, #0x64
	bl Proc_Goto
_0808EFEC:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808EFF4: .4byte 0x08B905F8
_0808EFF8: .4byte 0x08B857F8

	thumb_func_start sub_0808EFFC
sub_0808EFFC: @ 0x0808EFFC
	push {r4, lr}
	movs r4, #1
_0808F000:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0808F024
	ldr r1, [r0]
	cmp r1, #0
	beq _0808F024
	ldrb r1, [r1, #4]
	cmp r1, #0x23
	bne _0808F024
	ldr r0, [r0, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0808F02A
	movs r0, #1
	b _0808F02C
_0808F024:
	adds r4, #1
	cmp r4, #0x3f
	ble _0808F000
_0808F02A:
	movs r0, #0
_0808F02C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0808F034
sub_0808F034: @ 0x0808F034
	push {r4, lr}
	ldr r4, _0808F098 @ =0x0202BBF8
	movs r0, #0x80
	ldrb r1, [r4, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _0808F09C
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808F09C
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _0808F09C
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r4, [r4, #0x1b]
	cmp r4, #3
	bne _0808F06C
	movs r1, #1
_0808F06C:
	adds r0, #0x86
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _0808F09C
	movs r0, #0x28
	bl GetUnitFromCharId
	cmp r0, #0
	beq _0808F09C
	ldrb r1, [r0, #8]
	cmp r1, #0x14
	bne _0808F09C
	ldr r0, [r0, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x44
	bne _0808F09C
	movs r0, #0x90
	bl ClearFlag
	movs r0, #1
	b _0808F09E
	.align 2, 0
_0808F098: .4byte 0x0202BBF8
_0808F09C:
	movs r0, #0
_0808F09E:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0808F0A4
sub_0808F0A4: @ 0x0808F0A4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	movs r5, #0
	str r5, [r6, #0x58]
	ldr r4, _0808F0C8 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	cmp r0, #0x11
	beq _0808F0E0
	cmp r0, #0x11
	bgt _0808F0CC
	cmp r0, #9
	beq _0808F0D2
	b _0808F12C
	.align 2, 0
_0808F0C8: .4byte 0x0202BBF8
_0808F0CC:
	cmp r0, #0x14
	beq _0808F118
	b _0808F12C
_0808F0D2:
	bl sub_0808EFFC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808F12C
	movs r0, #8
	b _0808F12A
_0808F0E0:
	movs r0, #0x6a
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808F106
	ldr r1, [r6, #0x58]
	movs r0, #4
	orrs r1, r0
	str r1, [r6, #0x58]
	movs r0, #0x40
	ldrb r4, [r4, #0x14]
	ands r0, r4
	cmp r0, #0
	bne _0808F12C
	movs r0, #1
	orrs r1, r0
	str r1, [r6, #0x58]
	b _0808F12C
_0808F106:
	movs r0, #0x40
	ldrb r4, [r4, #0x14]
	ands r0, r4
	cmp r0, #0
	bne _0808F12C
	ldr r0, [r6, #0x58]
	movs r1, #2
	orrs r0, r1
	b _0808F12A
_0808F118:
	movs r0, #0x6a
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808F128
	str r5, [r6, #0x58]
	b _0808F12C
_0808F128:
	movs r0, #4
_0808F12A:
	str r0, [r6, #0x58]
_0808F12C:
	bl sub_0808F034
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808F13A
	movs r0, #0x10
	str r0, [r6, #0x58]
_0808F13A:
	ldr r0, [r6, #0x58]
	cmp r0, #0
	bne _0808F14A
	adds r0, r6, #0
	movs r1, #0xc8
	bl Proc_Goto
	b _0808F35C
_0808F14A:
	movs r0, #0
	bl InitBgs
	bl InitFaces
	bl ResetText
	bl UnpackUiWindowFrameGraphics
	bl ApplySystemObjectsGraphics
	ldr r3, _0808F2F4 @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	movs r2, #2
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	ldr r4, _0808F2F8 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r4, [r4, #0x1b]
	cmp r4, #3
	bne _0808F1A0
	movs r1, #1
_0808F1A0:
	adds r0, #0x84
	adds r0, r0, r1
	ldrb r0, [r0]
	str r0, [r6, #0x5c]
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	movs r1, #4
	movs r2, #0xa
	movs r3, #0xc
	bl DrawUiFrame2
	ldr r0, _0808F2FC @ =0x0000113D
	bl DecodeMsg
	ldr r5, _0808F300 @ =0x02023DA6
	movs r4, #8
	str r4, [sp]
	str r0, [sp, #4]
	movs r0, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	ldr r0, _0808F304 @ =0x0000113E
	bl DecodeMsg
	adds r1, r5, #0
	adds r1, #0x80
	str r4, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	ldr r0, _0808F308 @ =0x00001146
	bl DecodeMsg
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r5, r2
	str r4, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	ldr r0, _0808F30C @ =0x00001141
	bl DecodeMsg
	movs r2, #0xc0
	lsls r2, r2, #1
	adds r1, r5, r2
	str r4, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	movs r0, #0x8a
	lsls r0, r0, #5
	bl DecodeMsg
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r5, r2
	str r4, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	ldr r0, _0808F310 @ =0x08404BBC
	movs r1, #0xf0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0808F314 @ =0x08404BDC
	ldr r1, _0808F318 @ =0x06005800
	bl Decompress
	ldr r0, _0808F31C @ =0x02023578
	ldr r1, _0808F320 @ =0x084050D8
	ldr r2, _0808F324 @ =0x0000F2C0
	bl sub_080AACD8
	adds r7, r6, #0
	adds r7, #0x4c
	movs r0, #0x64
	adds r0, r0, r6
	mov r8, r0
	ldr r5, _0808F328 @ =0x020106B4
	movs r4, #4
_0808F266:
	adds r0, r5, #0
	movs r1, #0xe
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0808F266
	ldr r0, _0808F32C @ =0x08405EC4
	ldr r1, _0808F330 @ =0x06011000
	bl Decompress
	ldr r0, _0808F334 @ =0x0840624C
	movs r1, #0xf0
	lsls r1, r1, #2
	movs r2, #0x40
	bl ApplyPaletteExt
	movs r0, #2
	bl EnableBgSync
	movs r0, #0
	movs r1, #8
	bl StartPrepMuralBackground
	ldr r0, _0808F338 @ =0x084062AC
	movs r2, #0x83
	lsls r2, r2, #3
	ldr r3, _0808F33C @ =0x0000EC80
	movs r4, #0
	str r4, [sp]
	movs r1, #0xd
	str r1, [sp, #4]
	movs r1, #0x78
	bl StartSpriteAnimProc
	strh r4, [r7]
	movs r0, #0x80
	lsls r0, r0, #2
	movs r1, #3
	movs r2, #1
	bl InitTalk
	adds r0, r6, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	movs r0, #0xf0
	lsls r0, r0, #7
	movs r1, #2
	bl DrawAtMenuUpfx
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #4
	bl Prep_DrawChapterGoal
	ldr r0, _0808F2F8 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #1
	bne _0808F344
	ldr r0, _0808F340 @ =0x000003E3
	adds r1, r6, #0
	bl StartPrepMenuDescHandler
	b _0808F34E
	.align 2, 0
_0808F2F4: .4byte 0x03002870
_0808F2F8: .4byte 0x0202BBF8
_0808F2FC: .4byte 0x0000113D
_0808F300: .4byte 0x02023DA6
_0808F304: .4byte 0x0000113E
_0808F308: .4byte 0x00001146
_0808F30C: .4byte 0x00001141
_0808F310: .4byte 0x08404BBC
_0808F314: .4byte 0x08404BDC
_0808F318: .4byte 0x06005800
_0808F31C: .4byte 0x02023578
_0808F320: .4byte 0x084050D8
_0808F324: .4byte 0x0000F2C0
_0808F328: .4byte 0x020106B4
_0808F32C: .4byte 0x08405EC4
_0808F330: .4byte 0x06011000
_0808F334: .4byte 0x0840624C
_0808F338: .4byte 0x084062AC
_0808F33C: .4byte 0x0000EC80
_0808F340: .4byte 0x000003E3
_0808F344:
	movs r0, #0xf9
	lsls r0, r0, #2
	adds r1, r6, #0
	bl StartPrepMenuDescHandler
_0808F34E:
	movs r0, #0
	mov r1, r8
	strh r0, [r1]
	ldr r0, _0808F368 @ =sub_0808EF94
	adds r1, r6, #0
	bl StartParallelWorker
_0808F35C:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808F368: .4byte sub_0808EF94

	thumb_func_start sub_0808F36C
sub_0808F36C: @ 0x0808F36C
	ldr r3, _0808F3AC @ =0x03002870
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
	movs r0, #0xe
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r2, [r0]
	ldr r0, _0808F3B0 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	ldr r1, _0808F3B4 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	bx lr
	.align 2, 0
_0808F3AC: .4byte 0x03002870
_0808F3B0: .4byte 0x0000FFE0
_0808F3B4: .4byte 0x0000E0FF

	thumb_func_start sub_0808F3B8
sub_0808F3B8: @ 0x0808F3B8
	adds r2, r0, #0
	ldr r0, [r2, #0x58]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0808F3CC
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #1
	strh r0, [r1]
_0808F3CC:
	bx lr
	.align 2, 0

	thumb_func_start sub_0808F3D0
sub_0808F3D0: @ 0x0808F3D0
	push {r4, lr}
	sub sp, #0x10
	adds r2, r0, #0
	ldr r0, [r2, #0x58]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _0808F3EA
	adds r0, r2, #0
	movs r1, #1
	bl Proc_Goto
	b _0808F428
_0808F3EA:
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x14
	movs r1, #0x28
	movs r2, #6
	bl ShowSysHandCursor
	movs r4, #0
	str r4, [sp]
	movs r0, #0x20
	movs r1, #0xd4
	movs r2, #0x50
	movs r3, #0x82
	bl StartTalkFace
	movs r3, #1
	rsbs r3, r3, #0
	ldr r0, _0808F430 @ =0x00000FCE
	str r0, [sp]
	ldr r0, _0808F434 @ =0x06011800
	str r0, [sp, #4]
	str r3, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x12
	adds r2, r3, #0
	bl StartCgText
	ldr r0, _0808F438 @ =0x0002000A
	bl SetCgTextFlags
_0808F428:
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808F430: .4byte 0x00000FCE
_0808F434: .4byte 0x06011800
_0808F438: .4byte 0x0002000A

	thumb_func_start sub_0808F43C
sub_0808F43C: @ 0x0808F43C
	push {r4, lr}
	sub sp, #0x10
	adds r2, r0, #0
	ldr r0, [r2, #0x58]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0808F456
	adds r0, r2, #0
	movs r1, #2
	bl Proc_Goto
	b _0808F494
_0808F456:
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x14
	movs r1, #0x38
	movs r2, #6
	bl ShowSysHandCursor
	movs r4, #0
	str r4, [sp]
	movs r0, #0x4a
	movs r1, #0xd4
	movs r2, #0x50
	movs r3, #0x82
	bl StartTalkFace
	movs r3, #1
	rsbs r3, r3, #0
	ldr r0, _0808F49C @ =0x00000FC6
	str r0, [sp]
	ldr r0, _0808F4A0 @ =0x06011800
	str r0, [sp, #4]
	str r3, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x12
	adds r2, r3, #0
	bl StartCgText
	ldr r0, _0808F4A4 @ =0x0002000A
	bl SetCgTextFlags
_0808F494:
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808F49C: .4byte 0x00000FC6
_0808F4A0: .4byte 0x06011800
_0808F4A4: .4byte 0x0002000A

	thumb_func_start sub_0808F4A8
sub_0808F4A8: @ 0x0808F4A8
	push {r4, r5, lr}
	sub sp, #0x10
	adds r2, r0, #0
	movs r5, #0
	ldr r1, [r2, #0x58]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _0808F4C4
	adds r0, r2, #0
	movs r1, #3
	bl Proc_Goto
	b _0808F514
_0808F4C4:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808F4CE
	ldr r5, _0808F51C @ =0x00000FC7
_0808F4CE:
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	beq _0808F4D8
	ldr r5, _0808F520 @ =0x00000FC8
_0808F4D8:
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x14
	movs r1, #0x48
	movs r2, #6
	bl ShowSysHandCursor
	movs r4, #0
	str r4, [sp]
	movs r0, #0x4b
	movs r1, #0xd4
	movs r2, #0x50
	movs r3, #0x82
	bl StartTalkFace
	movs r3, #1
	rsbs r3, r3, #0
	str r5, [sp]
	ldr r0, _0808F524 @ =0x06011800
	str r0, [sp, #4]
	str r3, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x12
	adds r2, r3, #0
	bl StartCgText
	ldr r0, _0808F528 @ =0x0002000A
	bl SetCgTextFlags
_0808F514:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808F51C: .4byte 0x00000FC7
_0808F520: .4byte 0x00000FC8
_0808F524: .4byte 0x06011800
_0808F528: .4byte 0x0002000A

	thumb_func_start sub_0808F52C
sub_0808F52C: @ 0x0808F52C
	push {r4, lr}
	sub sp, #0x10
	adds r2, r0, #0
	ldr r0, [r2, #0x58]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0808F546
	adds r0, r2, #0
	movs r1, #0xa
	bl Proc_Goto
	b _0808F584
_0808F546:
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x14
	movs r1, #0x28
	movs r2, #6
	bl ShowSysHandCursor
	movs r4, #0
	str r4, [sp]
	movs r0, #0x4a
	movs r1, #0xd4
	movs r2, #0x50
	movs r3, #0x82
	bl StartTalkFace
	movs r3, #1
	rsbs r3, r3, #0
	ldr r0, _0808F58C @ =0x00000FCD
	str r0, [sp]
	ldr r0, _0808F590 @ =0x06011800
	str r0, [sp, #4]
	str r3, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x12
	adds r2, r3, #0
	bl StartCgText
	ldr r0, _0808F594 @ =0x0002000A
	bl SetCgTextFlags
_0808F584:
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808F58C: .4byte 0x00000FCD
_0808F590: .4byte 0x06011800
_0808F594: .4byte 0x0002000A

	thumb_func_start sub_0808F598
sub_0808F598: @ 0x0808F598
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	bx lr

	thumb_func_start sub_0808F5A0
sub_0808F5A0: @ 0x0808F5A0
	push {lr}
	bl EndCgText
	bl ClearTalk
	bl EndEachSpriteAnimProc
	bl EndPrepMuralBackground
	ldr r3, _0808F610 @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _0808F614 @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r3, #0x3c]
	pop {r0}
	bx r0
	.align 2, 0
_0808F610: .4byte 0x03002870
_0808F614: .4byte 0x0000FFE0

	thumb_func_start ConvoyPromotion_Init
ConvoyPromotion_Init: @ 0x0808F618
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0x28
	bl GetUnitFromCharId
	adds r5, r0, #0
	cmp r5, #0
	bne _0808F630
	adds r0, r4, #0
	bl Proc_End
	b _0808F678
_0808F630:
	bl GetGameLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x4c
	movs r4, #0
	strh r0, [r1]
	ldr r2, _0808F680 @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	subs r1, #0x80
	adds r0, r5, #0
	movs r2, #0
	bl sub_0802CBAC
	ldr r1, _0808F684 @ =0x0203A3D8
	movs r0, #0x88
	lsls r0, r0, #1
	strh r0, [r1]
	ldr r0, _0808F688 @ =0x0203A3F0
	adds r0, #0x4a
	strh r4, [r0]
	ldr r0, _0808F68C @ =0x0203A470
	adds r0, #0x4a
	strh r4, [r0]
	bl BeginBattleAnimations
_0808F678:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808F680: .4byte 0x03002870
_0808F684: .4byte 0x0203A3D8
_0808F688: .4byte 0x0203A3F0
_0808F68C: .4byte 0x0203A470

	thumb_func_start sub_0808F690
sub_0808F690: @ 0x0808F690
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r4, [r0, r1]
	bl GetGameLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bne _0808F6AC
	adds r0, r5, #0
	bl Proc_Break
_0808F6AC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NullExpForChar100AndResetScreen
NullExpForChar100AndResetScreen: @ 0x0808F6B4
	push {lr}
	sub sp, #4
	movs r0, #0x28
	bl GetUnitFromCharId
	adds r1, r0, #0
	cmp r1, #0
	beq _0808F6C8
	movs r0, #0xff
	strb r0, [r1, #9]
_0808F6C8:
	ldr r2, _0808F718 @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r3, #0
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r1, #0xa
	movs r0, #0x10
	strb r0, [r1]
	subs r0, #0x12
	ldrb r1, [r2, #1]
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
	strb r0, [r2, #1]
	movs r2, #0x80
	lsls r2, r2, #1
	str r3, [sp]
	movs r0, #0x49
	adds r1, r2, #0
	movs r3, #0x20
	bl CallSomeSoundMaybe
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0808F718: .4byte 0x03002870

	thumb_func_start PrepPromoteDebugMaybe
PrepPromoteDebugMaybe: @ 0x0808F71C
	push {r4, lr}
	adds r4, r0, #0
	bl EndCgText
	bl ClearTalk
	bl EndEachSpriteAnimProc
	bl EndPrepMuralBackground
	ldr r3, _0808F79C @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _0808F7A0 @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r3, #0x3c]
	adds r0, r4, #0
	bl EndAllProcChildren
	ldr r0, _0808F7A4 @ =0x08CC3DEC
	adds r1, r4, #0
	bl Proc_StartBlocking
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808F79C: .4byte 0x03002870
_0808F7A0: .4byte 0x0000FFE0
_0808F7A4: .4byte 0x08CC3DEC

	thumb_func_start sub_0808F7A8
sub_0808F7A8: @ 0x0808F7A8
	push {lr}
	sub sp, #4
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0
	str r0, [sp]
	movs r2, #0
	movs r3, #0x20
	bl CallSomeSoundMaybe
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0808F7C4
sub_0808F7C4: @ 0x0808F7C4
	push {lr}
	ldr r0, _0808F7D4 @ =0x08CC3E2C
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0808F7D4: .4byte 0x08CC3E2C

	thumb_func_start sub_0808F7D8
sub_0808F7D8: @ 0x0808F7D8
	push {lr}
	ldr r0, _0808F7EC @ =0x08CC3E2C
	bl Proc_Find
	cmp r0, #0
	beq _0808F7E6
	movs r0, #1
_0808F7E6:
	pop {r1}
	bx r1
	.align 2, 0
_0808F7EC: .4byte 0x08CC3E2C

	thumb_func_start sub_0808F7F0
sub_0808F7F0: @ 0x0808F7F0
	push {lr}
	ldr r0, _0808F804 @ =0x08CC3BDC
	bl Proc_Find
	cmp r0, #0
	beq _0808F7FE
	movs r0, #1
_0808F7FE:
	pop {r1}
	bx r1
	.align 2, 0
_0808F804: .4byte 0x08CC3BDC

	thumb_func_start sub_0808F808
sub_0808F808: @ 0x0808F808
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	mov r8, r1
	adds r4, r2, #0
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _0808F854
	subs r6, #4
	adds r1, r6, #2
	mov r2, r8
	adds r2, #2
	ldr r3, _0808F84C @ =0x08CC3FE6
	str r7, [sp]
	movs r0, #4
	bl PutSpriteExt
	adds r1, r6, #0
	adds r1, #0x38
	ldr r0, _0808F850 @ =0x08CC4060
	ldr r3, [r0, #0x28]
	str r7, [sp]
	movs r0, #4
	mov r2, r8
	bl PutSpriteExt
	b _0808F874
	.align 2, 0
_0808F84C: .4byte 0x08CC3FE6
_0808F850: .4byte 0x08CC4060
_0808F854:
	adds r1, r6, #2
	mov r2, r8
	adds r2, #2
	ldr r3, _0808F8A0 @ =0x08CC3FCC
	str r7, [sp]
	movs r0, #4
	bl PutSpriteExt
	adds r1, r6, #0
	adds r1, #0x38
	ldr r3, _0808F8A4 @ =0x08CC3FC4
	str r7, [sp]
	movs r0, #4
	mov r2, r8
	bl PutSpriteExt
_0808F874:
	ldr r3, _0808F8A8 @ =0x08CC3FB6
	str r7, [sp]
	movs r0, #4
	adds r1, r6, #0
	mov r2, r8
	bl PutSpriteExt
	asrs r4, r4, #1
	mov sb, r4
	cmp r4, #9
	bgt _0808F8B0
	adds r1, r6, #0
	adds r1, #0x28
	ldr r0, _0808F8AC @ =0x08CC4060
	ldr r3, [r0, #0x2c]
	str r7, [sp]
	movs r0, #4
	mov r2, r8
	bl PutSpriteExt
	b _0808F8D0
	.align 2, 0
_0808F8A0: .4byte 0x08CC3FCC
_0808F8A4: .4byte 0x08CC3FC4
_0808F8A8: .4byte 0x08CC3FB6
_0808F8AC: .4byte 0x08CC4060
_0808F8B0:
	adds r5, r6, #0
	adds r5, #0x28
	ldr r4, _0808F900 @ =0x08CC4060
	mov r0, sb
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r3, [r0]
	str r7, [sp]
	movs r0, #4
	adds r1, r5, #0
	mov r2, r8
	bl PutSpriteExt
_0808F8D0:
	adds r5, r6, #0
	adds r5, #0x30
	ldr r4, _0808F900 @ =0x08CC4060
	mov r0, sb
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r3, [r0]
	str r7, [sp]
	movs r0, #4
	adds r1, r5, #0
	mov r2, r8
	bl PutSpriteExt
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808F900: .4byte 0x08CC4060

	thumb_func_start PrepScreenSprite_OnDraw
PrepScreenSprite_OnDraw: @ 0x0808F904
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808F988
	adds r1, r7, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	cmp r0, #0
	beq _0808F930
	adds r2, r0, #0
	movs r3, #0xc7
	lsls r3, r3, #7
	movs r0, #0x70
	movs r1, #4
	bl sub_0808F808
_0808F930:
	movs r0, #0x32
	adds r0, r0, r7
	mov r8, r0
	ldr r6, _0808F97C @ =0x0000B680
	movs r5, #0x80
	movs r4, #2
_0808F93C:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x14
	ldr r3, _0808F980 @ =0x08B905F8
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _0808F93C
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, #0
	bne _0808F968
	ldrh r7, [r7, #0x34]
	lsrs r0, r7, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0808F99A
_0808F968:
	ldr r3, _0808F984 @ =0x08CC482C
	movs r0, #0xc0
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #4
	movs r1, #6
	movs r2, #0x80
	bl PutSpriteExt
	b _0808F99A
	.align 2, 0
_0808F97C: .4byte 0x0000B680
_0808F980: .4byte 0x08B905F8
_0808F984: .4byte 0x08CC482C
_0808F988:
	ldr r3, _0808F9A8 @ =0x08CC4840
	movs r0, #0xc0
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #4
	movs r1, #6
	movs r2, #0x80
	bl PutSpriteExt
_0808F99A:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808F9A8: .4byte 0x08CC4840

	thumb_func_start sub_0808F9AC
sub_0808F9AC: @ 0x0808F9AC
	bx lr
	.align 2, 0

	thumb_func_start sub_0808F9B0
sub_0808F9B0: @ 0x0808F9B0
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2a
	movs r0, #0
	strb r0, [r1]
	strh r0, [r5, #0x34]
	bl ForceSyncUnitSpriteSheet
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _0808F9F0
	ldr r0, _0808F9EC @ =0x084062AC
	movs r2, #0x83
	lsls r2, r2, #3
	movs r3, #0xb9
	lsls r3, r3, #6
	movs r1, #1
	str r1, [sp]
	movs r1, #0xd
	str r1, [sp, #4]
	movs r1, #0x78
	bl StartSpriteAnimProc
	str r0, [r5, #0x38]
	b _0808FA28
	.align 2, 0
_0808F9EC: .4byte 0x084062AC
_0808F9F0:
	ldr r0, _0808FA40 @ =0x084062AC
	movs r2, #0x83
	lsls r2, r2, #3
	movs r3, #0xb9
	lsls r3, r3, #6
	str r1, [sp]
	movs r1, #0xd
	str r1, [sp, #4]
	movs r1, #0x78
	bl StartSpriteAnimProc
	str r0, [r5, #0x38]
	ldr r4, _0808FA44 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r4, [r4, #0x1b]
	cmp r4, #3
	bne _0808FA1C
	movs r1, #1
_0808FA1C:
	adds r0, #0x84
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r5, #0
	adds r1, #0x2f
	strb r0, [r1]
_0808FA28:
	adds r1, r5, #0
	adds r1, #0x2b
	movs r0, #0
	strb r0, [r1]
	adds r1, #7
	movs r0, #1
	strb r0, [r1]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808FA40: .4byte 0x084062AC
_0808FA44: .4byte 0x0202BBF8

	thumb_func_start ProcPrepSpChar_Idle
ProcPrepSpChar_Idle: @ 0x0808FA48
	push {r4, lr}
	adds r4, r0, #0
	bl PrepScreenSprite_OnDraw
	ldrh r0, [r4, #0x34]
	adds r0, #1
	strh r0, [r4, #0x34]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start ProcPrepSpChar_OnEnd
ProcPrepSpChar_OnEnd: @ 0x0808FA5C
	push {lr}
	ldr r0, [r0, #0x38]
	bl EndSpriteAnimProc
	pop {r0}
	bx r0

	thumb_func_start PrepSpecialChar_BlinkButtonStart
PrepSpecialChar_BlinkButtonStart: @ 0x0808FA68
	push {lr}
	ldr r0, _0808FA80 @ =0x08CC4134
	bl Proc_Find
	cmp r0, #0
	beq _0808FA7C
	adds r1, r0, #0
	adds r1, #0x32
	movs r0, #0
	strb r0, [r1]
_0808FA7C:
	pop {r0}
	bx r0
	.align 2, 0
_0808FA80: .4byte 0x08CC4134

	thumb_func_start StartPrepSpecialCharEffect
StartPrepSpecialCharEffect: @ 0x0808FA84
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0808FAA4 @ =0x08CC4134
	adds r0, r4, #0
	bl Proc_Find
	bl Proc_End
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808FAA4: .4byte 0x08CC4134

	thumb_func_start EndPrepSpecialCharEffect
EndPrepSpecialCharEffect: @ 0x0808FAA8
	push {lr}
	ldr r0, _0808FAB8 @ =0x08CC4134
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0808FAB8: .4byte 0x08CC4134

	thumb_func_start sub_0808FABC
sub_0808FABC: @ 0x0808FABC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r2, r0, #0
	adds r3, r2, #0
	subs r3, #0x38
	cmp r3, #0
	bge _0808FAD2
	movs r7, #0
	adds r6, r2, #0
	b _0808FAE8
_0808FAD2:
	adds r0, r2, #0
	adds r0, #0x38
	cmp r0, #0xf0
	ble _0808FAE2
	movs r7, #0xf
	adds r6, r2, #0
	subs r6, #0x78
	b _0808FAE8
_0808FAE2:
	asrs r7, r3, #3
	lsls r0, r7, #3
	subs r6, r2, r0
_0808FAE8:
	adds r3, r1, #0
	subs r3, #0x28
	adds r0, r1, #0
	adds r0, #0x30
	cmp r0, #0xa0
	ble _0808FAFA
	movs r5, #8
	subs r1, #0x40
	b _0808FB0A
_0808FAFA:
	adds r0, r3, #0
	cmp r0, #0
	bge _0808FB04
	adds r0, r1, #0
	subs r0, #0x21
_0808FB04:
	asrs r5, r0, #3
	lsls r0, r5, #3
	subs r1, r1, r0
_0808FB0A:
	mov r8, r1
	ldr r4, _0808FB50 @ =0x02022C68
	adds r0, r4, #0
	movs r1, #2
	adds r2, r7, #0
	bl PutNumberOrBlank
	adds r0, r4, #0
	adds r0, #0x80
	movs r1, #2
	adds r2, r5, #0
	bl PutNumberOrBlank
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, r1
	movs r1, #2
	adds r2, r6, #0
	bl PutNumberOrBlank
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r4, r1
	movs r1, #2
	mov r2, r8
	bl PutNumberOrBlank
	movs r0, #1
	bl EnableBgSync
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808FB50: .4byte 0x02022C68

	thumb_func_start PrepMenu_OnInit
PrepMenu_OnInit: @ 0x0808FB54
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r2, #0
	movs r1, #7
	adds r0, #0x54
_0808FB5E:
	str r2, [r0]
	subs r0, #4
	subs r1, #1
	cmp r1, #0
	bge _0808FB5E
	movs r4, #0
	adds r0, r5, #0
	adds r0, #0x2a
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, r5, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	str r4, [r5, #0x58]
	str r4, [r5, #0x5c]
	str r4, [r5, #0x60]
	adds r0, r5, #0
	adds r0, #0x29
	strb r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PrepMenu_CtrlLoop
PrepMenu_CtrlLoop: @ 0x0808FB98
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x2a
	ldrb r0, [r5]
	mov sb, r0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	adds r0, #1
	lsls r0, r0, #3
	adds r0, #4
	mov r8, r0
	movs r2, #0x36
	ldrsh r0, [r4, r2]
	adds r0, #1
	lsls r0, r0, #3
	mov r3, sb
	lsls r1, r3, #4
	adds r7, r0, r1
	movs r3, #0x80
	lsls r3, r3, #3
	mov r0, r8
	adds r1, r7, #0
	movs r2, #6
	bl ShowSysHandCursor
	ldrb r5, [r5]
	lsls r1, r5, #2
	adds r0, r4, #0
	adds r0, #0x38
	adds r0, r0, r1
	ldr r5, [r0]
	adds r6, r4, #0
	adds r6, #0x29
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #0
	beq _0808FC0C
	ldr r2, _0808FC08 @ =0x08B857F8
	ldr r1, [r2]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	adds r1, r2, #0
	cmp r0, #0
	bne _0808FBFE
	b _0808FD24
_0808FBFE:
	bl CloseHelpBox
	movs r0, #0
	strb r0, [r6]
	b _0808FDCC
	.align 2, 0
_0808FC08: .4byte 0x08B857F8
_0808FC0C:
	ldr r1, _0808FC34 @ =0x08B857F8
	ldr r0, [r1]
	ldrh r3, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	cmp r0, #0
	beq _0808FC38
	ldr r2, [r5, #0x30]
	cmp r2, #0
	bne _0808FC24
	b _0808FDCC
_0808FC24:
	mov r0, r8
	adds r1, r7, #0
	bl StartHelpBox
	movs r0, #1
	strb r0, [r6]
	b _0808FDCC
	.align 2, 0
_0808FC34: .4byte 0x08B857F8
_0808FC38:
	movs r6, #1
	adds r0, r6, #0
	ands r0, r3
	cmp r0, #0
	beq _0808FC84
	adds r1, r5, #0
	adds r1, #0x38
	adds r0, r6, #0
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0808FD08
	ldr r0, [r5, #0x2c]
	cmp r0, #0
	beq _0808FD08
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	ldr r0, [r4, #0x14]
	ldr r1, [r5, #0x2c]
	bl _call_via_r1
	ldr r0, _0808FC7C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0808FC74
	b _0808FDCC
_0808FC74:
	ldr r0, _0808FC80 @ =0x0000038A
	bl m4aSongNumStart
	b _0808FDCC
	.align 2, 0
_0808FC7C: .4byte 0x0202BBF8
_0808FC80: .4byte 0x0000038A
_0808FC84:
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _0808FCC8
	ldr r1, [r4, #0x58]
	cmp r1, #0
	bne _0808FC94
	b _0808FDCC
_0808FC94:
	ldr r0, [r4, #0x14]
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808FD08
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	ldr r0, _0808FCC0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0808FCB6
	b _0808FDCC
_0808FCB6:
	ldr r0, _0808FCC4 @ =0x0000038B
	bl m4aSongNumStart
	b _0808FDCC
	.align 2, 0
_0808FCC0: .4byte 0x0202BBF8
_0808FCC4: .4byte 0x0000038B
_0808FCC8:
	movs r0, #8
	ands r0, r3
	cmp r0, #0
	beq _0808FD24
	ldr r1, [r4, #0x5c]
	cmp r1, #0
	beq _0808FDCC
	ldr r0, [r4, #0x14]
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808FD08
	ldr r0, _0808FD00 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808FCF4
	ldr r0, _0808FD04 @ =0x0000038A
	bl m4aSongNumStart
_0808FCF4:
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	b _0808FDCC
	.align 2, 0
_0808FD00: .4byte 0x0202BBF8
_0808FD04: .4byte 0x0000038A
_0808FD08:
	ldr r0, _0808FD20 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808FDCC
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _0808FDCC
	.align 2, 0
_0808FD20: .4byte 0x0202BBF8
_0808FD24:
	ldr r3, [r1]
	movs r6, #0x40
	adds r0, r6, #0
	ldrh r2, [r3, #6]
	ands r0, r2
	adds r5, r4, #0
	adds r5, #0x2a
	cmp r0, #0
	beq _0808FD50
	ldrb r0, [r5]
	cmp r0, #0
	bne _0808FD4C
	adds r0, r6, #0
	ldrh r3, [r3, #8]
	ands r0, r3
	cmp r0, #0
	beq _0808FD50
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r0, [r0]
_0808FD4C:
	subs r0, #1
	strb r0, [r5]
_0808FD50:
	ldr r1, [r1]
	movs r2, #0x80
	adds r0, r2, #0
	ldrh r3, [r1, #6]
	ands r0, r3
	cmp r0, #0
	beq _0808FD7E
	ldrb r3, [r5]
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	subs r0, #1
	cmp r3, r0
	bge _0808FD70
	adds r0, r3, #1
	b _0808FD7C
_0808FD70:
	adds r0, r2, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0808FD7E
	movs r0, #0
_0808FD7C:
	strb r0, [r5]
_0808FD7E:
	ldrb r0, [r5]
	cmp sb, r0
	beq _0808FDCC
	ldr r0, _0808FDD8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808FD96
	ldr r0, _0808FDDC @ =0x00000386
	bl m4aSongNumStart
_0808FD96:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0808FDCC
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	adds r0, #1
	lsls r0, r0, #3
	adds r0, #4
	movs r2, #0x36
	ldrsh r1, [r4, r2]
	adds r1, #1
	lsls r1, r1, #3
	ldrb r3, [r5]
	lsls r2, r3, #4
	adds r1, r1, r2
	lsls r3, r3, #2
	adds r2, r4, #0
	adds r2, #0x38
	adds r2, r2, r3
	ldr r5, [r2]
	ldr r2, [r5, #0x30]
	bl StartHelpBox
_0808FDCC:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808FDD8: .4byte 0x0202BBF8
_0808FDDC: .4byte 0x00000386

	thumb_func_start PrepMenu_ShowFrozenHand
PrepMenu_ShowFrozenHand: @ 0x0808FDE0
	push {lr}
	adds r2, r0, #0
	movs r1, #0x34
	ldrsh r0, [r2, r1]
	adds r0, #1
	lsls r0, r0, #3
	adds r0, #4
	movs r3, #0x36
	ldrsh r1, [r2, r3]
	adds r1, #1
	lsls r1, r1, #3
	adds r2, #0x2a
	ldrb r2, [r2]
	lsls r2, r2, #4
	adds r1, r1, r2
	bl DisplayFrozenUiHand
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PrepMenu_ShowActiveHand
PrepMenu_ShowActiveHand: @ 0x0808FE08
	push {lr}
	adds r2, r0, #0
	movs r1, #0x34
	ldrsh r0, [r2, r1]
	adds r0, #1
	lsls r0, r0, #3
	adds r0, #4
	movs r3, #0x36
	ldrsh r1, [r2, r3]
	adds r1, #1
	lsls r1, r1, #3
	adds r2, #0x2a
	ldrb r2, [r2]
	lsls r2, r2, #4
	adds r1, r1, r2
	movs r3, #0x80
	lsls r3, r3, #3
	movs r2, #6
	bl ShowSysHandCursor
	pop {r0}
	bx r0

	thumb_func_start PrepMenu_OnEnd
PrepMenu_OnEnd: @ 0x0808FE34
	push {lr}
	ldr r1, [r0, #0x60]
	cmp r1, #0
	beq _0808FE42
	ldr r0, [r0, #0x14]
	bl _call_via_r1
_0808FE42:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0808FE48
sub_0808FE48: @ 0x0808FE48
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0808FE68 @ =0x08CC416C
	adds r0, r4, #0
	bl Proc_Find
	bl Proc_End
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808FE68: .4byte 0x08CC416C

	thumb_func_start SetPrepScreenMenuOnBPress
SetPrepScreenMenuOnBPress: @ 0x0808FE6C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808FE84 @ =0x08CC416C
	bl Proc_Find
	cmp r0, #0
	beq _0808FE7C
	str r4, [r0, #0x58]
_0808FE7C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808FE84: .4byte 0x08CC416C

	thumb_func_start SetPrepScreenMenuOnStartPress
SetPrepScreenMenuOnStartPress: @ 0x0808FE88
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808FEA0 @ =0x08CC416C
	bl Proc_Find
	cmp r0, #0
	beq _0808FE98
	str r4, [r0, #0x5c]
_0808FE98:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808FEA0: .4byte 0x08CC416C

	thumb_func_start SetPrepScreenMenuOnEnd
SetPrepScreenMenuOnEnd: @ 0x0808FEA4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808FEBC @ =0x08CC416C
	bl Proc_Find
	cmp r0, #0
	beq _0808FEB4
	str r4, [r0, #0x60]
_0808FEB4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808FEBC: .4byte 0x08CC416C

	thumb_func_start SetPrepScreenMenuItem
SetPrepScreenMenuItem: @ 0x0808FEC0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	mov sb, r3
	ldr r0, _0808FF10 @ =0x08CC416C
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _0808FF54
	movs r4, #0
	movs r0, #0x38
	adds r0, r0, r1
	mov sl, r0
	mov r3, sl
_0808FEE8:
	ldr r2, [r3]
	cmp r2, #0
	beq _0808FF14
	adds r0, r2, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, r6
	bne _0808FF14
	str r7, [r2, #0x2c]
	adds r0, r2, #0
	adds r0, #0x38
	mov r1, r8
	strb r1, [r0]
	ldr r0, [r3]
	mov r2, sb
	str r2, [r0, #0x34]
	ldr r1, [sp, #0x20]
	str r1, [r0, #0x30]
	b _0808FF54
	.align 2, 0
_0808FF10: .4byte 0x08CC416C
_0808FF14:
	adds r3, #4
	adds r4, #1
	cmp r4, #7
	ble _0808FEE8
	adds r5, r1, #0
	adds r5, #0x2b
	ldrb r4, [r5]
	ldr r0, _0808FF64 @ =0x08CC415C
	bl Proc_Start
	lsls r1, r4, #2
	add r1, sl
	str r0, [r1]
	adds r0, #0x39
	strb r6, [r0]
	ldr r0, [r1]
	str r7, [r0, #0x2c]
	adds r0, #0x38
	mov r2, r8
	strb r2, [r0]
	ldr r0, [r1]
	mov r1, sb
	str r1, [r0, #0x34]
	ldr r2, [sp, #0x20]
	str r2, [r0, #0x30]
	adds r0, #0x3c
	movs r1, #7
	bl InitText
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_0808FF54:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808FF64: .4byte 0x08CC415C

	thumb_func_start SetPrepScreenMenuSelectedItem
SetPrepScreenMenuSelectedItem: @ 0x0808FF68
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	ldr r0, _0808FF94 @ =0x08CC416C
	bl Proc_Find
	cmp r0, #0
	beq _0808FFA2
	movs r2, #0
	adds r3, r0, #0
	adds r3, #0x2a
	adds r1, r0, #0
	adds r1, #0x38
_0808FF82:
	ldr r0, [r1]
	cmp r0, #0
	beq _0808FF9A
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, r5
	bne _0808FF98
	strb r4, [r3]
	b _0808FFA2
	.align 2, 0
_0808FF94: .4byte 0x08CC416C
_0808FF98:
	adds r4, #1
_0808FF9A:
	adds r1, #4
	adds r2, #1
	cmp r2, #7
	ble _0808FF82
_0808FFA2:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start GetActivePrepMenuItemIndex
GetActivePrepMenuItemIndex: @ 0x0808FFA8
	push {r4, r5, lr}
	movs r4, #0
	ldr r0, _0808FFD8 @ =0x08CC416C
	bl Proc_Find
	cmp r0, #0
	beq _0808FFE6
	movs r3, #0
	movs r1, #0x2a
	adds r1, r1, r0
	mov ip, r1
	adds r2, r0, #0
	adds r2, #0x38
_0808FFC2:
	ldr r1, [r2]
	cmp r1, #0
	beq _0808FFDE
	mov r5, ip
	ldrb r0, [r5]
	cmp r0, r4
	bne _0808FFDC
	adds r0, r1, #0
	adds r0, #0x39
	ldrb r0, [r0]
	b _0808FFE8
	.align 2, 0
_0808FFD8: .4byte 0x08CC416C
_0808FFDC:
	adds r4, #1
_0808FFDE:
	adds r2, #4
	adds r3, #1
	cmp r3, #7
	ble _0808FFC2
_0808FFE6:
	movs r0, #0
_0808FFE8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start DrawPrepScreenMenuFrameAt
DrawPrepScreenMenuFrameAt: @ 0x0808FFF0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r0, _08090094 @ =0x08CC416C
	bl Proc_Find
	mov sb, r0
	cmp r0, #0
	beq _08090086
	movs r0, #0
	mov r1, sb
	strh r6, [r1, #0x34]
	strh r5, [r1, #0x36]
	mov r4, sb
	adds r4, #0x2b
	ldrb r1, [r4]
	lsls r3, r1, #1
	adds r3, #2
	str r0, [sp]
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #0xa
	bl DrawUiFrame2
	mov r8, r4
	ldrb r0, [r4]
	cmp r0, #1
	bls _08090080
	movs r7, #0
	adds r1, r0, #0
	cmp r7, r1
	bge _08090080
	adds r0, r5, #1
	lsls r0, r0, #5
	adds r0, #2
	adds r6, r0, r6
_08090040:
	lsls r1, r7, #2
	mov r0, sb
	adds r0, #0x38
	adds r0, r0, r1
	ldr r4, [r0]
	adds r5, r4, #0
	adds r5, #0x3c
	adds r0, r5, #0
	bl ClearText
	ldr r0, [r4, #0x34]
	bl DecodeMsg
	lsls r1, r6, #1
	ldr r2, _08090098 @ =0x02022C60
	adds r1, r1, r2
	adds r4, #0x38
	movs r2, #1
	ldrb r4, [r4]
	ands r2, r4
	movs r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	bl PutDrawText
	adds r6, #0x40
	adds r7, #1
	mov r0, r8
	ldrb r0, [r0]
	cmp r7, r0
	blt _08090040
_08090080:
	movs r0, #3
	bl EnableBgSync
_08090086:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090094: .4byte 0x08CC416C
_08090098: .4byte 0x02022C60

	thumb_func_start GetPrepMenuItemAmt
GetPrepMenuItemAmt: @ 0x0809009C
	push {lr}
	ldr r0, _080900AC @ =0x08CC416C
	bl Proc_Find
	cmp r0, #0
	bne _080900B0
	movs r0, #0
	b _080900B4
	.align 2, 0
_080900AC: .4byte 0x08CC416C
_080900B0:
	adds r0, #0x2b
	ldrb r0, [r0]
_080900B4:
	pop {r1}
	bx r1

	thumb_func_start EndPrepScreenMenu
EndPrepScreenMenu: @ 0x080900B8
	push {r4, lr}
	ldr r0, _080900D8 @ =0x08CC416C
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _080900D2
	bl ResetPrepMenuScreen
	adds r0, r4, #0
	movs r1, #0xa
	bl Proc_Goto
_080900D2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080900D8: .4byte 0x08CC416C

	thumb_func_start ResetPrepMenuScreen
ResetPrepMenuScreen: @ 0x080900DC
	push {r4, r5, lr}
	ldr r0, _0809013C @ =0x08CC416C
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _08090134
	movs r1, #0x36
	ldrsh r0, [r4, r1]
	lsls r0, r0, #5
	movs r2, #0x34
	ldrsh r1, [r4, r2]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08090140 @ =0x02022C60
	adds r0, r0, r1
	adds r5, r4, #0
	adds r5, #0x2b
	ldrb r1, [r5]
	lsls r2, r1, #1
	adds r2, #2
	movs r1, #9
	movs r3, #0
	bl TmFillRect_thm
	movs r2, #0x36
	ldrsh r0, [r4, r2]
	lsls r0, r0, #5
	movs r2, #0x34
	ldrsh r1, [r4, r2]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08090144 @ =0x02023460
	adds r0, r0, r1
	ldrb r5, [r5]
	lsls r2, r5, #1
	adds r2, #2
	movs r1, #9
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #3
	bl EnableBgSync
_08090134:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809013C: .4byte 0x08CC416C
_08090140: .4byte 0x02022C60
_08090144: .4byte 0x02023460

	thumb_func_start sub_08090148
sub_08090148: @ 0x08090148
	push {lr}
	ldr r0, _08090158 @ =0x08CC416C
	bl Proc_Find
	cmp r0, #0
	bne _0809015C
	movs r0, #0
	b _0809015E
	.align 2, 0
_08090158: .4byte 0x08CC416C
_0809015C:
	movs r0, #1
_0809015E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ShowPrepScreenMenuFrozenHand
ShowPrepScreenMenuFrozenHand: @ 0x08090164
	push {lr}
	ldr r0, _0809017C @ =0x08CC416C
	bl Proc_Find
	cmp r0, #0
	beq _08090176
	movs r1, #2
	bl Proc_Goto
_08090176:
	pop {r0}
	bx r0
	.align 2, 0
_0809017C: .4byte 0x08CC416C

	thumb_func_start sub_08090180
sub_08090180: @ 0x08090180
	push {lr}
	ldr r0, _08090198 @ =0x08CC416C
	bl Proc_Find
	cmp r0, #0
	beq _08090192
	movs r1, #0
	bl Proc_Goto
_08090192:
	pop {r0}
	bx r0
	.align 2, 0
_08090198: .4byte 0x08CC416C

	thumb_func_start sub_0809019C
sub_0809019C: @ 0x0809019C
	push {lr}
	ldr r0, _080901B4 @ =0x08CC416C
	bl Proc_Find
	cmp r0, #0
	beq _080901AE
	movs r1, #1
	bl Proc_Goto
_080901AE:
	pop {r0}
	bx r0
	.align 2, 0
_080901B4: .4byte 0x08CC416C

	thumb_func_start MenuScroll_Init
MenuScroll_Init: @ 0x080901B8
	adds r3, r0, #0
	movs r2, #0
	movs r1, #0
	strh r1, [r3, #0x2a]
	adds r0, #0x2c
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	strh r1, [r3, #0x2e]
	strh r1, [r3, #0x32]
	adds r0, #7
	strb r2, [r0]
	ldrh r0, [r3, #0x2e]
	strh r0, [r3, #0x30]
	movs r0, #0xe4
	lsls r0, r0, #2
	strh r0, [r3, #0x36]
	movs r0, #0x80
	lsls r0, r0, #5
	strh r0, [r3, #0x38]
	adds r0, r3, #0
	adds r0, #0x3a
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	bx lr

	thumb_func_start MenuScroll_Loop
MenuScroll_Loop: @ 0x080901EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r4, r0, #0
	ldrh r0, [r4, #0x38]
	ldrh r1, [r4, #0x36]
	adds r0, r0, r1
	mov sb, r0
	adds r0, r4, #0
	adds r0, #0x34
	ldrh r2, [r4, #0x32]
	ldrb r0, [r0]
	cmp r2, r0
	bhi _08090210
	b _08090422
_08090210:
	movs r6, #0
	adds r0, r4, #0
	adds r0, #0x2d
	mov sl, r0
	adds r3, r4, #0
	adds r3, #0x3a
	str r3, [sp, #0x14]
	adds r5, r4, #0
	adds r5, #0x3b
	str r5, [sp, #0x18]
	ldrb r0, [r0]
	cmp r6, r0
	bge _0809024C
_0809022A:
	ldrh r1, [r4, #0x2a]
	adds r0, r4, #0
	adds r0, #0x2c
	lsls r2, r6, #3
	ldrb r0, [r0]
	adds r2, r0, r2
	mov r3, sb
	str r3, [sp]
	movs r0, #4
	ldr r3, _08090334 @ =0x08CC41C4
	bl PutSpriteExt
	adds r6, #1
	mov r5, sl
	ldrb r5, [r5]
	cmp r6, r5
	blt _0809022A
_0809024C:
	cmp r6, #0
	bne _08090252
	b _080903D0
_08090252:
	mov r6, sl
	ldrb r6, [r6]
	lsls r7, r6, #0x13
	ldrh r0, [r4, #0x2e]
	str r0, [sp, #0xc]
	ldrh r5, [r4, #0x32]
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r6, [r0]
	str r0, [sp, #0x10]
	movs r1, #0x2c
	adds r1, r1, r4
	mov r8, r1
	cmp r5, r6
	bhi _08090272
	b _080903A4
_08090272:
	adds r0, r7, #0
	adds r1, r5, #0
	bl __udivsi3
	str r0, [sp, #4]
	adds r0, r7, #0
	muls r0, r6, r0
	adds r1, r5, #0
	bl __udivsi3
	str r0, [sp, #8]
	ldr r2, [sp, #0xc]
	cmp r2, #0
	beq _080902B2
	ldrh r3, [r4, #0x2a]
	ldr r5, _08090338 @ =0x00002001
	adds r1, r3, r5
	mov r6, r8
	ldrb r2, [r6]
	subs r2, #8
	ldr r3, _0809033C @ =0x08CC4270
	ldr r5, [sp, #0x14]
	ldrb r5, [r5]
	lsrs r0, r5, #3
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	mov r6, sb
	str r6, [sp]
	movs r0, #4
	bl PutSpriteExt
_080902B2:
	movs r6, #0
	ldr r0, [sp, #8]
	lsrs r5, r0, #0x13
	cmp r6, r5
	bhs _080902E8
	ldr r1, [sp, #4]
	ldr r2, [sp, #0xc]
	adds r0, r1, #0
	muls r0, r2, r0
	lsrs r7, r0, #0x14
_080902C6:
	ldrh r1, [r4, #0x2a]
	adds r1, #1
	mov r3, r8
	ldrb r3, [r3]
	adds r2, r3, r7
	lsls r0, r6, #3
	adds r2, r2, r0
	ldr r0, _08090340 @ =0x08CC421C
	ldr r3, [r0, #0x20]
	mov r0, sb
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
	adds r6, #1
	cmp r6, r5
	blo _080902C6
_080902E8:
	ldrh r1, [r4, #0x2e]
	lsrs r0, r1, #4
	ldr r2, [sp, #0x10]
	ldrb r2, [r2]
	adds r0, r2, r0
	ldrh r3, [r4, #0x32]
	cmp r0, r3
	bne _08090344
	mov r5, sl
	ldrb r5, [r5]
	lsls r0, r5, #3
	ldr r2, [sp, #4]
	ldr r3, [sp, #0xc]
	adds r1, r2, #0
	muls r1, r3, r1
	lsrs r2, r1, #0x14
	lsls r3, r6, #3
	adds r1, r2, r3
	subs r0, r0, r1
	cmp r0, #0
	beq _080903A4
	ldrh r1, [r4, #0x2a]
	adds r1, #1
	mov r5, r8
	ldrb r5, [r5]
	adds r2, r5, r2
	adds r2, r2, r3
	ldr r3, _08090340 @ =0x08CC421C
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	mov r6, sb
	str r6, [sp]
	movs r0, #4
	bl PutSpriteExt
	b _080903A4
	.align 2, 0
_08090334: .4byte 0x08CC41C4
_08090338: .4byte 0x00002001
_0809033C: .4byte 0x08CC4270
_08090340: .4byte 0x08CC421C
_08090344:
	ldr r0, [sp, #8]
	lsrs r5, r0, #0x10
	movs r0, #7
	ands r5, r0
	cmp r5, #0
	beq _0809037A
	ldrh r1, [r4, #0x2a]
	adds r1, #1
	ldr r3, [sp, #4]
	ldr r0, [sp, #0xc]
	adds r2, r3, #0
	muls r2, r0, r2
	lsrs r2, r2, #0x14
	mov r3, r8
	ldrb r3, [r3]
	adds r2, r3, r2
	lsls r0, r6, #3
	adds r2, r2, r0
	ldr r3, _08090434 @ =0x08CC421C
	lsls r0, r5, #2
	adds r0, r0, r3
	ldr r3, [r0]
	mov r5, sb
	str r5, [sp]
	movs r0, #4
	bl PutSpriteExt
_0809037A:
	ldrh r1, [r4, #0x2a]
	adds r1, #1
	mov r6, sl
	ldrb r6, [r6]
	lsls r2, r6, #3
	mov r0, r8
	ldrb r0, [r0]
	adds r2, r0, r2
	adds r2, #1
	ldr r3, _08090438 @ =0x08CC4270
	ldr r5, [sp, #0x18]
	ldrb r5, [r5]
	lsrs r0, r5, #3
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	mov r6, sb
	str r6, [sp]
	movs r0, #4
	bl PutSpriteExt
_080903A4:
	ldrh r1, [r4, #0x2a]
	mov r0, r8
	ldrb r2, [r0]
	subs r2, #8
	ldr r3, _0809043C @ =0x08CC41CC
	mov r5, sb
	str r5, [sp]
	movs r0, #4
	bl PutSpriteExt
	ldrh r1, [r4, #0x2a]
	mov r6, sl
	ldrb r6, [r6]
	lsls r2, r6, #3
	mov r0, r8
	ldrb r0, [r0]
	adds r2, r0, r2
	ldr r3, _08090440 @ =0x08CC41D4
	str r5, [sp]
	movs r0, #4
	bl PutSpriteExt
_080903D0:
	ldrh r1, [r4, #0x30]
	ldrh r0, [r4, #0x2e]
	cmp r1, r0
	beq _080903F8
	cmp r1, r0
	bls _080903E4
	ldr r1, [sp, #0x14]
	ldrb r0, [r1]
	adds r0, #3
	strb r0, [r1]
_080903E4:
	ldrh r2, [r4, #0x30]
	ldrh r3, [r4, #0x2e]
	cmp r2, r3
	bhs _080903F4
	ldr r5, [sp, #0x18]
	ldrb r0, [r5]
	adds r0, #3
	strb r0, [r5]
_080903F4:
	ldrh r0, [r4, #0x2e]
	strh r0, [r4, #0x30]
_080903F8:
	ldr r6, [sp, #0x14]
	ldrb r0, [r6]
	adds r0, #1
	movs r1, #0
	strb r0, [r6]
	ldr r2, [sp, #0x18]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r3, [r6]
	lsrs r0, r3, #3
	cmp r0, #5
	bls _08090414
	strb r1, [r6]
_08090414:
	ldr r5, [sp, #0x18]
	ldrb r5, [r5]
	lsrs r0, r5, #3
	cmp r0, #5
	bls _08090422
	ldr r6, [sp, #0x18]
	strb r1, [r6]
_08090422:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090434: .4byte 0x08CC421C
_08090438: .4byte 0x08CC4270
_0809043C: .4byte 0x08CC41CC
_08090440: .4byte 0x08CC41D4

	thumb_func_start sub_08090444
sub_08090444: @ 0x08090444
	push {lr}
	ldr r0, _0809045C @ =0x08CC4334
	bl Proc_Find
	cmp r0, #0
	beq _08090456
	movs r1, #1
	bl Proc_Goto
_08090456:
	pop {r0}
	bx r0
	.align 2, 0
_0809045C: .4byte 0x08CC4334

	thumb_func_start TryHideMenuScrollBar
TryHideMenuScrollBar: @ 0x08090460
	push {lr}
	ldr r0, _08090478 @ =0x08CC4334
	bl Proc_Find
	cmp r0, #0
	beq _08090472
	movs r1, #0
	bl Proc_Goto
_08090472:
	pop {r0}
	bx r0
	.align 2, 0
_08090478: .4byte 0x08CC4334

	thumb_func_start EndMenuScrollBar
EndMenuScrollBar: @ 0x0809047C
	push {lr}
	ldr r0, _0809048C @ =0x08CC4334
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0809048C: .4byte 0x08CC4334

	thumb_func_start StartMenuScrollBar
StartMenuScrollBar: @ 0x08090490
	push {lr}
	adds r1, r0, #0
	ldr r0, _080904A0 @ =0x08CC4334
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080904A0: .4byte 0x08CC4334

	thumb_func_start PutMenuScrollBarAt
PutMenuScrollBarAt: @ 0x080904A4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080904C0 @ =0x08CC4334
	bl Proc_Find
	cmp r0, #0
	beq _080904BA
	strh r4, [r0, #0x2a]
	adds r0, #0x2c
	strb r5, [r0]
_080904BA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080904C0: .4byte 0x08CC4334

	thumb_func_start UpdateMenuScrollBarConfig
UpdateMenuScrollBarConfig: @ 0x080904C4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r5, r3, #0x18
	ldr r0, _080904F4 @ =0x08CC4334
	bl Proc_Find
	cmp r0, #0
	beq _080904EE
	adds r1, r0, #0
	adds r1, #0x2d
	strb r7, [r1]
	strh r6, [r0, #0x2e]
	strh r4, [r0, #0x32]
	adds r0, #0x34
	strb r5, [r0]
_080904EE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080904F4: .4byte 0x08CC4334

	thumb_func_start InitMenuScrollBarImg
InitMenuScrollBarImg: @ 0x080904F8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08090530 @ =0x08405734
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08090534 @ =0x08405690
	ldr r2, _08090538 @ =0x06010000
	adds r1, r4, r2
	bl Decompress
	ldr r0, _0809053C @ =0x08CC4334
	bl Proc_Find
	adds r2, r0, #0
	cmp r2, #0
	beq _08090528
	asrs r0, r4, #5
	strh r0, [r2, #0x36]
	lsls r0, r5, #0xc
	strh r0, [r2, #0x38]
_08090528:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08090530: .4byte 0x08405734
_08090534: .4byte 0x08405690
_08090538: .4byte 0x06010000
_0809053C: .4byte 0x08CC4334

	thumb_func_start sub_08090540
sub_08090540: @ 0x08090540
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	mov r8, r1
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r7, [sp, #0x18]
	bl ClearText
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_SetColor
	adds r0, r4, #0
	adds r1, r6, #0
	bl Text_SetCursor
	adds r0, r4, #0
	adds r1, r7, #0
	bl Text_DrawString
	adds r0, r4, #0
	mov r1, r8
	bl PutText
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08090580
sub_08090580: @ 0x08090580
	push {r4, lr}
	adds r3, r0, #0
	ldr r4, _08090594 @ =0x02012466
	ldrh r0, [r4]
	adds r2, r0, #0
	cmp r2, #0
	bne _08090598
	strb r2, [r3]
	strh r2, [r1]
	b _080905CC
	.align 2, 0
_08090594: .4byte 0x02012466
_08090598:
	cmp r2, #7
	bhi _080905AA
	ldrb r4, [r3]
	cmp r4, r2
	blo _080905A6
	subs r0, #1
	strb r0, [r3]
_080905A6:
	movs r0, #0
	b _080905CA
_080905AA:
	ldrh r2, [r1]
	lsrs r0, r2, #4
	adds r2, r0, #7
	ldrh r0, [r4]
	cmp r2, r0
	bge _080905C2
	ldrb r4, [r3]
	cmp r4, #6
	bne _080905CC
	movs r0, #5
	strb r0, [r3]
	b _080905CC
_080905C2:
	cmp r2, r0
	ble _080905CC
	subs r0, #7
	lsls r0, r0, #4
_080905CA:
	strh r0, [r1]
_080905CC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080905D4
sub_080905D4: @ 0x080905D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r4, _08090684 @ =0x02024460
	adds r0, r4, #0
	movs r1, #0
	bl TmFill
	movs r0, #0
	strh r0, [r6, #0x2a]
	movs r7, #0
	mov sl, r4
	movs r0, #0x2d
	adds r0, r0, r6
	mov sb, r0
	adds r1, r6, #0
	adds r1, #0x2c
	str r1, [sp]
_08090600:
	movs r5, #0
	adds r3, r7, #1
	mov r8, r3
_08090606:
	ldrh r0, [r6, #0x2a]
	lsrs r4, r0, #3
	adds r4, r7, r4
	adds r0, r4, #0
	movs r1, #0x28
	bl __modsi3
	movs r1, #0x27
	subs r1, r1, r0
	movs r0, #0x1f
	ands r4, r0
	lsls r4, r4, #6
	lsls r2, r5, #1
	adds r4, r4, r2
	add r4, sl
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08090688 @ =0x0840C7CE
	adds r0, r0, r1
	adds r2, r2, r0
	mov r3, sb
	ldrb r3, [r3]
	lsls r0, r3, #0xc
	ldrh r2, [r2]
	adds r0, r2, r0
	strh r0, [r4]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0x1d
	bls _08090606
	mov r1, r8
	lsls r0, r1, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #0x1f
	bls _08090600
	movs r0, #8
	bl EnableBgSync
	movs r0, #0
	ldr r3, [sp]
	strb r0, [r3]
	movs r4, #0xff
	adds r2, r4, #0
	ldrh r0, [r6, #0x2a]
	ands r2, r0
	movs r0, #3
	movs r1, #0
	bl SetBgOffset
	ldr r0, _0809068C @ =0x0400001E
	ldrh r6, [r6, #0x2a]
	ands r4, r6
	strh r4, [r0]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090684: .4byte 0x02024460
_08090688: .4byte 0x0840C7CE
_0809068C: .4byte 0x0400001E

	thumb_func_start PrepMuralBackground_Loop
PrepMuralBackground_Loop: @ 0x08090690
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0x2c
	ldrb r0, [r5]
	cmp r0, #3
	bne _080906D4
	ldrh r0, [r6, #0x2a]
	adds r0, #1
	strh r0, [r6, #0x2a]
	lsls r0, r0, #0x10
	movs r1, #0xa0
	lsls r1, r1, #0x13
	cmp r0, r1
	bne _080906B8
	movs r0, #0
	strh r0, [r6, #0x2a]
_080906B8:
	movs r4, #0xff
	adds r2, r4, #0
	ldrh r1, [r6, #0x2a]
	ands r2, r1
	movs r0, #3
	movs r1, #0
	bl SetBgOffset
	ldr r0, _08090760 @ =0x0400001E
	ldrh r7, [r6, #0x2a]
	ands r4, r7
	strh r4, [r0]
	movs r0, #0
	strb r0, [r5]
_080906D4:
	adds r1, r6, #0
	adds r1, #0x2c
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrh r1, [r6, #0x2a]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _08090754
	ldr r5, _08090764 @ =0x0840C7CE
	lsrs r0, r1, #3
	subs r4, r0, #1
	movs r1, #0x1f
	ands r4, r1
	adds r0, #0x1f
	movs r1, #0x28
	bl __modsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r3, #0
	ldr r1, _08090768 @ =0x02024460
	mov r8, r1
	lsls r4, r4, #6
	movs r1, #0x27
	subs r1, r1, r0
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	mov sb, r0
	mov ip, r8
	adds r5, r6, #0
	adds r5, #0x2d
	adds r6, r4, #0
_0809071C:
	lsls r1, r3, #1
	adds r2, r4, r1
	add r2, ip
	add r1, sb
	ldrb r7, [r5]
	lsls r0, r7, #0xc
	ldrh r1, [r1]
	adds r0, r1, r0
	strh r0, [r2]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x1d
	bls _0809071C
	mov r0, r8
	adds r4, r6, r0
	movs r0, #3
	bl GetBgTilemapOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r0, r6, r0
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #0xf
	bl CpuFastSet
_08090754:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090760: .4byte 0x0400001E
_08090764: .4byte 0x0840C7CE
_08090768: .4byte 0x02024460

	thumb_func_start StartPrepMuralBackground
StartPrepMuralBackground: @ 0x0809076C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r4, _080907B4 @ =0x08407440
	movs r0, #3
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080907B8 @ =0x0840D130
	lsls r1, r5, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, _080907BC @ =0x08CC436C
	adds r0, r4, #0
	bl Proc_Find
	bl Proc_End
	adds r0, r4, #0
	adds r1, r6, #0
	bl Proc_Start
	adds r1, r0, #0
	adds r1, #0x2d
	strb r5, [r1]
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080907B4: .4byte 0x08407440
_080907B8: .4byte 0x0840D130
_080907BC: .4byte 0x08CC436C

	thumb_func_start EndPrepMuralBackground
EndPrepMuralBackground: @ 0x080907C0
	push {lr}
	ldr r0, _080907D0 @ =0x08CC436C
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080907D0: .4byte 0x08CC436C

	thumb_func_start sub_080907D4
sub_080907D4: @ 0x080907D4
	ldr r0, _080907EC @ =0x04000006
	ldrh r0, [r0]
	adds r3, r0, #0
	cmp r3, #0xa0
	bne _080907F4
	movs r3, #0
	ldr r0, _080907F0 @ =0x02012968
	ldr r2, [r0]
	ldr r1, [r0, #4]
	str r1, [r0]
	str r2, [r0, #4]
	b _080907FC
	.align 2, 0
_080907EC: .4byte 0x04000006
_080907F0: .4byte 0x02012968
_080907F4:
	ldr r0, _08090810 @ =0x02012968
	cmp r3, #0xa0
	bls _080907FC
	movs r3, #0
_080907FC:
	ldr r2, _08090814 @ =0x04000042
	ldr r0, [r0]
	lsls r1, r3, #2
	adds r1, r1, r0
	ldrb r3, [r1]
	lsls r0, r3, #8
	ldrb r1, [r1, #1]
	orrs r0, r1
	strh r0, [r2]
	bx lr
	.align 2, 0
_08090810: .4byte 0x02012968
_08090814: .4byte 0x04000042

	thumb_func_start SallyCir_Init
SallyCir_Init: @ 0x08090818
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	ldr r2, _08090894 @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov ip, r2
	cmp r0, #0
	bge _080908A4
	movs r0, #0x96
	str r0, [r4, #0x2c]
	movs r3, #0
	ldr r0, _08090898 @ =0x02012468
	mov sb, r0
	adds r4, #0x29
	mov r8, r4
	ldr r1, _0809089C @ =0x02012968
	mov sl, r1
	mov r7, sb
	movs r4, #0
	movs r2, #0xf0
	movs r6, #0xa0
	lsls r6, r6, #2
	ldr r5, _080908A0 @ =0x00000281
_08090866:
	lsls r0, r3, #2
	adds r0, r0, r7
	strb r4, [r0]
	strb r2, [r0, #1]
	adds r1, r0, r6
	strb r4, [r1]
	adds r0, r0, r5
	strb r2, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x9f
	bls _08090866
	mov r1, ip
	adds r1, #0x2f
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	b _080908EC
	.align 2, 0
_08090894: .4byte 0x03002870
_08090898: .4byte 0x02012468
_0809089C: .4byte 0x02012968
_080908A0: .4byte 0x00000281
_080908A4:
	movs r0, #0
	str r0, [r4, #0x2c]
	movs r3, #0
	ldr r0, _08090958 @ =0x02012468
	mov sb, r0
	adds r4, #0x29
	mov r8, r4
	ldr r1, _0809095C @ =0x02012968
	mov sl, r1
	mov r6, sb
	movs r2, #0x78
	movs r5, #0xa0
	lsls r5, r5, #2
	ldr r4, _08090960 @ =0x00000281
_080908C0:
	lsls r0, r3, #2
	adds r0, r0, r6
	strb r2, [r0]
	strb r2, [r0, #1]
	adds r1, r0, r5
	strb r2, [r1]
	adds r0, r0, r4
	strb r2, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x9f
	bls _080908C0
	mov r2, ip
	adds r2, #0x2f
	movs r1, #0
	movs r0, #0x78
	strb r0, [r2]
	adds r2, #4
	strb r1, [r2]
	mov r1, ip
	adds r1, #0x2e
_080908EC:
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	mov r2, ip
	adds r2, #0x35
	movs r0, #1
	ldrb r1, [r2]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
	adds r2, #1
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2]
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
	strb r0, [r2]
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
	mov r0, sb
	mov r1, sl
	str r0, [r1]
	movs r0, #0xa0
	lsls r0, r0, #2
	add r0, sb
	str r0, [r1, #4]
	ldr r0, _08090964 @ =sub_080907D4
	bl SetOnHBlankA
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090958: .4byte 0x02012468
_0809095C: .4byte 0x02012968
_08090960: .4byte 0x00000281
_08090964: .4byte sub_080907D4

	thumb_func_start SallyCir_Loop
SallyCir_Loop: @ 0x08090968
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r0, #0x2a
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldr r0, [r6, #0x2c]
	adds r0, r0, r1
	str r0, [r6, #0x2c]
	cmp r0, #0x96
	ble _08090986
	movs r0, #0x96
	str r0, [r6, #0x2c]
_08090986:
	ldr r0, [r6, #0x2c]
	cmp r0, #0
	bge _08090990
	movs r0, #0
	str r0, [r6, #0x2c]
_08090990:
	movs r1, #0
	movs r0, #0x29
	adds r0, r0, r6
	mov sb, r0
	ldr r7, _080909D0 @ =0x02012968
	movs r2, #0x78
	mov r8, r2
_0809099E:
	ldr r0, [r6, #0x2c]
	lsls r5, r1, #0x10
	cmp r0, #0
	ble _080909BE
	adds r4, r0, #0
	muls r4, r0, r4
	adds r0, r4, #0
	asrs r4, r5, #0x10
	adds r1, r4, #0
	subs r1, #0x50
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	subs r0, r0, r1
	cmp r0, #0
	bge _080909D4
_080909BE:
	ldr r0, [r7, #4]
	asrs r1, r5, #0xe
	adds r0, r1, r0
	mov r4, r8
	strb r4, [r0]
	ldr r0, [r7, #4]
	adds r1, r1, r0
	strb r4, [r1, #1]
	b _080909FA
	.align 2, 0
_080909D0: .4byte 0x02012968
_080909D4:
	bl Sqrt
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x78
	ble _080909E4
	movs r3, #0x78
_080909E4:
	ldr r1, [r7, #4]
	lsls r2, r4, #2
	adds r1, r2, r1
	mov r4, r8
	subs r0, r4, r3
	strb r0, [r1]
	ldr r0, [r7, #4]
	adds r2, r2, r0
	adds r0, r3, #0
	adds r0, #0x78
	strb r0, [r2, #1]
_080909FA:
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r5, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _0809099E
	mov r2, sb
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x28
	bne _08090A1E
	adds r0, r6, #0
	bl Proc_Break
_08090A1E:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SallyCir_OnEnd
SallyCir_OnEnd: @ 0x08090A2C
	push {lr}
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0

	thumb_func_start StartSallyCirProc
StartSallyCirProc: @ 0x08090A38
	push {r4, lr}
	adds r2, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08090A54 @ =0x08CC438C
	adds r1, r2, #0
	bl Proc_StartBlocking
	adds r1, r0, #0
	adds r1, #0x2a
	strb r4, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08090A54: .4byte 0x08CC438C

	thumb_func_start sub_08090A58
sub_08090A58: @ 0x08090A58
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r1, r0, #0
	adds r1, #0x29
	movs r7, #0
	strb r7, [r1]
	ldr r1, _08090AF0 @ =0x03002870
	mov ip, r1
	movs r3, #1
	ldrb r1, [r1, #1]
	orrs r1, r3
	movs r2, #2
	mov r8, r2
	mov r2, r8
	orrs r1, r2
	movs r6, #4
	orrs r1, r6
	movs r5, #8
	orrs r1, r5
	movs r4, #0x10
	orrs r1, r4
	movs r2, #0x21
	rsbs r2, r2, #0
	ands r1, r2
	movs r2, #0x40
	orrs r1, r2
	movs r2, #0x7f
	ands r1, r2
	mov r2, ip
	strb r1, [r2, #1]
	mov r1, ip
	adds r1, #0x35
	ldrb r2, [r1]
	orrs r3, r2
	mov r2, r8
	orrs r3, r2
	orrs r3, r6
	orrs r3, r5
	orrs r3, r4
	strb r3, [r1]
	mov r3, ip
	adds r3, #0x36
	movs r1, #2
	rsbs r1, r1, #0
	ldrb r2, [r3]
	ands r1, r2
	movs r2, #3
	rsbs r2, r2, #0
	ands r1, r2
	subs r2, #2
	ands r1, r2
	subs r2, #4
	ands r1, r2
	subs r2, #8
	ands r1, r2
	strb r1, [r3]
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _08090AF4
	mov r0, ip
	adds r0, #0x2f
	strb r7, [r0]
	adds r0, #4
	strb r7, [r0]
	mov r1, ip
	adds r1, #0x2e
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	b _08090B0E
	.align 2, 0
_08090AF0: .4byte 0x03002870
_08090AF4:
	mov r1, ip
	adds r1, #0x2f
	movs r0, #0x78
	strb r0, [r1]
	mov r2, ip
	adds r2, #0x33
	movs r1, #0x50
	strb r1, [r2]
	subs r2, #5
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x32
	strb r1, [r0]
_08090B0E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08090B18
sub_08090B18: @ 0x08090B18
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	adds r2, r6, #0
	adds r2, #0x29
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r4, _08090B98 @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r4, #1]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	movs r1, #0xf
	ldrb r2, [r2]
	subs r1, r1, r2
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #7
	muls r0, r1, r0
	movs r1, #0xe1
	bl __divsi3
	movs r1, #0xa0
	lsls r1, r1, #2
	subs r1, r1, r0
	asrs r5, r1, #4
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _08090B9C
	lsls r1, r5, #1
	adds r2, r1, r5
	adds r0, r4, #0
	adds r0, #0x2f
	strb r2, [r0]
	adds r0, #4
	strb r1, [r0]
	movs r3, #0x10
	rsbs r3, r3, #0
	adds r0, r3, #0
	subs r0, r0, r2
	adds r2, r4, #0
	adds r2, #0x2e
	strb r0, [r2]
	movs r2, #0x60
	rsbs r2, r2, #0
	adds r0, r2, #0
	subs r0, r0, r1
	adds r1, r4, #0
	adds r1, #0x32
	strb r0, [r1]
	b _08090BC0
	.align 2, 0
_08090B98: .4byte 0x03002870
_08090B9C:
	lsls r2, r5, #1
	adds r1, r2, r5
	movs r0, #0x78
	subs r0, r0, r1
	adds r3, r4, #0
	adds r3, #0x2f
	strb r0, [r3]
	movs r0, #0x50
	subs r0, r0, r2
	adds r3, #4
	strb r0, [r3]
	adds r1, #0x78
	adds r0, r4, #0
	adds r0, #0x2e
	strb r1, [r0]
	adds r2, #0x50
	adds r0, #4
	strb r2, [r0]
_08090BC0:
	adds r2, r4, #0
	adds r2, #0x35
	movs r0, #1
	ldrb r3, [r2]
	orrs r0, r3
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x36
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r1]
	ands r0, r2
	movs r3, #3
	rsbs r3, r3, #0
	mov sl, r3
	ands r0, r3
	movs r2, #5
	rsbs r2, r2, #0
	mov sb, r2
	ands r0, r2
	subs r3, #6
	mov r8, r3
	ands r0, r3
	movs r7, #0x11
	rsbs r7, r7, #0
	ands r0, r7
	strb r0, [r1]
	cmp r5, #0x27
	ble _08090C36
	adds r0, r6, #0
	bl Proc_Break
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _08090C36
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r4, #1]
	ands r0, r1
	mov r2, sl
	ands r0, r2
	mov r3, sb
	ands r0, r3
	mov r1, r8
	ands r0, r1
	ands r0, r7
	strb r0, [r4, #1]
_08090C36:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08090C44
sub_08090C44: @ 0x08090C44
	movs r0, #0
	bx lr

	thumb_func_start GetConvoyItemCount_
GetConvoyItemCount_: @ 0x08090C48
	push {lr}
	bl GetConvoyItemCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ViewCounter_Loop
ViewCounter_Loop: @ 0x08090C58
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	ldrh r1, [r4, #0x2c]
	cmp r0, r1
	bne _08090C84
	ldr r2, _08090C90 @ =0x03002870
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	adds r0, r4, #0
	bl Proc_Break
_08090C84:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08090C90: .4byte 0x03002870

	thumb_func_start StartViewCounter
StartViewCounter: @ 0x08090C94
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _08090CCC @ =0x08CC43D4
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r4, [r0, #0x2a]
	ldr r2, _08090CD0 @ =0x03002870
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
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
	strb r0, [r2, #1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08090CCC: .4byte 0x08CC43D4
_08090CD0: .4byte 0x03002870

	thumb_func_start TryLockProc
TryLockProc: @ 0x08090CD4
	cmp r0, #0
	beq _08090CE2
	adds r1, r0, #0
	adds r1, #0x28
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08090CE2:
	bx lr

	thumb_func_start TryUnlockProc
TryUnlockProc: @ 0x08090CE4
	cmp r0, #0
	beq _08090CF6
	adds r1, r0, #0
	adds r1, #0x28
	ldrb r0, [r1]
	cmp r0, #0
	beq _08090CF6
	subs r0, #1
	strb r0, [r1]
_08090CF6:
	bx lr

	thumb_func_start PrepHbKeyListener_Loop
PrepHbKeyListener_Loop: @ 0x08090CF8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08090D1C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0xf3
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08090D14
	bl CloseHelpBox
	adds r0, r4, #0
	bl Proc_Break
_08090D14:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08090D1C: .4byte 0x08B857F8

	thumb_func_start StartPrepErrorHelpbox
StartPrepErrorHelpbox: @ 0x08090D20
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r2, #0
	adds r6, r3, #0
	cmp r4, #0
	bge _08090D3C
	cmp r1, #0
	bge _08090D3C
	bl GetUiHandPrevX
	adds r4, r0, #0
	bl GetUiHandPrevY
	adds r1, r0, #0
_08090D3C:
	adds r0, r4, #0
	adds r2, r5, #0
	bl StartHelpBox
	ldr r0, _08090D54 @ =0x08CC43F4
	adds r1, r6, #0
	bl Proc_StartBlocking
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08090D54: .4byte 0x08CC43F4

	thumb_func_start IsWeaponUsable
IsWeaponUsable: @ 0x08090D58
	push {r4, lr}
	adds r4, r1, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08090D78
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #0x80
	ands r1, r0
	cmp r1, #0
	bne _08090D78
	movs r0, #1
	b _08090D7A
_08090D78:
	movs r0, #0
_08090D7A:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start CountUnitUsableWeapons
CountUnitUsableWeapons: @ 0x08090D80
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
	movs r4, #0
_08090D88:
	lsls r1, r4, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl IsWeaponUsable
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08090DA2
	adds r6, #1
_08090DA2:
	adds r4, #1
	cmp r4, #4
	ble _08090D88
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_08090DB0
sub_08090DB0: @ 0x08090DB0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08090DE2
	adds r0, r4, #0
	bl ArenaIsUnitAllowed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08090DE2
	adds r0, r4, #0
	bl CountUnitUsableWeapons
	cmp r0, #0
	beq _08090DE2
	movs r0, #1
	b _08090DE4
_08090DE2:
	movs r0, #0
_08090DE4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CheckValidLinkArenaItemSwap
CheckValidLinkArenaItemSwap: @ 0x08090DEC
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	cmp r4, r5
	beq _08090E88
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08090E88
	ldr r0, [r4, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08090E44
	lsls r1, r7, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r4, #0
	bl IsWeaponUsable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08090E44
	adds r0, r4, #0
	bl CountUnitUsableWeapons
	cmp r0, #1
	bgt _08090E44
	lsls r1, r6, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r4, #0
	bl IsWeaponUsable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08090E84
_08090E44:
	ldr r0, [r5, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08090E88
	lsls r1, r6, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl IsWeaponUsable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08090E88
	adds r0, r5, #0
	bl CountUnitUsableWeapons
	cmp r0, #1
	bgt _08090E88
	lsls r1, r7, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl IsWeaponUsable
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08090E88
_08090E84:
	movs r0, #0
	b _08090E8A
_08090E88:
	movs r0, #1
_08090E8A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start CheckValidLinkArenaItemSupply
CheckValidLinkArenaItemSupply: @ 0x08090E90
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08090EDE
	ldr r0, [r4, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08090EDE
	lsls r1, r5, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r4, #0
	bl IsWeaponUsable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08090EDE
	adds r0, r4, #0
	bl CountUnitUsableWeapons
	cmp r0, #1
	bne _08090EDE
	adds r0, r4, #0
	adds r1, r6, #0
	bl IsWeaponUsable
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08090EDE
	movs r0, #0
	b _08090EE0
_08090EDE:
	movs r0, #1
_08090EE0:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08090EE8
sub_08090EE8: @ 0x08090EE8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08090F26
	ldr r0, [r4, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08090F26
	lsls r1, r5, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r4, #0
	bl IsWeaponUsable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08090F26
	adds r0, r4, #0
	bl CountUnitUsableWeapons
	cmp r0, #1
	bne _08090F26
	movs r0, #0
	b _08090F28
_08090F26:
	movs r0, #1
_08090F28:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08090F30
sub_08090F30: @ 0x08090F30
	push {r4, r5, lr}
	movs r1, #0
	ldr r4, _08090F5C @ =0x0202BC39
	ldr r2, _08090F60 @ =0x02012970
	ldr r3, _08090F64 @ =0x0840DD24
_08090F3A:
	ldrb r5, [r4]
	lsls r0, r5, #0x1c
	lsrs r0, r0, #0x1e
	lsls r0, r0, #4
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0xf
	ble _08090F3A
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08090F5C: .4byte 0x0202BC39
_08090F60: .4byte 0x02012970
_08090F64: .4byte 0x0840DD24

	thumb_func_start GetPrepPageForItem
GetPrepPageForItem: @ 0x08090F68
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
	ldr r4, _08090F88 @ =0x08CC440C
_08090F70:
	adds r0, r6, #0
	bl GetItemType
	ldrb r1, [r4]
	cmp r0, r1
	blt _08090F8C
	ldrb r1, [r4, #1]
	cmp r0, r1
	bgt _08090F8C
	adds r0, r5, #0
	b _08090F96
	.align 2, 0
_08090F88: .4byte 0x08CC440C
_08090F8C:
	adds r4, #4
	adds r5, #1
	cmp r5, #8
	ble _08090F70
	movs r0, #8
_08090F96:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_08090F9C
sub_08090F9C: @ 0x08090F9C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0
	ldr r0, _08091054 @ =0x02011E24
	mov r8, r0
	ldr r0, _08091058 @ =0x02012466
	movs r1, #0
	strh r1, [r0]
	movs r4, #0
	ldr r1, _0809105C @ =0x02012464
	mov sl, r0
	adds r2, r1, #0
	ldrh r1, [r2]
	cmp r4, r1
	bge _08091008
	ldr r1, _08091060 @ =0x08CC440C
	mov r3, sb
	lsls r0, r3, #2
	adds r6, r0, r1
	mov r7, sl
_08090FCC:
	ldr r1, _08091064 @ =0x020117E4
	lsls r0, r4, #2
	adds r5, r0, r1
	ldrh r0, [r5, #2]
	str r2, [sp]
	bl GetItemType
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, [sp]
	ldrb r1, [r6]
	cmp r0, r1
	blo _08090FFE
	ldrb r3, [r6, #1]
	cmp r0, r3
	bhi _08090FFE
	ldr r0, [r5]
	mov r1, r8
	adds r1, #4
	mov r8, r1
	subs r1, #4
	stm r1!, {r0}
	ldrh r0, [r7]
	adds r0, #1
	strh r0, [r7]
_08090FFE:
	adds r4, #1
	ldr r0, _0809105C @ =0x02012464
	ldrh r0, [r0]
	cmp r4, r0
	blt _08090FCC
_08091008:
	movs r4, #0
	ldrh r2, [r2]
	cmp r4, r2
	bge _0809104A
	ldr r1, _08091060 @ =0x08CC440C
	mov r2, sb
	lsls r0, r2, #2
	adds r6, r0, r1
_08091018:
	ldr r1, _08091064 @ =0x020117E4
	lsls r0, r4, #2
	adds r5, r0, r1
	ldrh r0, [r5, #2]
	bl GetItemType
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r3, [r6]
	cmp r0, r3
	blo _08091034
	ldrb r1, [r6, #1]
	cmp r0, r1
	bls _08091040
_08091034:
	ldr r0, [r5]
	mov r2, r8
	adds r2, #4
	mov r8, r2
	subs r2, #4
	stm r2!, {r0}
_08091040:
	adds r4, #1
	ldr r0, _0809105C @ =0x02012464
	ldrh r0, [r0]
	cmp r4, r0
	blt _08091018
_0809104A:
	movs r2, #1
	ldr r5, _08091054 @ =0x02011E24
	ldr r3, _08091058 @ =0x02012466
	mov sl, r3
	b _0809106E
	.align 2, 0
_08091054: .4byte 0x02011E24
_08091058: .4byte 0x02012466
_0809105C: .4byte 0x02012464
_08091060: .4byte 0x08CC440C
_08091064: .4byte 0x020117E4
_08091068:
	lsls r0, r2, #1
	adds r0, r0, r2
	adds r2, r0, #1
_0809106E:
	mov r1, sl
	ldrh r0, [r1]
	movs r1, #3
	str r2, [sp]
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, [sp]
	cmp r2, r0
	blt _08091068
	cmp r2, #0
	ble _08091110
_08091088:
	adds r4, r2, #0
	mov r3, sl
	ldrh r3, [r3]
	cmp r2, r3
	bge _08091102
	ldr r0, _0809112C @ =0x02012466
	mov sl, r0
_08091096:
	subs r7, r4, r2
	adds r4, #1
	mov sb, r4
	cmp r7, #0
	blt _080910F6
	ldr r1, _08091130 @ =0x02011E24
	mov r8, r1
_080910A4:
	lsls r0, r7, #2
	mov r3, r8
	adds r6, r0, r3
	ldrh r0, [r6, #2]
	str r2, [sp]
	bl GetItemIndex
	adds r4, r0, #0
	ldr r2, [sp]
	adds r0, r7, r2
	lsls r0, r0, #2
	mov r1, r8
	adds r5, r0, r1
	ldrh r0, [r5, #2]
	bl GetItemIndex
	ldr r2, [sp]
	cmp r4, r0
	bgt _080910E8
	ldrh r0, [r6, #2]
	str r2, [sp]
	bl GetItemIndex
	adds r4, r0, #0
	ldrh r0, [r5, #2]
	bl GetItemIndex
	ldr r2, [sp]
	cmp r4, r0
	bne _080910F6
	ldrh r3, [r6, #2]
	ldrh r0, [r5, #2]
	cmp r3, r0
	bls _080910F0
_080910E8:
	ldr r1, [r6]
	ldr r0, [r5]
	str r0, [r6]
	str r1, [r5]
_080910F0:
	subs r7, r7, r2
	cmp r7, #0
	bge _080910A4
_080910F6:
	mov r4, sb
	ldr r0, _0809112C @ =0x02012466
	ldr r5, _08091130 @ =0x02011E24
	ldrh r0, [r0]
	cmp r4, r0
	blt _08091096
_08091102:
	adds r0, r2, #0
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	cmp r2, #0
	bgt _08091088
_08091110:
	ldr r1, _08091134 @ =0x020117E4
	movs r2, #0xc8
	lsls r2, r2, #1
	adds r0, r5, #0
	bl CpuFastSet
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809112C: .4byte 0x02012466
_08091130: .4byte 0x02011E24
_08091134: .4byte 0x020117E4

	thumb_func_start SomethingPrepListRelated
SomethingPrepListRelated: @ 0x08091138
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	mov sl, r1
	mov sb, r2
	ldr r6, _08091200 @ =0x020117E4
	ldr r1, _08091204 @ =0x02012464
	movs r0, #0
	strh r0, [r1]
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080911B2
	movs r5, #1
_0809115A:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	adds r7, r5, #1
	cmp r4, #0
	beq _080911AC
	ldr r0, [r4]
	cmp r0, #0
	beq _080911AC
	ldr r0, [r4, #0xc]
	ldr r1, _08091208 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _080911AC
	cmp r4, r8
	beq _080911AC
	adds r0, r4, #0
	bl GetUnitItemCount
	adds r5, r0, #0
	movs r2, #0
	cmp r2, r5
	bge _080911AC
	ldr r3, _08091204 @ =0x02012464
	adds r1, r4, #0
	adds r1, #0x1e
_08091190:
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	strb r0, [r6]
	ldrh r0, [r1]
	strh r0, [r6, #2]
	strb r2, [r6, #1]
	adds r6, #4
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
	adds r1, #2
	adds r2, #1
	cmp r2, r5
	blt _08091190
_080911AC:
	adds r5, r7, #0
	cmp r5, #0x3f
	ble _0809115A
_080911B2:
	movs r0, #1
	mov r1, sb
	ands r0, r1
	cmp r0, #0
	beq _080911EC
	bl GetConvoyItemArray
	adds r1, r0, #0
	movs r2, #0
	ldrh r0, [r1]
	cmp r0, #0
	beq _080911EC
	movs r4, #0
	ldr r3, _08091204 @ =0x02012464
_080911CE:
	ldrh r0, [r1]
	strh r0, [r6, #2]
	strb r4, [r6]
	strb r2, [r6, #1]
	adds r6, #4
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
	adds r1, #2
	adds r2, #1
	cmp r2, #0x63
	bgt _080911EC
	ldrh r0, [r1]
	cmp r0, #0
	bne _080911CE
_080911EC:
	mov r0, sl
	bl sub_08090F9C
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08091200: .4byte 0x020117E4
_08091204: .4byte 0x02012464
_08091208: .4byte 0x00010004

	thumb_func_start sub_0809120C
sub_0809120C: @ 0x0809120C
	push {r4, r5, lr}
	bl ClearSupplyItems
	movs r4, #0
	ldr r0, _08091248 @ =0x02012464
	ldrh r0, [r0]
	cmp r4, r0
	bhs _08091240
	ldr r5, _0809124C @ =0x020117E4
_0809121E:
	lsls r0, r4, #2
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	bne _08091232
	ldrh r0, [r1, #2]
	cmp r0, #0
	beq _08091232
	bl AddItemToConvoy
_08091232:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _08091248 @ =0x02012464
	ldrh r0, [r0]
	cmp r4, r0
	blo _0809121E
_08091240:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08091248: .4byte 0x02012464
_0809124C: .4byte 0x020117E4

	thumb_func_start sub_08091250
sub_08091250: @ 0x08091250
	push {r4, r5, lr}
	bl ClearSupplyItems
	movs r4, #0
	movs r5, #0x87
_0809125A:
	subs r0, r5, r4
	bl AddItemToConvoy
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x63
	bls _0809125A
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08091270
sub_08091270: @ 0x08091270
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r2, #0
	movs r1, #0
	movs r4, #1
_0809127C:
	adds r0, r3, #0
	asrs r0, r1
	ands r0, r4
	cmp r0, #0
	beq _08091288
	adds r2, #1
_08091288:
	adds r1, #1
	cmp r1, #0xf
	ble _0809127C
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08091298
sub_08091298: @ 0x08091298
	push {r4, r5, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r3, #0
	movs r2, #0
	movs r1, #1
_080912A6:
	adds r0, r4, #0
	asrs r0, r2
	ands r0, r1
	cmp r0, #0
	beq _080912BC
	cmp r3, r5
	bne _080912BA
	adds r0, r1, #0
	lsls r0, r2
	b _080912C4
_080912BA:
	adds r3, #1
_080912BC:
	adds r2, #1
	cmp r2, #0xf
	ble _080912A6
	movs r0, #0
_080912C4:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080912CC
sub_080912CC: @ 0x080912CC
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r1, #0
	movs r3, #1
_080912D4:
	adds r0, r2, #0
	asrs r0, r1
	ands r0, r3
	cmp r0, #0
	beq _080912E2
	adds r0, r1, #0
	b _080912EA
_080912E2:
	adds r1, #1
	cmp r1, #0xf
	ble _080912D4
	movs r0, #0
_080912EA:
	bx lr

	thumb_func_start sub_080912EC
sub_080912EC: @ 0x080912EC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl GetUnitItemCount
	adds r6, r0, #0
	movs r4, #0
	cmp r4, r6
	bge _0809131C
_080912FC:
	lsls r1, r4, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl CanUnitUseItemPrepScreen
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08091316
	movs r0, #1
	b _0809131E
_08091316:
	adds r4, #1
	cmp r4, r6
	blt _080912FC
_0809131C:
	movs r0, #0
_0809131E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start PrepItemScreen_OnHBlank
PrepItemScreen_OnHBlank: @ 0x08091324
	ldr r0, _0809134C @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xa0
	bls _08091334
	movs r2, #0
_08091334:
	cmp r2, #0
	bne _0809133E
	ldr r1, _08091350 @ =0x04000012
	movs r0, #0xf8
	strh r0, [r1]
_0809133E:
	cmp r2, #0x48
	bne _08091348
	ldr r1, _08091350 @ =0x04000012
	movs r0, #0xfc
	strh r0, [r1]
_08091348:
	bx lr
	.align 2, 0
_0809134C: .4byte 0x04000006
_08091350: .4byte 0x04000012

	thumb_func_start PrepItemScreen_Init
PrepItemScreen_Init: @ 0x08091354
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x2a
	movs r0, #0xff
	ldrb r1, [r2]
	orrs r1, r0
	strb r1, [r2]
	adds r1, r4, #0
	adds r1, #0x2c
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r1, #1
	movs r0, #0
	strb r0, [r1]
	strh r0, [r4, #0x32]
	str r0, [r4, #0x44]
	str r0, [r4, #0x40]
	bl HasConvoyAccess_
	adds r1, r4, #0
	adds r1, #0x2b
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PrepItemScreen_DrawFunds
PrepItemScreen_DrawFunds: @ 0x0809138C
	push {r4, r5, lr}
	ldr r0, _080913D0 @ =0x02012A90
	ldr r4, _080913D4 @ =0x020230C6
	adds r1, r4, #0
	bl PutText
	adds r5, r4, #0
	adds r5, #0x12
	bl GetGold
	adds r2, r0, #0
	adds r0, r5, #0
	movs r1, #2
	bl PutNumber
	adds r4, #0x14
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0x1e
	bl PutSpecialChar
	movs r0, #0
	movs r1, #0x88
	movs r2, #0x8b
	movs r3, #2
	bl EnableSysBrownBox
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080913D0: .4byte 0x02012A90
_080913D4: .4byte 0x020230C6

	thumb_func_start PrepItemScreen_HideFunds
PrepItemScreen_HideFunds: @ 0x080913D8
	push {lr}
	ldr r0, _080913F8 @ =0x020230C6
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #0
	bl DisableSysBrownBox
	movs r0, #1
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_080913F8: .4byte 0x020230C6

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

	thumb_func_start PrepItemScreen_OnEnd
PrepItemScreen_OnEnd: @ 0x08091824
	push {lr}
	adds r0, #0x29
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl PrepSetLatestCharId
	bl EndAllParallelWorkers
	bl EndSysHandCursor
	bl EndUiCursorHand
	movs r0, #0
	bl EndPrepItemScreenFace
	movs r0, #1
	bl EndPrepItemScreenFace
	bl EndMuralBackground_
	bl EndHelpPromptSprite
	bl EndMenuScrollBar
	bl EndSysBrownBox
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0

	thumb_func_start sub_08091868
sub_08091868: @ 0x08091868
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r1, #0xa
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r4, _080918AC @ =0x02012A70
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	adds r0, #8
	bl ClearText
	ldr r0, _080918B0 @ =0x0000125C
	bl DecodeMsg
	adds r5, #0x42
	movs r1, #0
	str r1, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080918AC: .4byte 0x02012A70
_080918B0: .4byte 0x0000125C

	thumb_func_start sub_080918B4
sub_080918B4: @ 0x080918B4
	push {lr}
	sub sp, #4
	ldr r0, _080918D0 @ =0x0000A580
	str r0, [sp]
	movs r0, #0x88
	movs r1, #0x58
	movs r2, #9
	movs r3, #4
	bl PrepItemDrawPopupBox
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080918D0: .4byte 0x0000A580

	thumb_func_start sub_080918D4
sub_080918D4: @ 0x080918D4
	push {lr}
	sub sp, #4
	ldr r0, _080918F0 @ =0x0000A580
	str r0, [sp]
	movs r0, #8
	movs r1, #0x5c
	movs r2, #0xa
	movs r3, #5
	bl PrepItemDrawPopupBox
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080918F0: .4byte 0x0000A580

	thumb_func_start sub_080918F4
sub_080918F4: @ 0x080918F4
	push {lr}
	sub sp, #4
	ldr r0, _08091910 @ =0x0000A980
	str r0, [sp]
	movs r0, #0x82
	movs r1, #0x50
	movs r2, #9
	movs r3, #6
	bl PrepItemDrawPopupBox
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08091910: .4byte 0x0000A980

	thumb_func_start sub_08091914
sub_08091914: @ 0x08091914
	push {lr}
	ldr r0, _08091938 @ =sub_080918B4
	bl GetParallelWorker
	bl Proc_End
	ldr r0, _0809193C @ =sub_080918D4
	bl GetParallelWorker
	bl Proc_End
	ldr r0, _08091940 @ =sub_080918F4
	bl GetParallelWorker
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_08091938: .4byte sub_080918B4
_0809193C: .4byte sub_080918D4
_08091940: .4byte sub_080918F4

	thumb_func_start sub_08091944
sub_08091944: @ 0x08091944
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r2, r0, #0
	adds r4, r1, #0
	mov r1, sp
	ldr r0, _08091988 @ =0x0840F3B4
	ldm r0!, {r3, r5, r6}
	stm r1!, {r3, r5, r6}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _0809198C @ =0x08406528
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r2, r2, r1
	adds r1, r2, #0
	bl Decompress
	ldr r1, _08091990 @ =0x0202BBF8
	adds r1, #0x41
	movs r0, #0xc
	ldrb r1, [r1]
	ands r0, r1
	add r0, sp
	ldr r0, [r0]
	lsls r4, r4, #5
	adds r1, r4, #0
	movs r2, #0xa0
	bl ApplyPaletteExt
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08091988: .4byte 0x0840F3B4
_0809198C: .4byte 0x08406528
_08091990: .4byte 0x0202BBF8

	thumb_func_start sub_08091994
sub_08091994: @ 0x08091994
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _080919BC @ =0x0840E368
	ldr r1, _080919C0 @ =0x06010000
	adds r2, r2, r1
	adds r1, r2, #0
	bl Decompress
	ldr r0, _080919C4 @ =0x0840E3EC
	adds r4, #0x10
	lsls r4, r4, #5
	adds r1, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080919BC: .4byte 0x0840E368
_080919C0: .4byte 0x06010000
_080919C4: .4byte 0x0840E3EC

	thumb_func_start PrepItemScreen_Reinit
PrepItemScreen_Reinit: @ 0x080919C8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	bl sub_08092AE4
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
	movs r0, #0xc0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_08091944
	movs r0, #0xc0
	lsls r0, r0, #6
	movs r1, #0xa
	bl sub_08091994
	ldr r0, _08091AC0 @ =0x02023460
	ldr r1, _08091AC4 @ =0x084070BC
	movs r2, #0xa6
	lsls r2, r2, #7
	bl sub_080AACD8
	adds r7, r6, #0
	adds r7, #0x29
	ldrb r0, [r7]
	bl GetUnitFromPrepList
	adds r1, r0, #0
	ldr r0, _08091AC8 @ =0x00000503
	str r0, [sp]
	movs r0, #0
	movs r2, #0x44
	movs r3, #0x4e
	bl UpdatePrepItemScreenFace
	ldr r5, _08091ACC @ =0x02012A20
	ldr r4, _08091AD0 @ =0x02022EA4
	ldrb r0, [r7]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r3, #2
	bl sub_080929D0
	adds r4, #0x60
	adds r0, r4, #0
	bl sub_08091868
	adds r1, r6, #0
	adds r1, #0x31
	movs r0, #0
	strb r0, [r1]
	ldrb r5, [r7]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x14
	ldrh r0, [r6, #0x32]
	subs r0, #4
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r4, #0
	movs r2, #7
	bl ShowSysHandCursor
	adds r0, r6, #0
	movs r1, #0
	bl sub_08092ED4
	bl UnblockUiCursorHand
	bl DisableAllUiCursorHand
	movs r0, #0xc9
	movs r1, #0x7b
	adds r2, r6, #0
	bl StartHelpPromptSprite
	bl sub_08091914
	ldr r0, _08091AD4 @ =sub_080918B4
	adds r1, r6, #0
	bl StartParallelWorker
	bl PrepItemScreen_DrawFunds
	movs r0, #7
	bl EnableBgSync
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08091AC0: .4byte 0x02023460
_08091AC4: .4byte 0x084070BC
_08091AC8: .4byte 0x00000503
_08091ACC: .4byte 0x02012A20
_08091AD0: .4byte 0x02022EA4
_08091AD4: .4byte sub_080918B4

