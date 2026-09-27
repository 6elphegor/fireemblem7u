	.include "macro.inc"

	.syntax unified

	thumb_func_start TradeMenu_OnInitUnselected
TradeMenu_OnInitUnselected: @ 0x0802B120
	push {r4, lr}
	adds r4, r0, #0
	bl TradeMenu_RefreshSelectableCells
	adds r4, #0x45
	movs r0, #0
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
