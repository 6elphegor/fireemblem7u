	.include "macro.inc"

	.syntax unified

	thumb_func_start TradeMenu_ClearDisplay
TradeMenu_ClearDisplay: @ 0x0802B458
	push {lr}
	movs r0, #0
	bl EndFaceById
	movs r0, #1
	bl EndFaceById
	pop {r0}
	bx r0
	.align 2, 0
