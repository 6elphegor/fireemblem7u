	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079DEC
sub_08079DEC: @ 0x08079DEC
	push {lr}
	movs r0, #0x1b
	bl IsPidBlue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
