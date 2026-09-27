	.include "macro.inc"

	.syntax unified

	thumb_func_start TradeMenu_GetAdjustedRow
TradeMenu_GetAdjustedRow: @ 0x0802AD30
	push {r4, lr}
	adds r3, r2, #0
	lsls r2, r1, #1
	adds r2, r2, r1
	lsls r4, r2, #1
	adds r1, r3, r4
	adds r2, r0, #0
	adds r2, #0x34
	adds r1, r2, r1
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0802AD62
	cmp r3, #0
	blt _0802AD62
	adds r0, r4, r2
	adds r1, r3, r0
_0802AD52:
	subs r1, #1
	subs r3, #1
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0802AD62
	cmp r3, #0
	bge _0802AD52
_0802AD62:
	adds r0, r3, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
