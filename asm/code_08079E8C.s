	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079E8C
sub_08079E8C: @ 0x08079E8C
	push {lr}
	movs r0, #0x2e
	bl IsPidBlue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
