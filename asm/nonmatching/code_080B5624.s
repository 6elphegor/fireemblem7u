	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B5624
sub_080B5624: @ 0x080B5624
	push {lr}
	movs r0, #4
	bl FadeBgmOut
	pop {r0}
	bx r0
