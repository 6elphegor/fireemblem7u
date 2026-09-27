	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801BC08
sub_0801BC08: @ 0x0801BC08
	push {lr}
	movs r0, #3
	bl sub_080A4E0C
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
