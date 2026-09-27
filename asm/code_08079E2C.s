	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079E2C
sub_08079E2C: @ 0x08079E2C
	push {lr}
	movs r0, #0x1c
	bl IsPidBlue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
