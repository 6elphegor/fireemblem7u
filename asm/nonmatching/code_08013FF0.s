	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSlowLockingFadeToBlack
StartSlowLockingFadeToBlack: @ 0x08013FF0
	push {lr}
	adds r1, r0, #0
	movs r0, #4
	bl StartLockingFadeToBlack
	pop {r0}
	bx r0
	.align 2, 0
