	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08014000
sub_08014000: @ 0x08014000
	push {lr}
	adds r1, r0, #0
	movs r0, #0x40
	bl StartLockingFadeToBlack
	pop {r0}
	bx r0
	.align 2, 0
