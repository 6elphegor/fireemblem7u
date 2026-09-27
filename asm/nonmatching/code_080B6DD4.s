	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B6DD4
sub_080B6DD4: @ 0x080B6DD4
	push {lr}
	bl sub_080B6C8C
	bl sub_080B6D64
	pop {r0}
	bx r0
	.align 2, 0
