	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080277CC
sub_080277CC: @ 0x080277CC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, _08027844 @ =0x0202BBB8
	movs r1, #0x16
	ldrsh r0, [r4, r1]
	ldr r1, _08027848 @ =0x0202E3E4
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	mvns r1, r1
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r6, r0, #0x1f
	bl HandlePlayerMapCursor
	ldr r0, _0802784C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08027878
	cmp r6, #0
	beq _08027864
	adds r0, r5, #0
	bl Proc_Break
	ldr r1, _08027850 @ =0x0203A85C
	ldrh r0, [r4, #0x14]
	strb r0, [r1, #0x13]
	ldrh r0, [r4, #0x16]
	strb r0, [r1, #0x14]
	ldr r0, _08027854 @ =0x03004690
	ldr r0, [r0]
	bl SetStaffUseAction
	ldr r0, _08027858 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	ldr r0, _0802785C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080278F0
	ldr r0, _08027860 @ =0x0000038A
	bl m4aSongNumStart
	b _080278F0
	.align 2, 0
_08027844: .4byte 0x0202BBB8
_08027848: .4byte 0x0202E3E4
_0802784C: .4byte 0x08B857F8
_08027850: .4byte 0x0203A85C
_08027854: .4byte 0x03004690
_08027858: .4byte 0x02023C60
_0802785C: .4byte 0x0202BBF8
_08027860: .4byte 0x0000038A
_08027864:
	ldr r0, _080278F8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08027878
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_08027878:
	ldr r0, _080278FC @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080278AE
	adds r0, r5, #0
	movs r1, #0x63
	bl Proc_Goto
	ldr r0, _08027900 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	ldr r0, _080278F8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080278AE
	ldr r0, _08027904 @ =0x0000038B
	bl m4aSongNumStart
_080278AE:
	lsls r0, r6, #0x18
	asrs r3, r0, #0x18
	adds r1, r5, #0
	adds r1, #0x4a
	movs r4, #0
	ldrsh r2, [r1, r4]
	adds r4, r0, #0
	adds r6, r1, #0
	cmp r3, r2
	beq _080278D0
	ldr r0, [r5, #0x54]
	movs r1, #0
	cmp r3, #0
	bne _080278CC
	movs r1, #1
_080278CC:
	bl SetSpriteAnimId
_080278D0:
	ldr r0, [r5, #0x54]
	ldr r3, _08027908 @ =0x0202BBB8
	movs r5, #0x20
	ldrsh r1, [r3, r5]
	movs r5, #0xc
	ldrsh r2, [r3, r5]
	subs r1, r1, r2
	movs r5, #0x22
	ldrsh r2, [r3, r5]
	movs r5, #0xe
	ldrsh r3, [r3, r5]
	subs r2, r2, r3
	bl DisplaySpriteAnim
	asrs r0, r4, #0x18
	strh r0, [r6]
_080278F0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080278F8: .4byte 0x0202BBF8
_080278FC: .4byte 0x08B857F8
_08027900: .4byte 0x02023C60
_08027904: .4byte 0x0000038B
_08027908: .4byte 0x0202BBB8
