	.include "macro.inc"

	.syntax unified

	thumb_func_start BattleApplyExpGains
BattleApplyExpGains: @ 0x0802956C
	push {r4, r5, r6, lr}
	ldr r5, _080295D4 @ =0x0203A3F0
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _0802958A
	ldr r0, _080295D8 @ =0x0203A470
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ands r0, r1
	cmp r0, #0
	beq _080295CE
_0802958A:
	ldr r1, _080295DC @ =0x0202BBF8
	movs r0, #0x80
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _080295CE
	ldr r4, _080295D8 @ =0x0203A470
	adds r0, r5, #0
	adds r1, r4, #0
	bl GetBattleUnitExpGain
	adds r6, r5, #0
	adds r6, #0x6e
	strb r0, [r6]
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetBattleUnitExpGain
	adds r1, r4, #0
	adds r1, #0x6e
	strb r0, [r1]
	ldrb r2, [r5, #9]
	ldrb r6, [r6]
	adds r1, r2, r6
	strb r1, [r5, #9]
	ldrb r1, [r4, #9]
	adds r0, r1, r0
	strb r0, [r4, #9]
	adds r0, r5, #0
	bl CheckBattleUnitLevelUp
	adds r0, r4, #0
	bl CheckBattleUnitLevelUp
_080295CE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080295D4: .4byte 0x0203A3F0
_080295D8: .4byte 0x0203A470
_080295DC: .4byte 0x0202BBF8
