	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079E7C
sub_08079E7C: @ 0x08079E7C
	push {lr}
	movs r0, #0xd
	bl IsPidBlue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
