	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803030C
sub_0803030C: @ 0x0803030C
	push {lr}
	bl sub_0802FF80
	bl sub_08030250
	pop {r0}
	bx r0
	.align 2, 0
