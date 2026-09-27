	.include "macro.inc"

	.syntax unified

	thumb_func_start StaffItemSelect_OnHover
StaffItemSelect_OnHover: @ 0x08022AC8
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	ldr r5, _08022B10 @ =0x03004690
	ldr r0, [r5]
	adds r4, #0x3c
	movs r1, #0
	ldrsb r1, [r4, r1]
	bl GetUnitItemUseReachBits
	adds r6, r0, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	bl UpdateMenuItemPanel
	ldr r0, _08022B14 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r0, _08022B18 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, [r5]
	adds r1, r6, #0
	bl BuildUnitStandingRangeForReach
	movs r0, #4
	bl DisplayMoveRangeGraphics
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08022B10: .4byte 0x03004690
_08022B14: .4byte 0x0202E3E4
_08022B18: .4byte 0x0202E3E8
