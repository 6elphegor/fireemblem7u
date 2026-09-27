	.include "macro.inc"

	.syntax unified

	thumb_func_start MapFloodUnitExtended
MapFloodUnitExtended: @ 0x08019C1C
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	bl SetWorkingMoveTable
	ldr r0, _08019C48 @ =0x0202E3E4
	ldr r1, [r0]
	ldr r0, _08019C4C @ =0x030041E0
	str r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0x7c
	movs r3, #0
	bl BeginMapFlood
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08019C48: .4byte 0x0202E3E4
_08019C4C: .4byte 0x030041E0
