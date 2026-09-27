	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B6674
sub_080B6674: @ 0x080B6674
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	bl GetGameTacticsRank
	mov r8, r0
	bl GetGameSurvivalRank
	adds r6, r0, #0
	bl GetGameFundsRank
	adds r5, r0, #0
	bl GetGameExpRank
	adds r4, r0, #0
	bl GetGameCombatRank
	str r0, [sp]
	mov r0, r8
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl GetOverallRank
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
