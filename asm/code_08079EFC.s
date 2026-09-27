	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079EFC
sub_08079EFC: @ 0x08079EFC
	push {lr}
	movs r0, #0x22
	bl IsPidBlue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
