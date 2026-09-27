	.include "macro.inc"

	.syntax unified

	thumb_func_start AiGetUnitStealItemSlot
AiGetUnitStealItemSlot: @ 0x080368C0
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r6, #0xff
	movs r5, #0xff
	movs r4, #0
_080368CA:
	lsls r1, r4, #1
	adds r0, r7, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	cmp r1, #0
	beq _080368F6
	movs r0, #0xff
	ands r1, r0
	adds r0, r1, #0
	bl AiGetItemStealRank
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r6, r0
	blo _080368F0
	adds r6, r0, #0
	lsls r0, r4, #0x18
	lsrs r5, r0, #0x18
_080368F0:
	adds r4, #1
	cmp r4, #4
	ble _080368CA
_080368F6:
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
