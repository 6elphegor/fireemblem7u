	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809A824
sub_0809A824: @ 0x0809A824
	push {lr}
	adds r2, r0, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	adds r1, r2, #0
	adds r1, #0x3d
	ldrb r1, [r1]
	bl sub_0809E3D8
	pop {r0}
	bx r0
	.align 2, 0
