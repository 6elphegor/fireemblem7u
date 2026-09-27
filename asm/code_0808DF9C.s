	.include "macro.inc"

	.syntax unified

	thumb_func_start InitPrepScreenMainMenu
InitPrepScreenMainMenu: @ 0x0808DF9C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl sub_0808FE48
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	bne _0808E048
	ldr r1, _0808DFF0 @ =PrepScreenMenu_OnPickUnits
	ldr r3, _0808DFF4 @ =0x0000113D
	str r4, [sp]
	movs r0, #0
	movs r2, #0
	bl SetPrepScreenMenuItem
	ldr r1, _0808DFF8 @ =PrepScreenMenu_OnItems
	ldr r3, _0808DFFC @ =0x0000113E
	str r4, [sp]
	movs r0, #1
	movs r2, #0
	bl SetPrepScreenMenuItem
	adds r0, r5, #0
	bl AtMenu_AddPrepScreenSupportMenuItem
	bl CanPrepScreenCheckMap
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0808E008
	ldr r1, _0808E000 @ =sub_0808DC88
	ldr r3, _0808E004 @ =0x00001141
	str r4, [sp]
	movs r0, #7
	movs r2, #0
	bl SetPrepScreenMenuItem
	b _0808E016
	.align 2, 0
_0808DFF0: .4byte PrepScreenMenu_OnPickUnits
_0808DFF4: .4byte 0x0000113D
_0808DFF8: .4byte PrepScreenMenu_OnItems
_0808DFFC: .4byte 0x0000113E
_0808E000: .4byte sub_0808DC88
_0808E004: .4byte 0x00001141
_0808E008:
	ldr r1, _0808E038 @ =sub_0808DC88
	ldr r3, _0808E03C @ =0x00001141
	str r0, [sp]
	movs r0, #7
	movs r2, #1
	bl SetPrepScreenMenuItem
_0808E016:
	ldr r1, _0808E040 @ =0x0202BBF8
	movs r0, #0x80
	ldrb r1, [r1, #0x14]
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _0808E074
	ldr r1, _0808E044 @ =PrepScreenMenu_OnSave
	movs r3, #0x8a
	lsls r3, r3, #5
	str r0, [sp]
	movs r0, #2
	movs r2, #0
	bl SetPrepScreenMenuItem
	b _0808E074
	.align 2, 0
_0808E038: .4byte sub_0808DC88
_0808E03C: .4byte 0x00001141
_0808E040: .4byte 0x0202BBF8
_0808E044: .4byte PrepScreenMenu_OnSave
_0808E048:
	ldr r1, _0808E0B4 @ =PrepScreenMenu_OnPickUnits
	ldr r3, _0808E0B8 @ =0x0000113D
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r2, #0
	bl SetPrepScreenMenuItem
	ldr r1, _0808E0BC @ =PrepScreenMenu_OnItems
	ldr r3, _0808E0C0 @ =0x0000113E
	str r4, [sp]
	movs r0, #1
	movs r2, #0
	bl SetPrepScreenMenuItem
	ldr r1, _0808E0C4 @ =sub_0808DC3C
	ldr r3, _0808E0C8 @ =0x00001152
	str r4, [sp]
	movs r0, #3
	movs r2, #0
	bl SetPrepScreenMenuItem
_0808E074:
	ldr r0, _0808E0CC @ =sub_0808DC5C
	bl SetPrepScreenMenuOnBPress
	ldr r0, _0808E0D0 @ =PrepScreenMenu_OnStartPress
	bl SetPrepScreenMenuOnStartPress
	ldr r0, _0808E0D4 @ =0x02022C60
	movs r1, #0xc
	movs r2, #0x13
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _0808E0D8 @ =0x02023460
	movs r1, #0xc
	movs r2, #0x13
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #1
	movs r1, #4
	bl DrawPrepScreenMenuFrameAt
	adds r0, r5, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	bl SetPrepScreenMenuSelectedItem
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808E0B4: .4byte PrepScreenMenu_OnPickUnits
_0808E0B8: .4byte 0x0000113D
_0808E0BC: .4byte PrepScreenMenu_OnItems
_0808E0C0: .4byte 0x0000113E
_0808E0C4: .4byte sub_0808DC3C
_0808E0C8: .4byte 0x00001152
_0808E0CC: .4byte sub_0808DC5C
_0808E0D0: .4byte PrepScreenMenu_OnStartPress
_0808E0D4: .4byte 0x02022C60
_0808E0D8: .4byte 0x02023460
