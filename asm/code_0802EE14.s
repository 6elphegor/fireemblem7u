	.include "macro.inc"

	.syntax unified

	thumb_func_start ArenaAdjustOpponentDamage
ArenaAdjustOpponentDamage: @ 0x0802EE14
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r4, _0802EE3C @ =0x0203A7F4
	ldr r0, [r4]
	bl GetUnitPower
	ldr r5, _0802EE40 @ =0x0203A3F0
	adds r0, #5
	adds r1, r5, #0
	adds r1, #0x5a
	strh r0, [r1]
	movs r0, #0x14
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _0802EE44
	ldr r0, [r4]
	bl GetUnitResistance
	b _0802EE4A
	.align 2, 0
_0802EE3C: .4byte 0x0203A7F4
_0802EE40: .4byte 0x0203A3F0
_0802EE44:
	ldr r0, [r4]
	bl GetUnitDefense
_0802EE4A:
	adds r1, r5, #0
	adds r1, #0x5c
	strh r0, [r1]
	ldr r4, _0802EE74 @ =0x0203A7F4
	ldr r0, [r4, #4]
	bl GetUnitPower
	ldr r5, _0802EE78 @ =0x0203A470
	adds r0, #5
	adds r1, r5, #0
	adds r1, #0x5a
	strh r0, [r1]
	movs r0, #0x13
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _0802EE7C
	ldr r0, [r4, #4]
	bl GetUnitResistance
	b _0802EE82
	.align 2, 0
_0802EE74: .4byte 0x0203A7F4
_0802EE78: .4byte 0x0203A470
_0802EE7C:
	ldr r0, [r4, #4]
	bl GetUnitDefense
_0802EE82:
	adds r1, r5, #0
	adds r1, #0x5c
	strh r0, [r1]
	ldr r0, _0802EED0 @ =0x0203A3F0
	adds r0, #0x5a
	movs r1, #0
	ldrsh r4, [r0, r1]
	ldr r0, _0802EED4 @ =0x0203A470
	adds r0, #0x5c
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r4, r0
	ldr r5, _0802EED8 @ =0x0203A7F4
	ldr r0, [r5, #4]
	bl GetUnitMaxHp
	movs r1, #6
	bl __divsi3
	cmp r4, r0
	bge _0802EF02
	movs r6, #1
	movs r2, #0x13
	ldrsb r2, [r5, r2]
	cmp r2, #0
	beq _0802EEDC
	ldr r0, [r5, #4]
	ldrb r1, [r0, #0x18]
	subs r1, #4
	strb r1, [r0, #0x18]
	ldr r1, [r5, #4]
	movs r0, #0x18
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0802EEF0
	movs r0, #0
	strb r0, [r1, #0x18]
	b _0802EEF0
	.align 2, 0
_0802EED0: .4byte 0x0203A3F0
_0802EED4: .4byte 0x0203A470
_0802EED8: .4byte 0x0203A7F4
_0802EEDC:
	ldr r0, [r5, #4]
	ldrb r1, [r0, #0x17]
	subs r1, #4
	strb r1, [r0, #0x17]
	ldr r1, [r5, #4]
	movs r0, #0x17
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0802EEF0
	strb r2, [r1, #0x17]
_0802EEF0:
	ldr r2, _0802EF50 @ =0x0203A7F4
	ldr r1, [r2, #4]
	ldrb r0, [r1, #0x16]
	adds r0, #1
	strb r0, [r1, #0x16]
	ldr r1, [r2, #4]
	ldrb r0, [r1, #0x15]
	adds r0, #1
	strb r0, [r1, #0x15]
_0802EF02:
	ldr r0, _0802EF54 @ =0x0203A470
	adds r0, #0x5a
	movs r1, #0
	ldrsh r4, [r0, r1]
	ldr r0, _0802EF58 @ =0x0203A3F0
	adds r0, #0x5c
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r4, r0
	ldr r5, _0802EF50 @ =0x0203A7F4
	ldr r0, [r5]
	bl GetUnitMaxHp
	movs r1, #6
	bl __divsi3
	cmp r4, r0
	bge _0802EF48
	movs r6, #1
	ldr r1, [r5, #4]
	ldrb r0, [r1, #0x14]
	adds r0, #3
	strb r0, [r1, #0x14]
	ldr r1, [r5, #4]
	ldrb r0, [r1, #0x16]
	adds r0, #2
	strb r0, [r1, #0x16]
	ldr r1, [r5, #4]
	ldrb r0, [r1, #0x15]
	adds r0, #2
	strb r0, [r1, #0x15]
	ldrh r0, [r5, #0x1c]
	bl ArenaGetUpgradedWeapon
	strh r0, [r5, #0x1c]
_0802EF48:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0802EF50: .4byte 0x0203A7F4
_0802EF54: .4byte 0x0203A470
_0802EF58: .4byte 0x0203A3F0
