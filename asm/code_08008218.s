	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08008218
sub_08008218: @ 0x08008218
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	bl sub_08009020
	lsls r0, r0, #0x18
	asrs r3, r0, #0x18
	cmp r3, #0
	beq _0800822E
	b _0800837E
_0800822E:
	ldr r2, _08008278 @ =0x08B909B8
	ldr r1, [r2]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _08008252
	ldrb r0, [r1, #0x14]
	adds r0, #1
	strb r0, [r1, #0x14]
	ldr r0, [r2]
	movs r1, #0x14
	ldrsb r1, [r0, r1]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bge _08008252
	b _0800837E
_08008252:
	ldr r0, [r2]
	strb r3, [r0, #0x14]
_08008256:
	ldr r7, _08008278 @ =0x08B909B8
	ldr r0, _0800827C @ =0x0202BC39
	mov r8, r0
_0800825C:
	ldr r0, [r7]
	ldrb r0, [r0, #0x11]
	bl SetTalkFaceNoMouthMove
	adds r0, r6, #0
	bl TalkInterpret
	cmp r0, #1
	beq _080082B4
	cmp r0, #1
	bgt _08008280
	cmp r0, #0
	beq _0800828A
	b _080082B4
	.align 2, 0
_08008278: .4byte 0x08B909B8
_0800827C: .4byte 0x0202BC39
_08008280:
	cmp r0, #2
	beq _08008292
	cmp r0, #3
	beq _080082A6
	b _080082B4
_0800828A:
	adds r0, r6, #0
	bl Proc_Break
	b _0800837E
_08008292:
	ldr r1, [r7]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _08008256
	movs r0, #0x13
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _08008368
	b _0800837E
_080082A6:
	ldr r0, [r7]
	ldrb r1, [r0, #0x13]
	movs r2, #0
	strb r1, [r0, #0x14]
	ldr r0, [r7]
	strb r2, [r0, #0x12]
	b _0800837E
_080082B4:
	movs r0, #0x20
	bl CheckTalkFlag
	cmp r0, #0
	bne _080082C6
	adds r0, r6, #0
	bl sub_0800838C
	b _080082CC
_080082C6:
	adds r0, r6, #0
	bl TalkSpritePrepNextChar
_080082CC:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0800837E
	ldr r5, _0800831C @ =0x08B909B8
	ldr r4, [r5]
	ldrb r1, [r4, #0xb]
	ldrb r2, [r4, #9]
	adds r0, r1, r2
	ldrb r1, [r4, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _08008320 @ =0x030000C8
	adds r0, r0, r1
	ldr r1, [r4]
	bl Text_DrawCharacter
	ldr r1, [r5]
	str r0, [r1]
	movs r0, #0x40
	bl CheckTalkFlag
	cmp r0, #0
	bne _08008368
	movs r0, #0x80
	bl CheckTalkFlag
	cmp r0, #0
	beq _08008328
	mov r1, r8
	ldrb r1, [r1]
	lsls r0, r1, #0x1e
	cmp r0, #0
	blt _08008368
	ldr r0, _08008324 @ =0x0000039A
	bl m4aSongNumStart
	b _08008368
	.align 2, 0
_0800831C: .4byte 0x08B909B8
_08008320: .4byte 0x030000C8
_08008324: .4byte 0x0000039A
_08008328:
	bl GetTextPrintDelay
	adds r4, r0, #0
	cmp r4, #1
	bne _0800833C
	bl GetGameTime
	ands r0, r4
	cmp r0, #0
	beq _08008368
_0800833C:
	ldr r1, [r5]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08008350
	adds r0, r1, #0
	adds r0, #0x82
	ldrb r0, [r0]
	cmp r0, #0
	bne _08008368
_08008350:
	adds r0, r1, #0
	adds r0, #0x82
	movs r1, #1
	strb r1, [r0]
	mov r2, r8
	ldrb r2, [r2]
	lsls r0, r2, #0x1e
	cmp r0, #0
	blt _08008368
	ldr r0, _08008388 @ =0x0000038E
	bl m4aSongNumStart
_08008368:
	ldr r1, [r7]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08008374
	b _0800825C
_08008374:
	movs r0, #0x13
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bgt _0800837E
	b _0800825C
_0800837E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08008388: .4byte 0x0000038E
