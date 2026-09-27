	.include "macro.inc"

	.syntax unified

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
