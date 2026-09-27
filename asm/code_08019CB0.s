	.include "macro.inc"

	.syntax unified

	thumb_func_start MapFloodOnWorkingMap
MapFloodOnWorkingMap: @ 0x08019CB0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	bl GetUnitMovementCost
	bl SetWorkingMoveTable
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	adds r0, r5, #0
	adds r1, r6, #0
	mov r2, r8
	bl BeginMapFlood
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
