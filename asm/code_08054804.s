	.include "macro.inc"

	.syntax unified

	thumb_func_start GetAnimRoundTypeAnotherSide
GetAnimRoundTypeAnotherSide: @ 0x08054804
	push {r4, lr}
	adds r4, r0, #0
	bl GetAnimPosition
	adds r2, r0, #0
	ldrh r0, [r4, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	movs r1, #1
	eors r1, r2
	adds r0, r0, r1
	bl GetBattleAnimRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1
