	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807A3D8
sub_0807A3D8: @ 0x0807A3D8
	push {lr}
	movs r0, #0x9b
	bl CheckFlag
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
