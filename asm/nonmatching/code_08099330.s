	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08099330
sub_08099330: @ 0x08099330
	push {lr}
	bl sub_0809931C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
