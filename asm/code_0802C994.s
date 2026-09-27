	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802C994
sub_0802C994: @ 0x0802C994
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r5, _0802C9EC @ =0x0203A85C
	ldrb r0, [r5, #0xc]
	bl GetUnit
	ldrb r1, [r5, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r5, #0xc]
	bl GetUnit
	adds r1, r4, #0
	bl AddUnitHp
	ldrb r0, [r5, #0xc]
	bl GetUnit
	bl GetUnitCurrentHp
	ldr r1, _0802C9F0 @ =0x0203A50C
	ldr r1, [r1]
	ldr r4, _0802C9F4 @ =0x0203A3F0
	ldrb r2, [r4, #0x13]
	subs r0, r2, r0
	strb r0, [r1, #3]
	ldrb r0, [r5, #0xc]
	bl GetUnit
	bl GetUnitCurrentHp
	strb r0, [r4, #0x13]
	adds r4, #0x4a
	movs r0, #0x6b
	strh r0, [r4]
	adds r0, r6, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802C9EC: .4byte 0x0203A85C
_0802C9F0: .4byte 0x0203A50C
_0802C9F4: .4byte 0x0203A3F0
