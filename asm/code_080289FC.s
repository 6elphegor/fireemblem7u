	.include "macro.inc"

	.syntax unified

	thumb_func_start ComputeBattleUnitEffectiveStats
ComputeBattleUnitEffectiveStats: @ 0x080289FC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl ComputeBattleUnitEffectiveHitRate
	adds r0, r4, #0
	adds r1, r5, #0
	bl ComputeBattleUnitEffectiveCritRate
	adds r0, r4, #0
	adds r1, r5, #0
	bl ComputeBattleUnitSilencerRate
	adds r0, r4, #0
	adds r1, r5, #0
	bl ComputeBattleUnitSpecialWeaponStats
	pop {r4, r5}
	pop {r0}
	bx r0
