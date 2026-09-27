	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079A9C
sub_08079A9C: @ 0x08079A9C
	push {lr}
	movs r0, #0x8f
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08079AAE
	movs r0, #0
	b _08079AB0
_08079AAE:
	movs r0, #1
_08079AB0:
	pop {r1}
	bx r1
