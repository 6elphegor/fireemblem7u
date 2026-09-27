	.include "macro.inc"

	.syntax unified

	thumb_func_start HelpBoxSetupstringLines
HelpBoxSetupstringLines: @ 0x08082BD8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x58]
	ldr r0, _08082C00 @ =0x0203E6A0
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r0, r4, #0
	bl GetHelpBoxItemInfoKind
	adds r1, r0, #0
	cmp r1, #1
	beq _08082C16
	cmp r1, #1
	bgt _08082C04
	cmp r1, #0
	beq _08082C0E
	b _08082C38
	.align 2, 0
_08082C00: .4byte 0x0203E6A0
_08082C04:
	cmp r1, #2
	beq _08082C24
	cmp r1, #3
	beq _08082C2C
	b _08082C38
_08082C0E:
	adds r0, r5, #0
	adds r0, #0x64
	strh r1, [r0]
	b _08082C38
_08082C16:
	adds r0, r4, #0
	bl DrawHelpBoxWeaponLabels
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #2
	b _08082C36
_08082C24:
	adds r0, r4, #0
	bl DrawHelpBoxStaffLabels
	b _08082C30
_08082C2C:
	bl DrawHelpBoxSaveMenuLabels
_08082C30:
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #1
_08082C36:
	strh r0, [r1]
_08082C38:
	movs r0, #0
	bl SetTextFont
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
