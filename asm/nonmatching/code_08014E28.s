	.include "macro.inc"

	.syntax unified

	thumb_func_start _FadeBgmOut
_FadeBgmOut: @ 0x08014E28
	push {lr}
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl FadeBgmOut
	pop {r0}
	bx r0
	.align 2, 0
