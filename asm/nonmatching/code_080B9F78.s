	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B9F78
sub_080B9F78: @ 0x080B9F78
	push {lr}
	movs r0, #3
	bl FadeBgmOut
	pop {r0}
	bx r0
