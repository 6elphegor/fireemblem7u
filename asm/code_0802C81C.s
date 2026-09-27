	.include "macro.inc"

	.syntax unified

	thumb_func_start DoItemFortifyStaffAction
DoItemFortifyStaffAction: @ 0x0802C81C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r4, _0802C890 @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xc]
	bl GetUnit
	bl MakeTargetListForRangedHeal
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r4, [r4, #0x12]
	lsls r1, r4, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl GetUnitItemHealAmount
	adds r6, r0, #0
	bl CountTargets
	adds r5, r0, #0
	movs r4, #0
	cmp r4, r5
	bge _0802C880
_0802C864:
	adds r0, r4, #0
	bl GetTarget
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetUnit
	adds r1, r6, #0
	bl AddUnitHp
	adds r4, #1
	cmp r4, r5
	blt _0802C864
_0802C880:
	adds r0, r7, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802C890: .4byte 0x0203A85C
