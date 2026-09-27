	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079C24
sub_08079C24: @ 0x08079C24
	push {lr}
	movs r0, #0
	bl SetVisionWithFade
	pop {r0}
	bx r0
