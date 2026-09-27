	.include "macro.inc"

	.syntax unified

	thumb_func_start GetItemSellPrice
GetItemSellPrice: @ 0x080B1D90
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl GetItemCost
	asrs r1, r0, #0x1f
	lsrs r2, r1, #0x1f
	adds r1, r0, r2
	asrs r0, r1, #1
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r1, r0, #0x10
	adds r0, r1, #0
	b _080B1DB0
_080B1DB0:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1
