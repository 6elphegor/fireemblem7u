	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08078EB8
sub_08078EB8: @ 0x08078EB8
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	lsls r1, r1, #0x18
	asrs r4, r1, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08078E54
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08078ED8
	adds r0, r5, #0
	adds r1, r4, #0
	bl StartAvailableTileEvent
_08078ED8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
