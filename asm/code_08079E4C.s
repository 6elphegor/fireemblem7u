	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079E4C
sub_08079E4C: @ 0x08079E4C
	push {lr}
	movs r0, #0x2f
	bl IsPidBlue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
