	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSlowLockingFadeFromBlack
StartSlowLockingFadeFromBlack: @ 0x08014020
	push {lr}
	adds r1, r0, #0
	movs r0, #4
	bl StartLockingFadeFromBlack
	pop {r0}
	bx r0
	.align 2, 0
