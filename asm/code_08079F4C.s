	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079F4C
sub_08079F4C: @ 0x08079F4C
	push {lr}
	movs r0, #0x11
	bl sub_08079F1C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
