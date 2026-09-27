	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A40EC
sub_080A40EC: @ 0x080A40EC
	push {lr}
	bl sub_080A3CAC
	pop {r0}
	bx r0
	.align 2, 0
