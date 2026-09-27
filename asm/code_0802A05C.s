	.include "macro.inc"

	.syntax unified

	thumb_func_start BattleApplyMiscActionExpGains
BattleApplyMiscActionExpGains: @ 0x0802A05C
	push {r4, lr}
	ldr r4, _0802A09C @ =0x0203A3F0
	movs r0, #0xc0
	ldrb r1, [r4, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _0802A096
	adds r0, r4, #0
	bl CanBattleUnitGainLevels
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802A096
	ldr r1, _0802A0A0 @ =0x0202BBF8
	movs r0, #0x80
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _0802A096
	adds r1, r4, #0
	adds r1, #0x6e
	movs r0, #0xa
	strb r0, [r1]
	ldrb r0, [r4, #9]
	adds r0, #0xa
	strb r0, [r4, #9]
	adds r0, r4, #0
	bl CheckBattleUnitLevelUp
_0802A096:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A09C: .4byte 0x0203A3F0
_0802A0A0: .4byte 0x0202BBF8
