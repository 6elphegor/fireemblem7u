	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08045790
sub_08045790: @ 0x08045790
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0
	ldr r6, _0804586C @ =0x0203DC9C
	ldrb r0, [r6, #2]
	str r0, [sp, #4]
	ldr r1, _08045870 @ =0x08B857F8
	ldr r0, [r1]
	ldrh r0, [r0, #6]
	movs r1, #1
	bl sub_08045354
	ldr r2, _08045874 @ =0x0202BD48
	mov sl, r2
	ldr r0, _08045878 @ =0x03001400
	mov sb, r0
	ldrb r0, [r6, #2]
	add r0, sb
	ldrb r0, [r0]
	strb r0, [r2]
	ldrb r0, [r2]
	bl GetUnit
	ldr r1, _0804587C @ =0x03004690
	str r0, [r1]
	movs r2, #0x10
	ldrsb r2, [r0, r2]
	lsls r5, r2, #4
	movs r1, #0x11
	ldrsb r1, [r0, r1]
	lsls r4, r1, #4
	adds r0, r2, #0
	bl SetMapCursorPosition
	bl GetGameTime
	subs r0, #1
	ldr r7, _08045880 @ =0x03001418
	ldr r1, [r7]
	cmp r0, r1
	bne _080457FC
	ldr r0, _08045884 @ =0x03001414
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r1, r5, r1
	asrs r5, r1, #1
	movs r1, #2
	ldrsh r0, [r0, r1]
	adds r0, r4, r0
	asrs r4, r0, #1
_080457FC:
	ldr r0, _08045884 @ =0x03001414
	strh r5, [r0]
	strh r4, [r0, #2]
	bl GetGameTime
	str r0, [r7]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	bl PutMapCursor
	ldr r2, _08045870 @ =0x08B857F8
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08045890
	ldr r0, _08045888 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08045832
	ldr r0, _0804588C @ =0x00000389
	bl m4aSongNumStart
_08045832:
	ldrb r0, [r6, #2]
	add r0, sb
	ldrb r0, [r0]
	adds r2, r6, #5
	mov r3, r8
	adds r3, #0x34
	mov r1, r8
	adds r1, #0x38
	str r1, [sp]
	movs r1, #1
	bl sub_08044C10
	ldrb r0, [r6, #5]
	add r0, sb
	ldrb r1, [r0]
	mov r0, sl
	ldrb r2, [r0]
	movs r0, #3
	movs r3, #0
	bl sub_08044B98
	bl EndLinkArenaPointsBox
	mov r0, r8
	movs r1, #7
	bl Proc_Goto
	b _08045944
	.align 2, 0
_0804586C: .4byte 0x0203DC9C
_08045870: .4byte 0x08B857F8
_08045874: .4byte 0x0202BD48
_08045878: .4byte 0x03001400
_0804587C: .4byte 0x03004690
_08045880: .4byte 0x03001418
_08045884: .4byte 0x03001414
_08045888: .4byte 0x0202BBF8
_0804588C: .4byte 0x00000389
_08045890:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080458FC
	ldr r0, _080458F0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080458AA
	ldr r0, _080458F4 @ =0x0000038B
	bl m4aSongNumStart
_080458AA:
	ldr r0, _080458F8 @ =0x03001420
	ldr r0, [r0]
	bl EndMu
	ldrb r0, [r6, #4]
	add r0, sb
	ldrb r0, [r0]
	bl GetUnit
	ldr r1, [r0, #0xc]
	movs r2, #2
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0xc]
	bl sub_08044B24
	ldrb r0, [r6, #4]
	strb r0, [r6, #2]
	adds r0, #1
	strb r0, [r6, #3]
	mov r2, sl
	ldrb r1, [r2]
	ldrb r0, [r6, #4]
	add r0, sb
	ldrb r2, [r0]
	movs r0, #2
	movs r3, #0
	bl sub_08044B98
	mov r0, r8
	movs r1, #1
	bl Proc_Goto
	b _08045944
	.align 2, 0
_080458F0: .4byte 0x0202BBF8
_080458F4: .4byte 0x0000038B
_080458F8: .4byte 0x03001420
_080458FC:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08045928
	ldr r1, _08045924 @ =0x03004690
	ldr r0, [r1]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08045928
	bl EndAllMus
	mov r0, r8
	movs r1, #6
	bl Proc_Goto
	b _08045944
	.align 2, 0
_08045924: .4byte 0x03004690
_08045928:
	ldr r0, _08045954 @ =0x0203DC9C
	ldr r2, [sp, #4]
	ldrb r0, [r0, #2]
	cmp r2, r0
	beq _08045944
	ldr r0, _08045958 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08045944
	ldr r0, _0804595C @ =0x00000385
	bl m4aSongNumStart
_08045944:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045954: .4byte 0x0203DC9C
_08045958: .4byte 0x0202BBF8
_0804595C: .4byte 0x00000385
