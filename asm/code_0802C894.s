	.include "macro.inc"

	.syntax unified

	thumb_func_start ExecUnlockStaff
ExecUnlockStaff: @ 0x0802C894
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802C8CC @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldr r0, _0802C8D0 @ =0x0203A470
	ldrb r1, [r4, #0x13]
	strb r1, [r0, #0x10]
	ldrb r2, [r4, #0x14]
	strb r2, [r0, #0x11]
	adds r3, r0, #0
	adds r3, #0x73
	strb r1, [r3]
	adds r0, #0x74
	strb r2, [r0]
	adds r0, r5, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802C8CC: .4byte 0x0203A85C
_0802C8D0: .4byte 0x0203A470
