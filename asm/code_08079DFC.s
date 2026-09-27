	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079DFC
sub_08079DFC: @ 0x08079DFC
	push {lr}
	movs r0, #8
	bl IsPidBlue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
