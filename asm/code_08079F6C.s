	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079F6C
sub_08079F6C: @ 0x08079F6C
	push {lr}
	movs r0, #0x1b
	bl sub_08079F1C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
