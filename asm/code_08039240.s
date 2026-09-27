	.include "macro.inc"

	.syntax unified

	thumb_func_start AiComputeCombatScore
AiComputeCombatScore: @ 0x08039240
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r2, _0803929C @ =0x030013C0
	ldr r1, _080392A0 @ =0x0203A8EC
	adds r1, #0x7d
	ldrb r3, [r1]
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #2
	ldr r1, _080392A4 @ =0x081D36F4
	adds r0, r0, r1
	str r0, [r2]
	bl AiGetDamageDealtCombatScoreComponent
	adds r4, r0, #0
	adds r5, r4, #0
	bl AiGetOpponentLowHpScoreComponent
	adds r4, r4, r0
	bl AiGetFriendZoneCombatScoreComponent
	adds r4, r4, r0
	bl AiGetTargetClassCombatScoreComponent
	adds r4, r4, r0
	bl AiGetTurnCombatScoreComponent
	adds r4, r4, r0
	bl AiGetDamageTakenScoreComponent
	subs r4, r4, r0
	bl AiGetDangerScoreComponent
	subs r4, r4, r0
	bl AiGetLowHpScoreComponent
	subs r4, r4, r0
	cmp r4, #0
	bge _08039290
	movs r4, #0
_08039290:
	cmp r4, #0
	beq _080392A8
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r4, r0, #3
	b _080392AA
	.align 2, 0
_0803929C: .4byte 0x030013C0
_080392A0: .4byte 0x0203A8EC
_080392A4: .4byte 0x081D36F4
_080392A8:
	adds r4, r5, #0
_080392AA:
	str r4, [r6, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
