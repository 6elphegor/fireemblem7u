	.include "macro.inc"

	.syntax unified

	thumb_func_start IsThereClosedDoorAt
IsThereClosedDoorAt: @ 0x08078EE0
	push {lr}
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetAvailableTileEventCommand
	cmp r0, #0x12
	beq _08078EF6
	movs r0, #0
	b _08078EF8
_08078EF6:
	movs r0, #1
_08078EF8:
	pop {r1}
	bx r1
