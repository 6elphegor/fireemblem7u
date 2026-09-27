	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807D1E0
sub_0807D1E0: @ 0x0807D1E0
	push {lr}
	bl sub_0807D18C
	movs r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0807D1F2
	movs r1, #1
_0807D1F2:
	adds r0, r1, #0
	pop {r1}
	bx r1
