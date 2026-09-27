	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802CAA0
sub_0802CAA0: @ 0x0802CAA0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802CAE0 @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r0, #0x31
	movs r1, #0x10
	rsbs r1, r1, #0
	ldrb r2, [r0]
	ands r1, r2
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	ldrb r0, [r4, #0xe]
	strb r0, [r4, #0x13]
	ldrb r0, [r4, #0xf]
	strb r0, [r4, #0x14]
	adds r0, r5, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802CAE0: .4byte 0x0203A85C
