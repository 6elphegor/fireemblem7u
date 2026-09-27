	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807A14C
sub_0807A14C: @ 0x0807A14C
	push {lr}
	movs r0, #0x11
	bl sub_0807A000
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
