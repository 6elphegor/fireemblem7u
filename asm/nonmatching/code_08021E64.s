	.include "macro.inc"

	.syntax unified

	thumb_func_start TradeCommandEffect
TradeCommandEffect: @ 0x08021E64
	push {lr}
	bl ClearUi
	ldr r0, _08021E80 @ =0x03004690
	ldr r0, [r0]
	bl MakeTradeTargetList
	ldr r0, _08021E84 @ =0x08B95C78
	bl StartMapSelect
	movs r0, #7
	pop {r1}
	bx r1
	.align 2, 0
_08021E80: .4byte 0x03004690
_08021E84: .4byte 0x08B95C78
