	.include "macro.inc"

	.syntax unified

	thumb_func_start Loop6C_savemenu
Loop6C_savemenu: @ 0x080A39F8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #2
	strb r0, [r1]
	ldr r0, _080A3A28 @ =0x08B857F8
	ldr r3, [r0]
	ldrh r1, [r3, #6]
	movs r2, #0x40
	adds r0, r2, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _080A3A40
	adds r1, r5, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	cmp r0, #0
	beq _080A3A2C
	subs r0, #1
	b _080A3A5E
	.align 2, 0
_080A3A28: .4byte 0x08B857F8
_080A3A2C:
	adds r0, r2, #0
	ldrh r3, [r3, #8]
	ands r0, r3
	cmp r0, #0
	beq _080A3A9A
	adds r0, r5, #0
	adds r0, #0x31
	ldrb r0, [r0]
	subs r0, #1
	b _080A3A5E
_080A3A40:
	movs r6, #0x80
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080A3A9A
	adds r1, r5, #0
	adds r1, #0x2b
	ldrb r2, [r1]
	adds r0, r5, #0
	adds r0, #0x31
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	bge _080A3A7C
	adds r0, r2, #1
_080A3A5E:
	strb r0, [r1]
	ldr r0, _080A3A74 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A3A9A
	ldr r0, _080A3A78 @ =0x00000386
	bl m4aSongNumStart
	b _080A3A9A
	.align 2, 0
_080A3A74: .4byte 0x0202BBF8
_080A3A78: .4byte 0x00000386
_080A3A7C:
	adds r0, r6, #0
	ldrh r3, [r3, #8]
	ands r0, r3
	cmp r0, #0
	beq _080A3A9A
	strb r4, [r1]
	ldr r0, _080A3AF4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A3A9A
	ldr r0, _080A3AF8 @ =0x00000386
	bl m4aSongNumStart
_080A3A9A:
	ldr r0, _080A3AFC @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080A3AAA
	b _080A3C3C
_080A3AAA:
	adds r0, r5, #0
	adds r0, #0x30
	ldrb r0, [r0]
	adds r1, r5, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	bl SaveMenuIndexToValidBitfile
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r5, #0
	adds r4, #0x42
	strh r0, [r4]
	ldr r0, _080A3AF4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A3AD6
	ldr r0, _080A3B00 @ =0x0000038A
	bl m4aSongNumStart
_080A3AD6:
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	ldrh r0, [r4]
	subs r0, #1
	cmp r0, #0x1f
	bls _080A3AE8
	b _080A3C68
_080A3AE8:
	lsls r0, r0, #2
	ldr r1, _080A3B04 @ =_080A3B08
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080A3AF4: .4byte 0x0202BBF8
_080A3AF8: .4byte 0x00000386
_080A3AFC: .4byte 0x08B857F8
_080A3B00: .4byte 0x0000038A
_080A3B04: .4byte _080A3B08
_080A3B08: @ jump table
	.4byte _080A3B88 @ case 0
	.4byte _080A3B94 @ case 1
	.4byte _080A3C68 @ case 2
	.4byte _080A3BAC @ case 3
	.4byte _080A3C68 @ case 4
	.4byte _080A3C68 @ case 5
	.4byte _080A3C68 @ case 6
	.4byte _080A3BC4 @ case 7
	.4byte _080A3C68 @ case 8
	.4byte _080A3C68 @ case 9
	.4byte _080A3C68 @ case 10
	.4byte _080A3C68 @ case 11
	.4byte _080A3C68 @ case 12
	.4byte _080A3C68 @ case 13
	.4byte _080A3C68 @ case 14
	.4byte _080A3BDC @ case 15
	.4byte _080A3C68 @ case 16
	.4byte _080A3C68 @ case 17
	.4byte _080A3C68 @ case 18
	.4byte _080A3C68 @ case 19
	.4byte _080A3C68 @ case 20
	.4byte _080A3C68 @ case 21
	.4byte _080A3C68 @ case 22
	.4byte _080A3C68 @ case 23
	.4byte _080A3C68 @ case 24
	.4byte _080A3C68 @ case 25
	.4byte _080A3C68 @ case 26
	.4byte _080A3C68 @ case 27
	.4byte _080A3C68 @ case 28
	.4byte _080A3C68 @ case 29
	.4byte _080A3C68 @ case 30
	.4byte _080A3C1E @ case 31
_080A3B88:
	adds r0, r5, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	subs r0, #0x13
	strb r1, [r0]
	b _080A3BFC
_080A3B94:
	bl ReadLastGameSaveId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	movs r2, #1
	bl SaveMenuModifySaveSlot
	adds r1, r5, #0
	adds r1, #0x2c
	strb r0, [r1]
	b _080A3BFC
_080A3BAC:
	bl ReadLastGameSaveId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	movs r2, #1
	bl SaveMenuModifySaveSlot
	adds r1, r5, #0
	adds r1, #0x2c
	strb r0, [r1]
	b _080A3BFC
_080A3BC4:
	bl ReadLastGameSaveId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	movs r2, #1
	bl SaveMenuModifySaveSlot
	adds r1, r5, #0
	adds r1, #0x2c
	strb r0, [r1]
	b _080A3BFC
_080A3BDC:
	adds r4, r5, #0
	adds r4, #0x2c
	ldrb r0, [r4]
	movs r1, #0
	movs r2, #1
	bl SaveMenuModifySaveSlot
	strb r0, [r4]
	bl sub_0809E9FC
	cmp r0, #0
	bne _080A3C06
	movs r0, #0
	movs r1, #0
	bl SaveMenu_SetDifficultyChoice
_080A3BFC:
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b _080A3C68
_080A3C06:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xc0
	movs r2, #0x10
	movs r3, #0
	bl StartBgmVolumeChange
	b _080A3C68
_080A3C1E:
	adds r1, r5, #0
	adds r1, #0x34
	adds r0, r5, #0
	adds r0, #0x33
	ldrb r2, [r1]
	ldrb r0, [r0]
	cmp r2, r0
	blo _080A3C32
	movs r0, #0
	strb r0, [r1]
_080A3C32:
	adds r0, r5, #0
	movs r1, #8
	bl Proc_Goto
	b _080A3C68
_080A3C3C:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080A3C68
	ldr r0, _080A3C70 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A3C56
	ldr r0, _080A3C74 @ =0x0000038B
	bl m4aSongNumStart
_080A3C56:
	adds r0, r5, #0
	movs r1, #0x12
	bl Proc_Goto
	adds r1, r5, #0
	adds r1, #0x42
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
_080A3C68:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A3C70: .4byte 0x0202BBF8
_080A3C74: .4byte 0x0000038B
