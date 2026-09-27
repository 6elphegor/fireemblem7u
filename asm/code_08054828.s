	.include "macro.inc"

	.syntax unified

	thumb_func_start GetAnimNextRoundTypeAnotherSide
GetAnimNextRoundTypeAnotherSide: @ 0x08054828
	push {r4, lr}
	adds r4, r0, #0
	bl GetAnimPosition
	adds r2, r0, #0
	ldrh r4, [r4, #0xe]
	lsls r0, r4, #1
	movs r1, #1
	eors r1, r2
	adds r0, r0, r1
	bl GetBattleAnimRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
