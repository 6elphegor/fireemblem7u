	.include "macro.inc"

	.syntax unified

	thumb_func_start ActionDance
ActionDance: @ 0x0802F4C4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802F508 @ =0x0203A85C
	ldrb r0, [r4, #0xd]
	bl GetUnit
	ldr r1, [r0, #0xc]
	ldr r2, _0802F50C @ =0xFFFFFBBD
	ands r1, r2
	str r1, [r0, #0xc]
	ldrb r0, [r4, #0xc]
	bl GetUnit
	movs r1, #1
	rsbs r1, r1, #0
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl BattleInitItemEffectTarget
	ldr r1, _0802F510 @ =0x0203A3D8
	movs r0, #0x40
	strh r0, [r1]
	adds r0, r5, #0
	bl BattleApplyMiscAction
	bl BeginBattleAnimations
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0802F508: .4byte 0x0203A85C
_0802F50C: .4byte 0xFFFFFBBD
_0802F510: .4byte 0x0203A3D8
