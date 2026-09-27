	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079DCC
sub_08079DCC: @ 0x08079DCC
	push {lr}
	movs r0, #0x14
	bl IsPidBlue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
