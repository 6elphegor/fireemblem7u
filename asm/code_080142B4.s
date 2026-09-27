	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080142B4
sub_080142B4: @ 0x080142B4
	push {lr}
	adds r2, r0, #0
	adds r3, r1, #0
	movs r0, #3
	movs r1, #0x40
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0
