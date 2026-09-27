	.include "macro.inc"

	.syntax unified

	thumb_func_start BattleApplyUnitUpdates
BattleApplyUnitUpdates: @ 0x08029A70
	push {r4, r5, r6, r7, lr}
	ldr r5, _08029AE4 @ =0x0203A3F0
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	bl GetUnit
	adds r7, r0, #0
	ldr r4, _08029AE8 @ =0x0203A470
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r6, r0, #0
	adds r0, r5, #0
	adds r0, #0x52
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08029AAC
	adds r0, r5, #0
	adds r0, #0x51
	ldrb r0, [r0]
	lsls r1, r0, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r1, r1, r0
	adds r0, #0x2a
	ldrh r0, [r0]
	strh r0, [r1]
_08029AAC:
	adds r0, r4, #0
	adds r0, #0x52
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08029ACE
	adds r0, r4, #0
	adds r0, #0x51
	ldrb r0, [r0]
	lsls r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r1, r1, r0
	adds r0, #0x2a
	ldrh r0, [r0]
	strh r0, [r1]
_08029ACE:
	adds r0, r7, #0
	adds r1, r5, #0
	bl UpdateUnitFromBattle
	cmp r6, #0
	beq _08029AEC
	adds r0, r6, #0
	adds r1, r4, #0
	bl UpdateUnitFromBattle
	b _08029AF2
	.align 2, 0
_08029AE4: .4byte 0x0203A3F0
_08029AE8: .4byte 0x0203A470
_08029AEC:
	adds r0, r4, #0
	bl UpdateObstacleFromBattle
_08029AF2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
