	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08027DA0
sub_08027DA0: @ 0x08027DA0
	push {lr}
	bl sub_08031EF0
	pop {r1}
	bx r1
	.align 2, 0
