	.include "macro.inc"

	.syntax unified

	thumb_func_start BATTLE_HandleCombatDeaths
BATTLE_HandleCombatDeaths: @ 0x0802F960
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetUnit
	adds r6, r0, #0
	adds r0, r5, #0
	adds r0, #0x66
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetUnit
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl DropRescueOnDeath
	adds r0, r5, #0
	adds r1, r4, #0
	bl DropRescueOnDeath
	adds r0, r6, #0
	adds r1, r4, #0
	bl KillUnitOnCombatDeath
	adds r0, r4, #0
	adds r1, r6, #0
	bl KillUnitOnCombatDeath
	pop {r4, r5, r6}
	pop {r0}
	bx r0
