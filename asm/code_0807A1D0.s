	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807A1D0
sub_0807A1D0: @ 0x0807A1D0
	push {lr}
	movs r0, #1
	movs r1, #0x25
	bl ArePidsAtMaxSupport
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
