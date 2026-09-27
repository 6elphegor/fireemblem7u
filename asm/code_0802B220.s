	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802B220
sub_0802B220: @ 0x0802B220
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x41
	ldrb r0, [r5]
	adds r1, r4, #0
	adds r1, #0x43
	strb r0, [r1]
	adds r6, r4, #0
	adds r6, #0x42
	ldrb r1, [r6]
	adds r0, r4, #0
	adds r0, #0x44
	strb r1, [r0]
	movs r0, #1
	ldrb r1, [r5]
	eors r0, r1
	strb r0, [r5]
	ldrb r1, [r5]
	adds r0, r4, #0
	movs r2, #4
	bl TradeMenu_GetAdjustedRow
	cmp r0, #4
	beq _0802B280
	adds r0, #1
	strb r0, [r6]
	ldrb r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	ldrb r1, [r6]
	adds r0, r1, r0
	adds r1, r4, #0
	adds r1, #0x34
	adds r1, r1, r0
	movs r0, #1
	strb r0, [r1]
	adds r1, r4, #0
	adds r1, #0x45
	strb r0, [r1]
	ldrb r0, [r5]
	adds r1, #1
	strb r0, [r1]
	ldrb r1, [r6]
	adds r0, r4, #0
	adds r0, #0x47
	strb r1, [r0]
_0802B280:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
