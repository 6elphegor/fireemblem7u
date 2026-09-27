	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08095528
sub_08095528: @ 0x08095528
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r7, [r4, #0x3c]
	ldr r0, _08095580 @ =0x0000A580
	str r0, [sp]
	movs r0, #0x7e
	movs r1, #0x64
	movs r2, #0xd
	movs r3, #4
	bl PrepItemDrawPopupBox
	ldr r5, _08095584 @ =0x08B857F8
	ldr r1, [r5]
	ldrh r3, [r1, #8]
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _08095590
	ldr r1, [r4, #0x30]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
	movs r0, #0
	bl DisableUiCursorHand
	bl PrepItemUseClearSubBox
	ldr r0, _08095588 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080955F6
	ldr r0, _0809558C @ =0x0000038B
	bl m4aSongNumStart
	b _080955F6
	.align 2, 0
_08095580: .4byte 0x0000A580
_08095584: .4byte 0x08B857F8
_08095588: .4byte 0x0202BBF8
_0809558C: .4byte 0x0000038B
_08095590:
	movs r6, #1
	adds r2, r6, #0
	ands r2, r3
	cmp r2, #0
	beq _08095608
	bl PrepItemUseClearSubBox
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	bne _080955CC
	bl HideSysHandCursor
	ldr r0, _080955C4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080955BA
	ldr r0, _080955C8 @ =0x0000038A
	bl m4aSongNumStart
_080955BA:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _0809564A
	.align 2, 0
_080955C4: .4byte 0x0202BBF8
_080955C8: .4byte 0x0000038A
_080955CC:
	ldr r1, [r4, #0x30]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
	ldr r0, _08095600 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080955F0
	ldr r0, _08095604 @ =0x0000038B
	bl m4aSongNumStart
_080955F0:
	movs r0, #0
	bl DisableUiCursorHand
_080955F6:
	adds r0, r4, #0
	bl Proc_Break
	b _0809564A
	.align 2, 0
_08095600: .4byte 0x0202BBF8
_08095604: .4byte 0x0000038B
_08095608:
	movs r0, #0x20
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _08095614
	str r2, [r4, #0x3c]
_08095614:
	ldr r1, [r5]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _08095622
	str r6, [r4, #0x3c]
_08095622:
	ldr r0, [r4, #0x3c]
	cmp r7, r0
	beq _0809564A
	lsls r0, r0, #5
	adds r0, #0x8c
	movs r3, #0x80
	lsls r3, r3, #4
	movs r1, #0x78
	movs r2, #0
	bl ShowSysHandCursor
	ldr r0, _08095654 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809564A
	ldr r0, _08095658 @ =0x00000387
	bl m4aSongNumStart
_0809564A:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08095654: .4byte 0x0202BBF8
_08095658: .4byte 0x00000387
