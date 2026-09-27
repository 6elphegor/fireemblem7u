	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079DDC
sub_08079DDC: @ 0x08079DDC
	push {lr}
	movs r0, #0x24
	bl IsPidBlue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
