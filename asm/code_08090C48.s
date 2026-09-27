	.include "macro.inc"

	.syntax unified

	thumb_func_start GetConvoyItemCount_
GetConvoyItemCount_: @ 0x08090C48
	push {lr}
	bl GetConvoyItemCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
