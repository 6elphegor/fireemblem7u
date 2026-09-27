	.include "macro.inc"

	.syntax unified

	thumb_func_start StartPrepItemTradeScreen
StartPrepItemTradeScreen: @ 0x0809285C
	push {r4, r5, lr}
	adds r4, r0, #0
	bl PrepItemScreen_OnEnd
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r5, r0, #0
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r1, r0, #0
	adds r0, r5, #0
	adds r2, r4, #0
	bl StartPrepItemTradeScreenProc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
