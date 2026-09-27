	.include "macro.inc"

	.syntax unified

	thumb_func_start TradeMenu_HighlightUpdater_OnInit
TradeMenu_HighlightUpdater_OnInit: @ 0x0802ACAC
	adds r0, #0x41
	movs r1, #0xff
	strb r1, [r0]
	bx lr
