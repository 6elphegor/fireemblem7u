	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08081490
sub_08081490: @ 0x08081490
	push {lr}
	bl EndMuralBackground
	pop {r0}
	bx r0
	.align 2, 0
