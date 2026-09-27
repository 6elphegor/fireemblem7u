	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08045558
sub_08045558: @ 0x08045558
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r1, _08045640 @ =0x081D5501
	mov r0, sp
	movs r2, #2
	bl memcpy
	ldr r0, _08045644 @ =0x0203DC9C
	mov sb, r0
	ldrb r1, [r0, #2]
	mov sl, r1
	bl sub_08045448
	ldr r4, _08045648 @ =0x08B857F8
	ldr r0, [r4]
	ldrh r0, [r0, #6]
	movs r1, #0
	bl sub_08045354
	ldr r2, _0804564C @ =0x0202BD48
	mov r8, r2
	ldr r0, _08045650 @ =0x03001400
	mov r3, sb
	ldrb r3, [r3, #2]
	adds r0, r3, r0
	ldrb r0, [r0]
	strb r0, [r2]
	ldrb r0, [r2]
	bl GetUnit
	adds r2, r0, #0
	ldr r7, _08045654 @ =0x03004690
	str r2, [r7]
	ldr r1, [r4]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0804567C
	mov r0, r8
	ldrb r0, [r0]
	lsrs r1, r0, #6
	ldr r0, _08045658 @ =0x08B98AEC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bne _08045668
	adds r0, r2, #0
	bl sub_080454C0
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	cmp r5, #1
	bne _08045668
	ldr r0, _0804565C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080455E4
	ldr r0, _08045660 @ =0x00000389
	bl m4aSongNumStart
_080455E4:
	bl EndAllMus
	ldr r0, [r7]
	bl StartMu
	ldr r4, _08045664 @ =0x03001420
	str r0, [r4]
	bl DisableMuCamera
	ldr r0, [r4]
	mov r1, sp
	bl SetMuMoveScript
	ldr r1, [r7]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	str r0, [r6, #0x2c]
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	subs r0, #1
	str r0, [r6, #0x30]
	ldr r0, [r1, #0xc]
	orrs r0, r5
	str r0, [r1, #0xc]
	bl sub_08044B24
	mov r1, sb
	ldrb r0, [r1, #2]
	strb r0, [r1, #4]
	movs r0, #0x40
	movs r1, #1
	bl sub_08045354
	mov r2, r8
	ldrb r1, [r2]
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl sub_08044B98
	adds r0, r6, #0
	movs r1, #5
	bl Proc_Goto
	b _0804575A
	.align 2, 0
_08045640: .4byte 0x081D5501
_08045644: .4byte 0x0203DC9C
_08045648: .4byte 0x08B857F8
_0804564C: .4byte 0x0202BD48
_08045650: .4byte 0x03001400
_08045654: .4byte 0x03004690
_08045658: .4byte 0x08B98AEC
_0804565C: .4byte 0x0202BBF8
_08045660: .4byte 0x00000389
_08045664: .4byte 0x03001420
_08045668:
	ldr r0, _080456AC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804567C
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_0804567C:
	ldr r2, _080456B0 @ =0x08B857F8
	ldr r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080456B8
	ldr r0, _080456B4 @ =0x03004690
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _080456B8
	bl EndAllMus
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
	b _0804575A
	.align 2, 0
_080456AC: .4byte 0x0202BBF8
_080456B0: .4byte 0x08B857F8
_080456B4: .4byte 0x03004690
_080456B8:
	ldr r1, [r2]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080456F4
	bl EndLinkArenaPointsBox
	ldr r0, _080456EC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080456E2
	movs r0, #0xe2
	lsls r0, r0, #2
	bl m4aSongNumStart
	ldr r0, _080456F0 @ =0x08B99D20
	bl sub_0800AF5C
_080456E2:
	adds r0, r6, #0
	movs r1, #2
	bl Proc_Goto
	b _0804575A
	.align 2, 0
_080456EC: .4byte 0x0202BBF8
_080456F0: .4byte 0x08B99D20
_080456F4:
	ldr r0, _0804576C @ =0x03004690
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	lsls r5, r0, #4
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r4, r1, #4
	bl SetMapCursorPosition
	bl GetGameTime
	subs r0, #1
	ldr r6, _08045770 @ =0x03001418
	ldr r1, [r6]
	cmp r0, r1
	bne _0804572A
	ldr r0, _08045774 @ =0x03001414
	movs r3, #0
	ldrsh r1, [r0, r3]
	adds r1, r5, r1
	asrs r5, r1, #1
	movs r1, #2
	ldrsh r0, [r0, r1]
	adds r0, r4, r0
	asrs r4, r0, #1
_0804572A:
	ldr r0, _08045774 @ =0x03001414
	strh r5, [r0]
	strh r4, [r0, #2]
	bl GetGameTime
	str r0, [r6]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	bl PutMapCursor
	ldr r0, _08045778 @ =0x0203DC9C
	ldrb r0, [r0, #2]
	cmp sl, r0
	beq _0804575A
	ldr r0, _0804577C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804575A
	ldr r0, _08045780 @ =0x00000385
	bl m4aSongNumStart
_0804575A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804576C: .4byte 0x03004690
_08045770: .4byte 0x03001418
_08045774: .4byte 0x03001414
_08045778: .4byte 0x0203DC9C
_0804577C: .4byte 0x0202BBF8
_08045780: .4byte 0x00000385
