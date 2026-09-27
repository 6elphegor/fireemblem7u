	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08027D34
sub_08027D34: @ 0x08027D34
	push {lr}
	bl sub_08031E5C
	pop {r1}
	bx r1
	.align 2, 0
