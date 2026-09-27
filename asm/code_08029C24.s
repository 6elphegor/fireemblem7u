	.include "macro.inc"

	.syntax unified

	thumb_func_start UpdateUnitFromBattle
UpdateUnitFromBattle: @ 0x08029C24
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r5, #8]
	strb r0, [r4, #8]
	ldrb r0, [r5, #9]
	strb r0, [r4, #9]
	ldrb r0, [r5, #0x13]
	strb r0, [r4, #0x13]
	ldr r0, [r5, #0xc]
	str r0, [r4, #0xc]
	ldr r2, _08029D08 @ =0x03002850
	lsrs r0, r0, #0x11
	movs r1, #7
	ands r0, r1
	strb r0, [r2]
	adds r1, r5, #0
	adds r1, #0x6f
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _08029C58
	adds r1, r0, #0
	adds r0, r4, #0
	bl SetUnitStatus
_08029C58:
	adds r0, r5, #0
	adds r0, #0x73
	ldrb r1, [r4, #0x12]
	ldrb r0, [r0]
	adds r0, r1, r0
	strb r0, [r4, #0x12]
	adds r0, r5, #0
	adds r0, #0x74
	ldrb r1, [r4, #0x14]
	ldrb r0, [r0]
	adds r0, r1, r0
	strb r0, [r4, #0x14]
	adds r0, r5, #0
	adds r0, #0x75
	ldrb r1, [r4, #0x15]
	ldrb r0, [r0]
	adds r0, r1, r0
	strb r0, [r4, #0x15]
	adds r0, r5, #0
	adds r0, #0x76
	ldrb r1, [r4, #0x16]
	ldrb r0, [r0]
	adds r0, r1, r0
	strb r0, [r4, #0x16]
	adds r0, r5, #0
	adds r0, #0x77
	ldrb r1, [r4, #0x17]
	ldrb r0, [r0]
	adds r0, r1, r0
	strb r0, [r4, #0x17]
	adds r0, r5, #0
	adds r0, #0x78
	ldrb r1, [r4, #0x18]
	ldrb r0, [r0]
	adds r0, r1, r0
	strb r0, [r4, #0x18]
	adds r0, r5, #0
	adds r0, #0x79
	ldrb r1, [r4, #0x19]
	ldrb r0, [r0]
	adds r0, r1, r0
	strb r0, [r4, #0x19]
	adds r0, r4, #0
	bl UnitCheckStatCaps
	adds r0, r5, #0
	bl GetBattleUnitUpdatedWeaponExp
	adds r2, r0, #0
	cmp r2, #0
	ble _08029CCC
	adds r1, r5, #0
	adds r1, #0x50
	adds r0, r4, #0
	adds r0, #0x28
	ldrb r1, [r1]
	adds r0, r1, r0
	strb r2, [r0]
_08029CCC:
	adds r6, r5, #0
	adds r6, #0x6e
	adds r1, r5, #0
	adds r1, #0x1e
	adds r3, r4, #0
	adds r3, #0x1e
	movs r2, #4
_08029CDA:
	ldrh r0, [r1]
	strh r0, [r3]
	adds r1, #2
	adds r3, #2
	subs r2, #1
	cmp r2, #0
	bge _08029CDA
	adds r0, r4, #0
	bl UnitRemoveInvalidItems
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #0
	beq _08029D02
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	movs r1, #0
	ldrsb r1, [r6, r1]
	bl PidStatsAddExpGained
_08029D02:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08029D08: .4byte 0x03002850
