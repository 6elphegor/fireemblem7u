	.include "macro.inc"

	.syntax unified

	thumb_func_start CheckWin
CheckWin: @ 0x080791C0
	push {lr}
	movs r0, #3
	bl CheckFlag
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
