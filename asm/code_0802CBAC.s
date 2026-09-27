	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802CBAC
sub_0802CBAC: @ 0x0802CBAC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r7, r1, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	movs r0, #1
	rsbs r0, r0, #0
	mov sb, r0
	cmp r7, sb
	beq _0802CBDE
	ldr r3, _0802CC58 @ =0x0203A3F0
	ldr r1, _0802CC5C @ =0x0203A470
	lsls r2, r7, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r1, #0x4a
	strh r0, [r1]
	adds r3, #0x4a
	strh r0, [r3]
_0802CBDE:
	adds r0, r6, #0
	bl GetUnitEquippedWeapon
	ldr r4, _0802CC58 @ =0x0203A3F0
	ldr r5, _0802CC5C @ =0x0203A470
	adds r1, r5, #0
	adds r1, #0x48
	strh r0, [r1]
	adds r1, r4, #0
	adds r1, #0x48
	strh r0, [r1]
	adds r0, r5, #0
	adds r1, r6, #0
	bl InitBattleUnitWithoutBonuses
	adds r0, r6, #0
	bl UnitPromote
	adds r0, r4, #0
	adds r1, r6, #0
	bl InitBattleUnitWithoutBonuses
	adds r0, r4, #0
	adds r1, r5, #0
	bl GenerateBattleUnitStatGainsComparatively
	adds r0, r4, #0
	bl SetBattleUnitTerrainBonusesAuto
	adds r0, r5, #0
	bl SetBattleUnitTerrainBonusesAuto
	mov r0, r8
	cmp r0, #0
	beq _0802CC2C
	ldr r0, [r6, #0xc]
	movs r1, #0x40
	orrs r0, r1
	str r0, [r6, #0xc]
_0802CC2C:
	cmp r7, sb
	beq _0802CC38
	adds r0, r6, #0
	adds r1, r7, #0
	bl UnitUpdateUsedItem
_0802CC38:
	ldr r1, _0802CC60 @ =0x0203A4F0
	movs r0, #0
	strh r0, [r1]
	movs r0, #0x80
	strb r0, [r1, #2]
	movs r0, #0
	strb r0, [r1, #3]
	ldr r1, _0802CC64 @ =0x0203A3D8
	movs r0, #0x10
	strh r0, [r1]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802CC58: .4byte 0x0203A3F0
_0802CC5C: .4byte 0x0203A470
_0802CC60: .4byte 0x0203A4F0
_0802CC64: .4byte 0x0203A3D8
