	.include "macro.inc"

	.syntax unified

	thumb_func_start StartBattleAnimHitEffectsDefault
StartBattleAnimHitEffectsDefault: @ 0x08050140
	push {lr}
	movs r2, #3
	movs r3, #4
	bl StartBattleAnimHitEffects
	pop {r0}
	bx r0
	.align 2, 0
