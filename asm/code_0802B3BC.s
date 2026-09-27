	.include "macro.inc"

	.syntax unified

	thumb_func_start TradeMenu_OnEndSelected
TradeMenu_OnEndSelected: @ 0x0802B3BC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0x43
	ldrb r0, [r0]
	adds r5, r4, #0
	adds r5, #0x41
	strb r0, [r5]
	adds r0, r4, #0
	adds r0, #0x44
	ldrb r0, [r0]
	adds r6, r4, #0
	adds r6, #0x42
	strb r0, [r6]
	adds r0, r4, #0
	bl TradeMenu_RefreshSelectableCells
	ldrb r2, [r5]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r0, r4, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0802B3FA
	movs r0, #1
	eors r2, r0
	strb r2, [r5]
_0802B3FA:
	ldrb r1, [r5]
	ldrb r2, [r6]
	adds r0, r4, #0
	bl TradeMenu_GetAdjustedRow
	strb r0, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
