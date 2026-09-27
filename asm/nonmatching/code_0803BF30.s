	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803BF30
sub_0803BF30: @ 0x0803BF30
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	bl AiSetMovCostTableWithPassableWalls
	ldr r0, _0803BF5C @ =0x0202E3E4
	ldr r0, [r0]
	bl SetWorkingBmMap
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
_0803BF5C: .4byte 0x0202E3E4
