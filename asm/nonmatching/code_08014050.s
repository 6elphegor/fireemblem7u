	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08014050
sub_08014050: @ 0x08014050
	push {lr}
	adds r1, r0, #0
	movs r0, #4
	bl StartLockingFadeFromWhite
	pop {r0}
	bx r0
	.align 2, 0
