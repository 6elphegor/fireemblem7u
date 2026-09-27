	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079DBC
sub_08079DBC: @ 0x08079DBC
	push {lr}
	movs r0, #0x23
	bl IsPidBlue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
