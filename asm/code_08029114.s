	.include "macro.inc"

	.syntax unified

	thumb_func_start GetBattleUnitHitCount
GetBattleUnitHitCount: @ 0x08029114
	push {r4, lr}
	movs r4, #1
	bl BattleCheckBraveEffect
	lsls r4, r0
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
