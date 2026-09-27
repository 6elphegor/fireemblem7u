	.include "macro.inc"

	.syntax unified

	thumb_func_start GetBattleUnitExpGain
GetBattleUnitExpGain: @ 0x08029F10
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	bl CanBattleUnitGainLevels
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08029F3C
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _08029F3C
	ldr r0, [r6]
	ldr r1, [r6, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r0, r1
	cmp r0, #0
	beq _08029F40
_08029F3C:
	movs r0, #0
	b _08029F74
_08029F40:
	adds r0, r5, #0
	adds r0, #0x7c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08029F52
	movs r0, #1
	b _08029F74
_08029F52:
	adds r0, r5, #0
	adds r1, r6, #0
	bl GetUnitRoundExp
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl GetUnitKillExpBonus
	adds r4, r4, r0
	cmp r4, #0x64
	ble _08029F6C
	movs r4, #0x64
_08029F6C:
	cmp r4, #0
	bge _08029F72
	movs r4, #0
_08029F72:
	adds r0, r4, #0
_08029F74:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
