	.include "macro.inc"

	.syntax unified

	thumb_func_start CanUnitCrossTerrain
CanUnitCrossTerrain: @ 0x08018D68
	push {r4, lr}
	adds r4, r1, #0
	bl GetUnitMovementCost
	movs r1, #0
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _08018D80
	movs r1, #1
_08018D80:
	adds r0, r1, #0
	pop {r4}
	pop {r1}
	bx r1
