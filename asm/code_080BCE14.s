	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BCE14
sub_080BCE14: @ 0x080BCE14
	push {lr}
	bl sub_080BCAFC
	pop {r0}
	bx r0
	.align 2, 0
