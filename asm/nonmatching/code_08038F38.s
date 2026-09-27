	.include "macro.inc"

	.syntax unified

	thumb_func_start AiGetCombatPositionScore
AiGetCombatPositionScore: @ 0x08038F38
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldrb r0, [r2, #2]
	bl GetUnit
	adds r2, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl AiGetInRangeCombatPositionScoreComponent
	adds r4, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl AiGetTerrainCombatPositionScoreComponent
	adds r4, r4, r0
	adds r0, r6, #0
	adds r1, r5, #0
	bl AiGetFriendZoneCombatPositionScoreComponent
	adds r4, r4, r0
	ldr r0, _08038F94 @ =0x0202E3E4
	ldr r0, [r0]
	lsls r5, r5, #2
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r4, r4, r0
	ldr r0, _08038F98 @ =0x0202E3F4
	ldr r0, [r0]
	adds r5, r5, r0
	ldr r0, [r5]
	adds r0, r0, r6
	ldrb r0, [r0]
	lsrs r0, r0, #3
	subs r4, r4, r0
	ldr r0, _08038F9C @ =0x7FFFFFFF
	adds r4, r4, r0
	adds r0, r4, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08038F94: .4byte 0x0202E3E4
_08038F98: .4byte 0x0202E3F4
_08038F9C: .4byte 0x7FFFFFFF
