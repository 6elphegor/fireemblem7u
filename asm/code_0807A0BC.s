	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807A0BC
sub_0807A0BC: @ 0x0807A0BC
	push {lr}
	movs r0, #0x3b
	bl sub_0807A000
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
