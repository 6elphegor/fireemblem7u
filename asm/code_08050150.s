	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08050150
sub_08050150: @ 0x08050150
	push {lr}
	movs r2, #5
	movs r3, #5
	bl StartBattleAnimHitEffects
	pop {r0}
	bx r0
	.align 2, 0
