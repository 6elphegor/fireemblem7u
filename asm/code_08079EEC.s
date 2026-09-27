	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079EEC
sub_08079EEC: @ 0x08079EEC
	push {lr}
	movs r0, #0x36
	bl IsPidBlue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
