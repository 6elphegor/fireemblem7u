	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080959B0
sub_080959B0: @ 0x080959B0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r4, [r7, #0x14]
	movs r0, #0xe0
	lsls r0, r0, #1
	movs r1, #3
	movs r2, #0
	adds r3, r7, #0
	bl StartManimLevelUpStatGainLabels
	ldr r0, [r4, #0x2c]
	bl GetUnitCurrentHp
	adds r1, r7, #0
	adds r1, #0x30
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitPower
	adds r1, r7, #0
	adds r1, #0x31
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitSkill
	adds r1, r7, #0
	adds r1, #0x32
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitSpeed
	adds r1, r7, #0
	adds r1, #0x33
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitLuck
	adds r1, r7, #0
	adds r1, #0x34
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitDefense
	adds r1, r7, #0
	adds r1, #0x35
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitResistance
	adds r1, r7, #0
	adds r1, #0x36
	strb r0, [r1]
	ldr r1, [r4, #0x2c]
	ldr r2, [r1, #4]
	ldr r0, [r1]
	ldrb r2, [r2, #0x11]
	ldrb r0, [r0, #0x13]
	adds r0, r2, r0
	ldrb r1, [r1, #0x1a]
	adds r0, r1, r0
	adds r1, r7, #0
	adds r1, #0x37
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	lsls r3, r1, #1
	adds r2, r0, #0
	adds r2, #0x1e
	adds r2, r2, r3
	ldrh r5, [r2]
	bl ApplyItemStatBoost
	adds r6, r0, #0
	ldr r0, [r4, #0x2c]
	movs r1, #0
	bl DrawPrepScreenItemUseStatBars
	ldr r0, [r4, #0x2c]
	bl sub_08094D74
	ldr r0, [r4, #0x2c]
	bl GetUnitCurrentHp
	adds r1, r7, #0
	adds r1, #0x38
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitPower
	adds r1, r7, #0
	adds r1, #0x39
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitSkill
	adds r1, r7, #0
	adds r1, #0x3a
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitSpeed
	adds r1, r7, #0
	adds r1, #0x3b
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitLuck
	adds r1, r7, #0
	adds r1, #0x3c
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitDefense
	adds r1, r7, #0
	adds r1, #0x3d
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitResistance
	adds r1, r7, #0
	adds r1, #0x3e
	strb r0, [r1]
	ldr r1, [r4, #0x2c]
	ldr r2, [r1, #4]
	ldr r0, [r1]
	ldrb r2, [r2, #0x11]
	ldrb r0, [r0, #0x13]
	adds r0, r2, r0
	ldrb r1, [r1, #0x1a]
	adds r0, r1, r0
	adds r1, r7, #0
	adds r1, #0x3f
	strb r0, [r1]
	str r5, [sp]
	adds r0, r7, #0
	movs r1, #0xf
	movs r2, #0xe
	adds r3, r6, #0
	bl sub_080958C8
	movs r4, #0
_08095ACC:
	adds r0, r7, #0
	adds r0, #0x30
	adds r3, r0, r4
	adds r0, #8
	adds r2, r0, r4
	ldrb r0, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _08095AFA
	asrs r1, r4, #2
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0xb8
	movs r1, #3
	ands r1, r4
	lsls r1, r1, #4
	adds r1, #0x32
	ldrb r2, [r2]
	ldrb r3, [r3]
	subs r2, r2, r3
	bl StartPrepItemBoostStatGainLabelAnim
_08095AFA:
	adds r4, #1
	cmp r4, #7
	ble _08095ACC
	movs r0, #0x78
	str r0, [r7, #0x2c]
	ldr r0, _08095B20 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08095B16
	ldr r0, _08095B24 @ =0x0000037A
	bl m4aSongNumStart
_08095B16:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08095B20: .4byte 0x0202BBF8
_08095B24: .4byte 0x0000037A
