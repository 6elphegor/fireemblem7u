	.include "macro.inc"

	.syntax unified

	thumb_func_start ComputeBattleUnitDodgeRate
ComputeBattleUnitDodgeRate: @ 0x08028D3C
	movs r1, #0x19
	ldrsb r1, [r0, r1]
	adds r0, #0x68
	strh r1, [r0]
	bx lr
	.align 2, 0
