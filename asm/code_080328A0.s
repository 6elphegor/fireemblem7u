	.include "macro.inc"

	.syntax unified

	thumb_func_start BeginUnitPoisonDamageAnim
BeginUnitPoisonDamageAnim: @ 0x080328A0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	movs r1, #1
	rsbs r1, r1, #0
	bl BattleInitItemEffect
	ldr r5, _080328FC @ =0x0203A3F0
	rsbs r4, r4, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl AddUnitHp
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bge _080328C6
	movs r0, #0
	strb r0, [r5, #0x13]
_080328C6:
	ldr r2, _08032900 @ =0x0203A50C
	ldr r0, [r2]
	adds r1, r5, #0
	adds r1, #0x72
	ldrb r1, [r1]
	ldrb r3, [r5, #0x13]
	subs r1, r1, r3
	strb r1, [r0, #3]
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _080328E8
	ldr r1, [r2]
	movs r0, #2
	ldrb r2, [r1, #2]
	orrs r0, r2
	strb r0, [r1, #2]
_080328E8:
	bl BattleHitTerminate
	bl sub_0806EFC4
	adds r0, r6, #0
	bl RenderMapForFogFadeIfUnitDied
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080328FC: .4byte 0x0203A3F0
_08032900: .4byte 0x0203A50C
