	.include "macro.inc"

	.syntax unified

	thumb_func_start UnitUpdateUsedItem
UnitUpdateUsedItem: @ 0x0801842C
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r4, r0, r1
	ldrh r0, [r4]
	cmp r0, #0
	beq _08018448
	bl GetItemAfterUse
	strh r0, [r4]
	adds r0, r5, #0
	bl UnitRemoveInvalidItems
_08018448:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
