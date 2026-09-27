	.include "macro.inc"

	.syntax unified

	thumb_func_start DoItemHealStaffAction
DoItemHealStaffAction: @ 0x0802C324
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0802C3A0 @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl BattleInitItemEffectTarget
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r2, [r4, #0x12]
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl GetUnitItemHealAmount
	adds r5, r0, #0
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r1, r5, #0
	bl AddUnitHp
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl GetUnitCurrentHp
	ldr r1, _0802C3A4 @ =0x0203A50C
	ldr r1, [r1]
	ldr r5, _0802C3A8 @ =0x0203A470
	ldrb r2, [r5, #0x13]
	subs r0, r2, r0
	strb r0, [r1, #3]
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl GetUnitCurrentHp
	strb r0, [r5, #0x13]
	adds r0, r6, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802C3A0: .4byte 0x0203A85C
_0802C3A4: .4byte 0x0203A50C
_0802C3A8: .4byte 0x0203A470
