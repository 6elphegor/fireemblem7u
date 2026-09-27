	.include "macro.inc"

	.syntax unified

	thumb_func_start BeginUnitHealAnim
BeginUnitHealAnim: @ 0x08032858
	push {r4, r5, lr}
	adds r4, r1, #0
	movs r1, #1
	rsbs r1, r1, #0
	bl BattleInitItemEffect
	ldr r5, _08032898 @ =0x0203A3F0
	adds r0, r5, #0
	adds r0, #0x48
	movs r1, #0x6b
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, r5, #0
	adds r1, r4, #0
	bl AddUnitHp
	ldr r0, _0803289C @ =0x0203A50C
	ldr r1, [r0]
	adds r0, r5, #0
	adds r0, #0x72
	ldrb r0, [r0]
	ldrb r5, [r5, #0x13]
	subs r0, r0, r5
	strb r0, [r1, #3]
	bl BattleHitTerminate
	bl BeginBattleAnimations
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08032898: .4byte 0x0203A3F0
_0803289C: .4byte 0x0203A50C
