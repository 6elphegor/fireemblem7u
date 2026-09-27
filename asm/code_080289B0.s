	.include "macro.inc"

	.syntax unified

	thumb_func_start ComputeBattleUnitStats
ComputeBattleUnitStats: @ 0x080289B0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl ComputeBattleUnitDefense
	adds r0, r4, #0
	adds r1, r5, #0
	bl ComputeBattleUnitAttack
	adds r0, r4, #0
	bl ComputeBattleUnitSpeed
	adds r0, r4, #0
	bl ComputeBattleUnitHitRate
	adds r0, r4, #0
	bl ComputeBattleUnitAvoidRate
	adds r0, r4, #0
	bl ComputeBattleUnitCritRate
	adds r0, r4, #0
	bl ComputeBattleUnitDodgeRate
	adds r0, r4, #0
	adds r1, r5, #0
	bl ComputeBattleUnitSupportBonuses
	adds r0, r4, #0
	bl ComputeBattleUnitWeaponRankBonuses
	adds r0, r4, #0
	bl ComputeBattleUnitStatusBonuses
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
