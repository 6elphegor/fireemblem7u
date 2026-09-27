	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079E6C
sub_08079E6C: @ 0x08079E6C
	push {lr}
	movs r0, #0x30
	bl IsPidBlue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
