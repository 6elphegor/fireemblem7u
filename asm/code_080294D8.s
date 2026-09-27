	.include "macro.inc"

	.syntax unified

	thumb_func_start BattleGenerateHit
BattleGenerateHit: @ 0x080294D8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r6, _08029550 @ =0x0203A470
	cmp r4, r6
	bne _080294F0
	ldr r0, _08029554 @ =0x0203A50C
	ldr r1, [r0]
	movs r0, #8
	ldrb r2, [r1, #2]
	orrs r0, r2
	strb r0, [r1, #2]
_080294F0:
	adds r0, r4, #0
	adds r1, r5, #0
	bl BattleUpdateBattleStats
	adds r0, r4, #0
	adds r1, r5, #0
	bl BattleGenerateHitTriangleAttack
	adds r0, r4, #0
	bl BattleGenerateHitAttributes
	adds r0, r4, #0
	adds r1, r5, #0
	bl BattleGenerateHitEffects
	movs r0, #0x13
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _0802951E
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _08029558
_0802951E:
	adds r1, r4, #0
	adds r1, #0x7b
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r2, _08029554 @ =0x0203A50C
	ldr r1, [r2]
	movs r0, #2
	ldrb r3, [r1, #2]
	orrs r0, r3
	strb r0, [r1, #2]
	movs r0, #0x13
	ldrsb r0, [r6, r0]
	cmp r0, #0
	bne _08029546
	ldr r1, [r2]
	movs r0, #4
	ldrb r3, [r1, #2]
	orrs r0, r3
	strb r0, [r1, #2]
_08029546:
	ldr r0, [r2]
	adds r0, #4
	str r0, [r2]
	movs r0, #1
	b _08029562
	.align 2, 0
_08029550: .4byte 0x0203A470
_08029554: .4byte 0x0203A50C
_08029558:
	ldr r1, _08029568 @ =0x0203A50C
	ldr r0, [r1]
	adds r0, #4
	str r0, [r1]
	movs r0, #0
_08029562:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08029568: .4byte 0x0203A50C
