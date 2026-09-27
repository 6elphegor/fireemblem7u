	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A4850
sub_080A4850: @ 0x080A4850
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #5
	strb r0, [r1]
	adds r3, r4, #0
	adds r3, #0x36
	ldrb r1, [r3]
	cmp r1, #0
	bne _080A4896
	ldr r0, _080A4880 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080A4884
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r4, #0
	bl sub_080A474C
	b _080A48EE
	.align 2, 0
_080A4880: .4byte 0x08B857F8
_080A4884:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080A48EE
	adds r0, r4, #0
	movs r1, #1
	bl sub_080A474C
	b _080A48EE
_080A4896:
	ldr r0, _080A48C0 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r2, [r0, #8]
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _080A48CC
	cmp r1, #1
	beq _080A48EE
	movs r0, #1
	strb r0, [r3]
	ldr r0, _080A48C4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A48EE
	ldr r0, _080A48C8 @ =0x00000387
	bl m4aSongNumStart
	b _080A48EE
	.align 2, 0
_080A48C0: .4byte 0x08B857F8
_080A48C4: .4byte 0x0202BBF8
_080A48C8: .4byte 0x00000387
_080A48CC:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _080A48EE
	cmp r1, #2
	beq _080A48EE
	movs r0, #2
	strb r0, [r3]
	ldr r0, _080A4930 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A48EE
	ldr r0, _080A4934 @ =0x00000387
	bl m4aSongNumStart
_080A48EE:
	ldr r0, _080A4938 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r3, #1
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080A49AC
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	cmp r0, #0x20
	beq _080A4946
	cmp r0, #0x40
	bne _080A49FE
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r2, [r0]
	adds r1, r4, #0
	adds r1, #0x3a
	adds r1, r1, r2
	adds r0, r3, #0
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080A493C
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _080A4966
	b _080A4990
	.align 2, 0
_080A4930: .4byte 0x0202BBF8
_080A4934: .4byte 0x00000387
_080A4938: .4byte 0x08B857F8
_080A493C:
	movs r2, #0xed
	lsls r2, r2, #3
	movs r0, #0x40
	movs r1, #0x30
	b _080A499E
_080A4946:
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r2, [r0]
	adds r1, r4, #0
	adds r1, #0x3a
	adds r1, r1, r2
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080A4998
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080A4990
_080A4966:
	adds r0, r2, #0
	bl ReadGameSave
	adds r0, r4, #0
	movs r1, #0xe
	bl Proc_Goto
	ldr r0, _080A4988 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A49FE
	ldr r0, _080A498C @ =0x0000038A
	bl m4aSongNumStart
	b _080A49FE
	.align 2, 0
_080A4988: .4byte 0x0202BBF8
_080A498C: .4byte 0x0000038A
_080A4990:
	adds r0, r4, #0
	bl sub_080A3CAC
	b _080A49FE
_080A4998:
	ldr r2, _080A49A8 @ =0x00000767
	movs r0, #0x2e
	movs r1, #0x38
_080A499E:
	adds r3, r4, #0
	bl sub_080A4830
	b _080A49FE
	.align 2, 0
_080A49A8: .4byte 0x00000767
_080A49AC:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080A49FE
	ldr r0, _080A49E0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A49C6
	ldr r0, _080A49E4 @ =0x0000038B
	bl m4aSongNumStart
_080A49C6:
	adds r0, r4, #0
	adds r0, #0x36
	ldrb r5, [r0]
	cmp r5, #0
	beq _080A49E8
	adds r0, r4, #0
	movs r1, #0
	bl SaveMenuDrawSubSelBox
	adds r0, r4, #0
	bl SaveMenu_StartHelpBox
	b _080A49FE
	.align 2, 0
_080A49E0: .4byte 0x0202BBF8
_080A49E4: .4byte 0x0000038B
_080A49E8:
	ldr r0, _080A4A04 @ =0x084130A4
	ldr r1, _080A4A08 @ =0x06013800
	bl Decompress
	adds r0, r4, #0
	adds r0, #0x29
	strb r5, [r0]
	adds r0, r4, #0
	movs r1, #0xd
	bl Proc_Goto
_080A49FE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A4A04: .4byte 0x084130A4
_080A4A08: .4byte 0x06013800
