	.include "macro.inc"

	.syntax unified

	thumb_func_start InitBattleUnit
InitBattleUnit: @ 0x080285D4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	cmp r6, #0
	beq _080286AA
	movs r2, #0x48
	bl memcpy
	adds r0, r6, #0
	bl GetUnitMaxHp
	movs r4, #0
	strb r0, [r5, #0x12]
	adds r0, r6, #0
	bl GetUnitPower
	strb r0, [r5, #0x14]
	adds r0, r6, #0
	bl GetUnitSkill
	strb r0, [r5, #0x15]
	adds r0, r6, #0
	bl GetUnitSpeed
	strb r0, [r5, #0x16]
	adds r0, r6, #0
	bl GetUnitDefense
	strb r0, [r5, #0x17]
	adds r0, r6, #0
	bl GetUnitLuck
	strb r0, [r5, #0x19]
	adds r0, r6, #0
	bl GetUnitResistance
	strb r0, [r5, #0x18]
	ldr r1, [r6, #4]
	ldr r0, [r6]
	ldrb r2, [r1, #0x11]
	ldrb r0, [r0, #0x13]
	adds r0, r2, r0
	ldrb r2, [r6, #0x1a]
	adds r0, r2, r0
	strb r0, [r5, #0x1a]
	ldrb r6, [r6, #0x1d]
	ldrb r1, [r1, #0x12]
	adds r0, r6, r1
	strb r0, [r5, #0x1d]
	ldrb r1, [r5, #8]
	adds r0, r5, #0
	adds r0, #0x70
	strb r1, [r0]
	ldrb r0, [r5, #9]
	adds r1, r5, #0
	adds r1, #0x71
	strb r0, [r1]
	ldrb r0, [r5, #0x13]
	adds r1, #1
	strb r0, [r1]
	subs r1, #3
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x73
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r2, _080286B0 @ =0x0203A3F0
	adds r0, r2, #0
	adds r0, #0x7b
	strb r4, [r0]
	ldr r1, _080286B4 @ =0x0203A470
	adds r0, r1, #0
	adds r0, #0x7b
	strb r4, [r0]
	adds r0, r5, #0
	adds r0, #0x53
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #0x28
	strb r4, [r0]
	adds r0, r2, #0
	adds r0, #0x7d
	strb r4, [r0]
	adds r0, r1, #0
	adds r0, #0x7d
	strb r4, [r0]
	adds r0, r2, #0
	adds r0, #0x6e
	strb r4, [r0]
	adds r0, r1, #0
	adds r0, #0x6e
	strb r4, [r0]
_080286AA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080286B0: .4byte 0x0203A3F0
_080286B4: .4byte 0x0203A470
