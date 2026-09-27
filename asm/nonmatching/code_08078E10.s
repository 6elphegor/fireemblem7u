	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08078E10
sub_08078E10: @ 0x08078E10
	push {lr}
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetAvailableTileEventCommand
	cmp r0, #0xe
	beq _08078E26
	movs r0, #0
	b _08078E28
_08078E26:
	movs r0, #1
_08078E28:
	pop {r1}
	bx r1
