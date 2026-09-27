	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807D1C8
sub_0807D1C8: @ 0x0807D1C8
	push {lr}
	bl sub_0807D18C
	movs r1, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807D1D8
	movs r1, #1
_0807D1D8:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
