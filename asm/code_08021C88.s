	.include "macro.inc"

	.syntax unified

	thumb_func_start WeaponSelectMenu_SwitchIn
WeaponSelectMenu_SwitchIn: @ 0x08021C88
	push {r4, r5, lr}
	adds r5, r1, #0
	adds r5, #0x3c
	movs r0, #0
	ldrsb r0, [r5, r0]
	bl UpdateMenuItemPanel
	ldr r0, _08021CD0 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r0, _08021CD4 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r4, _08021CD8 @ =0x03004690
	ldr r0, [r4]
	movs r1, #0
	ldrsb r1, [r5, r1]
	bl GetUnitWeaponReach
	adds r1, r0, #0
	ldr r0, [r4]
	bl BuildUnitStandingRangeForReach
	movs r0, #2
	bl DisplayMoveRangeGraphics
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08021CD0: .4byte 0x0202E3E4
_08021CD4: .4byte 0x0202E3E8
_08021CD8: .4byte 0x03004690
