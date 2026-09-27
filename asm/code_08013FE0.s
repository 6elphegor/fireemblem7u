	.include "macro.inc"

	.syntax unified

	thumb_func_start StartMidLockingFadeToBlack
StartMidLockingFadeToBlack: @ 0x08013FE0
	push {lr}
	adds r1, r0, #0
	movs r0, #0x10
	bl StartLockingFadeToBlack
	pop {r0}
	bx r0
	.align 2, 0
