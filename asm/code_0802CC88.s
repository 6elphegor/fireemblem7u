	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802CC88
sub_0802CC88: @ 0x0802CC88
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	adds r6, r0, #0
	ldr r4, _0802CD14 @ =0x0203A3F0
	ldr r5, _0802CD18 @ =0x0203A470
	adds r0, r5, #0
	adds r0, #0x4a
	movs r2, #0
	mov sb, r2
	movs r2, #0
	mov r8, r2
	strh r1, [r0]
	ldr r2, _0802CD1C @ =0x0000FFFF
	adds r0, r2, #0
	adds r2, r1, #0
	ands r2, r0
	adds r0, r4, #0
	adds r0, #0x4a
	strh r2, [r0]
	adds r0, r5, #0
	adds r0, #0x48
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x48
	strh r2, [r0]
	adds r0, r5, #0
	adds r1, r6, #0
	bl InitBattleUnit
	adds r0, r6, #0
	bl UnitPromote
	adds r0, r4, #0
	adds r1, r6, #0
	bl InitBattleUnit
	adds r0, r4, #0
	adds r1, r5, #0
	bl GenerateBattleUnitStatGainsComparatively
	adds r0, r4, #0
	bl SetBattleUnitTerrainBonusesAuto
	adds r0, r5, #0
	bl SetBattleUnitTerrainBonusesAuto
	ldr r0, _0802CD20 @ =0x0203A4F0
	mov r1, r8
	strh r1, [r0]
	movs r1, #0x80
	strb r1, [r0, #2]
	mov r2, sb
	strb r2, [r0, #3]
	ldr r1, _0802CD24 @ =0x0203A3D8
	movs r0, #0x10
	strh r0, [r1]
	bl BeginBattleAnimations
	ldr r0, [r6, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r6, #0xc]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802CD14: .4byte 0x0203A3F0
_0802CD18: .4byte 0x0203A470
_0802CD1C: .4byte 0x0000FFFF
_0802CD20: .4byte 0x0203A4F0
_0802CD24: .4byte 0x0203A3D8
