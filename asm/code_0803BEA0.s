	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803BEA0
sub_0803BEA0: @ 0x0803BEA0
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	bl SetWorkingMoveTable
	ldr r0, _0803BECC @ =0x0202E3E4
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	movs r2, #0x7c
	bl BeginMapFlood
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803BECC: .4byte 0x0202E3E4
