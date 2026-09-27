	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B85A8
sub_080B85A8: @ 0x080B85A8
	push {lr}
	movs r0, #0xb
	bl FadeBgmOut
	pop {r0}
	bx r0
