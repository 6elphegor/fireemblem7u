	.include "macro.inc"

	.syntax unified

	thumb_func_start DoM4aSongNumStop
DoM4aSongNumStop: @ 0x0806767C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStop
	pop {r0}
	bx r0
	.align 2, 0
