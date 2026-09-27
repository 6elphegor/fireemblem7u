	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSlowLockingFadeToWhite
StartSlowLockingFadeToWhite: @ 0x08014040
	push {lr}
	adds r1, r0, #0
	movs r0, #4
	bl StartLockingFadeToWhite
	pop {r0}
	bx r0
	.align 2, 0
