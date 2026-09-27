	.include "macro.inc"

	.syntax unified

	thumb_func_start BattleUnwindScripted
BattleUnwindScripted: @ 0x0802A8A8
	push {r4, r5, r6, lr}
	ldr r0, _0802A8F4 @ =0x0203A85C
	ldr r2, [r0, #0x18]
	ldr r3, _0802A8F8 @ =0x0203A4F0
	movs r0, #0x80
	ldrb r1, [r2, #2]
	ands r0, r1
	adds r5, r3, #0
	ldr r1, _0802A8FC @ =0x0203A50C
	cmp r0, #0
	bne _0802A8CE
	movs r4, #0x80
_0802A8C0:
	ldm r2!, {r0}
	stm r3!, {r0}
	adds r0, r4, #0
	ldrb r6, [r2, #2]
	ands r0, r6
	cmp r0, #0
	beq _0802A8C0
_0802A8CE:
	ldr r0, [r2]
	str r0, [r3]
	str r5, [r1]
	movs r0, #0x80
	ldrb r5, [r5, #2]
	ands r0, r5
	cmp r0, #0
	bne _0802A984
	adds r6, r1, #0
_0802A8E0:
	ldr r1, [r6]
	movs r0, #8
	ldrb r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	beq _0802A908
	ldr r5, _0802A900 @ =0x0203A470
	ldr r4, _0802A904 @ =0x0203A3F0
	b _0802A90C
	.align 2, 0
_0802A8F4: .4byte 0x0203A85C
_0802A8F8: .4byte 0x0203A4F0
_0802A8FC: .4byte 0x0203A50C
_0802A900: .4byte 0x0203A470
_0802A904: .4byte 0x0203A3F0
_0802A908:
	ldr r5, _0802A968 @ =0x0203A3F0
	ldr r4, _0802A96C @ =0x0203A470
_0802A90C:
	adds r0, r5, #0
	adds r1, r4, #0
	bl BattleUpdateBattleStats
	adds r0, r5, #0
	bl BattleGenerateHitScriptedDamage
	adds r0, r5, #0
	adds r1, r4, #0
	bl BattleGenerateHitEffects
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _0802A932
	movs r0, #0x13
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0802A974
_0802A932:
	adds r0, r5, #0
	adds r0, #0x7b
	ldrb r1, [r0]
	adds r1, #1
	movs r3, #0
	strb r1, [r0]
	ldr r2, _0802A970 @ =0x0203A50C
	ldr r1, [r2]
	movs r0, #2
	ldrb r4, [r1, #2]
	orrs r0, r4
	strb r0, [r1, #2]
	ldr r0, _0802A96C @ =0x0203A470
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0802A960
	ldr r1, [r2]
	movs r0, #4
	ldrb r6, [r1, #2]
	orrs r0, r6
	strb r0, [r1, #2]
_0802A960:
	ldr r1, [r2]
	movs r0, #0x80
	strb r0, [r1, #6]
	b _0802A984
	.align 2, 0
_0802A968: .4byte 0x0203A3F0
_0802A96C: .4byte 0x0203A470
_0802A970: .4byte 0x0203A50C
_0802A974:
	ldr r1, [r6]
	adds r1, #4
	str r1, [r6]
	movs r0, #0x80
	ldrb r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	beq _0802A8E0
_0802A984:
	ldr r1, _0802A990 @ =0x0203A85C
	movs r0, #0
	str r0, [r1, #0x18]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802A990: .4byte 0x0203A85C
