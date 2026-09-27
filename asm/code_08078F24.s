	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08078F24
sub_08078F24: @ 0x08078F24
	push {lr}
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetAvailableTileEventCommand
	cmp r0, #0x10
	beq _08078F3A
	movs r0, #0
	b _08078F3C
_08078F3A:
	movs r0, #1
_08078F3C:
	pop {r1}
	bx r1
