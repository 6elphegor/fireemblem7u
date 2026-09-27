	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807A20C
sub_0807A20C: @ 0x0807A20C
	push {lr}
	movs r0, #2
	movs r1, #0x31
	bl ArePidsAtMaxSupport
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
