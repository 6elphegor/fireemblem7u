	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807A1BC
sub_0807A1BC: @ 0x0807A1BC
	push {lr}
	movs r0, #1
	movs r1, #0x2d
	bl ArePidsAtMaxSupport
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
