	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800AB38
sub_0800AB38: @ 0x0800AB38
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r5, r0, #0
	bl ParsePopupInstAndGetLen
	adds r2, r5, #0
	adds r2, #0x46
	strh r0, [r2]
	lsls r1, r0, #0x10
	lsrs r6, r1, #0x13
	movs r1, #7
	ands r1, r0
	cmp r1, #0
	beq _0800AB5E
	adds r6, #1
_0800AB5E:
	lsls r0, r6, #3
	ldrh r2, [r2]
	subs r0, r0, r2
	asrs r0, r0, #1
	mov sb, r0
	adds r2, r5, #0
	adds r2, #0x34
	movs r1, #0
	ldrsb r1, [r2, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0800AB82
	movs r0, #0x1e
	subs r0, r0, r6
	asrs r0, r0, #1
	subs r7, r0, #1
	b _0800AB86
_0800AB82:
	movs r7, #0
	ldrsb r7, [r2, r7]
_0800AB86:
	adds r2, r5, #0
	adds r2, #0x35
	movs r1, #0
	ldrsb r1, [r2, r1]
	movs r0, #1
	rsbs r0, r0, #0
	movs r3, #8
	mov r8, r3
	cmp r1, r0
	beq _0800AB9E
	adds r2, r1, #0
	mov r8, r2
_0800AB9E:
	adds r4, r6, #2
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r0, [r0]
	str r0, [sp]
	adds r0, r7, #0
	mov r1, r8
	adds r2, r4, #0
	movs r3, #4
	bl DrawUiFrame2
	movs r0, #0x37
	adds r0, r0, r5
	mov sl, r0
	strb r7, [r0]
	adds r1, r5, #0
	adds r1, #0x38
	str r1, [sp, #0xc]
	mov r2, r8
	strb r2, [r1]
	adds r0, r5, #0
	adds r0, #0x39
	strb r4, [r0]
	adds r1, #2
	movs r0, #3
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x44
	ldrb r0, [r4]
	add r0, sb
	strb r0, [r4]
	add r0, sp, #4
	adds r1, r6, #0
	bl InitText
	adds r0, r5, #0
	adds r0, #0x3b
	ldrb r1, [r0]
	add r0, sp, #4
	bl Text_SetColor
	add r0, sp, #4
	mov r1, sb
	bl Text_SetCursor
	ldr r0, [r5, #0x2c]
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	bl GeneratePopupText
	ldr r6, _0800AC80 @ =0x0000FFFF
	ldrh r3, [r5, #0x3e]
	cmp r3, r6
	beq _0800AC16
	ldrh r0, [r5, #0x3e]
	adds r1, r5, #0
	adds r1, #0x40
	ldrh r1, [r1]
	bl PutIconObjImg
_0800AC16:
	mov r1, r8
	adds r1, #1
	lsls r1, r1, #5
	adds r1, #1
	adds r1, r1, r7
	lsls r1, r1, #1
	ldr r0, _0800AC84 @ =0x02022C60
	adds r1, r1, r0
	add r0, sp, #4
	bl PutText
	bl ResetText
	ldrh r0, [r5, #0x3e]
	cmp r0, r6
	beq _0800AC6E
	ldr r0, _0800AC88 @ =0x08B90D00
	adds r1, r5, #0
	bl Proc_Start
	mov r2, sl
	ldrb r1, [r2]
	adds r1, #1
	lsls r1, r1, #3
	ldrb r4, [r4]
	adds r1, r4, r1
	str r1, [r0, #0x2c]
	ldr r3, [sp, #0xc]
	ldrb r1, [r3]
	adds r1, #1
	lsls r1, r1, #3
	str r1, [r0, #0x30]
	adds r3, r5, #0
	adds r3, #0x40
	adds r2, r5, #0
	adds r2, #0x42
	movs r1, #0xf
	ldrb r2, [r2]
	ands r1, r2
	lsls r1, r1, #0xc
	ldrh r3, [r3]
	orrs r1, r3
	adds r0, #0x4a
	strh r1, [r0]
_0800AC6E:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800AC80: .4byte 0x0000FFFF
_0800AC84: .4byte 0x02022C60
_0800AC88: .4byte 0x08B90D00
