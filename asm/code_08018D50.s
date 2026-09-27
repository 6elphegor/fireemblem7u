	.include "macro.inc"

	.syntax unified

	thumb_func_start UnitRemoveItem
UnitRemoveItem: @ 0x08018D50
	push {lr}
	lsls r1, r1, #1
	adds r2, r0, #0
	adds r2, #0x1e
	adds r2, r2, r1
	movs r1, #0
	strh r1, [r2]
	bl UnitRemoveInvalidItems
	pop {r0}
	bx r0
	.align 2, 0
