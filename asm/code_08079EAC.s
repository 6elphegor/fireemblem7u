	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079EAC
sub_08079EAC: @ 0x08079EAC
	push {lr}
	movs r0, #0x31
	bl IsPidBlue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
