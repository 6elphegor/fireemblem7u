	.include "macro.inc"

	.syntax unified

	thumb_func_start AiGetItemStealRank
AiGetItemStealRank: @ 0x0803688C
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r0, #0
	ldr r2, _080368B8 @ =0x08B97290
	ldrh r1, [r2]
	ldr r3, _080368BC @ =0x0000FFFF
	cmp r1, r3
	beq _080368AC
_0803689E:
	cmp r1, r4
	beq _080368B0
	adds r2, #2
	adds r0, #1
	ldrh r1, [r2]
	cmp r1, r3
	bne _0803689E
_080368AC:
	movs r0, #1
	rsbs r0, r0, #0
_080368B0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080368B8: .4byte 0x08B97290
_080368BC: .4byte 0x0000FFFF
