	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08014114
sub_08014114: @ 0x08014114
	push {lr}
	adds r2, r0, #0
	movs r0, #0
	movs r1, #0x40
	movs r3, #0
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0
