	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepScreenProc_StartMapMenu
PrepScreenProc_StartMapMenu: @ 0x0803069C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl LoadHelpBoxGfx
	bl ResetText
	bl EndPlayerPhaseSideWindows
	bl HideMoveRangeGraphics
	adds r0, r4, #0
	bl sub_0808FE48
	ldr r1, _08030744 @ =PrepMapMenu_OnViewMap
	ldr r3, _08030748 @ =0x0000114F
	ldr r0, _0803074C @ =0x00000383
	str r0, [sp]
	movs r0, #1
	movs r2, #0
	bl SetPrepScreenMenuItem
	ldr r1, _08030750 @ =PrepMapMenu_OnFormation
	ldr r3, _08030754 @ =0x0000114E
	movs r0, #0xe1
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #2
	movs r2, #0
	bl SetPrepScreenMenuItem
	ldr r1, _08030758 @ =PrepMapMenu_OnOptions
	ldr r3, _0803075C @ =0x0000114C
	ldr r0, _08030760 @ =0x00000382
	str r0, [sp]
	movs r0, #8
	movs r2, #0
	bl SetPrepScreenMenuItem
	ldr r1, _08030764 @ =0x0202BBF8
	movs r0, #0x80
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _0803070E
	ldr r1, _08030768 @ =PrepMapMenu_OnSave
	movs r3, #0x8a
	lsls r3, r3, #5
	ldr r0, _0803076C @ =0x0000037E
	str r0, [sp]
	movs r0, #9
	movs r2, #0
	bl SetPrepScreenMenuItem
_0803070E:
	adds r0, r4, #0
	bl sub_08030674
	ldr r0, _08030770 @ =PrepMapMenu_OnBPress
	bl SetPrepScreenMenuOnBPress
	ldr r0, _08030774 @ =PrepMapMenu_OnStartPress
	bl SetPrepScreenMenuOnStartPress
	ldr r0, _08030778 @ =sub_08030688
	bl SetPrepScreenMenuOnEnd
	movs r0, #0xa
	movs r1, #2
	bl DrawPrepScreenMenuFrameAt
	ldr r0, [r4, #0x58]
	bl SetPrepScreenMenuSelectedItem
	movs r0, #3
	bl EnableBgSync
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08030744: .4byte PrepMapMenu_OnViewMap
_08030748: .4byte 0x0000114F
_0803074C: .4byte 0x00000383
_08030750: .4byte PrepMapMenu_OnFormation
_08030754: .4byte 0x0000114E
_08030758: .4byte PrepMapMenu_OnOptions
_0803075C: .4byte 0x0000114C
_08030760: .4byte 0x00000382
_08030764: .4byte 0x0202BBF8
_08030768: .4byte PrepMapMenu_OnSave
_0803076C: .4byte 0x0000037E
_08030770: .4byte PrepMapMenu_OnBPress
_08030774: .4byte PrepMapMenu_OnStartPress
_08030778: .4byte sub_08030688
