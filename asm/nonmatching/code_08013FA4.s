	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08013FA4
sub_08013FA4: @ 0x08013FA4
	push {lr}
	movs r0, #4
	bl StartFadeToBlack
	pop {r0}
	bx r0
