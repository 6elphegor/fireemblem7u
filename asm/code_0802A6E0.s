	.include "macro.inc"

	.syntax unified

	thumb_func_start BattleGenerateArena
BattleGenerateArena: @ 0x0802A6E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _0802A7B0 @ =0x0203A7F4
	mov sb, r0
	ldr r1, [r0, #4]
	mov r8, r1
	ldr r0, _0802A7B4 @ =0x0202BBB8
	adds r0, #0x3c
	ldrb r0, [r0]
	str r0, [sp]
	ldr r7, _0802A7B8 @ =0x0203A3D8
	movs r0, #0x21
	strh r0, [r7]
	ldr r5, _0802A7BC @ =0x0203A3F0
	adds r0, r5, #0
	adds r1, r6, #0
	bl InitBattleUnit
	ldr r4, _0802A7C0 @ =0x0203A470
	adds r0, r4, #0
	mov r1, r8
	bl InitBattleUnit
	ldr r0, _0802A7C4 @ =0x0203A85C
	mov sl, r0
	ldrb r0, [r0, #0x15]
	cmp r0, #0
	beq _0802A72A
	strb r0, [r4, #0x13]
	adds r1, r4, #0
	adds r1, #0x72
	strb r0, [r1]
_0802A72A:
	mov r1, sb
	ldrb r0, [r1, #0xc]
	strb r0, [r7, #2]
	ldrb r1, [r5, #0x10]
	adds r0, r0, r1
	strb r0, [r4, #0x10]
	ldrb r0, [r5, #0x11]
	strb r0, [r4, #0x11]
	adds r0, r5, #0
	movs r1, #6
	bl SetBattleUnitWeapon
	adds r0, r4, #0
	movs r1, #7
	bl SetBattleUnitWeapon
	adds r0, r5, #0
	adds r1, r4, #0
	bl BattleApplyWeaponTriangleEffect
	movs r0, #4
	mov r1, sl
	strb r0, [r1, #0x16]
	movs r0, #3
	bl WriteSuspendSave
	adds r0, r5, #0
	bl SetBattleUnitTerrainBonusesAuto
	adds r0, r4, #0
	movs r1, #8
	bl SetBattleUnitTerrainBonuses
	adds r0, r6, #0
	mov r1, r8
	bl BattleGenerate
	movs r0, #0x13
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0802A780
	bl BattleApplyExpGains
_0802A780:
	adds r0, r6, #0
	adds r1, r5, #0
	bl UpdateUnitDuringBattle
	ldr r0, [sp]
	cmp r0, #0
	beq _0802A796
	movs r0, #0x13
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0802A7DE
_0802A796:
	bl PidStatsRecordBattleRes
	ldr r0, [r6, #0xc]
	ldr r2, _0802A7C8 @ =0xFFF1FFFF
	ands r2, r0
	lsrs r0, r0, #0x11
	movs r1, #7
	ands r0, r1
	adds r0, #1
	cmp r0, #7
	bhi _0802A7CC
	lsls r0, r0, #0x11
	b _0802A7D0
	.align 2, 0
_0802A7B0: .4byte 0x0203A7F4
_0802A7B4: .4byte 0x0202BBB8
_0802A7B8: .4byte 0x0203A3D8
_0802A7BC: .4byte 0x0203A3F0
_0802A7C0: .4byte 0x0203A470
_0802A7C4: .4byte 0x0203A85C
_0802A7C8: .4byte 0xFFF1FFFF
_0802A7CC:
	movs r0, #0xe0
	lsls r0, r0, #0xc
_0802A7D0:
	adds r1, r2, r0
	str r1, [r6, #0xc]
	ldr r0, _0802A7F8 @ =0x03002850
	lsrs r1, r1, #0x11
	movs r2, #7
	ands r1, r2
	strb r1, [r0]
_0802A7DE:
	ldr r0, _0802A7FC @ =0x0203A3F0
	ldr r1, _0802A800 @ =0x0203A470
	bl BattlePrintDebugUnitInfo
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802A7F8: .4byte 0x03002850
_0802A7FC: .4byte 0x0203A3F0
_0802A800: .4byte 0x0203A470
