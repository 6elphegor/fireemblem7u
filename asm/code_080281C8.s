	.include "macro.inc"

	.syntax unified

	thumb_func_start BattleGenerateSimulationInternal
BattleGenerateSimulationInternal: @ 0x080281C8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	mov sb, r1
	adds r4, r2, #0
	adds r5, r3, #0
	ldr r6, _08028214 @ =0x0203A3F0
	adds r0, r6, #0
	mov r1, r8
	bl InitBattleUnit
	ldr r7, _08028218 @ =0x0203A470
	adds r0, r7, #0
	mov r1, sb
	bl InitBattleUnit
	strb r4, [r6, #0x10]
	strb r5, [r6, #0x11]
	ldr r4, _0802821C @ =0x0203A3D8
	movs r2, #0x10
	ldrsb r2, [r6, r2]
	movs r0, #0x10
	ldrsb r0, [r7, r0]
	subs r1, r2, r0
	cmp r1, #0
	bge _08028202
	subs r1, r0, r2
_08028202:
	movs r3, #0x11
	ldrsb r3, [r6, r3]
	movs r0, #0x11
	ldrsb r0, [r7, r0]
	subs r2, r3, r0
	cmp r2, #0
	blt _08028220
	adds r0, r1, r2
	b _08028224
	.align 2, 0
_08028214: .4byte 0x0203A3F0
_08028218: .4byte 0x0203A470
_0802821C: .4byte 0x0203A3D8
_08028220:
	subs r0, r0, r3
	adds r0, r1, r0
_08028224:
	strb r0, [r4, #2]
	ldr r1, _0802823C @ =0x0203A3D8
	movs r0, #8
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08028244
	ldr r0, _08028240 @ =0x0203A3F0
	bl SetBattleUnitWeaponBallista
	b _0802824C
	.align 2, 0
_0802823C: .4byte 0x0203A3D8
_08028240: .4byte 0x0203A3F0
_08028244:
	ldr r0, _08028290 @ =0x0203A3F0
	ldr r1, [sp, #0x1c]
	bl SetBattleUnitWeapon
_0802824C:
	ldr r4, _08028294 @ =0x0203A470
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r4, #0
	bl SetBattleUnitWeapon
	bl BattleInitTargetCanCounter
	ldr r5, _08028290 @ =0x0203A3F0
	adds r0, r5, #0
	adds r1, r4, #0
	bl BattleApplyWeaponTriangleEffect
	bl DisableAllLightRunes
	adds r0, r5, #0
	bl SetBattleUnitTerrainBonusesAuto
	adds r0, r4, #0
	bl SetBattleUnitTerrainBonusesAuto
	mov r0, r8
	mov r1, sb
	bl BattleGenerate
	bl EnableAllLightRunes
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08028290: .4byte 0x0203A3F0
_08028294: .4byte 0x0203A470
