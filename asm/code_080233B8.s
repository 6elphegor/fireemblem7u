	.include "macro.inc"

	.syntax unified

	thumb_func_start TradeSelection_OnChange
TradeSelection_OnChange: @ 0x080233B8
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl ChangeActiveUnitFacing
	bl ClearIcons
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl RefreshUnitInventoryInfoWindow
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
