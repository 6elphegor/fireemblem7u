	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079ECC
sub_08079ECC: @ 0x08079ECC
	push {lr}
	movs r0, #0x15
	bl IsPidBlue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
