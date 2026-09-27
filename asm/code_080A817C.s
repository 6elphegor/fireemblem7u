	.include "macro.inc"

	.syntax unified

	thumb_func_start ModeSelect_Loop_KeyHandler
ModeSelect_Loop_KeyHandler: @ 0x080A817C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r2, _080A81BC @ =0x08B857F8
	ldr r1, [r2]
	movs r0, #0x40
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _080A81C8
	adds r1, r4, #0
	adds r1, #0x41
	adds r0, r4, #0
	adds r0, #0x43
	ldrb r1, [r1]
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, #1
	bne _080A81C8
	ldr r0, _080A81C0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A81B2
	ldr r0, _080A81C4 @ =0x00000386
	bl m4aSongNumStart
_080A81B2:
	adds r0, r4, #0
	movs r1, #0
	bl sub_080A8150
	b _080A840E
	.align 2, 0
_080A81BC: .4byte 0x08B857F8
_080A81C0: .4byte 0x0202BBF8
_080A81C4: .4byte 0x00000386
_080A81C8:
	ldr r1, [r2]
	movs r0, #0x80
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _080A8274
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r3, [r0]
	adds r1, r4, #0
	adds r1, #0x43
	adds r1, r1, r3
	ldrb r1, [r1]
	adds r5, r0, #0
	cmp r1, #0
	bne _080A8274
	adds r0, #8
	adds r1, r0, r3
	ldrb r1, [r1]
	adds r2, r0, #0
	cmp r1, #0
	bne _080A8202
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080A8232
_080A8202:
	ldrb r1, [r5]
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #1
	bne _080A821A
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080A8232
_080A821A:
	ldrb r5, [r5]
	adds r0, r5, r2
	ldrb r0, [r0]
	cmp r0, #2
	bne _080A8250
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #0x10
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080A8250
_080A8232:
	ldr r0, _080A824C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080A8240
	b _080A840E
_080A8240:
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _080A840E
	.align 2, 0
_080A824C: .4byte 0x0202BBF8
_080A8250:
	ldr r0, _080A826C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A8262
	ldr r0, _080A8270 @ =0x00000386
	bl m4aSongNumStart
_080A8262:
	adds r0, r4, #0
	movs r1, #1
	bl sub_080A8150
	b _080A840E
	.align 2, 0
_080A826C: .4byte 0x0202BBF8
_080A8270: .4byte 0x00000386
_080A8274:
	ldr r1, [r2]
	ldrh r3, [r1, #4]
	movs r0, #0x88
	lsls r0, r0, #2
	ands r0, r3
	cmp r0, #0
	beq _080A828E
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	movs r0, #0
	b _080A82A2
_080A828E:
	movs r7, #0x88
	lsls r7, r7, #1
	ands r7, r3
	cmp r7, #0
	beq _080A82C8
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	movs r0, #1
_080A82A2:
	bl SetUiSpinningArrowFastMaybe
	ldr r0, _080A82C0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A82B8
	ldr r0, _080A82C4 @ =0x00000387
	bl m4aSongNumStart
_080A82B8:
	adds r0, r4, #0
	bl sub_080A8120
	b _080A840E
	.align 2, 0
_080A82C0: .4byte 0x0202BBF8
_080A82C4: .4byte 0x00000387
_080A82C8:
	ldrh r1, [r1, #8]
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	beq _080A8388
	str r7, [r4, #0x2c]
	ldr r6, _080A8348 @ =0x0202BBF8
	adds r0, r6, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A82E8
	ldr r0, _080A834C @ =0x0000038A
	bl m4aSongNumStart
_080A82E8:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	ldr r1, _080A8350 @ =0x0201E8D4
	adds r5, r4, #0
	adds r5, #0x41
	ldrb r2, [r5]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r7, [r0, #0xa]
	ldrb r2, [r5]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	bl sub_08054C8C
	adds r7, r4, #0
	adds r7, #0x42
	movs r0, #1
	ldrb r1, [r7]
	ands r0, r1
	cmp r0, #0
	beq _080A835E
	ldrb r1, [r5]
	cmp r1, #0
	bne _080A8328
	movs r0, #2
	strb r0, [r6, #0x1b]
_080A8328:
	cmp r1, #1
	bne _080A8330
	movs r0, #3
	strb r0, [r6, #0x1b]
_080A8330:
	adds r0, r4, #0
	adds r0, #0x43
	ldrb r5, [r5]
	adds r0, r5, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A8354
	movs r0, #0x40
	ldrb r2, [r6, #0x14]
	orrs r0, r2
	strb r0, [r6, #0x14]
	b _080A8382
	.align 2, 0
_080A8348: .4byte 0x0202BBF8
_080A834C: .4byte 0x0000038A
_080A8350: .4byte 0x0201E8D4
_080A8354:
	movs r0, #0xbf
	ldrb r1, [r6, #0x14]
	ands r0, r1
	strb r0, [r6, #0x14]
	b _080A8382
_080A835E:
	ldrb r1, [r5]
	adds r0, r4, #0
	adds r0, #0x49
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r4, #0x43
	adds r1, r4, r1
	ldrb r1, [r1]
	bl SaveMenu_SetDifficultyChoice
	ldrb r5, [r5]
	adds r4, r5, r4
	ldrb r0, [r4]
	movs r1, #2
	ldrb r7, [r7]
	orrs r1, r7
	bl sub_080A7C24
_080A8382:
	bl sub_080A7B7C
	b _080A840E
_080A8388:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080A83C2
	adds r0, r4, #0
	adds r0, #0x42
	movs r1, #1
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _080A83C2
	str r1, [r4, #0x2c]
	ldr r0, _080A8414 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A83B2
	ldr r0, _080A8418 @ =0x0000038B
	bl m4aSongNumStart
_080A83B2:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
	movs r0, #3
	movs r1, #0
	bl SaveMenu_SetDifficultyChoice
_080A83C2:
	ldr r0, [r4, #0x50]
	adds r0, #1
	str r0, [r4, #0x50]
	ldr r5, _080A841C @ =0x000001FF
	ands r0, r5
	cmp r0, #0x20
	bne _080A83F2
	ldr r2, _080A8420 @ =0x0201E8D4
	adds r3, r4, #0
	adds r3, #0x41
	ldrb r1, [r3]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r1, #2
	strh r1, [r0, #0xa]
	ldrb r1, [r3]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	bl sub_08054C8C
_080A83F2:
	ldr r0, [r4, #0x50]
	ands r0, r5
	cmp r0, #0x80
	bne _080A840E
	adds r1, r4, #0
	adds r1, #0x41
	ldrb r2, [r1]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _080A8420 @ =0x0201E8D4
	adds r0, r0, r1
	bl sub_08054E5C
_080A840E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A8414: .4byte 0x0202BBF8
_080A8418: .4byte 0x0000038B
_080A841C: .4byte 0x000001FF
_080A8420: .4byte 0x0201E8D4
