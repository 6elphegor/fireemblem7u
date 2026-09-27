	.include "macro.inc"

	.syntax unified

	thumb_func_start BattleInitItemEffectTarget
BattleInitItemEffectTarget: @ 0x0802A560
	push {r4, lr}
	adds r1, r0, #0
	ldr r4, _0802A5AC @ =0x0203A470
	adds r0, r4, #0
	bl InitBattleUnit
	adds r0, r4, #0
	bl SetBattleUnitTerrainBonusesAuto
	adds r0, r4, #0
	bl ComputeBattleUnitBaseDefense
	adds r0, r4, #0
	movs r1, #0
	bl ComputeBattleUnitSupportBonuses
	adds r0, r4, #0
	adds r0, #0x5a
	movs r2, #0
	movs r1, #0xff
	strh r1, [r0]
	adds r0, #0xa
	strh r1, [r0]
	adds r0, #6
	strh r1, [r0]
	subs r0, #0x20
	strh r2, [r0]
	adds r0, r4, #0
	bl BattleUnitTargetSetEquippedWeapon
	ldr r0, _0802A5B0 @ =0x0203A3F0
	adds r0, #0x7e
	movs r1, #1
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A5AC: .4byte 0x0203A470
_0802A5B0: .4byte 0x0203A3F0
