	.include "macro.inc"

	.syntax unified

	thumb_func_start StartAvailableChestTileEvent
StartAvailableChestTileEvent: @ 0x08078EFC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	lsls r1, r1, #0x18
	asrs r4, r1, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl IsThereClosedDoorAt
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08078F1C
	adds r0, r5, #0
	adds r1, r4, #0
	bl StartAvailableTileEvent
_08078F1C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
