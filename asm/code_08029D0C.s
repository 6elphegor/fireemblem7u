	.include "macro.inc"

	.syntax unified

	thumb_func_start UpdateUnitDuringBattle
UpdateUnitDuringBattle: @ 0x08029D0C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldrb r0, [r4, #0x13]
	strb r0, [r5, #0x13]
	adds r0, r4, #0
	bl GetBattleUnitUpdatedWeaponExp
	adds r2, r0, #0
	cmp r2, #0
	ble _08029D30
	adds r1, r4, #0
	adds r1, #0x50
	adds r0, r5, #0
	adds r0, #0x28
	ldrb r1, [r1]
	adds r0, r1, r0
	strb r2, [r0]
_08029D30:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
