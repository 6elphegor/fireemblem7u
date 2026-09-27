	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A45A0
sub_080A45A0: @ 0x080A45A0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x34
	ldrb r7, [r2]
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #0xa
	strb r0, [r1]
	ldr r0, _080A45E4 @ =0x08B857F8
	ldr r3, [r0]
	ldrh r1, [r3, #6]
	movs r6, #0x40
	adds r0, r6, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _080A45E8
	ldrb r0, [r2]
	cmp r0, #0
	bne _080A45DE
	adds r0, r6, #0
	ldrh r3, [r3, #8]
	ands r0, r3
	cmp r0, #0
	beq _080A4612
	adds r0, r4, #0
	adds r0, #0x33
	ldrb r0, [r0]
_080A45DE:
	subs r0, #1
	strb r0, [r2]
	b _080A4612
	.align 2, 0
_080A45E4: .4byte 0x08B857F8
_080A45E8:
	movs r6, #0x80
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080A4612
	ldrb r1, [r2]
	adds r0, r4, #0
	adds r0, #0x33
	ldrb r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge _080A4606
	adds r0, r1, #1
	strb r0, [r2]
	b _080A4612
_080A4606:
	adds r0, r6, #0
	ldrh r3, [r3, #8]
	ands r0, r3
	cmp r0, #0
	beq _080A4612
	strb r5, [r2]
_080A4612:
	adds r0, r4, #0
	adds r0, #0x34
	adds r5, r0, #0
	ldrb r0, [r5]
	cmp r7, r0
	beq _080A4630
	ldr r0, _080A4680 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A4630
	ldr r0, _080A4684 @ =0x00000386
	bl m4aSongNumStart
_080A4630:
	ldr r0, _080A4688 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r2, [r0, #8]
	movs r1, #1
	ands r1, r2
	cmp r1, #0
	beq _080A4712
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	ldrb r1, [r5]
	bl SaveMenuIndexToValidBitfile
	adds r5, r4, #0
	adds r5, #0x35
	movs r6, #0
	strb r0, [r5]
	ldr r0, _080A4680 @ =0x0202BBF8
	adds r7, r0, #0
	adds r7, #0x41
	ldrb r1, [r7]
	lsls r0, r1, #0x1e
	cmp r0, #0
	blt _080A4666
	ldr r0, _080A468C @ =0x0000038A
	bl m4aSongNumStart
_080A4666:
	adds r0, r4, #0
	adds r0, #0x29
	strb r6, [r0]
	ldrb r0, [r5]
	cmp r0, #8
	beq _080A46DE
	cmp r0, #8
	bgt _080A4690
	cmp r0, #2
	beq _080A46D4
	cmp r0, #4
	beq _080A46E8
	b _080A4702
	.align 2, 0
_080A4680: .4byte 0x0202BBF8
_080A4684: .4byte 0x00000386
_080A4688: .4byte 0x08B857F8
_080A468C: .4byte 0x0000038A
_080A4690:
	cmp r0, #0x20
	beq _080A4698
	cmp r0, #0x40
	bne _080A4702
_080A4698:
	bl ReadLastGameSaveId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	movs r2, #1
	bl SaveMenuModifySaveSlot
	adds r1, r4, #0
	adds r1, #0x2c
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0
	bl sub_080A474C
	ldrb r7, [r7]
	lsls r0, r7, #0x1e
	cmp r0, #0
	blt _080A46C4
	ldr r0, _080A46D0 @ =0x0000038A
	bl m4aSongNumStart
_080A46C4:
	adds r0, r4, #0
	movs r1, #0xc
	bl Proc_Goto
	b _080A473A
	.align 2, 0
_080A46D0: .4byte 0x0000038A
_080A46D4:
	str r6, [sp]
	movs r0, #0
	movs r1, #0xc0
	movs r2, #0
	b _080A46F2
_080A46DE:
	movs r2, #0x80
	lsls r2, r2, #1
	str r6, [sp]
	movs r0, #0x29
	b _080A46F0
_080A46E8:
	movs r2, #0x80
	lsls r2, r2, #1
	str r6, [sp]
	movs r0, #0x30
_080A46F0:
	movs r1, #0xc0
_080A46F2:
	movs r3, #0x18
	bl CallSomeSoundMaybe
	adds r0, r4, #0
	movs r1, #0xe
	bl Proc_Goto
	b _080A473A
_080A4702:
	adds r0, r4, #0
	bl SaveMenu_HandleExtraMiscOption
	adds r0, r4, #0
	movs r1, #0x12
	bl Proc_Goto
	b _080A473A
_080A4712:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080A473A
	adds r0, r4, #0
	adds r0, #0x29
	strb r1, [r0]
	adds r0, r4, #0
	movs r1, #9
	bl Proc_Goto
	ldr r0, _080A4744 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A473A
	ldr r0, _080A4748 @ =0x0000038B
	bl m4aSongNumStart
_080A473A:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A4744: .4byte 0x0202BBF8
_080A4748: .4byte 0x0000038B
