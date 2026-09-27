	.include "macro.inc"

	.syntax unified

	thumb_func_start TradeMenu_LoadForcedInitialHover
TradeMenu_LoadForcedInitialHover: @ 0x0802B40C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0802B44C @ =0x0202BBB8
	adds r5, r0, #0
	adds r5, #0x3f
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	blt _0802B450
	movs r1, #5
	bl __divsi3
	adds r1, r4, #0
	adds r1, #0x41
	strb r0, [r1]
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r1, #5
	bl __modsi3
	adds r1, r4, #0
	adds r1, #0x42
	strb r0, [r1]
	adds r0, r4, #0
	bl TradeMenu_RefreshSelectableCells
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	movs r0, #0
	b _0802B452
	.align 2, 0
_0802B44C: .4byte 0x0202BBB8
_0802B450:
	movs r0, #1
_0802B452:
	pop {r4, r5}
	pop {r1}
	bx r1
