	.include "macro.inc"

	.syntax unified

	thumb_func_start SysBlackBox_Main
SysBlackBox_Main: @ 0x080A8E44
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x38
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	ldr r1, [sp, #4]
	adds r1, #0x4e
	str r1, [sp, #0x14]
_080A8E5C:
	ldr r0, [sp, #4]
	adds r0, #0x4a
	ldr r2, [sp, #8]
	adds r0, r0, r2
	ldrb r0, [r0]
	adds r2, #1
	str r2, [sp, #0x1c]
	cmp r0, #0
	bne _080A8E70
	b _080A9188
_080A8E70:
	ldr r0, [sp, #4]
	adds r0, #0x3e
	ldr r3, [sp, #8]
	adds r3, r3, r0
	mov sb, r3
	movs r1, #0
	ldrsb r1, [r3, r1]
	str r0, [sp, #0x30]
	cmp r1, #1
	bgt _080A8E86
	b _080A9188
_080A8E86:
	ldr r0, [sp, #4]
	adds r0, #0x3a
	ldr r7, [sp, #8]
	adds r7, r0, r7
	str r7, [sp, #0x34]
	movs r1, #0
	ldrsb r1, [r7, r1]
	str r0, [sp, #0x2c]
	cmp r1, #1
	bgt _080A8E9C
	b _080A9188
_080A8E9C:
	ldr r0, [sp, #8]
	lsls r0, r0, #1
	mov r8, r0
	ldr r1, [sp, #4]
	adds r1, #0x2a
	str r1, [sp, #0xc]
	adds r6, r1, #0
	add r6, r8
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r2, #0
	ldrh r3, [r6]
	orrs r1, r3
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r7, [sp, #4]
	adds r7, #0x32
	str r7, [sp, #0x10]
	adds r5, r7, #0
	add r5, r8
	movs r2, #0
	ldrsh r0, [r5, r2]
	mov ip, r0
	ldr r3, [sp, #4]
	adds r3, #0x42
	str r3, [sp, #0x18]
	adds r4, r3, #0
	add r4, r8
	ldrh r2, [r4]
	ldr r7, [sp, #0x14]
	ldrh r7, [r7]
	adds r0, r2, r7
	adds r0, #4
	str r0, [sp]
	movs r0, #0xd
	mov r2, ip
	ldr r3, _080A8FD4 @ =0x08B905B0
	bl PutSpriteExt
	movs r0, #0
	ldrsh r1, [r6, r0]
	mov r2, sb
	movs r0, #0
	ldrsb r0, [r2, r0]
	subs r0, #1
	lsls r0, r0, #3
	adds r1, r1, r0
	movs r7, #0
	ldrsh r3, [r5, r7]
	mov ip, r3
	ldrh r3, [r4]
	ldr r2, [sp, #0x14]
	ldrh r2, [r2]
	adds r0, r3, r2
	adds r0, #4
	str r0, [sp]
	movs r0, #0xd
	mov r2, ip
	ldr r3, _080A8FD4 @ =0x08B905B0
	bl PutSpriteExt
	movs r3, #0xc0
	lsls r3, r3, #6
	adds r1, r3, #0
	ldrh r7, [r6]
	orrs r1, r7
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0
	ldrsh r2, [r5, r0]
	ldr r3, [sp, #0x34]
	movs r0, #0
	ldrsb r0, [r3, r0]
	subs r0, #1
	lsls r0, r0, #3
	adds r2, r2, r0
	mov ip, r2
	ldrh r2, [r4]
	ldr r7, [sp, #0x14]
	ldrh r7, [r7]
	adds r0, r2, r7
	adds r0, #4
	str r0, [sp]
	movs r0, #0xd
	mov r2, ip
	ldr r3, _080A8FD4 @ =0x08B905B0
	bl PutSpriteExt
	movs r0, #0
	ldrsh r1, [r6, r0]
	mov r2, sb
	movs r0, #0
	ldrsb r0, [r2, r0]
	subs r0, #1
	lsls r0, r0, #3
	adds r1, r1, r0
	movs r0, #0x80
	lsls r0, r0, #6
	orrs r1, r0
	movs r3, #0
	ldrsh r2, [r5, r3]
	ldr r7, [sp, #0x34]
	movs r0, #0
	ldrsb r0, [r7, r0]
	subs r0, #1
	lsls r0, r0, #3
	adds r2, r2, r0
	ldrh r4, [r4]
	ldr r3, [sp, #0x14]
	ldrh r3, [r3]
	adds r0, r4, r3
	adds r0, #4
	str r0, [sp]
	movs r0, #0xd
	ldr r3, _080A8FD4 @ =0x08B905B0
	bl PutSpriteExt
	mov r7, sb
	movs r0, #0
	ldrsb r0, [r7, r0]
	subs r4, r0, #2
	movs r0, #0
	ldrsh r7, [r5, r0]
	movs r1, #0
	ldrsh r0, [r6, r1]
	adds r5, r0, #0
	adds r5, #8
	mov sl, r8
	ldr r2, [sp, #0xc]
	str r2, [sp, #0x24]
	ldr r3, [sp, #0x10]
	str r3, [sp, #0x28]
	ldr r0, [sp, #4]
	adds r0, #0x4e
	mov r8, r0
	ldr r6, [sp, #0x18]
	cmp r4, #3
	ble _080A8FFA
_080A8FB0:
	mov r1, sl
	adds r0, r6, r1
	ldrh r0, [r0]
	mov r2, r8
	ldrh r2, [r2]
	adds r0, r0, r2
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r3, _080A8FD8 @ =0x08B90608
	bl PutSpriteExt
	adds r5, #0x20
	subs r4, #4
	cmp r4, #3
	bgt _080A8FB0
	b _080A8FFA
	.align 2, 0
_080A8FD4: .4byte 0x08B905B0
_080A8FD8: .4byte 0x08B90608
_080A8FDC:
	mov r3, sl
	adds r0, r6, r3
	ldrh r0, [r0]
	mov r1, r8
	ldrh r1, [r1]
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r3, _080A9080 @ =0x08B905E8
	bl PutSpriteExt
	adds r5, #0x10
	subs r4, #2
_080A8FFA:
	cmp r4, #1
	bgt _080A8FDC
	cmp r4, #0
	ble _080A9024
_080A9002:
	mov r2, sl
	adds r0, r6, r2
	ldrh r0, [r0]
	mov r3, r8
	ldrh r3, [r3]
	adds r0, r0, r3
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r3, _080A9084 @ =0x08B905B0
	bl PutSpriteExt
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bgt _080A9002
_080A9024:
	ldr r7, [sp, #0x30]
	ldr r1, [sp, #8]
	adds r0, r7, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r4, r0, #2
	ldr r0, [sp, #0x28]
	add r0, sl
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r3, [sp, #0x2c]
	ldr r7, [sp, #8]
	adds r0, r3, r7
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, #1
	lsls r0, r0, #3
	adds r7, r1, r0
	ldr r0, [sp, #0x24]
	add r0, sl
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r5, r0, #0
	adds r5, #8
	cmp r4, #3
	ble _080A90AA
_080A905C:
	mov r2, sl
	adds r0, r6, r2
	ldrh r0, [r0]
	mov r3, r8
	ldrh r3, [r3]
	adds r0, r0, r3
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r3, _080A9088 @ =0x08B90608
	bl PutSpriteExt
	adds r5, #0x20
	subs r4, #4
	cmp r4, #3
	bgt _080A905C
	b _080A90AA
	.align 2, 0
_080A9080: .4byte 0x08B905E8
_080A9084: .4byte 0x08B905B0
_080A9088: .4byte 0x08B90608
_080A908C:
	mov r1, sl
	adds r0, r6, r1
	ldrh r0, [r0]
	mov r2, r8
	ldrh r2, [r2]
	adds r0, r0, r2
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r3, _080A9134 @ =0x08B905E8
	bl PutSpriteExt
	adds r5, #0x10
	subs r4, #2
_080A90AA:
	cmp r4, #1
	bgt _080A908C
	cmp r4, #0
	ble _080A90D4
_080A90B2:
	mov r3, sl
	adds r0, r6, r3
	ldrh r0, [r0]
	mov r1, r8
	ldrh r1, [r1]
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r3, _080A9138 @ =0x08B905B0
	bl PutSpriteExt
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bgt _080A90B2
_080A90D4:
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #8]
	adds r0, r2, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r1, r0, #2
	ldr r0, [sp, #0x28]
	add r0, sl
	movs r7, #0
	ldrsh r0, [r0, r7]
	adds r7, r0, #0
	adds r7, #8
	cmp r1, #0
	ble _080A9188
	add r6, sl
_080A90F4:
	ldr r2, [sp, #0x30]
	ldr r3, [sp, #8]
	adds r0, r2, r3
	movs r4, #0
	ldrsb r4, [r0, r4]
	ldr r0, [sp, #0x24]
	add r0, sl
	movs r2, #0
	ldrsh r5, [r0, r2]
	adds r3, r7, #0
	adds r3, #8
	str r3, [sp, #0x20]
	subs r1, #1
	mov sb, r1
	cmp r4, #3
	ble _080A915A
_080A9114:
	ldrh r2, [r6]
	mov r1, r8
	ldrh r1, [r1]
	adds r0, r2, r1
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r3, _080A913C @ =0x08B90608
	bl PutSpriteExt
	adds r5, #0x20
	subs r4, #4
	cmp r4, #3
	bgt _080A9114
	b _080A915A
	.align 2, 0
_080A9134: .4byte 0x08B905E8
_080A9138: .4byte 0x08B905B0
_080A913C: .4byte 0x08B90608
_080A9140:
	ldrh r3, [r6]
	mov r2, r8
	ldrh r2, [r2]
	adds r0, r3, r2
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r3, _080A91A4 @ =0x08B905E8
	bl PutSpriteExt
	adds r5, #0x10
	subs r4, #2
_080A915A:
	cmp r4, #1
	bgt _080A9140
	cmp r4, #0
	ble _080A9180
_080A9162:
	ldrh r1, [r6]
	mov r3, r8
	ldrh r3, [r3]
	adds r0, r1, r3
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r3, _080A91A8 @ =0x08B905B0
	bl PutSpriteExt
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bgt _080A9162
_080A9180:
	ldr r7, [sp, #0x20]
	mov r1, sb
	cmp r1, #0
	bgt _080A90F4
_080A9188:
	ldr r7, [sp, #0x1c]
	str r7, [sp, #8]
	adds r0, r7, #0
	cmp r0, #3
	bgt _080A9194
	b _080A8E5C
_080A9194:
	add sp, #0x38
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A91A4: .4byte 0x08B905E8
_080A91A8: .4byte 0x08B905B0
