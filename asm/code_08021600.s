	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08021600
sub_08021600: @ 0x08021600
	push {lr}
	movs r0, #3
	bl sub_080A4E0C
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
