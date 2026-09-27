	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A3E98
sub_080A3E98: @ 0x080A3E98
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #5
	strb r0, [r1]
	adds r0, r5, #0
	bl SaveMenuPostChapterHandleHelpBox
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A3EB2
	b _080A40E4
_080A3EB2:
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r1, [r0]
	adds r4, r0, #0
	cmp r1, #0
	bne _080A3F0C
	ldr r0, _080A3ED4 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080A3ED8
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r5, #0
	b _080A3EE4
	.align 2, 0
_080A3ED4: .4byte 0x08B857F8
_080A3ED8:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080A3F70
	adds r0, r5, #0
	movs r1, #1
_080A3EE4:
	bl SaveMenuTryMoveSaveSlotCursor
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A3F70
	ldr r0, _080A3F04 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A3F70
	ldr r0, _080A3F08 @ =0x00000386
	bl m4aSongNumStart
	b _080A3F70
	.align 2, 0
_080A3F04: .4byte 0x0202BBF8
_080A3F08: .4byte 0x00000386
_080A3F0C:
	ldr r0, _080A3F3C @ =0x08B857F8
	ldr r0, [r0]
	ldrh r2, [r0, #8]
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _080A3F48
	cmp r1, #1
	beq _080A3F70
	movs r0, #1
	strb r0, [r4]
	ldr r0, _080A3F40 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A3F34
	ldr r0, _080A3F44 @ =0x00000387
	bl m4aSongNumStart
_080A3F34:
	adds r0, r5, #0
	bl SaveMenu_StartHelpBox
	b _080A3F70
	.align 2, 0
_080A3F3C: .4byte 0x08B857F8
_080A3F40: .4byte 0x0202BBF8
_080A3F44: .4byte 0x00000387
_080A3F48:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _080A3F70
	cmp r1, #2
	beq _080A3F70
	movs r0, #2
	strb r0, [r4]
	ldr r0, _080A3FA4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A3F6A
	ldr r0, _080A3FA8 @ =0x00000387
	bl m4aSongNumStart
_080A3F6A:
	adds r0, r5, #0
	bl SaveMenu_StartHelpBox
_080A3F70:
	ldr r0, _080A3FAC @ =0x08B857F8
	ldr r0, [r0]
	ldrh r2, [r0, #8]
	movs r1, #1
	ands r1, r2
	cmp r1, #0
	beq _080A4060
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #8
	beq _080A4028
	cmp r0, #8
	bgt _080A3FB6
	cmp r0, #2
	beq _080A3FCA
	cmp r0, #2
	bgt _080A3FB0
	cmp r0, #1
	beq _080A3FE8
	b _080A40E4
	.align 2, 0
_080A3FA4: .4byte 0x0202BBF8
_080A3FA8: .4byte 0x00000387
_080A3FAC: .4byte 0x08B857F8
_080A3FB0:
	cmp r0, #4
	beq _080A4028
	b _080A40E4
_080A3FB6:
	cmp r0, #0x40
	beq _080A4028
	cmp r0, #0x40
	bgt _080A3FC4
	cmp r0, #0x10
	beq _080A400C
	b _080A40E4
_080A3FC4:
	cmp r0, #0x80
	beq _080A3FD6
	b _080A40E4
_080A3FCA:
	adds r0, r5, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080A4028
	b _080A3FE8
_080A3FD6:
	adds r0, r5, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _080A3FE8
	adds r1, r5, #0
	adds r1, #0x44
	movs r0, #0xf0
	strh r0, [r1]
_080A3FE8:
	ldr r0, _080A4004 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A3FFA
	ldr r0, _080A4008 @ =0x0000038A
	bl m4aSongNumStart
_080A3FFA:
	adds r0, r5, #0
	bl SaveMenu_HandleExtraMiscOption
	b _080A40E4
	.align 2, 0
_080A4004: .4byte 0x0202BBF8
_080A4008: .4byte 0x0000038A
_080A400C:
	adds r0, r5, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _080A4038
	ldr r0, _080A4030 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A4028
	ldr r0, _080A4034 @ =0x0000038A
	bl m4aSongNumStart
_080A4028:
	adds r0, r5, #0
	bl sub_080A3CAC
	b _080A40E4
	.align 2, 0
_080A4030: .4byte 0x0202BBF8
_080A4034: .4byte 0x0000038A
_080A4038:
	adds r0, r5, #0
	bl SaveMenuWriteNewGame
	adds r0, r5, #0
	movs r1, #6
	bl Proc_Goto
	ldr r0, _080A405C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A40E4
	movs r0, #0xe0
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _080A40E4
	.align 2, 0
_080A405C: .4byte 0x0202BBF8
_080A4060:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080A40E4
	adds r0, r5, #0
	adds r0, #0x29
	strb r1, [r0]
	ldr r0, _080A4098 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A4080
	ldr r0, _080A409C @ =0x0000038B
	bl m4aSongNumStart
_080A4080:
	ldrb r0, [r4]
	cmp r0, #0
	beq _080A40A0
	adds r0, r5, #0
	movs r1, #0
	bl SaveMenuDrawSubSelBox
	adds r0, r5, #0
	bl SaveMenu_StartHelpBox
	b _080A40E4
	.align 2, 0
_080A4098: .4byte 0x0202BBF8
_080A409C: .4byte 0x0000038B
_080A40A0:
	adds r2, r5, #0
	adds r2, #0x2d
	ldrb r1, [r2]
	adds r0, r1, #0
	cmp r0, #0xff
	beq _080A40B8
	adds r0, r5, #0
	adds r0, #0x2c
	strb r1, [r0]
	movs r0, #0xff
	strb r0, [r2]
	b _080A40E4
_080A40B8:
	adds r4, r5, #0
	adds r4, #0x42
	movs r0, #0xc0
	ldrh r1, [r4]
	ands r0, r1
	cmp r0, #0
	beq _080A40DC
	adds r0, r5, #0
	movs r1, #0x11
	bl Proc_Goto
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	ldrh r1, [r4]
	orrs r0, r1
	strh r0, [r4]
	b _080A40E4
_080A40DC:
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
_080A40E4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
