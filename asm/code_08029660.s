	.include "macro.inc"

	.syntax unified

	thumb_func_start CheckBattleUnitLevelUp
CheckBattleUnitLevelUp: @ 0x08029660
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	bl CanBattleUnitGainLevels
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802967A
	b _08029808
_0802967A:
	ldrb r0, [r7, #9]
	cmp r0, #0x63
	bhi _08029682
	b _08029808
_08029682:
	adds r2, r0, #0
	subs r2, #0x64
	strb r2, [r7, #9]
	ldrb r0, [r7, #8]
	adds r0, #1
	strb r0, [r7, #8]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x14
	bne _080296A4
	adds r1, r7, #0
	adds r1, #0x6e
	ldrb r3, [r1]
	subs r0, r3, r2
	strb r0, [r1]
	movs r0, #0xff
	strb r0, [r7, #9]
_080296A4:
	ldr r0, [r7, #0xc]
	movs r1, #0x80
	lsls r1, r1, #6
	ands r0, r1
	movs r1, #0
	mov sl, r1
	cmp r0, #0
	beq _080296B8
	movs r3, #5
	mov sl, r3
_080296B8:
	ldr r0, [r7]
	ldrb r0, [r0, #0x1c]
	add r0, sl
	bl GetStatIncrease
	adds r1, r7, #0
	adds r1, #0x73
	str r1, [sp]
	strb r0, [r1]
	movs r6, #0
	ldrsb r6, [r1, r6]
	ldr r0, [r7]
	ldrb r0, [r0, #0x1d]
	add r0, sl
	bl GetStatIncrease
	adds r3, r7, #0
	adds r3, #0x74
	str r3, [sp, #4]
	strb r0, [r3]
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r6, r6, r0
	ldr r0, [r7]
	ldrb r0, [r0, #0x1e]
	add r0, sl
	bl GetStatIncrease
	movs r1, #0x75
	adds r1, r1, r7
	mov r8, r1
	strb r0, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	adds r6, r6, r0
	ldr r0, [r7]
	ldrb r0, [r0, #0x1f]
	add r0, sl
	bl GetStatIncrease
	movs r3, #0x76
	adds r3, r3, r7
	mov sb, r3
	strb r0, [r3]
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r6, r6, r0
	ldr r0, [r7]
	adds r0, #0x20
	ldrb r0, [r0]
	add r0, sl
	bl GetStatIncrease
	adds r5, r7, #0
	adds r5, #0x77
	strb r0, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	adds r6, r6, r0
	ldr r0, [r7]
	adds r0, #0x21
	ldrb r0, [r0]
	add r0, sl
	bl GetStatIncrease
	adds r4, r7, #0
	adds r4, #0x78
	strb r0, [r4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	adds r6, r6, r0
	ldr r0, [r7]
	adds r0, #0x22
	ldrb r0, [r0]
	add r0, sl
	bl GetStatIncrease
	adds r1, r7, #0
	adds r1, #0x79
	strb r0, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	adds r6, r6, r0
	ldr r0, [sp]
	str r0, [sp, #0xc]
	ldr r3, [sp, #4]
	str r3, [sp, #8]
	mov sl, r8
	mov r8, r5
	adds r5, r4, #0
	adds r4, r1, #0
	cmp r6, #0
	bne _080297FA
	b _080297E4
_08029774:
	ldr r0, [r7]
	ldrb r0, [r0, #0x1d]
	bl GetStatIncrease
	ldr r1, [sp, #8]
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080297FA
	ldr r0, [r7]
	ldrb r0, [r0, #0x1e]
	bl GetStatIncrease
	mov r3, sl
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080297FA
	ldr r0, [r7]
	ldrb r0, [r0, #0x1f]
	bl GetStatIncrease
	mov r1, sb
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080297FA
	ldr r0, [r7]
	adds r0, #0x20
	ldrb r0, [r0]
	bl GetStatIncrease
	mov r3, r8
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080297FA
	ldr r0, [r7]
	adds r0, #0x21
	ldrb r0, [r0]
	bl GetStatIncrease
	strb r0, [r5]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080297FA
	ldr r0, [r7]
	adds r0, #0x22
	ldrb r0, [r0]
	bl GetStatIncrease
	strb r0, [r4]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080297FA
	adds r6, #1
_080297E4:
	cmp r6, #1
	bgt _080297FA
	ldr r0, [r7]
	ldrb r0, [r0, #0x1c]
	bl GetStatIncrease
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08029774
_080297FA:
	movs r0, #0xb
	ldrsb r0, [r7, r0]
	bl GetUnit
	adds r1, r7, #0
	bl CheckBattleUnitStatCaps
_08029808:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
