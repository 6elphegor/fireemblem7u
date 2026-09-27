	.include "macro.inc"

	.syntax unified

	thumb_func_start StartMidLockingFadeFromBlack
StartMidLockingFadeFromBlack: @ 0x08014010
	push {lr}
	adds r1, r0, #0
	movs r0, #0x10
	bl StartLockingFadeFromBlack
	pop {r0}
	bx r0
	.align 2, 0
