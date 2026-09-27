	.include "macro.inc"

	.syntax unified

	thumb_func_start HasBattleUnitGainedWeaponLevel
HasBattleUnitGainedWeaponLevel: @ 0x08029BE8
	push {r4, r5, lr}
	adds r2, r0, #0
	adds r2, #0x50
	adds r1, r0, #0
	adds r1, #0x28
	ldrb r2, [r2]
	adds r1, r2, r1
	ldrb r4, [r1]
	bl GetBattleUnitUpdatedWeaponExp
	adds r5, r0, #0
	cmp r5, #0
	blt _08029C1C
	adds r0, r4, #0
	bl GetWeaponLevelFromExp
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetWeaponLevelFromExp
	adds r1, r0, #0
	eors r1, r4
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	b _08029C1E
_08029C1C:
	movs r0, #0
_08029C1E:
	pop {r4, r5}
	pop {r1}
	bx r1
