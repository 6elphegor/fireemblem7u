	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803FB24
sub_0803FB24: @ 0x0803FB24
	push {lr}
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803FB34
	bl sub_08047CA8
_0803FB34:
	pop {r0}
	bx r0
