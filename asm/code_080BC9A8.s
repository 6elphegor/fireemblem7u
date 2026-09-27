	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BC9A8
sub_080BC9A8: @ 0x080BC9A8
	push {lr}
	movs r1, #0
	str r1, [r0, #0x2c]
	bl sub_080BBD28
	pop {r0}
	bx r0
	.align 2, 0
