	.include "macro.inc"

	.syntax unified

	thumb_func_start ComputeBattleUnitBaseDefense
ComputeBattleUnitBaseDefense: @ 0x08028AF8
	adds r1, r0, #0
	adds r1, #0x56
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r2, #0x17
	ldrsb r2, [r0, r2]
	adds r1, r1, r2
	adds r0, #0x5c
	strh r1, [r0]
	bx lr
	.align 2, 0
