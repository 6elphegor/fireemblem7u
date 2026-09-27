	.include "macro.inc"

	.syntax unified

	thumb_func_start ShouldCallEndEvent
ShouldCallEndEvent: @ 0x08078FAC
	push {lr}
	bl CheckWin
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
