	.include "macro.inc"

	.syntax unified

	thumb_func_start ExecWarpStaff
ExecWarpStaff: @ 0x0802C708
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802C760 @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl BattleInitItemEffectTarget
	ldrb r0, [r4, #0xd]
	bl GetUnit
	ldrb r1, [r4, #0x13]
	strb r1, [r0, #0x10]
	ldrb r0, [r4, #0xd]
	bl GetUnit
	ldrb r1, [r4, #0x14]
	strb r1, [r0, #0x11]
	ldr r0, _0802C764 @ =0x0203A470
	ldrb r1, [r4, #0x13]
	adds r2, r0, #0
	adds r2, #0x73
	strb r1, [r2]
	ldrb r1, [r4, #0x14]
	adds r0, #0x74
	strb r1, [r0]
	adds r0, r5, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	ldr r0, _0802C768 @ =0x08B945C8
	adds r1, r5, #0
	bl Proc_StartBlocking
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802C760: .4byte 0x0203A85C
_0802C764: .4byte 0x0203A470
_0802C768: .4byte 0x08B945C8
