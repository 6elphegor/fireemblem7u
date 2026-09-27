	.include "macro.inc"

	.syntax unified

	thumb_func_start BattleInitItemEffect
BattleInitItemEffect: @ 0x0802A4B4
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	adds r7, r1, #0
	lsls r1, r7, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r6, [r0]
	cmp r7, #0
	bge _0802A4C8
	movs r6, #0
_0802A4C8:
	ldr r1, _0802A554 @ =0x0203A3D8
	movs r4, #0
	movs r0, #0
	strh r0, [r1]
	ldr r5, _0802A558 @ =0x0203A3F0
	adds r0, r5, #0
	adds r1, r2, #0
	bl InitBattleUnit
	adds r0, r5, #0
	bl SetBattleUnitTerrainBonusesAuto
	adds r0, r5, #0
	bl ComputeBattleUnitBaseDefense
	adds r0, r5, #0
	movs r1, #0
	bl ComputeBattleUnitSupportBonuses
	adds r0, r5, #0
	adds r0, #0x5a
	movs r2, #0xff
	strh r2, [r0]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0x64
	strh r0, [r1]
	adds r0, r5, #0
	adds r0, #0x6a
	strh r2, [r0]
	subs r0, #0x22
	strh r6, [r0]
	adds r0, #2
	strh r6, [r0]
	adds r0, #7
	strb r7, [r0]
	adds r0, r6, #0
	bl GetItemType
	adds r1, r5, #0
	adds r1, #0x50
	strb r0, [r1]
	adds r0, r6, #0
	bl GetItemAttributes
	str r0, [r5, #0x4c]
	adds r1, r5, #0
	adds r1, #0x52
	movs r0, #1
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x7e
	strb r4, [r0]
	adds r2, r5, #0
	adds r2, #0x6f
	movs r1, #0xff
	ldrb r0, [r2]
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0802A55C @ =0x0203A470
	adds r0, #0x6f
	ldrb r2, [r0]
	orrs r1, r2
	strb r1, [r0]
	bl ClearBattleHits
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802A554: .4byte 0x0203A3D8
_0802A558: .4byte 0x0203A3F0
_0802A55C: .4byte 0x0203A470
