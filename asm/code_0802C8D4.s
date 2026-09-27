	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802C8D4
sub_0802C8D4: @ 0x0802C8D4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0802C928 @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl BattleInitItemEffectTarget
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xd]
	bl GetUnit
	ldrb r2, [r4, #0x15]
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl MakeNewItem
	ldrb r4, [r4, #0x15]
	lsls r1, r4, #1
	adds r5, #0x1e
	adds r5, r5, r1
	strh r0, [r5]
	adds r0, r6, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802C928: .4byte 0x0203A85C
