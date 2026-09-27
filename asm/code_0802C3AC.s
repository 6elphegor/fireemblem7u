	.include "macro.inc"

	.syntax unified

	thumb_func_start DoItemRestoreStaffAction
DoItemRestoreStaffAction: @ 0x0802C3AC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802C3E4 @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl BattleInitItemEffectTarget
	ldrb r0, [r4, #0xd]
	bl GetUnit
	movs r1, #0
	bl SetUnitStatus
	adds r0, r5, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802C3E4: .4byte 0x0203A85C
