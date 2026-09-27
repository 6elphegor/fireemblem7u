	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803BFF4
sub_0803BFF4: @ 0x0803BFF4
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	movs r1, #0x1e
	bl sub_0803BE3C
	ldr r0, _0803C020 @ =0x0202E3E8
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
_0803C020: .4byte 0x0202E3E8
