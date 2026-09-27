	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08013FC8
sub_08013FC8: @ 0x08013FC8
	push {lr}
	movs r0, #4
	bl StartFadeFromBlack
	pop {r0}
	bx r0
