	.include "macro.inc"

	.syntax unified

	thumb_func_start GenerateExtendedMovementMapOnRangeNeglectWall
GenerateExtendedMovementMapOnRangeNeglectWall: @ 0x0803BF60
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r2, #0
	bl AiSetMovCostTableWithPassableWalls
	ldr r0, _0803BF88 @ =0x0202E3E8
	ldr r0, [r0]
	bl SetWorkingBmMap
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x7c
	movs r3, #0
	bl BeginMapFlood
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803BF88: .4byte 0x0202E3E8
