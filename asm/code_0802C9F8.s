	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802C9F8
sub_0802C9F8: @ 0x0802C9F8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0802CA58 @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xc]
	bl GetUnit
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r5, #0
	bl SetUnitHp
	ldrb r0, [r4, #0xc]
	bl GetUnit
	bl GetUnitCurrentHp
	ldr r1, _0802CA5C @ =0x0203A50C
	ldr r1, [r1]
	ldr r5, _0802CA60 @ =0x0203A3F0
	ldrb r2, [r5, #0x13]
	subs r0, r2, r0
	strb r0, [r1, #3]
	ldrb r0, [r4, #0xc]
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
_0802CA58: .4byte 0x0203A85C
_0802CA5C: .4byte 0x0203A50C
_0802CA60: .4byte 0x0203A3F0
