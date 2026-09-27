	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802C92C
sub_0802C92C: @ 0x0802C92C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r4, _0802C990 @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xc]
	bl GetUnit
	bl sub_080249FC
	bl CountTargets
	adds r6, r0, #0
	movs r5, #0
	cmp r5, r6
	bge _0802C980
_0802C954:
	adds r0, r5, #0
	bl GetTarget
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetUnit
	adds r4, r0, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r4, #0
	bl SetUnitHp
	adds r0, r4, #0
	movs r1, #0
	bl SetUnitStatus
	adds r5, #1
	cmp r5, r6
	blt _0802C954
_0802C980:
	adds r0, r7, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802C990: .4byte 0x0203A85C
