	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08014258
sub_08014258: @ 0x08014258
	push {lr}
	adds r2, r0, #0
	movs r0, #4
	movs r1, #4
	movs r3, #0
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0
