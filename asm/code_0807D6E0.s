	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807D6E0
sub_0807D6E0: @ 0x0807D6E0
	push {lr}
	adds r2, r0, #0
	adds r2, #0x4c
	movs r1, #0xf
	strh r1, [r2]
	bl sub_0807D6B4
	pop {r0}
	bx r0
	.align 2, 0
