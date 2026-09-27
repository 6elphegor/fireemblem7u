	.include "macro.inc"

	.syntax unified

	thumb_func_start MapFloodUnitMovement
MapFloodUnitMovement: @ 0x08019BE0
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	bl GetUnitMovementCost
	bl SetWorkingMoveTable
	ldr r0, _08019C14 @ =0x0202E3E4
	ldr r1, [r0]
	ldr r0, _08019C18 @ =0x030041E0
	str r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	movs r3, #0xb
	ldrsb r3, [r5, r3]
	adds r2, r4, #0
	bl BeginMapFlood
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08019C14: .4byte 0x0202E3E4
_08019C18: .4byte 0x030041E0
