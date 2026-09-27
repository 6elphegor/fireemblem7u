	.include "macro.inc"

	.syntax unified

	thumb_func_start ArenaContinueBattle
ArenaContinueBattle: @ 0x0802F0F8
	push {r4, r5, lr}
	ldr r0, _0802F144 @ =0x0202BBB8
	adds r0, #0x3c
	ldrb r5, [r0]
	ldr r1, _0802F148 @ =0x0203A85C
	ldr r4, _0802F14C @ =0x0203A470
	ldrb r0, [r4, #0x13]
	strb r0, [r1, #0x15]
	movs r0, #4
	strb r0, [r1, #0x16]
	movs r0, #3
	bl WriteSuspendSave
	bl BattleUnwind
	movs r0, #0x13
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0802F122
	bl BattleApplyExpGains
_0802F122:
	ldr r0, _0802F150 @ =0x0203A7F4
	ldr r0, [r0]
	ldr r1, _0802F154 @ =0x0203A3F0
	bl UpdateUnitDuringBattle
	cmp r5, #0
	beq _0802F138
	movs r0, #0x13
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0802F13C
_0802F138:
	bl PidStatsRecordBattleRes
_0802F13C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802F144: .4byte 0x0202BBB8
_0802F148: .4byte 0x0203A85C
_0802F14C: .4byte 0x0203A470
_0802F150: .4byte 0x0203A7F4
_0802F154: .4byte 0x0203A3F0
