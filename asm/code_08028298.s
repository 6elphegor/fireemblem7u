	.include "macro.inc"

	.syntax unified

	thumb_func_start BattleGenerateRealInternal
BattleGenerateRealInternal: @ 0x08028298
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r5, _080282D8 @ =0x0203A3F0
	adds r0, r5, #0
	adds r1, r6, #0
	bl InitBattleUnit
	ldr r4, _080282DC @ =0x0203A470
	adds r0, r4, #0
	adds r1, r7, #0
	bl InitBattleUnit
	ldr r0, _080282E0 @ =0x0203A3D8
	mov ip, r0
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	subs r1, r2, r0
	cmp r1, #0
	bge _080282C6
	subs r1, r0, r2
_080282C6:
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	subs r2, r3, r0
	cmp r2, #0
	blt _080282E4
	adds r0, r1, r2
	b _080282E8
	.align 2, 0
_080282D8: .4byte 0x0203A3F0
_080282DC: .4byte 0x0203A470
_080282E0: .4byte 0x0203A3D8
_080282E4:
	subs r0, r0, r3
	adds r0, r1, r0
_080282E8:
	mov r1, ip
	strb r0, [r1, #2]
	ldr r1, _08028300 @ =0x0203A3D8
	movs r0, #8
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08028308
	ldr r0, _08028304 @ =0x0203A3F0
	bl SetBattleUnitWeaponBallista
	b _08028312
	.align 2, 0
_08028300: .4byte 0x0203A3D8
_08028304: .4byte 0x0203A3F0
_08028308:
	ldr r0, _08028378 @ =0x0203A3F0
	movs r1, #1
	rsbs r1, r1, #0
	bl SetBattleUnitWeapon
_08028312:
	ldr r4, _0802837C @ =0x0203A470
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r4, #0
	bl SetBattleUnitWeapon
	bl BattleInitTargetCanCounter
	ldr r5, _08028378 @ =0x0203A3F0
	adds r0, r5, #0
	adds r1, r4, #0
	bl BattleApplyWeaponTriangleEffect
	bl DisableAllLightRunes
	adds r0, r5, #0
	bl SetBattleUnitTerrainBonusesAuto
	adds r0, r4, #0
	bl SetBattleUnitTerrainBonusesAuto
	adds r0, r6, #0
	adds r1, r7, #0
	bl BattleGenerate
	bl EnableAllLightRunes
	adds r0, r4, #0
	bl BattleUnitTargetCheckCanCounter
	adds r0, r4, #0
	bl BattleUnitTargetSetEquippedWeapon
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _08028370
	bl BattleApplyExpGains
	bl PidStatsRecordBattleRes
	adds r0, r6, #0
	bl PidStatsAddBattleAmt
	adds r0, r7, #0
	bl PidStatsAddBattleAmt
_08028370:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08028378: .4byte 0x0203A3F0
_0802837C: .4byte 0x0203A470
