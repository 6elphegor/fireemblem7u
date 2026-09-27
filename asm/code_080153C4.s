	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080153C4
sub_080153C4: @ 0x080153C4
	push {lr}
	bl sub_08079104
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _080153D6
	movs r0, #1
	b _080153DC
_080153D6:
	bl sub_080790C4
	movs r0, #0
_080153DC:
	pop {r1}
	bx r1
