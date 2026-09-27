	.include "macro.inc"

	.syntax unified

	thumb_func_start BeginUnitCritDamageAnim
BeginUnitCritDamageAnim: @ 0x08032904
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	movs r1, #1
	rsbs r1, r1, #0
	bl BattleInitItemEffect
	ldr r5, _08032968 @ =0x0203A3F0
	rsbs r4, r4, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl AddUnitHp
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bge _0803292A
	movs r0, #0
	strb r0, [r5, #0x13]
_0803292A:
	ldr r2, _0803296C @ =0x0203A50C
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
	bne _08032954
	ldr r1, [r2]
	movs r0, #1
	ldrh r2, [r1]
	orrs r0, r2
	strh r0, [r1]
	movs r0, #2
	ldrb r3, [r1, #2]
	orrs r0, r3
	strb r0, [r1, #2]
_08032954:
	bl BattleHitTerminate
	bl sub_0806F050
	adds r0, r6, #0
	bl RenderMapForFogFadeIfUnitDied
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08032968: .4byte 0x0203A3F0
_0803296C: .4byte 0x0203A50C
