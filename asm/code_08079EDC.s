	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079EDC
sub_08079EDC: @ 0x08079EDC
	push {lr}
	movs r0, #0xf
	bl IsPidBlue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
