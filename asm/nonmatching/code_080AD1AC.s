	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AD1AC
sub_080AD1AC: @ 0x080AD1AC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r5, #0
	adds r6, #0x29
	ldrb r4, [r6]
	movs r0, #0x2e
	adds r0, r0, r5
	mov r8, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080AD1CC
	b _080AD3B6
_080AD1CC:
	ldr r0, _080AD208 @ =0x08B857F8
	ldr r2, [r0]
	ldrh r1, [r2, #8]
	movs r7, #1
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080AD2C0
	ldr r0, _080AD20C @ =0x08CE577C
	ldr r1, [r0]
	lsls r0, r4, #2
	adds r0, r0, r1
	movs r4, #0
	ldrsb r4, [r0, r4]
	bl GetBonusContentClaimFlags
	adds r1, r7, #0
	lsls r1, r4
	ands r1, r0
	cmp r1, #0
	beq _080AD214
	movs r1, #1
	rsbs r1, r1, #0
	ldr r2, _080AD210 @ =0x00000763
	adds r0, r1, #0
	adds r3, r5, #0
	bl StartBonusClaimHelpBox
	b _080AD402
	.align 2, 0
_080AD208: .4byte 0x08B857F8
_080AD20C: .4byte 0x08CE577C
_080AD210: .4byte 0x00000763
_080AD214:
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	beq _080AD2A4
	ldr r7, _080AD23C @ =0x08CE5774
	ldr r1, [r7]
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r4, r0, #2
	adds r1, r1, r4
	ldrb r0, [r1, #1]
	cmp r0, #0
	bge _080AD232
	b _080AD402
_080AD232:
	cmp r0, #1
	ble _080AD240
	cmp r0, #2
	beq _080AD268
	b _080AD402
	.align 2, 0
_080AD23C: .4byte 0x08CE5774
_080AD240:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _080AD260 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080AD256
	b _080AD402
_080AD256:
	ldr r0, _080AD264 @ =0x0000038A
	bl m4aSongNumStart
	b _080AD402
	.align 2, 0
_080AD260: .4byte 0x0202BBF8
_080AD264: .4byte 0x0000038A
_080AD268:
	ldrb r1, [r1, #2]
	cmp r1, #0x97
	bne _080AD274
	ldr r0, _080AD29C @ =0x00000BB8
	bl AddGold
_080AD274:
	ldr r0, [r7]
	adds r0, r0, r4
	ldrb r0, [r0, #2]
	cmp r0, #0x98
	bne _080AD284
	ldr r0, _080AD2A0 @ =0x00001388
	bl AddGold
_080AD284:
	ldrb r0, [r6]
	bl SetBonusItemClaimed
	ldrb r0, [r6]
	bl sub_080ACCF4
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
	b _080AD402
	.align 2, 0
_080AD29C: .4byte 0x00000BB8
_080AD2A0: .4byte 0x00001388
_080AD2A4:
	ldr r0, _080AD2BC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080AD2B2
	b _080AD402
_080AD2B2:
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _080AD402
	.align 2, 0
_080AD2BC: .4byte 0x0202BBF8
_080AD2C0:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080AD2EC
	adds r0, r5, #0
	bl Proc_Break
	ldr r0, _080AD2E4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080AD2DC
	b _080AD402
_080AD2DC:
	ldr r0, _080AD2E8 @ =0x0000038B
	bl m4aSongNumStart
	b _080AD402
	.align 2, 0
_080AD2E4: .4byte 0x0202BBF8
_080AD2E8: .4byte 0x0000038B
_080AD2EC:
	ldrh r1, [r2, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080AD2F8
	subs r4, #1
_080AD2F8:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080AD302
	adds r4, #1
_080AD302:
	ldrb r0, [r6]
	cmp r0, r4
	beq _080AD3A8
	cmp r4, #0
	blt _080AD402
	ldr r0, _080AD34C @ =0x08CE5780
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r4, r0
	bge _080AD402
	ldr r0, _080AD350 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AD328
	ldr r0, _080AD354 @ =0x00000386
	bl m4aSongNumStart
_080AD328:
	strb r4, [r6]
	ldrb r2, [r6]
	lsls r1, r2, #4
	movs r3, #0x2c
	ldrsh r0, [r5, r3]
	cmp r1, r0
	bne _080AD358
	cmp r2, #0
	beq _080AD358
	movs r0, #0xff
	mov r4, r8
	strb r0, [r4]
	ldrb r0, [r6]
	subs r0, #1
	bl sub_080ACCF4
	b _080AD3A8
	.align 2, 0
_080AD34C: .4byte 0x08CE5780
_080AD350: .4byte 0x0202BBF8
_080AD354: .4byte 0x00000386
_080AD358:
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r3, [r0]
	lsls r1, r3, #4
	movs r4, #0x2c
	ldrsh r2, [r5, r4]
	subs r1, r1, r2
	adds r2, r0, #0
	cmp r1, #0x40
	bne _080AD390
	ldr r0, _080AD38C @ =0x08CE5780
	ldr r0, [r0]
	ldr r0, [r0]
	subs r0, #1
	cmp r3, r0
	bge _080AD390
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #1
	strb r0, [r1]
	ldrb r0, [r2]
	adds r0, #1
	bl sub_080ACCF4
	b _080AD3A8
	.align 2, 0
_080AD38C: .4byte 0x08CE5780
_080AD390:
	ldrb r2, [r2]
	lsls r1, r2, #4
	movs r2, #0x2c
	ldrsh r0, [r5, r2]
	subs r0, #0x38
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x40
	movs r2, #0xd
	bl ShowSysHandCursor
_080AD3A8:
	adds r0, r5, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080AD402
_080AD3B6:
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _080AD3C8
	ldrh r0, [r5, #0x2c]
	subs r0, #4
	strh r0, [r5, #0x2c]
_080AD3C8:
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _080AD3D6
	ldrh r0, [r5, #0x2c]
	adds r0, #4
	strh r0, [r5, #0x2c]
_080AD3D6:
	movs r0, #0xf
	ldrh r3, [r5, #0x2c]
	ands r0, r3
	cmp r0, #0
	bne _080AD3E2
	strb r0, [r1]
_080AD3E2:
	ldr r1, _080AD40C @ =0x0000FFC0
	ldrh r2, [r5, #0x2c]
	subs r2, #0x38
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl SetBgOffset
	ldrh r1, [r5, #0x2c]
	ldr r0, _080AD410 @ =0x08CE5780
	ldr r0, [r0]
	ldrh r2, [r0]
	movs r0, #7
	movs r3, #5
	bl UpdateMenuScrollBarConfig
_080AD402:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AD40C: .4byte 0x0000FFC0
_080AD410: .4byte 0x08CE5780
