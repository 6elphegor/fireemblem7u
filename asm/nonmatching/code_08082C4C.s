	.include "macro.inc"

	.syntax unified

	thumb_func_start HelpBoxDrawstring
HelpBoxDrawstring: @ 0x08082C4C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x58]
	ldr r0, _08082C68 @ =0x0203E6A0
	bl SetTextFont
	adds r0, r4, #0
	bl GetHelpBoxItemInfoKind
	cmp r0, #1
	beq _08082C6C
	cmp r0, #3
	beq _08082C74
	b _08082C78
	.align 2, 0
_08082C68: .4byte 0x0203E6A0
_08082C6C:
	adds r0, r4, #0
	bl DrawHelpBoxWeaponStats
	b _08082C78
_08082C74:
	bl DrawHelpBoxSaveMenuStats
_08082C78:
	movs r0, #0
	bl SetTextFont
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
