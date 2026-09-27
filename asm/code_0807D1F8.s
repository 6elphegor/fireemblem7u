	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807D1F8
sub_0807D1F8: @ 0x0807D1F8
	push {lr}
	bl sub_0807D18C
	movs r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bhi _0807D20A
	movs r1, #1
_0807D20A:
	adds r0, r1, #0
	pop {r1}
	bx r1
