	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807A17C
sub_0807A17C: @ 0x0807A17C
	push {lr}
	movs r0, #0x4c
	bl sub_0807A000
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
