	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803BF8C
sub_0803BF8C: @ 0x0803BF8C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	adds r0, r4, #0
	bl GetUnitMovementCost
	bl AiSetMovCostTableWithPassableWalls
	ldr r0, _0803BFBC @ =0x0202E3E8
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x7c
	bl BeginMapFlood
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803BFBC: .4byte 0x0202E3E8
