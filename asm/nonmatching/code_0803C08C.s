	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803C08C
sub_0803C08C: @ 0x0803C08C
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	bl SetWorkingMoveTable
	ldr r0, _0803C0C4 @ =0x0202E3E8
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0x1d
	ldrsb r2, [r4, r2]
	ldr r3, [r4, #4]
	ldrb r3, [r3, #0x12]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	adds r2, r2, r3
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	bl BeginMapFlood
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803C0C4: .4byte 0x0202E3E8
