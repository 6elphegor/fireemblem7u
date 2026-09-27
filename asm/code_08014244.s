	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08014244
sub_08014244: @ 0x08014244
	push {lr}
	adds r2, r0, #0
	movs r0, #6
	movs r1, #8
	movs r3, #0
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0
