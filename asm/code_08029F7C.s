	.include "macro.inc"

	.syntax unified

	thumb_func_start BattleApplyItemExpGains
BattleApplyItemExpGains: @ 0x08029F7C
	push {r4, lr}
	ldr r1, _08029FC4 @ =0x0202BBF8
	movs r0, #0x80
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _08029FF2
	ldr r4, _08029FC8 @ =0x0203A3F0
	ldr r0, [r4, #0x4c]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08029FCC
	movs r0, #0xc0
	ldrb r1, [r4, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _08029FAA
	adds r1, r4, #0
	adds r1, #0x7b
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08029FAA:
	adds r0, r4, #0
	bl GetBattleUnitStaffExp
	adds r1, r4, #0
	adds r1, #0x6e
	strb r0, [r1]
	ldrb r1, [r4, #9]
	adds r0, r1, r0
	strb r0, [r4, #9]
	adds r0, r4, #0
	bl CheckBattleUnitLevelUp
	b _08029FF2
	.align 2, 0
_08029FC4: .4byte 0x0202BBF8
_08029FC8: .4byte 0x0203A3F0
_08029FCC:
	adds r0, r4, #0
	adds r0, #0x50
	ldrb r0, [r0]
	cmp r0, #0xc
	bne _08029FF2
	ldrb r1, [r4, #9]
	adds r0, r1, #0
	cmp r0, #0xff
	beq _08029FF2
	adds r2, r4, #0
	adds r2, #0x6e
	movs r0, #0x14
	strb r0, [r2]
	adds r0, r1, #0
	adds r0, #0x14
	strb r0, [r4, #9]
	adds r0, r4, #0
	bl CheckBattleUnitLevelUp
_08029FF2:
	pop {r4}
	pop {r0}
	bx r0
