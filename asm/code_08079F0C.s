	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079F0C
sub_08079F0C: @ 0x08079F0C
	push {lr}
	movs r0, #0x27
	bl IsPidBlue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
