	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079EBC
sub_08079EBC: @ 0x08079EBC
	push {lr}
	movs r0, #0x33
	bl IsPidBlue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
