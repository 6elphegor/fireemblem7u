	.include "macro.inc"

	.syntax unified

	thumb_func_start RevertMapChange
RevertMapChange: @ 0x08019BA0
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	bl SetWorkingMoveTable
	ldr r0, _08019BD8 @ =0x0202E3E4
	ldr r1, [r0]
	ldr r0, _08019BDC @ =0x030041E0
	str r1, [r0]
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
_08019BD8: .4byte 0x0202E3E4
_08019BDC: .4byte 0x030041E0
