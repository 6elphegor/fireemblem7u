	.include "macro.inc"

	.syntax unified

	thumb_func_start AddBallista
AddBallista: @ 0x08034740
	push {r4, r5, r6, lr}
	adds r5, r2, #0
	movs r2, #1
	movs r3, #0
	bl AddTrap
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetItemIndex
	movs r6, #0
	strb r0, [r4, #3]
	adds r0, r5, #0
	bl MakeNewItem
	bl GetItemUses
	strb r0, [r4, #6]
	strb r6, [r4, #5]
	adds r0, r4, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
