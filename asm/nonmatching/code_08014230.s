	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08014230
sub_08014230: @ 0x08014230
	push {lr}
	adds r2, r0, #0
	movs r0, #7
	movs r1, #0x10
	movs r3, #0
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0
