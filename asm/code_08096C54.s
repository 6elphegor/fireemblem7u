	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08096C54
sub_08096C54: @ 0x08096C54
	push {lr}
	bl sub_08096054
	pop {r0}
	bx r0
	.align 2, 0
