	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08011D24
sub_08011D24: @ 0x08011D24
	push {lr}
	bl EndMixPalette
	movs r0, #0
	pop {r1}
	bx r1
