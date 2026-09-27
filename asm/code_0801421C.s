	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801421C
sub_0801421C: @ 0x0801421C
	push {lr}
	adds r2, r0, #0
	movs r0, #6
	movs r1, #0x10
	movs r3, #0
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0
