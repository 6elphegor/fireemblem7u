	.include "macro.inc"

	.syntax unified

	thumb_func_start CheckAnyBlueUnitArea3
CheckAnyBlueUnitArea3: @ 0x08078870
	push {lr}
	movs r0, #0xc
	movs r1, #0x15
	movs r2, #0x1f
	movs r3, #0x18
	bl CheckAnyBlueUnitArea
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
