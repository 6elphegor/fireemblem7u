	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A722C
sub_080A722C: @ 0x080A722C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, [r7, #0x2c]
	mov r8, r0
	ldr r6, _080A72E0 @ =0x0000F4C0
	movs r5, #0x8c
	movs r4, #2
_080A7240:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x60
	ldr r3, _080A72E4 @ =0x08B905F8
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _080A7240
	ldr r1, _080A72E8 @ =0x08B857F8
	ldr r3, [r1]
	ldrh r2, [r3, #8]
	movs r5, #1
	adds r0, r5, #0
	ands r0, r2
	cmp r0, #0
	beq _080A72FC
	ldr r4, _080A72EC @ =0x0202BBF8
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A727C
	ldr r0, _080A72F0 @ =0x0000038A
	bl m4aSongNumStart
_080A727C:
	ldr r1, [r7, #0x2c]
	adds r4, #0x2c
	movs r0, #1
	ands r1, r0
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r4]
	ands r0, r2
	orrs r0, r1
	strb r0, [r4]
	ldr r5, _080A72F4 @ =0x0200006C
	adds r0, r5, #0
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	ldr r0, _080A72F8 @ =0x06011000
	movs r1, #0x10
	movs r2, #8
	bl Tact_ClearNrVrams
	ldrb r4, [r4]
	lsls r0, r4, #0x1f
	lsrs r0, r0, #0x1f
	bl sub_080A6DC0
	bl DecodeMsg
	adds r4, r0, #0
	adds r5, #0x18
	movs r0, #0x40
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r1, #0x80
	adds r0, r5, #0
	movs r2, #4
	adds r3, r4, #0
	bl Text_InsertDrawString
	movs r0, #0
	bl SetTextFont
	movs r0, #1
	bl EnableBgSync
	b _080A7316
	.align 2, 0
_080A72E0: .4byte 0x0000F4C0
_080A72E4: .4byte 0x08B905F8
_080A72E8: .4byte 0x08B857F8
_080A72EC: .4byte 0x0202BBF8
_080A72F0: .4byte 0x0000038A
_080A72F4: .4byte 0x0200006C
_080A72F8: .4byte 0x06011000
_080A72FC:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080A7328
	ldr r0, _080A7320 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A7316
	ldr r0, _080A7324 @ =0x0000038B
	bl m4aSongNumStart
_080A7316:
	adds r0, r7, #0
	bl Proc_Break
	b _080A7398
	.align 2, 0
_080A7320: .4byte 0x0202BBF8
_080A7324: .4byte 0x0000038B
_080A7328:
	movs r4, #0x20
	adds r0, r4, #0
	ldrh r3, [r3, #6]
	ands r0, r3
	cmp r0, #0
	beq _080A734A
	ldr r0, [r7, #0x2c]
	cmp r0, #0
	ble _080A7340
	subs r0, #1
	str r0, [r7, #0x2c]
	b _080A734A
_080A7340:
	adds r0, r4, #0
	ands r0, r2
	cmp r0, #0
	beq _080A734A
	str r5, [r7, #0x2c]
_080A734A:
	ldr r1, [r1]
	movs r2, #0x10
	adds r0, r2, #0
	ldrh r3, [r1, #6]
	ands r0, r3
	cmp r0, #0
	beq _080A7370
	ldr r0, [r7, #0x2c]
	cmp r0, #0
	bgt _080A7362
	adds r0, #1
	b _080A736E
_080A7362:
	adds r0, r2, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080A7370
	movs r0, #0
_080A736E:
	str r0, [r7, #0x2c]
_080A7370:
	ldr r0, [r7, #0x2c]
	cmp r0, r8
	beq _080A7398
	lsls r0, r0, #5
	adds r0, #0x88
	movs r3, #0x80
	lsls r3, r3, #4
	movs r1, #0x60
	movs r2, #3
	bl ShowSysHandCursor
	ldr r0, _080A73A4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A7398
	ldr r0, _080A73A8 @ =0x00000385
	bl m4aSongNumStart
_080A7398:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A73A4: .4byte 0x0202BBF8
_080A73A8: .4byte 0x00000385
