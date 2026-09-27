	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08091AD8
sub_08091AD8: @ 0x08091AD8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	mov r2, r8
	adds r2, #0x29
	ldrb r7, [r2]
	ldr r0, _08091BB4 @ =0x08B857F8
	ldr r1, [r0]
	ldrh r5, [r1, #6]
	mov r3, r8
	adds r3, #0x30
	movs r0, #4
	strb r0, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r4, [r1, #4]
	ands r0, r4
	cmp r0, #0
	beq _08091B06
	ldrh r5, [r1, #4]
	movs r0, #8
	strb r0, [r3]
_08091B06:
	movs r0, #0x40
	ands r0, r5
	cmp r0, #0
	beq _08091B18
	ldrb r0, [r2]
	subs r0, #3
	cmp r0, #0
	blt _08091B18
	strb r0, [r2]
_08091B18:
	movs r0, #0x80
	ands r0, r5
	mov r6, r8
	adds r6, #0x29
	cmp r0, #0
	beq _08091B36
	ldrb r4, [r6]
	adds r4, #3
	bl PrepGetUnitAmount
	cmp r4, r0
	bge _08091B36
	ldrb r0, [r6]
	adds r0, #3
	strb r0, [r6]
_08091B36:
	movs r0, #0x20
	ands r0, r5
	cmp r0, #0
	beq _08091B52
	ldrb r4, [r6]
	adds r0, r4, #0
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08091B52
	subs r0, r4, #1
	strb r0, [r6]
_08091B52:
	movs r0, #0x10
	ands r5, r0
	cmp r5, #0
	beq _08091B7C
	ldrb r4, [r6]
	adds r0, r4, #0
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08091B7C
	adds r4, #1
	bl PrepGetUnitAmount
	cmp r4, r0
	bge _08091B7C
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
_08091B7C:
	ldrb r0, [r6]
	cmp r0, r7
	beq _08091C3C
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x14
	bl PrepGetUnitAmount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	lsls r2, r0, #4
	mov r0, r8
	ldrh r1, [r0, #0x32]
	subs r0, r4, r1
	cmp r0, #0x20
	ble _08091BB8
	adds r0, r1, #0
	adds r0, #0x30
	cmp r0, r2
	bge _08091BB8
	lsrs r1, r1, #4
	adds r1, #4
	b _08091BCC
	.align 2, 0
_08091BB4: .4byte 0x08B857F8
_08091BB8:
	mov r1, r8
	ldrh r0, [r1, #0x32]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r1, #0xf
	bgt _08091BEC
	cmp r7, #0
	beq _08091BEC
	lsrs r1, r7, #4
	subs r1, #1
_08091BCC:
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r0, r8
	movs r2, #0
	bl sub_08092B6C
	ldrb r0, [r6]
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x12
	adds r0, #0x18
	bl SetSysHandCursorXPos
	b _08091C1C
_08091BEC:
	ldrb r5, [r6]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x14
	subs r0, r7, #4
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r4, #0
	movs r2, #7
	bl ShowSysHandCursor
_08091C1C:
	ldr r0, _08091C34 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08091C2E
	ldr r0, _08091C38 @ =0x00000385
	bl m4aSongNumStart
_08091C2E:
	movs r0, #1
	b _08091C3E
	.align 2, 0
_08091C34: .4byte 0x0202BBF8
_08091C38: .4byte 0x00000385
_08091C3C:
	movs r0, #0
_08091C3E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_08091C48
sub_08091C48: @ 0x08091C48
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x14
	bl PrepGetUnitAmount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	lsls r2, r0, #4
	ldrh r1, [r6, #0x32]
	subs r0, r7, r1
	cmp r0, #0x20
	ble _08091CE8
	adds r0, r1, #0
	adds r0, #0x30
	cmp r0, r2
	bge _08091CE8
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r0, [r0]
	adds r2, r0, r1
	strh r2, [r6, #0x32]
	ldr r1, _08091D6C @ =0x0000FFD8
	subs r2, #4
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl SetBgOffset
	adds r1, r6, #0
	adds r1, #0x2a
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _08091CC8
	adds r5, r0, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x14
	ldrh r0, [r6, #0x32]
	subs r0, #4
	subs r2, r2, r0
	movs r0, #0
	adds r1, r4, #0
	movs r3, #2
	bl SetUiCursorHandConfig
_08091CC8:
	ldrh r4, [r6, #0x32]
	bl PrepGetUnitAmount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #6
	adds r1, r4, #0
	movs r3, #4
	bl UpdateMenuScrollBarConfig
_08091CE8:
	ldrh r2, [r6, #0x32]
	subs r0, r7, r2
	cmp r0, #0xf
	bgt _08091D64
	cmp r2, #0
	beq _08091D64
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r0, [r0]
	subs r2, r2, r0
	strh r2, [r6, #0x32]
	ldr r1, _08091D6C @ =0x0000FFD8
	subs r2, #4
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl SetBgOffset
	adds r1, r6, #0
	adds r1, #0x2a
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _08091D44
	adds r5, r0, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x14
	ldrh r0, [r6, #0x32]
	subs r0, #4
	subs r2, r2, r0
	movs r0, #0
	adds r1, r4, #0
	movs r3, #2
	bl SetUiCursorHandConfig
_08091D44:
	ldrh r4, [r6, #0x32]
	bl PrepGetUnitAmount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #6
	adds r1, r4, #0
	movs r3, #4
	bl UpdateMenuScrollBarConfig
_08091D64:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08091D6C: .4byte 0x0000FFD8

	thumb_func_start PrepItemScreen_StartStatScreen
PrepItemScreen_StartStatScreen: @ 0x08091D70
	push {r4, lr}
	adds r4, r0, #0
	bl PrepItemScreen_OnEnd
	movs r0, #0x31
	bl SetStatScreenExcludedUnitFlags
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r1, r4, #0
	bl StartStatScreen
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PrepItemScreen_ResumeFromStatScreen
PrepItemScreen_ResumeFromStatScreen: @ 0x08091D9C
	push {r4, lr}
	adds r4, r0, #0
	bl PrepItemScreen_SetupGfx
	bl GetLatestUnitIndexInPrepListByUId
	adds r1, r4, #0
	adds r1, #0x29
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_08092AE4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08091DBC
sub_08091DBC: @ 0x08091DBC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0xf
	ldrh r1, [r6, #0x32]
	ands r0, r1
	cmp r0, #0
	beq _08091DCE
	b _08091EEA
_08091DCE:
	ldr r0, _08091DE8 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08091DEC
	adds r0, r6, #0
	bl Proc_Break
	b _08091EF0
	.align 2, 0
_08091DE8: .4byte 0x08B857F8
_08091DEC:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08091E7C
	adds r4, r6, #0
	adds r4, #0x29
	ldrb r0, [r4]
	adds r5, r6, #0
	adds r5, #0x2a
	strb r0, [r5]
	ldrb r7, [r4]
	adds r0, r7, #0
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08091E22
	bl PrepGetUnitAmount
	subs r0, #1
	cmp r7, r0
	bge _08091E22
	ldrb r0, [r4]
	adds r0, #1
	b _08091E26
_08091E22:
	ldrb r0, [r4]
	subs r0, #1
_08091E26:
	strb r0, [r4]
	ldrb r5, [r5]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x14
	ldrh r0, [r6, #0x32]
	subs r0, #4
	subs r2, r2, r0
	movs r0, #0
	adds r1, r4, #0
	movs r3, #2
	bl SetUiCursorHandConfig
	adds r0, r6, #0
	movs r1, #2
	bl Proc_Goto
	ldr r0, _08091E74 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08091EF0
	ldr r0, _08091E78 @ =0x0000038A
	bl m4aSongNumStart
	b _08091EF0
	.align 2, 0
_08091E74: .4byte 0x0202BBF8
_08091E78: .4byte 0x0000038A
_08091E7C:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08091EA8
	adds r0, r6, #0
	movs r1, #0xc
	bl Proc_Goto
	ldr r0, _08091EA0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08091EF0
	ldr r0, _08091EA4 @ =0x0000038B
	bl m4aSongNumStart
	b _08091EF0
	.align 2, 0
_08091EA0: .4byte 0x0202BBF8
_08091EA4: .4byte 0x0000038B
_08091EA8:
	adds r0, r6, #0
	bl sub_08091AD8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08091EEA
	adds r7, r6, #0
	adds r7, #0x29
	ldrb r0, [r7]
	bl GetUnitFromPrepList
	adds r1, r0, #0
	ldr r0, _08091EF8 @ =0x00000503
	str r0, [sp]
	movs r0, #0
	movs r2, #0x44
	movs r3, #0x4e
	bl UpdatePrepItemScreenFace
	ldr r4, _08091EFC @ =0x02012A20
	ldr r5, _08091F00 @ =0x02022EA4
	ldrb r0, [r7]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #2
	bl sub_080929D0
	movs r0, #1
	bl EnableBgSync
_08091EEA:
	adds r0, r6, #0
	bl sub_08091C48
_08091EF0:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08091EF8: .4byte 0x00000503
_08091EFC: .4byte 0x02012A20
_08091F00: .4byte 0x02022EA4

	thumb_func_start sub_08091F04
sub_08091F04: @ 0x08091F04
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	adds r6, r1, #0
	mov r8, r2
	adds r0, r6, #0
	movs r1, #0xa
	movs r2, #6
	movs r3, #0
	bl TmFillRect_t
	ldr r4, _08091FFC @ =0x02012A70
	adds r0, r4, #0
	bl ClearText
	adds r7, r4, #0
	adds r7, #8
	adds r0, r7, #0
	bl ClearText
	bl PrepGetUnitAmount
	movs r5, #0
	cmp r0, #1
	bgt _08091F3C
	movs r5, #1
_08091F3C:
	ldr r0, _08092000 @ =0x0000125D
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	adds r2, r5, #0
	bl Text_InsertDrawString
	bl PrepGetUnitAmount
	movs r5, #0
	cmp r0, #1
	bgt _08091F5A
	movs r5, #1
_08091F5A:
	ldr r0, _08092004 @ =0x0000125E
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x20
	adds r2, r5, #0
	bl Text_InsertDrawString
	adds r1, r6, #0
	adds r1, #0x40
	adds r0, r4, #0
	bl PutText
	mov r0, r8
	bl sub_080912EC
	movs r4, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08091F86
	movs r4, #1
_08091F86:
	ldr r0, _08092008 @ =0x0000125F
	bl GetMsg
	adds r3, r0, #0
	adds r0, r7, #0
	movs r1, #0
	adds r2, r4, #0
	bl Text_InsertDrawString
	adds r5, r7, #0
	movs r4, #0
	mov r0, sb
	adds r0, #0x2b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08091FBE
	mov r0, r8
	bl GetUnitItemCount
	cmp r0, #0
	ble _08091FBE
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08091FC0
_08091FBE:
	movs r4, #1
_08091FC0:
	movs r0, #0x93
	lsls r0, r0, #5
	bl GetMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x20
	adds r2, r4, #0
	bl Text_InsertDrawString
	ldr r4, _0809200C @ =0x02012A78
	adds r1, r6, #0
	adds r1, #0xc0
	adds r0, r4, #0
	bl PutText
	adds r4, #8
	movs r0, #0xa0
	lsls r0, r0, #1
	adds r1, r6, r0
	adds r0, r4, #0
	bl PutText
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08091FFC: .4byte 0x02012A70
_08092000: .4byte 0x0000125D
_08092004: .4byte 0x0000125E
_08092008: .4byte 0x0000125F
_0809200C: .4byte 0x02012A78

	thumb_func_start sub_08092010
sub_08092010: @ 0x08092010
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r5, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	mov r8, r0
	adds r1, r5, #0
	adds r1, #0x31
	movs r0, #1
	strb r0, [r1]
	ldr r0, _080920F8 @ =0x02023460
	ldr r1, _080920FC @ =0x08407188
	movs r2, #0xa6
	lsls r2, r2, #7
	bl sub_080AACD8
	movs r4, #0
_0809203A:
	ldrh r1, [r5, #0x32]
	lsrs r0, r1, #3
	adds r0, r0, r4
	movs r1, #0x1f
	ands r0, r1
	adds r0, #4
	lsls r0, r0, #6
	ldr r1, _08092100 @ =0x02023C60
	adds r0, r0, r1
	movs r1, #9
	movs r2, #0
	movs r3, #0
	bl TmFillRect_t
	adds r4, #1
	cmp r4, #7
	ble _0809203A
	mov r0, r8
	bl GetUnitFid
	ldr r7, _08092104 @ =0x02022D66
	movs r2, #0x9c
	lsls r2, r2, #2
	movs r6, #0
	str r6, [sp]
	adds r1, r7, #0
	movs r3, #2
	bl PutFaceChibi
	ldr r5, _08092108 @ =0x02012A98
	adds r0, r5, #0
	bl ClearText
	mov r1, r8
	ldr r0, [r1]
	ldrh r0, [r0]
	bl GetMsg
	adds r4, r0, #0
	movs r0, #0x28
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	adds r1, r7, #0
	adds r1, #0xa
	str r6, [sp]
	str r4, [sp, #4]
	adds r0, r5, #0
	movs r2, #0
	bl PutDrawText
	adds r0, r7, #0
	adds r0, #0x8a
	movs r1, #3
	movs r2, #0x24
	bl PutSpecialChar
	adds r0, r7, #0
	adds r0, #0x8c
	movs r1, #3
	movs r2, #0x25
	bl PutSpecialChar
	adds r0, r7, #0
	adds r0, #0x92
	movs r1, #3
	movs r2, #0x1d
	bl PutSpecialChar
	adds r0, r7, #0
	adds r0, #0x90
	mov r1, r8
	movs r2, #8
	ldrsb r2, [r1, r2]
	movs r1, #2
	bl PutNumberOrBlank
	adds r0, r7, #0
	adds r0, #0x96
	mov r1, r8
	ldrb r2, [r1, #9]
	movs r1, #2
	bl PutNumberOrBlank
	movs r0, #7
	bl EnableBgSync
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080920F8: .4byte 0x02023460
_080920FC: .4byte 0x08407188
_08092100: .4byte 0x02023C60
_08092104: .4byte 0x02022D66
_08092108: .4byte 0x02012A98

	thumb_func_start sub_0809210C
sub_0809210C: @ 0x0809210C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _08092174 @ =0x02022EBE
	movs r1, #0xc
	movs r2, #0x14
	movs r3, #0
	bl TmFillRect_t
	movs r0, #0xc0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_08091944
	movs r0, #0xc0
	lsls r0, r0, #6
	movs r1, #0xa
	bl sub_08091994
	adds r0, r6, #0
	bl sub_08092010
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r5, [r0]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x14
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x14
	ldrh r0, [r6, #0x32]
	subs r0, #4
	subs r1, r1, r0
	adds r0, r4, #0
	bl sub_08092C34
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08092178
	bl BlockUiCursorHand
	b _0809217C
	.align 2, 0
_08092174: .4byte 0x02022EBE
_08092178:
	bl UnblockUiCursorHand
_0809217C:
	bl sub_08091914
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_0809218C
sub_0809218C: @ 0x0809218C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _080921E0 @ =0x02022EC4
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08091F04
	ldr r0, _080921E4 @ =sub_080918F4
	adds r1, r4, #0
	bl StartParallelWorker
	movs r0, #0xc9
	movs r1, #0x7b
	adds r2, r4, #0
	bl StartHelpPromptSprite
	adds r4, #0x2d
	ldrb r1, [r4]
	movs r0, #1
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0x88
	lsrs r1, r1, #1
	lsls r1, r1, #4
	adds r1, #0x54
	movs r3, #0x80
	lsls r3, r3, #3
	movs r2, #3
	bl ShowSysHandCursor
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080921E0: .4byte 0x02022EC4
_080921E4: .4byte sub_080918F4

	thumb_func_start sub_080921E8
sub_080921E8: @ 0x080921E8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r5, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl sub_08092ED4
	ldr r0, _08092218 @ =0x02012A20
	ldr r1, _0809221C @ =0x02022EA4
	adds r2, r5, #0
	movs r3, #0
	bl sub_080929D0
	movs r0, #4
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08092218: .4byte 0x02012A20
_0809221C: .4byte 0x02022EA4

	thumb_func_start sub_08092220
sub_08092220: @ 0x08092220
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r2, r5, #0
	adds r2, #0x2d
	ldrb r7, [r2]
	adds r4, r5, #0
	adds r4, #0x2c
	ldrb r0, [r4]
	cmp r0, #0xff
	beq _08092236
	b _08092444
_08092236:
	ldr r0, _08092268 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08092270
	strb r7, [r4]
	ldrb r1, [r2]
	movs r0, #1
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0x88
	lsrs r1, r1, #1
	lsls r1, r1, #4
	adds r1, #0x54
	ldr r3, _0809226C @ =0x08CC4430
	ldrb r2, [r2]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl StartHelpBox
	b _08092564
	.align 2, 0
_08092268: .4byte 0x08B857F8
_0809226C: .4byte 0x08CC4430
_08092270:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0809227A
	b _08092400
_0809227A:
	cmp r7, #5
	bls _08092280
	b _080923E4
_08092280:
	lsls r0, r7, #2
	ldr r1, _0809228C @ =_08092290
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809228C: .4byte _08092290
_08092290: @ jump table
	.4byte _080922A8 @ case 0
	.4byte _080922BC @ case 1
	.4byte _080922D0 @ case 2
	.4byte _080922F0 @ case 3
	.4byte _08092324 @ case 4
	.4byte _0809233C @ case 5
_080922A8:
	bl PrepGetUnitAmount
	cmp r0, #1
	bgt _080922B2
	b _080923E4
_080922B2:
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
	b _080923BC
_080922BC:
	bl PrepGetUnitAmount
	cmp r0, #1
	bgt _080922C6
	b _080923E4
_080922C6:
	adds r0, r5, #0
	movs r1, #8
	bl Proc_Goto
	b _080923BC
_080922D0:
	adds r0, r5, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	bl sub_080912EC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080922E6
	b _080923E4
_080922E6:
	adds r0, r5, #0
	movs r1, #9
	bl Proc_Goto
	b _080923BC
_080922F0:
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080923E4
	adds r0, r5, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	bl GetUnitItemCount
	cmp r0, #0
	ble _080923E4
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080923E4
	adds r0, r5, #0
	movs r1, #0xb
	bl Proc_Goto
	b _080923BC
_08092324:
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080923E4
	adds r0, r5, #0
	movs r1, #0xa
	bl Proc_Goto
	b _080923BC
_0809233C:
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809236C
	adds r0, r5, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	ldr r0, [r0, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _0809236C
	subs r1, #9
	ldr r2, _08092368 @ =0x000003AE
	adds r0, r1, #0
	adds r3, r5, #0
	bl StartPrepErrorHelpbox
	b _08092564
	.align 2, 0
_08092368: .4byte 0x000003AE
_0809236C:
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080923E4
	adds r6, r5, #0
	adds r6, #0x2a
	ldrb r0, [r6]
	bl GetUnitFromPrepList
	bl PrepItemScreen_GiveAll
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080923E4
	ldr r4, _080923D4 @ =0x02022EC4
	ldrb r0, [r6]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08091F04
	ldr r5, _080923D8 @ =0x02012A20
	subs r4, #0x20
	ldrb r0, [r6]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r3, #0
	bl sub_080929D0
	movs r0, #1
	bl EnableBgSync
_080923BC:
	ldr r0, _080923DC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080923CA
	b _08092564
_080923CA:
	ldr r0, _080923E0 @ =0x0000038A
	bl m4aSongNumStart
	b _08092564
	.align 2, 0
_080923D4: .4byte 0x02022EC4
_080923D8: .4byte 0x02012A20
_080923DC: .4byte 0x0202BBF8
_080923E0: .4byte 0x0000038A
_080923E4:
	ldr r0, _080923FC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080923F2
	b _08092564
_080923F2:
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _08092564
	.align 2, 0
_080923FC: .4byte 0x0202BBF8
_08092400:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809245C
	adds r2, r5, #0
	adds r2, #0x2a
	ldrb r0, [r2]
	adds r1, r5, #0
	adds r1, #0x29
	strb r0, [r1]
	movs r0, #0xff
	strb r0, [r2]
	movs r0, #0
	bl DisableUiCursorHand
	ldr r0, _0809243C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08092430
	ldr r0, _08092440 @ =0x0000038B
	bl m4aSongNumStart
_08092430:
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	b _08092564
	.align 2, 0
_0809243C: .4byte 0x0202BBF8
_08092440: .4byte 0x0000038B
_08092444:
	ldr r0, _08092480 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0809245C
	bl CloseHelpBox
	movs r0, #0xff
	strb r0, [r4]
_0809245C:
	ldr r1, _08092480 @ =0x08B857F8
	ldr r3, [r1]
	movs r6, #0x20
	adds r0, r6, #0
	ldrh r2, [r3, #6]
	ands r0, r2
	adds r4, r5, #0
	adds r4, #0x2d
	cmp r0, #0
	beq _08092492
	ldrb r2, [r4]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08092484
	subs r0, r2, #1
	b _08092490
	.align 2, 0
_08092480: .4byte 0x08B857F8
_08092484:
	adds r0, r6, #0
	ldrh r3, [r3, #8]
	ands r0, r3
	cmp r0, #0
	beq _08092492
	adds r0, r2, #1
_08092490:
	strb r0, [r4]
_08092492:
	ldr r3, [r1]
	movs r6, #0x10
	adds r0, r6, #0
	ldrh r2, [r3, #6]
	ands r0, r2
	cmp r0, #0
	beq _080924BC
	ldrb r2, [r4]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	bne _080924AE
	adds r0, r2, #1
	b _080924BA
_080924AE:
	adds r0, r6, #0
	ldrh r3, [r3, #8]
	ands r0, r3
	cmp r0, #0
	beq _080924BC
	subs r0, r2, #1
_080924BA:
	strb r0, [r4]
_080924BC:
	ldr r3, [r1]
	movs r6, #0x40
	adds r0, r6, #0
	ldrh r2, [r3, #6]
	ands r0, r2
	cmp r0, #0
	beq _080924E2
	ldrb r2, [r4]
	cmp r2, #1
	bls _080924D4
	subs r0, r2, #2
	b _080924E0
_080924D4:
	adds r0, r6, #0
	ldrh r3, [r3, #8]
	ands r0, r3
	cmp r0, #0
	beq _080924E2
	adds r0, r2, #4
_080924E0:
	strb r0, [r4]
_080924E2:
	ldr r1, [r1]
	movs r3, #0x80
	adds r0, r3, #0
	ldrh r2, [r1, #6]
	ands r0, r2
	cmp r0, #0
	beq _08092508
	ldrb r2, [r4]
	cmp r2, #3
	bhi _080924FA
	adds r0, r2, #2
	b _08092506
_080924FA:
	adds r0, r3, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08092508
	subs r0, r2, #4
_08092506:
	strb r0, [r4]
_08092508:
	ldrb r0, [r4]
	cmp r7, r0
	beq _08092564
	ldr r0, _0809256C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08092520
	ldr r0, _08092570 @ =0x00000385
	bl m4aSongNumStart
_08092520:
	ldrb r1, [r4]
	movs r6, #1
	adds r0, r6, #0
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0x88
	lsrs r1, r1, #1
	lsls r1, r1, #4
	adds r1, #0x54
	movs r3, #0x80
	lsls r3, r3, #3
	movs r2, #3
	bl ShowSysHandCursor
	adds r0, r5, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _08092564
	ldrb r1, [r4]
	adds r0, r6, #0
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0x88
	lsrs r1, r1, #1
	lsls r1, r1, #4
	adds r1, #0x54
	ldr r3, _08092574 @ =0x08CC4430
	ldrb r4, [r4]
	lsls r2, r4, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl StartHelpBox
_08092564:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809256C: .4byte 0x0202BBF8
_08092570: .4byte 0x00000385
_08092574: .4byte 0x08CC4430

	thumb_func_start sub_08092578
sub_08092578: @ 0x08092578
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #0
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	ldr r4, _080925C8 @ =0x02012A20
	ldr r5, _080925CC @ =0x02022EA4
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl sub_080929D0
	adds r4, #0x28
	adds r5, #0x1a
	adds r6, #0x29
	ldrb r0, [r6]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl sub_080929D0
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080925C8: .4byte 0x02012A20
_080925CC: .4byte 0x02022EA4

	thumb_func_start sub_080925D0
sub_080925D0: @ 0x080925D0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #1
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	ldr r0, _080926E0 @ =0x02022C60
	movs r1, #0x1f
	movs r2, #8
	movs r3, #0
	bl TmFillRect_t
	movs r0, #0xc0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_08091944
	movs r0, #0xc0
	lsls r0, r0, #6
	movs r1, #0xa
	bl sub_08091994
	ldr r0, _080926E4 @ =0x02023460
	ldr r1, _080926E8 @ =0x08407270
	movs r2, #0xa6
	lsls r2, r2, #7
	bl sub_080AACD8
	adds r1, r6, #0
	adds r1, #0x31
	movs r0, #0
	strb r0, [r1]
	adds r7, r6, #0
	adds r7, #0x29
	ldrb r5, [r7]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x14
	ldrh r0, [r6, #0x32]
	subs r0, #4
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r4, #0
	movs r2, #7
	bl ShowSysHandCursor
	adds r0, r6, #0
	movs r1, #0
	bl sub_08092ED4
	movs r0, #7
	bl EnableBgSync
	adds r4, r6, #0
	adds r4, #0x2a
	ldrb r0, [r4]
	bl GetUnitFromPrepList
	adds r1, r0, #0
	ldr r0, _080926EC @ =0x00000503
	str r0, [sp]
	movs r0, #0
	movs r2, #0x44
	movs r3, #0x4e
	bl UpdatePrepItemScreenFace
	ldrb r0, [r7]
	bl GetUnitFromPrepList
	adds r1, r0, #0
	ldr r0, _080926F0 @ =0x00000502
	str r0, [sp]
	movs r0, #1
	movs r2, #0xac
	movs r3, #0x4e
	bl UpdatePrepItemScreenFace
	ldrb r5, [r4]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x14
	ldrh r0, [r6, #0x32]
	subs r0, #4
	subs r2, r2, r0
	movs r0, #0
	adds r1, r4, #0
	movs r3, #2
	bl SetUiCursorHandConfig
	ldr r0, _080926F4 @ =sub_08092578
	movs r1, #1
	adds r2, r6, #0
	bl StartParallelFiniteLoop
	bl UnblockUiCursorHand
	bl EndHelpPromptSprite
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080926E0: .4byte 0x02022C60
_080926E4: .4byte 0x02023460
_080926E8: .4byte 0x08407270
_080926EC: .4byte 0x00000503
_080926F0: .4byte 0x00000502
_080926F4: .4byte sub_08092578

	thumb_func_start sub_080926F8
sub_080926F8: @ 0x080926F8
	push {lr}
	bl sub_08091914
	movs r0, #1
	bl EnableBgSync
	pop {r0}
	bx r0

	thumb_func_start PrepItemScreen_Loop_MainKeyHandler
PrepItemScreen_Loop_MainKeyHandler: @ 0x08092708
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0xf
	ldrh r1, [r6, #0x32]
	ands r0, r1
	cmp r0, #0
	beq _0809271A
	b _08092840
_0809271A:
	ldr r0, _08092734 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08092738
	adds r0, r6, #0
	bl Proc_Break
	b _08092846
	.align 2, 0
_08092734: .4byte 0x08B857F8
_08092738:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080927B0
	adds r5, r6, #0
	adds r5, #0x29
	ldrb r0, [r5]
	bl GetUnitFromPrepList
	bl GetUnitItemCount
	adds r7, r0, #0
	adds r4, r6, #0
	adds r4, #0x2a
	ldrb r0, [r4]
	bl GetUnitFromPrepList
	bl GetUnitItemCount
	ldrb r5, [r5]
	ldrb r4, [r4]
	cmp r5, r4
	beq _08092794
	cmp r7, #0
	bgt _0809276E
	cmp r0, #0
	ble _08092794
_0809276E:
	adds r0, r6, #0
	movs r1, #6
	bl Proc_Goto
	ldr r0, _0809278C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08092846
	ldr r0, _08092790 @ =0x0000038A
	bl m4aSongNumStart
	b _08092846
	.align 2, 0
_0809278C: .4byte 0x0202BBF8
_08092790: .4byte 0x0000038A
_08092794:
	ldr r0, _080927AC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08092846
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _08092846
	.align 2, 0
_080927AC: .4byte 0x0202BBF8
_080927B0:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080927E4
	movs r0, #1
	bl EndPrepItemScreenFace
	adds r0, r6, #0
	movs r1, #2
	bl Proc_Goto
	ldr r0, _080927DC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08092846
	ldr r0, _080927E0 @ =0x0000038B
	bl m4aSongNumStart
	b _08092846
	.align 2, 0
_080927DC: .4byte 0x0202BBF8
_080927E0: .4byte 0x0000038B
_080927E4:
	adds r0, r6, #0
	bl sub_08091AD8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08092840
	adds r7, r6, #0
	adds r7, #0x29
	ldrb r0, [r7]
	bl GetUnitFromPrepList
	adds r1, r0, #0
	ldr r0, _08092850 @ =0x00000502
	str r0, [sp]
	movs r0, #1
	movs r2, #0xac
	movs r3, #0x4e
	bl UpdatePrepItemScreenFace
	ldr r4, _08092854 @ =0x02012A48
	ldr r5, _08092858 @ =0x02022EBE
	ldrb r0, [r7]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #2
	bl sub_080929D0
	subs r4, #0x28
	subs r5, #0x1a
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl sub_080929D0
	movs r0, #1
	bl EnableBgSync
_08092840:
	adds r0, r6, #0
	bl sub_08091C48
_08092846:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08092850: .4byte 0x00000502
_08092854: .4byte 0x02012A48
_08092858: .4byte 0x02022EBE

	thumb_func_start StartPrepItemTradeScreen
StartPrepItemTradeScreen: @ 0x0809285C
	push {r4, r5, lr}
	adds r4, r0, #0
	bl PrepItemScreen_OnEnd
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r5, r0, #0
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r1, r0, #0
	adds r0, r5, #0
	adds r2, r4, #0
	bl StartPrepItemTradeScreenProc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0809288C
sub_0809288C: @ 0x0809288C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r1, r4, #0
	bl sub_080958B0
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080928A4
sub_080928A4: @ 0x080928A4
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r1, r4, #0
	bl StartPrepItemSupplyProc
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080928BC
sub_080928BC: @ 0x080928BC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r1, r4, #0
	bl sub_08098F70
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080928D4
sub_080928D4: @ 0x080928D4
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r1, r4, #0
	bl sub_08098588
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start UpdatePrepItemScreenFace
UpdatePrepItemScreenFace: @ 0x080928EC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r0, [sp, #0x20]
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r8, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldr r0, _0809294C @ =0x08CC4448
	bl Proc_Find
	adds r5, r0, #0
	lsls r1, r4, #2
	adds r0, #0x40
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, r6
	beq _08092950
	cmp r0, #0
	beq _0809292A
	adds r0, r4, #0
	bl EndFaceById
_0809292A:
	cmp r6, #0
	beq _0809296C
	adds r0, r6, #0
	bl GetUnitFid
	adds r1, r0, #0
	lsls r2, r7, #0x10
	asrs r2, r2, #0x10
	mov r0, r8
	lsls r3, r0, #0x10
	asrs r3, r3, #0x10
	mov r0, sb
	str r0, [sp]
	adds r0, r4, #0
	bl StartBmFace
	b _0809296C
	.align 2, 0
_0809294C: .4byte 0x08CC4448
_08092950:
	cmp r6, #0
	beq _0809296C
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	mov r0, r8
	lsls r2, r0, #0x10
	asrs r2, r2, #0x10
	adds r0, r4, #0
	bl SetFacePosition
	adds r0, r4, #0
	mov r1, sb
	bl SetFaceDispById
_0809296C:
	lsls r1, r4, #2
	adds r0, r5, #0
	adds r0, #0x40
	adds r0, r0, r1
	str r6, [r0]
	lsls r1, r4, #1
	adds r0, r5, #0
	adds r0, #0x34
	adds r0, r0, r1
	strh r7, [r0]
	adds r0, r5, #0
	adds r0, #0x38
	adds r0, r0, r1
	mov r2, r8
	strh r2, [r0]
	adds r0, r5, #0
	adds r0, #0x3c
	adds r0, r0, r1
	mov r1, sb
	strh r1, [r0]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EndPrepItemScreenFace
EndPrepItemScreenFace: @ 0x080929A4
	push {lr}
	sub sp, #4
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0
	bl UpdatePrepItemScreenFace
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartPrepItemScreen
StartPrepItemScreen: @ 0x080929BC
	push {lr}
	adds r1, r0, #0
	ldr r0, _080929CC @ =0x08CC4448
	bl SpawnProcLocking
	pop {r1}
	bx r1
	.align 2, 0
_080929CC: .4byte 0x08CC4448

	thumb_func_start sub_080929D0
sub_080929D0: @ 0x080929D0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r1, #0
	mov r8, r2
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp]
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #0x14
	movs r3, #0
	bl TmFillRect_t
	movs r0, #2
	ldr r1, [sp]
	ands r0, r1
	cmp r0, #0
	beq _08092A02
	bl ClearIcons
_08092A02:
	mov r0, r8
	cmp r0, #0
	beq _08092AD2
	bl GetUnitItemCount
	str r0, [sp, #4]
	movs r1, #0
	mov sb, r1
	cmp sb, r0
	bge _08092AD2
	adds r0, r4, #0
	adds r0, #0x18
	str r0, [sp, #8]
	adds r1, r4, #6
	str r1, [sp, #0xc]
	adds r4, #2
	mov sl, r4
_08092A24:
	mov r1, sb
	lsls r0, r1, #1
	mov r1, r8
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r5, [r1]
	movs r0, #4
	ldr r1, [sp]
	ands r0, r1
	cmp r0, #0
	beq _08092A44
	mov r0, r8
	adds r1, r5, #0
	bl CanUnitUseItemPrepScreen
	b _08092A4C
_08092A44:
	mov r0, r8
	adds r1, r5, #0
	bl IsItemDisplayUseable
_08092A4C:
	movs r7, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08092A56
	movs r7, #1
_08092A56:
	movs r0, #1
	ldr r1, [sp]
	ands r0, r1
	cmp r0, #0
	bne _08092A84
	adds r0, r6, #0
	bl ClearText
	adds r0, r6, #0
	adds r1, r7, #0
	bl Text_SetColor
	adds r0, r6, #0
	movs r1, #0
	bl Text_SetCursor
	adds r0, r5, #0
	bl GetItemName
	adds r1, r0, #0
	adds r0, r6, #0
	bl Text_DrawString
_08092A84:
	adds r0, r5, #0
	bl GetItemIcon
	adds r1, r0, #0
	mov r0, sl
	movs r2, #0x80
	lsls r2, r2, #7
	bl PutIcon
	adds r0, r6, #0
	ldr r1, [sp, #0xc]
	bl PutText
	movs r4, #1
	cmp r7, #0
	bne _08092AA6
	movs r4, #2
_08092AA6:
	adds r0, r5, #0
	bl GetItemUses
	adds r2, r0, #0
	ldr r0, [sp, #8]
	adds r1, r4, #0
	bl PutNumberOrBlank
	adds r6, #8
	ldr r0, [sp, #8]
	adds r0, #0x80
	str r0, [sp, #8]
	ldr r1, [sp, #0xc]
	adds r1, #0x80
	str r1, [sp, #0xc]
	movs r0, #0x80
	add sl, r0
	movs r1, #1
	add sb, r1
	ldr r0, [sp, #4]
	cmp sb, r0
	blt _08092A24
_08092AD2:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08092AE4
sub_08092AE4: @ 0x08092AE4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x14
	adds r6, r4, #0
	bl PrepGetUnitAmount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #4
	ldrh r2, [r5, #0x32]
	subs r1, r4, r2
	cmp r1, #0x20
	ble _08092B1E
	cmp r4, r0
	bne _08092B18
	adds r0, r4, #0
	subs r0, #0x30
	b _08092B2E
_08092B18:
	adds r0, r4, #0
	subs r0, #0x20
	b _08092B2E
_08092B1E:
	cmp r1, #0xf
	bgt _08092B30
	cmp r4, #0
	bne _08092B2A
	strh r4, [r5, #0x32]
	b _08092B30
_08092B2A:
	adds r0, r6, #0
	subs r0, #0x10
_08092B2E:
	strh r0, [r5, #0x32]
_08092B30:
	ldr r1, _08092B68 @ =0x0000FFD8
	ldrh r2, [r5, #0x32]
	subs r2, #4
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl SetBgOffset
	ldrh r4, [r5, #0x32]
	bl PrepGetUnitAmount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #6
	adds r1, r4, #0
	movs r3, #4
	bl UpdateMenuScrollBarConfig
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08092B68: .4byte 0x0000FFD8

	thumb_func_start sub_08092B6C
sub_08092B6C: @ 0x08092B6C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r2, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r1, #1
	add r0, sl
	str r0, [sp]
	movs r1, #0xf
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _08092C2C @ =0x020129A8
	adds r6, r0, r1
	movs r0, #0
	mov r8, r0
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	mov sb, r4
_08092BA0:
	mov r1, sb
	cmp r1, #0
	bne _08092BAC
	adds r0, r6, #0
	bl ClearText
_08092BAC:
	ldr r4, [sp]
	add r4, r8
	bl PrepGetUnitAmount
	cmp r4, r0
	bge _08092C08
	mov r0, r8
	movs r1, #3
	bl __modsi3
	lsls r7, r0, #3
	mov r0, sl
	lsls r5, r0, #1
	movs r0, #0x1f
	ands r5, r0
	mov r1, sb
	cmp r1, #0
	bne _08092BF8
	adds r0, r4, #0
	bl GetUnitFromPrepList
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0
	bl Text_SetCursor
	adds r0, r6, #0
	movs r1, #0
	bl Text_SetColor
	ldr r0, [r4]
	ldrh r0, [r0]
	bl GetMsg
	adds r1, r0, #0
	adds r0, r6, #0
	bl Text_DrawString
_08092BF8:
	lsls r1, r5, #5
	adds r1, r1, r7
	lsls r1, r1, #1
	ldr r0, _08092C30 @ =0x02023C60
	adds r1, r1, r0
	adds r0, r6, #0
	bl PutText
_08092C08:
	adds r6, #8
	movs r0, #1
	add r8, r0
	mov r1, r8
	cmp r1, #2
	ble _08092BA0
	movs r0, #4
	bl EnableBgSync
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08092C2C: .4byte 0x020129A8
_08092C30: .4byte 0x02023C60

	thumb_func_start sub_08092C34
sub_08092C34: @ 0x08092C34
	cmp r0, #0x60
	bhi _08092C40
	cmp r1, #0x1f
	ble _08092C40
	movs r0, #1
	b _08092C42
_08092C40:
	movs r0, #0
_08092C42:
	bx lr

	thumb_func_start PrepItem_DrawSMS
PrepItem_DrawSMS: @ 0x08092C44
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r6, #0
	b _08092CA4
_08092C4C:
	adds r0, r6, #0
	movs r1, #3
	bl __modsi3
	lsls r5, r0, #6
	adds r0, r6, #0
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #4
	ldrh r1, [r7, #0x32]
	subs r4, r0, r1
	adds r0, r4, #0
	adds r0, #0x14
	cmp r0, #0x44
	bhi _08092CA2
	adds r0, r7, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08092C88
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08092C34
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08092CA2
_08092C88:
	adds r5, #0x18
	adds r4, #4
	movs r0, #0xff
	ands r4, r0
	adds r0, r6, #0
	bl GetUnitFromPrepList
	adds r3, r0, #0
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl PutUnitSprite
_08092CA2:
	adds r6, #1
_08092CA4:
	bl PrepGetUnitAmount
	cmp r6, r0
	blt _08092C4C
	bl SyncUnitSpriteSheet
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PrepItemDrawPopupBox
PrepItemDrawPopupBox: @ 0x08092CB8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #4]
	mov sl, r1
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	cmp r2, #0
	bgt _08092CD2
	b _08092EB2
_08092CD2:
	cmp r3, #0
	bgt _08092CD8
	b _08092EB2
_08092CD8:
	ldr r5, _08092EC4 @ =0x08B905B0
	ldr r0, [sp, #0x3c]
	str r0, [sp]
	movs r0, #4
	ldr r1, [sp, #4]
	mov r2, sl
	adds r3, r5, #0
	bl PutSpriteExt
	ldr r1, [sp, #8]
	lsls r1, r1, #3
	mov sb, r1
	ldr r4, [sp, #4]
	add r4, sb
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, r2
	ldr r3, [sp, #0x3c]
	str r3, [sp]
	movs r0, #4
	mov r2, sl
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0xc0
	lsls r0, r0, #6
	adds r4, r4, r0
	ldr r1, [sp, #0xc]
	lsls r1, r1, #3
	mov r8, r1
	mov r6, sl
	add r6, r8
	ldr r2, [sp, #0x3c]
	str r2, [sp]
	movs r0, #4
	adds r1, r4, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl PutSpriteExt
	ldr r3, [sp, #4]
	movs r0, #0x80
	lsls r0, r0, #6
	adds r1, r3, r0
	ldr r2, [sp, #0x3c]
	str r2, [sp]
	movs r0, #4
	adds r2, r6, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r5, #1
	mov r3, sb
	str r3, [sp, #0x18]
	mov sb, r8
	ldr r0, [sp, #8]
	subs r0, #1
	str r0, [sp, #0x10]
	cmp r5, r0
	bge _08092D8C
	ldr r1, _08092EC8 @ =0x08B905E8
	mov r8, r1
	ldr r7, [sp, #0x3c]
	adds r7, #1
	ldr r2, [sp, #4]
	ldr r3, _08092ECC @ =0x00002008
	adds r6, r2, r3
	adds r4, r2, #0
	adds r4, #8
_08092D62:
	str r7, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r2, sl
	mov r3, r8
	bl PutSpriteExt
	str r7, [sp]
	movs r0, #4
	adds r1, r6, #0
	mov r2, sl
	add r2, sb
	mov r3, r8
	bl PutSpriteExt
	adds r6, #0x10
	adds r4, #0x10
	adds r5, #2
	ldr r0, [sp, #0x10]
	cmp r5, r0
	blt _08092D62
_08092D8C:
	ldr r1, [sp, #8]
	cmp r5, r1
	bge _08092DD4
	ldr r2, _08092EC4 @ =0x08B905B0
	mov r8, r2
	ldr r7, [sp, #0x3c]
	adds r7, #1
	lsls r1, r5, #3
	movs r3, #0x80
	lsls r3, r3, #6
	adds r0, r1, r3
	ldr r2, [sp, #4]
	adds r6, r0, r2
	adds r4, r1, r2
	ldr r3, [sp, #8]
	subs r5, r3, r5
_08092DAC:
	str r7, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r2, sl
	mov r3, r8
	bl PutSpriteExt
	str r7, [sp]
	movs r0, #4
	adds r1, r6, #0
	mov r2, sl
	add r2, sb
	mov r3, r8
	bl PutSpriteExt
	adds r6, #8
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bne _08092DAC
_08092DD4:
	ldr r0, [sp, #0xc]
	cmp r0, #1
	ble _08092E18
	ldr r7, _08092EC4 @ =0x08B905B0
	ldr r5, [sp, #0x3c]
	adds r5, #3
	mov r4, sl
	adds r4, #8
	ldr r1, [sp, #4]
	ldr r2, [sp, #0x18]
	adds r1, r1, r2
	mov r8, r1
	adds r6, r0, #0
	subs r6, #1
_08092DF0:
	str r5, [sp]
	movs r0, #4
	ldr r1, [sp, #4]
	adds r2, r4, #0
	adds r3, r7, #0
	bl PutSpriteExt
	str r5, [sp]
	movs r0, #4
	movs r1, #0x80
	lsls r1, r1, #5
	add r1, r8
	adds r2, r4, #0
	adds r3, r7, #0
	bl PutSpriteExt
	adds r4, #8
	subs r6, #1
	cmp r6, #0
	bne _08092DF0
_08092E18:
	movs r6, #1
	ldr r3, [sp, #0xc]
	cmp r6, r3
	bge _08092EB2
	ldr r0, [sp, #8]
	subs r0, #3
	mov sb, r0
	ldr r1, [sp, #0x3c]
	adds r1, #4
	mov r8, r1
_08092E2C:
	movs r5, #1
	adds r2, r6, #1
	str r2, [sp, #0x14]
	cmp r5, sb
	bge _08092E56
	ldr r4, [sp, #4]
	adds r4, #8
	lsls r7, r6, #3
_08092E3C:
	mov r3, r8
	str r3, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r3, sl
	adds r2, r3, r7
	ldr r3, _08092ED0 @ =0x08B90608
	bl PutSpriteExt
	adds r4, #0x20
	adds r5, #4
	cmp r5, sb
	blt _08092E3C
_08092E56:
	ldr r0, [sp, #0x10]
	cmp r5, r0
	bge _08092E80
	lsls r0, r5, #3
	ldr r1, [sp, #4]
	adds r4, r0, r1
	lsls r7, r6, #3
_08092E64:
	mov r2, r8
	str r2, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r3, sl
	adds r2, r3, r7
	ldr r3, _08092EC8 @ =0x08B905E8
	bl PutSpriteExt
	adds r4, #0x10
	adds r5, #2
	ldr r0, [sp, #0x10]
	cmp r5, r0
	blt _08092E64
_08092E80:
	ldr r1, [sp, #8]
	cmp r5, r1
	bge _08092EAA
	lsls r0, r5, #3
	ldr r2, [sp, #4]
	adds r4, r0, r2
	lsls r6, r6, #3
	subs r5, r1, r5
_08092E90:
	mov r3, r8
	str r3, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r3, sl
	adds r2, r3, r6
	ldr r3, _08092EC4 @ =0x08B905B0
	bl PutSpriteExt
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bne _08092E90
_08092EAA:
	ldr r6, [sp, #0x14]
	ldr r0, [sp, #0xc]
	cmp r6, r0
	blt _08092E2C
_08092EB2:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08092EC4: .4byte 0x08B905B0
_08092EC8: .4byte 0x08B905E8
_08092ECC: .4byte 0x00002008
_08092ED0: .4byte 0x08B90608

	thumb_func_start sub_08092ED4
sub_08092ED4: @ 0x08092ED4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrh r0, [r5, #0x32]
	lsrs r4, r0, #4
	adds r0, r4, #4
	cmp r4, r0
	bge _08092F00
	lsls r6, r1, #0x18
_08092EE8:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	asrs r2, r6, #0x18
	bl sub_08092B6C
	adds r4, #1
	ldrh r1, [r5, #0x32]
	lsrs r0, r1, #4
	adds r0, #4
	cmp r4, r0
	blt _08092EE8
_08092F00:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PrepItemScreen_GiveAll
PrepItemScreen_GiveAll: @ 0x08092F08
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl GetUnitItemCount
	adds r7, r0, #0
	bl GetConvoyItemCount_
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r4, #0
	cmp r4, r7
	bge _08092F3E
	cmp r6, #0x63
	bgt _08092F3E
_08092F24:
	ldrh r0, [r5, #0x1e]
	bl AddItemToConvoy
	adds r0, r5, #0
	movs r1, #0
	bl UnitRemoveItem
	adds r4, #1
	cmp r4, r7
	bge _08092F3E
	adds r0, r4, r6
	cmp r0, #0x63
	ble _08092F24
_08092F3E:
	cmp r4, #0
	bgt _08092F46
	movs r0, #0
	b _08092F48
_08092F46:
	movs r0, #1
_08092F48:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start PrepUnit_DrawUnitListNames
PrepUnit_DrawUnitListNames: @ 0x08092F50
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r0, r1, #0
	movs r7, #0
	lsls r1, r0, #1
	mov r8, r1
	movs r1, #7
	bl __modsi3
	mov sl, r0
	movs r2, #0
	mov sb, r2
_08092F70:
	mov r0, r8
	adds r4, r0, r7
	bl PrepGetUnitAmount
	cmp r4, r0
	bge _08092FEA
	adds r0, r4, #0
	bl GetUnitFromPrepList
	adds r5, r0, #0
	movs r6, #0
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08092FA2
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08092FA2
	movs r6, #4
	b _08092FAE
_08092FA2:
	ldr r0, [r5, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08092FAE
	movs r6, #1
_08092FAE:
	mov r1, sl
	lsls r4, r1, #1
	adds r4, r4, r7
	lsls r4, r4, #3
	ldr r0, _0809300C @ =0x02012AA0
	adds r4, r4, r0
	adds r0, r4, #0
	bl ClearText
	ldr r0, [r5]
	ldrh r0, [r0]
	bl GetMsg
	movs r1, #0x1f
	mov r2, r8
	ands r1, r2
	lsls r1, r1, #5
	adds r1, #0x10
	add r1, sb
	lsls r1, r1, #1
	ldr r2, _08093010 @ =0x02023C60
	adds r1, r1, r2
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r2, r6, #0
	movs r3, #0
	bl PutDrawText
_08092FEA:
	movs r0, #7
	add sb, r0
	adds r7, #1
	cmp r7, #1
	ble _08092F70
	movs r0, #4
	bl EnableBgSync
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809300C: .4byte 0x02012AA0
_08093010: .4byte 0x02023C60

	thumb_func_start PrepUpdateMenuTsaScroll
PrepUpdateMenuTsaScroll: @ 0x08093014
	push {lr}
	lsls r0, r0, #1
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #6
	ldr r1, _08093038 @ =0x02023C80
	adds r0, r0, r1
	movs r1, #0xd
	movs r2, #1
	movs r3, #0
	bl TmFillRect_t
	movs r0, #4
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_08093038: .4byte 0x02023C80

	thumb_func_start PrepUnit_DrawSMSAndObjs
PrepUnit_DrawSMSAndObjs: @ 0x0809303C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	movs r6, #0
	b _08093078
_08093046:
	asrs r0, r6, #1
	lsls r0, r0, #4
	ldrh r1, [r7, #0x30]
	subs r5, r0, r1
	adds r0, r5, #0
	adds r0, #0xf
	cmp r0, #0x5f
	bhi _08093076
	movs r0, #1
	ands r0, r6
	lsls r4, r0, #3
	subs r4, r4, r0
	lsls r4, r4, #3
	adds r4, #0x70
	adds r5, #0x18
	adds r0, r6, #0
	bl GetUnitFromPrepList
	adds r3, r0, #0
	movs r0, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl PutUnitSprite
_08093076:
	adds r6, #1
_08093078:
	bl PrepGetUnitAmount
	cmp r6, r0
	blt _08093046
	movs r0, #0xf
	ldrh r2, [r7, #0x30]
	ands r0, r2
	cmp r0, #0
	beq _08093120
	ldr r0, _0809311C @ =0x03002870
	mov ip, r0
	movs r0, #0x20
	mov r1, ip
	ldrb r1, [r1, #1]
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, ip
	strb r0, [r2, #1]
	mov r0, ip
	adds r0, #0x2d
	movs r2, #0
	strb r2, [r0]
	adds r0, #4
	strb r2, [r0]
	subs r0, #5
	movs r3, #0xf0
	strb r3, [r0]
	mov r1, ip
	adds r1, #0x30
	movs r0, #0x18
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2f
	strb r2, [r0]
	adds r1, #3
	movs r0, #0x78
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2e
	strb r3, [r0]
	subs r1, #1
	movs r0, #0xa0
	strb r0, [r1]
	mov r6, ip
	adds r6, #0x34
	movs r2, #1
	ldrb r0, [r6]
	orrs r0, r2
	movs r4, #2
	orrs r0, r4
	movs r5, #5
	rsbs r5, r5, #0
	ands r0, r5
	movs r3, #8
	orrs r0, r3
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r6]
	mov r1, ip
	adds r1, #0x35
	ldrb r0, [r1]
	orrs r0, r2
	orrs r0, r4
	ands r0, r5
	orrs r0, r3
	movs r5, #0x10
	orrs r0, r5
	strb r0, [r1]
	adds r1, #1
	ldrb r0, [r1]
	orrs r2, r0
	orrs r2, r4
	movs r0, #4
	orrs r2, r0
	orrs r2, r3
	orrs r2, r5
	strb r2, [r1]
	b _08093136
	.align 2, 0
_0809311C: .4byte 0x03002870
_08093120:
	ldr r2, _0809317C @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
_08093136:
	ldr r3, _08093180 @ =0x08CC4818
	movs r4, #0x40
	str r4, [sp]
	movs r0, #4
	movs r1, #0x80
	movs r2, #0x8e
	bl PutSpriteExt
	adds r1, r7, #0
	adds r1, #0x37
	ldrb r0, [r1]
	cmp r0, #0
	beq _08093154
	adds r0, #1
	strb r0, [r1]
_08093154:
	ldrb r1, [r1]
	lsrs r0, r1, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08093196
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08093188
	ldr r3, _08093184 @ =0x08CC4840
	str r4, [sp]
	movs r0, #4
	movs r1, #0x80
	movs r2, #0x7e
	bl PutSpriteExt
	b _08093196
	.align 2, 0
_0809317C: .4byte 0x03002870
_08093180: .4byte 0x08CC4818
_08093184: .4byte 0x08CC4840
_08093188:
	ldr r3, _080931A4 @ =0x08CC482C
	str r4, [sp]
	movs r0, #4
	movs r1, #0x80
	movs r2, #0x7e
	bl PutSpriteExt
_08093196:
	bl SyncUnitSpriteSheet
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080931A4: .4byte 0x08CC482C

	thumb_func_start PrepUnit_InitTexts
PrepUnit_InitTexts: @ 0x080931A8
	push {r4, r5, lr}
	bl ResetText
	ldr r5, _080931FC @ =0x02012AA0
	movs r4, #0xd
_080931B2:
	adds r0, r5, #0
	movs r1, #5
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _080931B2
	ldr r5, _08093200 @ =0x02012B10
	movs r4, #4
_080931C6:
	adds r0, r5, #0
	movs r1, #7
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _080931C6
	ldr r4, _08093204 @ =0x02012B38
	adds r0, r4, #0
	movs r1, #7
	bl InitText
	adds r0, r4, #0
	adds r0, #8
	movs r1, #0xa
	bl InitText
	adds r4, #0x10
	adds r0, r4, #0
	movs r1, #0xb
	bl InitText
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080931FC: .4byte 0x02012AA0
_08093200: .4byte 0x02012B10
_08093204: .4byte 0x02012B38

	thumb_func_start PrepUnit_InitGfx
PrepUnit_InitGfx: @ 0x08093208
	push {lr}
	bl InitIcons
	bl ApplySystemObjectsGraphics
	movs r0, #4
	bl ApplyIconPalettes
	movs r0, #0xc0
	lsls r0, r0, #7
	movs r1, #0xf
	bl PutPrepMenuUiImg
	ldr r0, _08093240 @ =0x02023460
	ldr r1, _08093244 @ =0x08406FD0
	movs r2, #0xf3
	lsls r2, r2, #8
	bl sub_080AACD8
	ldr r0, _08093248 @ =0x0840E0C0
	ldr r1, _0809324C @ =0x06010800
	bl Decompress
	bl EnablePalSync
	pop {r0}
	bx r0
	.align 2, 0
_08093240: .4byte 0x02023460
_08093244: .4byte 0x08406FD0
_08093248: .4byte 0x0840E0C0
_0809324C: .4byte 0x06010800

	thumb_func_start sub_08093250
sub_08093250: @ 0x08093250
	push {r4, lr}
	sub sp, #8
	adds r4, r1, #0
	bl NewSysBlackBoxHandler
	adds r0, r4, #0
	bl SysBlackBoxSetGfx
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08093284
	movs r2, #0x90
	lsls r2, r2, #3
	movs r0, #4
	str r0, [sp]
	movs r0, #0xc0
	lsls r0, r0, #4
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #4
	movs r3, #0xc
	bl EnableSysBlackBox
	b _0809329C
_08093284:
	movs r2, #0x91
	lsls r2, r2, #3
	movs r0, #3
	str r0, [sp]
	movs r0, #0xc0
	lsls r0, r0, #4
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #4
	movs r3, #0xc
	bl EnableSysBlackBox
_0809329C:
	movs r2, #0x90
	lsls r2, r2, #3
	movs r0, #4
	str r0, [sp]
	movs r0, #0xc0
	lsls r0, r0, #4
	str r0, [sp, #4]
	movs r0, #1
	movs r1, #0x6c
	movs r3, #0x10
	bl EnableSysBlackBox
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start PrepUnit_InitSMS
PrepUnit_InitSMS: @ 0x080932BC
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl ApplyUnitSpritePalettes
	movs r0, #0
	str r0, [sp]
	ldr r1, _080932EC @ =0x02022BC0
	ldr r2, _080932F0 @ =0x01000008
	mov r0, sp
	bl CpuFastSet
	bl MakePrepUnitList
	ldr r0, [r4, #0x14]
	bl PrepAutoCapDeployUnits
	bl PrepUpdateSMS
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080932EC: .4byte 0x02022BC0
_080932F0: .4byte 0x01000008

	thumb_func_start PrepUnit_DrawLeftUnitName
PrepUnit_DrawLeftUnitName: @ 0x080932F4
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #8
	adds r5, r0, #0
	ldr r4, _080933AC @ =0x02022D2A
	adds r0, r4, #0
	movs r1, #6
	movs r2, #1
	movs r3, #0
	bl TmFillRect_t
	adds r0, r5, #0
	bl GetUnitFid
	adds r1, r4, #0
	subs r1, #0x88
	movs r2, #0x9c
	lsls r2, r2, #2
	movs r3, #0
	mov sb, r3
	str r3, [sp]
	movs r3, #2
	bl PutFaceChibi
	ldr r0, _080933B0 @ =0x02012B38
	mov r8, r0
	bl ClearText
	ldr r0, [r5]
	ldrh r0, [r0]
	bl GetMsg
	adds r1, r0, #0
	movs r0, #0x38
	bl GetStringTextCenteredPos
	adds r6, r0, #0
	ldr r0, [r5]
	ldrh r0, [r0]
	bl GetMsg
	adds r1, r4, #0
	subs r1, #0x80
	mov r2, sb
	str r2, [sp]
	str r0, [sp, #4]
	mov r0, r8
	movs r2, #0
	adds r3, r6, #0
	bl PutDrawText
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0x24
	bl PutSpecialChar
	adds r0, r4, #2
	movs r1, #3
	movs r2, #0x25
	bl PutSpecialChar
	adds r0, r4, #0
	adds r0, #8
	movs r1, #3
	movs r2, #0x1d
	bl PutSpecialChar
	adds r0, r4, #6
	movs r2, #8
	ldrsb r2, [r5, r2]
	movs r1, #2
	bl PutNumberOrBlank
	adds r4, #0xc
	ldrb r2, [r5, #9]
	adds r0, r4, #0
	movs r1, #2
	bl PutNumberOrBlank
	movs r0, #1
	bl EnableBgSync
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080933AC: .4byte 0x02022D2A
_080933B0: .4byte 0x02012B38

	thumb_func_start PrepUnit_DrawLeftUnitNameCur
PrepUnit_DrawLeftUnitNameCur: @ 0x080933B4
	push {lr}
	ldrh r0, [r0, #0x2e]
	bl GetUnitFromPrepList
	bl PrepUnit_DrawLeftUnitName
	pop {r0}
	bx r0

	thumb_func_start PrepUnit_DrawUnitItems
PrepUnit_DrawUnitItems: @ 0x080933C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	bl InitIcons
	ldr r4, _080934B0 @ =0x02022DA2
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0xa
	movs r3, #0
	bl TmFillRect_t
	adds r0, r7, #0
	bl GetUnitItemCount
	str r0, [sp, #8]
	movs r0, #0
	mov r8, r0
	ldr r2, [sp, #8]
	cmp r8, r2
	bge _08093498
	movs r0, #0x14
	adds r0, r0, r4
	mov sl, r0
	mov sb, r4
	movs r2, #0xa0
	lsls r2, r2, #1
	str r2, [sp, #0xc]
_08093404:
	mov r0, r8
	lsls r1, r0, #1
	adds r0, r7, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemIcon
	adds r1, r0, #0
	mov r0, sb
	movs r2, #0x80
	lsls r2, r2, #7
	bl PutIcon
	mov r2, r8
	lsls r1, r2, #3
	ldr r0, _080934B4 @ =0x02012B10
	adds r5, r1, r0
	adds r0, r5, #0
	bl ClearText
	adds r0, r7, #0
	adds r1, r4, #0
	bl IsItemDisplayUseable
	movs r6, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08093442
	movs r6, #1
_08093442:
	adds r0, r4, #0
	bl GetItemName
	ldr r1, _080934B8 @ =0x02022C62
	adds r1, #4
	ldr r2, [sp, #0xc]
	adds r1, r2, r1
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, r6, #0
	movs r3, #0
	bl PutDrawText
	adds r0, r7, #0
	adds r1, r4, #0
	bl IsItemDisplayUseable
	lsls r0, r0, #0x18
	movs r5, #1
	cmp r0, #0
	beq _08093472
	movs r5, #2
_08093472:
	adds r0, r4, #0
	bl GetItemUses
	adds r2, r0, #0
	mov r0, sl
	adds r1, r5, #0
	bl PutNumberOrBlank
	movs r0, #0x80
	add sl, r0
	add sb, r0
	ldr r2, [sp, #0xc]
	adds r2, #0x80
	str r2, [sp, #0xc]
	movs r0, #1
	add r8, r0
	ldr r2, [sp, #8]
	cmp r8, r2
	blt _08093404
_08093498:
	movs r0, #1
	bl EnableBgSync
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080934B0: .4byte 0x02022DA2
_080934B4: .4byte 0x02012B10
_080934B8: .4byte 0x02022C62

	thumb_func_start PrepUnit_DrawPickLeftBar
PrepUnit_DrawPickLeftBar: @ 0x080934BC
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r5, _08093594 @ =0x02012B48
	lsls r1, r1, #0x18
	asrs r4, r1, #0x18
	cmp r4, #0
	bne _080934E8
	adds r0, r5, #0
	bl ClearText
	ldr r0, _08093598 @ =0x00001272
	bl GetMsg
	ldr r1, _0809359C @ =0x02022CBC
	str r4, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #0
	movs r3, #0x28
	bl PutDrawText
_080934E8:
	adds r0, r5, #0
	movs r1, #2
	movs r2, #3
	bl ClearTextPart
	ldr r0, _080935A0 @ =0x00001271
	bl GetMsg
	ldr r7, _0809359C @ =0x02022CBC
	movs r1, #0
	str r1, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	adds r4, r6, #0
	adds r4, #0x29
	adds r6, #0x2a
	movs r1, #2
	ldrb r0, [r4]
	ldrb r2, [r6]
	cmp r0, r2
	bne _0809351E
	movs r1, #1
_0809351E:
	adds r0, r5, #0
	bl Text_SetColor
	adds r0, r5, #0
	movs r1, #0x1c
	bl Text_SetCursor
	ldrb r3, [r6]
	ldrb r0, [r4]
	subs r1, r3, r0
	adds r0, r5, #0
	bl Text_DrawNumber
	adds r0, r5, #0
	adds r1, r7, #0
	bl PutText
	adds r0, r7, #0
	adds r0, #0x16
	movs r1, #4
	movs r2, #1
	movs r3, #0
	bl TmFillRect_t
	adds r0, r7, #0
	adds r0, #0x18
	movs r1, #2
	ldrb r2, [r4]
	ldrb r3, [r6]
	cmp r2, r3
	bne _0809355E
	movs r1, #4
_0809355E:
	ldrb r2, [r4]
	bl PutNumberOrBlank
	adds r0, r7, #0
	adds r0, #0x1a
	movs r1, #0
	movs r2, #0x16
	bl PutSpecialChar
	adds r0, r7, #0
	adds r0, #0x1e
	movs r1, #2
	ldrb r4, [r4]
	ldrb r2, [r6]
	cmp r4, r2
	bne _08093580
	movs r1, #4
_08093580:
	ldrb r2, [r6]
	bl PutNumberOrBlank
	movs r0, #1
	bl EnableBgSync
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08093594: .4byte 0x02012B48
_08093598: .4byte 0x00001272
_0809359C: .4byte 0x02022CBC
_080935A0: .4byte 0x00001271

	thumb_func_start PrepCheckCanSelectUnit
PrepCheckCanSelectUnit: @ 0x080935A4
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	adds r1, r4, #0
	adds r1, #0x2a
	adds r3, r4, #0
	adds r3, #0x29
	ldrb r0, [r3]
	ldrb r1, [r1]
	cmp r1, r0
	bls _080935F8
	adds r0, #1
	strb r0, [r3]
	ldr r0, [r2, #0xc]
	movs r1, #0xb
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0xc]
	ldr r0, [r2]
	ldrb r0, [r0, #4]
	bl RegisterSioPid
	ldr r0, _080935F0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080935E2
	ldr r0, _080935F4 @ =0x0000038A
	bl m4aSongNumStart
_080935E2:
	ldrh r0, [r4, #0x2e]
	lsrs r1, r0, #1
	adds r0, r4, #0
	bl PrepUnit_DrawUnitListNames
	movs r0, #1
	b _0809360E
	.align 2, 0
_080935F0: .4byte 0x0202BBF8
_080935F4: .4byte 0x0000038A
_080935F8:
	ldr r0, _08093614 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809360C
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_0809360C:
	movs r0, #0
_0809360E:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08093614: .4byte 0x0202BBF8

	thumb_func_start PrepCheckCanUnselectUnit
PrepCheckCanUnselectUnit: @ 0x08093618
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08093670
	adds r1, r5, #0
	adds r1, #0x29
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	ldr r0, [r4, #0xc]
	movs r1, #0xa
	orrs r0, r1
	str r0, [r4, #0xc]
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl RemoveSioPid
	ldr r0, _08093668 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08093658
	ldr r0, _0809366C @ =0x0000038B
	bl m4aSongNumStart
_08093658:
	ldrh r0, [r5, #0x2e]
	lsrs r1, r0, #1
	adds r0, r5, #0
	bl PrepUnit_DrawUnitListNames
	movs r0, #1
	b _08093686
	.align 2, 0
_08093668: .4byte 0x0202BBF8
_0809366C: .4byte 0x0000038B
_08093670:
	ldr r0, _0809368C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08093684
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_08093684:
	movs r0, #0
_08093686:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809368C: .4byte 0x0202BBF8

	thumb_func_start PrepUnit_HandlePressA
PrepUnit_HandlePressA: @ 0x08093690
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	bl GetUnitFromPrepList
	adds r5, r0, #0
	ldr r1, [r5, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0x12
	ands r0, r1
	cmp r0, #0
	beq _080936D0
	ldrh r1, [r4, #0x2e]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsrs r1, r1, #1
	lsls r1, r1, #4
	ldrh r2, [r4, #0x30]
	subs r1, r1, r2
	adds r1, #0x18
	ldr r2, _080936CC @ =0x000003B1
_080936C2:
	adds r3, r4, #0
	bl StartPrepErrorHelpbox
	b _0809372C
	.align 2, 0
_080936CC: .4byte 0x000003B1
_080936D0:
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq _0809371A
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08093710
	adds r0, r5, #0
	bl sub_08090DB0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08093710
	ldrh r1, [r4, #0x2e]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsrs r1, r1, #1
	lsls r1, r1, #4
	ldrh r2, [r4, #0x30]
	subs r1, r1, r2
	adds r1, #0x18
	ldr r2, _0809370C @ =0x000003AD
	b _080936C2
	.align 2, 0
_0809370C: .4byte 0x000003AD
_08093710:
	adds r0, r4, #0
	adds r1, r5, #0
	bl PrepCheckCanSelectUnit
	b _08093722
_0809371A:
	adds r0, r4, #0
	adds r1, r5, #0
	bl PrepCheckCanUnselectUnit
_08093722:
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809372C
	movs r0, #1
	b _0809372E
_0809372C:
	movs r0, #0
_0809372E:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_08093734
sub_08093734: @ 0x08093734
	push {r4, r5, r6, lr}
	sub sp, #8
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	asrs r6, r0, #0x18
	cmp r6, #0
	bne _08093780
	ldr r0, _08093788 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x8e
	ldrh r0, [r0]
	bl GetMsg
	adds r4, r0, #0
	ldr r5, _0809378C @ =0x02012B40
	adds r0, r5, #0
	bl ClearText
	movs r0, #0x50
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	ldr r1, _08093790 @ =0x02023062
	str r6, [sp]
	str r4, [sp, #4]
	adds r0, r5, #0
	movs r2, #0
	bl PutDrawText
	movs r0, #1
	bl EnableBgSync
_08093780:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08093788: .4byte 0x0202BBF8
_0809378C: .4byte 0x02012B40
_08093790: .4byte 0x02023062

	thumb_func_start ShouldPrepUnitMenuScroll
ShouldPrepUnitMenuScroll: @ 0x08093794
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x30]
	lsrs r1, r0, #4
	cmp r1, #0
	ble _080937A8
	ldrh r2, [r4, #0x2e]
	lsrs r0, r2, #1
	cmp r0, r1
	ble _080937BE
_080937A8:
	adds r5, r1, #5
	bl PrepGetUnitAmount
	subs r0, #1
	asrs r0, r0, #1
	cmp r5, r0
	bge _080937C2
	ldrh r4, [r4, #0x2e]
	lsrs r0, r4, #1
	cmp r0, r5
	blt _080937C2
_080937BE:
	movs r0, #1
	b _080937C4
_080937C2:
	movs r0, #0
_080937C4:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080937CC
sub_080937CC: @ 0x080937CC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl ShouldPrepUnitMenuScroll
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809380E
	ldrh r0, [r5, #0x2e]
	lsrs r4, r0, #1
	ldrh r0, [r5, #0x30]
	lsrs r6, r0, #4
	bl PrepGetUnitAmount
	subs r0, #1
	asrs r1, r0, #1
	cmp r4, r6
	bgt _08093800
	cmp r4, #0
	bne _080937F6
	strh r4, [r5, #0x30]
	b _080937FC
_080937F6:
	subs r0, r4, #1
	lsls r0, r0, #4
	strh r0, [r5, #0x30]
_080937FC:
	cmp r4, r6
	ble _0809380E
_08093800:
	cmp r4, r1
	bne _08093808
	subs r0, r4, #5
	b _0809380A
_08093808:
	subs r0, r4, #4
_0809380A:
	lsls r0, r0, #4
	strh r0, [r5, #0x30]
_0809380E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_08093814
sub_08093814: @ 0x08093814
	push {r4, r5, lr}
	movs r5, #0
	ldrh r0, [r0, #0x30]
	lsrs r4, r0, #4
	bl PrepGetUnitAmount
	subs r0, #1
	asrs r1, r0, #1
	cmp r4, #0
	ble _0809382A
	movs r5, #1
_0809382A:
	adds r0, r4, #5
	cmp r0, r1
	bge _08093834
	movs r0, #2
	orrs r5, r0
_08093834:
	adds r0, r5, #0
	bl SetUiSpinningArrowConfig
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start ProcPrepUnit_OnInit
ProcPrepUnit_OnInit: @ 0x08093840
	push {r4, lr}
	adds r4, r0, #0
	bl MakePrepUnitList
	bl PrepGetLatestCharId
	bl UnitGetIndexInPrepList
	movs r1, #0
	strh r0, [r4, #0x2e]
	ldr r0, [r4, #0x14]
	adds r0, #0x2a
	ldrb r0, [r0]
	adds r2, r4, #0
	adds r2, #0x2a
	strb r0, [r2]
	ldr r0, [r4, #0x14]
	adds r0, #0x2b
	ldrb r0, [r0]
	subs r2, #1
	strb r0, [r2]
	ldr r0, [r4, #0x14]
	ldrh r0, [r0, #0x3c]
	strh r0, [r4, #0x30]
	ldrh r0, [r4, #0x2e]
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x37
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start ProcPrepUnit_InitScreen
ProcPrepUnit_InitScreen: @ 0x08093880
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08093A58 @ =0x08CC3B18
	bl InitBgs
	ldr r4, _08093A5C @ =0x03002870
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r4, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r4, #1]
	adds r0, r5, #0
	bl sub_080937CC
	ldr r0, _08093A60 @ =0x02022C60
	movs r1, #0
	bl TmFill
	ldr r0, _08093A64 @ =0x02023460
	movs r1, #0
	bl TmFill
	ldr r0, _08093A68 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r4, #0xc]
	ands r0, r2
	movs r2, #2
	orrs r0, r2
	strb r0, [r4, #0xc]
	adds r0, r1, #0
	ldrb r3, [r4, #0x10]
	ands r0, r3
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r4, #0x14]
	movs r0, #3
	ldrb r1, [r4, #0x18]
	orrs r0, r1
	strb r0, [r4, #0x18]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldrh r2, [r5, #0x30]
	subs r2, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl PrepUnit_InitTexts
	bl PrepUnit_InitGfx
	movs r1, #0x80
	lsls r1, r1, #7
	adds r0, r5, #0
	bl sub_08093250
	movs r0, #7
	bl EnableBgSync
	adds r2, r4, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r3, [r2]
	ands r0, r3
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x44
	movs r3, #0
	movs r0, #0xe
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x46
	strb r3, [r0]
	ldr r0, _08093A6C @ =0x0000FFE0
	ldrh r1, [r4, #0x3c]
	ands r0, r1
	ldr r1, _08093A70 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r4, #0x3c]
	movs r1, #0x21
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r3, [r2]
	ands r0, r3
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r2, [r0]
	ands r1, r2
	strb r1, [r0]
	adds r0, r5, #0
	bl PrepUnit_InitSMS
	ldr r0, _08093A74 @ =PrepUnit_DrawSMSAndObjs
	adds r1, r5, #0
	bl StartParallelWorker
	adds r0, r5, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	ldrh r1, [r5, #0x2e]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsrs r1, r1, #1
	lsls r1, r1, #4
	ldrh r2, [r5, #0x30]
	subs r2, #0x18
	subs r1, r1, r2
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #7
	bl ShowSysHandCursor
	adds r0, r5, #0
	bl StartMenuScrollBar
	movs r0, #0xe2
	movs r1, #0x20
	bl PutMenuScrollBarAt
	ldrh r4, [r5, #0x30]
	bl PrepGetUnitAmount
	adds r2, r0, #0
	subs r2, #1
	lsrs r0, r2, #0x1f
	adds r2, r2, r0
	asrs r2, r2, #1
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0xa
	adds r1, r4, #0
	movs r3, #6
	bl UpdateMenuScrollBarConfig
	movs r0, #0x80
	lsls r0, r0, #2
	movs r1, #2
	bl InitMenuScrollBarImg
	movs r0, #0x20
	movs r1, #0x8c
	adds r2, r5, #0
	bl StartHelpPromptSprite
	ldrh r0, [r5, #0x2e]
	bl GetUnitFromPrepList
	bl PrepUnit_DrawUnitItems
	ldrh r0, [r5, #0x2e]
	bl GetUnitFromPrepList
	bl PrepUnit_DrawLeftUnitName
	bl sub_08093734
	movs r4, #0
_08093A24:
	ldrh r3, [r5, #0x30]
	lsrs r1, r3, #4
	adds r1, r1, r4
	adds r0, r5, #0
	bl PrepUnit_DrawUnitListNames
	adds r4, #1
	cmp r4, #5
	ble _08093A24
	adds r0, r5, #0
	movs r1, #0
	bl PrepUnit_DrawPickLeftBar
	adds r0, r5, #0
	bl StartGreenText
	ldr r0, _08093A78 @ =0x06015000
	movs r1, #5
	bl LoadHelpBoxGfx
	bl PrepRestartMuralBackground
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08093A58: .4byte 0x08CC3B18
_08093A5C: .4byte 0x03002870
_08093A60: .4byte 0x02022C60
_08093A64: .4byte 0x02023460
_08093A68: .4byte 0x02023C60
_08093A6C: .4byte 0x0000FFE0
_08093A70: .4byte 0x0000E0FF
_08093A74: .4byte PrepUnit_DrawSMSAndObjs
_08093A78: .4byte 0x06015000

	thumb_func_start sub_08093A7C
sub_08093A7C: @ 0x08093A7C
	push {lr}
	bl EndMenuScrollBar
	bl EndAllParallelWorkers
	bl EndSysBlackBoxs
	bl EndSysHandCursor
	bl EndHelpPromptSprite
	bl EndUiSpinningArrows
	bl EndMuralBackground_
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08093AA0
sub_08093AA0: @ 0x08093AA0
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	ldrh r1, [r5, #0x2e]
	cmp r0, r1
	beq _08093AAE
	b _08093CD2
_08093AAE:
	ldr r3, _08093AFC @ =0x08B857F8
	ldr r1, [r3]
	ldrh r6, [r1, #6]
	adds r2, r5, #0
	adds r2, #0x36
	movs r4, #4
	strb r4, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r7, [r1, #4]
	ands r0, r7
	cmp r0, #0
	beq _08093ACE
	ldrh r6, [r1, #4]
	movs r0, #8
	strb r0, [r2]
_08093ACE:
	ldr r0, [r3]
	ldrh r1, [r0, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08093B28
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _08093B04
	ldr r0, _08093B00 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _08093AF2
	b _08093D4C
_08093AF2:
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _08093D4C
	.align 2, 0
_08093AFC: .4byte 0x08B857F8
_08093B00: .4byte 0x0202BBF8
_08093B04:
	ldr r0, _08093B20 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08093B16
	ldr r0, _08093B24 @ =0x0000038A
	bl m4aSongNumStart
_08093B16:
	adds r0, r5, #0
	movs r1, #0x63
	bl Proc_Goto
	b _08093D4C
	.align 2, 0
_08093B20: .4byte 0x0202BBF8
_08093B24: .4byte 0x0000038A
_08093B28:
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _08093B54
	ldr r0, _08093B4C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08093B42
	ldr r0, _08093B50 @ =0x0000038A
	bl m4aSongNumStart
_08093B42:
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b _08093D4C
	.align 2, 0
_08093B4C: .4byte 0x0202BBF8
_08093B50: .4byte 0x0000038A
_08093B54:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08093B68
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
	b _08093D4C
_08093B68:
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08093B8A
	adds r0, r5, #0
	bl PrepUnit_HandlePressA
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08093B80
	b _08093D4C
_08093B80:
	adds r0, r5, #0
	movs r1, #1
	bl PrepUnit_DrawPickLeftBar
	b _08093D4C
_08093B8A:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08093BB8
	ldr r0, _08093BB0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08093BA4
	ldr r0, _08093BB4 @ =0x0000038B
	bl m4aSongNumStart
_08093BA4:
	adds r0, r5, #0
	movs r1, #0xa
	bl Proc_Goto
	b _08093D4C
	.align 2, 0
_08093BB0: .4byte 0x0202BBF8
_08093BB4: .4byte 0x0000038B
_08093BB8:
	movs r0, #0x20
	ands r0, r6
	cmp r0, #0
	beq _08093BCE
	ldrh r1, [r5, #0x2e]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08093BCE
	subs r0, r1, #1
	strh r0, [r5, #0x2e]
_08093BCE:
	movs r0, #0x10
	ands r0, r6
	cmp r0, #0
	beq _08093BF2
	movs r0, #1
	ldrh r1, [r5, #0x2e]
	ands r0, r1
	cmp r0, #0
	bne _08093BF2
	ldrh r4, [r5, #0x2e]
	bl PrepGetUnitAmount
	subs r0, #1
	cmp r4, r0
	bge _08093BF2
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
_08093BF2:
	movs r0, #0x40
	ands r0, r6
	cmp r0, #0
	beq _08093C04
	ldrh r0, [r5, #0x2e]
	subs r0, #2
	cmp r0, #0
	blt _08093C04
	strh r0, [r5, #0x2e]
_08093C04:
	movs r0, #0x80
	ands r6, r0
	cmp r6, #0
	beq _08093C20
	ldrh r4, [r5, #0x2e]
	adds r4, #2
	bl PrepGetUnitAmount
	subs r0, #1
	cmp r4, r0
	bgt _08093C20
	ldrh r0, [r5, #0x2e]
	adds r0, #2
	strh r0, [r5, #0x2e]
_08093C20:
	ldrh r3, [r5, #0x2c]
	ldrh r7, [r5, #0x2e]
	cmp r3, r7
	bne _08093C2A
	b _08093D4C
_08093C2A:
	ldrh r0, [r5, #0x2e]
	bl GetUnitFromPrepList
	bl PrepUnit_DrawUnitItems
	ldr r0, _08093C98 @ =PrepUnit_DrawLeftUnitNameCur
	movs r1, #1
	adds r2, r5, #0
	bl StartParallelFiniteLoop
	ldr r0, _08093C9C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08093C50
	ldr r0, _08093CA0 @ =0x00000385
	bl m4aSongNumStart
_08093C50:
	adds r0, r5, #0
	bl ShouldPrepUnitMenuScroll
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08093CA4
	ldrh r0, [r5, #0x2e]
	ldrh r1, [r5, #0x2c]
	cmp r0, r1
	bhs _08093C70
	ldrh r3, [r5, #0x30]
	lsrs r1, r3, #4
	subs r1, #1
	adds r0, r5, #0
	bl PrepUnit_DrawUnitListNames
_08093C70:
	ldrh r7, [r5, #0x2e]
	ldrh r0, [r5, #0x2c]
	cmp r7, r0
	bls _08093C84
	ldrh r3, [r5, #0x30]
	lsrs r1, r3, #4
	adds r1, #6
	adds r0, r5, #0
	bl PrepUnit_DrawUnitListNames
_08093C84:
	movs r1, #1
	ldrh r7, [r5, #0x2e]
	ands r1, r7
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x70
	bl SetSysHandCursorXPos
	b _08093CCA
	.align 2, 0
_08093C98: .4byte PrepUnit_DrawLeftUnitNameCur
_08093C9C: .4byte 0x0202BBF8
_08093CA0: .4byte 0x00000385
_08093CA4:
	ldrh r1, [r5, #0x2e]
	strh r1, [r5, #0x2c]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x11
	lsls r1, r1, #4
	ldrh r2, [r5, #0x30]
	subs r2, #0x18
	subs r1, r1, r2
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #7
	bl ShowSysHandCursor
_08093CCA:
	ldrh r0, [r5, #0x2c]
	ldrh r1, [r5, #0x2e]
	cmp r0, r1
	beq _08093D4C
_08093CD2:
	ldrh r2, [r5, #0x2e]
	ldrh r1, [r5, #0x2c]
	cmp r2, r1
	bhs _08093CE6
	adds r0, r5, #0
	adds r0, #0x36
	ldrh r3, [r5, #0x30]
	ldrb r0, [r0]
	subs r0, r3, r0
	strh r0, [r5, #0x30]
_08093CE6:
	cmp r2, r1
	bls _08093CF6
	adds r0, r5, #0
	adds r0, #0x36
	ldrh r7, [r5, #0x30]
	ldrb r0, [r0]
	adds r0, r7, r0
	strh r0, [r5, #0x30]
_08093CF6:
	ldrh r1, [r5, #0x30]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _08093D1C
	lsrs r0, r1, #4
	subs r0, #1
	bl PrepUpdateMenuTsaScroll
	ldrh r1, [r5, #0x30]
	lsrs r0, r1, #4
	adds r0, #6
	bl PrepUpdateMenuTsaScroll
	adds r0, r5, #0
	bl sub_08093814
	ldrh r0, [r5, #0x2e]
	strh r0, [r5, #0x2c]
_08093D1C:
	ldrh r2, [r5, #0x30]
	subs r2, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	ldrh r4, [r5, #0x30]
	bl PrepGetUnitAmount
	adds r2, r0, #0
	subs r2, #1
	lsrs r0, r2, #0x1f
	adds r2, r2, r0
	asrs r2, r2, #1
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0xa
	adds r1, r4, #0
	movs r3, #6
	bl UpdateMenuScrollBarConfig
_08093D4C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08093D54
sub_08093D54: @ 0x08093D54
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x34]
	adds r0, #4
	strh r0, [r4, #0x34]
	ldrh r1, [r4, #0x30]
	adds r1, #4
	strh r1, [r4, #0x30]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x20
	bne _08093D72
	adds r0, r4, #0
	bl Proc_Break
_08093D72:
	ldrh r2, [r4, #0x30]
	subs r2, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	ldrh r1, [r4, #0x30]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _08093D94
	lsrs r0, r1, #4
	subs r0, #1
	bl PrepUpdateMenuTsaScroll
_08093D94:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08093D9C
sub_08093D9C: @ 0x08093D9C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x30]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _08093DB4
	lsrs r1, r1, #4
	subs r1, #1
	adds r0, r4, #0
	bl PrepUnit_DrawUnitListNames
_08093DB4:
	ldrh r0, [r4, #0x34]
	subs r0, #4
	strh r0, [r4, #0x34]
	ldrh r1, [r4, #0x30]
	subs r1, #4
	strh r1, [r4, #0x30]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08093DCC
	adds r0, r4, #0
	bl Proc_Break
_08093DCC:
	ldrh r2, [r4, #0x30]
	subs r2, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08093DE4
sub_08093DE4: @ 0x08093DE4
	bx lr
	.align 2, 0

	thumb_func_start sub_08093DE8
sub_08093DE8: @ 0x08093DE8
	push {lr}
	bl sub_08093DE4
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0xd0
	movs r1, #0x68
	movs r2, #0
	bl ShowSysHandCursor
	pop {r0}
	bx r0

	thumb_func_start sub_08093E00
sub_08093E00: @ 0x08093E00
	push {lr}
	adds r3, r0, #0
	ldrh r1, [r3, #0x2e]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsrs r1, r1, #1
	lsls r1, r1, #4
	ldrh r2, [r3, #0x30]
	subs r2, #0x18
	subs r1, r1, r2
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #7
	bl ShowSysHandCursor
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08093E2C
sub_08093E2C: @ 0x08093E2C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08093E80 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08093E52
	ldr r0, _08093E84 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08093E52
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_08093E52:
	ldr r0, _08093E80 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x40
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _08093E78
	ldr r0, _08093E84 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08093E72
	ldr r0, _08093E88 @ =0x00000385
	bl m4aSongNumStart
_08093E72:
	adds r0, r4, #0
	bl Proc_Break
_08093E78:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08093E80: .4byte 0x08B857F8
_08093E84: .4byte 0x0202BBF8
_08093E88: .4byte 0x00000385

	thumb_func_start ProcPrepUnit_OnEnd
ProcPrepUnit_OnEnd: @ 0x08093E8C
	push {lr}
	ldr r2, [r0, #0x14]
	ldrh r1, [r0, #0x30]
	strh r1, [r2, #0x3c]
	ldr r1, [r0, #0x14]
	adds r2, r0, #0
	adds r2, #0x29
	ldrb r2, [r2]
	adds r1, #0x2b
	strb r2, [r1]
	ldrh r0, [r0, #0x2e]
	bl GetUnitFromPrepList
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl PrepSetLatestCharId
	bl EndMuralBackground_
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ProcPrepUnit_OnGameStart
ProcPrepUnit_OnGameStart: @ 0x08093EB8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	adds r0, #0x36
	movs r5, #1
	strb r5, [r0]
	ldr r0, [r4, #0x14]
	movs r1, #6
	bl Proc_Goto
	adds r4, #0x37
	strb r5, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08093ED8
sub_08093ED8: @ 0x08093ED8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	bl GetUnitFromPrepList
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl PrepSetLatestCharId
	adds r0, r4, #0
	bl StartUnitListScreenPrepMenu
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08093EF8
sub_08093EF8: @ 0x08093EF8
	push {r4, r5, lr}
	adds r4, r0, #0
	bl PrepGetLatestUnitIndex
	movs r1, #0
	strh r0, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	adds r4, #0x29
	strb r1, [r4]
	movs r5, #1
_08093F0C:
	adds r0, r5, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _08093F2E
	ldr r0, [r1]
	cmp r0, #0
	beq _08093F2E
	ldr r0, [r1, #0xc]
	ldr r1, _08093F3C @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _08093F2E
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
_08093F2E:
	adds r5, #1
	cmp r5, #0x3f
	ble _08093F0C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08093F3C: .4byte 0x0001000C

	thumb_func_start sub_08093F40
sub_08093F40: @ 0x08093F40
	ldr r2, _08093F60 @ =0x03002870
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	bx lr
	.align 2, 0
_08093F60: .4byte 0x03002870

	thumb_func_start sub_08093F64
sub_08093F64: @ 0x08093F64
	ldr r2, _08093F80 @ =0x03002870
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	bx lr
	.align 2, 0
_08093F80: .4byte 0x03002870

	thumb_func_start sub_08093F84
sub_08093F84: @ 0x08093F84
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x11
	bl SetStatScreenExcludedUnitFlags
	ldrh r0, [r4, #0x2e]
	bl GetUnitFromPrepList
	adds r1, r4, #0
	bl StartStatScreen
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08093FA0
sub_08093FA0: @ 0x08093FA0
	push {r4, lr}
	adds r4, r0, #0
	bl MakePrepUnitList
	bl GetLatestUnitIndexInPrepListByUId
	strh r0, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PrepItemTrade_ApplyItemSwap
PrepItemTrade_ApplyItemSwap: @ 0x08093FB8
	push {r4, r5, r6, lr}
	adds r6, r2, #0
	lsls r1, r1, #1
	adds r4, r0, #0
	adds r4, #0x1e
	adds r4, r4, r1
	ldrh r5, [r4]
	lsls r3, r3, #1
	adds r1, r6, #0
	adds r1, #0x1e
	adds r1, r1, r3
	ldrh r2, [r1]
	strh r2, [r4]
	strh r5, [r1]
	bl UnitRemoveInvalidItems
	adds r0, r6, #0
	bl UnitRemoveInvalidItems
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start PrepItemTrade_DpadKeyHandler
PrepItemTrade_DpadKeyHandler: @ 0x08093FE4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x34]
	ldr r0, _08094044 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x20
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0809405E
	movs r0, #8
	ands r0, r5
	cmp r0, #0
	beq _0809405E
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r2, r0, #0
	ldr r3, [r4, #0x38]
	cmp r3, #0xff
	beq _0809402E
	ldr r0, [r4, #0x3c]
	cmp r0, #0xff
	bne _0809402E
	ldr r0, [r4, #0x34]
	adds r0, #8
	asrs r0, r0, #3
	movs r1, #1
	ands r0, r1
	asrs r1, r3, #3
	cmp r0, r1
	beq _0809402E
	movs r0, #5
	cmp r2, #5
	beq _0809402C
	adds r0, r2, #1
_0809402C:
	adds r2, r0, #0
_0809402E:
	cmp r2, #0
	ble _0809405E
	ldr r1, [r4, #0x34]
	movs r0, #7
	ands r0, r1
	cmp r2, r0
	ble _08094048
	adds r0, r1, #0
	subs r0, #8
	b _0809404A
	.align 2, 0
_08094044: .4byte 0x08B857F8
_08094048:
	subs r0, r2, #1
_0809404A:
	str r0, [r4, #0x34]
	ldr r0, _080940B8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809405E
	ldr r0, _080940BC @ =0x00000387
	bl m4aSongNumStart
_0809405E:
	ldr r0, _080940C0 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _080940DA
	ldr r0, [r4, #0x34]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _080940DA
	ldr r0, [r4, #0x30]
	bl GetUnitItemCount
	adds r2, r0, #0
	ldr r3, [r4, #0x38]
	cmp r3, #0xff
	beq _080940A4
	ldr r0, [r4, #0x3c]
	cmp r0, #0xff
	bne _080940A4
	ldr r0, [r4, #0x34]
	adds r0, #8
	asrs r0, r0, #3
	movs r1, #1
	ands r0, r1
	asrs r1, r3, #3
	cmp r0, r1
	beq _080940A4
	movs r0, #5
	cmp r2, #5
	beq _080940A2
	adds r0, r2, #1
_080940A2:
	adds r2, r0, #0
_080940A4:
	cmp r2, #0
	ble _080940DA
	ldr r1, [r4, #0x34]
	movs r0, #7
	ands r0, r1
	cmp r2, r0
	ble _080940C4
	adds r0, r1, #0
	adds r0, #8
	b _080940C6
	.align 2, 0
_080940B8: .4byte 0x0202BBF8
_080940BC: .4byte 0x00000387
_080940C0: .4byte 0x08B857F8
_080940C4:
	adds r0, r2, #7
_080940C6:
	str r0, [r4, #0x34]
	ldr r0, _08094140 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080940DA
	ldr r0, _08094144 @ =0x00000387
	bl m4aSongNumStart
_080940DA:
	ldr r0, _08094148 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x40
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0809417A
	ldr r0, [r4, #0x34]
	asrs r0, r0, #3
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x2c
	adds r1, r1, r0
	ldr r0, [r1]
	bl GetUnitItemCount
	adds r3, r0, #0
	ldr r1, [r4, #0x38]
	cmp r1, #0xff
	beq _0809411C
	ldr r0, [r4, #0x3c]
	cmp r0, #0xff
	bne _0809411C
	ldr r0, [r4, #0x34]
	asrs r0, r0, #3
	asrs r1, r1, #3
	cmp r0, r1
	beq _0809411C
	movs r0, #5
	cmp r3, #5
	beq _0809411A
	adds r0, r3, #1
_0809411A:
	adds r3, r0, #0
_0809411C:
	ldr r2, [r4, #0x34]
	movs r0, #7
	ands r0, r2
	cmp r0, #0
	ble _08094150
	subs r0, r2, #1
	str r0, [r4, #0x34]
	ldr r0, _08094140 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809417A
	ldr r0, _0809414C @ =0x00000386
	bl m4aSongNumStart
	b _0809417A
	.align 2, 0
_08094140: .4byte 0x0202BBF8
_08094144: .4byte 0x00000387
_08094148: .4byte 0x08B857F8
_0809414C: .4byte 0x00000386
_08094150:
	ldr r0, _080941E0 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x40
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0809417A
	movs r0, #8
	ands r2, r0
	adds r0, r2, r3
	subs r0, #1
	str r0, [r4, #0x34]
	ldr r0, _080941E4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809417A
	ldr r0, _080941E8 @ =0x00000386
	bl m4aSongNumStart
_0809417A:
	ldr r0, _080941E0 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x80
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _08094212
	ldr r0, [r4, #0x34]
	asrs r0, r0, #3
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x2c
	adds r1, r1, r0
	ldr r0, [r1]
	bl GetUnitItemCount
	adds r3, r0, #0
	ldr r1, [r4, #0x38]
	cmp r1, #0xff
	beq _080941BC
	ldr r0, [r4, #0x3c]
	cmp r0, #0xff
	bne _080941BC
	ldr r0, [r4, #0x34]
	asrs r0, r0, #3
	asrs r1, r1, #3
	cmp r0, r1
	beq _080941BC
	movs r0, #5
	cmp r3, #5
	beq _080941BA
	adds r0, r3, #1
_080941BA:
	adds r3, r0, #0
_080941BC:
	ldr r2, [r4, #0x34]
	movs r0, #7
	ands r0, r2
	subs r1, r3, #1
	cmp r0, r1
	bge _080941EC
	adds r0, r2, #1
	str r0, [r4, #0x34]
	ldr r0, _080941E4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08094212
	ldr r0, _080941E8 @ =0x00000386
	bl m4aSongNumStart
	b _08094212
	.align 2, 0
_080941E0: .4byte 0x08B857F8
_080941E4: .4byte 0x0202BBF8
_080941E8: .4byte 0x00000386
_080941EC:
	ldr r0, _0809421C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x80
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08094212
	movs r0, #8
	ands r2, r0
	str r2, [r4, #0x34]
	ldr r0, _08094220 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08094212
	ldr r0, _08094224 @ =0x00000386
	bl m4aSongNumStart
_08094212:
	ldr r0, [r4, #0x34]
	cmp r5, r0
	bne _08094228
	movs r0, #0
	b _0809422A
	.align 2, 0
_0809421C: .4byte 0x08B857F8
_08094220: .4byte 0x0202BBF8
_08094224: .4byte 0x00000386
_08094228:
	movs r0, #1
_0809422A:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start DrawPrepScreenItems
DrawPrepScreenItems: @ 0x08094230
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r4, r0, #0
	mov sb, r1
	mov sl, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #8]
	movs r1, #0xb
	movs r2, #9
	movs r3, #0
	bl TmFillRect_t
	mov r0, sl
	bl GetUnitItemCount
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	cmp r0, r1
	bge _08094304
	adds r0, r4, #4
	str r0, [sp, #0x14]
	mov r8, r4
_0809426A:
	ldr r0, [sp, #0xc]
	lsls r1, r0, #1
	mov r0, sl
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r6, [r0]
	ldr r1, [sp, #8]
	cmp r1, #0
	beq _08094286
	mov r0, sl
	adds r1, r6, #0
	bl CanUnitUseItemPrepScreen
	b _0809428E
_08094286:
	mov r0, sl
	adds r1, r6, #0
	bl IsItemDisplayUseable
_0809428E:
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r0, sb
	bl ClearText
	adds r0, r6, #0
	bl GetItemName
	adds r1, r0, #0
	movs r2, #0
	lsls r0, r4, #0x18
	asrs r5, r0, #0x18
	cmp r5, #0
	bne _080942AC
	movs r2, #1
_080942AC:
	movs r0, #0
	str r0, [sp]
	str r1, [sp, #4]
	mov r0, sb
	ldr r1, [sp, #0x14]
	movs r3, #0
	bl PutDrawText
	mov r4, r8
	adds r4, #0x16
	movs r7, #1
	cmp r5, #0
	beq _080942C8
	movs r7, #2
_080942C8:
	adds r0, r6, #0
	bl GetItemUses
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r7, #0
	bl PutNumberOrBlank
	adds r0, r6, #0
	bl GetItemIcon
	adds r1, r0, #0
	mov r0, r8
	movs r2, #0x80
	lsls r2, r2, #7
	bl PutIcon
	movs r0, #8
	add sb, r0
	ldr r1, [sp, #0x14]
	adds r1, #0x80
	str r1, [sp, #0x14]
	movs r0, #0x80
	add r8, r0
	ldr r1, [sp, #0xc]
	adds r1, #1
	str r1, [sp, #0xc]
	ldr r0, [sp, #0x10]
	cmp r1, r0
	blt _0809426A
_08094304:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start DrawPrepScreenItemIcons
DrawPrepScreenItemIcons: @ 0x08094314
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	adds r0, r7, #0
	bl GetUnitItemCount
	adds r6, r0, #0
	movs r5, #0
	cmp r5, r6
	bge _0809434A
_08094328:
	lsls r1, r5, #1
	adds r0, r7, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemIcon
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x80
	lsls r2, r2, #7
	bl PutIcon
	adds r4, #0x80
	adds r5, #1
	cmp r5, r6
	blt _08094328
_0809434A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08094350
sub_08094350: @ 0x08094350
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x28
	mov r8, r0
	add r1, sp, #8
	ldr r0, _08094448 @ =0x0840F3C4
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	ldr r0, _0809444C @ =0x08CC3B18
	ldrh r0, [r0]
	bl InitBgs
	add r0, sp, #8
	bl SetFaceConfig
	ldr r3, _08094450 @ =0x03002870
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r4, [r3, #0xc]
	ands r0, r4
	movs r1, #1
	orrs r0, r1
	strb r0, [r3, #0xc]
	adds r0, r2, #0
	ldrb r1, [r3, #0x10]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r3, #0x10]
	ldrb r4, [r3, #0x14]
	ands r2, r4
	strb r2, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	movs r0, #0
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	bl ResetText
	bl InitIcons
	bl LoadUiFrameGraphics
	bl ApplySystemObjectsGraphics
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _08094454 @ =0x06014000
	movs r1, #1
	rsbs r1, r1, #0
	bl LoadHelpBoxGfx
	movs r0, #4
	bl ApplyIconPalettes
	bl PrepRestartMuralBackground
	ldr r0, _08094458 @ =0x02012A20
	adds r6, r0, #0
	adds r6, #0x28
	adds r5, r0, #0
	movs r4, #4
_08094416:
	adds r0, r5, #0
	movs r1, #7
	bl InitTextDb
	adds r0, r6, #0
	movs r1, #7
	bl InitTextDb
	adds r6, #8
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _08094416
	movs r0, #0xff
	mov r2, r8
	str r0, [r2, #0x38]
	ldr r1, [r2, #0x40]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0809445C
	adds r0, r1, #0
	adds r0, #8
	str r0, [r2, #0x34]
	b _08094476
	.align 2, 0
_08094448: .4byte 0x0840F3C4
_0809444C: .4byte 0x08CC3B18
_08094450: .4byte 0x03002870
_08094454: .4byte 0x06014000
_08094458: .4byte 0x02012A20
_0809445C:
	mov r3, r8
	ldr r0, [r3, #0x2c]
	bl GetUnitItemCount
	cmp r0, #0
	bne _08094470
	movs r0, #8
	mov r4, r8
	str r0, [r4, #0x34]
	b _08094476
_08094470:
	movs r0, #0
	mov r1, r8
	str r0, [r1, #0x34]
_08094476:
	movs r0, #0xff
	mov r2, r8
	str r0, [r2, #0x3c]
	ldr r0, [r2, #0x2c]
	bl GetUnitFid
	adds r1, r0, #0
	movs r4, #4
	rsbs r4, r4, #0
	ldr r0, _08094614 @ =0x00000203
	str r0, [sp]
	movs r0, #0
	movs r2, #0x40
	adds r3, r4, #0
	bl StartBmFace
	mov r3, r8
	ldr r0, [r3, #0x30]
	bl GetUnitFid
	adds r1, r0, #0
	ldr r0, _08094618 @ =0x00000202
	str r0, [sp]
	movs r0, #1
	movs r2, #0xae
	adds r3, r4, #0
	bl StartBmFace
	movs r6, #0
	str r6, [sp]
	movs r0, #1
	movs r1, #8
	movs r2, #0xe
	movs r3, #0xc
	bl DrawUiFrame2
	str r6, [sp]
	movs r0, #0xf
	movs r1, #8
	movs r2, #0xe
	movs r3, #0xc
	bl DrawUiFrame2
	movs r0, #7
	bl EnableBgSync
	mov r4, r8
	ldr r0, [r4, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetMsg
	adds r7, r0, #0
	bl GetStringTextLen
	adds r3, r0, #0
	movs r4, #0x30
	subs r3, r4, r3
	lsrs r0, r3, #0x1f
	adds r3, r3, r0
	asrs r3, r3, #1
	ldr r0, _0809461C @ =0x02022C60
	mov sb, r0
	movs r5, #6
	str r5, [sp]
	str r7, [sp, #4]
	movs r0, #0
	mov r1, sb
	movs r2, #0
	bl PutDrawText
	mov r1, r8
	ldr r0, [r1, #0x30]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetMsg
	adds r7, r0, #0
	bl GetStringTextLen
	subs r4, r4, r0
	lsrs r0, r4, #0x1f
	adds r4, r4, r0
	asrs r4, r4, #1
	mov r1, sb
	adds r1, #0x30
	str r5, [sp]
	str r7, [sp, #4]
	movs r0, #0
	movs r2, #0
	adds r3, r4, #0
	bl PutDrawText
	movs r0, #0x91
	lsls r0, r0, #2
	add r0, sb
	ldr r4, _08094620 @ =0x02012A20
	mov r3, r8
	ldr r2, [r3, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl DrawPrepScreenItems
	movs r0, #0x98
	lsls r0, r0, #2
	add r0, sb
	adds r4, #0x28
	mov r1, r8
	ldr r2, [r1, #0x30]
	adds r1, r4, #0
	movs r3, #0
	bl DrawPrepScreenItems
	mov r0, r8
	bl StartUiCursorHand
	mov r0, r8
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	mov r2, r8
	ldr r1, [r2, #0x34]
	asrs r2, r1, #3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x48
	movs r5, #0x80
	lsls r5, r5, #4
	movs r2, #0xb
	adds r3, r5, #0
	bl ShowSysHandCursor
	movs r0, #0xc8
	movs r1, #0x90
	mov r2, r8
	bl StartHelpPromptSprite
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [sp]
	mov r4, r8
	str r4, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl StartSysBrownBox
	movs r1, #0x28
	rsbs r1, r1, #0
	movs r4, #1
	rsbs r4, r4, #0
	movs r0, #0
	adds r2, r4, #0
	movs r3, #1
	bl EnableSysBrownBox
	movs r0, #1
	movs r1, #0xb8
	adds r2, r4, #0
	movs r3, #0
	bl EnableSysBrownBox
	ldr r3, _08094624 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x44
	movs r0, #0xe
	strb r0, [r1]
	adds r1, #1
	movs r0, #4
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
	ldr r0, _08094628 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	ldr r1, _0809462C @ =0x0000E0FF
	ands r0, r1
	orrs r0, r5
	strh r0, [r3, #0x3c]
	add sp, #0x28
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08094614: .4byte 0x00000203
_08094618: .4byte 0x00000202
_0809461C: .4byte 0x02022C60
_08094620: .4byte 0x02012A20
_08094624: .4byte 0x03002870
_08094628: .4byte 0x0000FFE0
_0809462C: .4byte 0x0000E0FF

	thumb_func_start sub_08094630
sub_08094630: @ 0x08094630
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r2, [r6, #0x3c]
	cmp r2, #0xff
	beq _0809465C
	ldr r0, _08094658 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	bne _08094650
	b _080948C4
_08094650:
	bl CloseHelpBox
	movs r0, #0xff
	b _08094924
	.align 2, 0
_08094658: .4byte 0x08B857F8
_0809465C:
	ldr r0, _08094698 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809469C
	ldr r2, [r6, #0x34]
	asrs r3, r2, #3
	lsls r1, r3, #2
	adds r0, r6, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	movs r4, #7
	ands r4, r2
	lsls r1, r4, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	bne _0809468C
	b _08094926
_0809468C:
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #4
	adds r0, #0x10
	lsls r1, r4, #4
	b _0809491C
	.align 2, 0
_08094698: .4byte 0x08B857F8
_0809469C:
	ldr r4, [r6, #0x38]
	cmp r4, #0xff
	bne _080946A4
	b _08094804
_080946A4:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080946AE
	b _080947B8
_080946AE:
	asrs r0, r4, #3
	lsls r0, r0, #2
	adds r7, r6, #0
	adds r7, #0x2c
	adds r0, r7, r0
	ldr r0, [r0]
	movs r1, #7
	mov r8, r1
	ands r4, r1
	ldr r3, [r6, #0x34]
	asrs r1, r3, #3
	lsls r1, r1, #2
	adds r1, r7, r1
	ldr r2, [r1]
	mov r1, r8
	ands r3, r1
	adds r1, r4, #0
	bl CheckValidLinkArenaItemSwap
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080946F0
	movs r1, #1
	rsbs r1, r1, #0
	ldr r2, _080946EC @ =0x000003AE
	adds r0, r1, #0
	adds r3, r6, #0
	bl StartPrepErrorHelpbox
	b _08094926
	.align 2, 0
_080946EC: .4byte 0x000003AE
_080946F0:
	ldr r1, [r6, #0x38]
	asrs r0, r1, #3
	lsls r0, r0, #2
	adds r0, r7, r0
	ldr r0, [r0]
	mov r2, r8
	ands r1, r2
	ldr r3, [r6, #0x34]
	asrs r2, r3, #3
	lsls r2, r2, #2
	adds r2, r7, r2
	ldr r2, [r2]
	mov r4, r8
	ands r3, r4
	bl PrepItemTrade_ApplyItemSwap
	ldr r4, _08094754 @ =0x02022EA4
	ldr r5, _08094758 @ =0x02012A20
	ldr r2, [r6, #0x2c]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl DrawPrepScreenItems
	adds r4, #0x1c
	adds r5, #0x28
	ldr r2, [r6, #0x30]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl DrawPrepScreenItems
	movs r0, #1
	bl EnableBgSync
	ldr r0, [r6, #0x38]
	asrs r0, r0, #3
	lsls r0, r0, #2
	adds r0, r7, r0
	ldr r0, [r0]
	bl GetUnitItemCount
	adds r2, r0, #0
	cmp r2, #0
	bne _0809475C
	ldr r0, [r6, #0x38]
	adds r0, #8
	movs r1, #8
	ands r0, r1
	b _08094770
	.align 2, 0
_08094754: .4byte 0x02022EA4
_08094758: .4byte 0x02012A20
_0809475C:
	ldr r1, [r6, #0x38]
	adds r0, r1, #0
	mov r3, r8
	ands r0, r3
	cmp r2, r0
	bgt _08094772
	movs r0, #8
	ands r1, r0
	adds r0, r1, r2
	subs r0, #1
_08094770:
	str r0, [r6, #0x38]
_08094772:
	ldr r0, _080947B0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08094784
	ldr r0, _080947B4 @ =0x0000038A
	bl m4aSongNumStart
_08094784:
	movs r0, #0
	bl DisableUiCursorHand
	ldr r1, [r6, #0x38]
	str r1, [r6, #0x34]
	movs r0, #0xff
	str r0, [r6, #0x38]
	asrs r2, r1, #3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #0xb
	bl ShowSysHandCursor
	b _08094926
	.align 2, 0
_080947B0: .4byte 0x0202BBF8
_080947B4: .4byte 0x0000038A
_080947B8:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080947C2
	b _080948C4
_080947C2:
	str r4, [r6, #0x34]
	str r2, [r6, #0x38]
	asrs r1, r4, #3
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0x10
	movs r1, #7
	ands r4, r1
	lsls r1, r4, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #0xb
	bl ShowSysHandCursor
	ldr r0, _080947FC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080947F4
	ldr r0, _08094800 @ =0x0000038B
	bl m4aSongNumStart
_080947F4:
	movs r0, #0
	bl DisableUiCursorHand
	b _08094926
	.align 2, 0
_080947FC: .4byte 0x0202BBF8
_08094800: .4byte 0x0000038B
_08094804:
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08094898
	ldr r0, [r6, #0x34]
	asrs r0, r0, #3
	adds r0, #1
	ands r0, r2
	lsls r0, r0, #2
	adds r1, r6, #0
	adds r1, #0x2c
	adds r1, r1, r0
	ldr r0, [r1]
	bl GetUnitItemCount
	adds r4, r0, #0
	ldr r2, [r6, #0x34]
	str r2, [r6, #0x38]
	asrs r0, r2, #3
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #4
	adds r1, #0x10
	movs r0, #7
	ands r2, r0
	lsls r2, r2, #4
	adds r2, #0x48
	movs r0, #0
	movs r3, #0
	bl SetUiCursorHandConfig
	cmp r4, #4
	bgt _08094854
	ldr r0, [r6, #0x34]
	adds r0, #8
	movs r1, #8
	ands r0, r1
	adds r0, r0, r4
	b _0809485C
_08094854:
	ldr r0, [r6, #0x34]
	adds r0, #8
	movs r1, #0xf
	ands r0, r1
_0809485C:
	str r0, [r6, #0x34]
	ldr r1, [r6, #0x34]
	asrs r2, r1, #3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #0xb
	bl ShowSysHandCursor
	ldr r0, _08094890 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08094926
	ldr r0, _08094894 @ =0x0000038A
	bl m4aSongNumStart
	b _08094926
	.align 2, 0
_08094890: .4byte 0x0202BBF8
_08094894: .4byte 0x0000038A
_08094898:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080948C4
	adds r0, r6, #0
	bl Proc_Break
	ldr r0, _080948BC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08094926
	ldr r0, _080948C0 @ =0x0000038B
	bl m4aSongNumStart
	b _08094926
	.align 2, 0
_080948BC: .4byte 0x0202BBF8
_080948C0: .4byte 0x0000038B
_080948C4:
	adds r0, r6, #0
	bl PrepItemTrade_DpadKeyHandler
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08094926
	ldr r1, [r6, #0x34]
	asrs r2, r1, #3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	movs r5, #7
	ands r1, r5
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #0xb
	bl ShowSysHandCursor
	ldr r0, [r6, #0x3c]
	cmp r0, #0xff
	beq _08094926
	ldr r2, [r6, #0x34]
	asrs r4, r2, #3
	lsls r1, r4, #2
	adds r0, r6, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	adds r3, r5, #0
	ands r3, r2
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _08094926
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #4
	adds r0, #0x10
	lsls r1, r3, #4
_0809491C:
	adds r1, #0x48
	bl StartItemHelpBox
	ldr r0, [r6, #0x34]
_08094924:
	str r0, [r6, #0x3c]
_08094926:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08094930
sub_08094930: @ 0x08094930
	push {lr}
	bl EndMuralBackground_
	movs r0, #0
	bl EndFaceById
	movs r0, #1
	bl EndFaceById
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartPrepItemTradeScreenProc
StartPrepItemTradeScreenProc: @ 0x08094948
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	ldr r0, _08094968 @ =0x08CC49E4
	bl SpawnProcLocking
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [r0, #0x40]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08094968: .4byte 0x08CC49E4

	thumb_func_start sub_0809496C
sub_0809496C: @ 0x0809496C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, _08094988 @ =0x08CC49E4
	bl SpawnProcLocking
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x40]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08094988: .4byte 0x08CC49E4

	thumb_func_start PrepItemUseTryMoveHand
PrepItemUseTryMoveHand: @ 0x0809498C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r5, _080949B8 @ =0x08B857F8
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0
	beq _080949CE
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r2, r0, #0
	ldr r0, [r4, #0x30]
	cmp r0, #0
	ble _080949BC
	subs r0, #1
	str r0, [r4, #0x30]
	b _080949FA
	.align 2, 0
_080949B8: .4byte 0x08B857F8
_080949BC:
	ldr r1, [r5]
	adds r0, r7, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08094A18
	subs r0, r2, #1
	str r0, [r4, #0x30]
	b _080949FA
_080949CE:
	movs r7, #0x80
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _08094A18
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	subs r0, #1
	ldr r1, [r4, #0x30]
	cmp r1, r0
	bge _080949EC
	adds r0, r1, #1
	str r0, [r4, #0x30]
	b _080949FA
_080949EC:
	ldr r1, [r5]
	adds r0, r7, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08094A18
	str r6, [r4, #0x30]
_080949FA:
	ldr r0, _08094A10 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08094A0C
	ldr r0, _08094A14 @ =0x00000386
	bl m4aSongNumStart
_08094A0C:
	movs r0, #1
	b _08094A1A
	.align 2, 0
_08094A10: .4byte 0x0202BBF8
_08094A14: .4byte 0x00000386
_08094A18:
	movs r0, #0
_08094A1A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_08094A20
sub_08094A20: @ 0x08094A20
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov r8, r0
	ldr r6, _08094A88 @ =0x020129A8
	adds r5, r6, #0
	movs r4, #7
_08094A30:
	adds r0, r5, #0
	bl ClearText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _08094A30
	ldr r0, _08094A8C @ =0x000010F4
	bl GetMsg
	adds r1, r6, #0
	adds r6, #8
	ldr r5, _08094A90 @ =0x02023D82
	movs r7, #0
	str r7, [sp]
	str r0, [sp, #4]
	adds r0, r1, #0
	adds r1, r5, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	mov r0, r8
	bl UnitKnowsMagic
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	beq _08094A98
	ldr r0, _08094A94 @ =0x000010F9
	bl GetMsg
	adds r2, r6, #0
	adds r6, #8
	adds r1, r5, #0
	adds r1, #0x80
	str r7, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	b _08094AB4
	.align 2, 0
_08094A88: .4byte 0x020129A8
_08094A8C: .4byte 0x000010F4
_08094A90: .4byte 0x02023D82
_08094A94: .4byte 0x000010F9
_08094A98:
	ldr r0, _08094BA8 @ =0x000010F8
	bl GetMsg
	adds r2, r6, #0
	adds r6, #8
	adds r1, r5, #0
	adds r1, #0x80
	str r4, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
_08094AB4:
	ldr r0, _08094BAC @ =0x000010FB
	bl GetMsg
	adds r1, r6, #0
	adds r6, #8
	ldr r7, _08094BB0 @ =0x02023E82
	movs r5, #0
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r1, #0
	adds r1, r7, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	ldr r0, _08094BB4 @ =0x000010FC
	bl GetMsg
	adds r2, r6, #0
	adds r6, #8
	adds r1, r7, #0
	adds r1, #0x80
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	ldr r0, _08094BB8 @ =0x000010FD
	bl GetMsg
	adds r2, r6, #0
	adds r6, #8
	adds r1, r7, #0
	subs r1, #0xf4
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	ldr r0, _08094BBC @ =0x000010FE
	bl GetMsg
	adds r2, r6, #0
	adds r6, #8
	adds r1, r7, #0
	subs r1, #0x74
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	ldr r0, _08094BC0 @ =0x000010FF
	bl GetMsg
	adds r2, r6, #0
	adds r6, #8
	adds r1, r7, #0
	adds r1, #0xc
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	ldr r0, _08094BC4 @ =0x00001107
	bl GetMsg
	adds r2, r6, #0
	adds r6, #8
	adds r1, r7, #0
	adds r1, #0x8c
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	mov r1, r8
	ldr r0, [r1, #4]
	ldrh r0, [r0]
	bl GetMsg
	adds r4, r0, #0
	movs r0, #0x38
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	adds r0, r6, #0
	ldr r2, _08094BC8 @ =0xFFFFFE0A
	adds r1, r7, r2
	str r5, [sp]
	str r4, [sp, #4]
	movs r2, #0
	bl PutDrawText
	ldr r1, _08094BCC @ =0xFFFFFE02
	adds r0, r7, r1
	movs r1, #3
	movs r2, #0x24
	bl PutSpecialChar
	ldr r2, _08094BD0 @ =0xFFFFFE04
	adds r0, r7, r2
	movs r1, #3
	movs r2, #0x25
	bl PutSpecialChar
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08094BA8: .4byte 0x000010F8
_08094BAC: .4byte 0x000010FB
_08094BB0: .4byte 0x02023E82
_08094BB4: .4byte 0x000010FC
_08094BB8: .4byte 0x000010FD
_08094BBC: .4byte 0x000010FE
_08094BC0: .4byte 0x000010FF
_08094BC4: .4byte 0x00001107
_08094BC8: .4byte 0xFFFFFE0A
_08094BCC: .4byte 0xFFFFFE02
_08094BD0: .4byte 0xFFFFFE04

	thumb_func_start DrawPrepScreenItemUseStatBars
DrawPrepScreenItemUseStatBars: @ 0x08094BD4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x2c
	adds r5, r0, #0
	mov r8, r1
	movs r0, #2
	bl ApplyUiStatBarPal
	add r4, sp, #0xc
	adds r0, r5, #0
	bl GetUnitCurrentHp
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r2, r0, #3
	movs r0, #0xc0
	ldrb r3, [r5, #0xb]
	ands r0, r3
	cmp r0, #0x80
	beq _08094C06
	adds r0, r2, #0
	movs r1, #0x3c
	b _08094C0A
_08094C06:
	adds r0, r1, #0
	movs r1, #5
_08094C0A:
	bl __divsi3
	str r0, [r4]
	adds r0, r5, #0
	bl GetUnitPower
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r5, #4]
	ldrb r1, [r1, #0x14]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl __divsi3
	str r0, [sp, #0x10]
	adds r0, r5, #0
	bl GetUnitSkill
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r5, #4]
	ldrb r1, [r1, #0x15]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl __divsi3
	str r0, [sp, #0x14]
	adds r0, r5, #0
	bl GetUnitSpeed
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r5, #4]
	ldrb r1, [r1, #0x16]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl __divsi3
	str r0, [sp, #0x18]
	adds r0, r5, #0
	bl GetUnitLuck
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	movs r1, #0x1e
	bl __divsi3
	str r0, [sp, #0x1c]
	adds r0, r5, #0
	bl GetUnitDefense
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r5, #4]
	ldrb r1, [r1, #0x17]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl __divsi3
	str r0, [sp, #0x20]
	adds r0, r5, #0
	bl GetUnitResistance
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r4, [r5, #4]
	movs r1, #0x18
	ldrsb r1, [r4, r1]
	bl __divsi3
	str r0, [sp, #0x24]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	ldr r0, [r5]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	movs r0, #0x1a
	ldrsb r0, [r5, r0]
	adds r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	movs r1, #0x19
	ldrsb r1, [r4, r1]
	bl __divsi3
	str r0, [sp, #0x28]
	movs r5, #0
	add r6, sp, #0xc
	movs r7, #0xe0
	lsls r7, r7, #7
_08094CDC:
	mov r4, r8
	asrs r4, r5
	movs r0, #1
	ands r4, r0
	cmp r4, #0
	beq _08094D20
	lsls r0, r7, #0xf
	lsrs r0, r0, #0x14
	movs r2, #3
	ands r2, r5
	lsls r2, r2, #6
	adds r2, #0xb3
	asrs r3, r5, #2
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #1
	adds r2, r2, r1
	lsls r2, r2, #1
	ldr r1, _08094D1C @ =0x02022C60
	adds r2, r2, r1
	movs r1, #0x18
	str r1, [sp]
	ldr r1, [r6]
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #4
	movs r3, #0xc0
	lsls r3, r3, #6
	bl PutDrawUiGauge
	b _08094D50
	.align 2, 0
_08094D1C: .4byte 0x02022C60
_08094D20:
	lsls r0, r7, #0xf
	lsrs r0, r0, #0x14
	movs r2, #3
	ands r2, r5
	lsls r2, r2, #6
	adds r2, #0xb3
	asrs r3, r5, #2
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #1
	adds r2, r2, r1
	lsls r2, r2, #1
	ldr r1, _08094D70 @ =0x02022C60
	adds r2, r2, r1
	movs r1, #0x18
	str r1, [sp]
	ldr r1, [r6]
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #4
	movs r3, #0x80
	lsls r3, r3, #6
	bl PutDrawUiGauge
_08094D50:
	adds r6, #4
	movs r0, #0x80
	lsls r0, r0, #1
	adds r7, r7, r0
	adds r5, #1
	cmp r5, #7
	ble _08094CDC
	movs r0, #1
	bl EnableBgSync
	add sp, #0x2c
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08094D70: .4byte 0x02022C60

	thumb_func_start sub_08094D74
sub_08094D74: @ 0x08094D74
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r6, _08094D90 @ =0x02023D8A
	bl GetUnitCurrentHp
	adds r1, r0, #0
	movs r0, #0xc0
	ldrb r2, [r4, #0xb]
	ands r0, r2
	cmp r0, #0x80
	bne _08094D94
	cmp r1, #0x78
	beq _08094D98
	b _08094D9C
	.align 2, 0
_08094D90: .4byte 0x02023D8A
_08094D94:
	cmp r1, #0x3c
	bne _08094D9C
_08094D98:
	movs r5, #4
	b _08094D9E
_08094D9C:
	movs r5, #2
_08094D9E:
	adds r0, r4, #0
	bl GetUnitCurrentHp
	adds r2, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl PutNumberOrBlank
	ldr r5, _08094EEC @ =0x02023E0A
	adds r0, r4, #0
	bl GetUnitPower
	ldr r1, [r4, #4]
	ldrb r1, [r1, #0x14]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r6, #2
	cmp r0, r1
	bne _08094DC6
	movs r6, #4
_08094DC6:
	adds r0, r4, #0
	bl GetUnitPower
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	adds r7, #0x80
	adds r0, r4, #0
	bl GetUnitSkill
	ldr r1, [r4, #4]
	ldrb r1, [r1, #0x15]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r6, #2
	cmp r0, r1
	bne _08094DF0
	movs r6, #4
_08094DF0:
	adds r0, r4, #0
	bl GetUnitSkill
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	movs r0, #0x80
	lsls r0, r0, #1
	adds r7, r5, r0
	adds r0, r4, #0
	bl GetUnitSpeed
	ldr r1, [r4, #4]
	ldrb r1, [r1, #0x16]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r6, #2
	cmp r0, r1
	bne _08094E1C
	movs r6, #4
_08094E1C:
	adds r0, r4, #0
	bl GetUnitSpeed
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	subs r7, #0x74
	adds r0, r4, #0
	bl GetUnitLuck
	movs r6, #2
	cmp r0, #0x1e
	bne _08094E3E
	movs r6, #4
_08094E3E:
	adds r0, r4, #0
	bl GetUnitLuck
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	adds r7, #0xc
	adds r0, r4, #0
	bl GetUnitDefense
	ldr r1, [r4, #4]
	ldrb r1, [r1, #0x17]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r6, #2
	cmp r0, r1
	bne _08094E68
	movs r6, #4
_08094E68:
	adds r0, r4, #0
	bl GetUnitDefense
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	adds r7, #0x8c
	adds r0, r4, #0
	bl GetUnitResistance
	ldr r1, [r4, #4]
	ldrb r1, [r1, #0x18]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r6, #2
	cmp r0, r1
	bne _08094E92
	movs r6, #4
_08094E92:
	adds r0, r4, #0
	bl GetUnitResistance
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	movs r1, #0x86
	lsls r1, r1, #1
	adds r6, r5, r1
	ldr r2, [r4, #4]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r0, [r4]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	movs r0, #0x1a
	ldrsb r0, [r4, r0]
	adds r3, r1, r0
	movs r0, #0x19
	ldrsb r0, [r2, r0]
	movs r1, #2
	cmp r3, r0
	bne _08094ECA
	movs r1, #4
_08094ECA:
	adds r0, r6, #0
	adds r2, r3, #0
	bl PutNumberOrBlank
	ldr r2, _08094EF0 @ =0xFFFFFE80
	adds r0, r5, r2
	movs r2, #8
	ldrsb r2, [r4, r2]
	movs r1, #2
	bl PutNumberOrBlank
	movs r0, #4
	bl EnableBgSync
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08094EEC: .4byte 0x02023E0A
_08094EF0: .4byte 0xFFFFFE80

	thumb_func_start sub_08094EF4
sub_08094EF4: @ 0x08094EF4
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r6, r0, #0
	adds r4, r1, #0
	mov r1, sp
	ldr r0, _08094F70 @ =0x0840F3E4
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldr r0, [sp]
	bl ClearText
	ldr r0, [sp, #4]
	bl ClearText
	ldr r0, [sp, #8]
	bl ClearText
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	beq _08094FA2
	lsls r1, r4, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemUseDescId
	adds r5, r0, #0
	cmp r5, #0
	beq _08094FA2
	adds r0, r6, #0
	adds r1, r4, #0
	bl CanUnitUseItemPrepScreen
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08094F78
	ldr r0, [sp]
	movs r1, #0
	bl Text_SetColor
	ldr r0, [sp, #4]
	movs r1, #0
	bl Text_SetColor
	ldr r0, [sp, #8]
	movs r1, #0
	bl Text_SetColor
	adds r0, r5, #0
	bl GetMsg
	adds r1, r0, #0
	ldr r2, _08094F74 @ =0x02022FBE
	mov r0, sp
	movs r3, #3
	bl PrintStringToTexts
	b _08094FA2
	.align 2, 0
_08094F70: .4byte 0x0840F3E4
_08094F74: .4byte 0x02022FBE
_08094F78:
	ldr r0, [sp]
	movs r1, #1
	bl Text_SetColor
	ldr r0, [sp, #4]
	movs r1, #1
	bl Text_SetColor
	ldr r0, [sp, #8]
	movs r1, #1
	bl Text_SetColor
	adds r0, r5, #0
	bl GetMsg
	adds r1, r0, #0
	ldr r2, _08094FB0 @ =0x02022FBE
	mov r0, sp
	movs r3, #3
	bl PrintStringToTexts
_08094FA2:
	movs r0, #1
	bl EnableBgSync
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08094FB0: .4byte 0x02022FBE

	thumb_func_start sub_08094FB4
sub_08094FB4: @ 0x08094FB4
	push {lr}
	sub sp, #4
	movs r3, #0xc8
	lsls r3, r3, #8
	ldr r0, [r0, #0x2c]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #4]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x80
	movs r2, #2
	bl PutUnitSpriteForClassId
	bl SyncUnitSpriteSheet
	add sp, #4
	pop {r0}
	bx r0

	thumb_func_start PrepItemUse_OnInit
PrepItemUse_OnInit: @ 0x08094FD8
	movs r1, #0
	str r1, [r0, #0x30]
	movs r1, #0xff
	str r1, [r0, #0x38]
	bx lr
	.align 2, 0

	thumb_func_start sub_08094FE4
sub_08094FE4: @ 0x08094FE4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	adds r7, r0, #0
	add r1, sp, #8
	ldr r0, _080952EC @ =0x0840F3F0
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r5, r6}
	stm r1!, {r2, r5, r6}
	ldm r0!, {r3, r4}
	stm r1!, {r3, r4}
	ldr r4, _080952F0 @ =0x03002870
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r5, [r4]
	ands r0, r5
	strb r0, [r4]
	ldr r0, _080952F4 @ =0x08CC3B18
	bl InitBgs
	add r0, sp, #8
	bl SetFaceConfig
	movs r0, #0xff
	str r0, [r7, #0x34]
	movs r0, #0
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r6, [r4, #0xc]
	ands r0, r6
	movs r1, #1
	orrs r0, r1
	strb r0, [r4, #0xc]
	adds r0, r2, #0
	ldrb r1, [r4, #0x10]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r4, #0x10]
	ldrb r3, [r4, #0x14]
	ands r2, r3
	strb r2, [r4, #0x14]
	movs r0, #3
	ldrb r5, [r4, #0x18]
	orrs r0, r5
	strb r0, [r4, #0x18]
	bl ResetText
	bl InitIcons
	bl LoadUiFrameGraphics
	bl ApplySystemObjectsGraphics
	bl ApplyUnitSpritePalettes
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _080952F8 @ =0x06014000
	movs r1, #1
	rsbs r1, r1, #0
	bl LoadHelpBoxGfx
	movs r0, #4
	bl ApplyIconPalettes
	bl PrepRestartMuralBackground
	ldr r4, _080952FC @ =0x02012A20
	movs r6, #4
	mov sl, r6
_080950B8:
	adds r0, r4, #0
	movs r1, #7
	bl InitTextDb
	adds r4, #8
	movs r0, #1
	rsbs r0, r0, #0
	add sl, r0
	mov r1, sl
	cmp r1, #0
	bge _080950B8
	ldr r4, _08095300 @ =0x020129A8
	movs r2, #7
	mov sl, r2
_080950D4:
	adds r0, r4, #0
	movs r1, #3
	bl InitText
	adds r4, #8
	movs r3, #1
	rsbs r3, r3, #0
	add sl, r3
	mov r5, sl
	cmp r5, #0
	bge _080950D4
	movs r6, #8
	mov sl, r6
	ldr r0, _08095300 @ =0x020129A8
	mov sb, r0
	adds r0, #0x40
	movs r1, #7
	bl InitText
	mov r0, sb
	adds r0, #0xc8
	movs r1, #0xf
	bl InitText
	mov r0, sb
	adds r0, #0xd0
	movs r1, #0xf
	bl InitText
	mov r0, sb
	adds r0, #0xe8
	movs r1, #0xf
	bl InitText
	mov r0, sb
	adds r0, #0xd8
	movs r1, #0xc
	bl InitText
	mov r0, sb
	adds r0, #0xe0
	movs r1, #8
	bl InitText
	ldr r0, [r7, #0x2c]
	bl sub_08094A20
	ldr r0, [r7, #0x2c]
	bl sub_08094D74
	ldr r0, [r7, #0x2c]
	movs r1, #0
	bl DrawPrepScreenItemUseStatBars
	ldr r0, [r7, #0x2c]
	bl GetUnitFid
	adds r1, r0, #0
	movs r3, #4
	rsbs r3, r3, #0
	ldr r0, _08095304 @ =0x00000203
	str r0, [sp]
	movs r0, #0
	movs r2, #0x40
	bl StartBmFace
	movs r0, #0xc0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_08091944
	movs r0, #0xc0
	lsls r0, r0, #6
	movs r1, #0xa
	bl sub_08091994
	ldr r0, _08095308 @ =0x02023460
	ldr r1, _0809530C @ =0x0840E50C
	movs r2, #0xa6
	lsls r2, r2, #7
	bl sub_080AACD8
	movs r0, #7
	bl EnableBgSync
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r2, #0
	str r2, [sp]
	str r7, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl StartSysBrownBox
	movs r1, #0x28
	rsbs r1, r1, #0
	movs r2, #1
	rsbs r2, r2, #0
	movs r0, #0
	movs r3, #1
	bl EnableSysBrownBox
	ldr r0, [r7, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetMsg
	adds r4, r0, #0
	bl GetStringTextLen
	movs r3, #0x30
	subs r3, r3, r0
	lsrs r0, r3, #0x1f
	adds r3, r3, r0
	asrs r3, r3, #1
	movs r0, #6
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0
	ldr r1, _08095310 @ =0x02022C60
	movs r2, #0
	bl PutDrawText
	adds r0, r7, #0
	bl StartUiCursorHand
	adds r0, r7, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	ldr r0, _08095314 @ =sub_08094FB4
	adds r1, r7, #0
	bl StartParallelWorker
	ldr r3, _080952F0 @ =0x03002870
	mov ip, r3
	movs r0, #0x20
	ldrb r4, [r3, #1]
	orrs r0, r4
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	mov r1, ip
	adds r1, #0x2d
	movs r0, #0x68
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x66
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x9a
	strb r0, [r1]
	movs r0, #1
	ldr r5, _08095318 @ =0x030028A4
	ldrb r1, [r5]
	orrs r1, r0
	movs r6, #2
	orrs r1, r6
	movs r4, #4
	orrs r1, r4
	movs r3, #8
	orrs r1, r3
	movs r2, #0x10
	orrs r1, r2
	movs r5, #0x36
	add r5, ip
	mov r8, r5
	ldrb r6, [r5]
	orrs r0, r6
	movs r5, #2
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	orrs r0, r2
	movs r6, #0x20
	orrs r1, r6
	ldr r2, _08095318 @ =0x030028A4
	strb r1, [r2]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	mov r3, r8
	strb r0, [r3]
	mov r1, ip
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r4, [r1]
	orrs r0, r4
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x44
	movs r5, #0
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	adds r0, #1
	mov r6, sl
	strb r6, [r0]
	ldr r0, _0809531C @ =0x0000FFE0
	mov r1, ip
	ldrh r1, [r1, #0x3c]
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	mov r2, ip
	strh r0, [r2, #0x3c]
	adds r0, r7, #0
	bl StartGreenText
	movs r0, #0xc4
	movs r1, #0x90
	adds r2, r7, #0
	bl StartHelpPromptSprite
	ldr r0, [r7, #0x2c]
	ldr r1, [r7, #0x30]
	bl sub_08094EF4
	mov r1, sb
	adds r1, #0x78
	ldr r2, [r7, #0x2c]
	ldr r0, _08095320 @ =0x02022EA4
	movs r3, #1
	bl DrawPrepScreenItems
	ldr r1, [r7, #0x30]
	asrs r2, r1, #3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #0xb
	bl ShowSysHandCursor
	ldr r0, [r7, #0x2c]
	bl GetUnitSMSId
	bl UseUnitSprite
	bl ForceSyncUnitSpriteSheet
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080952EC: .4byte 0x0840F3F0
_080952F0: .4byte 0x03002870
_080952F4: .4byte 0x08CC3B18
_080952F8: .4byte 0x06014000
_080952FC: .4byte 0x02012A20
_08095300: .4byte 0x020129A8
_08095304: .4byte 0x00000203
_08095308: .4byte 0x02023460
_0809530C: .4byte 0x0840E50C
_08095310: .4byte 0x02022C60
_08095314: .4byte sub_08094FB4
_08095318: .4byte 0x030028A4
_0809531C: .4byte 0x0000FFE0
_08095320: .4byte 0x02022EA4

	thumb_func_start sub_08095324
sub_08095324: @ 0x08095324
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	cmp r0, #0xff
	beq _0809534C
	ldr r0, _08095348 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08095404
	bl CloseHelpBox
	movs r0, #0xff
	b _0809544C
	.align 2, 0
_08095348: .4byte 0x08B857F8
_0809534C:
	ldr r0, _080953B0 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08095430
	movs r5, #1
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _080953D8
	ldr r0, [r4, #0x2c]
	ldr r2, [r4, #0x30]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r1, [r1]
	bl CanUnitUseItemPrepScreen
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080953BC
	ldr r2, [r4, #0x30]
	str r2, [r4, #0x34]
	lsls r2, r2, #4
	adds r2, #0x48
	movs r0, #0
	movs r1, #0x10
	movs r3, #0
	bl SetUiCursorHandConfig
	str r5, [r4, #0x3c]
	ldr r0, _080953B4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080953A4
	ldr r0, _080953B8 @ =0x0000038A
	bl m4aSongNumStart
_080953A4:
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	b _0809544E
	.align 2, 0
_080953B0: .4byte 0x08B857F8
_080953B4: .4byte 0x0202BBF8
_080953B8: .4byte 0x0000038A
_080953BC:
	ldr r0, _080953D4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809544E
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _0809544E
	.align 2, 0
_080953D4: .4byte 0x0202BBF8
_080953D8:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08095404
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	ldr r0, _080953FC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809544E
	ldr r0, _08095400 @ =0x0000038B
	bl m4aSongNumStart
	b _0809544E
	.align 2, 0
_080953FC: .4byte 0x0202BBF8
_08095400: .4byte 0x0000038B
_08095404:
	adds r0, r4, #0
	bl PrepItemUseTryMoveHand
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809544E
	ldr r1, [r4, #0x30]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	bl sub_08094EF4
	ldr r0, [r4, #0x38]
	cmp r0, #0xff
	beq _0809544E
_08095430:
	ldr r0, [r4, #0x2c]
	ldr r3, [r4, #0x30]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _0809544E
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
	ldr r0, [r4, #0x30]
_0809544C:
	str r0, [r4, #0x38]
_0809544E:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08095454
sub_08095454: @ 0x08095454
	push {lr}
	bl EndMuralBackground_
	movs r0, #0
	bl EndFaceById
	movs r0, #1
	bl EndFaceById
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0809546C
sub_0809546C: @ 0x0809546C
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r4, _080954D8 @ =0x02012A80
	adds r0, r4, #0
	bl ClearText
	ldr r0, _080954DC @ =0x00001269
	bl GetMsg
	adds r1, r4, #0
	adds r4, #8
	ldr r5, _080954E0 @ =0x02023FC2
	movs r6, #0
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r1, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	adds r0, r4, #0
	bl ClearText
	ldr r0, _080954E4 @ =0x000010EE
	bl GetMsg
	adds r5, #0x82
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	ldr r0, _080954E8 @ =0x000010EF
	bl GetMsg
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0x20
	bl PutDrawText
	movs r0, #4
	bl EnableBgSync
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080954D8: .4byte 0x02012A80
_080954DC: .4byte 0x00001269
_080954E0: .4byte 0x02023FC2
_080954E4: .4byte 0x000010EE
_080954E8: .4byte 0x000010EF

	thumb_func_start PrepItemUseClearSubBox
PrepItemUseClearSubBox: @ 0x080954EC
	push {lr}
	ldr r0, _08095504 @ =0x02023FC2
	movs r1, #0xd
	movs r2, #4
	movs r3, #0
	bl TmFillRect_t
	movs r0, #4
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_08095504: .4byte 0x02023FC2

	thumb_func_start sub_08095508
sub_08095508: @ 0x08095508
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0809546C
	ldr r0, [r4, #0x3c]
	lsls r0, r0, #5
	adds r0, #0x8c
	movs r3, #0x80
	lsls r3, r3, #4
	movs r1, #0x78
	movs r2, #0
	bl ShowSysHandCursor
	pop {r4}
	pop {r0}
	bx r0

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

	thumb_func_start sub_0809565C
sub_0809565C: @ 0x0809565C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x30]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	bl GetItemIid
	subs r0, #0x63
	cmp r0, #0x33
	bhi _0809576E
	lsls r0, r0, #2
	ldr r1, _08095680 @ =_08095684
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08095680: .4byte _08095684
_08095684: @ jump table
	.4byte _08095754 @ case 0
	.4byte _08095754 @ case 1
	.4byte _08095754 @ case 2
	.4byte _08095754 @ case 3
	.4byte _08095754 @ case 4
	.4byte _0809576E @ case 5
	.4byte _0809576E @ case 6
	.4byte _0809576E @ case 7
	.4byte _0809576E @ case 8
	.4byte _0809576E @ case 9
	.4byte _0809576E @ case 10
	.4byte _0809576E @ case 11
	.4byte _0809576E @ case 12
	.4byte _0809576E @ case 13
	.4byte _0809576E @ case 14
	.4byte _0809576E @ case 15
	.4byte _0809576E @ case 16
	.4byte _0809576E @ case 17
	.4byte _0809576E @ case 18
	.4byte _0809576E @ case 19
	.4byte _0809576E @ case 20
	.4byte _0809576E @ case 21
	.4byte _0809576E @ case 22
	.4byte _0809576E @ case 23
	.4byte _0809576E @ case 24
	.4byte _0809576E @ case 25
	.4byte _0809576E @ case 26
	.4byte _0809576E @ case 27
	.4byte _0809576E @ case 28
	.4byte _0809576E @ case 29
	.4byte _0809576E @ case 30
	.4byte _0809576E @ case 31
	.4byte _0809576E @ case 32
	.4byte _0809576E @ case 33
	.4byte _0809576E @ case 34
	.4byte _0809576E @ case 35
	.4byte _08095754 @ case 36
	.4byte _0809576E @ case 37
	.4byte _08095754 @ case 38
	.4byte _0809576E @ case 39
	.4byte _08095754 @ case 40
	.4byte _0809576E @ case 41
	.4byte _0809576E @ case 42
	.4byte _0809576E @ case 43
	.4byte _0809576E @ case 44
	.4byte _0809576E @ case 45
	.4byte _0809576E @ case 46
	.4byte _0809576E @ case 47
	.4byte _0809576E @ case 48
	.4byte _0809576E @ case 49
	.4byte _0809576E @ case 50
	.4byte _08095754 @ case 51
_08095754:
	ldr r0, _08095774 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08095766
	ldr r0, _08095778 @ =0x0000038A
	bl m4aSongNumStart
_08095766:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
_0809576E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08095774: .4byte 0x0202BBF8
_08095778: .4byte 0x0000038A
_0809577C:
	.byte 0x10, 0xB5, 0x04, 0x1C
	.byte 0xF8, 0xF7, 0x74, 0xFE, 0x6F, 0xF7, 0x14, 0xFE, 0x00, 0x20, 0x6D, 0xF7, 0x6F, 0xF9, 0x70, 0xF7
	.byte 0x43, 0xFC, 0x7F, 0xF7, 0xC9, 0xFD, 0x00, 0x06, 0x00, 0x0E, 0x20, 0x64, 0x71, 0xF7, 0xCA, 0xF9
	.byte 0xEC, 0xF7, 0x38, 0xFC, 0x1E, 0x4B, 0x21, 0x20, 0x40, 0x42, 0x59, 0x78, 0x08, 0x40, 0x41, 0x21
	.byte 0x49, 0x42, 0x08, 0x40, 0x7F, 0x21, 0x08, 0x40, 0x58, 0x70, 0x1A, 0x1C, 0x34, 0x32, 0x20, 0x20
	.byte 0x11, 0x78, 0x01, 0x43, 0x11, 0x70, 0x19, 0x1C, 0x36, 0x31, 0x0A, 0x78, 0x10, 0x43, 0x08, 0x70
	.byte 0x06, 0x31, 0x3F, 0x20, 0x0A, 0x78, 0x10, 0x40, 0x08, 0x70, 0x18, 0x1C, 0x44, 0x30, 0x00, 0x21
	.byte 0x01, 0x70, 0x01, 0x30, 0x01, 0x70, 0x19, 0x1C, 0x46, 0x31, 0x08, 0x20, 0x08, 0x70, 0x14, 0xF0
	.byte 0x4B, 0xFA, 0x13, 0xF0, 0x93, 0xFD, 0x00, 0x20, 0x71, 0xF7, 0xAA, 0xFA, 0x00, 0x20, 0x13, 0xF0
	.byte 0x3B, 0xF9, 0xE0, 0x6A, 0x21, 0x6B, 0x00, 0x22, 0x97, 0xF7, 0xD0, 0xF9, 0x05, 0x49, 0x88, 0x20
	.byte 0x40, 0x00, 0x08, 0x80, 0x94, 0xF7, 0xCC, 0xFD, 0x10, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00
_08095820: .4byte 0x03002870
_08095824: .4byte 0x0203A3D8

	thumb_func_start PrepItemUse_WaitPromotionDone
PrepItemUse_WaitPromotionDone: @ 0x08095828
	push {r4, lr}
	adds r4, r0, #0
	bl GetGameLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r4, #0x40]
	cmp r1, r0
	bne _08095840
	adds r0, r4, #0
	bl Proc_Break
_08095840:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PrepItemUse_PostPromotion
PrepItemUse_PostPromotion: @ 0x08095848
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r1, r0, #0
	cmp r1, #0
	bne _08095862
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	b _08095872
_08095862:
	ldr r0, [r4, #0x30]
	cmp r0, r1
	blt _0809586C
	subs r0, #1
	str r0, [r4, #0x30]
_0809586C:
	adds r0, r4, #0
	bl Proc_Break
_08095872:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08095878
sub_08095878: @ 0x08095878
	push {lr}
	sub sp, #4
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	str r0, [sp]
	movs r0, #0x49
	adds r1, r2, #0
	movs r3, #0x20
	bl CallSomeSoundMaybe
	add sp, #4
	pop {r0}
	bx r0

	thumb_func_start sub_08095894
sub_08095894: @ 0x08095894
	push {lr}
	sub sp, #4
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0
	str r0, [sp]
	movs r2, #0
	movs r3, #0x10
	bl CallSomeSoundMaybe
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080958B0
sub_080958B0: @ 0x080958B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080958C4 @ =0x08CC4A2C
	bl SpawnProcLocking
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080958C4: .4byte 0x08CC4A2C

	thumb_func_start sub_080958C8
sub_080958C8: @ 0x080958C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	adds r5, r1, #0
	str r2, [sp, #8]
	adds r0, r3, #0
	bl GetMsg
	mov sl, r0
	ldr r0, [sp, #0x2c]
	bl GetItemIcon
	mov r8, r0
	mov r0, sl
	bl GetStringTextLen
	mov sb, r0
	mov r1, sb
	adds r1, #7
	mov r0, r8
	cmp r0, #0
	beq _08095900
	movs r0, #0x68
	b _08095902
_08095900:
	movs r0, #0x78
_08095902:
	subs r0, r0, r1
	cmp r0, #0
	bge _0809590A
	adds r0, #0xf
_0809590A:
	asrs r0, r0, #4
	adds r5, r5, r0
	ldr r1, [sp, #8]
	lsls r6, r1, #5
	mov r0, r8
	cmp r0, #0
	beq _08095932
	adds r4, r6, r5
	lsls r4, r4, #1
	ldr r0, _08095948 @ =0x02023C60
	adds r4, r4, r0
	ldr r0, [sp, #0x2c]
	bl GetItemIcon
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl PutIcon
_08095932:
	ldr r4, _0809594C @ =0x02012A80
	adds r0, r4, #0
	bl ClearText
	mov r1, r8
	cmp r1, #0
	beq _08095950
	adds r0, r6, #2
	adds r0, r0, r5
	b _08095952
	.align 2, 0
_08095948: .4byte 0x02023C60
_0809594C: .4byte 0x02012A80
_08095950:
	adds r0, r6, r5
_08095952:
	lsls r0, r0, #1
	ldr r1, _080959AC @ =0x02023C60
	adds r1, r0, r1
	movs r0, #0
	str r0, [sp]
	mov r0, sl
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	movs r0, #4
	bl EnableBgSync
	lsls r0, r5, #3
	subs r0, #4
	str r0, [r7, #0x40]
	ldr r1, [sp, #8]
	lsls r0, r1, #3
	subs r0, #4
	str r0, [r7, #0x44]
	mov r0, sb
	adds r0, #7
	cmp r0, #0
	bge _08095988
	adds r0, #7
_08095988:
	asrs r0, r0, #3
	str r0, [r7, #0x48]
	mov r1, r8
	cmp r1, #0
	beq _08095996
	adds r0, #2
	str r0, [r7, #0x48]
_08095996:
	movs r0, #2
	str r0, [r7, #0x4c]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080959AC: .4byte 0x02023C60

	thumb_func_start sub_080959B0
sub_080959B0: @ 0x080959B0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r4, [r7, #0x14]
	movs r0, #0xe0
	lsls r0, r0, #1
	movs r1, #3
	movs r2, #0
	adds r3, r7, #0
	bl sub_08074474
	ldr r0, [r4, #0x2c]
	bl GetUnitCurrentHp
	adds r1, r7, #0
	adds r1, #0x30
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitPower
	adds r1, r7, #0
	adds r1, #0x31
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitSkill
	adds r1, r7, #0
	adds r1, #0x32
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitSpeed
	adds r1, r7, #0
	adds r1, #0x33
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitLuck
	adds r1, r7, #0
	adds r1, #0x34
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitDefense
	adds r1, r7, #0
	adds r1, #0x35
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitResistance
	adds r1, r7, #0
	adds r1, #0x36
	strb r0, [r1]
	ldr r1, [r4, #0x2c]
	ldr r2, [r1, #4]
	ldr r0, [r1]
	ldrb r2, [r2, #0x11]
	ldrb r0, [r0, #0x13]
	adds r0, r2, r0
	ldrb r1, [r1, #0x1a]
	adds r0, r1, r0
	adds r1, r7, #0
	adds r1, #0x37
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	lsls r3, r1, #1
	adds r2, r0, #0
	adds r2, #0x1e
	adds r2, r2, r3
	ldrh r5, [r2]
	bl ApplyItemStatBoost
	adds r6, r0, #0
	ldr r0, [r4, #0x2c]
	movs r1, #0
	bl DrawPrepScreenItemUseStatBars
	ldr r0, [r4, #0x2c]
	bl sub_08094D74
	ldr r0, [r4, #0x2c]
	bl GetUnitCurrentHp
	adds r1, r7, #0
	adds r1, #0x38
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitPower
	adds r1, r7, #0
	adds r1, #0x39
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitSkill
	adds r1, r7, #0
	adds r1, #0x3a
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitSpeed
	adds r1, r7, #0
	adds r1, #0x3b
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitLuck
	adds r1, r7, #0
	adds r1, #0x3c
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitDefense
	adds r1, r7, #0
	adds r1, #0x3d
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitResistance
	adds r1, r7, #0
	adds r1, #0x3e
	strb r0, [r1]
	ldr r1, [r4, #0x2c]
	ldr r2, [r1, #4]
	ldr r0, [r1]
	ldrb r2, [r2, #0x11]
	ldrb r0, [r0, #0x13]
	adds r0, r2, r0
	ldrb r1, [r1, #0x1a]
	adds r0, r1, r0
	adds r1, r7, #0
	adds r1, #0x3f
	strb r0, [r1]
	str r5, [sp]
	adds r0, r7, #0
	movs r1, #0xf
	movs r2, #0xe
	adds r3, r6, #0
	bl sub_080958C8
	movs r4, #0
_08095ACC:
	adds r0, r7, #0
	adds r0, #0x30
	adds r3, r0, r4
	adds r0, #8
	adds r2, r0, r4
	ldrb r0, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _08095AFA
	asrs r1, r4, #2
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0xb8
	movs r1, #3
	ands r1, r4
	lsls r1, r1, #4
	adds r1, #0x32
	ldrb r2, [r2]
	ldrb r3, [r3]
	subs r2, r2, r3
	bl sub_08074744
_08095AFA:
	adds r4, #1
	cmp r4, #7
	ble _08095ACC
	movs r0, #0x78
	str r0, [r7, #0x2c]
	ldr r0, _08095B20 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08095B16
	ldr r0, _08095B24 @ =0x0000037A
	bl m4aSongNumStart
_08095B16:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08095B20: .4byte 0x0202BBF8
_08095B24: .4byte 0x0000037A

	thumb_func_start PrepItemUseBooster_IDLE
PrepItemUseBooster_IDLE: @ 0x08095B28
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #0x40]
	ldr r1, [r5, #0x44]
	ldr r2, [r5, #0x48]
	ldr r3, [r5, #0x4c]
	ldr r4, _08095B64 @ =0x0000A580
	str r4, [sp]
	bl PrepItemDrawPopupBox
	ldr r0, [r5, #0x2c]
	subs r0, #1
	str r0, [r5, #0x2c]
	cmp r0, #0
	beq _08095B56
	ldr r0, _08095B68 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #3
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08095B5C
_08095B56:
	adds r0, r5, #0
	bl Proc_Break
_08095B5C:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08095B64: .4byte 0x0000A580
_08095B68: .4byte 0x08B857F8

	thumb_func_start sub_08095B6C
sub_08095B6C: @ 0x08095B6C
	push {r4, r5, lr}
	ldr r4, [r0, #0x14]
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r5, r0, #0
	ldr r0, _08095B94 @ =0x02023FFE
	movs r1, #0xe
	movs r2, #1
	movs r3, #0
	bl TmFillRect_t
	cmp r5, #0
	bne _08095B98
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	b _08095BB4
	.align 2, 0
_08095B94: .4byte 0x02023FFE
_08095B98:
	ldr r0, [r4, #0x30]
	cmp r0, r5
	blt _08095BA2
	subs r0, #1
	str r0, [r4, #0x30]
_08095BA2:
	ldr r1, [r4, #0x30]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
_08095BB4:
	ldr r0, _08095BE8 @ =0x02022EA4
	ldr r1, _08095BEC @ =0x02012A20
	ldr r2, [r4, #0x2c]
	movs r3, #1
	bl DrawPrepScreenItems
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	bl sub_08094EF4
	movs r0, #0
	bl DisableUiCursorHand
	bl sub_0807453C
	movs r0, #5
	bl EnableBgSync
	ldr r0, _08095BF0 @ =0x06014000
	movs r1, #1
	rsbs r1, r1, #0
	bl LoadHelpBoxGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08095BE8: .4byte 0x02022EA4
_08095BEC: .4byte 0x02012A20
_08095BF0: .4byte 0x06014000

	thumb_func_start sub_08095BF4
sub_08095BF4: @ 0x08095BF4
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r6, _08095C20 @ =0x0000DFC0
	movs r5, #0x30
	movs r4, #3
_08095BFE:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x10
	ldr r3, _08095C24 @ =0x08B905F8
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _08095BFE
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08095C20: .4byte 0x0000DFC0
_08095C24: .4byte 0x08B905F8

	thumb_func_start sub_08095C28
sub_08095C28: @ 0x08095C28
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08095C60 @ =sub_08095BF4
	bl StartParallelWorker
	ldr r0, _08095C64 @ =0x08CC4B7C
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	ldr r1, _08095C68 @ =0x08CC4B88
	ldr r1, [r1]
	bl GetMsgTo
	adds r2, r0, #0
	movs r0, #0xf0
	lsls r0, r0, #7
	str r5, [sp]
	movs r1, #0xd
	movs r3, #1
	bl sub_080A9D1C
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08095C60: .4byte sub_08095BF4
_08095C64: .4byte 0x08CC4B7C
_08095C68: .4byte 0x08CC4B88

	thumb_func_start StoreConvoyWeaponIconGraphics
StoreConvoyWeaponIconGraphics: @ 0x08095C6C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08095C98 @ =0x08405EA4
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08095C9C @ =0x08405B4C
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r4, r2
	bl Decompress
	ldr r0, _08095CA0 @ =0x08405CE4
	ldr r1, _08095CA4 @ =0x06000200
	adds r4, r4, r1
	adds r1, r4, #0
	bl Decompress
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08095C98: .4byte 0x08405EA4
_08095C9C: .4byte 0x08405B4C
_08095CA0: .4byte 0x08405CE4
_08095CA4: .4byte 0x06000200

	thumb_func_start sub_08095CA8
sub_08095CA8: @ 0x08095CA8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp]
	mov sl, r1
	str r2, [sp, #4]
	str r3, [sp, #8]
	mov r0, sl
	movs r1, #0xc
	movs r2, #0x1f
	movs r3, #0
	bl TmFillRect_t
	ldr r1, _08095CF4 @ =0x02012466
	ldrh r0, [r1]
	cmp r0, #0
	bne _08095CFC
	ldr r0, [sp]
	bl ClearText
	ldr r0, _08095CF8 @ =0x0000126D
	bl GetMsg
	adds r3, r0, #0
	ldr r0, [sp]
	movs r1, #0
	movs r2, #1
	bl Text_InsertDrawString
	mov r1, sl
	adds r1, #6
	ldr r0, [sp]
	bl PutText
	b _08095DA6
	.align 2, 0
_08095CF4: .4byte 0x02012466
_08095CF8: .4byte 0x0000126D
_08095CFC:
	ldr r6, [sp, #4]
	adds r0, r6, #7
	cmp r6, r0
	bge _08095DA6
	ldrh r1, [r1]
	cmp r6, r1
	bge _08095DA6
_08095D0A:
	movs r0, #7
	ands r0, r6
	lsls r0, r0, #3
	ldr r1, [sp]
	adds r1, r1, r0
	mov r8, r1
	ldr r1, _08095DB8 @ =0x020117E4
	lsls r0, r6, #2
	adds r0, r0, r1
	ldrh r7, [r0, #2]
	ldr r0, [sp, #8]
	adds r1, r7, #0
	bl IsItemDisplayUseable
	movs r1, #0
	mov sb, r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08095D34
	movs r0, #1
	mov sb, r0
_08095D34:
	mov r0, r8
	bl ClearText
	adds r0, r7, #0
	bl GetItemName
	adds r3, r0, #0
	mov r0, r8
	movs r1, #0
	mov r2, sb
	bl Text_InsertDrawString
	lsls r5, r6, #1
	movs r0, #0x1f
	ands r5, r0
	lsls r5, r5, #6
	adds r4, r5, #2
	add r4, sl
	adds r0, r7, #0
	bl GetItemIcon
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x80
	lsls r2, r2, #7
	bl PutIcon
	adds r1, r5, #6
	add r1, sl
	mov r0, r8
	bl PutText
	adds r5, #0x18
	mov r1, sl
	adds r4, r1, r5
	movs r5, #1
	mov r0, sb
	cmp r0, #0
	bne _08095D84
	movs r5, #2
_08095D84:
	adds r0, r7, #0
	bl GetItemUses
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl PutNumberOrBlank
	adds r6, #1
	ldr r0, [sp, #4]
	adds r0, #7
	cmp r6, r0
	bge _08095DA6
	ldr r0, _08095DBC @ =0x02012466
	ldrh r0, [r0]
	cmp r6, r0
	blt _08095D0A
_08095DA6:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08095DB8: .4byte 0x020117E4
_08095DBC: .4byte 0x02012466

	thumb_func_start sub_08095DC0
sub_08095DC0: @ 0x08095DC0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r5, r1, #0
	adds r7, r5, #0
	adds r0, r5, #7
	cmp r5, r0
	bge _08095E10
	ldr r0, _08095E1C @ =0x02012466
	ldrh r0, [r0]
	cmp r5, r0
	bge _08095E10
	ldr r1, _08095E20 @ =0x020117E4
	lsls r0, r5, #2
	adds r6, r0, r1
_08095DE0:
	ldrh r0, [r6, #2]
	lsls r4, r5, #1
	movs r1, #0x1f
	ands r4, r1
	lsls r4, r4, #6
	adds r4, #2
	add r4, r8
	bl GetItemIcon
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x80
	lsls r2, r2, #7
	bl PutIcon
	adds r6, #4
	adds r5, #1
	adds r0, r7, #7
	cmp r5, r0
	bge _08095E10
	ldr r0, _08095E1C @ =0x02012466
	ldrh r0, [r0]
	cmp r5, r0
	blt _08095DE0
_08095E10:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08095E1C: .4byte 0x02012466
_08095E20: .4byte 0x020117E4

	thumb_func_start sub_08095E24
sub_08095E24: @ 0x08095E24
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	mov sb, r1
	ldr r0, _08095ED0 @ =0x02012466
	ldrh r0, [r0]
	cmp r0, r2
	ble _08095EC4
	lsls r4, r2, #1
	movs r0, #0x1f
	ands r4, r0
	movs r0, #7
	ands r0, r2
	lsls r0, r0, #3
	adds r7, r5, r0
	ldr r1, _08095ED4 @ =0x020117E4
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrh r6, [r0, #2]
	adds r0, r3, #0
	adds r1, r6, #0
	bl IsItemDisplayUseable
	movs r1, #0
	mov r8, r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08095E64
	movs r0, #1
	mov r8, r0
_08095E64:
	lsls r4, r4, #6
	add r4, sb
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	bl TmFillRect_t
	adds r0, r7, #0
	bl ClearText
	adds r0, r6, #0
	bl GetItemName
	adds r3, r0, #0
	adds r0, r7, #0
	movs r1, #0
	mov r2, r8
	bl Text_InsertDrawString
	adds r5, r4, #2
	adds r0, r6, #0
	bl GetItemIcon
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r5, #0
	bl PutIcon
	adds r1, r4, #6
	adds r0, r7, #0
	bl PutText
	adds r4, #0x18
	movs r5, #1
	mov r1, r8
	cmp r1, #0
	bne _08095EB4
	movs r5, #2
_08095EB4:
	adds r0, r6, #0
	bl GetItemUses
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl PutNumberOrBlank
_08095EC4:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08095ED0: .4byte 0x02012466
_08095ED4: .4byte 0x020117E4

	thumb_func_start sub_08095ED8
sub_08095ED8: @ 0x08095ED8
	ldr r0, _08095F0C @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xa0
	bls _08095EE8
	movs r2, #0
_08095EE8:
	cmp r2, #0xc
	bne _08095EF8
	ldr r1, _08095F10 @ =0x04000050
	movs r0, #0xc8
	strh r0, [r1]
	adds r1, #4
	movs r0, #8
	strh r0, [r1]
_08095EF8:
	cmp r2, #0x34
	beq _08095F00
	cmp r2, #0
	bne _08095F0A
_08095F00:
	ldr r0, _08095F10 @ =0x04000050
	movs r1, #0
	strh r1, [r0]
	adds r0, #4
	strh r1, [r0]
_08095F0A:
	bx lr
	.align 2, 0
_08095F0C: .4byte 0x04000006
_08095F10: .4byte 0x04000050

	thumb_func_start sub_08095F14
sub_08095F14: @ 0x08095F14
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	strh r0, [r4, #0x38]
	movs r0, #0xff
	strh r0, [r4, #0x36]
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	cmp r0, #0
	bne _08095F32
	adds r1, r4, #0
	adds r1, #0x33
	movs r0, #1
	b _08095F38
_08095F32:
	adds r1, r4, #0
	adds r1, #0x33
	movs r0, #0
_08095F38:
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	bne _08095F58
	ldr r0, _08095F54 @ =0x08CC3BDC
	bl Proc_Find
	adds r0, #0x32
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x35
	b _08095F5E
	.align 2, 0
_08095F54: .4byte 0x08CC3BDC
_08095F58:
	adds r1, r4, #0
	adds r1, #0x35
	movs r0, #0
_08095F5E:
	strb r0, [r1]
	adds r2, r4, #0
	adds r2, #0x32
	movs r1, #0
	movs r0, #4
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x31
	strb r1, [r0]
	movs r3, #0
	adds r1, r4, #0
	adds r1, #0x4c
	adds r0, #9
	movs r2, #8
_08095F7A:
	strh r3, [r0]
	strh r3, [r1]
	adds r1, #2
	adds r0, #2
	subs r2, #1
	cmp r2, #0
	bge _08095F7A
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08095F90
sub_08095F90: @ 0x08095F90
	push {r4, lr}
	ldr r4, _08095FC0 @ =0x02012B50
	ldr r1, _08095FC4 @ =0x06011000
	adds r0, r4, #0
	movs r2, #0xb
	bl InitSpriteTextFont
	ldr r0, _08095FC8 @ =0x08194674
	movs r1, #0xd8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r4, #0x90
	adds r0, r4, #0
	bl InitSpriteText
	movs r0, #0
	bl SetTextFont
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08095FC0: .4byte 0x02012B50
_08095FC4: .4byte 0x06011000
_08095FC8: .4byte 0x08194674

	thumb_func_start sub_08095FCC
sub_08095FCC: @ 0x08095FCC
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl GetConvoyItemCount_
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r6, r0, #0
	ldr r4, _08096044 @ =0x02012B50
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r4, #0x90
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r7, r4, #0
	movs r4, #0
	cmp r5, #0x64
	beq _08096006
	cmp r6, #0
	bne _08096008
_08096006:
	movs r4, #1
_08096008:
	ldr r0, _08096048 @ =0x0000126E
	bl GetMsg
	adds r3, r0, #0
	adds r0, r7, #0
	movs r1, #0
	adds r2, r4, #0
	bl Text_InsertDrawString
	ldr r5, _0809604C @ =0x02012BE0
	movs r4, #0
	cmp r6, #5
	bne _08096024
	movs r4, #1
_08096024:
	ldr r0, _08096050 @ =0x0000126F
	bl GetMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x40
	adds r2, r4, #0
	bl Text_InsertDrawString
	movs r0, #0
	bl SetTextFont
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08096044: .4byte 0x02012B50
_08096048: .4byte 0x0000126E
_0809604C: .4byte 0x02012BE0
_08096050: .4byte 0x0000126F

	thumb_func_start sub_08096054
sub_08096054: @ 0x08096054
	push {r4, r5, r6, lr}
	sub sp, #8
	movs r0, #0
	bl SetTextFont
	ldr r6, _08096100 @ =0x02022CC8
	adds r0, r6, #0
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	bl TmFillRect_t
	ldr r0, _08096104 @ =0x0000125A
	bl GetMsg
	ldr r4, _08096108 @ =0x02012B68
	adds r1, r6, #0
	adds r1, #0xda
	movs r5, #0
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #2
	bl PutDrawText
	adds r1, r6, #0
	subs r1, #0x26
	movs r2, #0x9c
	lsls r2, r2, #2
	movs r0, #1
	str r0, [sp]
	movs r0, #0x4a
	movs r3, #2
	bl PutFaceChibi
	ldr r0, _0809610C @ =0x00001270
	bl GetMsg
	adds r4, #8
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	adds r5, r6, #0
	adds r5, #0xa
	bl GetConvoyItemCount_
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r4, #2
	cmp r0, #0x64
	bne _080960C8
	movs r4, #4
_080960C8:
	bl GetConvoyItemCount_
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl PutNumber
	adds r0, r6, #0
	adds r0, #0xc
	movs r1, #0
	movs r2, #0x16
	bl PutSpecialChar
	adds r0, r6, #0
	adds r0, #0x12
	movs r1, #2
	movs r2, #0x64
	bl PutNumber
	movs r0, #1
	bl EnableBgSync
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08096100: .4byte 0x02022CC8
_08096104: .4byte 0x0000125A
_08096108: .4byte 0x02012B68
_0809610C: .4byte 0x00001270

	thumb_func_start sub_08096110
sub_08096110: @ 0x08096110
	push {r4, lr}
	sub sp, #4
	ldr r0, _08096150 @ =0x0000A980
	str r0, [sp]
	movs r0, #0x40
	movs r1, #0x22
	movs r2, #5
	movs r3, #4
	bl PrepItemDrawPopupBox
	ldr r4, _08096154 @ =0x08B905F8
	ldr r0, _08096158 @ =0x0000B080
	str r0, [sp]
	movs r0, #4
	movs r1, #0x48
	movs r2, #0x26
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _0809615C @ =0x0000B088
	str r0, [sp]
	movs r0, #4
	movs r1, #0x48
	movs r2, #0x36
	adds r3, r4, #0
	bl PutSpriteExt
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08096150: .4byte 0x0000A980
_08096154: .4byte 0x08B905F8
_08096158: .4byte 0x0000B080
_0809615C: .4byte 0x0000B088

	thumb_func_start sub_08096160
sub_08096160: @ 0x08096160
	push {lr}
	sub sp, #4
	ldr r0, _0809618C @ =0x0000A980
	str r0, [sp]
	movs r0, #0x40
	movs r1, #0x22
	movs r2, #5
	movs r3, #2
	bl PrepItemDrawPopupBox
	ldr r3, _08096190 @ =0x08B905F8
	ldr r0, _08096194 @ =0x0000B080
	str r0, [sp]
	movs r0, #4
	movs r1, #0x48
	movs r2, #0x26
	bl PutSpriteExt
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0809618C: .4byte 0x0000A980
_08096190: .4byte 0x08B905F8
_08096194: .4byte 0x0000B080

	thumb_func_start sub_08096198
sub_08096198: @ 0x08096198
	push {lr}
	sub sp, #4
	ldr r0, _080961C4 @ =0x0000A980
	str r0, [sp]
	movs r0, #0x40
	movs r1, #0x32
	movs r2, #5
	movs r3, #2
	bl PrepItemDrawPopupBox
	ldr r3, _080961C8 @ =0x08B905F8
	ldr r0, _080961CC @ =0x0000B088
	str r0, [sp]
	movs r0, #4
	movs r1, #0x48
	movs r2, #0x36
	bl PutSpriteExt
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080961C4: .4byte 0x0000A980
_080961C8: .4byte 0x08B905F8
_080961CC: .4byte 0x0000B088

	thumb_func_start sub_080961D0
sub_080961D0: @ 0x080961D0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0x35
	ldrb r0, [r7]
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r4, #0x7c
	bl GetGameTime
	ldr r2, _08096248 @ =0x02022860
	lsrs r0, r0, #2
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #1
	ldr r1, _0809624C @ =0x08407400
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r1, _08096250 @ =0x000002DA
	adds r2, r2, r1
	strh r0, [r2]
	bl EnablePalSync
	ldr r1, _08096254 @ =0x08CC4FA0
	ldrb r2, [r7]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r3, [r0]
	movs r5, #0xc5
	lsls r5, r5, #7
	str r5, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x18
	bl PutSprite
	ldr r3, _08096258 @ =0x08CC4F90
	str r5, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x18
	bl PutSprite
	ldrb r7, [r7]
	lsls r0, r7, #1
	adds r6, #0x4c
	adds r6, r6, r0
	ldrh r1, [r6]
	ldr r0, _0809625C @ =0x02012466
	ldrh r2, [r0]
	movs r0, #0xb
	movs r3, #7
	bl UpdateMenuScrollBarConfig
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08096248: .4byte 0x02022860
_0809624C: .4byte 0x08407400
_08096250: .4byte 0x000002DA
_08096254: .4byte 0x08CC4FA0
_08096258: .4byte 0x08CC4F90
_0809625C: .4byte 0x02012466

	thumb_func_start sub_08096260
sub_08096260: @ 0x08096260
	push {r4, r5, r6, lr}
	movs r5, #0
	lsls r2, r2, #0xc
	ldr r4, _0809629C @ =0x0001FFFF
	adds r3, r1, #0
	ands r3, r4
	lsrs r3, r3, #5
	adds r6, r2, r3
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r1, r3
	ands r1, r4
	lsrs r1, r1, #5
	adds r2, r2, r1
	adds r3, r0, #0
	adds r3, #0x40
	adds r1, r0, #0
_08096282:
	adds r0, r6, r5
	strh r0, [r1]
	adds r0, r2, r5
	strh r0, [r3]
	adds r3, #2
	adds r1, #2
	adds r5, #1
	cmp r5, #0xe
	ble _08096282
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809629C: .4byte 0x0001FFFF

	thumb_func_start sub_080962A0
sub_080962A0: @ 0x080962A0
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	ldr r5, _0809636C @ =0x03002870
	movs r4, #2
	rsbs r4, r4, #0
	adds r0, r4, #0
	ldrb r1, [r5, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	mov sl, r1
	ands r0, r1
	subs r1, #2
	mov sb, r1
	ands r0, r1
	subs r1, #4
	mov r8, r1
	ands r0, r1
	movs r6, #0x11
	rsbs r6, r6, #0
	ands r0, r6
	strb r0, [r5, #1]
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r5]
	ands r0, r1
	strb r0, [r5]
	movs r0, #0
	bl InitBgs
	movs r0, #0
	bl SetOnHBlankA
	ldrb r0, [r5, #1]
	ands r4, r0
	mov r1, sl
	ands r4, r1
	mov r0, sb
	ands r4, r0
	mov r1, r8
	ands r4, r1
	ands r4, r6
	strb r4, [r5, #1]
	movs r0, #0
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r1, [r5, #0xc]
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r5, #0xc]
	adds r0, r2, #0
	ldrb r1, [r5, #0x10]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r5, #0x10]
	ldrb r0, [r5, #0x14]
	ands r2, r0
	strb r2, [r5, #0x14]
	movs r0, #3
	ldrb r1, [r5, #0x18]
	orrs r0, r1
	strb r0, [r5, #0x18]
	bl InitFaces
	bl ResetText
	bl InitIcons
	bl LoadUiFrameGraphics
	bl PrepRestartMuralBackground
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809636C: .4byte 0x03002870

	thumb_func_start sub_08096370
sub_08096370: @ 0x08096370
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	bl ApplySystemObjectsGraphics
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	adds r0, r7, #0
	adds r0, #0x35
	ldrb r0, [r0]
	lsls r1, r0, #1
	adds r0, r7, #0
	adds r0, #0x4c
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	ldr r0, _080965D4 @ =0x06016000
	movs r1, #1
	rsbs r1, r1, #0
	bl LoadHelpBoxGfx
	movs r0, #4
	bl ApplyIconPalettes
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_08091944
	movs r0, #0xc0
	lsls r0, r0, #6
	movs r1, #0xa
	bl sub_08091994
	ldr r0, _080965D8 @ =0x02023460
	ldr r1, _080965DC @ =0x0840E5D4
	movs r2, #0xa5
	lsls r2, r2, #7
	bl sub_080AACD8
	movs r0, #7
	bl EnableBgSync
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r0, #0
	mov sb, r0
	str r0, [sp]
	str r7, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl StartSysBrownBox
	movs r0, #0
	movs r1, #0x98
	movs r2, #6
	movs r3, #2
	bl EnableSysBrownBox
	ldr r0, [r7, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetMsg
	adds r0, r7, #0
	bl StartUiCursorHand
	adds r0, r7, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	ldr r1, _080965E0 @ =0x03002870
	mov ip, r1
	movs r6, #0x20
	ldrb r0, [r1, #1]
	orrs r0, r6
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, ip
	strb r0, [r2, #1]
	mov r1, ip
	adds r1, #0x2d
	movs r0, #0x80
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xe0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	movs r5, #0x34
	add r5, ip
	mov r8, r5
	movs r0, #1
	ldrb r1, [r5]
	orrs r1, r0
	movs r2, #2
	orrs r1, r2
	movs r2, #4
	orrs r1, r2
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	movs r5, #0x36
	add r5, ip
	mov sl, r5
	ldrb r2, [r5]
	orrs r0, r2
	movs r5, #2
	orrs r0, r5
	movs r2, #5
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	orrs r1, r6
	mov r2, r8
	strb r1, [r2]
	orrs r0, r6
	mov r5, sl
	strb r0, [r5]
	mov r1, ip
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x44
	mov r5, sb
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	adds r1, #0xa
	movs r0, #8
	strb r0, [r1]
	adds r0, r7, #0
	bl StartGreenText
	movs r0, #0xc8
	movs r1, #0x90
	adds r2, r7, #0
	bl StartHelpPromptSprite
	ldr r4, _080965E4 @ =0x02012B68
	adds r0, r4, #0
	movs r1, #4
	bl InitText
	adds r0, r4, #0
	adds r0, #8
	movs r1, #4
	bl InitText
	bl sub_08095F90
	adds r4, #0x10
	movs r5, #4
_080964EA:
	adds r0, r4, #0
	movs r1, #7
	bl InitText
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _080964EA
	adds r6, r7, #0
	adds r6, #0x35
	movs r0, #0x4c
	adds r0, r0, r7
	mov r8, r0
	ldr r4, _080965E8 @ =0x02012BA0
	movs r5, #7
_08096508:
	adds r0, r4, #0
	movs r1, #7
	bl InitTextDb
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _08096508
	ldr r0, _080965EC @ =sub_08095ED8
	bl SetOnHBlankA
	movs r4, #0x80
	lsls r4, r4, #7
	adds r0, r4, #0
	movs r1, #6
	bl StoreConvoyWeaponIconGraphics
	ldr r5, _080965F0 @ =0x02022D3E
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #6
	bl sub_08096260
	ldr r0, _080965F4 @ =0x08405754
	ldr r1, _080965F8 @ =0x06015000
	bl Decompress
	adds r0, r7, #0
	bl StartMenuScrollBar
	movs r0, #0xb0
	lsls r0, r0, #7
	movs r1, #6
	bl InitMenuScrollBarImg
	movs r0, #0xe2
	movs r1, #0x30
	bl PutMenuScrollBarAt
	bl TryHideMenuScrollBar
	ldr r0, [r7, #0x2c]
	ldrb r1, [r6]
	movs r2, #1
	bl SomethingPrepListRelated
	ldr r4, _080965E8 @ =0x02012BA0
	ldr r1, _080965FC @ =0x02023C7E
	ldrb r6, [r6]
	lsls r0, r6, #1
	add r0, r8
	ldrh r0, [r0]
	lsrs r2, r0, #4
	ldr r3, [r7, #0x2c]
	adds r0, r4, #0
	bl sub_08095CA8
	movs r0, #4
	bl EnableBgSync
	movs r1, #0xb3
	lsls r1, r1, #1
	adds r5, r5, r1
	subs r4, #0x28
	ldr r2, [r7, #0x2c]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r3, #0
	bl DrawPrepScreenItems
	bl sub_08096054
	adds r0, r7, #0
	bl StartUiSpinningArrows
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r0, #0
	movs r2, #2
	bl LoadUiSpinningArrowGfx
	movs r0, #0x78
	movs r1, #0x18
	movs r2, #0xea
	movs r3, #0x18
	bl SetUiSpinningArrowPositions
	movs r0, #3
	bl SetUiSpinningArrowConfig
	ldr r0, _08096600 @ =sub_080961D0
	adds r1, r7, #0
	bl StartParallelWorker
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080965D4: .4byte 0x06016000
_080965D8: .4byte 0x02023460
_080965DC: .4byte 0x0840E5D4
_080965E0: .4byte 0x03002870
_080965E4: .4byte 0x02012B68
_080965E8: .4byte 0x02012BA0
_080965EC: .4byte sub_08095ED8
_080965F0: .4byte 0x02022D3E
_080965F4: .4byte 0x08405754
_080965F8: .4byte 0x06015000
_080965FC: .4byte 0x02023C7E
_08096600: .4byte sub_080961D0

	thumb_func_start sub_08096604
sub_08096604: @ 0x08096604
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	adds r1, r4, #0
	bl sub_08095C28
	movs r0, #0
	bl DisableUiCursorHand
	adds r0, r4, #0
	bl sub_08095FCC
	adds r0, r4, #0
	adds r0, #0x33
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, #0x24
	movs r3, #0x80
	lsls r3, r3, #3
	movs r0, #0x44
	movs r2, #4
	bl ShowSysHandCursor
	ldr r0, _0809665C @ =sub_08096160
	bl GetParallelWorker
	bl Proc_End
	ldr r0, _08096660 @ =sub_08096198
	bl GetParallelWorker
	bl Proc_End
	ldr r0, _08096664 @ =sub_08096110
	adds r1, r4, #0
	bl StartParallelWorker
	movs r0, #7
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809665C: .4byte sub_08096160
_08096660: .4byte sub_08096198
_08096664: .4byte sub_08096110

	thumb_func_start sub_08096668
sub_08096668: @ 0x08096668
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x33
	ldrb r6, [r4]
	ldrh r0, [r5, #0x38]
	cmp r0, #0
	beq _0809667A
	b _080967D4
_0809667A:
	ldr r1, _08096698 @ =0x08B857F8
	ldr r0, [r1]
	ldrh r3, [r0, #8]
	movs r7, #1
	adds r0, r7, #0
	ands r0, r3
	adds r2, r1, #0
	cmp r0, #0
	bne _0809668E
	b _08096784
_0809668E:
	cmp r6, #0
	beq _0809669C
	cmp r6, #1
	beq _08096708
	b _08096888
	.align 2, 0
_08096698: .4byte 0x08B857F8
_0809669C:
	bl GetConvoyItemCount_
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x63
	bhi _08096768
	ldr r0, [r5, #0x2c]
	bl GetUnitItemCount
	cmp r0, #0
	ble _08096768
	ldrb r4, [r4]
	lsls r2, r4, #4
	adds r2, #0x24
	movs r0, #0
	movs r1, #0x44
	movs r3, #2
	bl SetUiCursorHandConfig
	ldr r0, _080966F8 @ =sub_08096110
	bl GetParallelWorker
	bl Proc_End
	ldr r0, _080966FC @ =sub_08096160
	adds r1, r5, #0
	bl StartParallelWorker
	movs r0, #1
	adds r1, r5, #0
	bl sub_08095C28
	ldr r0, _08096700 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080966EE
	ldr r0, _08096704 @ =0x0000038A
	bl m4aSongNumStart
_080966EE:
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b _08096888
	.align 2, 0
_080966F8: .4byte sub_08096110
_080966FC: .4byte sub_08096160
_08096700: .4byte 0x0202BBF8
_08096704: .4byte 0x0000038A
_08096708:
	ldr r0, [r5, #0x2c]
	bl GetUnitItemCount
	cmp r0, #4
	bgt _08096768
	ldrb r4, [r4]
	lsls r2, r4, #4
	adds r2, #0x24
	movs r0, #0
	movs r1, #0x44
	movs r3, #2
	bl SetUiCursorHandConfig
	ldr r0, _08096758 @ =sub_08096110
	bl GetParallelWorker
	bl Proc_End
	ldr r0, _0809675C @ =sub_08096198
	adds r1, r5, #0
	bl StartParallelWorker
	movs r0, #2
	adds r1, r5, #0
	bl sub_08095C28
	ldr r0, _08096760 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809674E
	ldr r0, _08096764 @ =0x0000038A
	bl m4aSongNumStart
_0809674E:
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
	b _08096888
	.align 2, 0
_08096758: .4byte sub_08096110
_0809675C: .4byte sub_08096198
_08096760: .4byte 0x0202BBF8
_08096764: .4byte 0x0000038A
_08096768:
	ldr r0, _08096780 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _08096776
	b _08096888
_08096776:
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _08096888
	.align 2, 0
_08096780: .4byte 0x0202BBF8
_08096784:
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _080967B0
	adds r0, r5, #0
	movs r1, #8
	bl Proc_Goto
	ldr r0, _080967A8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08096888
	ldr r0, _080967AC @ =0x0000038B
	bl m4aSongNumStart
	b _08096888
	.align 2, 0
_080967A8: .4byte 0x0202BBF8
_080967AC: .4byte 0x0000038B
_080967B0:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	cmp r0, #0
	beq _080967F4
	lsls r1, r6, #4
	adds r1, #0x24
	ldr r2, _080967D0 @ =0x08CC4B8C
	lsls r0, r6, #2
	adds r0, r0, r2
	ldr r2, [r0]
	movs r0, #0x44
	bl StartHelpBox
	strh r7, [r5, #0x38]
	b _08096888
	.align 2, 0
_080967D0: .4byte 0x08CC4B8C
_080967D4:
	ldr r2, _080967F0 @ =0x08B857F8
	ldr r1, [r2]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080967F4
	bl CloseHelpBox
	movs r0, #0
	strh r0, [r5, #0x38]
	b _08096888
	.align 2, 0
_080967F0: .4byte 0x08B857F8
_080967F4:
	ldr r3, [r2]
	movs r1, #0x40
	adds r0, r1, #0
	ldrh r4, [r3, #6]
	ands r0, r4
	adds r4, r5, #0
	adds r4, #0x33
	cmp r0, #0
	beq _0809681E
	ldrb r0, [r4]
	cmp r0, #0
	beq _08096810
	subs r0, #1
	b _0809681C
_08096810:
	adds r0, r1, #0
	ldrh r3, [r3, #8]
	ands r0, r3
	cmp r0, #0
	beq _0809681E
	movs r0, #1
_0809681C:
	strb r0, [r4]
_0809681E:
	ldr r1, [r2]
	movs r2, #0x80
	adds r0, r2, #0
	ldrh r3, [r1, #6]
	ands r0, r3
	cmp r0, #0
	beq _08096844
	ldrb r0, [r4]
	cmp r0, #0
	bne _08096836
	adds r0, #1
	b _08096842
_08096836:
	adds r0, r2, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08096844
	movs r0, #0
_08096842:
	strb r0, [r4]
_08096844:
	ldrb r0, [r4]
	cmp r6, r0
	beq _08096888
	ldr r0, _08096890 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809685C
	ldr r0, _08096894 @ =0x00000386
	bl m4aSongNumStart
_0809685C:
	ldrb r3, [r4]
	lsls r1, r3, #4
	adds r1, #0x24
	movs r3, #0x80
	lsls r3, r3, #3
	movs r0, #0x44
	movs r2, #4
	bl ShowSysHandCursor
	ldrh r0, [r5, #0x38]
	cmp r0, #0
	beq _08096888
	ldrb r0, [r4]
	lsls r1, r0, #4
	adds r1, #0x24
	ldr r2, _08096898 @ =0x08CC4B8C
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r2, [r0]
	movs r0, #0x44
	bl StartHelpBox
_08096888:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08096890: .4byte 0x0202BBF8
_08096894: .4byte 0x00000386
_08096898: .4byte 0x08CC4B8C

	thumb_func_start sub_0809689C
sub_0809689C: @ 0x0809689C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl InitIcons
	ldr r0, [r4, #0x2c]
	adds r5, r4, #0
	adds r5, #0x35
	ldrb r1, [r5]
	movs r2, #1
	bl SomethingPrepListRelated
	ldr r0, _0809692C @ =0x02012BA0
	ldr r1, _08096930 @ =0x02023C7E
	ldrb r3, [r5]
	lsls r2, r3, #1
	adds r6, r4, #0
	adds r6, #0x4c
	adds r2, r6, r2
	ldrh r2, [r2]
	lsrs r2, r2, #4
	ldr r3, [r4, #0x2c]
	bl sub_08095CA8
	ldr r0, _08096934 @ =0x02022EA4
	ldr r1, [r4, #0x2c]
	bl DrawPrepScreenItemIcons
	ldrb r1, [r5]
	lsls r0, r1, #1
	adds r7, r4, #0
	adds r7, #0x3a
	adds r1, r7, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r0, r6, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl ShowSysHandCursor
	movs r0, #5
	bl EnableBgSync
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _08096948
	ldr r0, _08096938 @ =0x02012466
	ldrh r0, [r0]
	cmp r0, #0
	beq _08096940
	ldr r2, _0809693C @ =0x020117E4
	ldrb r5, [r5]
	lsls r3, r5, #1
	adds r0, r7, r3
	ldrh r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldrh r2, [r0, #2]
	lsls r1, r1, #4
	adds r3, r6, r3
	ldrh r0, [r3]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	bl StartItemHelpBox
	movs r0, #1
	b _08096946
	.align 2, 0
_0809692C: .4byte 0x02012BA0
_08096930: .4byte 0x02023C7E
_08096934: .4byte 0x02022EA4
_08096938: .4byte 0x02012466
_0809693C: .4byte 0x020117E4
_08096940:
	bl CloseHelpBox
	movs r0, #0xff
_08096946:
	strh r0, [r4, #0x38]
_08096948:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08096950
sub_08096950: @ 0x08096950
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r3, #0
	movs r7, #4
	adds r0, #0x34
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldrb r4, [r0]
	cmp r4, #4
	bge _0809697C
	subs r1, r7, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	movs r1, #0x10
	bl __divsi3
	adds r3, r0, #0
	subs r3, #0x60
_0809697C:
	adds r5, r6, #0
	adds r5, #0x35
	cmp r4, #4
	bne _0809699C
	ldrb r0, [r5]
	cmp r0, #0
	bne _0809698E
	movs r0, #8
	b _08096990
_0809698E:
	subs r0, #1
_08096990:
	strb r0, [r5]
	adds r0, r6, #0
	str r3, [sp]
	bl sub_0809689C
	ldr r3, [sp]
_0809699C:
	adds r4, r6, #0
	adds r4, #0x34
	ldrb r1, [r4]
	cmp r1, r7
	blt _080969BC
	subs r1, r1, r7
	subs r1, r7, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	adds r1, r7, #0
	muls r1, r7, r1
	bl __divsi3
	adds r3, r0, #0
_080969BC:
	movs r0, #0xff
	ands r3, r0
	ldrb r5, [r5]
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x4c
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r1, r3, #0
	bl SetBgOffset
	lsls r0, r7, #1
	ldrb r4, [r4]
	cmp r4, r0
	bne _080969EA
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
_080969EA:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080969F4
sub_080969F4: @ 0x080969F4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r3, #0
	movs r7, #4
	adds r0, #0x34
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldrb r4, [r0]
	cmp r4, #4
	bge _08096A20
	subs r1, r7, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	movs r1, #0x10
	bl __divsi3
	movs r1, #0x60
	subs r3, r1, r0
_08096A20:
	adds r5, r6, #0
	adds r5, #0x35
	cmp r4, #4
	bne _08096A40
	ldrb r0, [r5]
	cmp r0, #8
	bne _08096A32
	movs r0, #0
	b _08096A34
_08096A32:
	adds r0, #1
_08096A34:
	strb r0, [r5]
	adds r0, r6, #0
	str r3, [sp]
	bl sub_0809689C
	ldr r3, [sp]
_08096A40:
	adds r4, r6, #0
	adds r4, #0x34
	ldrb r1, [r4]
	cmp r1, r7
	blt _08096A60
	subs r1, r1, r7
	subs r1, r7, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	adds r1, r7, #0
	muls r1, r7, r1
	bl __divsi3
	rsbs r3, r0, #0
_08096A60:
	movs r0, #0xff
	ands r3, r0
	ldrb r5, [r5]
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x4c
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r1, r3, #0
	bl SetBgOffset
	lsls r0, r7, #1
	ldrb r4, [r4]
	cmp r4, r0
	bne _08096A8E
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
_08096A8E:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08096A98
sub_08096A98: @ 0x08096A98
	push {r4, r5, lr}
	mov ip, r0
	ldr r0, _08096AC0 @ =0x02012466
	ldrh r4, [r0]
	adds r5, r0, #0
	cmp r4, #0
	bne _08096AC4
	mov r3, ip
	adds r3, #0x35
	ldrb r1, [r3]
	lsls r0, r1, #1
	mov r1, ip
	adds r1, #0x3a
	adds r1, r1, r0
	mov r2, ip
	adds r2, #0x4c
	adds r0, r2, r0
	strh r4, [r0]
	strh r4, [r1]
	b _08096AE2
	.align 2, 0
_08096AC0: .4byte 0x02012466
_08096AC4:
	mov r2, ip
	adds r2, #0x35
	ldrb r0, [r2]
	lsls r1, r0, #1
	mov r0, ip
	adds r0, #0x3a
	adds r0, r0, r1
	ldrh r4, [r5]
	subs r4, #1
	adds r3, r2, #0
	adds r2, #0x17
	ldrh r1, [r0]
	cmp r1, r4
	ble _08096AE2
	strh r4, [r0]
_08096AE2:
	ldrh r0, [r5]
	cmp r0, #6
	bls _08096B00
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r4, r2, r0
	ldrh r1, [r4]
	lsrs r0, r1, #4
	adds r0, #7
	ldrh r1, [r5]
	cmp r0, r1
	ble _08096B00
	subs r0, r1, #7
	lsls r0, r0, #4
	strh r0, [r4]
_08096B00:
	ldrb r3, [r3]
	lsls r0, r3, #1
	adds r0, r2, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08096B1C
sub_08096B1C: @ 0x08096B1C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0
	adds r0, #0x35
	ldrb r0, [r0]
	lsls r2, r0, #1
	mov r0, ip
	adds r0, #0x3a
	adds r4, r0, r2
	ldrh r3, [r4]
	lsls r1, r3, #4
	adds r0, #0x12
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	cmp r1, #0x37
	bgt _08096B4A
	cmp r3, #0
	beq _08096B4A
	adds r0, r3, #1
	strh r0, [r4]
_08096B4A:
	mov r4, ip
	adds r4, #0x35
	ldrb r1, [r4]
	lsls r0, r1, #1
	mov r3, ip
	adds r3, #0x3a
	adds r6, r3, r0
	ldrh r5, [r6]
	lsls r1, r5, #4
	mov r2, ip
	adds r2, #0x4c
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	adds r7, r3, #0
	mov r8, r2
	cmp r1, #0x78
	ble _08096B7E
	ldr r0, _08096BAC @ =0x02012466
	ldrh r0, [r0]
	subs r0, #1
	cmp r5, r0
	beq _08096B7E
	subs r0, r5, #1
	strh r0, [r6]
_08096B7E:
	mov r0, ip
	bl sub_08096A98
	ldrb r4, [r4]
	lsls r0, r4, #1
	adds r1, r7, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl ShowSysHandCursor
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08096BAC: .4byte 0x02012466

	thumb_func_start sub_08096BB0
sub_08096BB0: @ 0x08096BB0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r7, r1, #0
	bl InitIcons
	ldr r0, _08096C48 @ =0x02023C7E
	mov r8, r0
	adds r6, r4, #0
	adds r6, #0x35
	ldrb r1, [r6]
	lsls r0, r1, #1
	adds r5, r4, #0
	adds r5, #0x4c
	adds r0, r5, r0
	ldrh r0, [r0]
	lsrs r1, r0, #4
	mov r0, r8
	bl sub_08095DC0
	ldr r0, _08096C4C @ =0x02022EA4
	ldr r1, [r4, #0x2c]
	bl DrawPrepScreenItemIcons
	movs r0, #5
	bl EnableBgSync
	cmp r7, #0
	bge _08096C02
	ldr r0, _08096C50 @ =0x02012BA0
	ldrb r2, [r6]
	lsls r1, r2, #1
	adds r1, r5, r1
	ldrh r1, [r1]
	lsrs r2, r1, #4
	subs r2, #1
	ldr r3, [r4, #0x2c]
	mov r1, r8
	bl sub_08095E24
_08096C02:
	cmp r7, #0
	ble _08096C1C
	ldr r0, _08096C50 @ =0x02012BA0
	ldrb r2, [r6]
	lsls r1, r2, #1
	adds r1, r5, r1
	ldrh r1, [r1]
	lsrs r2, r1, #4
	adds r2, #7
	ldr r3, [r4, #0x2c]
	mov r1, r8
	bl sub_08095E24
_08096C1C:
	ldrb r1, [r6]
	lsls r0, r1, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	adds r1, r2, r7
	strh r1, [r0]
	ldrb r6, [r6]
	lsls r0, r6, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08096C48: .4byte 0x02023C7E
_08096C4C: .4byte 0x02022EA4
_08096C50: .4byte 0x02012BA0

	thumb_func_start sub_08096C54
sub_08096C54: @ 0x08096C54
	push {lr}
	bl sub_08096054
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08096C60
sub_08096C60: @ 0x08096C60
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	ldr r0, [r7, #0x2c]
	bl GetUnitItemCount
	adds r2, r0, #0
	cmp r2, #5
	beq _08096C7C
	ldr r0, _08096C94 @ =0x02012466
	ldrh r0, [r0]
	cmp r0, #0
	bne _08096C9C
_08096C7C:
	ldr r0, _08096C98 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _08096C8A
	b _08096DAE
_08096C8A:
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _08096DAE
	.align 2, 0
_08096C94: .4byte 0x02012466
_08096C98: .4byte 0x0202BBF8
_08096C9C:
	movs r5, #0
	strh r5, [r7, #0x38]
	ldr r1, [r7, #0x2c]
	lsls r0, r2, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldr r4, _08096D7C @ =0x020117E4
	movs r0, #0x35
	adds r0, r0, r7
	mov r8, r0
	ldrb r2, [r0]
	lsls r0, r2, #1
	adds r6, r7, #0
	adds r6, #0x3a
	adds r0, r6, r0
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r0, [r0, #2]
	strh r0, [r1]
	ldr r0, [r7, #0x2c]
	bl UnitRemoveInvalidItems
	mov r3, r8
	ldrb r3, [r3]
	lsls r0, r3, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r4
	strh r5, [r0, #2]
	bl sub_0809120C
	ldr r0, [r7, #0x2c]
	mov r2, r8
	ldrb r1, [r2]
	movs r2, #1
	bl SomethingPrepListRelated
	adds r0, r7, #0
	bl sub_08096A98
	bl InitIcons
	ldr r0, _08096D80 @ =0x02022EA4
	ldr r4, _08096D84 @ =0x02012B78
	ldr r2, [r7, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl DrawPrepScreenItems
	adds r4, #0x28
	ldr r1, _08096D88 @ =0x02023C7E
	mov r3, r8
	ldrb r3, [r3]
	lsls r0, r3, #1
	adds r5, r7, #0
	adds r5, #0x4c
	adds r0, r5, r0
	ldrh r0, [r0]
	lsrs r2, r0, #4
	ldr r3, [r7, #0x2c]
	adds r0, r4, #0
	bl sub_08095CA8
	ldr r0, _08096D8C @ =sub_08096C54
	movs r1, #1
	adds r2, r7, #0
	bl StartParallelFiniteLoop
	mov r1, r8
	ldrb r1, [r1]
	lsls r0, r1, #1
	adds r6, r6, r0
	ldrh r6, [r6]
	lsls r1, r6, #4
	adds r5, r5, r0
	ldrh r0, [r5]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl ShowSysHandCursor
	movs r0, #5
	bl EnableBgSync
	ldr r1, _08096D90 @ =0x0203A85C
	movs r0, #0x19
	strb r0, [r1, #0x11]
	ldr r0, [r7, #0x2c]
	bl GetUnitItemCount
	cmp r0, #5
	bne _08096D9C
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _08096D94 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08096DAE
	ldr r0, _08096D98 @ =0x0000038B
	bl m4aSongNumStart
	b _08096DAE
	.align 2, 0
_08096D7C: .4byte 0x020117E4
_08096D80: .4byte 0x02022EA4
_08096D84: .4byte 0x02012B78
_08096D88: .4byte 0x02023C7E
_08096D8C: .4byte sub_08096C54
_08096D90: .4byte 0x0203A85C
_08096D94: .4byte 0x0202BBF8
_08096D98: .4byte 0x0000038B
_08096D9C:
	ldr r0, _08096DB8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08096DAE
	ldr r0, _08096DBC @ =0x0000038A
	bl m4aSongNumStart
_08096DAE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08096DB8: .4byte 0x0202BBF8
_08096DBC: .4byte 0x0000038A

	thumb_func_start sub_08096DC0
sub_08096DC0: @ 0x08096DC0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	adds r7, r4, #0
	adds r7, #0x35
	ldrb r0, [r7]
	lsls r1, r0, #1
	movs r2, #0x3a
	adds r2, r2, r4
	mov r8, r2
	adds r0, r2, r1
	ldrh r0, [r0]
	mov sl, r0
	adds r5, r4, #0
	adds r5, #0x4c
	adds r6, r5, r1
	movs r3, #0xf
	ldrh r0, [r6]
	ands r0, r3
	mov sb, r0
	cmp r0, #0
	beq _08096DF4
	b _08096FEC
_08096DF4:
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _08096DFE
	cmp r0, #0xff
	bne _08096EA0
_08096DFE:
	ldr r1, _08096E38 @ =0x08B857F8
	ldr r0, [r1]
	ldrh r3, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	mov r8, r1
	cmp r0, #0
	beq _08096E60
	ldr r0, _08096E3C @ =0x02012466
	ldrh r0, [r0]
	cmp r0, #0
	beq _08096E44
	ldr r1, _08096E40 @ =0x020117E4
	mov r2, sl
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrh r2, [r0, #2]
	mov r3, sl
	lsls r1, r3, #4
	ldrh r0, [r6]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	bl StartItemHelpBox
	movs r0, #1
	strh r0, [r4, #0x38]
	b _0809713E
	.align 2, 0
_08096E38: .4byte 0x08B857F8
_08096E3C: .4byte 0x02012466
_08096E40: .4byte 0x020117E4
_08096E44:
	ldr r0, _08096E5C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _08096E52
	b _0809713E
_08096E52:
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _0809713E
	.align 2, 0
_08096E5C: .4byte 0x0202BBF8
_08096E60:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _08096E70
	adds r0, r4, #0
	bl sub_08096C60
	b _0809713E
_08096E70:
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _08096EC0
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _08096E98 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08096E92
	ldr r0, _08096E9C @ =0x0000038B
	bl m4aSongNumStart
_08096E92:
	mov r0, sb
	strh r0, [r4, #0x38]
	b _0809713E
	.align 2, 0
_08096E98: .4byte 0x0202BBF8
_08096E9C: .4byte 0x0000038B
_08096EA0:
	ldr r2, _08096EBC @ =0x08B857F8
	ldr r1, [r2]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	mov r8, r2
	cmp r0, #0
	beq _08096EC0
	bl CloseHelpBox
	mov r1, sb
	strh r1, [r4, #0x38]
	b _0809713E
	.align 2, 0
_08096EBC: .4byte 0x08B857F8
_08096EC0:
	mov r3, r8
	ldr r2, [r3]
	ldrh r1, [r2, #6]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _08096F0C
	movs r0, #0
	bl SetUiSpinningArrowFastMaybe
	ldr r0, _08096F04 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08096EEA
	ldr r0, _08096F08 @ =0x00000387
	bl m4aSongNumStart
_08096EEA:
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	adds r1, r4, #0
	adds r1, #0x34
	movs r0, #0
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_08096950
	b _0809713E
	.align 2, 0
_08096F04: .4byte 0x0202BBF8
_08096F08: .4byte 0x00000387
_08096F0C:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08096F4C
	movs r0, #1
	bl SetUiSpinningArrowFastMaybe
	ldr r0, _08096F44 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08096F2C
	ldr r0, _08096F48 @ =0x00000387
	bl m4aSongNumStart
_08096F2C:
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	adds r0, r4, #0
	adds r0, #0x34
	strb r5, [r0]
	adds r0, r4, #0
	bl sub_080969F4
	b _0809713E
	.align 2, 0
_08096F44: .4byte 0x0202BBF8
_08096F48: .4byte 0x00000387
_08096F4C:
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r2, [r2, #4]
	ands r0, r2
	cmp r0, #0
	beq _08096F60
	adds r1, r4, #0
	adds r1, #0x32
	movs r0, #8
	b _08096F66
_08096F60:
	adds r1, r4, #0
	adds r1, #0x32
	movs r0, #4
_08096F66:
	strb r0, [r1]
	adds r5, r1, #0
	mov r0, r8
	ldr r1, [r0]
	movs r2, #0x40
	adds r0, r2, #0
	ldrh r3, [r1, #6]
	ands r0, r3
	cmp r0, #0
	bne _08096F92
	adds r0, r2, #0
	ldrh r1, [r1, #4]
	ands r0, r1
	adds r7, r4, #0
	adds r7, #0x35
	adds r6, r4, #0
	adds r6, #0x3a
	cmp r0, #0
	beq _08096FAE
	ldrb r0, [r5]
	cmp r0, #8
	bne _08096FAE
_08096F92:
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r2, [r0]
	lsls r1, r2, #1
	adds r2, r4, #0
	adds r2, #0x3a
	adds r3, r2, r1
	ldrh r1, [r3]
	adds r7, r0, #0
	adds r6, r2, #0
	cmp r1, #0
	beq _08096FAE
	subs r0, r1, #1
	strh r0, [r3]
_08096FAE:
	mov r3, r8
	ldr r1, [r3]
	movs r2, #0x80
	adds r0, r2, #0
	ldrh r3, [r1, #6]
	ands r0, r3
	cmp r0, #0
	bne _08096FCE
	adds r0, r2, #0
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _0809704A
	ldrb r5, [r5]
	cmp r5, #8
	bne _0809704A
_08096FCE:
	ldrb r1, [r7]
	lsls r0, r1, #1
	adds r2, r6, r0
	ldrh r1, [r2]
	ldr r0, _08096FE8 @ =0x02012466
	ldrh r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge _0809704A
	adds r0, r1, #1
	strh r0, [r2]
	b _0809704A
	.align 2, 0
_08096FE8: .4byte 0x02012466
_08096FEC:
	mov r2, sl
	lsls r0, r2, #4
	ldrh r2, [r6]
	adds r1, r2, #0
	subs r1, #0x28
	subs r0, r0, r1
	cmp r0, #0x37
	bgt _0809700A
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r2, r0
	strh r0, [r6]
_0809700A:
	ldrb r3, [r7]
	lsls r2, r3, #1
	mov r1, r8
	adds r0, r1, r2
	ldrh r0, [r0]
	lsls r1, r0, #4
	adds r3, r5, r2
	ldrh r2, [r3]
	adds r0, r2, #0
	subs r0, #0x28
	subs r1, r1, r0
	cmp r1, #0x78
	ble _08097032
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r2, r0
	strh r0, [r3]
_08097032:
	ldrb r2, [r7]
	lsls r0, r2, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	mov r6, r8
_0809704A:
	ldrb r3, [r7]
	lsls r0, r3, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	cmp sl, r0
	beq _0809713E
	ldr r1, _080970B0 @ =0x020117E4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	mov sb, r0
	ldr r0, _080970B4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08097072
	ldr r0, _080970B8 @ =0x00000386
	bl m4aSongNumStart
_08097072:
	ldrb r0, [r7]
	lsls r1, r0, #1
	adds r0, r6, r1
	ldrh r5, [r0]
	lsls r3, r5, #4
	adds r2, r4, #0
	adds r2, #0x4c
	adds r1, r2, r1
	ldrh r0, [r1]
	subs r0, #0x28
	subs r1, r3, r0
	mov r8, r2
	cmp r1, #0x37
	bgt _080970BC
	cmp r5, #0
	beq _080970BC
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _080970A2
	adds r1, #0x10
	movs r0, #0x80
	mov r2, sb
	bl StartItemHelpBox
_080970A2:
	adds r0, r4, #0
	adds r0, #0x32
	movs r1, #0
	ldrsb r1, [r0, r1]
	rsbs r1, r1, #0
	b _080970F4
	.align 2, 0
_080970B0: .4byte 0x020117E4
_080970B4: .4byte 0x0202BBF8
_080970B8: .4byte 0x00000386
_080970BC:
	ldrb r1, [r7]
	lsls r0, r1, #1
	adds r1, r6, r0
	ldrh r2, [r1]
	lsls r1, r2, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	cmp r1, #0x78
	ble _08097100
	ldr r0, _080970FC @ =0x02012466
	ldrh r0, [r0]
	subs r0, #1
	cmp r2, r0
	beq _08097100
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _080970EC
	subs r1, #0x10
	movs r0, #0x80
	mov r2, sb
	bl StartItemHelpBox
_080970EC:
	adds r0, r4, #0
	adds r0, #0x32
	movs r1, #0
	ldrsb r1, [r0, r1]
_080970F4:
	adds r0, r4, #0
	bl sub_08096BB0
	b _0809713E
	.align 2, 0
_080970FC: .4byte 0x02012466
_08097100:
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _08097120
	ldrb r2, [r7]
	lsls r0, r2, #1
	adds r1, r6, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	mov r2, sb
	bl StartItemHelpBox
_08097120:
	ldrb r7, [r7]
	lsls r0, r7, #1
	adds r1, r6, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl ShowSysHandCursor
_0809713E:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0809714C
sub_0809714C: @ 0x0809714C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r6, _0809717C @ =0x08B857F8
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _08097192
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r3, r0, #0
	adds r2, r4, #0
	adds r2, #0x31
	ldrb r0, [r2]
	cmp r0, #0
	beq _08097180
	subs r0, #1
	strb r0, [r2]
	b _080971C2
	.align 2, 0
_0809717C: .4byte 0x08B857F8
_08097180:
	ldr r1, [r6]
	adds r0, r7, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080971E0
	subs r0, r3, #1
	strb r0, [r2]
	b _080971C2
_08097192:
	movs r7, #0x80
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080971E0
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r2, r4, #0
	adds r2, #0x31
	ldrb r1, [r2]
	subs r0, #1
	cmp r1, r0
	bge _080971B4
	adds r0, r1, #1
	strb r0, [r2]
	b _080971C2
_080971B4:
	ldr r1, [r6]
	adds r0, r7, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080971E0
	strb r5, [r2]
_080971C2:
	ldr r0, _080971D8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080971D4
	ldr r0, _080971DC @ =0x00000386
	bl m4aSongNumStart
_080971D4:
	movs r0, #1
	b _080971E2
	.align 2, 0
_080971D8: .4byte 0x0202BBF8
_080971DC: .4byte 0x00000386
_080971E0:
	movs r0, #0
_080971E2:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_080971E8
sub_080971E8: @ 0x080971E8
	push {lr}
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08097204
sub_08097204: @ 0x08097204
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x2c]
	adds r7, r5, #0
	adds r7, #0x31
	ldrb r1, [r7]
	lsls r2, r1, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r4, [r1]
	bl GetUnitItemCount
	ldr r0, [r5, #0x2c]
	ldrb r2, [r7]
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	ldr r0, [r5, #0x2c]
	bl UnitRemoveInvalidItems
	adds r0, r4, #0
	bl GetPrepPageForItem
	adds r6, r5, #0
	adds r6, #0x35
	strb r0, [r6]
	adds r0, r4, #0
	bl AddItemToConvoy
	ldr r0, [r5, #0x2c]
	ldrb r1, [r6]
	movs r2, #1
	bl SomethingPrepListRelated
	adds r0, r5, #0
	bl sub_08096A98
	bl InitIcons
	ldr r0, _080972CC @ =0x02022EA4
	ldr r4, _080972D0 @ =0x02012B78
	ldr r2, [r5, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl DrawPrepScreenItems
	adds r4, #0x28
	ldr r1, _080972D4 @ =0x02023C7E
	ldrb r6, [r6]
	lsls r2, r6, #1
	adds r0, r5, #0
	adds r0, #0x4c
	adds r0, r0, r2
	ldrh r0, [r0]
	lsrs r2, r0, #4
	ldr r3, [r5, #0x2c]
	adds r0, r4, #0
	bl sub_08095CA8
	ldr r0, _080972D8 @ =sub_08096C54
	movs r1, #1
	adds r2, r5, #0
	bl StartParallelFiniteLoop
	movs r0, #4
	bl EnableBgSync
	ldr r0, [r5, #0x2c]
	bl GetUnitItemCount
	adds r4, r0, #0
	ldr r1, _080972DC @ =0x0203A85C
	movs r0, #0x19
	strb r0, [r1, #0x11]
	cmp r4, #0
	beq _080972AE
	bl GetConvoyItemCount_
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x64
	bne _080972E8
_080972AE:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _080972E0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08097314
	ldr r0, _080972E4 @ =0x0000038B
	bl m4aSongNumStart
	b _08097314
	.align 2, 0
_080972CC: .4byte 0x02022EA4
_080972D0: .4byte 0x02012B78
_080972D4: .4byte 0x02023C7E
_080972D8: .4byte sub_08096C54
_080972DC: .4byte 0x0203A85C
_080972E0: .4byte 0x0202BBF8
_080972E4: .4byte 0x0000038B
_080972E8:
	ldr r0, _0809731C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080972FA
	ldr r0, _08097320 @ =0x0000038A
	bl m4aSongNumStart
_080972FA:
	ldrb r0, [r7]
	cmp r4, r0
	bgt _08097314
	subs r0, r4, #1
	strb r0, [r7]
	lsls r1, r0, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
_08097314:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809731C: .4byte 0x0202BBF8
_08097320: .4byte 0x0000038A

	thumb_func_start sub_08097324
sub_08097324: @ 0x08097324
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x38]
	cmp r0, #1
	bne _0809734C
	ldr r0, _08097348 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080973E8
	bl CloseHelpBox
	movs r0, #0
	strh r0, [r4, #0x38]
	b _0809742A
	.align 2, 0
_08097348: .4byte 0x08B857F8
_0809734C:
	ldr r0, _08097380 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08097384
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r3, [r1]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _0809742A
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
	movs r0, #1
	strh r0, [r4, #0x38]
	b _0809742A
	.align 2, 0
_08097380: .4byte 0x08B857F8
_08097384:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080973BC
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r1, [r1]
	bl sub_08090EE8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080973B4
	movs r1, #1
	rsbs r1, r1, #0
	ldr r2, _080973B0 @ =0x000003AE
	adds r0, r1, #0
	adds r3, r4, #0
	bl StartPrepErrorHelpbox
	b _0809742A
	.align 2, 0
_080973B0: .4byte 0x000003AE
_080973B4:
	adds r0, r4, #0
	bl sub_08097204
	b _0809742A
_080973BC:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080973E8
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _080973E0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809742A
	ldr r0, _080973E4 @ =0x0000038B
	bl m4aSongNumStart
	b _0809742A
	.align 2, 0
_080973E0: .4byte 0x0202BBF8
_080973E4: .4byte 0x0000038B
_080973E8:
	adds r0, r4, #0
	bl sub_0809714C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809742A
	adds r5, r4, #0
	adds r5, #0x31
	ldrb r0, [r5]
	lsls r1, r0, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
	ldrh r0, [r4, #0x38]
	cmp r0, #1
	bne _0809742A
	ldr r0, [r4, #0x2c]
	ldrb r3, [r5]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _0809742A
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
_0809742A:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08097430
sub_08097430: @ 0x08097430
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809744C
	ldr r0, _08097468 @ =0x08CC3BDC
	bl Proc_Find
	adds r1, r4, #0
	adds r1, #0x35
	ldrb r1, [r1]
	adds r0, #0x32
	strb r1, [r0]
_0809744C:
	bl sub_080A9D08
	adds r0, r4, #0
	bl EndAllProcChildren
	bl EndMuralBackground_
	movs r0, #0
	bl SetOnHBlankA
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097468: .4byte 0x08CC3BDC

	thumb_func_start StartPrepItemSupplyProc
StartPrepItemSupplyProc: @ 0x0809746C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08097484 @ =0x08CC4B94
	bl SpawnProcLocking
	str r4, [r0, #0x2c]
	adds r0, #0x30
	movs r1, #0
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097484: .4byte 0x08CC4B94

	thumb_func_start sub_08097488
sub_08097488: @ 0x08097488
	push {r4, lr}
	ldr r4, _080974A4 @ =0x03004690
	ldr r0, [r4]
	cmp r0, #0
	beq _0809749C
	bl EndAllMus
	ldr r0, [r4]
	bl ShowUnitSprite
_0809749C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080974A4: .4byte 0x03004690

	thumb_func_start sub_080974A8
sub_080974A8: @ 0x080974A8
	push {r4, lr}
	ldr r4, _080974C8 @ =0x03004690
	ldr r0, [r4]
	cmp r0, #0
	beq _080974C0
	bl HideUnitSprite
	ldr r0, [r4]
	bl StartMu
	bl SetAutoMuDefaultFacing
_080974C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080974C8: .4byte 0x03004690

	thumb_func_start StartBmSupply
StartBmSupply: @ 0x080974CC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080974E8 @ =0x08CC4C74
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x2c]
	adds r0, #0x30
	movs r1, #1
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080974E8: .4byte 0x08CC4C74

	thumb_func_start MaybeStartSelectConvoyItemProc
MaybeStartSelectConvoyItemProc: @ 0x080974EC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08097508 @ =0x08CC4C74
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x2c]
	adds r0, #0x30
	movs r1, #2
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097508: .4byte 0x08CC4C74

	thumb_func_start PrepItemList_Init
PrepItemList_Init: @ 0x0809750C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08097550 @ =0x08CC3BDC
	bl Proc_Find
	movs r2, #0
	movs r1, #0
	strh r1, [r4, #0x36]
	movs r1, #0xff
	strh r1, [r4, #0x34]
	adds r0, #0x31
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x33
	strb r0, [r1]
	subs r1, #2
	movs r0, #4
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x30
	strb r2, [r0]
	movs r2, #0
	adds r0, #8
	movs r1, #8
_0809753C:
	strh r2, [r0]
	strh r2, [r0, #0x12]
	adds r0, #2
	subs r1, #1
	cmp r1, #0
	bge _0809753C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097550: .4byte 0x08CC3BDC

	thumb_func_start sub_08097554
sub_08097554: @ 0x08097554
	push {r4, lr}
	sub sp, #8
	ldr r4, _08097590 @ =0x02022CC8
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	bl TmFillRect_t
	ldr r0, _08097594 @ =0x00001262
	bl GetMsg
	ldr r2, _08097598 @ =0x02012BE0
	movs r1, #0
	str r1, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	movs r0, #1
	bl EnableBgSync
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097590: .4byte 0x02022CC8
_08097594: .4byte 0x00001262
_08097598: .4byte 0x02012BE0

	thumb_func_start PrepItemList_DrawCurrentOwnerText
PrepItemList_DrawCurrentOwnerText: @ 0x0809759C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	adds r6, #0x33
	ldrb r2, [r6]
	lsls r1, r2, #1
	adds r5, r0, #0
	adds r5, #0x38
	adds r1, r5, r1
	ldrh r4, [r1]
	ldr r0, _080975E8 @ =0x02022CD0
	mov r8, r0
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl TmFillRect_t
	ldr r7, _080975EC @ =0x02012B70
	adds r0, r7, #0
	bl ClearText
	ldr r0, _080975F0 @ =0x02012466
	ldrh r0, [r0]
	cmp r0, r4
	bgt _080975F8
	ldr r0, _080975F4 @ =0x0000127D
	bl GetMsg
	movs r1, #0
	str r1, [sp]
	str r0, [sp, #4]
	adds r0, r7, #0
	mov r1, r8
	movs r2, #1
	b _0809761C
	.align 2, 0
_080975E8: .4byte 0x02022CD0
_080975EC: .4byte 0x02012B70
_080975F0: .4byte 0x02012466
_080975F4: .4byte 0x0000127D
_080975F8:
	ldr r0, _08097624 @ =0x020117E4
	ldrb r6, [r6]
	lsls r1, r6, #1
	adds r1, r5, r1
	ldrh r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r4, [r1]
	cmp r4, #0
	bne _0809762C
	ldr r0, _08097628 @ =0x0000125A
	bl GetMsg
	str r4, [sp]
	str r0, [sp, #4]
	adds r0, r7, #0
	mov r1, r8
	movs r2, #3
_0809761C:
	movs r3, #0
	bl PutDrawText
	b _0809764C
	.align 2, 0
_08097624: .4byte 0x020117E4
_08097628: .4byte 0x0000125A
_0809762C:
	adds r0, r4, #0
	bl GetUnitByPid
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetMsg
	movs r1, #0
	str r1, [sp]
	str r0, [sp, #4]
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0
	movs r3, #0
	bl PutDrawText
_0809764C:
	movs r0, #1
	bl EnableBgSync
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08097660
sub_08097660: @ 0x08097660
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0x33
	ldrb r0, [r7]
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r4, #0x7c
	bl GetGameTime
	ldr r2, _080976D8 @ =0x02022860
	lsrs r0, r0, #2
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #1
	ldr r1, _080976DC @ =0x08407400
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r1, _080976E0 @ =0x0000029A
	adds r2, r2, r1
	strh r0, [r2]
	bl EnablePalSync
	ldr r1, _080976E4 @ =0x08CC4FA0
	ldrb r2, [r7]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r3, [r0]
	movs r5, #0x85
	lsls r5, r5, #7
	str r5, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x18
	bl PutSprite
	ldr r3, _080976E8 @ =0x08CC4F90
	str r5, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x18
	bl PutSprite
	ldrb r7, [r7]
	lsls r0, r7, #1
	adds r6, #0x4a
	adds r6, r6, r0
	ldrh r1, [r6]
	ldr r0, _080976EC @ =0x02012466
	ldrh r2, [r0]
	movs r0, #0xb
	movs r3, #7
	bl UpdateMenuScrollBarConfig
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080976D8: .4byte 0x02022860
_080976DC: .4byte 0x08407400
_080976E0: .4byte 0x0000029A
_080976E4: .4byte 0x08CC4FA0
_080976E8: .4byte 0x08CC4F90
_080976EC: .4byte 0x02012466

	thumb_func_start sub_080976F0
sub_080976F0: @ 0x080976F0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, _08097A30 @ =0x03002870
	mov r8, r0
	movs r0, #8
	rsbs r0, r0, #0
	mov r1, r8
	ldrb r1, [r1]
	ands r0, r1
	mov r2, r8
	strb r0, [r2]
	movs r0, #0
	bl InitBgs
	movs r0, #0
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r3, r8
	ldrb r3, [r3, #0xc]
	ands r0, r3
	movs r4, #1
	orrs r0, r4
	mov r2, r8
	strb r0, [r2, #0xc]
	adds r0, r1, #0
	ldrb r3, [r2, #0x10]
	ands r0, r3
	movs r2, #2
	mov sb, r2
	mov r3, sb
	orrs r0, r3
	mov r2, r8
	strb r0, [r2, #0x10]
	ldrb r3, [r2, #0x14]
	ands r1, r3
	strb r1, [r2, #0x14]
	movs r0, #3
	ldrb r1, [r2, #0x18]
	orrs r0, r1
	strb r0, [r2, #0x18]
	bl InitFaces
	bl ResetText
	bl InitIcons
	bl LoadUiFrameGraphics
	bl ApplySystemObjectsGraphics
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	adds r0, r7, #0
	adds r0, #0x33
	ldrb r0, [r0]
	lsls r1, r0, #1
	adds r0, r7, #0
	adds r0, #0x4a
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	ldr r0, _08097A34 @ =0x06012000
	movs r1, #1
	rsbs r1, r1, #0
	bl LoadHelpBoxGfx
	movs r0, #4
	bl ApplyIconPalettes
	bl PrepRestartMuralBackground
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_08091944
	ldr r0, _08097A38 @ =0x02023460
	ldr r1, _08097A3C @ =0x0840E780
	movs r2, #0xa5
	lsls r2, r2, #7
	bl sub_080AACD8
	movs r0, #7
	bl EnableBgSync
	adds r0, r7, #0
	bl StartUiCursorHand
	adds r0, r7, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	movs r0, #0x20
	mov r2, r8
	ldrb r2, [r2, #1]
	orrs r0, r2
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r3, r8
	strb r0, [r3, #1]
	mov r1, r8
	adds r1, #0x2d
	movs r0, #0x80
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xe0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	mov r2, r8
	adds r2, #0x34
	ldrb r0, [r2]
	orrs r0, r4
	mov r1, sb
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r5, #8
	orrs r0, r5
	movs r3, #0x10
	orrs r0, r3
	strb r0, [r2]
	mov r1, r8
	adds r1, #0x36
	ldrb r2, [r1]
	orrs r4, r2
	mov r0, sb
	orrs r4, r0
	movs r0, #5
	rsbs r0, r0, #0
	ands r4, r0
	orrs r4, r5
	orrs r4, r3
	strb r4, [r1]
	adds r0, r7, #0
	bl StartGreenText
	movs r0, #0xc8
	movs r1, #0x90
	adds r2, r7, #0
	bl StartHelpPromptSprite
	ldr r4, _08097A40 @ =0x02012B68
	adds r0, r4, #0
	movs r1, #6
	bl InitText
	adds r0, r4, #0
	adds r0, #8
	movs r1, #5
	bl InitText
	adds r0, r4, #0
	adds r0, #0x78
	movs r1, #4
	bl InitText
	adds r4, #0x10
	movs r5, #4
_0809788C:
	adds r0, r4, #0
	movs r1, #7
	bl InitText
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _0809788C
	movs r1, #0x33
	adds r1, r1, r7
	mov r8, r1
	adds r6, r7, #0
	adds r6, #0x4a
	ldr r4, _08097A44 @ =0x02012BA0
	movs r5, #7
_080978AA:
	adds r0, r4, #0
	movs r1, #7
	bl InitTextDb
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _080978AA
	movs r4, #0x80
	lsls r4, r4, #7
	adds r0, r4, #0
	movs r1, #6
	bl StoreConvoyWeaponIconGraphics
	ldr r2, _08097A48 @ =0x02022D3E
	mov sb, r2
	mov r0, sb
	adds r1, r4, #0
	movs r2, #6
	bl sub_08096260
	ldr r0, _08097A4C @ =0x08405754
	ldr r1, _08097A50 @ =0x06015000
	bl Decompress
	adds r0, r7, #0
	bl StartMenuScrollBar
	movs r0, #0xb0
	lsls r0, r0, #7
	movs r1, #4
	bl InitMenuScrollBarImg
	movs r0, #0xe2
	movs r1, #0x30
	bl PutMenuScrollBarAt
	bl TryHideMenuScrollBar
	ldr r0, [r7, #0x2c]
	mov r3, r8
	ldrb r1, [r3]
	movs r2, #3
	bl SomethingPrepListRelated
	adds r0, r7, #0
	bl sub_08097DD4
	ldr r5, _08097A44 @ =0x02012BA0
	ldr r1, _08097A54 @ =0x02023C7E
	mov r2, r8
	ldrb r2, [r2]
	lsls r0, r2, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	lsrs r2, r0, #4
	ldr r3, [r7, #0x2c]
	adds r0, r5, #0
	bl sub_08095CA8
	movs r0, #4
	bl EnableBgSync
	movs r0, #0xb3
	lsls r0, r0, #1
	add r0, sb
	adds r1, r5, #0
	subs r1, #0x28
	ldr r2, [r7, #0x2c]
	movs r3, #0
	bl DrawPrepScreenItems
	bl sub_08097554
	adds r0, r7, #0
	bl StartUiSpinningArrows
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r0, #0
	movs r2, #2
	bl LoadUiSpinningArrowGfx
	movs r0, #0x78
	movs r1, #0x18
	movs r2, #0xea
	movs r3, #0x18
	bl SetUiSpinningArrowPositions
	movs r0, #3
	bl SetUiSpinningArrowConfig
	ldr r0, _08097A58 @ =sub_08097660
	adds r1, r7, #0
	bl StartParallelWorker
	ldr r0, [r7, #0x2c]
	bl GetUnitFid
	adds r1, r0, #0
	movs r3, #4
	rsbs r3, r3, #0
	ldr r0, _08097A5C @ =0x00000203
	str r0, [sp]
	movs r0, #0
	movs r2, #0x40
	bl StartBmFace
	ldr r0, [r7, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetMsg
	mov r8, r0
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [sp]
	str r7, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl StartSysBrownBox
	movs r1, #0x28
	rsbs r1, r1, #0
	movs r2, #1
	rsbs r2, r2, #0
	movs r0, #0
	movs r3, #1
	bl EnableSysBrownBox
	movs r0, #1
	movs r1, #0x98
	movs r2, #6
	movs r3, #2
	bl EnableSysBrownBox
	ldr r3, _08097A30 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x44
	movs r4, #0
	movs r0, #0xe
	strb r0, [r1]
	adds r1, #1
	movs r0, #4
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r4, [r0]
	ldr r0, _08097A60 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	ldr r1, _08097A64 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #0x30
	mov r1, r8
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	subs r5, #0x38
	str r4, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r5, #0
	ldr r1, _08097A68 @ =0x02022C60
	movs r2, #0
	bl PutDrawText
	adds r0, r7, #0
	bl PrepItemList_DrawCurrentOwnerText
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08097A30: .4byte 0x03002870
_08097A34: .4byte 0x06012000
_08097A38: .4byte 0x02023460
_08097A3C: .4byte 0x0840E780
_08097A40: .4byte 0x02012B68
_08097A44: .4byte 0x02012BA0
_08097A48: .4byte 0x02022D3E
_08097A4C: .4byte 0x08405754
_08097A50: .4byte 0x06015000
_08097A54: .4byte 0x02023C7E
_08097A58: .4byte sub_08097660
_08097A5C: .4byte 0x00000203
_08097A60: .4byte 0x0000FFE0
_08097A64: .4byte 0x0000E0FF
_08097A68: .4byte 0x02022C60

	thumb_func_start sub_08097A6C
sub_08097A6C: @ 0x08097A6C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08097A98 @ =0x08CC3BDC
	bl Proc_Find
	adds r1, r4, #0
	adds r1, #0x33
	ldrb r1, [r1]
	adds r0, #0x31
	strb r1, [r0]
	adds r0, r4, #0
	bl EndAllProcChildren
	movs r0, #0
	bl EndFaceById
	bl EndMuralBackground_
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097A98: .4byte 0x08CC3BDC

	thumb_func_start sub_08097A9C
sub_08097A9C: @ 0x08097A9C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl InitIcons
	ldr r0, [r4, #0x2c]
	adds r5, r4, #0
	adds r5, #0x33
	ldrb r1, [r5]
	movs r2, #3
	bl SomethingPrepListRelated
	adds r0, r4, #0
	bl sub_08097CAC
	ldr r0, _08097B3C @ =0x02012BA0
	ldr r1, _08097B40 @ =0x02023C7E
	ldrb r3, [r5]
	lsls r2, r3, #1
	adds r6, r4, #0
	adds r6, #0x4a
	adds r2, r6, r2
	ldrh r2, [r2]
	lsrs r2, r2, #4
	ldr r3, [r4, #0x2c]
	bl sub_08095CA8
	ldr r0, _08097B44 @ =0x02022EA4
	ldr r1, [r4, #0x2c]
	bl DrawPrepScreenItemIcons
	ldrb r1, [r5]
	lsls r0, r1, #1
	adds r7, r4, #0
	adds r7, #0x38
	adds r1, r7, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r0, r6, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl ShowSysHandCursor
	movs r0, #5
	bl EnableBgSync
	ldr r0, _08097B48 @ =PrepItemList_DrawCurrentOwnerText
	movs r1, #2
	adds r2, r4, #0
	bl StartParallelFiniteLoop
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _08097B5C
	ldr r0, _08097B4C @ =0x02012466
	ldrh r0, [r0]
	cmp r0, #0
	beq _08097B54
	ldr r2, _08097B50 @ =0x020117E4
	ldrb r5, [r5]
	lsls r3, r5, #1
	adds r0, r7, r3
	ldrh r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldrh r2, [r0, #2]
	lsls r1, r1, #4
	adds r3, r6, r3
	ldrh r0, [r3]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	bl StartItemHelpBox
	movs r0, #1
	b _08097B5A
	.align 2, 0
_08097B3C: .4byte 0x02012BA0
_08097B40: .4byte 0x02023C7E
_08097B44: .4byte 0x02022EA4
_08097B48: .4byte PrepItemList_DrawCurrentOwnerText
_08097B4C: .4byte 0x02012466
_08097B50: .4byte 0x020117E4
_08097B54:
	bl CloseHelpBox
	movs r0, #0xff
_08097B5A:
	strh r0, [r4, #0x36]
_08097B5C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08097B64
sub_08097B64: @ 0x08097B64
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r3, #0
	movs r7, #4
	adds r1, r6, #0
	adds r1, #0x32
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r4, [r1]
	cmp r4, #4
	bge _08097B92
	subs r1, r7, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	movs r1, #0x10
	bl __divsi3
	adds r3, r0, #0
	subs r3, #0x60
_08097B92:
	adds r5, r6, #0
	adds r5, #0x33
	cmp r4, #4
	bne _08097BB2
	ldrb r0, [r5]
	cmp r0, #0
	bne _08097BA4
	movs r0, #8
	b _08097BA6
_08097BA4:
	subs r0, #1
_08097BA6:
	strb r0, [r5]
	adds r0, r6, #0
	str r3, [sp]
	bl sub_08097A9C
	ldr r3, [sp]
_08097BB2:
	adds r4, r6, #0
	adds r4, #0x32
	ldrb r1, [r4]
	cmp r1, r7
	blt _08097BD2
	subs r1, r1, r7
	subs r1, r7, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	adds r1, r7, #0
	muls r1, r7, r1
	bl __divsi3
	adds r3, r0, #0
_08097BD2:
	movs r0, #0xff
	ands r3, r0
	ldrb r5, [r5]
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x4a
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r1, r3, #0
	bl SetBgOffset
	lsls r0, r7, #1
	ldrb r4, [r4]
	cmp r4, r0
	bne _08097C00
	adds r0, r6, #0
	movs r1, #1
	bl Proc_Goto
_08097C00:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08097C08
sub_08097C08: @ 0x08097C08
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r3, #0
	movs r7, #4
	adds r1, r6, #0
	adds r1, #0x32
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r4, [r1]
	cmp r4, #4
	bge _08097C36
	subs r1, r7, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	movs r1, #0x10
	bl __divsi3
	movs r1, #0x60
	subs r3, r1, r0
_08097C36:
	adds r5, r6, #0
	adds r5, #0x33
	cmp r4, #4
	bne _08097C56
	ldrb r0, [r5]
	cmp r0, #8
	bne _08097C48
	movs r0, #0
	b _08097C4A
_08097C48:
	adds r0, #1
_08097C4A:
	strb r0, [r5]
	adds r0, r6, #0
	str r3, [sp]
	bl sub_08097A9C
	ldr r3, [sp]
_08097C56:
	adds r4, r6, #0
	adds r4, #0x32
	ldrb r1, [r4]
	cmp r1, r7
	blt _08097C76
	subs r1, r1, r7
	subs r1, r7, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	adds r1, r7, #0
	muls r1, r7, r1
	bl __divsi3
	rsbs r3, r0, #0
_08097C76:
	movs r0, #0xff
	ands r3, r0
	ldrb r5, [r5]
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x4a
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r1, r3, #0
	bl SetBgOffset
	lsls r0, r7, #1
	ldrb r4, [r4]
	cmp r4, r0
	bne _08097CA4
	adds r0, r6, #0
	movs r1, #1
	bl Proc_Goto
_08097CA4:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08097CAC
sub_08097CAC: @ 0x08097CAC
	push {r4, r5, lr}
	mov ip, r0
	ldr r0, _08097CD4 @ =0x02012466
	ldrh r4, [r0]
	adds r5, r0, #0
	cmp r4, #0
	bne _08097CD8
	mov r3, ip
	adds r3, #0x33
	ldrb r1, [r3]
	lsls r0, r1, #1
	mov r1, ip
	adds r1, #0x38
	adds r1, r1, r0
	mov r2, ip
	adds r2, #0x4a
	adds r0, r2, r0
	strh r4, [r0]
	strh r4, [r1]
	b _08097CF6
	.align 2, 0
_08097CD4: .4byte 0x02012466
_08097CD8:
	mov r2, ip
	adds r2, #0x33
	ldrb r0, [r2]
	lsls r1, r0, #1
	mov r0, ip
	adds r0, #0x38
	adds r0, r0, r1
	ldrh r4, [r5]
	subs r4, #1
	adds r3, r2, #0
	adds r2, #0x17
	ldrh r1, [r0]
	cmp r1, r4
	ble _08097CF6
	strh r4, [r0]
_08097CF6:
	ldrh r0, [r5]
	cmp r0, #6
	bls _08097D14
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r4, r2, r0
	ldrh r1, [r4]
	lsrs r0, r1, #4
	adds r0, #7
	ldrh r1, [r5]
	cmp r0, r1
	ble _08097D14
	subs r0, r1, #7
	lsls r0, r0, #4
	strh r0, [r4]
_08097D14:
	ldrb r3, [r3]
	lsls r0, r3, #1
	adds r0, r2, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08097D30
sub_08097D30: @ 0x08097D30
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r7, r1, #0
	bl InitIcons
	ldr r0, _08097DC8 @ =0x02023C7E
	mov r8, r0
	adds r6, r4, #0
	adds r6, #0x33
	ldrb r1, [r6]
	lsls r0, r1, #1
	adds r5, r4, #0
	adds r5, #0x4a
	adds r0, r5, r0
	ldrh r0, [r0]
	lsrs r1, r0, #4
	mov r0, r8
	bl sub_08095DC0
	ldr r0, _08097DCC @ =0x02022EA4
	ldr r1, [r4, #0x2c]
	bl DrawPrepScreenItemIcons
	movs r0, #5
	bl EnableBgSync
	cmp r7, #0
	bge _08097D82
	ldr r0, _08097DD0 @ =0x02012BA0
	ldrb r2, [r6]
	lsls r1, r2, #1
	adds r1, r5, r1
	ldrh r1, [r1]
	lsrs r2, r1, #4
	subs r2, #1
	ldr r3, [r4, #0x2c]
	mov r1, r8
	bl sub_08095E24
_08097D82:
	cmp r7, #0
	ble _08097D9C
	ldr r0, _08097DD0 @ =0x02012BA0
	ldrb r2, [r6]
	lsls r1, r2, #1
	adds r1, r5, r1
	ldrh r1, [r1]
	lsrs r2, r1, #4
	adds r2, #7
	ldr r3, [r4, #0x2c]
	mov r1, r8
	bl sub_08095E24
_08097D9C:
	ldrb r1, [r6]
	lsls r0, r1, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	adds r1, r2, r7
	strh r1, [r0]
	ldrb r6, [r6]
	lsls r0, r6, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08097DC8: .4byte 0x02023C7E
_08097DCC: .4byte 0x02022EA4
_08097DD0: .4byte 0x02012BA0

	thumb_func_start sub_08097DD4
sub_08097DD4: @ 0x08097DD4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0
	adds r0, #0x33
	ldrb r0, [r0]
	lsls r2, r0, #1
	mov r0, ip
	adds r0, #0x38
	adds r4, r0, r2
	ldrh r3, [r4]
	lsls r1, r3, #4
	adds r0, #0x12
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	cmp r1, #0x37
	bgt _08097E02
	cmp r3, #0
	beq _08097E02
	adds r0, r3, #1
	strh r0, [r4]
_08097E02:
	mov r4, ip
	adds r4, #0x33
	ldrb r1, [r4]
	lsls r0, r1, #1
	mov r3, ip
	adds r3, #0x38
	adds r6, r3, r0
	ldrh r5, [r6]
	lsls r1, r5, #4
	mov r2, ip
	adds r2, #0x4a
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	adds r7, r3, #0
	mov r8, r2
	cmp r1, #0x78
	ble _08097E36
	ldr r0, _08097E64 @ =0x02012466
	ldrh r0, [r0]
	subs r0, #1
	cmp r5, r0
	beq _08097E36
	subs r0, r5, #1
	strh r0, [r6]
_08097E36:
	mov r0, ip
	bl sub_08097CAC
	ldrb r4, [r4]
	lsls r0, r4, #1
	adds r1, r7, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl ShowSysHandCursor
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08097E64: .4byte 0x02012466

	thumb_func_start sub_08097E68
sub_08097E68: @ 0x08097E68
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x33
	ldrb r0, [r6]
	lsls r1, r0, #1
	movs r2, #0x38
	adds r2, r2, r4
	mov r8, r2
	adds r0, r2, r1
	ldrh r0, [r0]
	mov sb, r0
	adds r5, r4, #0
	adds r5, #0x4a
	adds r7, r5, r1
	movs r3, #0xf
	ldrh r0, [r7]
	ands r0, r3
	mov sl, r0
	cmp r0, #0
	beq _08097E9C
	b _080980F0
_08097E9C:
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _08097EA8
	cmp r0, #0xff
	beq _08097EA8
	b _08097FA4
_08097EA8:
	ldr r1, _08097EE4 @ =0x08B857F8
	ldr r0, [r1]
	ldrh r3, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	mov r8, r1
	cmp r0, #0
	beq _08097EF0
	ldr r0, _08097EE8 @ =0x02012466
	ldrh r0, [r0]
	cmp r0, #0
	beq _08097F00
	ldr r1, _08097EEC @ =0x020117E4
	mov r2, sb
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrh r2, [r0, #2]
	mov r3, sb
	lsls r1, r3, #4
	ldrh r0, [r7]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	bl StartItemHelpBox
	movs r0, #1
	strh r0, [r4, #0x36]
	b _08098266
	.align 2, 0
_08097EE4: .4byte 0x08B857F8
_08097EE8: .4byte 0x02012466
_08097EEC: .4byte 0x020117E4
_08097EF0:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _08097F74
	ldr r0, _08097F18 @ =0x02012466
	ldrh r0, [r0]
	cmp r0, #0
	bne _08097F20
_08097F00:
	ldr r0, _08097F1C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _08097F0E
	b _08098266
_08097F0E:
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _08098266
	.align 2, 0
_08097F18: .4byte 0x02012466
_08097F1C: .4byte 0x0202BBF8
_08097F20:
	ldr r0, _08097F48 @ =0x020117E4
	mov r2, sb
	lsls r1, r2, #2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	bne _08097F4C
	lsls r2, r2, #4
	ldrh r0, [r7]
	subs r0, #0x28
	subs r2, r2, r0
	movs r0, #0
	movs r1, #0x80
	movs r3, #2
	bl SetUiCursorHandConfig
	adds r0, r4, #0
	movs r1, #7
	b _08097F50
	.align 2, 0
_08097F48: .4byte 0x020117E4
_08097F4C:
	adds r0, r4, #0
	movs r1, #6
_08097F50:
	bl Proc_Goto
	ldr r0, _08097F6C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _08097F62
	b _08098266
_08097F62:
	ldr r0, _08097F70 @ =0x0000038A
	bl m4aSongNumStart
	b _08098266
	.align 2, 0
_08097F6C: .4byte 0x0202BBF8
_08097F70: .4byte 0x0000038A
_08097F74:
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _08097FC4
	adds r0, r4, #0
	movs r1, #8
	bl Proc_Goto
	ldr r0, _08097F9C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08097F96
	ldr r0, _08097FA0 @ =0x0000038B
	bl m4aSongNumStart
_08097F96:
	mov r3, sl
	strh r3, [r4, #0x36]
	b _08098266
	.align 2, 0
_08097F9C: .4byte 0x0202BBF8
_08097FA0: .4byte 0x0000038B
_08097FA4:
	ldr r2, _08097FC0 @ =0x08B857F8
	ldr r1, [r2]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	mov r8, r2
	cmp r0, #0
	beq _08097FC4
	bl CloseHelpBox
	mov r0, sl
	strh r0, [r4, #0x36]
	b _08098266
	.align 2, 0
_08097FC0: .4byte 0x08B857F8
_08097FC4:
	mov r1, r8
	ldr r2, [r1]
	ldrh r1, [r2, #6]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _08098010
	movs r0, #0
	bl SetUiSpinningArrowFastMaybe
	ldr r0, _08098008 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08097FEE
	ldr r0, _0809800C @ =0x00000387
	bl m4aSongNumStart
_08097FEE:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	adds r1, r4, #0
	adds r1, #0x32
	movs r0, #0
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_08097B64
	b _08098266
	.align 2, 0
_08098008: .4byte 0x0202BBF8
_0809800C: .4byte 0x00000387
_08098010:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08098050
	movs r0, #1
	bl SetUiSpinningArrowFastMaybe
	ldr r0, _08098048 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08098030
	ldr r0, _0809804C @ =0x00000387
	bl m4aSongNumStart
_08098030:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
	adds r0, r4, #0
	adds r0, #0x32
	strb r5, [r0]
	adds r0, r4, #0
	bl sub_08097C08
	b _08098266
	.align 2, 0
_08098048: .4byte 0x0202BBF8
_0809804C: .4byte 0x00000387
_08098050:
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r2, [r2, #4]
	ands r0, r2
	cmp r0, #0
	beq _08098064
	adds r1, r4, #0
	adds r1, #0x31
	movs r0, #8
	b _0809806A
_08098064:
	adds r1, r4, #0
	adds r1, #0x31
	movs r0, #4
_0809806A:
	strb r0, [r1]
	adds r5, r1, #0
	mov r2, r8
	ldr r1, [r2]
	movs r2, #0x40
	adds r0, r2, #0
	ldrh r3, [r1, #6]
	ands r0, r3
	cmp r0, #0
	bne _08098096
	adds r0, r2, #0
	ldrh r1, [r1, #4]
	ands r0, r1
	adds r7, r4, #0
	adds r7, #0x33
	adds r6, r4, #0
	adds r6, #0x38
	cmp r0, #0
	beq _080980B2
	ldrb r0, [r5]
	cmp r0, #8
	bne _080980B2
_08098096:
	adds r0, r4, #0
	adds r0, #0x33
	ldrb r2, [r0]
	lsls r1, r2, #1
	adds r2, r4, #0
	adds r2, #0x38
	adds r3, r2, r1
	ldrh r1, [r3]
	adds r7, r0, #0
	adds r6, r2, #0
	cmp r1, #0
	beq _080980B2
	subs r0, r1, #1
	strh r0, [r3]
_080980B2:
	mov r3, r8
	ldr r1, [r3]
	movs r2, #0x80
	adds r0, r2, #0
	ldrh r3, [r1, #6]
	ands r0, r3
	cmp r0, #0
	bne _080980D2
	adds r0, r2, #0
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _08098150
	ldrb r5, [r5]
	cmp r5, #8
	bne _08098150
_080980D2:
	ldrb r1, [r7]
	lsls r0, r1, #1
	adds r2, r6, r0
	ldrh r1, [r2]
	ldr r0, _080980EC @ =0x02012466
	ldrh r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge _08098150
	adds r0, r1, #1
	strh r0, [r2]
	b _08098150
	.align 2, 0
_080980EC: .4byte 0x02012466
_080980F0:
	mov r2, sb
	lsls r0, r2, #4
	ldrh r2, [r7]
	adds r1, r2, #0
	subs r1, #0x28
	subs r0, r0, r1
	cmp r0, #0x37
	bgt _0809810E
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r2, r0
	strh r0, [r7]
_0809810E:
	ldrb r3, [r6]
	lsls r2, r3, #1
	mov r1, r8
	adds r0, r1, r2
	ldrh r0, [r0]
	lsls r1, r0, #4
	adds r3, r5, r2
	ldrh r2, [r3]
	adds r0, r2, #0
	subs r0, #0x28
	subs r1, r1, r0
	cmp r1, #0x78
	ble _08098136
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r2, r0
	strh r0, [r3]
_08098136:
	ldrb r2, [r6]
	lsls r0, r2, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	adds r7, r6, #0
	mov r6, r8
_08098150:
	ldrb r3, [r7]
	lsls r0, r3, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	cmp sb, r0
	bne _0809815E
	b _08098266
_0809815E:
	ldr r5, _080981D8 @ =0x020117E4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrh r0, [r0, #2]
	mov sl, r0
	ldr r0, _080981DC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809817A
	ldr r0, _080981E0 @ =0x00000386
	bl m4aSongNumStart
_0809817A:
	ldrb r1, [r7]
	lsls r0, r1, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r5
	mov r2, sb
	lsls r0, r2, #2
	adds r0, r0, r5
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	beq _0809819A
	adds r0, r4, #0
	bl PrepItemList_DrawCurrentOwnerText
_0809819A:
	ldrb r3, [r7]
	lsls r1, r3, #1
	adds r0, r6, r1
	ldrh r5, [r0]
	lsls r3, r5, #4
	adds r2, r4, #0
	adds r2, #0x4a
	adds r1, r2, r1
	ldrh r0, [r1]
	subs r0, #0x28
	subs r1, r3, r0
	mov r8, r2
	cmp r1, #0x37
	bgt _080981E4
	cmp r5, #0
	beq _080981E4
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _080981CA
	adds r1, #0x10
	movs r0, #0x80
	mov r2, sl
	bl StartItemHelpBox
_080981CA:
	adds r0, r4, #0
	adds r0, #0x31
	movs r1, #0
	ldrsb r1, [r0, r1]
	rsbs r1, r1, #0
	b _0809821C
	.align 2, 0
_080981D8: .4byte 0x020117E4
_080981DC: .4byte 0x0202BBF8
_080981E0: .4byte 0x00000386
_080981E4:
	ldrb r1, [r7]
	lsls r0, r1, #1
	adds r1, r6, r0
	ldrh r2, [r1]
	lsls r1, r2, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	cmp r1, #0x78
	ble _08098228
	ldr r0, _08098224 @ =0x02012466
	ldrh r0, [r0]
	subs r0, #1
	cmp r2, r0
	beq _08098228
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _08098214
	subs r1, #0x10
	movs r0, #0x80
	mov r2, sl
	bl StartItemHelpBox
_08098214:
	adds r0, r4, #0
	adds r0, #0x31
	movs r1, #0
	ldrsb r1, [r0, r1]
_0809821C:
	adds r0, r4, #0
	bl sub_08097D30
	b _08098266
	.align 2, 0
_08098224: .4byte 0x02012466
_08098228:
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _08098248
	ldrb r2, [r7]
	lsls r0, r2, #1
	adds r1, r6, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	mov r2, sl
	bl StartItemHelpBox
_08098248:
	ldrb r7, [r7]
	lsls r0, r7, #1
	adds r1, r6, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl ShowSysHandCursor
_08098266:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08098274
sub_08098274: @ 0x08098274
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r7, [r0]
	adds r3, r1, #0
	cmp r3, #5
	bne _08098290
	movs r3, #4
	b _08098298
_08098290:
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _08098298
	subs r3, #1
_08098298:
	cmp r1, #0
	beq _08098318
	ldr r1, _080982BC @ =0x08B857F8
	ldr r5, [r1]
	movs r6, #0x40
	adds r0, r6, #0
	ldrh r2, [r5, #6]
	ands r0, r2
	adds r2, r4, #0
	adds r2, #0x30
	cmp r0, #0
	beq _080982CC
	ldrb r0, [r2]
	cmp r0, #0
	beq _080982C0
	subs r0, #1
	strb r0, [r2]
	b _080982CC
	.align 2, 0
_080982BC: .4byte 0x08B857F8
_080982C0:
	adds r0, r6, #0
	ldrh r5, [r5, #8]
	ands r0, r5
	cmp r0, #0
	beq _080982CC
	strb r3, [r2]
_080982CC:
	ldr r1, [r1]
	movs r4, #0x80
	adds r0, r4, #0
	ldrh r5, [r1, #6]
	ands r0, r5
	cmp r0, #0
	beq _080982F2
	ldrb r0, [r2]
	cmp r0, r3
	bge _080982E4
	adds r0, #1
	b _080982F0
_080982E4:
	adds r0, r4, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080982F2
	movs r0, #0
_080982F0:
	strb r0, [r2]
_080982F2:
	ldrb r2, [r2]
	cmp r7, r2
	beq _08098318
	ldr r0, _08098310 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809830A
	ldr r0, _08098314 @ =0x00000386
	bl m4aSongNumStart
_0809830A:
	movs r0, #1
	b _0809831A
	.align 2, 0
_08098310: .4byte 0x0202BBF8
_08098314: .4byte 0x00000386
_08098318:
	movs r0, #0
_0809831A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_08098320
sub_08098320: @ 0x08098320
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r1, r0, #0
	cmp r1, #5
	bne _0809833C
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #4
	strb r0, [r1]
	adds r0, r1, #0
	b _08098342
_0809833C:
	adds r0, r4, #0
	adds r0, #0x30
	strb r1, [r0]
_08098342:
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0809835C
sub_0809835C: @ 0x0809835C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0x33
	ldrb r1, [r7]
	lsls r0, r1, #1
	adds r2, r6, #0
	adds r2, #0x38
	adds r2, r2, r0
	ldr r1, [r6, #0x2c]
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r5, [r1]
	ldr r0, _080983FC @ =0x020117E4
	ldrh r2, [r2]
	lsls r4, r2, #2
	adds r4, r4, r0
	ldrh r0, [r4, #2]
	strh r0, [r1]
	ldr r0, [r6, #0x2c]
	bl UnitRemoveInvalidItems
	strh r5, [r4, #2]
	bl sub_0809120C
	cmp r5, #0
	bne _080983A4
	ldr r0, [r6, #0x2c]
	ldrb r1, [r7]
	movs r2, #3
	bl SomethingPrepListRelated
_080983A4:
	adds r0, r6, #0
	bl sub_08097CAC
	ldr r0, _08098400 @ =0x02022EA4
	ldr r4, _08098404 @ =0x02012B78
	ldr r2, [r6, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl DrawPrepScreenItems
	adds r4, #0x28
	ldr r1, _08098408 @ =0x02023C7E
	ldrb r7, [r7]
	lsls r2, r7, #1
	adds r0, r6, #0
	adds r0, #0x4a
	adds r0, r0, r2
	ldrh r0, [r0]
	lsrs r2, r0, #4
	ldr r3, [r6, #0x2c]
	adds r0, r4, #0
	bl sub_08095CA8
	ldr r0, _0809840C @ =PrepItemList_DrawCurrentOwnerText
	movs r1, #1
	adds r2, r6, #0
	bl StartParallelFiniteLoop
	movs r0, #4
	bl EnableBgSync
	ldr r0, _08098410 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080983F4
	ldr r0, _08098414 @ =0x0000038A
	bl m4aSongNumStart
_080983F4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080983FC: .4byte 0x020117E4
_08098400: .4byte 0x02022EA4
_08098404: .4byte 0x02012B78
_08098408: .4byte 0x02023C7E
_0809840C: .4byte PrepItemList_DrawCurrentOwnerText
_08098410: .4byte 0x0202BBF8
_08098414: .4byte 0x0000038A

	thumb_func_start sub_08098418
sub_08098418: @ 0x08098418
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x36]
	cmp r0, #1
	bne _08098440
	ldr r0, _0809843C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08098508
	bl CloseHelpBox
	movs r0, #0
	strh r0, [r5, #0x36]
	b _0809854A
	.align 2, 0
_0809843C: .4byte 0x08B857F8
_08098440:
	ldr r0, _08098474 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08098478
	ldr r0, [r5, #0x2c]
	adds r1, r5, #0
	adds r1, #0x30
	ldrb r3, [r1]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _0809854A
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
	movs r0, #1
	strh r0, [r5, #0x36]
	b _0809854A
	.align 2, 0
_08098474: .4byte 0x08B857F8
_08098478:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080984D8
	ldr r0, [r5, #0x2c]
	adds r1, r5, #0
	adds r1, #0x30
	ldrb r1, [r1]
	ldr r4, _080984BC @ =0x020117E4
	adds r2, r5, #0
	adds r2, #0x33
	ldrb r2, [r2]
	lsls r3, r2, #1
	adds r2, r5, #0
	adds r2, #0x38
	adds r2, r2, r3
	ldrh r2, [r2]
	lsls r2, r2, #2
	adds r2, r2, r4
	ldrh r2, [r2, #2]
	bl CheckValidLinkArenaItemSupply
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080984C4
	movs r1, #1
	rsbs r1, r1, #0
	ldr r2, _080984C0 @ =0x000003AE
	adds r0, r1, #0
	adds r3, r5, #0
	bl StartPrepErrorHelpbox
	b _0809854A
	.align 2, 0
_080984BC: .4byte 0x020117E4
_080984C0: .4byte 0x000003AE
_080984C4:
	movs r0, #0
	bl DisableUiCursorHand
	adds r0, r5, #0
	bl Proc_Break
	adds r0, r5, #0
	bl sub_0809835C
	b _0809854A
_080984D8:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08098508
	movs r0, #0
	bl DisableUiCursorHand
	adds r0, r5, #0
	bl Proc_Break
	ldr r0, _08098500 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809854A
	ldr r0, _08098504 @ =0x0000038B
	bl m4aSongNumStart
	b _0809854A
	.align 2, 0
_08098500: .4byte 0x0202BBF8
_08098504: .4byte 0x0000038B
_08098508:
	adds r0, r5, #0
	bl sub_08098274
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809854A
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r0, [r4]
	lsls r1, r0, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
	ldrh r0, [r5, #0x36]
	cmp r0, #1
	bne _0809854A
	ldr r0, [r5, #0x2c]
	ldrb r3, [r4]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _0809854A
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
_0809854A:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start PrepItemList_StartTradeScreen
PrepItemList_StartTradeScreen: @ 0x08098550
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, #0x33
	ldrb r0, [r0]
	lsls r1, r0, #1
	adds r0, r5, #0
	adds r0, #0x38
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r4, r0, #2
	ldr r0, _08098584 @ =0x020117E4
	adds r4, r4, r0
	ldr r6, [r5, #0x2c]
	ldrb r0, [r4]
	bl GetUnitByPid
	adds r1, r0, #0
	ldrb r2, [r4, #1]
	adds r0, r6, #0
	adds r3, r5, #0
	bl sub_0809496C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08098584: .4byte 0x020117E4

	thumb_func_start sub_08098588
sub_08098588: @ 0x08098588
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809859C @ =0x08CC4DBC
	bl SpawnProcLocking
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809859C: .4byte 0x08CC4DBC

	thumb_func_start sub_080985A0
sub_080985A0: @ 0x080985A0
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r6, _080985CC @ =0x0000DF80
	movs r5, #0x30
	movs r4, #3
_080985AA:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x10
	ldr r3, _080985D0 @ =0x08B905F8
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _080985AA
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080985CC: .4byte 0x0000DF80
_080985D0: .4byte 0x08B905F8

	thumb_func_start sub_080985D4
sub_080985D4: @ 0x080985D4
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0809860C @ =sub_080985A0
	bl StartParallelWorker
	ldr r0, _08098610 @ =0x08CC4EB4
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	ldr r1, _08098614 @ =0x08CC4EBC
	ldr r1, [r1]
	bl GetMsgTo
	adds r2, r0, #0
	movs r0, #0xe0
	lsls r0, r0, #7
	str r5, [sp]
	movs r1, #0xd
	movs r3, #1
	bl sub_080A9D1C
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809860C: .4byte sub_080985A0
_08098610: .4byte 0x08CC4EB4
_08098614: .4byte 0x08CC4EBC

	thumb_func_start sub_08098618
sub_08098618: @ 0x08098618
	ldr r0, _08098644 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xa0
	bls _08098628
	movs r2, #0
_08098628:
	cmp r2, #0xc
	bne _08098632
	ldr r1, _08098648 @ =0x04000050
	movs r0, #0xc8
	strh r0, [r1]
_08098632:
	cmp r2, #0x34
	beq _0809863A
	cmp r2, #0
	bne _08098642
_0809863A:
	ldr r1, _08098648 @ =0x04000050
	ldr r2, _0809864C @ =0x00000242
	adds r0, r2, #0
	strh r0, [r1]
_08098642:
	bx lr
	.align 2, 0
_08098644: .4byte 0x04000006
_08098648: .4byte 0x04000050
_0809864C: .4byte 0x00000242

	thumb_func_start WmSell_Init
WmSell_Init: @ 0x08098650
	movs r2, #0
	movs r1, #0
	strh r1, [r0, #0x34]
	movs r1, #0xff
	strh r1, [r0, #0x32]
	adds r0, #0x30
	strb r2, [r0]
	bx lr

	thumb_func_start sub_08098660
sub_08098660: @ 0x08098660
	push {r4, r5, lr}
	ldr r4, _08098700 @ =0x02012B50
	ldr r1, _08098704 @ =0x06011000
	adds r0, r4, #0
	movs r2, #0xb
	bl InitSpriteTextFont
	ldr r0, _08098708 @ =0x08194674
	movs r1, #0xd8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r5, r4, #0
	adds r5, #0x90
	adds r0, r5, #0
	bl InitSpriteText
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r0, r5, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	movs r0, #0x93
	lsls r0, r0, #5
	bl GetMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0
	bl Text_InsertDrawString
	ldr r0, _0809870C @ =0x00001265
	bl GetMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x20
	movs r2, #0
	bl Text_InsertDrawString
	ldr r0, _08098710 @ =0x00001266
	bl GetMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x40
	movs r2, #0
	bl Text_InsertDrawString
	ldr r0, _08098714 @ =0x00001267
	bl GetMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x80
	movs r2, #3
	bl Text_InsertDrawString
	ldr r0, _08098718 @ =0x00001259
	bl GetMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0xc0
	movs r2, #3
	bl Text_InsertDrawString
	movs r0, #0
	bl SetTextFont
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08098700: .4byte 0x02012B50
_08098704: .4byte 0x06011000
_08098708: .4byte 0x08194674
_0809870C: .4byte 0x00001265
_08098710: .4byte 0x00001266
_08098714: .4byte 0x00001267
_08098718: .4byte 0x00001259

	thumb_func_start sub_0809871C
sub_0809871C: @ 0x0809871C
	push {r4, lr}
	sub sp, #4
	movs r0, #0xaa
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #0xa0
	movs r1, #0x68
	movs r2, #8
	movs r3, #4
	bl PrepItemDrawPopupBox
	ldr r4, _0809877C @ =0x08B905F8
	ldr r0, _08098780 @ =0x0000B088
	str r0, [sp]
	movs r0, #4
	movs r1, #0xb0
	movs r2, #0x6c
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _08098784 @ =0x0000B08C
	str r0, [sp]
	movs r0, #4
	movs r1, #0xd0
	movs r2, #0x6c
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _08098788 @ =0x0000B080
	str r0, [sp]
	movs r0, #4
	movs r1, #0xa8
	movs r2, #0x7c
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _0809878C @ =0x0000B084
	str r0, [sp]
	movs r0, #4
	movs r1, #0xc8
	movs r2, #0x7c
	adds r3, r4, #0
	bl PutSpriteExt
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809877C: .4byte 0x08B905F8
_08098780: .4byte 0x0000B088
_08098784: .4byte 0x0000B08C
_08098788: .4byte 0x0000B080
_0809878C: .4byte 0x0000B084

	thumb_func_start sub_08098790
sub_08098790: @ 0x08098790
	push {r4, lr}
	sub sp, #4
	ldr r4, _080987D0 @ =0x08B905F8
	ldr r0, _080987D4 @ =0x0000B090
	str r0, [sp]
	movs r0, #4
	movs r1, #0x8c
	movs r2, #0x58
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r3, _080987D8 @ =0x08B905D0
	ldr r0, _080987DC @ =0x0000B094
	str r0, [sp]
	movs r0, #4
	movs r1, #0xac
	movs r2, #0x58
	bl PutSpriteExt
	ldr r0, _080987E0 @ =0x0000B098
	str r0, [sp]
	movs r0, #4
	movs r1, #0x90
	movs r2, #0x38
	adds r3, r4, #0
	bl PutSpriteExt
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080987D0: .4byte 0x08B905F8
_080987D4: .4byte 0x0000B090
_080987D8: .4byte 0x08B905D0
_080987DC: .4byte 0x0000B094
_080987E0: .4byte 0x0000B098

	thumb_func_start WmSell_DrawItemGoldValue
WmSell_DrawItemGoldValue: @ 0x080987E4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r6, _0809883C @ =0x02022F48
	adds r0, r6, #0
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl TmFillRect_t
	cmp r4, #0
	beq _08098856
	adds r0, r4, #0
	bl GetItemSellPrice
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _08098816
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _08098840
_08098816:
	adds r0, r6, #0
	adds r0, #0xa
	movs r1, #1
	movs r2, #0x14
	bl PutSpecialChar
	adds r0, r6, #0
	adds r0, #0xc
	movs r1, #1
	movs r2, #0x14
	bl PutSpecialChar
	adds r0, r6, #0
	adds r0, #0xe
	movs r1, #1
	movs r2, #0x14
	bl PutSpecialChar
	b _0809884C
	.align 2, 0
_0809883C: .4byte 0x02022F48
_08098840:
	adds r0, r6, #0
	adds r0, #0xc
	movs r1, #2
	adds r2, r5, #0
	bl PutNumber
_0809884C:
	ldr r0, _08098864 @ =0x02022F56
	movs r1, #3
	movs r2, #0x1e
	bl PutSpecialChar
_08098856:
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08098864: .4byte 0x02022F56

	thumb_func_start sub_08098868
sub_08098868: @ 0x08098868
	push {r4, r5, lr}
	ldr r4, _080988A4 @ =0x02022E48
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl TmFillRect_t
	adds r5, r4, #0
	adds r5, #0xe
	bl GetGold
	adds r2, r0, #0
	adds r0, r5, #0
	movs r1, #2
	bl PutNumber
	adds r4, #0x10
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0x1e
	bl PutSpecialChar
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080988A4: .4byte 0x02022E48

	thumb_func_start sub_080988A8
sub_080988A8: @ 0x080988A8
	push {r4, lr}
	sub sp, #8
	movs r0, #0
	bl SetTextFont
	ldr r4, _080988FC @ =0x02022CC8
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	bl TmFillRect_t
	ldr r0, _08098900 @ =0x0000125A
	bl GetMsg
	ldr r3, _08098904 @ =0x02012B68
	adds r1, r4, #0
	adds r1, #0xda
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r3, #0
	movs r3, #2
	bl PutDrawText
	subs r4, #0x26
	movs r2, #0x9c
	lsls r2, r2, #2
	movs r0, #1
	str r0, [sp]
	movs r0, #0x4a
	adds r1, r4, #0
	movs r3, #2
	bl PutFaceChibi
	movs r0, #1
	bl EnableBgSync
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080988FC: .4byte 0x02022CC8
_08098900: .4byte 0x0000125A
_08098904: .4byte 0x02012B68

	thumb_func_start sub_08098908
sub_08098908: @ 0x08098908
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r0
	ldr r7, _08098B54 @ =0x03002870
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r7]
	ands r0, r1
	strb r0, [r7]
	movs r0, #0
	bl InitBgs
	movs r0, #0
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r7, #0xc]
	ands r0, r2
	strb r0, [r7, #0xc]
	adds r0, r1, #0
	ldrb r3, [r7, #0x10]
	ands r0, r3
	movs r6, #2
	mov r8, r6
	mov r2, r8
	orrs r0, r2
	strb r0, [r7, #0x10]
	ldrb r3, [r7, #0x14]
	ands r1, r3
	strb r1, [r7, #0x14]
	movs r0, #3
	ldrb r6, [r7, #0x18]
	orrs r0, r6
	strb r0, [r7, #0x18]
	bl InitFaces
	bl ResetText
	bl InitIcons
	bl LoadUiFrameGraphics
	bl ApplySystemObjectsGraphics
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _08098B58 @ =0x06012800
	movs r1, #1
	rsbs r1, r1, #0
	bl LoadHelpBoxGfx
	movs r0, #4
	bl ApplyIconPalettes
	bl PrepRestartMuralBackground
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_08091944
	movs r0, #0x80
	lsls r0, r0, #7
	movs r1, #0xa
	bl sub_08091994
	ldr r0, _08098B5C @ =0x02023460
	ldr r1, _08098B60 @ =0x0840E6AC
	movs r2, #0xa5
	lsls r2, r2, #7
	bl sub_080AACD8
	movs r0, #7
	bl EnableBgSync
	mov r1, sb
	ldr r0, [r1, #0x2c]
	bl GetUnitFid
	adds r1, r0, #0
	ldr r0, _08098B64 @ =0x00000503
	str r0, [sp]
	movs r0, #0
	movs r2, #0x44
	movs r3, #0x4a
	bl StartBmFace
	mov r0, sb
	bl StartUiCursorHand
	mov r0, sb
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	movs r5, #0x20
	ldrb r0, [r7, #1]
	orrs r0, r5
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	adds r1, r7, #0
	adds r1, #0x2d
	movs r0, #0x80
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xe0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	movs r2, #0x34
	adds r2, r2, r7
	mov sl, r2
	movs r0, #1
	ldrb r1, [r2]
	orrs r1, r0
	mov r3, r8
	orrs r1, r3
	movs r2, #4
	orrs r1, r2
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	movs r6, #0x36
	adds r6, r6, r7
	mov ip, r6
	ldrb r2, [r6]
	orrs r0, r2
	mov r6, r8
	orrs r0, r6
	movs r2, #5
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	orrs r1, r5
	mov r2, sl
	strb r1, [r2]
	orrs r0, r5
	mov r3, ip
	strb r0, [r3]
	adds r1, r7, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r6, [r1]
	ands r0, r6
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x44
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	mov r0, sb
	bl StartGreenText
	movs r0, #0xc8
	movs r1, #0x90
	mov r2, sb
	bl StartHelpPromptSprite
	ldr r4, _08098B68 @ =0x02012B68
	adds r0, r4, #0
	movs r1, #4
	bl InitText
	adds r0, r4, #0
	adds r0, #8
	movs r1, #2
	bl InitText
	bl sub_08098660
	adds r4, #0x10
	movs r5, #4
_08098AC4:
	adds r0, r4, #0
	movs r1, #7
	bl InitText
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _08098AC4
	movs r0, #0
	bl SetOnHBlankA
	ldr r0, _08098B6C @ =sub_08098618
	bl SetOnHBlankA
	movs r0, #4
	bl EnableBgSync
	ldr r0, _08098B70 @ =0x02022EA4
	ldr r1, _08098B74 @ =0x02012B78
	mov r3, sb
	ldr r2, [r3, #0x2c]
	movs r3, #0
	bl DrawPrepScreenItems
	bl sub_080988A8
	ldr r0, _08098B78 @ =sub_08098790
	mov r1, sb
	bl StartParallelWorker
	mov r6, sb
	ldr r0, [r6, #0x2c]
	mov r1, sb
	adds r1, #0x30
	ldrb r1, [r1]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl WmSell_DrawItemGoldValue
	bl sub_08098868
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r0, #0
	str r0, [sp]
	str r6, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl StartSysBrownBox
	movs r0, #0
	movs r1, #1
	bl SetSysBrownBoxWidth
	movs r0, #0
	movs r1, #0x88
	movs r2, #0x36
	movs r3, #2
	bl EnableSysBrownBox
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08098B54: .4byte 0x03002870
_08098B58: .4byte 0x06012800
_08098B5C: .4byte 0x02023460
_08098B60: .4byte 0x0840E6AC
_08098B64: .4byte 0x00000503
_08098B68: .4byte 0x02012B68
_08098B6C: .4byte sub_08098618
_08098B70: .4byte 0x02022EA4
_08098B74: .4byte 0x02012B78
_08098B78: .4byte sub_08098790

	thumb_func_start sub_08098B7C
sub_08098B7C: @ 0x08098B7C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r6, _08098BAC @ =0x08B857F8
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _08098BC2
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r3, r0, #0
	adds r2, r4, #0
	adds r2, #0x30
	ldrb r0, [r2]
	cmp r0, #0
	beq _08098BB0
	subs r0, #1
	strb r0, [r2]
	b _08098BF2
	.align 2, 0
_08098BAC: .4byte 0x08B857F8
_08098BB0:
	ldr r1, [r6]
	adds r0, r7, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08098C10
	subs r0, r3, #1
	strb r0, [r2]
	b _08098BF2
_08098BC2:
	movs r7, #0x80
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _08098C10
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r2, r4, #0
	adds r2, #0x30
	ldrb r1, [r2]
	subs r0, #1
	cmp r1, r0
	bge _08098BE4
	adds r0, r1, #1
	strb r0, [r2]
	b _08098BF2
_08098BE4:
	ldr r1, [r6]
	adds r0, r7, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08098C10
	strb r5, [r2]
_08098BF2:
	ldr r0, _08098C08 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08098C04
	ldr r0, _08098C0C @ =0x00000386
	bl m4aSongNumStart
_08098C04:
	movs r0, #1
	b _08098C12
	.align 2, 0
_08098C08: .4byte 0x0202BBF8
_08098C0C: .4byte 0x00000386
_08098C10:
	movs r0, #0
_08098C12:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_08098C18
sub_08098C18: @ 0x08098C18
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08098C6C @ =0x02022EA4
	ldr r1, _08098C70 @ =0x02012B78
	ldr r2, [r4, #0x2c]
	movs r3, #0
	bl DrawPrepScreenItems
	ldr r0, [r4, #0x2c]
	adds r5, r4, #0
	adds r5, #0x30
	ldrb r2, [r5]
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl WmSell_DrawItemGoldValue
	movs r0, #0
	bl DisableUiCursorHand
	ldr r0, _08098C74 @ =sub_0809871C
	bl GetParallelWorker
	bl Proc_End
	ldrb r5, [r5]
	lsls r1, r5, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #3
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
	movs r0, #0
	adds r1, r4, #0
	bl sub_080985D4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08098C6C: .4byte 0x02022EA4
_08098C70: .4byte 0x02012B78
_08098C74: .4byte sub_0809871C

	thumb_func_start sub_08098C78
sub_08098C78: @ 0x08098C78
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x34]
	cmp r0, #1
	bne _08098CA0
	ldr r0, _08098C9C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08098D74
	bl CloseHelpBox
	movs r0, #0
	strh r0, [r4, #0x34]
	b _08098DC6
	.align 2, 0
_08098C9C: .4byte 0x08B857F8
_08098CA0:
	ldr r0, _08098CD8 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08098CDC
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x30
	ldrb r3, [r1]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	bne _08098CC6
	b _08098DC6
_08098CC6:
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
	movs r0, #1
	strh r0, [r4, #0x34]
	b _08098DC6
	.align 2, 0
_08098CD8: .4byte 0x08B857F8
_08098CDC:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08098D48
	ldr r0, [r4, #0x2c]
	adds r6, r4, #0
	adds r6, #0x30
	ldrb r2, [r6]
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r5, [r0]
	adds r0, r5, #0
	bl GetItemSellPrice
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08098D0E
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _08098D24
_08098D0E:
	ldrb r6, [r6]
	lsls r1, r6, #4
	adds r1, #0x48
	ldr r2, _08098D20 @ =0x0000073A
	movs r0, #0x10
	adds r3, r4, #0
	bl StartPrepErrorHelpbox
	b _08098DC6
	.align 2, 0
_08098D20: .4byte 0x0000073A
_08098D24:
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	ldr r0, _08098D40 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08098DC6
	ldr r0, _08098D44 @ =0x0000038A
	bl m4aSongNumStart
	b _08098DC6
	.align 2, 0
_08098D40: .4byte 0x0202BBF8
_08098D44: .4byte 0x0000038A
_08098D48:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08098D74
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	ldr r0, _08098D6C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08098DC6
	ldr r0, _08098D70 @ =0x0000038B
	bl m4aSongNumStart
	b _08098DC6
	.align 2, 0
_08098D6C: .4byte 0x0202BBF8
_08098D70: .4byte 0x0000038B
_08098D74:
	adds r0, r4, #0
	bl sub_08098B7C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08098DC6
	adds r5, r4, #0
	adds r5, #0x30
	ldrb r0, [r5]
	lsls r1, r0, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #3
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
	ldr r0, [r4, #0x2c]
	ldrb r2, [r5]
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl WmSell_DrawItemGoldValue
	ldrh r0, [r4, #0x34]
	cmp r0, #1
	bne _08098DC6
	ldr r0, [r4, #0x2c]
	ldrb r3, [r5]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _08098DC6
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
_08098DC6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_08098DCC
sub_08098DCC: @ 0x08098DCC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x31
	movs r0, #1
	strb r0, [r5]
	ldr r0, _08098E14 @ =sub_0809871C
	adds r1, r4, #0
	bl StartParallelWorker
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r2, r0, #4
	adds r2, #0x48
	movs r0, #0
	movs r1, #0x10
	movs r3, #2
	bl SetUiCursorHandConfig
	ldrb r5, [r5]
	lsls r0, r5, #5
	adds r0, #0xa4
	movs r3, #0x80
	lsls r3, r3, #3
	movs r1, #0x7c
	movs r2, #0
	bl ShowSysHandCursor
	movs r0, #1
	adds r1, r4, #0
	bl sub_080985D4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08098E14: .4byte sub_0809871C

	thumb_func_start sub_08098E18
sub_08098E18: @ 0x08098E18
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	adds r5, r4, #0
	adds r5, #0x30
	ldrb r2, [r5]
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemSellPrice
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl AddGold
	ldr r0, [r4, #0x2c]
	ldrb r2, [r5]
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	ldr r0, [r4, #0x2c]
	bl UnitRemoveInvalidItems
	ldr r0, _08098E84 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08098E5E
	movs r0, #0xb9
	bl m4aSongNumStart
_08098E5E:
	bl sub_08098868
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	cmp r0, #0
	bne _08098E90
	ldr r0, _08098E88 @ =0x02022EA4
	ldr r1, _08098E8C @ =0x02012B78
	ldr r2, [r4, #0x2c]
	movs r3, #0
	bl DrawPrepScreenItems
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _08098EA2
	.align 2, 0
_08098E84: .4byte 0x0202BBF8
_08098E88: .4byte 0x02022EA4
_08098E8C: .4byte 0x02012B78
_08098E90:
	ldrb r1, [r5]
	cmp r0, r1
	bne _08098E9A
	subs r0, #1
	strb r0, [r5]
_08098E9A:
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_08098EA2:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08098EA8
sub_08098EA8: @ 0x08098EA8
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	adds r4, r2, #0
	adds r4, #0x31
	ldrb r5, [r4]
	ldr r6, _08098ECC @ =0x08B857F8
	ldr r1, [r6]
	ldrh r3, [r1, #8]
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _08098ED0
	cmp r5, #0
	bne _08098EDC
	adds r0, r2, #0
	bl sub_08098E18
	b _08098F46
	.align 2, 0
_08098ECC: .4byte 0x08B857F8
_08098ED0:
	movs r0, #2
	ands r0, r3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _08098F00
_08098EDC:
	adds r0, r2, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _08098EF8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08098F46
	ldr r0, _08098EFC @ =0x0000038B
	bl m4aSongNumStart
	b _08098F46
	.align 2, 0
_08098EF8: .4byte 0x0202BBF8
_08098EFC: .4byte 0x0000038B
_08098F00:
	movs r0, #0x20
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _08098F0C
	strb r3, [r4]
_08098F0C:
	ldr r1, [r6]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _08098F1C
	movs r0, #1
	strb r0, [r4]
_08098F1C:
	ldrb r0, [r4]
	cmp r5, r0
	beq _08098F46
	ldr r0, _08098F4C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08098F34
	ldr r0, _08098F50 @ =0x00000387
	bl m4aSongNumStart
_08098F34:
	ldrb r4, [r4]
	lsls r0, r4, #5
	adds r0, #0xa4
	movs r3, #0x80
	lsls r3, r3, #3
	movs r1, #0x7c
	movs r2, #0
	bl ShowSysHandCursor
_08098F46:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08098F4C: .4byte 0x0202BBF8
_08098F50: .4byte 0x00000387

	thumb_func_start sub_08098F54
sub_08098F54: @ 0x08098F54
	push {lr}
	bl sub_080A9D08
	bl EndMuralBackground_
	movs r0, #0
	bl EndFaceById
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08098F70
sub_08098F70: @ 0x08098F70
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08098F84 @ =0x08CC4EC0
	bl SpawnProcLocking
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08098F84: .4byte 0x08CC4EC0

	thumb_func_start sub_08098F88
sub_08098F88: @ 0x08098F88
	push {lr}
	sub sp, #0x10
	ldr r0, [r0, #0x2c]
	str r0, [sp]
	ldr r0, _08098FB8 @ =0x06011000
	str r0, [sp, #4]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0xa
	movs r1, #7
	movs r2, #0x11
	movs r3, #4
	bl StartCgText
	movs r0, #0x7c
	bl SetCgFlags
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_08098FB8: .4byte 0x06011000

	thumb_func_start sub_08098FBC
sub_08098FBC: @ 0x08098FBC
	bx lr
	.align 2, 0

	thumb_func_start sub_08098FC0
sub_08098FC0: @ 0x08098FC0
	bx lr
	.align 2, 0

	thumb_func_start sub_08098FC4
sub_08098FC4: @ 0x08098FC4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r3, r5, #0
	adds r3, #0x29
	ldrb r4, [r3]
	ldr r2, _08099054 @ =0x08B857F8
	ldr r1, [r2]
	movs r0, #0x20
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _08098FE8
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _08098FE8
	subs r0, r4, #1
	strb r0, [r3]
_08098FE8:
	ldr r1, [r2]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	adds r3, r5, #0
	adds r3, #0x29
	cmp r0, #0
	beq _08099006
	ldrb r1, [r3]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08099006
	adds r0, r1, #1
	strb r0, [r3]
_08099006:
	ldr r1, [r2]
	movs r0, #0x80
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0809901E
	ldrb r1, [r3]
	lsrs r0, r1, #1
	cmp r0, #0
	bne _0809901E
	adds r0, r1, #2
	strb r0, [r3]
_0809901E:
	ldr r1, [r2]
	movs r0, #0x40
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _08099036
	ldrb r1, [r3]
	lsrs r0, r1, #1
	cmp r0, #0
	beq _08099036
	subs r0, r1, #2
	strb r0, [r3]
_08099036:
	ldrb r3, [r3]
	cmp r4, r3
	beq _08099060
	ldr r0, _08099058 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809904E
	ldr r0, _0809905C @ =0x00000385
	bl m4aSongNumStart
_0809904E:
	movs r0, #1
	b _08099062
	.align 2, 0
_08099054: .4byte 0x08B857F8
_08099058: .4byte 0x0202BBF8
_0809905C: .4byte 0x00000385
_08099060:
	movs r0, #0
_08099062:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_08099068
sub_08099068: @ 0x08099068
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _0809909C @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r6, #1
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080990FC
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, #7
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _080990E0
	cmp r1, #1
	beq _080990BC
	cmp r1, #1
	bgt _080990A0
	cmp r1, #0
	beq _080990AA
	b _080990E0
	.align 2, 0
_0809909C: .4byte 0x08B857F8
_080990A0:
	cmp r1, #2
	beq _080990B0
	cmp r1, #3
	beq _080990B6
	b _080990E0
_080990AA:
	adds r0, r4, #0
	movs r1, #2
	b _080990C0
_080990B0:
	adds r0, r4, #0
	movs r1, #3
	b _080990C0
_080990B6:
	adds r0, r4, #0
	movs r1, #4
	b _080990C0
_080990BC:
	adds r0, r4, #0
	movs r1, #5
_080990C0:
	bl Proc_Goto
	ldr r0, _080990D8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099168
	ldr r0, _080990DC @ =0x0000038A
	bl m4aSongNumStart
	b _08099168
	.align 2, 0
_080990D8: .4byte 0x0202BBF8
_080990DC: .4byte 0x0000038A
_080990E0:
	ldr r0, _080990F8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099168
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _08099168
	.align 2, 0
_080990F8: .4byte 0x0202BBF8
_080990FC:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08099128
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	ldr r0, _08099120 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099168
	ldr r0, _08099124 @ =0x0000038B
	bl m4aSongNumStart
	b _08099168
	.align 2, 0
_08099120: .4byte 0x0202BBF8
_08099124: .4byte 0x0000038B
_08099128:
	adds r0, r4, #0
	bl sub_08098FC4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08099168
	adds r5, r4, #0
	adds r5, #0x29
	ldrb r1, [r5]
	adds r2, r6, #0
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x1c
	lsrs r1, r1, #1
	lsls r1, r1, #4
	adds r1, #0x50
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #8
	bl ShowSysHandCursor
	ldr r1, _08099170 @ =0x08CC50C0
	ldrb r5, [r5]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	bl sub_08098F88
_08099168:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08099170: .4byte 0x08CC50C0

	thumb_func_start sub_08099174
sub_08099174: @ 0x08099174
	push {r4, lr}
	adds r4, r0, #0
	bl EndCgText
	adds r0, r4, #0
	bl EndAllProcChildren
	bl EndMuralBackground_
	movs r0, #0
	bl EndFaceById
	movs r0, #0
	bl SetOnHBlankA
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08099198
sub_08099198: @ 0x08099198
	push {lr}
	adds r1, r0, #0
	adds r1, #0x29
	ldrb r1, [r1]
	cmp r1, #1
	beq _080991D0
	cmp r1, #1
	bgt _080991AE
	cmp r1, #0
	beq _080991B8
	b _080991D6
_080991AE:
	cmp r1, #2
	beq _080991C0
	cmp r1, #3
	beq _080991C8
	b _080991D6
_080991B8:
	movs r1, #2
	bl Proc_Goto
	b _080991D6
_080991C0:
	movs r1, #3
	bl Proc_Goto
	b _080991D6
_080991C8:
	movs r1, #4
	bl Proc_Goto
	b _080991D6
_080991D0:
	movs r1, #5
	bl Proc_Goto
_080991D6:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartFortuneSubMenu
StartFortuneSubMenu: @ 0x080991DC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080991F4 @ =0x08CC4FE0
	bl SpawnProcLocking
	adds r1, r0, #0
	adds r0, #0x29
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080991F4: .4byte 0x08CC4FE0

	thumb_func_start sub_080991F8
sub_080991F8: @ 0x080991F8
	push {lr}
	adds r1, r0, #0
	cmp r1, #1
	beq _08099224
	cmp r1, #1
	bgt _0809920A
	cmp r1, #0
	beq _08099230
	b _08099238
_0809920A:
	cmp r1, #2
	beq _08099214
	cmp r1, #3
	beq _0809921A
	b _08099238
_08099214:
	bl sub_080992F4
	b _0809921E
_0809921A:
	bl sub_08099330
_0809921E:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0809923A
_08099224:
	ldr r0, _08099234 @ =0x0202BBF8
	adds r0, #0x2b
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _08099238
_08099230:
	movs r0, #1
	b _0809923A
	.align 2, 0
_08099234: .4byte 0x0202BBF8
_08099238:
	movs r0, #0
_0809923A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetChapterDivinationTextIdHectorStory
GetChapterDivinationTextIdHectorStory: @ 0x08099240
	push {r4, lr}
	ldr r4, _08099264 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r4, [r4, #0x1b]
	cmp r4, #3
	bne _08099256
	movs r1, #2
_08099256:
	adds r0, #0x7c
	adds r0, r0, r1
	ldrh r0, [r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08099264: .4byte 0x0202BBF8

	thumb_func_start GetChapterDivinationTextIdBeginning
GetChapterDivinationTextIdBeginning: @ 0x08099268
	push {lr}
	ldr r0, _08099280 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x7a
	ldrh r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_08099280: .4byte 0x0202BBF8

	thumb_func_start sub_08099284
sub_08099284: @ 0x08099284
	push {lr}
	ldr r0, _0809929C @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x80
	ldrh r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_0809929C: .4byte 0x0202BBF8

	thumb_func_start sub_080992A0
sub_080992A0: @ 0x080992A0
	push {lr}
	ldr r0, _080992B8 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x83
	ldrb r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_080992B8: .4byte 0x0202BBF8

	thumb_func_start GetChapterDivinationPortrait
GetChapterDivinationPortrait: @ 0x080992BC
	push {lr}
	ldr r0, _080992D4 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x82
	ldrb r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_080992D4: .4byte 0x0202BBF8

	thumb_func_start sub_080992D8
sub_080992D8: @ 0x080992D8
	push {lr}
	bl GetChapterDivinationTextIdHectorStory
	cmp r0, #0
	beq _080992EE
	bl GetChapterDivinationTextIdBeginning
	cmp r0, #0
	bne _080992EE
	movs r0, #1
	b _080992F0
_080992EE:
	movs r0, #0
_080992F0:
	pop {r1}
	bx r1

	thumb_func_start sub_080992F4
sub_080992F4: @ 0x080992F4
	push {lr}
	ldr r1, _08099310 @ =0x0202BBF8
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _0809930A
	bl GetChapterDivinationTextIdHectorStory
	cmp r0, #0
	bne _08099314
_0809930A:
	movs r0, #0
	b _08099316
	.align 2, 0
_08099310: .4byte 0x0202BBF8
_08099314:
	movs r0, #1
_08099316:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0809931C
sub_0809931C: @ 0x0809931C
	push {lr}
	bl GetChapterDivinationPortrait
	cmp r0, #0x41
	beq _0809932A
	movs r0, #0
	b _0809932C
_0809932A:
	movs r0, #1
_0809932C:
	pop {r1}
	bx r1

	thumb_func_start sub_08099330
sub_08099330: @ 0x08099330
	push {lr}
	bl sub_0809931C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08099340
sub_08099340: @ 0x08099340
	ldr r0, _08099350 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x12
	bgt _08099354
	movs r0, #0
	b _08099356
	.align 2, 0
_08099350: .4byte 0x0202BBF8
_08099354:
	movs r0, #1
_08099356:
	bx lr

	thumb_func_start sub_08099358
sub_08099358: @ 0x08099358
	push {r4, lr}
	ldr r4, _080993FC @ =0x03002870
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r4]
	ands r0, r1
	strb r0, [r4]
	movs r0, #0
	bl InitBgs
	movs r0, #0
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r4, #0xc]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r4, #0xc]
	movs r2, #3
	ldrb r0, [r4, #0x10]
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r4, #0x14]
	ldrb r1, [r4, #0x18]
	orrs r2, r1
	strb r2, [r4, #0x18]
	bl InitFaces
	bl ResetText
	bl InitIcons
	bl LoadUiFrameGraphics
	bl ApplySystemObjectsGraphics
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #4
	bl SetBgOffset
	movs r0, #4
	bl ApplyIconPalettes
	bl PrepRestartMuralBackground
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080993FC: .4byte 0x03002870

	thumb_func_start sub_08099400
sub_08099400: @ 0x08099400
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bx lr

	thumb_func_start sub_08099408
sub_08099408: @ 0x08099408
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	movs r0, #3
	ldrh r1, [r4]
	ands r0, r1
	cmp r0, #0
	bne _0809944E
	movs r0, #0
	ldrsh r4, [r4, r0]
	cmp r4, #0
	bge _0809942A
	adds r4, #3
_0809942A:
	asrs r4, r4, #2
	lsls r0, r4, #5
	ldr r1, _08099454 @ =0x0840E978
	adds r0, r0, r1
	ldr r1, [r5, #0x58]
	lsls r1, r1, #5
	ldr r2, _08099458 @ =0x02022A60
	adds r1, r1, r2
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	cmp r4, #5
	bne _0809944E
	adds r0, r5, #0
	bl Proc_Break
_0809944E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08099454: .4byte 0x0840E978
_08099458: .4byte 0x02022A60

	thumb_func_start sub_0809945C
sub_0809945C: @ 0x0809945C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08099470 @ =0x08CC5114
	bl SpawnProc
	str r4, [r0, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08099470: .4byte 0x08CC5114

	thumb_func_start sub_08099474
sub_08099474: @ 0x08099474
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sb, r0
	ldr r1, [r0, #0x2c]
	asrs r0, r1, #3
	cmp r0, #5
	bgt _0809949C
	adds r0, r1, #2
	mov r1, sb
	str r0, [r1, #0x2c]
	asrs r0, r0, #3
	cmp r0, #6
	bne _0809949C
	movs r0, #0xf
	bl sub_0809945C
_0809949C:
	mov r6, sb
	adds r6, #0x34
	movs r2, #9
	str r2, [sp, #8]
	movs r3, #4
	mov r8, r3
_080994A8:
	ldrb r0, [r6]
	cmp r0, #0xff
	beq _080994FE
	movs r5, #0
	ldrb r7, [r6]
	cmp r5, r7
	bgt _080994FE
	mov r1, sb
	ldr r0, [r1, #0x2c]
	asrs r0, r0, #3
	cmp r5, r0
	bge _080994FE
	movs r4, #0x50
	ldr r2, _0809959C @ =0x08CC5100
	mov sl, r2
_080994C6:
	lsls r1, r5, #9
	adds r1, r4, r1
	mov r3, sl
	adds r3, #4
	mov sl, r3
	subs r3, #4
	ldr r3, [r3]
	mov ip, r3
	ldr r0, _080995A0 @ =0x0000F380
	str r0, [sp]
	movs r0, #4
	ldr r7, [sp, #8]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r2, r7, r3
	mov r3, ip
	bl PutSpriteExt
	adds r4, #0xf
	adds r5, #1
	ldrb r7, [r6]
	cmp r5, r7
	bgt _080994FE
	mov r1, sb
	ldr r0, [r1, #0x2c]
	asrs r0, r0, #3
	cmp r5, r0
	blt _080994C6
_080994FE:
	adds r6, #1
	ldr r2, [sp, #8]
	adds r2, #0x10
	str r2, [sp, #8]
	movs r3, #1
	rsbs r3, r3, #0
	add r8, r3
	mov r7, r8
	cmp r7, #0
	bge _080994A8
	movs r0, #0
	mov r8, r0
	movs r7, #0x80
	lsls r7, r7, #1
	ldr r1, _080995A4 @ =0x080C5A48
	mov sl, r1
_0809951E:
	mov r2, r8
	adds r2, #1
	lsls r1, r2, #3
	mov r3, sb
	ldr r0, [r3, #0x2c]
	subs r0, r0, r1
	lsls r4, r0, #5
	str r2, [sp, #4]
	cmp r4, r7
	ble _08099536
	movs r4, #0x80
	lsls r4, r4, #1
_08099536:
	cmp r4, #0x20
	ble _080995AC
	ldr r1, _080995A8 @ =0x080C5AC8
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	mov r3, sl
	movs r1, #0
	ldrsh r0, [r3, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r2, sl
	movs r3, #0
	ldrsh r0, [r2, r3]
	lsls r0, r0, #4
	adds r1, r4, #0
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r1, _080995A8 @ =0x080C5AC8
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	mov r0, r8
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	b _0809960A
	.align 2, 0
_0809959C: .4byte 0x08CC5100
_080995A0: .4byte 0x0000F380
_080995A4: .4byte 0x080C5A48
_080995A8: .4byte 0x080C5AC8
_080995AC:
	ldr r3, _08099624 @ =0x080C5AC8
	movs r1, #0
	ldrsh r0, [r3, r1]
	lsls r0, r0, #4
	movs r1, #0x20
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	mov r2, sl
	movs r3, #0
	ldrsh r0, [r2, r3]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r1, sl
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	movs r1, #0x20
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r3, _08099624 @ =0x080C5AC8
	movs r1, #0
	ldrsh r0, [r3, r1]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	mov r0, r8
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
_0809960A:
	ldr r2, [sp, #4]
	mov r8, r2
	cmp r2, #4
	ble _0809951E
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08099624: .4byte 0x080C5AC8

	thumb_func_start sub_08099628
sub_08099628: @ 0x08099628
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r4, _08099678 @ =0x020129A8
	movs r0, #0
	bl SetTextFontGlyphs
	movs r0, #0
	bl SetTextFont
	movs r6, #0
	movs r5, #0x80
	ldr r7, _0809967C @ =0x08CC50C0
_08099640:
	adds r0, r4, #0
	bl ClearText
	ldm r7!, {r0}
	bl GetMsg
	adds r3, r4, #0
	adds r4, #8
	ldr r1, _08099680 @ =0x02023C68
	adds r1, r5, r1
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r3, #0
	movs r3, #0
	bl PutDrawText
	adds r5, #0x80
	adds r6, #1
	cmp r6, #4
	ble _08099640
	movs r0, #4
	bl EnableBgSync
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08099678: .4byte 0x020129A8
_0809967C: .4byte 0x08CC50C0
_08099680: .4byte 0x02023C68

	thumb_func_start sub_08099684
sub_08099684: @ 0x08099684
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	bl GetGameTacticsRank
	adds r5, r7, #0
	adds r5, #0x34
	movs r6, #0
	strb r0, [r5]
	bl GetGameSurvivalRank
	movs r1, #0x35
	adds r1, r1, r7
	mov sl, r1
	strb r0, [r1]
	bl GetGameFundsRank
	movs r2, #0x36
	adds r2, r2, r7
	mov sb, r2
	strb r0, [r2]
	bl GetGameExpRank
	movs r3, #0x37
	adds r3, r3, r7
	mov r8, r3
	strb r0, [r3]
	bl GetGameCombatRank
	adds r4, r7, #0
	adds r4, #0x38
	strb r0, [r4]
	ldrb r0, [r5]
	mov r5, sl
	ldrb r1, [r5]
	mov r3, sb
	ldrb r2, [r3]
	mov r5, r8
	ldrb r3, [r5]
	ldrb r4, [r4]
	str r4, [sp]
	bl GetOverallRank
	adds r1, r7, #0
	adds r1, #0x39
	strb r0, [r1]
	str r6, [r7, #0x2c]
	ldr r0, _08099718 @ =0x0840E830
	ldr r1, _0809971C @ =0x06017000
	bl Decompress
	ldr r0, _08099720 @ =0x0840E978
	movs r1, #0xf8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08099724 @ =sub_08099474
	adds r1, r7, #0
	bl StartParallelWorker
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08099718: .4byte 0x0840E830
_0809971C: .4byte 0x06017000
_08099720: .4byte 0x0840E978
_08099724: .4byte sub_08099474

	thumb_func_start sub_08099728
sub_08099728: @ 0x08099728
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	bl sub_08099358
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_08091944
	ldr r0, _08099824 @ =0x02023460
	ldr r1, _08099828 @ =0x0840EA38
	movs r2, #0xa5
	lsls r2, r2, #7
	bl sub_080AACD8
	movs r0, #7
	bl EnableBgSync
	adds r0, r4, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	ldr r0, _0809982C @ =0x03002870
	mov ip, r0
	movs r0, #0x21
	rsbs r0, r0, #0
	mov r1, ip
	ldrb r1, [r1, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, ip
	strb r0, [r2, #1]
	mov r1, ip
	adds r1, #0x2d
	movs r0, #0x80
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xe0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	mov r6, ip
	adds r6, #0x34
	movs r0, #1
	ldrb r1, [r6]
	orrs r1, r0
	movs r5, #2
	orrs r1, r5
	movs r2, #4
	orrs r1, r2
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	mov r7, ip
	adds r7, #0x36
	ldrb r2, [r7]
	orrs r0, r2
	orrs r0, r5
	movs r2, #5
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	movs r2, #0x20
	orrs r1, r2
	strb r1, [r6]
	orrs r0, r2
	strb r0, [r7]
	mov r1, ip
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x44
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r5, _08099830 @ =0x020129A8
	movs r4, #5
_080997EC:
	adds r0, r5, #0
	movs r1, #8
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _080997EC
	ldr r0, _08099834 @ =0x02012A90
	movs r1, #8
	bl InitText
	bl sub_08099628
	ldr r0, _08099838 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _0809983C
	movs r3, #0x81
	lsls r3, r3, #1
	movs r0, #0
	str r0, [sp]
	movs r0, #0x29
	movs r1, #0xd8
	movs r2, #0x58
	bl StartTalkFace
	b _0809984E
	.align 2, 0
_08099824: .4byte 0x02023460
_08099828: .4byte 0x0840EA38
_0809982C: .4byte 0x03002870
_08099830: .4byte 0x020129A8
_08099834: .4byte 0x02012A90
_08099838: .4byte 0x0202BBF8
_0809983C:
	movs r3, #0x81
	lsls r3, r3, #1
	movs r0, #0
	str r0, [sp]
	movs r0, #0x32
	movs r1, #0xd8
	movs r2, #0x58
	bl StartTalkFace
_0809984E:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08099858
sub_08099858: @ 0x08099858
	adds r2, r0, #0
	ldr r3, _08099878 @ =0x0202BBF8
	adds r1, r3, #0
	adds r1, #0x2b
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0809988C
	ldrb r3, [r3, #0x1b]
	cmp r3, #3
	bne _08099880
	adds r1, r2, #0
	adds r1, #0x39
	ldr r0, _0809987C @ =0x00000F97
	b _080998A6
	.align 2, 0
_08099878: .4byte 0x0202BBF8
_0809987C: .4byte 0x00000F97
_08099880:
	adds r1, r2, #0
	adds r1, #0x39
	ldr r0, _08099888 @ =0x00000F8B
	b _080998A6
	.align 2, 0
_08099888: .4byte 0x00000F8B
_0809988C:
	ldrb r3, [r3, #0x1b]
	cmp r3, #3
	bne _080998A0
	adds r1, r2, #0
	adds r1, #0x39
	ldr r0, _0809989C @ =0x00000F9D
	b _080998A6
	.align 2, 0
_0809989C: .4byte 0x00000F9D
_080998A0:
	adds r1, r2, #0
	adds r1, #0x39
	ldr r0, _080998B0 @ =0x00000F91
_080998A6:
	ldrb r1, [r1]
	subs r0, r0, r1
	str r0, [r2, #0x30]
	bx lr
	.align 2, 0
_080998B0: .4byte 0x00000F91

	thumb_func_start sub_080998B4
sub_080998B4: @ 0x080998B4
	push {r4, lr}
	adds r4, r0, #0
	bl EndCgText
	adds r0, r4, #0
	bl EndAllProcChildren
	bl EndMuralBackground_
	movs r0, #0
	bl EndFaceById
	movs r0, #0
	bl SetOnHBlankA
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080998D8
sub_080998D8: @ 0x080998D8
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08088A90
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080998EE
	adds r0, r4, #0
	bl Proc_Break
	b _08099916
_080998EE:
	ldr r0, _0809991C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08099916
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	ldr r0, _08099920 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099916
	ldr r0, _08099924 @ =0x0000038B
	bl m4aSongNumStart
_08099916:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809991C: .4byte 0x08B857F8
_08099920: .4byte 0x0202BBF8
_08099924: .4byte 0x0000038B

	thumb_func_start sub_08099928
sub_08099928: @ 0x08099928
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #0x28
	movs r1, #0
	movs r2, #1
	bl InitTalk
	ldr r0, [r4, #0x30]
	str r0, [sp]
	ldr r0, _08099964 @ =0x06011000
	str r0, [sp, #4]
	movs r0, #0xa
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x13
	movs r2, #0x12
	movs r3, #4
	bl StartCgText
	movs r0, #0x4e
	bl SetCgFlags
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08099964: .4byte 0x06011000

	thumb_func_start sub_08099968
sub_08099968: @ 0x08099968
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	beq _08099A2A
	movs r0, #0
	mov r8, r0
	movs r1, #0x34
	adds r1, r1, r7
	mov sb, r1
	adds r2, r7, #0
	adds r2, #0x3e
	str r2, [sp, #4]
_0809998E:
	mov r3, sb
	add r3, r8
	ldrb r0, [r3]
	movs r4, #1
	add r4, r8
	mov sl, r4
	cmp r0, #0xff
	beq _080999F0
	adds r0, r7, #0
	adds r0, #0x52
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r2, r0, #0
	adds r2, #0x34
	ldr r0, _08099A3C @ =0x000001FF
	ands r2, r0
	adds r0, r7, #0
	adds r0, #0x54
	movs r4, #0
	ldrsh r1, [r0, r4]
	mov r4, r8
	lsls r0, r4, #4
	adds r0, #0x19
	adds r6, r1, r0
	movs r0, #0xff
	ands r6, r0
	movs r5, #0
	ldrb r3, [r3]
	cmp r5, r3
	bgt _080999F0
	adds r4, r2, #0
_080999CC:
	lsls r0, r5, #2
	ldr r1, _08099A40 @ =0x08CC5100
	adds r0, r0, r1
	ldr r3, [r0]
	ldr r0, _08099A44 @ =0x0000F380
	str r0, [sp]
	movs r0, #0xd
	adds r1, r4, #0
	adds r2, r6, #0
	bl PutSpriteExt
	adds r4, #0xa
	adds r5, #1
	mov r0, sb
	add r0, r8
	ldrb r0, [r0]
	cmp r5, r0
	ble _080999CC
_080999F0:
	mov r8, sl
	mov r0, r8
	cmp r0, #4
	ble _0809998E
	ldr r1, [sp, #4]
	ldrb r0, [r1]
	cmp r0, #0
	beq _08099A2A
	adds r0, r7, #0
	adds r0, #0x52
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r1, #0xc0
	ldr r0, _08099A3C @ =0x000001FF
	ands r1, r0
	adds r0, r7, #0
	adds r0, #0x54
	movs r3, #0
	ldrsh r2, [r0, r3]
	adds r2, #0x1c
	movs r0, #0xff
	ands r2, r0
	ldr r0, _08099A40 @ =0x08CC5100
	ldr r3, [r0]
	ldr r0, _08099A44 @ =0x0000F380
	str r0, [sp]
	movs r0, #0xd
	bl PutSpriteExt
_08099A2A:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08099A3C: .4byte 0x000001FF
_08099A40: .4byte 0x08CC5100
_08099A44: .4byte 0x0000F380

	thumb_func_start sub_08099A48
sub_08099A48: @ 0x08099A48
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r2, #0
	mov r1, sp
	ldr r0, _08099A6C @ =0x0840F410
	ldm r0!, {r3, r5, r6}
	stm r1!, {r3, r5, r6}
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #0
	beq _08099A70
	movs r2, #1
	b _08099A90
	.align 2, 0
_08099A6C: .4byte 0x0840F410
_08099A70:
	adds r0, r4, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #1
	beq _08099A90
	cmp r0, #1
	bgt _08099A84
	cmp r0, #0
	beq _08099A8A
	b _08099A90
_08099A84:
	cmp r0, #2
	beq _08099A8E
	b _08099A90
_08099A8A:
	movs r2, #3
	b _08099A90
_08099A8E:
	movs r2, #2
_08099A90:
	lsls r0, r2, #2
	add r0, sp
	ldr r0, [r0]
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r0, r4, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	bne _08099AB8
	movs r0, #0x20
	bl ArchivePalette
	movs r0, #0xc0
	movs r1, #0xc0
	movs r2, #0xc0
	bl SetPalFadeStClkEnd
_08099AB8:
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_08099AC0
sub_08099AC0: @ 0x08099AC0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0x3c
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0x14
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #8
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	movs r2, #0
	ldr r6, _08099B54 @ =0x0840E830
	adds r3, r4, #0
	adds r3, #0x34
	movs r5, #0xff
_08099AEC:
	adds r1, r3, r2
	ldrb r0, [r1]
	orrs r0, r5
	strb r0, [r1]
	adds r2, #1
	cmp r2, #4
	ble _08099AEC
	movs r0, #0
	str r0, [r4, #0x2c]
	ldr r1, _08099B58 @ =0x06017000
	adds r0, r6, #0
	bl Decompress
	ldr r0, _08099B5C @ =0x0840E978
	movs r1, #0xf8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r2, _08099B60 @ =0x0202BBF8
	adds r2, #0x40
	movs r0, #0x61
	rsbs r0, r0, #0
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08099B64 @ =sub_08099968
	adds r1, r4, #0
	bl StartParallelWorker
	adds r0, r4, #0
	bl StartGreenText
	ldr r2, _08099B68 @ =0x03002870
	adds r3, r2, #0
	adds r3, #0x3c
	movs r1, #0x21
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r4, [r3]
	ands r0, r4
	strb r0, [r3]
	adds r2, #0x3d
	ldrb r0, [r2]
	ands r1, r0
	strb r1, [r2]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08099B54: .4byte 0x0840E830
_08099B58: .4byte 0x06017000
_08099B5C: .4byte 0x0840E978
_08099B60: .4byte 0x0202BBF8
_08099B64: .4byte sub_08099968
_08099B68: .4byte 0x03002870

	thumb_func_start sub_08099B6C
sub_08099B6C: @ 0x08099B6C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r2, #0
	adds r6, r3, #0
	ldr r2, [sp, #0x14]
	cmp r2, #0
	ble _08099B98
	lsls r0, r1, #5
	adds r0, r4, r0
	ldr r1, _08099BA0 @ =0x02023C60
	adds r5, r2, #0
	lsls r0, r0, #1
	adds r4, r0, r1
_08099B86:
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r6, #0
	bl PutSpecialChar
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bne _08099B86
_08099B98:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08099BA0: .4byte 0x02023C60

	thumb_func_start sub_08099BA4
sub_08099BA4: @ 0x08099BA4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r7, r0, #0
	bl ResetText
	ldr r4, _08099D44 @ =0x02023C60
	adds r0, r4, #0
	movs r1, #0
	bl TmFill
	movs r0, #0
	bl SetTextFontGlyphs
	movs r0, #0
	bl SetTextFont
	adds r0, r7, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	bne _08099BD8
	b _08099E10
_08099BD8:
	ldr r1, _08099D48 @ =0x08CC51C4
	adds r0, r7, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl GetMsg
	adds r1, r4, #0
	adds r1, #0x42
	movs r2, #0xc
	str r2, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	movs r0, #0x40
	adds r0, r0, r7
	mov sb, r0
	adds r1, r7, #0
	adds r1, #0x41
	str r1, [sp, #0x14]
	adds r2, r7, #0
	adds r2, #0x42
	str r2, [sp, #0x18]
	adds r3, r7, #0
	adds r3, #0x39
	str r3, [sp, #0xc]
	movs r6, #0x3d
	adds r6, r6, r7
	mov sl, r6
	adds r0, r7, #0
	adds r0, #0x4e
	str r0, [sp, #8]
	subs r1, #3
	str r1, [sp, #0x10]
	movs r4, #0x80
	lsls r4, r4, #1
	ldr r2, _08099D4C @ =0x08CC50C0
	mov r8, r2
	movs r6, #4
_08099C30:
	mov r3, r8
	adds r3, #4
	mov r8, r3
	subs r3, #4
	ldm r3!, {r0}
	bl GetMsg
	ldr r5, _08099D50 @ =0x02023C64
	adds r1, r4, r5
	movs r2, #5
	str r2, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	adds r4, #0x80
	subs r6, #1
	cmp r6, #0
	bge _08099C30
	movs r6, #5
	ldr r0, _08099D54 @ =0x000012C4
	bl GetMsg
	movs r2, #0xef
	lsls r2, r2, #1
	adds r1, r5, r2
	movs r4, #4
	str r4, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	movs r3, #0xf9
	lsls r3, r3, #1
	adds r0, r5, r3
	ldr r2, [r7, #0x58]
	movs r1, #2
	bl PutNumber
	movs r1, #0xfa
	lsls r1, r1, #1
	adds r0, r5, r1
	movs r1, #3
	movs r2, #0x1e
	bl PutSpecialChar
	ldr r0, _08099D58 @ =0x000012C5
	bl GetMsg
	ldr r2, _08099D5C @ =0x0000025E
	adds r1, r5, r2
	str r4, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	ldr r3, _08099D60 @ =0x0000026A
	adds r0, r5, r3
	movs r1, #0
	movs r2, #0x20
	bl PutSpecialChar
	movs r1, #0x9c
	lsls r1, r1, #2
	adds r0, r5, r1
	movs r1, #0
	movs r2, #0x20
	bl PutSpecialChar
	movs r2, #0x9a
	lsls r2, r2, #2
	adds r0, r5, r2
	mov r3, sb
	ldrb r2, [r3]
	movs r1, #2
	bl PutNumber
	ldr r1, _08099D64 @ =0x0000026E
	adds r0, r5, r1
	ldr r3, [sp, #0x14]
	ldrb r2, [r3]
	movs r1, #2
	bl sub_080063CC
	movs r1, #0x9d
	lsls r1, r1, #2
	adds r0, r5, r1
	ldr r3, [sp, #0x18]
	ldrb r2, [r3]
	movs r1, #2
	bl sub_080063CC
	ldr r0, _08099D68 @ =0x000012C6
	bl GetMsg
	adds r1, r5, #0
	adds r1, #0x50
	str r6, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	adds r0, r5, #0
	adds r0, #0x58
	ldr r2, _08099D6C @ =0x08CC51AC
	ldr r6, [sp, #0xc]
	ldrb r6, [r6]
	lsls r1, r6, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #4
	bl PutSpecialChar
	mov r1, sl
	ldrb r0, [r1]
	cmp r0, #0
	bne _08099D74
	ldr r0, _08099D70 @ =0x000012BA
	bl GetMsg
	adds r1, r5, #0
	adds r1, #0x5e
	str r4, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	b _08099D8C
	.align 2, 0
_08099D44: .4byte 0x02023C60
_08099D48: .4byte 0x08CC51C4
_08099D4C: .4byte 0x08CC50C0
_08099D50: .4byte 0x02023C64
_08099D54: .4byte 0x000012C4
_08099D58: .4byte 0x000012C5
_08099D5C: .4byte 0x0000025E
_08099D60: .4byte 0x0000026A
_08099D64: .4byte 0x0000026E
_08099D68: .4byte 0x000012C6
_08099D6C: .4byte 0x08CC51AC
_08099D70: .4byte 0x000012BA
_08099D74:
	ldr r0, _08099DE4 @ =0x000012BB
	bl GetMsg
	adds r1, r5, #0
	adds r1, #0x5e
	str r4, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #3
	movs r3, #4
	bl PutDrawText
_08099D8C:
	ldr r4, _08099DE8 @ =0x02023CD0
	ldr r3, [sp, #8]
	ldrb r2, [r3]
	adds r0, r4, #0
	movs r1, #2
	bl PutNumber
	ldr r0, _08099DEC @ =0x000012C8
	bl GetMsg
	adds r1, r4, #2
	movs r5, #5
	str r5, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	ldr r6, [sp, #0x10]
	ldrb r0, [r6]
	cmp r0, #0
	beq _08099DF0
	adds r1, r4, #0
	adds r1, #0xb0
	movs r0, #6
	str r0, [sp]
	adds r0, r7, #0
	adds r0, #0x43
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	adds r0, r4, #0
	adds r0, #0xc8
	adds r1, r7, #0
	adds r1, #0x3a
	ldrb r2, [r1]
	movs r1, #2
	bl PutNumber
	b _08099F86
	.align 2, 0
_08099DE4: .4byte 0x000012BB
_08099DE8: .4byte 0x02023CD0
_08099DEC: .4byte 0x000012C8
_08099DF0:
	str r5, [sp]
	movs r0, #0x11
	movs r1, #4
	movs r2, #1
	movs r3, #0x14
	bl sub_08099B6C
	movs r0, #3
	str r0, [sp]
	movs r0, #0x1a
	movs r1, #4
	movs r2, #1
	movs r3, #0x14
	bl sub_08099B6C
	b _08099F86
_08099E10:
	ldr r1, _08099F20 @ =0x08CC51C4
	adds r0, r7, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl GetMsg
	adds r1, r4, #0
	adds r1, #0x42
	movs r2, #0xc
	str r2, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	movs r6, #0
	adds r7, #0x3d
	mov sl, r7
	movs r5, #0x80
	lsls r5, r5, #1
	movs r4, #4
_08099E42:
	ldr r1, _08099F24 @ =0x08CC50C0
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl GetMsg
	ldr r7, _08099F28 @ =0x02023C64
	adds r1, r5, r7
	movs r2, #5
	mov sb, r2
	str r2, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #1
	movs r3, #0
	bl PutDrawText
	movs r3, #3
	mov r8, r3
	str r3, [sp]
	movs r0, #8
	adds r1, r4, #0
	movs r2, #1
	movs r3, #0x14
	bl sub_08099B6C
	adds r5, #0x80
	adds r4, #2
	adds r6, #1
	cmp r6, #4
	ble _08099E42
	ldr r0, _08099F2C @ =0x000012C4
	bl GetMsg
	movs r6, #0xef
	lsls r6, r6, #1
	adds r1, r7, r6
	movs r4, #4
	str r4, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #1
	movs r3, #0
	bl PutDrawText
	mov r0, r8
	str r0, [sp]
	movs r0, #0x16
	movs r1, #7
	movs r2, #1
	movs r3, #0x14
	bl sub_08099B6C
	ldr r0, _08099F30 @ =0x000012C5
	bl GetMsg
	ldr r2, _08099F34 @ =0x0000025E
	adds r1, r7, r2
	str r4, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #1
	movs r3, #0
	bl PutDrawText
	mov r3, r8
	str r3, [sp]
	movs r0, #0x16
	movs r1, #9
	movs r2, #1
	movs r3, #0x14
	bl sub_08099B6C
	ldr r0, _08099F38 @ =0x000012C6
	bl GetMsg
	adds r1, r7, #0
	adds r1, #0x50
	mov r6, sb
	str r6, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #1
	movs r3, #0
	bl PutDrawText
	movs r0, #1
	str r0, [sp]
	movs r0, #0xe
	movs r1, #1
	movs r2, #1
	movs r3, #0x14
	bl sub_08099B6C
	mov r1, sl
	ldrb r0, [r1]
	cmp r0, #0
	bne _08099F40
	ldr r0, _08099F3C @ =0x000012BA
	bl GetMsg
	adds r1, r7, #0
	adds r1, #0x5e
	str r4, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #1
	movs r3, #0
	bl PutDrawText
	b _08099F58
	.align 2, 0
_08099F20: .4byte 0x08CC51C4
_08099F24: .4byte 0x08CC50C0
_08099F28: .4byte 0x02023C64
_08099F2C: .4byte 0x000012C4
_08099F30: .4byte 0x000012C5
_08099F34: .4byte 0x0000025E
_08099F38: .4byte 0x000012C6
_08099F3C: .4byte 0x000012BA
_08099F40:
	ldr r0, _08099F9C @ =0x000012BB
	bl GetMsg
	adds r1, r7, #0
	adds r1, #0x5e
	str r4, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #1
	movs r3, #4
	bl PutDrawText
_08099F58:
	movs r4, #5
	str r4, [sp]
	movs r0, #0x17
	movs r1, #1
	movs r2, #1
	movs r3, #0x14
	bl sub_08099B6C
	str r4, [sp]
	movs r0, #0x11
	movs r1, #4
	movs r2, #1
	movs r3, #0x14
	bl sub_08099B6C
	movs r0, #3
	str r0, [sp]
	movs r0, #0x1a
	movs r1, #4
	movs r2, #1
	movs r3, #0x14
	bl sub_08099B6C
_08099F86:
	movs r0, #4
	bl EnableBgSync
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08099F9C: .4byte 0x000012BB

	thumb_func_start sub_08099FA0
sub_08099FA0: @ 0x08099FA0
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08099358
	adds r0, r4, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	adds r0, r4, #0
	bl StartUiSpinningArrows
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r0, #0
	movs r2, #2
	bl LoadUiSpinningArrowGfx
	movs r0, #3
	bl SetUiSpinningArrowConfig
	movs r0, #0
	movs r1, #0x40
	movs r2, #0xe8
	movs r3, #0x40
	bl SetUiSpinningArrowPositions
	ldr r3, _0809A020 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x34
	movs r0, #0x20
	ldrb r1, [r2]
	orrs r1, r0
	strb r1, [r2]
	adds r1, r3, #0
	adds r1, #0x36
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r1, #6
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_08091944
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809A020: .4byte 0x03002870

	thumb_func_start sub_0809A024
sub_0809A024: @ 0x0809A024
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x2c
	adds r6, r0, #0
	add r0, sp, #0x28
	movs r1, #0
	strh r1, [r0]
	ldr r2, _0809A140 @ =0x0100000C
	add r1, sp, #0x10
	bl CpuSet
	adds r0, r6, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	adds r0, #1
	ldrb r2, [r0]
	add r0, sp, #0x10
	bl sub_0809F224
	add r0, sp, #0x10
	ldrb r2, [r0]
	lsls r0, r2, #0x1f
	lsrs r0, r0, #0x1f
	adds r1, r6, #0
	adds r1, #0x3b
	strb r0, [r1]
	cmp r0, #0
	bne _0809A062
	b _0809A1B4
_0809A062:
	lsls r0, r2, #0x19
	lsrs r0, r0, #0x1d
	adds r3, r6, #0
	adds r3, #0x34
	strb r0, [r3]
	add r0, sp, #0x10
	ldrh r0, [r0]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x1d
	movs r1, #0x35
	adds r1, r1, r6
	mov r8, r1
	strb r0, [r1]
	add r0, sp, #0x10
	ldrb r1, [r0, #1]
	lsls r0, r1, #0x1b
	lsrs r0, r0, #0x1d
	movs r2, #0x36
	adds r2, r2, r6
	mov ip, r2
	strb r0, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1d
	adds r7, r6, #0
	adds r7, #0x37
	strb r1, [r7]
	add r0, sp, #0x10
	ldrb r1, [r0, #2]
	lsls r0, r1, #0x1d
	lsrs r0, r0, #0x1d
	adds r4, r6, #0
	adds r4, #0x38
	strb r0, [r4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x1f
	movs r0, #0x3e
	adds r0, r0, r6
	mov sb, r0
	strb r1, [r0]
	ldr r0, [sp, #0x14]
	lsrs r0, r0, #7
	adds r1, r6, #0
	adds r1, #0x40
	strb r0, [r1]
	add r0, sp, #0x10
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1a
	adds r1, #1
	strb r0, [r1]
	add r0, sp, #0x10
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x13
	lsrs r0, r0, #0x1a
	adds r1, #1
	strb r0, [r1]
	add r0, sp, #0x10
	ldrb r0, [r0, #7]
	lsrs r2, r0, #5
	ldr r0, [sp, #0x18]
	ldr r1, _0809A144 @ =0x001FFFFF
	ands r0, r1
	lsls r0, r0, #3
	orrs r0, r2
	str r0, [r6, #0x58]
	add r0, sp, #0x10
	ldrb r0, [r0, #0x17]
	adds r5, r6, #0
	adds r5, #0x3f
	strb r0, [r5]
	ldrb r0, [r3]
	mov r2, r8
	ldrb r1, [r2]
	mov r3, ip
	ldrb r2, [r3]
	ldrb r3, [r7]
	ldrb r4, [r4]
	str r4, [sp]
	bl GetOverallRank
	adds r1, r6, #0
	adds r1, #0x39
	strb r0, [r1]
	add r0, sp, #0x10
	ldrh r0, [r0, #0xa]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x1a
	adds r2, r6, #0
	adds r2, #0x4e
	strb r0, [r2]
	add r0, sp, #0x10
	ldrh r0, [r0, #2]
	lsrs r0, r0, #7
	subs r2, #0x14
	strb r0, [r2]
	mov r2, sb
	ldrb r0, [r2]
	adds r7, r1, #0
	cmp r0, #0
	beq _0809A148
	adds r4, r6, #0
	adds r4, #0x43
	add r1, sp, #0x1c
	adds r0, r4, #0
	bl strcpy
	adds r0, r4, #0
	bl SetTacticianName
	b _0809A152
	.align 2, 0
_0809A140: .4byte 0x0100000C
_0809A144: .4byte 0x001FFFFF
_0809A148:
	ldr r0, _0809A190 @ =0x0000055B
	bl GetMsg
	bl SetTacticianName
_0809A152:
	ldrb r0, [r5]
	cmp r0, #0
	beq _0809A174
	ldrb r1, [r7]
	bl sub_0809A83C
	cmp r0, #0
	bne _0809A164
	strb r0, [r5]
_0809A164:
	ldrb r0, [r5]
	adds r4, r6, #0
	adds r4, #0x3b
	ldr r3, _0809A194 @ =0x02023460
	mov r8, r3
	ldr r7, _0809A198 @ =0x0840EAF0
	cmp r0, #0
	bne _0809A1D2
_0809A174:
	adds r0, r6, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809A19C
	movs r0, #0x2d
	strb r0, [r5]
	adds r4, r6, #0
	adds r4, #0x3b
	ldr r0, _0809A194 @ =0x02023460
	mov r8, r0
	ldr r7, _0809A198 @ =0x0840EAF0
	b _0809A1D2
	.align 2, 0
_0809A190: .4byte 0x0000055B
_0809A194: .4byte 0x02023460
_0809A198: .4byte 0x0840EAF0
_0809A19C:
	movs r0, #0x28
	strb r0, [r5]
	adds r4, r6, #0
	adds r4, #0x3b
	ldr r1, _0809A1AC @ =0x02023460
	mov r8, r1
	ldr r7, _0809A1B0 @ =0x0840EAF0
	b _0809A1D2
	.align 2, 0
_0809A1AC: .4byte 0x02023460
_0809A1B0: .4byte 0x0840EAF0
_0809A1B4:
	movs r2, #0
	adds r4, r1, #0
	ldr r3, _0809A26C @ =0x02023460
	mov r8, r3
	ldr r7, _0809A270 @ =0x0840EAF0
	adds r3, r6, #0
	adds r3, #0x34
	movs r5, #0xff
_0809A1C4:
	adds r1, r3, r2
	ldrb r0, [r1]
	orrs r0, r5
	strb r0, [r1]
	adds r2, #1
	cmp r2, #4
	ble _0809A1C4
_0809A1D2:
	movs r2, #0xa5
	lsls r2, r2, #7
	mov r0, r8
	adds r1, r7, #0
	bl sub_080AACD8
	adds r0, r6, #0
	bl sub_08099BA4
	adds r0, r6, #0
	bl sub_08099A48
	movs r0, #7
	bl EnableBgSync
	movs r0, #0
	bl EndFaceById
	bl EndCgText
	ldrb r0, [r4]
	cmp r0, #0
	beq _0809A25E
	adds r4, r6, #0
	adds r4, #0x3f
	ldrb r0, [r4]
	cmp r0, #0
	beq _0809A25E
	ldr r2, _0809A274 @ =0x08BDCE4C
	ldrb r1, [r4]
	subs r1, #1
	movs r0, #0x34
	muls r0, r1, r0
	adds r0, r0, r2
	ldrh r0, [r0, #6]
	movs r3, #0x81
	lsls r3, r3, #1
	movs r5, #0
	str r5, [sp]
	movs r1, #0xd8
	movs r2, #0x58
	bl StartTalkFace
	ldrb r0, [r4]
	adds r1, r6, #0
	adds r1, #0x39
	ldrb r1, [r1]
	bl sub_0809A83C
	adds r4, r0, #0
	movs r0, #0x28
	movs r1, #0
	movs r2, #1
	bl InitTalk
	str r4, [sp]
	ldr r0, _0809A278 @ =0x06011000
	str r0, [sp, #4]
	movs r0, #0xa
	str r0, [sp, #8]
	str r5, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x13
	movs r2, #0x12
	movs r3, #4
	bl StartCgText
	ldr r0, _0809A27C @ =0x000809FE
	bl SetCgFlags
_0809A25E:
	add sp, #0x2c
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A26C: .4byte 0x02023460
_0809A270: .4byte 0x0840EAF0
_0809A274: .4byte 0x08BDCE4C
_0809A278: .4byte 0x06011000
_0809A27C: .4byte 0x000809FE

	thumb_func_start sub_0809A280
sub_0809A280: @ 0x0809A280
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x4f
	movs r5, #0
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	ldr r1, _0809A2CC @ =0x08B857F8
	ldr r2, [r1]
	movs r0, #2
	ldrh r3, [r2, #8]
	ands r0, r3
	adds r3, r1, #0
	cmp r0, #0
	beq _0809A2D8
	ldr r0, _0809A2D0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809A2B2
	ldr r0, _0809A2D4 @ =0x0000038B
	bl m4aSongNumStart
_0809A2B2:
	movs r1, #0x80
	lsls r1, r1, #1
	str r5, [sp]
	movs r0, #0x5a
	movs r2, #0xc0
	movs r3, #0x18
	bl CallSomeSoundMaybe
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	b _0809A370
	.align 2, 0
_0809A2CC: .4byte 0x08B857F8
_0809A2D0: .4byte 0x0202BBF8
_0809A2D4: .4byte 0x0000038B
_0809A2D8:
	movs r0, #4
	ldrh r2, [r2, #4]
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _0809A324
	adds r0, r4, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	subs r0, #0x23
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809A32A
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xb4
	bls _0809A32A
	ldr r0, _0809A31C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809A312
	ldr r0, _0809A320 @ =0x0000038A
	bl m4aSongNumStart
_0809A312:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _0809A370
	.align 2, 0
_0809A31C: .4byte 0x0202BBF8
_0809A320: .4byte 0x0000038A
_0809A324:
	adds r1, r4, #0
	adds r1, #0x5e
	strh r0, [r1]
_0809A32A:
	ldr r1, [r3]
	movs r0, #0x88
	lsls r0, r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	adds r2, r4, #0
	adds r2, #0x4f
	cmp r0, #0
	beq _0809A340
	movs r0, #0xff
	strb r0, [r2]
_0809A340:
	ldr r1, [r3]
	movs r0, #0x88
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0809A352
	movs r0, #1
	strb r0, [r2]
_0809A352:
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bne _0809A368
	adds r0, r4, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0809A370
_0809A368:
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
_0809A370:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0809A378
sub_0809A378: @ 0x0809A378
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r6, #0x5c
	ldrh r0, [r6]
	bl sub_0809A8C8
	adds r7, r0, #0
	cmp r7, #0
	bne _0809A396
	strh r7, [r6]
	movs r0, #0
	bl sub_0809A8C8
	adds r7, r0, #0
_0809A396:
	ldrh r0, [r6]
	bl sub_0809A870
	adds r5, r0, #0
	ldrh r0, [r6]
	adds r0, #1
	movs r4, #0
	strh r0, [r6]
	movs r0, #0
	bl EndFaceById
	ldr r2, _0809A3F8 @ =0x08BDCE4C
	subs r1, r7, #1
	movs r0, #0x34
	muls r0, r1, r0
	adds r0, r0, r2
	ldrh r0, [r0, #6]
	movs r3, #0x81
	lsls r3, r3, #1
	str r4, [sp]
	movs r1, #0xd8
	movs r2, #0x58
	bl StartTalkFace
	movs r0, #0x28
	movs r1, #0
	movs r2, #1
	bl InitTalk
	str r5, [sp]
	ldr r0, _0809A3FC @ =0x06011000
	str r0, [sp, #4]
	movs r0, #0xa
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x13
	movs r2, #0x12
	movs r3, #4
	bl StartCgText
	ldr r0, _0809A400 @ =0x0002000A
	bl SetCgFlags
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A3F8: .4byte 0x08BDCE4C
_0809A3FC: .4byte 0x06011000
_0809A400: .4byte 0x0002000A

	thumb_func_start sub_0809A404
sub_0809A404: @ 0x0809A404
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, _0809A4F4 @ =0x03002870
	movs r2, #4
	rsbs r2, r2, #0
	adds r1, r2, #0
	ldrb r3, [r4, #0xc]
	ands r1, r3
	movs r3, #1
	mov r8, r3
	mov r3, r8
	orrs r1, r3
	strb r1, [r4, #0xc]
	movs r1, #3
	ldrb r3, [r4, #0x10]
	orrs r1, r3
	strb r1, [r4, #0x10]
	adds r1, r2, #0
	ldrb r3, [r4, #0x14]
	ands r1, r3
	movs r6, #2
	orrs r1, r6
	strb r1, [r4, #0x14]
	ldrb r1, [r4, #0x18]
	ands r2, r1
	strb r2, [r4, #0x18]
	movs r5, #0
	str r5, [r0, #0x2c]
	adds r2, r4, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r3, [r2]
	ands r0, r3
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x44
	strb r5, [r0]
	adds r1, r4, #0
	adds r1, #0x45
	movs r7, #0x10
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x46
	strb r5, [r0]
	ldr r0, _0809A4F8 @ =0x0000FFE0
	ldrh r1, [r4, #0x3c]
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	ldr r1, _0809A4FC @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xb8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4, #0x3c]
	ldr r0, _0809A500 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809A48E
	movs r0, #0xc8
	bl m4aSongNumStart
_0809A48E:
	movs r0, #0x20
	ldrb r3, [r4, #1]
	orrs r0, r3
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	adds r2, r4, #0
	adds r2, #0x34
	mov r0, r8
	ldrb r1, [r2]
	orrs r0, r1
	orrs r0, r6
	movs r1, #4
	orrs r0, r1
	movs r3, #8
	orrs r0, r3
	orrs r0, r7
	strb r0, [r2]
	adds r2, #2
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	orrs r0, r3
	orrs r0, r7
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x2d
	strb r5, [r0]
	adds r0, #4
	strb r5, [r0]
	adds r1, r4, #0
	adds r1, #0x2c
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A4F4: .4byte 0x03002870
_0809A4F8: .4byte 0x0000FFE0
_0809A4FC: .4byte 0x0000E0FF
_0809A500: .4byte 0x0202BBF8

	thumb_func_start sub_0809A504
sub_0809A504: @ 0x0809A504
	push {r4, lr}
	movs r1, #0
	movs r4, #0xf0
	cmp r0, #0
	ble _0809A510
	adds r1, r0, #0
_0809A510:
	cmp r0, #0
	bge _0809A51A
	movs r2, #0x80
	lsls r2, r2, #1
	adds r4, r0, r2
_0809A51A:
	cmp r4, #0xf0
	bgt _0809A528
	adds r0, r4, #0
	cmp r0, #0
	bge _0809A52A
	movs r0, #0
	b _0809A52A
_0809A528:
	movs r0, #0xf0
_0809A52A:
	adds r4, r0, #0
	cmp r1, #0xf0
	bgt _0809A538
	cmp r1, #0
	bge _0809A53A
	movs r1, #0
	b _0809A53A
_0809A538:
	movs r1, #0xf0
_0809A53A:
	ldr r2, _0809A55C @ =0x03002870
	adds r3, r2, #0
	adds r3, #0x2d
	movs r0, #0
	strb r1, [r3]
	adds r1, r2, #0
	adds r1, #0x31
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x2c
	strb r4, [r0]
	subs r1, #1
	movs r0, #0xa0
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809A55C: .4byte 0x03002870

	thumb_func_start sub_0809A560
sub_0809A560: @ 0x0809A560
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	movs r4, #0xa
	subs r4, r4, r0
	lsls r0, r4, #3
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r5, #8
	subs r5, r5, r0
	lsls r0, r4, #4
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r3, #0x10
	subs r3, r3, r0
	adds r0, r6, #0
	adds r0, #0x4f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r1, r5, #0
	muls r1, r0, r1
	mov r8, r1
	adds r0, r6, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r7, r5, #0
	muls r7, r0, r7
	ldr r4, _0809A64C @ =0x03002870
	adds r2, r4, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x44
	movs r1, #0
	strb r3, [r0]
	movs r0, #0x10
	subs r0, r0, r3
	adds r2, #9
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x46
	strb r1, [r0]
	mov r0, r8
	lsls r5, r0, #0x10
	lsrs r5, r5, #0x10
	lsls r4, r7, #0x10
	lsrs r4, r4, #0x10
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl SetBgOffset
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	bl SetBgOffset
	adds r2, r7, #4
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r1, r5, #0
	bl SetBgOffset
	mov r1, r8
	rsbs r0, r1, #0
	adds r1, r6, #0
	adds r1, #0x52
	strh r0, [r1]
	rsbs r1, r7, #0
	adds r2, r6, #0
	adds r2, #0x54
	strh r1, [r2]
	bl sub_0809A504
	adds r0, r6, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809A634
	movs r1, #0xd8
	mov r0, r8
	subs r1, r1, r0
	movs r2, #0x58
	subs r2, r2, r7
	movs r0, #0
	bl SetFacePosition
_0809A634:
	ldr r0, [r6, #0x2c]
	cmp r0, #0xa
	bne _0809A640
	adds r0, r6, #0
	bl Proc_Break
_0809A640:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A64C: .4byte 0x03002870

	thumb_func_start sub_0809A650
sub_0809A650: @ 0x0809A650
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #0
	str r5, [r4, #0x2c]
	adds r0, #0x4f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _0809A688
	movs r0, #1
	bl SetUiSpinningArrowFastMaybe
	adds r2, r4, #0
	adds r2, #0x3c
	ldrb r0, [r2]
	cmp r0, #2
	bne _0809A684
	adds r1, r4, #0
	adds r1, #0x3d
	movs r0, #1
	ldrb r3, [r1]
	subs r0, r0, r3
	strb r0, [r1]
	strb r5, [r2]
	b _0809A688
_0809A684:
	adds r0, #1
	strb r0, [r2]
_0809A688:
	adds r0, r4, #0
	adds r0, #0x4f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _0809A6BA
	movs r0, #0
	bl SetUiSpinningArrowFastMaybe
	adds r2, r4, #0
	adds r2, #0x3c
	ldrb r0, [r2]
	cmp r0, #0
	bne _0809A6B6
	adds r0, r4, #0
	adds r0, #0x3d
	movs r1, #1
	ldrb r3, [r0]
	subs r1, r1, r3
	strb r1, [r0]
	movs r0, #2
	b _0809A6B8
_0809A6B6:
	subs r0, #1
_0809A6B8:
	strb r0, [r2]
_0809A6BA:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0809A6C0
sub_0809A6C0: @ 0x0809A6C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	ldr r0, [r7, #0x2c]
	adds r0, #1
	str r0, [r7, #0x2c]
	movs r5, #0xa
	subs r5, r5, r0
	lsls r0, r5, #3
	muls r0, r5, r0
	movs r1, #0x64
	bl __divsi3
	movs r4, #8
	subs r4, r4, r0
	lsls r0, r5, #4
	muls r0, r5, r0
	movs r1, #0x64
	bl __divsi3
	movs r2, #0x10
	subs r2, r2, r0
	lsls r4, r4, #3
	subs r4, #0x40
	adds r0, r7, #0
	adds r0, #0x4f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r4, #0
	muls r1, r0, r1
	mov sb, r1
	adds r0, r7, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r3, r4, #0
	muls r3, r0, r3
	mov r8, r3
	ldr r6, _0809A814 @ =0x03002870
	movs r0, #0x3c
	adds r0, r0, r6
	mov sl, r0
	movs r0, #0x3f
	mov r1, sl
	ldrb r1, [r1]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	mov r3, sl
	strb r0, [r3]
	movs r0, #0x10
	subs r0, r0, r2
	movs r1, #0
	ldr r3, _0809A818 @ =0x030028B4
	strb r0, [r3]
	ldr r0, _0809A81C @ =0x030028B5
	strb r2, [r0]
	ldr r2, _0809A820 @ =0x030028B6
	strb r1, [r2]
	mov r3, sb
	lsls r5, r3, #0x10
	lsrs r5, r5, #0x10
	mov r0, r8
	lsls r4, r0, #0x10
	lsrs r4, r4, #0x10
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl SetBgOffset
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	bl SetBgOffset
	mov r2, r8
	adds r2, #4
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r1, r5, #0
	bl SetBgOffset
	mov r1, sb
	rsbs r0, r1, #0
	adds r1, r7, #0
	adds r1, #0x52
	movs r4, #0
	strh r0, [r1]
	mov r2, r8
	rsbs r1, r2, #0
	adds r2, r7, #0
	adds r2, #0x54
	strh r1, [r2]
	bl sub_0809A504
	adds r0, r7, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809A7A6
	movs r1, #0xd8
	mov r3, sb
	subs r1, r1, r3
	movs r2, #0x58
	mov r0, r8
	subs r2, r2, r0
	movs r0, #0
	bl SetFacePosition
_0809A7A6:
	ldr r0, [r7, #0x2c]
	cmp r0, #0xa
	bne _0809A806
	adds r0, r7, #0
	bl Proc_Break
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r6, #0xc]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r6, #0xc]
	movs r2, #3
	ldrb r0, [r6, #0x10]
	orrs r0, r2
	strb r0, [r6, #0x10]
	ldrb r3, [r6, #0x14]
	ands r1, r3
	movs r0, #2
	orrs r1, r0
	strb r1, [r6, #0x14]
	ldrb r0, [r6, #0x18]
	orrs r2, r0
	strb r2, [r6, #0x18]
	movs r0, #0x3f
	mov r1, sl
	ldrb r1, [r1]
	ands r0, r1
	mov r2, sl
	strb r0, [r2]
	ldr r3, _0809A818 @ =0x030028B4
	strb r4, [r3]
	ldr r0, _0809A81C @ =0x030028B5
	strb r4, [r0]
	ldr r1, _0809A820 @ =0x030028B6
	strb r4, [r1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r2, [r6, #1]
	ands r0, r2
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r6, #1]
_0809A806:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A814: .4byte 0x03002870
_0809A818: .4byte 0x030028B4
_0809A81C: .4byte 0x030028B5
_0809A820: .4byte 0x030028B6

	thumb_func_start sub_0809A824
sub_0809A824: @ 0x0809A824
	push {lr}
	adds r2, r0, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	adds r1, r2, #0
	adds r1, #0x3d
	ldrb r1, [r1]
	bl sub_0809E3D8
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0809A83C
sub_0809A83C: @ 0x0809A83C
	adds r3, r0, #0
	ldr r2, _0809A844 @ =0x08CC52D8
	b _0809A864
	.align 2, 0
_0809A844: .4byte 0x08CC52D8
_0809A848:
	ldr r0, [r2]
	cmp r3, r0
	bne _0809A862
	cmp r1, #3
	ble _0809A856
	ldr r0, [r2, #4]
	b _0809A86C
_0809A856:
	cmp r1, #1
	ble _0809A85E
	ldr r0, [r2, #8]
	b _0809A86C
_0809A85E:
	ldr r0, [r2, #0xc]
	b _0809A86C
_0809A862:
	adds r2, #0x10
_0809A864:
	ldr r0, [r2]
	cmp r0, #0
	bne _0809A848
	movs r0, #0
_0809A86C:
	bx lr
	.align 2, 0

	thumb_func_start sub_0809A870
sub_0809A870: @ 0x0809A870
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r1, #3
	bl __modsi3
	cmp r0, #0
	bne _0809A894
	ldr r4, _0809A890 @ =0x08CC52D8
	adds r0, r5, #0
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #4
	adds r4, #4
	b _0809A8BA
	.align 2, 0
_0809A890: .4byte 0x08CC52D8
_0809A894:
	cmp r0, #1
	beq _0809A8AC
	ldr r4, _0809A8A8 @ =0x08CC52D8
	adds r0, r5, #0
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #4
	adds r4, #0xc
	b _0809A8BA
	.align 2, 0
_0809A8A8: .4byte 0x08CC52D8
_0809A8AC:
	ldr r4, _0809A8C4 @ =0x08CC52D8
	adds r0, r5, #0
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #4
	adds r4, #8
_0809A8BA:
	adds r0, r0, r4
	ldr r0, [r0]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809A8C4: .4byte 0x08CC52D8

	thumb_func_start sub_0809A8C8
sub_0809A8C8: @ 0x0809A8C8
	push {r4, lr}
	ldr r4, _0809A8E0 @ =0x08CC52D8
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #4
	adds r0, r0, r4
	ldr r0, [r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809A8E0: .4byte 0x08CC52D8

	thumb_func_start sub_0809A8E4
sub_0809A8E4: @ 0x0809A8E4
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r2, [r0, #0x30]
	movs r3, #0x8f
	lsls r3, r3, #6
	movs r0, #0x90
	movs r1, #3
	bl sub_0808F808
	movs r6, #0x9c
	lsls r6, r6, #5
	movs r5, #0x94
	movs r4, #2
_0809A8FE:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x12
	ldr r3, _0809A920 @ =0x08B905F8
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _0809A8FE
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809A920: .4byte 0x08B905F8

	thumb_func_start sub_0809A924
sub_0809A924: @ 0x0809A924
	push {r4, r5, r6, lr}
	sub sp, #0x20
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _0809A99C @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x8e
	ldrh r0, [r0]
	bl GetMsg
	adds r6, r0, #0
	ldr r0, _0809A9A0 @ =0x06010000
	adds r5, r5, r0
	mov r0, sp
	adds r1, r5, #0
	movs r2, #1
	bl InitSpriteTextFont
	ldr r0, _0809A9A4 @ =0x08194674
	adds r4, #0x10
	lsls r4, r4, #5
	adds r1, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	add r4, sp, #0x18
	adds r0, r4, #0
	bl InitSpriteText
	mov r0, sp
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	movs r0, #0x60
	adds r1, r6, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	adds r3, r6, #0
	bl Text_InsertDrawString
	movs r0, #0
	bl SetTextFont
	add sp, #0x20
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809A99C: .4byte 0x0202BBF8
_0809A9A0: .4byte 0x06010000
_0809A9A4: .4byte 0x08194674

	thumb_func_start sub_0809A9A8
sub_0809A9A8: @ 0x0809A9A8
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	bl GetChapterDivinationPortrait
	adds r6, r0, #0
	ldr r4, _0809AAD8 @ =0x03002870
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r4]
	ands r0, r1
	strb r0, [r4]
	movs r0, #0
	bl InitBgs
	movs r0, #0
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r4, #0xc]
	ands r0, r2
	strb r0, [r4, #0xc]
	adds r0, r1, #0
	ldrb r2, [r4, #0x10]
	ands r0, r2
	movs r2, #2
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	strb r1, [r4, #0x14]
	movs r0, #3
	ldrb r1, [r4, #0x18]
	orrs r0, r1
	strb r0, [r4, #0x18]
	bl InitFaces
	bl ResetText
	bl InitIcons
	bl LoadUiFrameGraphics
	bl ApplySystemObjectsGraphics
	ldr r2, _0809AADC @ =0x0000FFFC
	movs r0, #0
	movs r1, #4
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #4
	bl ApplyIconPalettes
	bl PrepRestartMuralBackground
	movs r0, #7
	bl EnableBgSync
	adds r0, r5, #0
	bl StartGreenText
	ldr r0, _0809AAE0 @ =0x02012A90
	movs r1, #8
	bl InitText
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r0, #0
	str r0, [sp]
	str r5, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl StartSysBrownBox
	movs r0, #0
	movs r1, #0x90
	movs r2, #0x10
	movs r3, #0
	bl EnableSysBrownBox
	movs r0, #0xe0
	lsls r0, r0, #7
	movs r1, #1
	bl sub_0809A924
	ldr r4, _0809AAE4 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r2, [r4, #0x1b]
	cmp r2, #3
	bne _0809AAA0
	movs r1, #1
_0809AAA0:
	adds r0, #0x84
	adds r0, r0, r1
	ldrb r0, [r0]
	str r0, [r5, #0x30]
	movs r0, #0xf0
	lsls r0, r0, #7
	movs r1, #2
	bl DrawAtMenuUpfx
	ldr r0, _0809AAE8 @ =sub_0809A8E4
	adds r1, r5, #0
	bl StartParallelWorker
	movs r0, #0x80
	lsls r0, r0, #2
	movs r1, #3
	movs r2, #1
	bl InitTalk
	ldrb r0, [r4, #0xe]
	cmp r0, #0x2e
	bne _0809AAEC
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b _0809AB1C
	.align 2, 0
_0809AAD8: .4byte 0x03002870
_0809AADC: .4byte 0x0000FFFC
_0809AAE0: .4byte 0x02012A90
_0809AAE4: .4byte 0x0202BBF8
_0809AAE8: .4byte sub_0809A8E4
_0809AAEC:
	cmp r6, #0x4b
	bne _0809AAF8
	movs r0, #0x99
	bl SetFlag
	b _0809AB1C
_0809AAF8:
	movs r0, #0x99
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809AB1C
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	cmp r0, #0x2a
	bgt _0809AB1C
	movs r6, #0x4b
	movs r0, #0x99
	bl ClearFlag
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
_0809AB1C:
	ldr r3, _0809AB34 @ =0x00000202
	movs r0, #0
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #0xd4
	movs r2, #0x52
	bl StartTalkFace
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809AB34: .4byte 0x00000202

	thumb_func_start sub_0809AB38
sub_0809AB38: @ 0x0809AB38
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	bl GetChapterDivinationTextIdBeginning
	str r0, [r4, #0x2c]
	movs r3, #1
	rsbs r3, r3, #0
	str r0, [sp]
	ldr r0, _0809AB74 @ =0x06011000
	str r0, [sp, #4]
	str r3, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x10
	adds r2, r3, #0
	bl StartCgText
	bl GetCgTextFlags
	adds r1, r0, #0
	ldr r0, _0809AB78 @ =0x0004004E
	orrs r0, r1
	bl SetCgFlags
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809AB74: .4byte 0x06011000
_0809AB78: .4byte 0x0004004E

	thumb_func_start sub_0809AB7C
sub_0809AB7C: @ 0x0809AB7C
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	bl GetChapterDivinationTextIdHectorStory
	str r0, [r4, #0x2c]
	movs r3, #1
	rsbs r3, r3, #0
	str r0, [sp]
	ldr r0, _0809ABB8 @ =0x06011000
	str r0, [sp, #4]
	str r3, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x10
	adds r2, r3, #0
	bl StartCgText
	bl GetCgTextFlags
	adds r1, r0, #0
	ldr r0, _0809ABBC @ =0x0004000A
	orrs r0, r1
	bl SetCgFlags
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809ABB8: .4byte 0x06011000
_0809ABBC: .4byte 0x0004000A

	thumb_func_start sub_0809ABC0
sub_0809ABC0: @ 0x0809ABC0
	push {lr}
	sub sp, #0x10
	adds r2, r0, #0
	ldr r1, _0809ABD8 @ =0x0202BBF8
	adds r1, #0x2b
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0809ABE0
	ldr r0, _0809ABDC @ =0x00000FBD
	b _0809ABE2
	.align 2, 0
_0809ABD8: .4byte 0x0202BBF8
_0809ABDC: .4byte 0x00000FBD
_0809ABE0:
	ldr r0, _0809AC14 @ =0x00000FBE
_0809ABE2:
	str r0, [r2, #0x2c]
	movs r3, #1
	rsbs r3, r3, #0
	ldr r0, [r2, #0x2c]
	str r0, [sp]
	ldr r0, _0809AC18 @ =0x06011000
	str r0, [sp, #4]
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x10
	adds r2, r3, #0
	bl StartCgText
	bl GetCgTextFlags
	adds r1, r0, #0
	ldr r0, _0809AC1C @ =0x0004000A
	orrs r0, r1
	bl SetCgFlags
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_0809AC14: .4byte 0x00000FBE
_0809AC18: .4byte 0x06011000
_0809AC1C: .4byte 0x0004000A

	thumb_func_start sub_0809AC20
sub_0809AC20: @ 0x0809AC20
	push {lr}
	sub sp, #0x10
	adds r2, r0, #0
	ldr r1, _0809AC38 @ =0x0202BBF8
	adds r1, #0x2b
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0809AC40
	ldr r0, _0809AC3C @ =0x00000FBF
	b _0809AC44
	.align 2, 0
_0809AC38: .4byte 0x0202BBF8
_0809AC3C: .4byte 0x00000FBF
_0809AC40:
	movs r0, #0xfc
	lsls r0, r0, #4
_0809AC44:
	str r0, [r2, #0x2c]
	movs r3, #1
	rsbs r3, r3, #0
	ldr r0, [r2, #0x2c]
	str r0, [sp]
	ldr r0, _0809AC74 @ =0x06011000
	str r0, [sp, #4]
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x10
	adds r2, r3, #0
	bl StartCgText
	bl GetCgTextFlags
	adds r1, r0, #0
	ldr r0, _0809AC78 @ =0x0006000A
	orrs r0, r1
	bl SetCgFlags
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_0809AC74: .4byte 0x06011000
_0809AC78: .4byte 0x0006000A

	thumb_func_start sub_0809AC7C
sub_0809AC7C: @ 0x0809AC7C
	push {lr}
	sub sp, #4
	ldr r3, _0809AC98 @ =0x00000202
	movs r0, #0
	str r0, [sp]
	movs r0, #0x41
	movs r1, #0xd4
	movs r2, #0x52
	bl StartTalkFace
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0809AC98: .4byte 0x00000202

	thumb_func_start sub_0809AC9C
sub_0809AC9C: @ 0x0809AC9C
	push {lr}
	sub sp, #0x10
	adds r2, r0, #0
	ldr r1, _0809ACB4 @ =0x0202BBF8
	adds r1, #0x2b
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0809ACBC
	ldr r0, _0809ACB8 @ =0x00000FC1
	b _0809ACBE
	.align 2, 0
_0809ACB4: .4byte 0x0202BBF8
_0809ACB8: .4byte 0x00000FC1
_0809ACBC:
	ldr r0, _0809ACF0 @ =0x00000FC2
_0809ACBE:
	str r0, [r2, #0x2c]
	movs r3, #1
	rsbs r3, r3, #0
	ldr r0, [r2, #0x2c]
	str r0, [sp]
	ldr r0, _0809ACF4 @ =0x06011000
	str r0, [sp, #4]
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x10
	adds r2, r3, #0
	bl StartCgText
	bl GetCgTextFlags
	adds r1, r0, #0
	ldr r0, _0809ACF8 @ =0x0004000A
	orrs r0, r1
	bl SetCgFlags
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_0809ACF0: .4byte 0x00000FC2
_0809ACF4: .4byte 0x06011000
_0809ACF8: .4byte 0x0004000A

	thumb_func_start sub_0809ACFC
sub_0809ACFC: @ 0x0809ACFC
	push {r4, lr}
	adds r4, r0, #0
	bl EndCgText
	adds r0, r4, #0
	bl EndAllProcChildren
	bl EndMuralBackground_
	movs r0, #0
	bl EndFaceById
	movs r0, #0
	bl SetOnHBlankA
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0809AD20
sub_0809AD20: @ 0x0809AD20
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	bl sub_08099284
	str r0, [r4, #0x2c]
	movs r3, #1
	rsbs r3, r3, #0
	str r0, [sp]
	ldr r0, _0809AD5C @ =0x06011000
	str r0, [sp, #4]
	str r3, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x10
	adds r2, r3, #0
	bl StartCgText
	bl GetCgTextFlags
	adds r1, r0, #0
	ldr r0, _0809AD60 @ =0x0004004E
	orrs r0, r1
	bl SetCgFlags
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809AD5C: .4byte 0x06011000
_0809AD60: .4byte 0x0004004E

	thumb_func_start sub_0809AD64
sub_0809AD64: @ 0x0809AD64
	push {r4, r5, lr}
	adds r5, r0, #0
	bl GetTalkResult
	cmp r0, #1
	bne _0809ADB2
	bl sub_080992A0
	adds r4, r0, #0
	bl GetGold
	cmp r0, r4
	blt _0809ADA8
	cmp r4, #0
	ble _0809AD9A
	rsbs r0, r4, #0
	bl AddGold
	ldr r0, _0809ADA4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809AD9A
	movs r0, #0xb9
	bl m4aSongNumStart
_0809AD9A:
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	b _0809ADBA
	.align 2, 0
_0809ADA4: .4byte 0x0202BBF8
_0809ADA8:
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
	b _0809ADBA
_0809ADB2:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
_0809ADBA:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0809ADC0
sub_0809ADC0: @ 0x0809ADC0
	push {r4, lr}
	adds r4, r0, #0
	bl GetTalkResult
	cmp r0, #1
	bne _0809ADD6
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	b _0809ADDE
_0809ADD6:
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_0809ADDE:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0809ADE4
sub_0809ADE4: @ 0x0809ADE4
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	bl sub_0809931C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809ADFC
	ldr r0, _0809ADF8 @ =0x00000F85
	b _0809ADFE
	.align 2, 0
_0809ADF8: .4byte 0x00000F85
_0809ADFC:
	ldr r0, _0809AE34 @ =0x00000F83
_0809ADFE:
	str r0, [r4, #0x2c]
	movs r3, #1
	rsbs r3, r3, #0
	ldr r0, [r4, #0x2c]
	str r0, [sp]
	ldr r0, _0809AE38 @ =0x06011000
	str r0, [sp, #4]
	str r3, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x10
	adds r2, r3, #0
	bl StartCgText
	bl GetCgTextFlags
	adds r1, r0, #0
	ldr r0, _0809AE3C @ =0x0004004E
	orrs r0, r1
	bl SetCgFlags
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809AE34: .4byte 0x00000F83
_0809AE38: .4byte 0x06011000
_0809AE3C: .4byte 0x0004004E

	thumb_func_start sub_0809AE40
sub_0809AE40: @ 0x0809AE40
	push {lr}
	sub sp, #0x10
	ldr r1, _0809AE78 @ =0x00000F84
	str r1, [r0, #0x2c]
	movs r3, #1
	rsbs r3, r3, #0
	str r1, [sp]
	ldr r0, _0809AE7C @ =0x06011000
	str r0, [sp, #4]
	str r3, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x10
	adds r2, r3, #0
	bl StartCgText
	bl GetCgTextFlags
	adds r1, r0, #0
	ldr r0, _0809AE80 @ =0x0004004E
	orrs r0, r1
	bl SetCgFlags
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_0809AE78: .4byte 0x00000F84
_0809AE7C: .4byte 0x06011000
_0809AE80: .4byte 0x0004004E

	thumb_func_start sub_0809AE84
sub_0809AE84: @ 0x0809AE84
	push {lr}
	sub sp, #4
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	str r0, [sp]
	movs r0, #0x5e
	adds r1, r2, #0
	movs r3, #0x20
	bl CallSomeSoundMaybe
	add sp, #4
	pop {r0}
	bx r0

	thumb_func_start sub_0809AEA0
sub_0809AEA0: @ 0x0809AEA0
	push {lr}
	sub sp, #4
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	str r0, [sp]
	movs r0, #0x49
	adds r1, r2, #0
	movs r3, #0x20
	bl CallSomeSoundMaybe
	add sp, #4
	pop {r0}
	bx r0

	thumb_func_start sub_0809AEBC
sub_0809AEBC: @ 0x0809AEBC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r3, _0809AEF4 @ =0x020229A2
	ldr r5, _0809AEF8 @ =0x0202BBF8
	adds r1, r4, #0
	adds r1, #0x2c
	movs r2, #0xe
_0809AECA:
	ldrh r0, [r3]
	strh r0, [r1]
	adds r3, #2
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bge _0809AECA
	adds r0, r5, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809AEEA
	movs r0, #0xee
	bl m4aSongNumStart
_0809AEEA:
	movs r0, #0
	strh r0, [r4, #0x2a]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809AEF4: .4byte 0x020229A2
_0809AEF8: .4byte 0x0202BBF8

	thumb_func_start sub_0809AEFC
sub_0809AEFC: @ 0x0809AEFC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	ldr r0, _0809AF90 @ =0x020229A2
	mov ip, r0
	ldrh r0, [r6, #0x2a]
	adds r0, #1
	strh r0, [r6, #0x2a]
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x11
	movs r5, #0
	movs r7, #0x1f
	movs r0, #0xf8
	lsls r0, r0, #2
	mov sb, r0
	movs r0, #0xf8
	lsls r0, r0, #7
	mov r8, r0
_0809AF24:
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x1f
	ands r0, r1
	adds r3, r0, r4
	mov r0, sb
	ands r0, r1
	lsrs r0, r0, #5
	adds r2, r0, r4
	mov r0, r8
	ands r0, r1
	lsrs r0, r0, #0xa
	adds r0, r0, r4
	cmp r3, #0x1f
	ble _0809AF4A
	movs r3, #0x1f
_0809AF4A:
	cmp r2, #0x1f
	ble _0809AF50
	movs r2, #0x1f
_0809AF50:
	cmp r0, #0x1f
	ble _0809AF56
	movs r0, #0x1f
_0809AF56:
	ands r3, r7
	ands r2, r7
	lsls r1, r2, #5
	adds r1, r3, r1
	ands r0, r7
	lsls r0, r0, #0xa
	adds r1, r1, r0
	mov r0, ip
	strh r1, [r0]
	movs r0, #2
	add ip, r0
	adds r5, #1
	cmp r5, #0xe
	ble _0809AF24
	bl EnablePalSync
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x10
	bne _0809AF82
	adds r0, r6, #0
	bl Proc_Break
_0809AF82:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809AF90: .4byte 0x020229A2

	thumb_func_start sub_0809AF94
sub_0809AF94: @ 0x0809AF94
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	ldr r0, _0809B028 @ =0x020229A2
	mov ip, r0
	ldrh r0, [r6, #0x2a]
	subs r0, #1
	strh r0, [r6, #0x2a]
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x11
	movs r5, #0
	movs r7, #0x1f
	movs r0, #0xf8
	lsls r0, r0, #2
	mov sb, r0
	movs r0, #0xf8
	lsls r0, r0, #7
	mov r8, r0
_0809AFBC:
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x1f
	ands r0, r1
	adds r3, r0, r4
	mov r0, sb
	ands r0, r1
	lsrs r0, r0, #5
	adds r2, r0, r4
	mov r0, r8
	ands r0, r1
	lsrs r0, r0, #0xa
	adds r0, r0, r4
	cmp r3, #0x1f
	ble _0809AFE2
	movs r3, #0x1f
_0809AFE2:
	cmp r2, #0x1f
	ble _0809AFE8
	movs r2, #0x1f
_0809AFE8:
	cmp r0, #0x1f
	ble _0809AFEE
	movs r0, #0x1f
_0809AFEE:
	ands r3, r7
	ands r2, r7
	lsls r1, r2, #5
	adds r1, r3, r1
	ands r0, r7
	lsls r0, r0, #0xa
	adds r1, r1, r0
	mov r0, ip
	strh r1, [r0]
	movs r0, #2
	add ip, r0
	adds r5, #1
	cmp r5, #0xe
	ble _0809AFBC
	bl EnablePalSync
	ldrh r0, [r6, #0x2a]
	cmp r0, #0
	bne _0809B01A
	adds r0, r6, #0
	bl Proc_Break
_0809B01A:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809B028: .4byte 0x020229A2

	thumb_func_start sub_0809B02C
sub_0809B02C: @ 0x0809B02C
	push {lr}
	adds r1, r0, #0
	ldr r0, _0809B03C @ =0x08CC5760
	bl SpawnProcLocking
	pop {r0}
	bx r0
	.align 2, 0
_0809B03C: .4byte 0x08CC5760

	thumb_func_start GetSupportScreenUnitCount
GetSupportScreenUnitCount: @ 0x0809B040
	ldr r0, _0809B048 @ =0x02012BF8
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0809B048: .4byte 0x02012BF8

	thumb_func_start GetNextSupportScreenUnit
GetNextSupportScreenUnit: @ 0x0809B04C
	adds r1, r0, #0
	ldr r0, _0809B05C @ =0x02012BF8
	ldr r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge _0809B060
	adds r0, r1, #1
	b _0809B062
	.align 2, 0
_0809B05C: .4byte 0x02012BF8
_0809B060:
	movs r0, #0
_0809B062:
	bx lr

	thumb_func_start GetPreviousSupportScreenUnit
GetPreviousSupportScreenUnit: @ 0x0809B064
	cmp r0, #0
	bne _0809B06C
	ldr r0, _0809B070 @ =0x02012BF8
	ldr r0, [r0]
_0809B06C:
	subs r0, #1
	bx lr
	.align 2, 0
_0809B070: .4byte 0x02012BF8

	thumb_func_start GetSupportScreenPartnerSupportLevel
GetSupportScreenPartnerSupportLevel: @ 0x0809B074
	ldr r2, _0809B088 @ =0x08CC5798
	ldr r3, [r2]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r2, r2, r3
	adds r2, #2
	adds r2, r2, r1
	ldrb r0, [r2]
	bx lr
	.align 2, 0
_0809B088: .4byte 0x08CC5798

	thumb_func_start GetSupportScreenPartnerClassId
GetSupportScreenPartnerClassId: @ 0x0809B08C
	ldr r2, _0809B0A0 @ =0x08CC5798
	ldr r3, [r2]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r2, r2, r3
	adds r2, #9
	adds r2, r2, r1
	ldrb r0, [r2]
	bx lr
	.align 2, 0
_0809B0A0: .4byte 0x08CC5798

	thumb_func_start GetSupportScreenPartnerIsAlive
GetSupportScreenPartnerIsAlive: @ 0x0809B0A4
	ldr r2, _0809B0BC @ =0x08CC5798
	ldr r3, [r2]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r2, r2, r3
	adds r2, #0x10
	adds r2, r2, r1
	movs r0, #0
	ldrsb r0, [r2, r0]
	bx lr
	.align 2, 0
_0809B0BC: .4byte 0x08CC5798

	thumb_func_start GetSupportScreenPartnerCharId
GetSupportScreenPartnerCharId: @ 0x0809B0C0
	push {r4, r5, lr}
	adds r5, r1, #0
	ldr r4, _0809B0E0 @ =0x08BDCE4C
	bl GetSupportScreenCharIdAt
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r4, #0x2c
	adds r0, r0, r4
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809B0E0: .4byte 0x08BDCE4C

	thumb_func_start GetSupportScreenCharIdAt
GetSupportScreenCharIdAt: @ 0x0809B0E4
	ldr r1, _0809B0F4 @ =0x08CC5798
	ldr r2, [r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrb r0, [r1]
	bx lr
	.align 2, 0
_0809B0F4: .4byte 0x08CC5798

	thumb_func_start GetSupportScreenClassIdAt
GetSupportScreenClassIdAt: @ 0x0809B0F8
	ldr r1, _0809B108 @ =0x08CC5798
	ldr r2, [r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrb r0, [r1, #1]
	bx lr
	.align 2, 0
_0809B108: .4byte 0x08CC5798

	thumb_func_start GetSupportClassForCharId
GetSupportClassForCharId: @ 0x0809B10C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #1
_0809B112:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0809B140
	ldr r3, [r2]
	cmp r3, #0
	beq _0809B140
	ldr r0, [r2, #0xc]
	ldr r1, _0809B13C @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0809B140
	ldrb r0, [r3, #4]
	cmp r0, r5
	bne _0809B140
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	b _0809B152
	.align 2, 0
_0809B13C: .4byte 0x00010004
_0809B140:
	adds r4, #1
	cmp r4, #0x3f
	ble _0809B112
	ldr r2, _0809B158 @ =0x08BDCE4C
	subs r1, r5, #1
	movs r0, #0x34
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r0, [r0, #5]
_0809B152:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809B158: .4byte 0x08BDCE4C

	thumb_func_start sub_0809B15C
sub_0809B15C: @ 0x0809B15C
	adds r2, r0, #0
	ldr r1, _0809B164 @ =0x08C9F9F4
	b _0809B17A
	.align 2, 0
_0809B164: .4byte 0x08C9F9F4
_0809B168:
	ldrb r0, [r1]
	cmp r0, r2
	beq _0809B174
	ldrb r0, [r1, #1]
	cmp r0, r2
	bne _0809B178
_0809B174:
	movs r0, #1
	b _0809B182
_0809B178:
	adds r1, #0x14
_0809B17A:
	ldrb r0, [r1]
	cmp r0, #0
	bne _0809B168
	movs r0, #0
_0809B182:
	bx lr

	thumb_func_start sub_0809B184
sub_0809B184: @ 0x0809B184
	push {r4, r5, r6, lr}
	ldr r6, _0809B18C @ =0x08C9F9F4
	b _0809B1B8
	.align 2, 0
_0809B18C: .4byte 0x08C9F9F4
_0809B190:
	ldrb r0, [r6]
	movs r1, #0
	bl MetaSave_SetMetCharacter
	ldrb r0, [r6, #1]
	movs r1, #0
	bl MetaSave_SetMetCharacter
	ldrb r4, [r6]
	ldrb r5, [r6, #1]
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetUnitsAverageSupportValue
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl UpdateBestGlobalSupportValue
	adds r6, #0x14
_0809B1B8:
	ldrb r0, [r6]
	cmp r0, #0
	bne _0809B190
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_0809B1C4
sub_0809B1C4: @ 0x0809B1C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x90
	adds r4, r0, #0
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r7, _0809B344 @ =0x08CC5798
	ldr r1, [r7]
	ldr r2, _0809B348 @ =0x01000600
	mov r0, sp
	bl CpuSet
	ldr r5, _0809B34C @ =0x02012BF8
	movs r1, #0
	str r1, [r5]
	adds r4, #0x42
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0809B1F6
	b _0809B35C
_0809B1F6:
	add r0, sp, #0x24
	strh r1, [r0]
	add r1, sp, #4
	ldr r2, _0809B350 @ =0x01000010
	bl CpuSet
	movs r4, #1
_0809B204:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0809B234
	ldr r2, [r0]
	cmp r2, #0
	beq _0809B234
	ldr r0, [r0, #0xc]
	ldr r1, _0809B354 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0809B234
	ldrb r1, [r2, #4]
	lsrs r2, r1, #5
	lsls r2, r2, #2
	add r2, sp
	movs r0, #0x1f
	ands r0, r1
	movs r1, #1
	lsls r1, r0
	ldr r0, [r2, #4]
	orrs r0, r1
	str r0, [r2, #4]
_0809B234:
	adds r4, #1
	cmp r4, #0x3f
	ble _0809B204
	movs r4, #1
	ldr r0, _0809B34C @ =0x02012BF8
	mov sb, r0
_0809B240:
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	adds r4, #1
	str r4, [sp, #0x8c]
	cmp r5, #0
	beq _0809B33A
	ldr r2, [r5]
	cmp r2, #0
	beq _0809B33A
	ldr r0, [r5, #0xc]
	ldr r1, _0809B354 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0809B33A
	ldrb r0, [r2, #4]
	bl GetSupportScreenPartnerCount
	cmp r0, #0
	beq _0809B33A
	mov r0, sb
	ldr r1, [r0]
	ldr r0, _0809B344 @ =0x08CC5798
	ldr r2, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, [r5]
	ldrb r1, [r1, #4]
	strb r1, [r0]
	mov r0, sb
	ldr r1, [r0]
	ldr r0, _0809B344 @ =0x08CC5798
	ldr r2, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, [r5, #4]
	ldrb r1, [r1, #4]
	strb r1, [r0, #1]
	movs r6, #0
	ldr r0, [r5]
	ldrb r1, [r0, #4]
	subs r1, #1
	movs r0, #0x34
	muls r0, r1, r0
	ldr r1, _0809B358 @ =0x08BDCE78
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r0, [r0, #0x15]
	cmp r6, r0
	bge _0809B332
	ldr r7, _0809B34C @ =0x02012BF8
	ldr r0, _0809B344 @ =0x08CC5798
	mov r8, r0
	mov sl, r1
_0809B2B6:
	ldr r0, [r7]
	adds r1, r6, #0
	bl GetSupportScreenPartnerCharId
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl GetUnitSupportLevel
	ldr r2, [r7]
	mov r1, r8
	ldr r3, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r3
	adds r1, #2
	adds r1, r1, r6
	strb r0, [r1]
	adds r0, r4, #0
	bl GetSupportClassForCharId
	ldr r2, [r7]
	mov r1, r8
	ldr r3, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r3
	adds r1, #9
	adds r1, r1, r6
	strb r0, [r1]
	ldr r0, [r7]
	mov r1, r8
	ldr r2, [r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	adds r1, #0x10
	adds r1, r1, r6
	asrs r0, r4, #5
	lsls r0, r0, #2
	add r0, sp
	movs r2, #0x1f
	ands r2, r4
	ldr r0, [r0, #4]
	lsrs r0, r2
	movs r2, #1
	ands r0, r2
	strb r0, [r1]
	adds r6, #1
	ldr r0, [r5]
	ldrb r1, [r0, #4]
	subs r1, #1
	movs r0, #0x34
	muls r0, r1, r0
	add r0, sl
	ldr r0, [r0]
	ldrb r0, [r0, #0x15]
	cmp r6, r0
	blt _0809B2B6
_0809B332:
	mov r1, sb
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
_0809B33A:
	ldr r4, [sp, #0x8c]
	cmp r4, #0x3f
	bgt _0809B342
	b _0809B240
_0809B342:
	b _0809B430
	.align 2, 0
_0809B344: .4byte 0x08CC5798
_0809B348: .4byte 0x01000600
_0809B34C: .4byte 0x02012BF8
_0809B350: .4byte 0x01000010
_0809B354: .4byte 0x00010004
_0809B358: .4byte 0x08BDCE78
_0809B35C:
	add r4, sp, #0x28
	adds r0, r4, #0
	bl LoadMetaSave
	ldr r0, _0809B3D4 @ =0x0000055B
	bl GetMsg
	bl SetTacticianName
	movs r6, #0
	add r0, sp, #0x28
	mov sl, r0
	ldr r1, _0809B3D8 @ =0x08BDCE4C
	mov sb, r1
_0809B378:
	adds r0, r6, #0
	mov r1, sl
	bl MetaSave_HasMetCharacter
	lsls r0, r0, #0x18
	adds r1, r6, #1
	mov r8, r1
	cmp r0, #0
	beq _0809B42A
	adds r0, r6, #0
	bl GetSupportScreenPartnerCount
	cmp r0, #0
	beq _0809B42A
	ldr r1, [r5]
	ldr r2, [r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	strb r6, [r0]
	ldr r0, [r5]
	ldr r2, [r7]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	subs r2, r6, #1
	movs r0, #0x34
	muls r0, r2, r0
	add r0, sb
	ldrb r0, [r0, #5]
	strb r0, [r1, #1]
	ldr r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r7]
	adds r1, r1, r0
	adds r1, #2
	adds r0, r6, #0
	mov r2, sl
	bl GetGlobalSupportListFromSave
	movs r4, #0
	b _0809B41A
	.align 2, 0
_0809B3D4: .4byte 0x0000055B
_0809B3D8: .4byte 0x08BDCE4C
_0809B3DC:
	ldr r0, [r5]
	adds r1, r4, #0
	bl GetSupportScreenPartnerCharId
	ldr r1, [r5]
	ldr r3, [r7]
	lsls r2, r1, #1
	adds r2, r2, r1
	lsls r2, r2, #3
	adds r2, r2, r3
	adds r2, #9
	adds r2, r2, r4
	subs r3, r0, #1
	movs r1, #0x34
	muls r1, r3, r1
	add r1, sb
	ldrb r1, [r1, #5]
	strb r1, [r2]
	add r1, sp, #0x28
	bl MetaSave_HasMetCharacter
	ldr r2, [r5]
	ldr r3, [r7]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r3
	adds r1, #0x10
	adds r1, r1, r4
	strb r0, [r1]
	adds r4, #1
_0809B41A:
	adds r0, r6, #0
	bl GetSupportScreenPartnerCount
	cmp r4, r0
	blt _0809B3DC
	ldr r0, [r5]
	adds r0, #1
	str r0, [r5]
_0809B42A:
	mov r6, r8
	cmp r6, #0xff
	ble _0809B378
_0809B430:
	add sp, #0x90
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0809B440
sub_0809B440: @ 0x0809B440
	push {r4, r5, lr}
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0809B474
	movs r4, #1
_0809B450:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0809B46C
	ldr r0, [r1]
	cmp r0, #0
	beq _0809B46C
	adds r0, r1, #0
	bl GetUnitSMSId
	bl UseUnitSprite
_0809B46C:
	adds r4, #1
	cmp r4, #0x3f
	ble _0809B450
	b _0809B49C
_0809B474:
	movs r4, #0
	ldr r0, _0809B4A8 @ =0x02012BF8
	ldr r0, [r0]
	cmp r4, r0
	bge _0809B49C
	movs r5, #0
_0809B480:
	ldr r0, _0809B4AC @ =0x08CC5798
	ldr r0, [r0]
	adds r0, r5, r0
	ldrb r0, [r0, #1]
	bl GetClassSMSId
	bl UseUnitSprite
	adds r5, #0x18
	adds r4, #1
	ldr r0, _0809B4A8 @ =0x02012BF8
	ldr r0, [r0]
	cmp r4, r0
	blt _0809B480
_0809B49C:
	bl ForceSyncUnitSpriteSheet
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809B4A8: .4byte 0x02012BF8
_0809B4AC: .4byte 0x08CC5798

	thumb_func_start GetTotalSupportLevel
GetTotalSupportLevel: @ 0x0809B4B0
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r6, #0
	movs r4, #0
	ldr r7, _0809B4BC @ =0x08BDCE78
	b _0809B4CC
	.align 2, 0
_0809B4BC: .4byte 0x08BDCE78
_0809B4C0:
	adds r0, r5, #0
	adds r1, r4, #0
	bl GetSupportScreenPartnerSupportLevel
	adds r6, r6, r0
	adds r4, #1
_0809B4CC:
	adds r0, r5, #0
	bl GetSupportScreenCharIdAt
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r7
	ldr r0, [r0]
	ldrb r0, [r0, #0x15]
	cmp r4, r0
	blt _0809B4C0
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start Support_GetSupportLevelTextColor
Support_GetSupportLevelTextColor: @ 0x0809B4EC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r1, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809B508
	adds r0, r6, #0
	bl GetTotalSupportLevel
	cmp r0, #5
	beq _0809B54A
	b _0809B550
_0809B508:
	movs r0, #0
	mov r8, r0
	adds r0, r6, #0
	bl GetTotalSupportLevel
	mov sb, r0
	adds r0, r6, #0
	bl GetSupportScreenCharIdAt
	bl GetSupportScreenPartnerCount
	adds r7, r0, #0
	movs r5, #0
	cmp r8, r7
	bge _0809B546
_0809B526:
	adds r0, r6, #0
	bl GetSupportScreenCharIdAt
	adds r4, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl GetSupportScreenPartnerCharId
	adds r1, r0, #0
	adds r0, r4, #0
	bl GetUnitsAverageSupportValue
	add r8, r0
	adds r5, #1
	cmp r5, r7
	blt _0809B526
_0809B546:
	cmp r8, sb
	bne _0809B54E
_0809B54A:
	movs r0, #2
	b _0809B55A
_0809B54E:
	mov r0, sb
_0809B550:
	cmp r0, #0
	beq _0809B558
	movs r0, #1
	b _0809B55A
_0809B558:
	movs r0, #0
_0809B55A:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0809B568
sub_0809B568: @ 0x0809B568
	push {r4, r5, r6, lr}
	ldr r4, _0809B5E0 @ =0x02012A90
	bl GetTotalSupportCollection
	adds r5, r0, #0
	adds r4, #8
	adds r0, r4, #0
	bl ClearText
	movs r6, #0
	cmp r5, #0x64
	bne _0809B582
	movs r6, #4
_0809B582:
	ldr r0, _0809B5E4 @ =0x000012C9
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	adds r2, r6, #0
	bl Text_InsertDrawString
	adds r0, r4, #0
	movs r1, #0x30
	bl Text_SetCursor
	movs r1, #2
	cmp r5, #0x64
	bne _0809B5A4
	movs r1, #4
_0809B5A4:
	adds r0, r4, #0
	bl Text_SetColor
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawNumberOrBlank
	adds r0, r4, #0
	movs r1, #1
	bl Text_Skip
	movs r2, #0
	cmp r5, #0x64
	bne _0809B5C2
	movs r2, #4
_0809B5C2:
	ldr r3, _0809B5E8 @ =0x0840F420
	adds r0, r4, #0
	movs r1, #0x38
	bl Text_InsertDrawString
	ldr r1, _0809B5EC @ =0x02023108
	adds r0, r4, #0
	bl PutText
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809B5E0: .4byte 0x02012A90
_0809B5E4: .4byte 0x000012C9
_0809B5E8: .4byte 0x0840F420
_0809B5EC: .4byte 0x02023108

	thumb_func_start SupportScreen_OnInit
SupportScreen_OnInit: @ 0x0809B5F0
	movs r1, #0
	str r1, [r0, #0x2c]
	adds r2, r0, #0
	adds r2, #0x40
	strb r1, [r2]
	str r1, [r0, #0x34]
	str r1, [r0, #0x38]
	subs r1, #1
	str r1, [r0, #0x3c]
	bx lr

	thumb_func_start DrawSupportScreenUnitSprites
DrawSupportScreenUnitSprites: @ 0x0809B604
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	bl GetSupportScreenUnitCount
	adds r7, r0, #0
	movs r6, #0
	cmp r6, r7
	bge _0809B65E
_0809B61A:
	adds r0, r6, #0
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #4
	mov r2, r8
	ldr r1, [r2, #0x34]
	subs r1, #0x4c
	subs r5, r0, r1
	adds r0, r6, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r4, r0, #0
	adds r4, #0x18
	adds r0, r5, #0
	subs r0, #0x4c
	cmp r0, #0x30
	bhi _0809B658
	adds r0, r6, #0
	bl GetSupportScreenClassIdAt
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #0xc8
	lsls r3, r3, #8
	bl PutUnitSpriteForClassId
_0809B658:
	adds r6, #1
	cmp r6, r7
	blt _0809B61A
_0809B65E:
	bl SyncUnitSpriteSheet
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0809B670
sub_0809B670: @ 0x0809B670
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x3c]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _0809B6F8
	str r0, [r4, #0x38]
	str r1, [r4, #0x3c]
	movs r1, #3
	bl __divsi3
	adds r1, r0, #0
	ldr r0, [r4, #0x34]
	cmp r0, #0
	bge _0809B692
	adds r0, #0xf
_0809B692:
	asrs r0, r0, #4
	subs r0, r1, r0
	lsls r0, r0, #4
	adds r0, #0x4c
	cmp r0, #0x4c
	bgt _0809B6AC
	cmp r1, #0
	bne _0809B6A6
	str r1, [r4, #0x34]
	b _0809B6AC
_0809B6A6:
	subs r0, r1, #1
	lsls r0, r0, #4
	str r0, [r4, #0x34]
_0809B6AC:
	ldr r0, [r4, #0x38]
	movs r1, #3
	bl __divsi3
	adds r5, r0, #0
	ldr r0, [r4, #0x34]
	cmp r0, #0
	bge _0809B6BE
	adds r0, #0xf
_0809B6BE:
	asrs r0, r0, #4
	subs r0, r5, r0
	lsls r0, r0, #4
	adds r0, #0x4c
	cmp r0, #0x7b
	ble _0809B6F8
	bl GetSupportScreenUnitCount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	cmp r5, r0
	bne _0809B6EA
	bl GetSupportScreenUnitCount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	subs r0, #3
	b _0809B6F4
_0809B6EA:
	ldr r0, [r4, #0x38]
	movs r1, #3
	bl __divsi3
	subs r0, #2
_0809B6F4:
	lsls r0, r0, #4
	str r0, [r4, #0x34]
_0809B6F8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0809B700
sub_0809B700: @ 0x0809B700
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r4, _0809B930 @ =0x03002870
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r4]
	ands r0, r1
	strb r0, [r4]
	movs r0, #0
	bl InitBgs
	movs r0, #0
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r4, #0xc]
	ands r0, r2
	strb r0, [r4, #0xc]
	movs r2, #3
	ldrb r0, [r4, #0x10]
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r5, [r4, #0x14]
	ands r1, r5
	movs r0, #1
	orrs r1, r0
	strb r1, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	orrs r2, r0
	strb r2, [r4, #0x18]
	bl InitFaces
	bl ResetText
	bl InitIcons
	bl LoadUiFrameGraphics
	bl ApplySystemObjectsGraphics
	movs r0, #0xe
	bl ApplyIconPalettes
	adds r0, r7, #0
	bl sub_0809B670
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r1, _0809B934 @ =0x0000FFD8
	ldr r2, [r7, #0x34]
	subs r2, #0x4c
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	bl SetBgOffset
	bl PrepRestartMuralBackground
	bl ApplyUnitSpritePalettes
	bl ResetUnitSprites
	adds r0, r7, #0
	bl sub_0809B440
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_08091944
	ldr r0, _0809B938 @ =0x02023460
	ldr r1, _0809B93C @ =0x0840EBE8
	movs r2, #0xa5
	lsls r2, r2, #7
	bl sub_080AACD8
	movs r0, #7
	bl EnableBgSync
	bl GetSupportScreenUnitCount
	cmp r0, #0
	beq _0809B826
	adds r0, r7, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	ldr r4, [r7, #0x38]
	adds r0, r4, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r5, r0, #0
	adds r5, #0x14
	adds r0, r4, #0
	movs r1, #3
	bl __divsi3
	ldr r1, [r7, #0x34]
	cmp r1, #0
	bge _0809B812
	adds r1, #0xf
_0809B812:
	asrs r1, r1, #4
	subs r1, r0, r1
	lsls r1, r1, #4
	adds r1, #0x4c
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r5, #0
	movs r2, #7
	bl ShowSysHandCursor
_0809B826:
	ldr r1, _0809B930 @ =0x03002870
	mov ip, r1
	movs r6, #0x20
	ldrb r0, [r1, #1]
	orrs r0, r6
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, ip
	strb r0, [r2, #1]
	mov r0, ip
	adds r0, #0x2d
	movs r5, #0
	mov r8, r5
	mov r1, r8
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x31
	movs r0, #0x4c
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x8c
	strb r0, [r1]
	movs r2, #0x34
	add r2, ip
	mov sb, r2
	movs r0, #1
	ldrb r1, [r2]
	orrs r1, r0
	movs r5, #2
	orrs r1, r5
	movs r2, #4
	orrs r1, r2
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	movs r2, #0x36
	add r2, ip
	mov sl, r2
	ldrb r5, [r2]
	orrs r0, r5
	movs r2, #2
	orrs r0, r2
	subs r2, #7
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	orrs r1, r6
	mov r5, sb
	strb r1, [r5]
	orrs r0, r6
	mov r1, sl
	strb r0, [r1]
	mov r1, ip
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x44
	mov r5, r8
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	adds r1, #0xa
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _0809B940 @ =0x0000FFE0
	mov r1, ip
	ldrh r1, [r1, #0x3c]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	mov r2, ip
	strh r0, [r2, #0x3c]
	adds r6, r7, #0
	adds r6, #0x42
	movs r5, #0x43
	adds r5, r5, r7
	mov r8, r5
	ldr r5, _0809B944 @ =0x020129A8
	movs r4, #0xe
_0809B8D8:
	adds r0, r5, #0
	movs r1, #5
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0809B8D8
	ldr r4, _0809B948 @ =0x02012A90
	adds r0, r4, #0
	movs r1, #5
	bl InitText
	adds r4, #8
	adds r0, r4, #0
	movs r1, #9
	bl InitText
	bl sub_0809B568
	movs r3, #0xa
	rsbs r3, r3, #0
	ldr r0, _0809B94C @ =0x00000901
	str r0, [sp]
	movs r0, #0
	movs r1, #0x41
	movs r2, #0x38
	bl StartBmFace
	movs r0, #0x28
	movs r1, #0
	movs r2, #1
	bl InitTalk
	ldr r0, _0809B950 @ =0x08403A48
	ldr r1, _0809B954 @ =0x06017800
	bl Decompress
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #0
	beq _0809B95C
	ldr r0, _0809B958 @ =0x00000F6F
	b _0809B95E
	.align 2, 0
_0809B930: .4byte 0x03002870
_0809B934: .4byte 0x0000FFD8
_0809B938: .4byte 0x02023460
_0809B93C: .4byte 0x0840EBE8
_0809B940: .4byte 0x0000FFE0
_0809B944: .4byte 0x020129A8
_0809B948: .4byte 0x02012A90
_0809B94C: .4byte 0x00000901
_0809B950: .4byte 0x08403A48
_0809B954: .4byte 0x06017800
_0809B958: .4byte 0x00000F6F
_0809B95C:
	ldr r0, _0809B9B0 @ =0x00000FC4
_0809B95E:
	str r0, [r7, #0x30]
	ldr r0, _0809B9B4 @ =DrawSupportScreenUnitSprites
	adds r1, r7, #0
	bl StartParallelWorker
	adds r0, r7, #0
	bl StartMenuScrollBar
	movs r0, #0x80
	lsls r0, r0, #2
	movs r1, #4
	bl InitMenuScrollBarImg
	movs r0, #0xd8
	movs r1, #0x54
	bl PutMenuScrollBarAt
	ldrh r4, [r7, #0x34]
	bl GetSupportScreenUnitCount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #6
	adds r1, r4, #0
	movs r3, #4
	bl UpdateMenuScrollBarConfig
	bl TryHideMenuScrollBar
	ldr r1, [r7, #0x34]
	cmp r1, #0
	bge _0809B9AC
	adds r1, #0xf
_0809B9AC:
	asrs r4, r1, #4
	b _0809B9C2
	.align 2, 0
_0809B9B0: .4byte 0x00000FC4
_0809B9B4: .4byte DrawSupportScreenUnitSprites
_0809B9B8:
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_0809BE80
	adds r4, #1
_0809B9C2:
	ldr r0, [r7, #0x34]
	cmp r0, #0
	bge _0809B9CA
	adds r0, #0xf
_0809B9CA:
	asrs r0, r0, #4
	adds r0, #4
	cmp r4, r0
	blt _0809B9B8
	adds r0, r7, #0
	bl StartGreenText
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
	ldr r0, _0809BA1C @ =0x06014800
	movs r1, #0xa
	bl LoadHelpBoxGfx
	ldr r2, _0809BA20 @ =0x03002870
	movs r0, #1
	ldrb r5, [r2, #1]
	orrs r0, r5
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #0x10
	movs r1, #0x8c
	adds r2, r7, #0
	bl StartHelpPromptSprite
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809BA1C: .4byte 0x06014800
_0809BA20: .4byte 0x03002870

	thumb_func_start sub_0809BA24
sub_0809BA24: @ 0x0809BA24
	push {r4, lr}
	adds r4, r0, #0
	bl EndCgText
	adds r0, r4, #0
	bl EndAllProcChildren
	bl EndMuralBackground_
	movs r0, #0
	bl EndFaceById
	movs r0, #0
	bl SetOnHBlankA
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0809BA48
sub_0809BA48: @ 0x0809BA48
	push {lr}
	sub sp, #0x10
	ldr r0, [r0, #0x30]
	str r0, [sp]
	ldr r0, _0809BA78 @ =0x06013000
	str r0, [sp, #4]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0xa
	movs r1, #7
	movs r2, #0x11
	movs r3, #4
	bl StartCgText
	ldr r0, _0809BA7C @ =0x000008FC
	bl SetCgFlags
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_0809BA78: .4byte 0x06013000
_0809BA7C: .4byte 0x000008FC

	thumb_func_start sub_0809BA80
sub_0809BA80: @ 0x0809BA80
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	bl GetSupportScreenUnitCount
	cmp r0, #0
	bne _0809BA96
	b _0809BDB8
_0809BA96:
	adds r0, r6, #0
	adds r0, #0x40
	movs r4, #0
	ldrsb r4, [r0, r4]
	mov r8, r0
	cmp r4, #0
	beq _0809BAA6
	b _0809BD44
_0809BAA6:
	ldr r0, [r6, #0x38]
	mov sl, r0
	ldr r3, _0809BAF0 @ =0x08B857F8
	ldr r1, [r3]
	ldrh r5, [r1, #6]
	adds r2, r6, #0
	adds r2, #0x41
	movs r0, #4
	strb r0, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r7, [r1, #4]
	ands r0, r7
	cmp r0, #0
	beq _0809BACA
	ldrh r5, [r1, #4]
	movs r0, #8
	strb r0, [r2]
_0809BACA:
	adds r0, r6, #0
	adds r0, #0x43
	movs r1, #0
	ldrsb r1, [r0, r1]
	mov sb, r0
	cmp r1, #0
	beq _0809BAF4
	ldr r1, [r3]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0809BBB4
	bl CloseHelpBox
	mov r0, sb
	strb r4, [r0]
	b _0809BDE0
	.align 2, 0
_0809BAF0: .4byte 0x08B857F8
_0809BAF4:
	ldr r0, [r3]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809BB54
	ldr r7, [r6, #0x38]
	adds r0, r7, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r0, #0x14
	mov r8, r0
	adds r0, r7, #0
	movs r1, #3
	bl __divsi3
	adds r1, r0, #0
	ldr r0, [r6, #0x34]
	cmp r0, #0
	bge _0809BB24
	adds r0, #0xf
_0809BB24:
	asrs r4, r0, #4
	subs r4, r1, r4
	lsls r4, r4, #4
	adds r4, #0x4c
	ldr r5, _0809BB50 @ =0x08BDCE4C
	adds r0, r7, #0
	bl GetSupportScreenCharIdAt
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r5
	ldrh r2, [r0, #2]
	mov r0, r8
	adds r1, r4, #0
	bl StartHelpBox
	movs r0, #1
	mov r1, sb
	strb r0, [r1]
	b _0809BDE0
	.align 2, 0
_0809BB50: .4byte 0x08BDCE4C
_0809BB54:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809BB84
	adds r0, r6, #0
	movs r1, #2
	bl Proc_Goto
	ldr r0, _0809BB7C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0809BB72
	b _0809BDE0
_0809BB72:
	ldr r0, _0809BB80 @ =0x0000038A
	bl m4aSongNumStart
	b _0809BDE0
	.align 2, 0
_0809BB7C: .4byte 0x0202BBF8
_0809BB80: .4byte 0x0000038A
_0809BB84:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809BBB4
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Goto
	ldr r0, _0809BBAC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0809BBA2
	b _0809BDE0
_0809BBA2:
	ldr r0, _0809BBB0 @ =0x0000038B
	bl m4aSongNumStart
	b _0809BDE0
	.align 2, 0
_0809BBAC: .4byte 0x0202BBF8
_0809BBB0: .4byte 0x0000038B
_0809BBB4:
	movs r0, #0x20
	ands r0, r5
	cmp r0, #0
	beq _0809BBCE
	ldr r4, [r6, #0x38]
	adds r0, r4, #0
	movs r1, #3
	bl __modsi3
	cmp r0, #0
	beq _0809BBCE
	subs r0, r4, #1
	str r0, [r6, #0x38]
_0809BBCE:
	movs r0, #0x10
	ands r0, r5
	cmp r0, #0
	beq _0809BBFA
	ldr r4, [r6, #0x38]
	adds r0, r4, #0
	movs r1, #3
	bl __modsi3
	cmp r0, #2
	beq _0809BBFA
	adds r0, r4, #1
	str r0, [r6, #0x38]
	bl GetSupportScreenUnitCount
	ldr r1, [r6, #0x38]
	cmp r1, r0
	blt _0809BBFA
	bl GetSupportScreenUnitCount
	subs r0, #1
	str r0, [r6, #0x38]
_0809BBFA:
	movs r0, #0x40
	ands r0, r5
	cmp r0, #0
	beq _0809BC0C
	ldr r0, [r6, #0x38]
	cmp r0, #2
	ble _0809BC0C
	subs r0, #3
	str r0, [r6, #0x38]
_0809BC0C:
	movs r0, #0x80
	ands r5, r0
	cmp r5, #0
	beq _0809BC26
	ldr r4, [r6, #0x38]
	adds r4, #3
	bl GetSupportScreenUnitCount
	cmp r4, r0
	bge _0809BC26
	ldr r0, [r6, #0x38]
	adds r0, #3
	str r0, [r6, #0x38]
_0809BC26:
	ldr r0, [r6, #0x38]
	cmp sl, r0
	bne _0809BC2E
	b _0809BD3A
_0809BC2E:
	movs r1, #3
	bl __divsi3
	adds r1, r0, #0
	ldr r0, [r6, #0x34]
	cmp r0, #0
	bge _0809BC3E
	adds r0, #0xf
_0809BC3E:
	asrs r0, r0, #4
	subs r0, r1, r0
	lsls r4, r0, #4
	movs r0, #0
	mov r7, r8
	strb r0, [r7]
	ldr r0, _0809BC80 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809BC5C
	ldr r0, _0809BC84 @ =0x00000385
	bl m4aSongNumStart
_0809BC5C:
	cmp r4, #0xf
	bgt _0809BC88
	ldr r1, [r6, #0x34]
	cmp r1, #0
	beq _0809BC88
	cmp r1, #0
	bge _0809BC6C
	adds r1, #0xf
_0809BC6C:
	asrs r1, r1, #4
	subs r1, #1
	adds r0, r6, #0
	bl sub_0809BE80
	movs r0, #0xff
	mov r1, r8
	strb r0, [r1]
	b _0809BCB8
	.align 2, 0
_0809BC80: .4byte 0x0202BBF8
_0809BC84: .4byte 0x00000385
_0809BC88:
	cmp r4, #0x2f
	ble _0809BCCA
	bl GetSupportScreenUnitCount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	subs r0, #3
	lsls r0, r0, #4
	ldr r1, [r6, #0x34]
	cmp r1, r0
	beq _0809BCCA
	cmp r1, #0
	bge _0809BCA8
	adds r1, #0xf
_0809BCA8:
	asrs r1, r1, #4
	adds r1, #4
	adds r0, r6, #0
	bl sub_0809BE80
	movs r0, #1
	mov r7, r8
	strb r0, [r7]
_0809BCB8:
	ldr r0, [r6, #0x38]
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r0, #0x14
	bl SetSysHandCursorXPos
	b _0809BCE4
_0809BCCA:
	ldr r0, [r6, #0x38]
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r0, #0x14
	adds r1, r4, #0
	adds r1, #0x4c
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #7
	bl ShowSysHandCursor
_0809BCE4:
	mov r1, sb
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0809BD3A
	ldr r7, [r6, #0x38]
	adds r0, r7, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r0, #0x14
	mov sb, r0
	adds r0, r7, #0
	movs r1, #3
	bl __divsi3
	ldr r4, [r6, #0x34]
	cmp r4, #0
	bge _0809BD0E
	adds r4, #0xf
_0809BD0E:
	asrs r4, r4, #4
	subs r4, r0, r4
	lsls r4, r4, #4
	mov r1, r8
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	subs r0, #0x4c
	subs r4, r4, r0
	ldr r5, _0809BDB0 @ =0x08BDCE4C
	adds r0, r7, #0
	bl GetSupportScreenCharIdAt
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r5
	ldrh r2, [r0, #2]
	mov r0, sb
	adds r1, r4, #0
	bl StartHelpBox
_0809BD3A:
	mov r7, r8
	movs r0, #0
	ldrsb r0, [r7, r0]
	cmp r0, #0
	beq _0809BDE0
_0809BD44:
	mov r2, r8
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bge _0809BD5A
	adds r1, r6, #0
	adds r1, #0x41
	ldr r0, [r6, #0x34]
	ldrb r1, [r1]
	subs r0, r0, r1
	str r0, [r6, #0x34]
_0809BD5A:
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	ble _0809BD6E
	adds r1, r6, #0
	adds r1, #0x41
	ldr r0, [r6, #0x34]
	ldrb r1, [r1]
	adds r0, r1, r0
	str r0, [r6, #0x34]
_0809BD6E:
	ldr r1, [r6, #0x34]
	movs r0, #0xf
	ands r1, r0
	cmp r1, #0
	bne _0809BD7C
	mov r0, r8
	strb r1, [r0]
_0809BD7C:
	ldrh r4, [r6, #0x34]
	bl GetSupportScreenUnitCount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #6
	adds r1, r4, #0
	movs r3, #4
	bl UpdateMenuScrollBarConfig
	ldr r1, _0809BDB4 @ =0x0000FFD8
	ldr r2, [r6, #0x34]
	subs r2, #0x4c
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl SetBgOffset
	b _0809BDE0
	.align 2, 0
_0809BDB0: .4byte 0x08BDCE4C
_0809BDB4: .4byte 0x0000FFD8
_0809BDB8:
	ldr r0, _0809BDF0 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0809BDE0
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Goto
	ldr r0, _0809BDF4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809BDE0
	ldr r0, _0809BDF8 @ =0x0000038B
	bl m4aSongNumStart
_0809BDE0:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809BDF0: .4byte 0x08B857F8
_0809BDF4: .4byte 0x0202BBF8
_0809BDF8: .4byte 0x0000038B

	thumb_func_start SupportScreen_StartUnitSubMenu
SupportScreen_StartUnitSubMenu: @ 0x0809BDFC
	push {lr}
	adds r2, r0, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r2, #0x38]
	bl StartSupportUnitSubScreen
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0809BE14
sub_0809BE14: @ 0x0809BE14
	push {lr}
	sub sp, #4
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0809BE36
	movs r1, #0x80
	lsls r1, r1, #1
	str r0, [sp]
	movs r0, #0x5a
	movs r2, #0xc0
	movs r3, #0x18
	bl CallSomeSoundMaybe
	b _0809BE48
_0809BE36:
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	str r0, [sp]
	movs r0, #0x49
	adds r1, r2, #0
	movs r3, #0x18
	bl CallSomeSoundMaybe
_0809BE48:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartSupportScreenFromPrepScreen
StartSupportScreenFromPrepScreen: @ 0x0809BE50
	push {lr}
	adds r1, r0, #0
	ldr r0, _0809BE64 @ =0x08CC57F4
	bl SpawnProcLocking
	adds r0, #0x42
	movs r1, #1
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0809BE64: .4byte 0x08CC57F4

	thumb_func_start sub_0809BE68
sub_0809BE68: @ 0x0809BE68
	push {lr}
	adds r1, r0, #0
	ldr r0, _0809BE7C @ =0x08CC57F4
	bl SpawnProcLocking
	adds r0, #0x42
	movs r1, #0
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0809BE7C: .4byte 0x08CC57F4

	thumb_func_start sub_0809BE80
sub_0809BE80: @ 0x0809BE80
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	mov sb, r1
	movs r0, #1
	mov sl, r0
	movs r0, #0
	bl SetTextFontGlyphs
	movs r0, #0
	bl SetTextFont
	mov r1, sb
	lsls r4, r1, #1
	add r4, sb
	adds r0, r4, #0
	movs r1, #0xf
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _0809BEF8 @ =0x020129A8
	adds r5, r0, r1
	movs r7, #0
	adds r6, r4, #0
_0809BEB8:
	adds r0, r5, #0
	bl ClearText
	bl GetSupportScreenUnitCount
	cmp r6, r0
	bge _0809BF4E
	adds r0, r7, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #3
	mov r8, r0
	mov r0, sb
	lsls r4, r0, #1
	movs r0, #0x1f
	ands r4, r0
	ldr r0, [sp]
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r6, #0
	bl Support_GetSupportLevelTextColor
	cmp r0, #1
	beq _0809BF06
	cmp r0, #1
	bgt _0809BEFC
	cmp r0, #0
	beq _0809BF02
	b _0809BF10
	.align 2, 0
_0809BEF8: .4byte 0x020129A8
_0809BEFC:
	cmp r0, #2
	beq _0809BF0C
	b _0809BF10
_0809BF02:
	movs r1, #1
	b _0809BF0E
_0809BF06:
	movs r0, #0
	mov sl, r0
	b _0809BF10
_0809BF0C:
	movs r1, #4
_0809BF0E:
	mov sl, r1
_0809BF10:
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetCursor
	adds r0, r5, #0
	mov r1, sl
	bl Text_SetColor
	adds r0, r6, #0
	bl GetSupportScreenCharIdAt
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	ldr r1, _0809BF70 @ =0x08BDCE4C
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	lsls r1, r4, #5
	add r1, r8
	lsls r1, r1, #1
	ldr r0, _0809BF74 @ =0x02023C60
	adds r1, r1, r0
	adds r0, r5, #0
	bl PutText
_0809BF4E:
	adds r5, #8
	adds r6, #1
	adds r7, #1
	cmp r7, #2
	ble _0809BEB8
	movs r0, #4
	bl EnableBgSync
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809BF70: .4byte 0x08BDCE4C
_0809BF74: .4byte 0x02023C60

	thumb_func_start sub_0809BF78
sub_0809BF78: @ 0x0809BF78
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809BF90 @ =0x08CC57F4
	bl Proc_Find
	cmp r0, #0
	beq _0809BF88
	str r4, [r0, #0x3c]
_0809BF88:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809BF90: .4byte 0x08CC57F4

	thumb_func_start UiSupport_GetSupportTalkSong
UiSupport_GetSupportTalkSong: @ 0x0809BF94
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	bl GetSupportScreenCharIdAt
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	adds r1, r6, #0
	bl GetSupportScreenPartnerCharId
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0
	adds r1, r4, #0
	mov r3, r8
	bl GetSupportTalkSong
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_0809BFCC
sub_0809BFCC: @ 0x0809BFCC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r8, r0
	ldr r2, [r0, #0x34]
	subs r1, r2, #1
	lsls r0, r1, #4
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	movs r1, #0x7e
	subs r1, r1, r0
	movs r0, #0x54
	mov sb, r0
	movs r6, #0
	cmp r6, r2
	bge _0809C028
	ldr r7, _0809C038 @ =0x08CC58D4
	adds r5, r1, #2
	adds r4, r1, #0
_0809BFFA:
	ldr r0, _0809C03C @ =0x0000EF80
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	mov r2, sb
	adds r3, r7, #0
	bl PutSpriteExt
	ldr r0, _0809C040 @ =0x0000FF80
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r2, sb
	adds r3, r7, #0
	bl PutSpriteExt
	adds r5, #0xf
	adds r4, #0xf
	adds r6, #1
	mov r1, r8
	ldr r0, [r1, #0x34]
	cmp r6, r0
	blt _0809BFFA
_0809C028:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809C038: .4byte 0x08CC58D4
_0809C03C: .4byte 0x0000EF80
_0809C040: .4byte 0x0000FF80

	thumb_func_start sub_0809C044
sub_0809C044: @ 0x0809C044
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	ldr r4, _0809C118 @ =0x020129A8
	ldr r0, _0809C11C @ =0x08194714
	movs r1, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r0, r4, #0
	subs r0, #0x18
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	bl GetTacticianName
	adds r1, r4, #0
	adds r4, #8
	ldr r6, _0809C120 @ =0x02023D80
	movs r2, #0
	mov r8, r2
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r1, #0
	adds r1, r6, #0
	movs r2, #4
	movs r3, #0
	bl PutDrawText
	subs r0, r6, #4
	ldr r2, _0809C124 @ =0x081C3AC0
	ldr r5, _0809C128 @ =0x0202BBF8
	adds r7, r5, #0
	adds r7, #0x2b
	ldrb r3, [r7]
	lsrs r1, r3, #4
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	adds r1, #0x79
	movs r2, #0xa0
	lsls r2, r2, #7
	bl PutIcon
	ldrb r7, [r7]
	lsrs r0, r7, #4
	bl sub_080A6DB0
	bl GetMsg
	adds r7, r0, #0
	movs r0, #0x40
	adds r1, r7, #0
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	adds r0, r4, #0
	adds r4, #8
	adds r1, r6, #0
	adds r1, #0xee
	mov r2, r8
	str r2, [sp]
	str r7, [sp, #4]
	movs r2, #4
	bl PutDrawText
	adds r5, #0x2c
	ldrb r5, [r5]
	lsls r0, r5, #0x1f
	lsrs r0, r0, #0x1f
	bl sub_080A6DC0
	bl GetMsg
	adds r7, r0, #0
	movs r0, #0x40
	adds r1, r7, #0
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	movs r0, #0x82
	lsls r0, r0, #1
	adds r6, r6, r0
	mov r2, r8
	str r2, [sp]
	str r7, [sp, #4]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #4
	bl PutDrawText
	movs r0, #0
	bl SetTextFont
	movs r0, #4
	bl EnableBgSync
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809C118: .4byte 0x020129A8
_0809C11C: .4byte 0x08194714
_0809C120: .4byte 0x02023D80
_0809C124: .4byte 0x081C3AC0
_0809C128: .4byte 0x0202BBF8

	thumb_func_start sub_0809C12C
sub_0809C12C: @ 0x0809C12C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809C150 @ =0x0202BBF8
	ldrh r0, [r0, #0x2c]
	lsls r0, r0, #0x13
	lsrs r0, r0, #0x17
	movs r1, #0xc
	bl __divsi3
	cmp r0, #0xa
	ble _0809C144
	movs r0, #0xa
_0809C144:
	str r0, [r4, #0x34]
	movs r0, #0
	str r0, [r4, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809C150: .4byte 0x0202BBF8

	thumb_func_start sub_0809C154
sub_0809C154: @ 0x0809C154
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	mov r8, r0
	ldr r7, _0809C310 @ =0x03002870
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r7]
	ands r0, r1
	strb r0, [r7]
	movs r0, #0
	bl InitBgs
	movs r0, #0
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r7, #0xc]
	ands r0, r2
	strb r0, [r7, #0xc]
	movs r2, #3
	ldrb r0, [r7, #0x10]
	orrs r0, r2
	strb r0, [r7, #0x10]
	ldrb r3, [r7, #0x14]
	ands r1, r3
	strb r1, [r7, #0x14]
	ldrb r6, [r7, #0x18]
	orrs r2, r6
	strb r2, [r7, #0x18]
	bl InitFaces
	bl ResetText
	bl InitIcons
	bl ApplySystemObjectsGraphics
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #4
	bl ApplyIconPalettes
	bl PrepRestartMuralBackground
	ldr r0, _0809C314 @ =0x0841629C
	ldr r1, _0809C318 @ =0x06000400
	bl Decompress
	ldr r0, _0809C31C @ =0x0841627C
	movs r1, #0xf0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #0
	str r0, [sp, #8]
	ldr r4, _0809C320 @ =0x02020140
	ldr r2, _0809C324 @ =0x01000110
	add r0, sp, #8
	adds r1, r4, #0
	bl CpuFastSet
	ldr r1, _0809C328 @ =0x08418818
	ldr r2, _0809C32C @ =0x0000F020
	adds r0, r4, #0
	bl TmApplyTsa_t
	adds r4, #0x40
	ldr r1, _0809C330 @ =0x02023460
	movs r2, #0x88
	lsls r2, r2, #1
	adds r0, r4, #0
	bl CpuFastSet
	movs r0, #7
	bl EnableBgSync
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r7, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	adds r1, r7, #0
	adds r1, #0x2d
	movs r0, #0x80
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xe0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	movs r2, #0x34
	adds r2, r2, r7
	mov sb, r2
	movs r0, #1
	ldrb r1, [r2]
	orrs r1, r0
	movs r5, #2
	orrs r1, r5
	movs r2, #4
	orrs r1, r2
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	movs r6, #0x36
	ldrb r2, [r6, r7]
	orrs r0, r2
	orrs r0, r5
	movs r2, #5
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	movs r2, #0x20
	orrs r1, r2
	mov r3, sb
	strb r1, [r3]
	orrs r0, r2
	strb r0, [r6, r7]
	adds r1, r7, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r6, [r1]
	ands r0, r6
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x44
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r4, _0809C334 @ =0x02012990
	ldr r1, _0809C338 @ =0x06004000
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r4, #0
	movs r3, #0
	bl InitTextFont
	adds r0, r4, #0
	bl SetTextFont
	add r6, sp, #0xc
	adds r4, #0x18
	movs r5, #0xb
_0809C2D0:
	adds r0, r4, #0
	movs r1, #8
	bl InitText
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _0809C2D0
	ldr r0, _0809C33C @ =0x02012A90
	movs r1, #8
	bl InitText
	movs r0, #0
	bl SetTextFont
	bl sub_0809C044
	ldr r0, _0809C340 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _0809C344
	movs r3, #0x81
	lsls r3, r3, #1
	movs r0, #0
	str r0, [sp]
	movs r0, #0x29
	movs r1, #0xd8
	movs r2, #0x58
	bl StartTalkFace
	b _0809C356
	.align 2, 0
_0809C310: .4byte 0x03002870
_0809C314: .4byte 0x0841629C
_0809C318: .4byte 0x06000400
_0809C31C: .4byte 0x0841627C
_0809C320: .4byte 0x02020140
_0809C324: .4byte 0x01000110
_0809C328: .4byte 0x08418818
_0809C32C: .4byte 0x0000F020
_0809C330: .4byte 0x02023460
_0809C334: .4byte 0x02012990
_0809C338: .4byte 0x06004000
_0809C33C: .4byte 0x02012A90
_0809C340: .4byte 0x0202BBF8
_0809C344:
	movs r3, #0x81
	lsls r3, r3, #1
	movs r0, #0
	str r0, [sp]
	movs r0, #0x32
	movs r1, #0xd8
	movs r2, #0x58
	bl StartTalkFace
_0809C356:
	movs r0, #0
	movs r1, #0
	movs r2, #1
	bl InitTalk
	ldr r0, _0809C3C4 @ =0x0840E830
	ldr r1, _0809C3C8 @ =0x06017000
	bl Decompress
	movs r4, #0
	str r4, [sp, #0xc]
	ldr r1, _0809C3CC @ =0x02022C20
	ldr r2, _0809C3D0 @ =0x01000008
	adds r0, r6, #0
	bl CpuFastSet
	ldr r0, _0809C3D4 @ =0x0840E978
	movs r1, #0xf8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0809C3D8 @ =sub_0809BFCC
	mov r1, r8
	bl StartParallelWorker
	ldr r0, _0809C3DC @ =0x08418C54
	ldr r1, _0809C3E0 @ =0x06017800
	bl Decompress
	ldr r0, _0809C3E4 @ =0x08418D40
	movs r1, #0xe8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0809C3E8 @ =0x08418D60
	ldr r3, _0809C3EC @ =0x0000DBC0
	str r4, [sp]
	movs r1, #0xd
	str r1, [sp, #4]
	movs r1, #0x86
	movs r2, #0x6c
	bl StartSpriteAnimProc
	ldr r0, _0809C3F0 @ =0x00000FC3
	mov r1, r8
	str r0, [r1, #0x30]
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809C3C4: .4byte 0x0840E830
_0809C3C8: .4byte 0x06017000
_0809C3CC: .4byte 0x02022C20
_0809C3D0: .4byte 0x01000008
_0809C3D4: .4byte 0x0840E978
_0809C3D8: .4byte sub_0809BFCC
_0809C3DC: .4byte 0x08418C54
_0809C3E0: .4byte 0x06017800
_0809C3E4: .4byte 0x08418D40
_0809C3E8: .4byte 0x08418D60
_0809C3EC: .4byte 0x0000DBC0
_0809C3F0: .4byte 0x00000FC3

	thumb_func_start sub_0809C3F4
sub_0809C3F4: @ 0x0809C3F4
	push {r4, lr}
	adds r4, r0, #0
	bl EndEachSpriteAnimProc
	bl EndCgText
	adds r0, r4, #0
	bl EndAllProcChildren
	bl EndMuralBackground_
	movs r0, #0
	bl EndFaceById
	movs r0, #0
	bl SetOnHBlankA
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0809C41C
sub_0809C41C: @ 0x0809C41C
	push {lr}
	sub sp, #0x10
	ldr r0, [r0, #0x30]
	str r0, [sp]
	ldr r0, _0809C448 @ =0x06011000
	str r0, [sp, #4]
	movs r0, #0xa
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x13
	movs r2, #0x12
	movs r3, #4
	bl StartCgText
	movs r0, #0x4e
	bl SetCgFlags
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_0809C448: .4byte 0x06011000

	thumb_func_start sub_0809C44C
sub_0809C44C: @ 0x0809C44C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08088A90
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809C462
	adds r0, r4, #0
	bl Proc_Break
	b _0809C488
_0809C462:
	ldr r0, _0809C490 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0809C488
	adds r0, r4, #0
	bl Proc_Break
	ldr r0, _0809C494 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809C488
	ldr r0, _0809C498 @ =0x0000038B
	bl m4aSongNumStart
_0809C488:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809C490: .4byte 0x08B857F8
_0809C494: .4byte 0x0202BBF8
_0809C498: .4byte 0x0000038B

	thumb_func_start sub_0809C49C
sub_0809C49C: @ 0x0809C49C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r0, #0
	ldr r1, _0809C510 @ =0x02023460
	mov sl, r1
	ldr r6, _0809C514 @ =0x02023C60
	mov sb, r6
	ldr r7, _0809C518 @ =0x02012BFC
	ldr r1, _0809C51C @ =0x02022C60
	mov r8, r1
	movs r6, #0x80
	lsls r6, r6, #4
	adds r6, r6, r7
	mov ip, r6
_0809C4C0:
	adds r1, r0, #1
	str r1, [sp]
	lsls r0, r0, #1
	ldr r6, _0809C520 @ =0x02013BFC
	adds r4, r0, r6
	adds r3, r0, r7
	adds r2, r0, #0
	movs r5, #0x13
_0809C4D0:
	mov r1, r8
	adds r0, r2, r1
	ldrh r0, [r0]
	strh r0, [r3]
	mov r6, ip
	adds r1, r2, r6
	mov r6, sl
	adds r0, r2, r6
	ldrh r0, [r0]
	strh r0, [r1]
	mov r1, sb
	adds r0, r2, r1
	ldrh r0, [r0]
	strh r0, [r4]
	adds r4, #0x40
	adds r3, #0x40
	adds r2, #0x40
	subs r5, #1
	cmp r5, #0
	bge _0809C4D0
	ldr r0, [sp]
	cmp r0, #0x1d
	ble _0809C4C0
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809C510: .4byte 0x02023460
_0809C514: .4byte 0x02023C60
_0809C518: .4byte 0x02012BFC
_0809C51C: .4byte 0x02022C60
_0809C520: .4byte 0x02013BFC

	thumb_func_start GetSupportScreenPartnerCount
GetSupportScreenPartnerCount: @ 0x0809C524
	ldr r2, _0809C53C @ =0x08BDCE4C
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r2, #0x2c
	adds r0, r0, r2
	ldr r0, [r0]
	cmp r0, #0
	beq _0809C540
	ldrb r0, [r0, #0x15]
	b _0809C542
	.align 2, 0
_0809C53C: .4byte 0x08BDCE4C
_0809C540:
	movs r0, #0
_0809C542:
	bx lr

	thumb_func_start sub_0809C544
sub_0809C544: @ 0x0809C544
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r1, [r6, #0x30]
	adds r1, #0x80
	ldr r5, _0809C634 @ =0x000001FF
	ands r1, r5
	ldr r3, _0809C638 @ =0x08CC593C
	movs r4, #0xe0
	lsls r4, r4, #2
	str r4, [sp]
	movs r0, #4
	movs r2, #0xa
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, #0xa8
	ands r1, r5
	ldr r3, _0809C63C @ =0x08CC5944
	str r4, [sp]
	movs r0, #4
	movs r2, #0xa
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, #0xc8
	ands r1, r5
	ldr r3, _0809C640 @ =0x08CC5952
	str r4, [sp]
	movs r0, #4
	movs r2, #0xa
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, #0x20
	ands r1, r5
	ldr r3, _0809C644 @ =0x08CC5960
	ldr r4, _0809C648 @ =0x0000E280
	str r4, [sp]
	movs r0, #4
	movs r2, #0x50
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, #0xa0
	ands r1, r5
	ldr r3, _0809C64C @ =0x08CC596E
	str r4, [sp]
	movs r0, #4
	movs r2, #0x90
	bl PutSpriteExt
	ldr r0, [r6, #0x30]
	adds r7, r0, #0
	adds r7, #0x70
	ands r7, r5
	ldr r0, [r6, #0x34]
	adds r2, r0, #0
	adds r2, #0x16
	movs r4, #0
	adds r0, r6, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r4, r0
	bge _0809C60E
	adds r5, r2, #0
_0809C5C8:
	movs r3, #0xc0
	lsls r3, r3, #8
	adds r0, r6, #0
	adds r0, #0x40
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809C5DC
	movs r3, #0xd0
	lsls r3, r3, #8
_0809C5DC:
	cmp r0, #2
	bne _0809C5E4
	movs r3, #0xf0
	lsls r3, r3, #8
_0809C5E4:
	movs r1, #0xc0
	lsls r1, r1, #4
	adds r0, r1, #0
	orrs r3, r0
	adds r0, r6, #0
	adds r0, #0x4e
	adds r0, r0, r4
	ldrb r0, [r0]
	str r0, [sp]
	movs r0, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl PutUnitSpriteForClassId
	adds r5, #0x10
	adds r4, #1
	adds r0, r6, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r4, r0
	blt _0809C5C8
_0809C60E:
	ldr r1, [r6, #0x30]
	adds r1, #8
	ldr r0, _0809C634 @ =0x000001FF
	ands r1, r0
	ldr r3, _0809C650 @ =0x08CC4FC4
	movs r0, #0xaf
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r2, #0x90
	bl PutSpriteExt
	bl SyncUnitSpriteSheet
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809C634: .4byte 0x000001FF
_0809C638: .4byte 0x08CC593C
_0809C63C: .4byte 0x08CC5944
_0809C640: .4byte 0x08CC5952
_0809C644: .4byte 0x08CC5960
_0809C648: .4byte 0x0000E280
_0809C64C: .4byte 0x08CC596E
_0809C650: .4byte 0x08CC4FC4

	thumb_func_start DrawSupportSubScreenUnitPartnerText
DrawSupportSubScreenUnitPartnerText: @ 0x0809C654
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	mov sb, r0
	mov sl, r1
	add r1, sp, #8
	ldr r0, _0809C6E8 @ =0x0840F424
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	mov r0, sb
	adds r0, #0x40
	mov r1, sl
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, #0
	bne _0809C6F0
	movs r5, #0
	lsls r1, r1, #1
	mov r8, r1
	mov r0, r8
	adds r0, #3
	lsls r0, r0, #5
	adds r0, #0x10
	ldr r1, _0809C6EC @ =0x02023C60
	lsls r0, r0, #1
	adds r4, r0, r1
_0809C68E:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x14
	bl PutSpecialChar
	adds r4, #2
	adds r5, #1
	cmp r5, #4
	ble _0809C68E
	movs r5, #0
	mov r0, r8
	adds r0, #3
	lsls r0, r0, #5
	adds r0, #0x16
	ldr r1, _0809C6EC @ =0x02023C60
	lsls r0, r0, #1
	adds r4, r0, r1
_0809C6B0:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x14
	bl PutSpecialChar
	adds r4, #2
	adds r5, #1
	cmp r5, #1
	ble _0809C6B0
	movs r5, #0
	mov r0, r8
	adds r0, #3
	lsls r0, r0, #5
	adds r0, #0x19
	ldr r1, _0809C6EC @ =0x02023C60
	lsls r0, r0, #1
	adds r4, r0, r1
_0809C6D2:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x14
	bl PutSpecialChar
	adds r4, #2
	adds r5, #1
	cmp r5, #2
	ble _0809C6D2
	b _0809C830
	.align 2, 0
_0809C6E8: .4byte 0x0840F424
_0809C6EC: .4byte 0x02023C60
_0809C6F0:
	movs r7, #0
	mov r2, sb
	ldr r0, [r2, #0x2c]
	bl GetSupportScreenCharIdAt
	str r0, [sp, #0x14]
	mov r3, sb
	ldr r0, [r3, #0x2c]
	mov r1, sl
	bl GetSupportScreenPartnerCharId
	str r0, [sp, #0x18]
	ldrb r4, [r4]
	cmp r4, #2
	bne _0809C710
	movs r7, #1
_0809C710:
	mov r4, sb
	ldr r0, [r4, #0x2c]
	mov r1, sl
	bl GetSupportScreenPartnerCharId
	subs r0, #1
	movs r6, #0x34
	muls r0, r6, r0
	ldr r1, _0809C7A0 @ =0x08BDCE4C
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetMsg
	mov r2, sl
	lsls r2, r2, #1
	mov r8, r2
	mov r4, r8
	adds r4, #3
	lsls r3, r4, #5
	str r3, [sp, #0x1c]
	lsls r4, r4, #6
	ldr r5, _0809C7A4 @ =0x02023C80
	adds r1, r4, r5
	movs r2, #5
	str r2, [sp]
	str r0, [sp, #4]
	movs r0, #0
	adds r2, r7, #0
	movs r3, #0
	bl PutDrawText
	adds r5, #0xc
	adds r4, r4, r5
	mov r1, sb
	ldr r0, [r1, #0x2c]
	mov r1, sl
	bl GetSupportScreenPartnerCharId
	subs r0, #1
	muls r0, r6, r0
	ldr r2, _0809C7A0 @ =0x08BDCE4C
	adds r0, r0, r2
	ldrb r1, [r0, #9]
	adds r1, #0x79
	movs r2, #0xe0
	lsls r2, r2, #8
	adds r0, r4, #0
	bl PutIcon
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	bl GetUnitsAverageSupportValue
	cmp r0, #2
	bne _0809C7EC
	movs r5, #0
	mov r0, sb
	adds r0, #0x47
	mov r3, sl
	adds r6, r0, r3
	ldr r0, [sp, #0x1c]
	adds r0, #0x19
	add r4, sp, #8
	mov sb, r4
	lsls r4, r0, #1
_0809C792:
	movs r7, #1
	ldrb r0, [r6]
	cmp r0, #2
	bne _0809C7A8
	movs r7, #4
	b _0809C7B0
	.align 2, 0
_0809C7A0: .4byte 0x08BDCE4C
_0809C7A4: .4byte 0x02023C80
_0809C7A8:
	ldrb r1, [r6]
	cmp r1, r5
	ble _0809C7B0
	movs r7, #0
_0809C7B0:
	ldr r3, _0809C7E8 @ =0x02023C60
	adds r0, r4, r3
	mov r1, sb
	adds r1, #4
	mov sb, r1
	subs r1, #4
	ldm r1!, {r2}
	adds r1, r7, #0
	str r3, [sp, #0x20]
	bl PutSpecialChar
	adds r4, #2
	adds r5, #1
	ldr r3, [sp, #0x20]
	cmp r5, #1
	ble _0809C792
	mov r0, r8
	adds r0, #3
	lsls r0, r0, #6
	adds r1, r3, #0
	adds r1, #0x36
	adds r0, r0, r1
	movs r1, #1
	movs r2, #0x14
	bl PutSpecialChar
	b _0809C830
	.align 2, 0
_0809C7E8: .4byte 0x02023C60
_0809C7EC:
	movs r5, #0
	mov r0, sb
	adds r0, #0x47
	mov r2, sl
	adds r6, r0, r2
	ldr r0, [sp, #0x1c]
	adds r0, #0x19
	add r3, sp, #8
	mov r8, r3
	lsls r4, r0, #1
_0809C800:
	movs r7, #1
	ldrb r0, [r6]
	cmp r0, #3
	bne _0809C80C
	movs r7, #4
	b _0809C814
_0809C80C:
	ldrb r1, [r6]
	cmp r1, r5
	ble _0809C814
	movs r7, #0
_0809C814:
	ldr r0, _0809C840 @ =0x02023C60
	adds r0, r4, r0
	mov r3, r8
	adds r3, #4
	mov r8, r3
	subs r3, #4
	ldm r3!, {r2}
	adds r1, r7, #0
	bl PutSpecialChar
	adds r4, #2
	adds r5, #1
	cmp r5, #2
	ble _0809C800
_0809C830:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809C840: .4byte 0x02023C60

	thumb_func_start DrawSupportSubScreenRemainingText
DrawSupportSubScreenRemainingText: @ 0x0809C844
	push {r4, r5, r6, lr}
	sub sp, #0x20
	adds r5, r0, #0
	ldr r1, _0809C914 @ =0x06015000
	mov r0, sp
	movs r2, #0xe
	bl InitSpriteTextFont
	ldr r0, _0809C918 @ =0x08194674
	movs r1, #0xf0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	add r6, sp, #0x18
	adds r0, r6, #0
	bl InitSpriteText
	mov r0, sp
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r0, r6, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	ldr r4, _0809C91C @ =0x08BDCE4C
	ldr r0, [r5, #0x2c]
	bl GetSupportScreenCharIdAt
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r4
	ldrh r0, [r0]
	bl GetMsg
	adds r4, r0, #0
	movs r0, #0x30
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r6, #0
	movs r2, #0
	adds r3, r4, #0
	bl Text_InsertDrawString
	movs r4, #0
	adds r5, #0x3d
	ldrb r0, [r5]
	cmp r0, #0
	bne _0809C8B4
	movs r4, #1
_0809C8B4:
	movs r0, #0x94
	lsls r0, r0, #5
	bl GetMsg
	adds r3, r0, #0
	adds r0, r6, #0
	movs r1, #0x30
	adds r2, r4, #0
	bl Text_InsertDrawString
	movs r4, #0
	ldrb r0, [r5]
	cmp r0, #0
	bne _0809C8D2
	movs r4, #1
_0809C8D2:
	ldr r0, _0809C920 @ =0x00001281
	bl GetMsg
	adds r3, r0, #0
	adds r0, r6, #0
	movs r1, #0x60
	adds r2, r4, #0
	bl Text_InsertDrawString
	adds r0, r6, #0
	movs r1, #0x70
	bl Text_SetCursor
	ldrb r0, [r5]
	movs r1, #2
	cmp r0, #0
	bne _0809C8F6
	movs r1, #1
_0809C8F6:
	adds r0, r6, #0
	bl Text_SetColor
	ldrb r1, [r5]
	adds r0, r6, #0
	bl Text_DrawNumberOrBlank
	movs r0, #0
	bl SetTextFont
	add sp, #0x20
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809C914: .4byte 0x06015000
_0809C918: .4byte 0x08194674
_0809C91C: .4byte 0x08BDCE4C
_0809C920: .4byte 0x00001281

	thumb_func_start InitSupportSubScreenPartners
InitSupportSubScreenPartners: @ 0x0809C924
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0809C9B0
	movs r4, #0
	adds r0, r6, #0
	adds r0, #0x3c
	mov r8, r0
	ldrb r0, [r0]
	cmp r4, r0
	bge _0809C9FA
	movs r1, #0x40
	adds r1, r1, r6
	mov sl, r1
_0809C950:
	ldr r0, [r6, #0x2c]
	adds r1, r4, #0
	bl GetSupportScreenPartnerCharId
	adds r7, r0, #0
	mov r2, sl
	adds r1, r2, r4
	movs r0, #0
	strb r0, [r1]
	movs r5, #1
	adds r4, #1
	mov sb, r4
	adds r4, r1, #0
_0809C96A:
	adds r0, r5, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0809C99E
	ldr r0, [r1]
	cmp r0, #0
	beq _0809C99E
	ldrb r0, [r0, #4]
	cmp r0, r7
	bne _0809C99E
	ldr r1, [r1, #0xc]
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	bne _0809C99E
	movs r0, #4
	ands r1, r0
	cmp r1, #0
	beq _0809C99A
	movs r0, #2
	b _0809C99C
_0809C99A:
	movs r0, #1
_0809C99C:
	strb r0, [r4]
_0809C99E:
	adds r5, #1
	cmp r5, #0x3f
	ble _0809C96A
	mov r4, sb
	mov r0, r8
	ldrb r0, [r0]
	cmp r4, r0
	blt _0809C950
	b _0809C9FA
_0809C9B0:
	adds r1, r6, #0
	adds r1, #0x3b
	strb r0, [r1]
	movs r4, #0
	adds r0, r6, #0
	adds r0, #0x3c
	mov r8, r0
	ldrb r2, [r0]
	cmp r4, r2
	bge _0809C9FA
	adds r7, r1, #0
_0809C9C6:
	adds r0, r6, #0
	adds r0, #0x40
	adds r5, r0, r4
	movs r0, #0
	strb r0, [r5]
	ldr r0, [r6, #0x2c]
	adds r1, r4, #0
	bl GetSupportScreenPartnerIsAlive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809C9F0
	movs r0, #1
	strb r0, [r5]
	ldr r0, [r6, #0x2c]
	adds r1, r4, #0
	bl GetSupportScreenPartnerSupportLevel
	ldrb r1, [r7]
	adds r0, r1, r0
	strb r0, [r7]
_0809C9F0:
	adds r4, #1
	mov r2, r8
	ldrb r2, [r2]
	cmp r4, r2
	blt _0809C9C6
_0809C9FA:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0809CA08
sub_0809CA08: @ 0x0809CA08
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r4, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	cmp r4, r1
	bge _0809CA30
	adds r7, r5, #0
	adds r7, #0x47
	adds r6, r0, #0
_0809CA1C:
	ldr r0, [r5, #0x2c]
	adds r1, r4, #0
	bl GetSupportScreenPartnerSupportLevel
	adds r1, r7, r4
	strb r0, [r1]
	adds r4, #1
	ldrb r0, [r6]
	cmp r4, r0
	blt _0809CA1C
_0809CA30:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0809CA38
sub_0809CA38: @ 0x0809CA38
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	adds r0, #0x38
	movs r5, #0
	ldrsb r5, [r0, r5]
	cmp r5, #0
	beq _0809CA5E
	ldr r0, [r4, #0x2c]
	bl GetTotalSupportLevel
	movs r1, #5
	subs r1, r1, r0
	adds r0, r4, #0
	adds r0, #0x3d
	strb r1, [r0]
	b _0809CAAC
_0809CA5E:
	ldr r0, [r4, #0x2c]
	bl GetSupportScreenCharIdAt
	mov sb, r0
	adds r1, r4, #0
	adds r1, #0x3d
	strb r5, [r1]
	movs r5, #0
	adds r0, r4, #0
	adds r0, #0x3c
	mov r8, r1
	adds r7, r0, #0
	ldrb r0, [r7]
	cmp r5, r0
	bge _0809CA9C
	mov r6, r8
_0809CA7E:
	ldr r0, [r4, #0x2c]
	adds r1, r5, #0
	bl GetSupportScreenPartnerCharId
	adds r1, r0, #0
	mov r0, sb
	bl GetUnitsAverageSupportValue
	ldrb r1, [r6]
	adds r0, r1, r0
	strb r0, [r6]
	adds r5, #1
	ldrb r2, [r7]
	cmp r5, r2
	blt _0809CA7E
_0809CA9C:
	ldr r0, [r4, #0x2c]
	bl GetTotalSupportLevel
	mov r1, r8
	ldrb r1, [r1]
	subs r0, r1, r0
	mov r2, r8
	strb r0, [r2]
_0809CAAC:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0809CAB8
sub_0809CAB8: @ 0x0809CAB8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl ResetUnitSprites
	movs r4, #0
	b _0809CAE0
_0809CAC4:
	ldr r0, [r5, #0x2c]
	adds r1, r4, #0
	bl GetSupportScreenPartnerClassId
	adds r1, r5, #0
	adds r1, #0x4e
	adds r1, r1, r4
	strb r0, [r1]
	ldrb r0, [r1]
	bl GetClassSMSId
	bl UseUnitSprite
	adds r4, #1
_0809CAE0:
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r4, r0
	blt _0809CAC4
	bl ForceSyncUnitSpriteSheet
	movs r4, #0
	adds r0, r5, #0
	adds r0, #0x3c
	adds r6, r0, #0
	b _0809CB02
_0809CAF8:
	adds r0, r5, #0
	adds r1, r4, #0
	bl DrawSupportSubScreenUnitPartnerText
	adds r4, #1
_0809CB02:
	ldrb r0, [r6]
	cmp r4, r0
	blt _0809CAF8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0809CB10
sub_0809CB10: @ 0x0809CB10
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
_0809CB18:
	cmp r5, #0
	blt _0809CB84
	adds r0, r7, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	subs r0, #1
	cmp r5, r0
	bgt _0809CB84
	adds r1, r7, #0
	adds r1, #0x40
	adds r1, r1, r5
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0809CB80
	ldr r0, [r7, #0x2c]
	adds r1, r5, #0
	bl GetSupportScreenPartnerSupportLevel
	cmp r0, #0
	ble _0809CB80
	adds r6, r7, #0
	adds r6, #0x39
	movs r1, #0xe3
	ldrb r0, [r6]
	ands r1, r0
	movs r2, #7
	adds r0, r5, #0
	ands r0, r2
	lsls r0, r0, #2
	adds r1, r1, r0
	strb r1, [r6]
	movs r4, #3
	ands r4, r1
	ldr r0, [r7, #0x2c]
	adds r1, r5, #0
	bl GetSupportScreenPartnerSupportLevel
	cmp r4, r0
	blt _0809CB84
	ldr r0, [r7, #0x2c]
	adds r1, r5, #0
	bl GetSupportScreenPartnerSupportLevel
	movs r1, #0xfc
	ldrb r2, [r6]
	ands r1, r2
	subs r0, #1
	adds r1, r1, r0
	strb r1, [r6]
	b _0809CB84
_0809CB80:
	adds r5, r5, r4
	b _0809CB18
_0809CB84:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0809CB8C
sub_0809CB8C: @ 0x0809CB8C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4, #0x30]
	str r0, [r4, #0x34]
	adds r2, r4, #0
	adds r2, #0x39
	movs r0, #0xfc
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0xe3
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r4, #0x2c]
	bl GetSupportScreenCharIdAt
	bl GetSupportScreenPartnerCount
	adds r1, r4, #0
	adds r1, #0x3c
	strb r0, [r1]
	adds r0, r4, #0
	bl InitSupportSubScreenPartners
	adds r0, r4, #0
	bl sub_0809CA08
	adds r0, r4, #0
	bl sub_0809CA38
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	bl sub_0809CB10
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0809CBD8
sub_0809CBD8: @ 0x0809CBD8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r3, _0809CC2C @ =0x02022BE0
	adds r5, r3, #0
	adds r5, #0x20
	movs r0, #0x1f
	mov r8, r0
	movs r7, #0xf8
	lsls r7, r7, #2
	movs r6, #0xf8
	lsls r6, r6, #7
	movs r4, #0xf
	movs r0, #0x1f
	mov ip, r0
_0809CBF6:
	ldrh r2, [r3]
	mov r1, ip
	ands r1, r2
	lsrs r1, r1, #1
	mov r0, r8
	ands r1, r0
	adds r0, r7, #0
	ands r0, r2
	lsrs r0, r0, #1
	ands r0, r7
	adds r1, r1, r0
	adds r0, r6, #0
	ands r0, r2
	lsrs r0, r0, #1
	ands r0, r6
	adds r1, r1, r0
	strh r1, [r5]
	adds r5, #2
	adds r3, #2
	subs r4, #1
	cmp r4, #0
	bge _0809CBF6
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809CC2C: .4byte 0x02022BE0

	thumb_func_start sub_0809CC30
sub_0809CC30: @ 0x0809CC30
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, _0809CDB4 @ =0x03002870
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r4]
	ands r0, r1
	strb r0, [r4]
	movs r0, #0
	bl InitBgs
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r4, #0xc]
	ands r0, r2
	movs r3, #1
	orrs r0, r3
	strb r0, [r4, #0xc]
	movs r2, #3
	ldrb r0, [r4, #0x10]
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	orrs r1, r3
	strb r1, [r4, #0x14]
	ldrb r1, [r4, #0x18]
	orrs r2, r1
	strb r2, [r4, #0x18]
	bl ResetText
	bl InitIcons
	bl LoadUiFrameGraphics
	bl ApplySystemObjectsGraphics
	bl ApplyUnitSpritePalettes
	bl sub_0809CBD8
	movs r0, #0xd
	bl ApplyIconPalettes
	adds r0, r5, #0
	bl StartGreenText
	adds r0, r5, #0
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0809CCFC
	ldr r2, _0809CDB8 @ =0x0202BBF8
	adds r2, #0x40
	movs r0, #0x61
	rsbs r0, r0, #0
	ldrb r4, [r2]
	ands r0, r4
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	adds r0, r5, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	movs r0, #1
	bl ConfigSysHandCursorShadowEnabled
	adds r1, r5, #0
	adds r1, #0x3a
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809CCFC
	adds r0, r5, #0
	adds r0, #0x39
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	lsls r0, r0, #3
	adds r0, #0xc4
	lsrs r1, r1, #2
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x18
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #1
	bl ShowSysHandCursor
_0809CCFC:
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r3, _0809CDB4 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r6, #0
	strb r6, [r0]
	adds r0, #1
	strb r6, [r0]
	adds r0, #1
	strb r6, [r0]
	ldr r0, _0809CDBC @ =0x0000FFE0
	ldrh r4, [r3, #0x3c]
	ands r0, r4
	ldr r1, _0809CDC0 @ =0x0000E0FF
	ands r0, r1
	movs r4, #0x80
	lsls r4, r4, #4
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r1, #0x21
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r4, [r2]
	ands r0, r4
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x3d
	ldrb r2, [r0]
	ands r1, r2
	strb r1, [r0]
	bl PrepRestartMuralBackground
	movs r0, #0x80
	lsls r0, r0, #7
	movs r1, #5
	bl sub_08091944
	ldr r0, _0809CDC4 @ =0x02023460
	ldr r1, _0809CDC8 @ =0x0840ECC4
	movs r2, #0xa4
	lsls r2, r2, #7
	bl sub_080AACD8
	ldr r4, _0809CDCC @ =0x08BDCE4C
	ldr r0, [r5, #0x2c]
	bl GetSupportScreenCharIdAt
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r4
	ldrh r4, [r0, #6]
	adds r0, r4, #0
	bl ShouldFaceBeRaised
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809CDD0
	adds r0, r5, #0
	adds r0, #0x3f
	strb r6, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x38
	movs r3, #0
	bl StartBmFace
	b _0809CDE8
	.align 2, 0
_0809CDB4: .4byte 0x03002870
_0809CDB8: .4byte 0x0202BBF8
_0809CDBC: .4byte 0x0000FFE0
_0809CDC0: .4byte 0x0000E0FF
_0809CDC4: .4byte 0x02023460
_0809CDC8: .4byte 0x0840ECC4
_0809CDCC: .4byte 0x08BDCE4C
_0809CDD0:
	adds r1, r5, #0
	adds r1, #0x3f
	movs r0, #8
	strb r0, [r1]
	adds r0, #0xfc
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x38
	movs r3, #8
	bl StartBmFace
_0809CDE8:
	ldr r0, _0809CE20 @ =0x0840EDB8
	ldr r1, _0809CE24 @ =0x06017000
	bl Decompress
	ldr r0, _0809CE28 @ =0x0840E40C
	ldr r1, _0809CE2C @ =0x06017800
	bl Decompress
	ldr r0, _0809CE30 @ =0x0840E4EC
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r0, r5, #0
	bl sub_0809CAB8
	adds r0, r5, #0
	bl DrawSupportSubScreenRemainingText
	ldr r0, _0809CE34 @ =sub_0809C544
	adds r1, r5, #0
	bl StartParallelWorker
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809CE20: .4byte 0x0840EDB8
_0809CE24: .4byte 0x06017000
_0809CE28: .4byte 0x0840E40C
_0809CE2C: .4byte 0x06017800
_0809CE30: .4byte 0x0840E4EC
_0809CE34: .4byte sub_0809C544

	thumb_func_start sub_0809CE38
sub_0809CE38: @ 0x0809CE38
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r0, _0809CE6C @ =0x08B857F8
	ldr r1, [r0]
	ldrh r3, [r1, #8]
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _0809CE78
	ldr r0, _0809CE70 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809CE60
	ldr r0, _0809CE74 @ =0x0000038B
	bl m4aSongNumStart
_0809CE60:
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Goto
	b _0809CFE8
	.align 2, 0
_0809CE6C: .4byte 0x08B857F8
_0809CE70: .4byte 0x0202BBF8
_0809CE74: .4byte 0x0000038B
_0809CE78:
	ldrh r2, [r1, #6]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0809CE8E
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
	b _0809CFE8
_0809CE8E:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r2
	cmp r0, #0
	beq _0809CEA2
	adds r0, r6, #0
	movs r1, #5
	bl Proc_Goto
	b _0809CFE8
_0809CEA2:
	adds r0, r6, #0
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0809CEB2
	b _0809CFE8
_0809CEB2:
	adds r0, r6, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809CEBE
	b _0809CFCC
_0809CEBE:
	adds r1, r6, #0
	adds r1, #0x39
	ldrb r7, [r1]
	movs r0, #1
	ands r0, r3
	adds r5, r1, #0
	cmp r0, #0
	beq _0809CEF4
	ldr r0, _0809CEEC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809CEE0
	ldr r0, _0809CEF0 @ =0x0000038A
	bl m4aSongNumStart
_0809CEE0:
	adds r0, r6, #0
	movs r1, #2
	bl Proc_Goto
	b _0809CFE8
	.align 2, 0
_0809CEEC: .4byte 0x0202BBF8
_0809CEF0: .4byte 0x0000038A
_0809CEF4:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _0809CF0E
	movs r1, #3
	ands r1, r7
	cmp r1, #0
	beq _0809CF0E
	movs r0, #0xfc
	ands r0, r7
	adds r0, #0xff
	adds r0, r0, r1
	strb r0, [r5]
_0809CF0E:
	ldr r0, _0809CFC0 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0809CF48
	ldrb r1, [r5]
	movs r0, #3
	mov r8, r0
	mov r4, r8
	ands r4, r1
	ldr r0, [r6, #0x2c]
	lsrs r1, r1, #2
	movs r2, #7
	ands r1, r2
	bl GetSupportScreenPartnerSupportLevel
	subs r0, #1
	cmp r4, r0
	bge _0809CF48
	ldrb r0, [r5]
	movs r1, #0xfc
	ands r1, r0
	adds r1, #1
	mov r2, r8
	ands r2, r0
	adds r1, r1, r2
	strb r1, [r5]
_0809CF48:
	ldr r4, _0809CFC0 @ =0x08B857F8
	ldr r1, [r4]
	movs r0, #0x40
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0809CF6A
	ldrb r0, [r5]
	lsrs r1, r0, #2
	movs r0, #7
	ands r1, r0
	subs r1, #1
	movs r2, #1
	rsbs r2, r2, #0
	adds r0, r6, #0
	bl sub_0809CB10
_0809CF6A:
	ldr r1, [r4]
	movs r0, #0x80
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0809CF88
	ldrb r0, [r5]
	lsrs r1, r0, #2
	movs r0, #7
	ands r1, r0
	adds r1, #1
	adds r0, r6, #0
	movs r2, #1
	bl sub_0809CB10
_0809CF88:
	ldrb r1, [r5]
	cmp r7, r1
	beq _0809CFE8
	movs r0, #3
	ands r0, r1
	lsls r0, r0, #3
	adds r0, #0xc4
	lsrs r1, r1, #2
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x18
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #1
	bl ShowSysHandCursor
	ldr r0, _0809CFC4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809CFE8
	ldr r0, _0809CFC8 @ =0x00000385
	bl m4aSongNumStart
	b _0809CFE8
	.align 2, 0
_0809CFC0: .4byte 0x08B857F8
_0809CFC4: .4byte 0x0202BBF8
_0809CFC8: .4byte 0x00000385
_0809CFCC:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _0809CFE8
	ldr r0, _0809CFF4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809CFE8
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_0809CFE8:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809CFF4: .4byte 0x0202BBF8

	thumb_func_start sub_0809CFF8
sub_0809CFF8: @ 0x0809CFF8
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0
	bl InitBgs
	ldr r3, _0809D0B0 @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _0809D0B4 @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	ldr r1, _0809D0B8 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	bl InitFaces
	bl ResetText
	bl InitIcons
	bl LoadUiFrameGraphics
	bl ApplySystemObjectsGraphics
	ldr r0, [r5, #0x2c]
	bl GetSupportScreenCharIdAt
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, [r5, #0x2c]
	adds r5, #0x39
	ldrb r2, [r5]
	lsrs r1, r2, #2
	movs r2, #7
	ands r1, r2
	bl GetSupportScreenPartnerCharId
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r2, #3
	ldrb r5, [r5]
	ands r2, r5
	adds r2, #1
	adds r0, r4, #0
	bl StartSupportViewerTalk
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809D0B0: .4byte 0x03002870
_0809D0B4: .4byte 0x0000FFE0
_0809D0B8: .4byte 0x0000E0FF

	thumb_func_start sub_0809D0BC
sub_0809D0BC: @ 0x0809D0BC
	push {r4, r5, lr}
	adds r0, #0x3a
	movs r4, #0
	strb r4, [r0]
	bl HideSysHandCursor
	ldr r3, _0809D14C @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0xc]
	movs r0, #3
	ldrb r5, [r3, #0x10]
	orrs r0, r5
	strb r0, [r3, #0x10]
	adds r0, r1, #0
	ldrb r5, [r3, #0x14]
	ands r0, r5
	orrs r0, r2
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	ands r1, r0
	strb r1, [r3, #0x18]
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r4, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r4, [r0]
	ldr r0, _0809D150 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #8
	orrs r0, r1
	ldr r1, _0809D154 @ =0x0000E0FF
	ands r0, r1
	movs r5, #0xb8
	lsls r5, r5, #5
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	bl sub_0809C49C
	ldr r0, _0809D158 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809D144
	movs r0, #0xc8
	bl m4aSongNumStart
_0809D144:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809D14C: .4byte 0x03002870
_0809D150: .4byte 0x0000FFE0
_0809D154: .4byte 0x0000E0FF
_0809D158: .4byte 0x0202BBF8

	thumb_func_start sub_0809D15C
sub_0809D15C: @ 0x0809D15C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	movs r4, #0
	ldr r0, _0809D1CC @ =0x02023C60
	mov sl, r0
_0809D170:
	ldr r2, [sp]
	adds r1, r4, r2
	cmp r1, #0x1d
	bhi _0809D1E0
	adds r3, r4, #1
	mov sb, r3
	ldr r2, _0809D1D0 @ =0x02012BFC
	lsls r1, r1, #1
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r2, r3
	adds r0, r0, r1
	mov ip, r0
	adds r7, r1, r2
	adds r6, r1, #0
	lsls r0, r4, #1
	ldr r4, _0809D1D4 @ =0x02022C60
	adds r5, r0, r4
	adds r3, r0, #0
	ldr r0, _0809D1D8 @ =0x02023460
	mov r8, r0
	movs r4, #0x13
_0809D19C:
	ldrh r0, [r7]
	strh r0, [r5]
	mov r2, r8
	adds r1, r3, r2
	ldr r2, _0809D1DC @ =0x020133FC
	adds r0, r6, r2
	ldrh r0, [r0]
	strh r0, [r1]
	mov r0, sl
	adds r1, r3, r0
	mov r2, ip
	ldrh r0, [r2]
	strh r0, [r1]
	movs r0, #0x40
	add ip, r0
	adds r7, #0x40
	adds r6, #0x40
	adds r5, #0x40
	adds r3, #0x40
	subs r4, #1
	cmp r4, #0
	bge _0809D19C
	b _0809D208
	.align 2, 0
_0809D1CC: .4byte 0x02023C60
_0809D1D0: .4byte 0x02012BFC
_0809D1D4: .4byte 0x02022C60
_0809D1D8: .4byte 0x02023460
_0809D1DC: .4byte 0x020133FC
_0809D1E0:
	adds r1, r4, #1
	mov sb, r1
	movs r3, #0
	lsls r0, r4, #1
	mov r4, sl
	adds r2, r0, r4
	ldr r4, _0809D224 @ =0x02023460
	adds r1, r0, r4
	ldr r4, _0809D228 @ =0x02022C60
	adds r0, r0, r4
	movs r4, #0x13
_0809D1F6:
	strh r3, [r0]
	strh r3, [r1]
	strh r3, [r2]
	adds r2, #0x40
	adds r1, #0x40
	adds r0, #0x40
	subs r4, #1
	cmp r4, #0
	bge _0809D1F6
_0809D208:
	mov r4, sb
	cmp r4, #0x1d
	ble _0809D170
	movs r0, #7
	bl EnableBgSync
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D224: .4byte 0x02023460
_0809D228: .4byte 0x02022C60

	thumb_func_start sub_0809D22C
sub_0809D22C: @ 0x0809D22C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r0, #0x3a
	adds r0, r0, r7
	mov r8, r0
	ldrb r0, [r0]
	adds r0, #1
	movs r6, #0
	mov r1, r8
	strb r0, [r1]
	movs r4, #0xa
	subs r4, r4, r0
	lsls r0, r4, #3
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r5, #8
	subs r5, r5, r0
	lsls r0, r4, #4
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	rsbs r0, r5, #0
	lsls r0, r0, #3
	str r0, [r7, #0x30]
	adds r0, r5, #0
	bl sub_0809D15C
	ldr r1, [r7, #0x30]
	adds r1, #0x38
	ldr r0, _0809D2CC @ =0x000001FF
	ands r1, r0
	adds r0, r7, #0
	adds r0, #0x3f
	ldrb r2, [r0]
	movs r0, #0
	bl SetFacePosition
	ldr r3, _0809D2D0 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r4, [r0]
	movs r0, #0x10
	subs r0, r0, r4
	adds r1, r3, #0
	adds r1, #0x45
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
	mov r0, r8
	ldrb r0, [r0]
	cmp r0, #0xa
	bne _0809D2C2
	adds r0, r7, #0
	bl Proc_Break
	ldr r0, [r7, #0x2c]
	bl GetNextSupportScreenUnit
	str r0, [r7, #0x2c]
_0809D2C2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D2CC: .4byte 0x000001FF
_0809D2D0: .4byte 0x03002870

	thumb_func_start sub_0809D2D4
sub_0809D2D4: @ 0x0809D2D4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	movs r0, #0x3a
	adds r0, r0, r7
	mov sb, r0
	ldrb r0, [r0]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	mov r1, sb
	strb r0, [r1]
	movs r4, #0xa
	subs r4, r4, r0
	lsls r0, r4, #3
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	adds r6, r0, #0
	movs r5, #8
	subs r6, r5, r6
	lsls r0, r4, #4
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	subs r5, r5, r6
	lsls r5, r5, #3
	str r5, [r7, #0x30]
	subs r6, #8
	adds r0, r6, #0
	bl sub_0809D15C
	ldr r1, [r7, #0x30]
	adds r1, #0x38
	ldr r0, _0809D378 @ =0x000001FF
	ands r1, r0
	adds r0, r7, #0
	adds r0, #0x3f
	ldrb r2, [r0]
	movs r0, #0
	bl SetFacePosition
	ldr r3, _0809D37C @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x10
	subs r0, r0, r4
	adds r1, r3, #0
	adds r1, #0x44
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	mov r1, r8
	strb r1, [r0]
	mov r0, sb
	ldrb r0, [r0]
	cmp r0, #0xa
	bne _0809D36A
	adds r0, r7, #0
	bl Proc_Break
_0809D36A:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D378: .4byte 0x000001FF
_0809D37C: .4byte 0x03002870

	thumb_func_start sub_0809D380
sub_0809D380: @ 0x0809D380
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r0, #0x3a
	adds r0, r0, r7
	mov r8, r0
	ldrb r0, [r0]
	adds r0, #1
	movs r6, #0
	mov r1, r8
	strb r0, [r1]
	movs r4, #0xa
	subs r4, r4, r0
	lsls r0, r4, #3
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r5, #8
	subs r5, r5, r0
	lsls r0, r4, #4
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	lsls r0, r5, #3
	str r0, [r7, #0x30]
	rsbs r5, r5, #0
	adds r0, r5, #0
	bl sub_0809D15C
	ldr r1, [r7, #0x30]
	adds r1, #0x38
	ldr r0, _0809D420 @ =0x000001FF
	ands r1, r0
	adds r0, r7, #0
	adds r0, #0x3f
	ldrb r2, [r0]
	movs r0, #0
	bl SetFacePosition
	ldr r3, _0809D424 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r4, [r0]
	movs r0, #0x10
	subs r0, r0, r4
	adds r1, r3, #0
	adds r1, #0x45
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
	mov r0, r8
	ldrb r0, [r0]
	cmp r0, #0xa
	bne _0809D416
	adds r0, r7, #0
	bl Proc_Break
	ldr r0, [r7, #0x2c]
	bl GetPreviousSupportScreenUnit
	str r0, [r7, #0x2c]
_0809D416:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D420: .4byte 0x000001FF
_0809D424: .4byte 0x03002870

	thumb_func_start sub_0809D428
sub_0809D428: @ 0x0809D428
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	movs r0, #0x3a
	adds r0, r0, r7
	mov sb, r0
	ldrb r0, [r0]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	mov r1, sb
	strb r0, [r1]
	movs r4, #0xa
	subs r4, r4, r0
	lsls r0, r4, #3
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	adds r5, r0, #0
	movs r6, #8
	subs r5, r6, r5
	lsls r0, r4, #4
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	adds r0, r5, #0
	subs r0, #8
	lsls r0, r0, #3
	str r0, [r7, #0x30]
	subs r6, r6, r5
	adds r0, r6, #0
	bl sub_0809D15C
	ldr r1, [r7, #0x30]
	adds r1, #0x38
	ldr r0, _0809D4CC @ =0x000001FF
	ands r1, r0
	adds r0, r7, #0
	adds r0, #0x3f
	ldrb r2, [r0]
	movs r0, #0
	bl SetFacePosition
	ldr r3, _0809D4D0 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x10
	subs r0, r0, r4
	adds r1, r3, #0
	adds r1, #0x44
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	mov r1, r8
	strb r1, [r0]
	mov r0, sb
	ldrb r0, [r0]
	cmp r0, #0xa
	bne _0809D4C0
	adds r0, r7, #0
	bl Proc_Break
_0809D4C0:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D4CC: .4byte 0x000001FF
_0809D4D0: .4byte 0x03002870

	thumb_func_start sub_0809D4D4
sub_0809D4D4: @ 0x0809D4D4
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl InitFaces
	bl ResetText
	bl InitIcons
	ldr r0, _0809D584 @ =0x02022C60
	movs r1, #0
	bl TmFill
	ldr r4, _0809D588 @ =0x02023460
	adds r0, r4, #0
	movs r1, #0
	bl TmFill
	ldr r0, _0809D58C @ =0x02023C60
	movs r1, #0
	bl TmFill
	adds r2, r5, #0
	adds r2, #0x39
	movs r0, #0xfc
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0xe3
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r5, #0x2c]
	bl GetSupportScreenCharIdAt
	bl GetSupportScreenPartnerCount
	adds r1, r5, #0
	adds r1, #0x3c
	strb r0, [r1]
	adds r0, r5, #0
	bl InitSupportSubScreenPartners
	adds r0, r5, #0
	bl sub_0809CA08
	adds r0, r5, #0
	bl sub_0809CA38
	adds r0, r5, #0
	movs r1, #0
	movs r2, #1
	bl sub_0809CB10
	ldr r1, _0809D590 @ =0x0840ECC4
	movs r2, #0xa4
	lsls r2, r2, #7
	adds r0, r4, #0
	bl sub_080AACD8
	ldr r4, _0809D594 @ =0x08BDCE4C
	ldr r0, [r5, #0x2c]
	bl GetSupportScreenCharIdAt
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r4
	ldrh r4, [r0, #6]
	adds r0, r4, #0
	bl ShouldFaceBeRaised
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809D598
	adds r1, r5, #0
	adds r1, #0x3f
	movs r0, #0
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x38
	movs r3, #0
	bl StartBmFace
	b _0809D5B0
	.align 2, 0
_0809D584: .4byte 0x02022C60
_0809D588: .4byte 0x02023460
_0809D58C: .4byte 0x02023C60
_0809D590: .4byte 0x0840ECC4
_0809D594: .4byte 0x08BDCE4C
_0809D598:
	adds r1, r5, #0
	adds r1, #0x3f
	movs r0, #8
	strb r0, [r1]
	adds r0, #0xfc
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x38
	movs r3, #8
	bl StartBmFace
_0809D5B0:
	adds r0, r5, #0
	bl sub_0809CAB8
	adds r0, r5, #0
	bl DrawSupportSubScreenRemainingText
	bl sub_0809C49C
	adds r1, r5, #0
	adds r1, #0x3a
	movs r0, #0
	strb r0, [r1]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0809D5D0
sub_0809D5D0: @ 0x0809D5D0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0809D69C @ =0x03002870
	mov ip, r0
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r2, ip
	ldrb r2, [r2, #0xc]
	ands r0, r2
	movs r3, #1
	orrs r0, r3
	mov r5, ip
	strb r0, [r5, #0xc]
	movs r2, #3
	ldrb r0, [r5, #0x10]
	orrs r0, r2
	strb r0, [r5, #0x10]
	ldrb r0, [r5, #0x14]
	ands r1, r0
	orrs r1, r3
	strb r1, [r5, #0x14]
	ldrb r1, [r5, #0x18]
	orrs r2, r1
	strb r2, [r5, #0x18]
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r3, [r2]
	ands r0, r3
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	mov r3, ip
	adds r3, #0x45
	movs r0, #0xc
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x46
	strb r1, [r0]
	ldr r0, _0809D6A0 @ =0x0000FFE0
	ldrh r5, [r5, #0x3c]
	ands r0, r5
	ldr r1, _0809D6A4 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xf8
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	mov r5, ip
	strh r0, [r5, #0x3c]
	movs r1, #0x21
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r3, [r2]
	ands r0, r3
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x3d
	ldrb r5, [r0]
	ands r1, r5
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0809D696
	adds r0, r4, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809D696
	adds r0, r4, #0
	adds r0, #0x39
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	lsls r0, r0, #3
	adds r0, #0xc4
	lsrs r1, r1, #2
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x18
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #1
	bl ShowSysHandCursor
	adds r1, r4, #0
	adds r1, #0x3a
	movs r0, #0xff
	strb r0, [r1]
_0809D696:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809D69C: .4byte 0x03002870
_0809D6A0: .4byte 0x0000FFE0
_0809D6A4: .4byte 0x0000E0FF

	thumb_func_start SupportSubScreen_OnEnd
SupportSubScreen_OnEnd: @ 0x0809D6A8
	push {r4, lr}
	adds r4, r0, #0
	bl EndAllProcChildren
	bl EndMuralBackground_
	movs r0, #0
	bl EndFaceById
	ldr r0, [r4, #0x2c]
	bl sub_0809BF78
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SupportSubScreen_PrepareSupportConvo
SupportSubScreen_PrepareSupportConvo: @ 0x0809D6C8
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x39
	ldrb r3, [r1]
	lsrs r1, r3, #2
	movs r2, #7
	ands r1, r2
	movs r2, #3
	ands r2, r3
	adds r2, #1
	bl UiSupport_GetSupportTalkSong
	adds r4, #0x3e
	movs r3, #0
	strb r0, [r4]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809D704
	movs r1, #0x80
	lsls r1, r1, #1
	str r3, [sp]
	movs r0, #0x30
	movs r2, #0x80
	movs r3, #0x10
	bl CallSomeSoundMaybe
	b _0809D714
_0809D704:
	ldrb r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #1
	str r3, [sp]
	adds r1, r2, #0
	movs r3, #0x10
	bl CallSomeSoundMaybe
_0809D714:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0809D71C
sub_0809D71C: @ 0x0809D71C
	push {lr}
	sub sp, #4
	adds r0, #0x3e
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809D73A
	movs r2, #0x80
	lsls r2, r2, #1
	str r0, [sp]
	movs r0, #0x30
	movs r1, #0x80
	movs r3, #0x10
	bl CallSomeSoundMaybe
	b _0809D74C
_0809D73A:
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	str r0, [sp]
	movs r0, #0x30
	adds r1, r2, #0
	movs r3, #0x10
	bl CallSomeSoundMaybe
_0809D74C:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartSupportUnitSubScreen
StartSupportUnitSubScreen: @ 0x0809D754
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0809D774 @ =0x08CC5984
	bl SpawnProcLocking
	adds r1, r0, #0
	adds r1, #0x38
	strb r4, [r1]
	str r5, [r0, #0x2c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809D774: .4byte 0x08CC5984

	thumb_func_start sub_0809D778
sub_0809D778: @ 0x0809D778
	push {r4, lr}
	ldrb r3, [r1]
	str r3, [r0, #8]
	ldrb r4, [r1, #2]
	lsls r2, r4, #8
	ldrb r1, [r1, #1]
	orrs r2, r1
	str r2, [r0, #4]
	str r3, [r0, #0xc]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0809D790
sub_0809D790: @ 0x0809D790
	ldr r2, [r0, #8]
	strb r2, [r1]
	ldr r0, [r0, #4]
	strb r0, [r1, #1]
	asrs r0, r0, #0x10
	strb r0, [r1, #2]
	bx lr
	.align 2, 0

	thumb_func_start sub_0809D7A0
sub_0809D7A0: @ 0x0809D7A0
	adds r2, r0, #0
	ldr r1, [r2, #0xc]
	movs r0, #0xd
	muls r0, r1, r0
	adds r0, #1
	movs r1, #0xff
	ands r0, r1
	str r0, [r2, #0xc]
	bx lr
	.align 2, 0

	thumb_func_start sub_0809D7B4
sub_0809D7B4: @ 0x0809D7B4
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	ldr r0, _0809D7F0 @ =0x020143FC
	str r4, [r0]
	ldr r1, _0809D7F4 @ =0x02014400
	movs r0, #1
	lsls r0, r4
	subs r0, #1
	str r0, [r1]
	ldr r6, _0809D7F8 @ =0x02014404
	movs r0, #0x1e
	adds r1, r4, #0
	bl __divsi3
	adds r5, r0, #0
	str r5, [r6]
	movs r0, #0x1e
	adds r1, r4, #0
	bl __modsi3
	cmp r0, #0
	ble _0809D7E6
	adds r0, r5, #1
	str r0, [r6]
_0809D7E6:
	ldr r0, _0809D7FC @ =0x02014408
	str r7, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D7F0: .4byte 0x020143FC
_0809D7F4: .4byte 0x02014400
_0809D7F8: .4byte 0x02014404
_0809D7FC: .4byte 0x02014408

	thumb_func_start sub_0809D800
sub_0809D800: @ 0x0809D800
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0809D828 @ =0x020143FC
	ldr r4, [r0]
	adds r0, r5, #0
	adds r1, r4, #0
	bl __divsi3
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl __modsi3
	cmp r0, #0
	ble _0809D820
	adds r6, #1
_0809D820:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0809D828: .4byte 0x020143FC

	thumb_func_start sub_0809D82C
sub_0809D82C: @ 0x0809D82C
	ldr r2, _0809D840 @ =0x02014434
	ldr r1, [r2]
	movs r0, #0xd
	muls r0, r1, r0
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [r2]
	bx lr
	.align 2, 0
_0809D840: .4byte 0x02014434

	thumb_func_start sub_0809D844
sub_0809D844: @ 0x0809D844
	push {r4, r5, r6, lr}
	movs r4, #0
	ldr r1, _0809D878 @ =0x02014404
	ldr r0, [r1]
	cmp r4, r0
	bge _0809D870
	ldr r6, _0809D87C @ =0x02014438
	adds r5, r1, #0
_0809D854:
	ldr r0, [r5]
	adds r0, r4, r0
	lsls r1, r4, #1
	adds r0, r0, r1
	adds r0, r0, r6
	ldrb r3, [r0]
	adds r2, r4, r6
	ldrb r1, [r2]
	strb r1, [r0]
	strb r3, [r2]
	adds r4, #1
	ldr r0, [r5]
	cmp r4, r0
	blt _0809D854
_0809D870:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809D878: .4byte 0x02014404
_0809D87C: .4byte 0x02014438

	thumb_func_start sub_0809D880
sub_0809D880: @ 0x0809D880
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp]
	mov sl, r1
	mov r8, r2
	mov sb, r3
	bl sub_0809D82C
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add r8, r0
	movs r0, #1
	mov r1, sb
	lsls r0, r1
	subs r0, #1
	mov r1, r8
	ands r1, r0
	mov r8, r1
	movs r2, #0
	cmp r2, sb
	bge _0809D900
_0809D8B2:
	ldr r0, _0809D910 @ =0x020143FC
	mov r1, sl
	ldr r6, [r1]
	ldr r4, [r0]
	adds r0, r6, #0
	adds r1, r4, #0
	str r2, [sp, #4]
	bl __divsi3
	ldr r1, [sp]
	adds r7, r1, r0
	movs r5, #1
	ldr r2, [sp, #4]
	lsls r5, r2
	mov r0, r8
	ands r5, r0
	asrs r5, r2
	adds r0, r6, #0
	adds r1, r4, #0
	bl __modsi3
	adds r1, r0, #0
	ldr r2, [sp, #4]
	cmp r1, #0
	bge _0809D8E6
	adds r0, r1, #7
_0809D8E6:
	asrs r0, r0, #3
	lsls r0, r0, #3
	subs r0, r1, r0
	lsls r5, r0
	ldrb r1, [r7]
	orrs r5, r1
	strb r5, [r7]
	adds r0, r6, #1
	mov r1, sl
	str r0, [r1]
	adds r2, #1
	cmp r2, sb
	blt _0809D8B2
_0809D900:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D910: .4byte 0x020143FC

	thumb_func_start sub_0809D914
sub_0809D914: @ 0x0809D914
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	mov r8, r1
	mov sb, r2
	movs r0, #0
	mov sl, r0
	movs r7, #0
	cmp sl, sb
	bge _0809D978
_0809D930:
	ldr r0, _0809D9A0 @ =0x020143FC
	mov r1, r8
	ldr r6, [r1]
	ldr r4, [r0]
	adds r0, r6, #0
	adds r1, r4, #0
	bl __divsi3
	ldr r2, [sp]
	adds r0, r2, r0
	ldrb r5, [r0]
	adds r0, r6, #0
	adds r1, r4, #0
	bl __modsi3
	adds r1, r0, #0
	cmp r1, #0
	bge _0809D956
	adds r0, r1, #7
_0809D956:
	asrs r0, r0, #3
	lsls r0, r0, #3
	subs r0, r1, r0
	movs r1, #1
	lsls r1, r0
	ands r5, r1
	asrs r5, r0
	lsls r5, r7
	mov r0, sl
	orrs r0, r5
	mov sl, r0
	adds r0, r6, #1
	mov r1, r8
	str r0, [r1]
	adds r7, #1
	cmp r7, sb
	blt _0809D930
_0809D978:
	bl sub_0809D82C
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r2, sl
	subs r0, r2, r0
	movs r1, #1
	mov r2, sb
	lsls r1, r2
	subs r1, #1
	ands r0, r1
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0809D9A0: .4byte 0x020143FC

	thumb_func_start sub_0809D9A4
sub_0809D9A4: @ 0x0809D9A4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	movs r2, #0
	movs r1, #0
	cmp r2, r3
	bge _0809D9CA
_0809D9B2:
	adds r0, r4, r1
	ldrb r6, [r0]
	adds r5, r6, #0
	muls r5, r6, r5
	adds r0, r5, #0
	adds r1, #1
	muls r0, r1, r0
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r1, r3
	blt _0809D9B2
_0809D9CA:
	lsrs r0, r2, #8
	adds r0, r2, r0
	asrs r1, r2, #0x10
	adds r0, r0, r1
	ldr r2, _0809D9E0 @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0809D9E0: .4byte 0x000003FF

	thumb_func_start sub_0809D9E4
sub_0809D9E4: @ 0x0809D9E4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r6, #0
	ldr r0, _0809DA1C @ =0x02014404
	ldr r0, [r0]
	ldr r5, _0809DA20 @ =0x02014438
	adds r0, r0, r5
	ldr r4, _0809DA24 @ =0x020144D8
	ldrh r1, [r4, #6]
	bl sub_0809D9A4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	adds r7, r5, #0
	mov r8, r4
_0809DA08:
	adds r0, r6, #0
	movs r1, #3
	bl __modsi3
	adds r5, r0, #0
	cmp r5, #0
	bne _0809DA28
	mov r0, r8
	ldrh r4, [r0]
	b _0809DA40
	.align 2, 0
_0809DA1C: .4byte 0x02014404
_0809DA20: .4byte 0x02014438
_0809DA24: .4byte 0x020144D8
_0809DA28:
	cmp r5, #1
	bne _0809DA3C
	mov r0, r8
	ldrh r4, [r0, #2]
	adds r0, r6, #0
	movs r1, #3
	bl __divsi3
	adds r1, r5, #0
	b _0809DA4A
_0809DA3C:
	mov r0, r8
	ldrh r4, [r0, #4]
_0809DA40:
	adds r0, r6, #0
	movs r1, #3
	bl __divsi3
	movs r1, #1
_0809DA4A:
	lsls r1, r0
	ands r4, r1
	asrs r4, r0
	ldr r5, _0809DAA8 @ =0x020143FC
	ldr r1, [r5]
	adds r0, r6, #0
	bl __modsi3
	lsls r4, r0
	ldrb r0, [r7]
	orrs r4, r0
	strb r4, [r7]
	adds r6, #1
	ldr r1, [r5]
	adds r0, r6, #0
	bl __modsi3
	cmp r0, #0
	bne _0809DA72
	adds r7, #1
_0809DA72:
	cmp r6, #0x1e
	bne _0809DA08
	movs r2, #0
	ldr r3, _0809DAAC @ =0x02014404
	ldr r0, [r3]
	cmp r2, r0
	bge _0809DA98
	ldr r5, _0809DAB0 @ =0x02014438
	ldr r4, _0809DAB4 @ =0x02014400
_0809DA84:
	adds r0, r2, r5
	ldrb r1, [r0]
	add r1, sb
	ldrb r6, [r4]
	ands r1, r6
	strb r1, [r0]
	adds r2, #1
	ldr r0, [r3]
	cmp r2, r0
	blt _0809DA84
_0809DA98:
	bl sub_0809D844
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809DAA8: .4byte 0x020143FC
_0809DAAC: .4byte 0x02014404
_0809DAB0: .4byte 0x02014438
_0809DAB4: .4byte 0x02014400

	thumb_func_start sub_0809DAB8
sub_0809DAB8: @ 0x0809DAB8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r0, #0
	mov sl, r0
	movs r7, #0
	bl sub_0809D844
	ldr r4, _0809DB50 @ =0x02014404
	ldr r0, [r4]
	ldr r5, _0809DB54 @ =0x02014438
	adds r0, r0, r5
	ldr r1, _0809DB58 @ =0x020144D8
	ldrh r1, [r1, #6]
	bl sub_0809D9A4
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r2, #0
	ldr r0, [r4]
	cmp sl, r0
	bge _0809DB02
	mov r8, r5
	ldr r5, _0809DB5C @ =0x02014400
_0809DAEC:
	mov r1, r8
	adds r0, r2, r1
	ldrb r6, [r0]
	subs r1, r6, r3
	ldrb r6, [r5]
	ands r1, r6
	strb r1, [r0]
	adds r2, #1
	ldr r0, [r4]
	cmp r2, r0
	blt _0809DAEC
_0809DB02:
	ldr r0, _0809DB58 @ =0x020144D8
	movs r1, #0
	strh r1, [r0]
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	ldr r1, _0809DB54 @ =0x02014438
	ldr r2, _0809DB60 @ =0x020143FC
	mov sb, r2
	mov r8, r0
	mov r0, sl
	adds r6, r0, r1
_0809DB18:
	adds r0, r7, #0
	movs r1, #3
	bl __modsi3
	adds r5, r0, #0
	cmp r5, #0
	bne _0809DB64
	ldrb r4, [r6]
	mov r2, sb
	ldr r1, [r2]
	adds r0, r7, #0
	bl __modsi3
	asrs r4, r0
	movs r0, #1
	ands r4, r0
	adds r0, r7, #0
	movs r1, #3
	bl __divsi3
	lsls r4, r0
	mov r0, r8
	ldrh r0, [r0]
	orrs r4, r0
	mov r1, r8
	strh r4, [r1]
	b _0809DBB4
	.align 2, 0
_0809DB50: .4byte 0x02014404
_0809DB54: .4byte 0x02014438
_0809DB58: .4byte 0x020144D8
_0809DB5C: .4byte 0x02014400
_0809DB60: .4byte 0x020143FC
_0809DB64:
	cmp r5, #1
	bne _0809DB8E
	ldrb r4, [r6]
	mov r2, sb
	ldr r1, [r2]
	adds r0, r7, #0
	bl __modsi3
	asrs r4, r0
	ands r4, r5
	adds r0, r7, #0
	movs r1, #3
	bl __divsi3
	lsls r4, r0
	mov r0, r8
	ldrh r0, [r0, #2]
	orrs r4, r0
	mov r1, r8
	strh r4, [r1, #2]
	b _0809DBB4
_0809DB8E:
	ldrb r4, [r6]
	mov r2, sb
	ldr r1, [r2]
	adds r0, r7, #0
	bl __modsi3
	asrs r4, r0
	movs r0, #1
	ands r4, r0
	adds r0, r7, #0
	movs r1, #3
	bl __divsi3
	lsls r4, r0
	mov r0, r8
	ldrh r0, [r0, #4]
	orrs r4, r0
	mov r1, r8
	strh r4, [r1, #4]
_0809DBB4:
	adds r7, #1
	mov r2, sb
	ldr r1, [r2]
	adds r0, r7, #0
	bl __modsi3
	cmp r0, #0
	bne _0809DBC6
	adds r6, #1
_0809DBC6:
	cmp r7, #0x1e
	bne _0809DB18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start ModifyPassword
ModifyPassword: @ 0x0809DBD8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r6, _0809DC90 @ =0x02014438
	ldr r5, _0809DC94 @ =0x02014404
	adds r2, r6, #0
	movs r1, #0
	adds r0, r6, #0
	adds r0, #0x9f
_0809DBEE:
	strb r1, [r0]
	subs r0, #1
	cmp r0, r2
	bge _0809DBEE
	ldr r1, [r5]
	adds r1, r1, r6
	mov r0, sp
	bl _call_via_r3
	ldr r0, [sp]
	bl sub_0809D800
	ldr r4, _0809DC98 @ =0x020144D8
	strh r0, [r4, #6]
	ldr r0, [r5]
	adds r0, r0, r6
	ldrh r1, [r4, #6]
	bl sub_0809D9A4
	strh r0, [r4, #2]
	bl GetGameTime
	lsrs r0, r0, #3
	ldrh r1, [r4, #2]
	adds r0, r1, r0
	ldr r5, _0809DC9C @ =0x000003FF
	ands r0, r5
	strh r0, [r4]
	ldr r1, _0809DCA0 @ =0x02014434
	ldrh r0, [r4]
	str r0, [r1]
	bl sub_0809D82C
	ldrh r1, [r4, #2]
	adds r0, r0, r1
	ands r0, r5
	strh r0, [r4, #2]
	movs r5, #0
	ldrh r4, [r4, #6]
	cmp r5, r4
	bge _0809DC64
	adds r4, r6, #0
_0809DC42:
	bl sub_0809D82C
	ldr r1, _0809DC94 @ =0x02014404
	ldr r2, [r1]
	adds r2, r5, r2
	adds r2, r2, r4
	ldrb r1, [r2]
	adds r0, r1, r0
	ldr r1, _0809DCA4 @ =0x02014400
	ldrb r1, [r1]
	ands r0, r1
	strb r0, [r2]
	adds r5, #1
	ldr r0, _0809DC98 @ =0x020144D8
	ldrh r0, [r0, #6]
	cmp r5, r0
	blt _0809DC42
_0809DC64:
	ldr r0, _0809DC94 @ =0x02014404
	ldr r0, [r0]
	ldr r1, _0809DC90 @ =0x02014438
	adds r0, r0, r1
	ldr r5, _0809DC98 @ =0x020144D8
	ldrh r1, [r5, #6]
	bl sub_0809D9A4
	adds r4, r0, #0
	bl sub_0809D82C
	adds r4, r4, r0
	ldr r1, _0809DC9C @ =0x000003FF
	adds r0, r1, #0
	ands r4, r0
	strh r4, [r5, #4]
	bl sub_0809D9E4
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809DC90: .4byte 0x02014438
_0809DC94: .4byte 0x02014404
_0809DC98: .4byte 0x020144D8
_0809DC9C: .4byte 0x000003FF
_0809DCA0: .4byte 0x02014434
_0809DCA4: .4byte 0x02014400

	thumb_func_start sub_0809DCA8
sub_0809DCA8: @ 0x0809DCA8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	mov sb, r0
	movs r0, #0
	str r0, [sp, #4]
	bl sub_0809DAB8
	ldr r1, _0809DD54 @ =0x02014434
	ldr r4, _0809DD58 @ =0x020144D8
	ldrh r0, [r4]
	str r0, [r1]
	ldr r0, _0809DD5C @ =0x02014404
	ldr r0, [r0]
	ldr r7, _0809DD60 @ =0x02014438
	adds r0, r0, r7
	ldrh r1, [r4, #6]
	bl sub_0809D9A4
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	bl sub_0809D82C
	mov r1, sp
	strh r0, [r1]
	movs r5, #0
	add r0, sp, #4
	mov r8, r0
	ldrh r4, [r4, #6]
	cmp r5, r4
	bge _0809DD0E
	adds r4, r7, #0
_0809DCEC:
	bl sub_0809D82C
	ldr r1, _0809DD5C @ =0x02014404
	ldr r2, [r1]
	adds r2, r5, r2
	adds r2, r2, r4
	ldrb r1, [r2]
	subs r0, r1, r0
	ldr r1, _0809DD64 @ =0x02014400
	ldrb r1, [r1]
	ands r0, r1
	strb r0, [r2]
	adds r5, #1
	ldr r0, _0809DD58 @ =0x020144D8
	ldrh r0, [r0, #6]
	cmp r5, r0
	blt _0809DCEC
_0809DD0E:
	bl sub_0809D82C
	mov r1, sp
	strh r0, [r1, #2]
	ldr r5, _0809DD5C @ =0x02014404
	ldr r1, [r5]
	ldr r4, _0809DD60 @ =0x02014438
	adds r1, r1, r4
	mov r0, r8
	bl sub_080BFC70
	ldr r0, [r5]
	adds r0, r0, r4
	ldr r4, _0809DD58 @ =0x020144D8
	ldrh r1, [r4, #6]
	bl sub_0809D9A4
	mov r1, sp
	ldrh r1, [r1]
	adds r0, r1, r0
	ldr r1, _0809DD68 @ =0x000003FF
	adds r2, r1, #0
	ands r0, r2
	mov r1, sp
	ldrh r1, [r1, #2]
	adds r6, r6, r1
	ands r6, r2
	ldrh r1, [r4, #2]
	cmp r1, r0
	bne _0809DD50
	ldrh r4, [r4, #4]
	cmp r4, r6
	beq _0809DD6C
_0809DD50:
	movs r0, #0
	b _0809DD6E
	.align 2, 0
_0809DD54: .4byte 0x02014434
_0809DD58: .4byte 0x020144D8
_0809DD5C: .4byte 0x02014404
_0809DD60: .4byte 0x02014438
_0809DD64: .4byte 0x02014400
_0809DD68: .4byte 0x000003FF
_0809DD6C:
	movs r0, #1
_0809DD6E:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0809DD7C
sub_0809DD7C: @ 0x0809DD7C
	adds r3, r0, #0
	movs r2, #0
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0809DDA2
	ldrh r3, [r3]
_0809DD8A:
	ldrh r0, [r1]
	cmp r0, r3
	bne _0809DD96
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	b _0809DDA4
_0809DD96:
	adds r1, #2
	adds r2, #1
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0809DD8A
_0809DDA2:
	ldr r0, _0809DDA8 @ =0x0000FFFF
_0809DDA4:
	bx lr
	.align 2, 0
_0809DDA8: .4byte 0x0000FFFF

	thumb_func_start sub_0809DDAC
sub_0809DDAC: @ 0x0809DDAC
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	adds r6, r1, #0
	movs r5, #0
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq _0809DDD8
	adds r4, r2, #0
_0809DDBE:
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_0809DD7C
	ldr r1, _0809DDE0 @ =0x02014438
	adds r1, r5, r1
	strb r0, [r1]
	adds r4, #2
	adds r5, #1
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0809DDBE
_0809DDD8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809DDE0: .4byte 0x02014438

	thumb_func_start InitPassword
InitPassword: @ 0x0809DDE4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r1, _0809DECC @ =0x02014434
	ldr r0, _0809DED0 @ =0x02014408
	ldr r0, [r0]
	str r0, [r1]
	ldr r4, _0809DED4 @ =0x020144E0
	ldrb r2, [r4]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #2
	bl sub_0809D880
	ldrb r2, [r4, #1]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #1
	bl sub_0809D880
	ldrb r2, [r4, #2]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #1
	bl sub_0809D880
	ldrb r2, [r4, #0xa]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #8
	bl sub_0809D880
	bl GetGameTime
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #5
	bl sub_0809D880
	ldrb r2, [r4, #3]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #3
	bl sub_0809D880
	ldrb r2, [r4, #4]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #3
	bl sub_0809D880
	ldrb r2, [r4, #5]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #3
	bl sub_0809D880
	ldrb r2, [r4, #6]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #3
	bl sub_0809D880
	ldrb r2, [r4, #7]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #3
	bl sub_0809D880
	ldrb r2, [r4, #9]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #8
	bl sub_0809D880
	ldrb r2, [r4, #8]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #6
	bl sub_0809D880
	ldrh r2, [r4, #0xc]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #0xa
	bl sub_0809D880
	ldrb r2, [r4, #0xe]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #6
	bl sub_0809D880
	ldrb r2, [r4, #0xf]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #6
	bl sub_0809D880
	ldrb r2, [r4, #0xb]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #8
	bl sub_0809D880
	ldr r2, [r4, #0x10]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #0x18
	bl sub_0809D880
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809DECC: .4byte 0x02014434
_0809DED0: .4byte 0x02014408
_0809DED4: .4byte 0x020144E0

	thumb_func_start sub_0809DED8
sub_0809DED8: @ 0x0809DED8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r1, _0809DFB8 @ =0x02014434
	ldr r0, _0809DFBC @ =0x02014408
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #2
	bl sub_0809D914
	ldr r5, _0809DFC0 @ =0x020144E0
	strb r0, [r5]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	bl sub_0809D914
	strb r0, [r5, #1]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	bl sub_0809D914
	strb r0, [r5, #2]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #8
	bl sub_0809D914
	strb r0, [r5, #0xa]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #5
	bl sub_0809D914
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_0809D914
	strb r0, [r5, #3]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_0809D914
	strb r0, [r5, #4]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_0809D914
	strb r0, [r5, #5]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_0809D914
	strb r0, [r5, #6]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_0809D914
	strb r0, [r5, #7]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #8
	bl sub_0809D914
	strb r0, [r5, #9]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #6
	bl sub_0809D914
	strb r0, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0xa
	bl sub_0809D914
	strh r0, [r5, #0xc]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #6
	bl sub_0809D914
	strb r0, [r5, #0xe]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #6
	bl sub_0809D914
	strb r0, [r5, #0xf]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #8
	bl sub_0809D914
	strb r0, [r5, #0xb]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0x18
	bl sub_0809D914
	str r0, [r5, #0x10]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809DFB8: .4byte 0x02014434
_0809DFBC: .4byte 0x02014408
_0809DFC0: .4byte 0x020144E0

	thumb_func_start sub_0809DFC4
sub_0809DFC4: @ 0x0809DFC4
	push {r4, r5, r6, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	adds r6, r1, #0
	add r0, sp, #0x18
	movs r1, #0
	strh r1, [r0]
	ldr r4, _0809E07C @ =0x020144E0
	ldr r2, _0809E080 @ =0x0100000A
	adds r1, r4, #0
	bl CpuSet
	mov r0, sp
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_0809F224
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809E088
	strb r5, [r4]
	strb r6, [r4, #2]
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1d
	strb r0, [r4, #3]
	mov r0, sp
	ldrh r0, [r0]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x1d
	strb r0, [r4, #4]
	mov r0, sp
	ldrb r1, [r0, #1]
	lsls r0, r1, #0x1b
	lsrs r0, r0, #0x1d
	strb r0, [r4, #5]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1d
	strb r1, [r4, #6]
	strb r1, [r4, #7]
	mov r0, sp
	ldrh r0, [r0, #2]
	lsrs r0, r0, #7
	strb r0, [r4, #9]
	mov r0, sp
	ldrh r0, [r0, #0xa]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x1a
	strb r0, [r4, #8]
	mov r0, sp
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1f
	strb r0, [r4, #1]
	ldr r0, [sp, #4]
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x16
	strh r0, [r4, #0xc]
	mov r0, sp
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1a
	strb r0, [r4, #0xe]
	mov r0, sp
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x13
	lsrs r0, r0, #0x1a
	strb r0, [r4, #0xf]
	mov r0, sp
	ldrb r0, [r0, #7]
	lsrs r2, r0, #5
	ldr r0, [sp, #8]
	ldr r1, _0809E084 @ =0x001FFFFF
	ands r0, r1
	lsls r0, r0, #3
	orrs r0, r2
	str r0, [r4, #0x10]
	mov r0, sp
	ldrb r0, [r0, #0x17]
	strb r0, [r4, #0xa]
	mov r2, sp
	ldrb r1, [r2, #3]
	lsrs r1, r1, #7
	movs r0, #0x7f
	ldrb r2, [r2, #4]
	ands r0, r2
	lsls r0, r0, #1
	orrs r0, r1
	strb r0, [r4, #0xb]
	movs r0, #1
	b _0809E08A
	.align 2, 0
_0809E07C: .4byte 0x020144E0
_0809E080: .4byte 0x0100000A
_0809E084: .4byte 0x001FFFFF
_0809E088:
	movs r0, #0
_0809E08A:
	add sp, #0x1c
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start PrintPassword
PrintPassword: @ 0x0809E094
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	mov sb, r0
	str r1, [sp, #0xc]
	add r1, sp, #8
	movs r0, #0
	strb r0, [r1, #1]
	movs r0, #4
	bl EnableBgSync
	movs r0, #0
	str r0, [sp, #0x10]
	add r1, sp, #8
	mov sl, r1
	movs r0, #0xe0
	lsls r0, r0, #1
	mov r8, r0
	movs r1, #0
	str r1, [sp, #0x14]
	movs r6, #0
_0809E0C4:
	mov r1, sb
	adds r0, r1, r6
	bl ClearText
	movs r5, #2
	bl InitTalkTextFont
	movs r4, #0
	ldr r7, [sp, #0x14]
_0809E0D6:
	adds r2, r7, r4
	ldr r1, _0809E14C @ =0x020144D8
	ldr r0, _0809E150 @ =0x02014404
	ldr r0, [r0]
	ldrh r1, [r1, #6]
	adds r0, r1, r0
	cmp r2, r0
	beq _0809E13A
	ldr r0, _0809E154 @ =0x02014438
	adds r0, r2, r0
	ldrb r0, [r0]
	ldr r1, [sp, #0xc]
	adds r0, r0, r1
	ldrb r0, [r0]
	mov r1, sl
	strb r0, [r1]
	movs r0, #0
	str r0, [sp]
	add r1, sp, #8
	str r1, [sp, #4]
	mov r1, sb
	adds r0, r1, r6
	ldr r1, _0809E158 @ =0x02023C68
	add r1, r8
	movs r2, #1
	adds r3, r5, #0
	bl PutDrawText
	adds r5, #0xb
	adds r4, #1
	adds r0, r4, #0
	movs r1, #5
	bl __modsi3
	cmp r0, #0
	bne _0809E120
	adds r5, #0xb
_0809E120:
	cmp r4, #0xd
	ble _0809E0D6
	movs r0, #0xc0
	add r8, r0
	ldr r1, [sp, #0x14]
	adds r1, #0xe
	str r1, [sp, #0x14]
	adds r6, #8
	ldr r0, [sp, #0x10]
	adds r0, #1
	str r0, [sp, #0x10]
	cmp r0, #2
	ble _0809E0C4
_0809E13A:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809E14C: .4byte 0x020144D8
_0809E150: .4byte 0x02014404
_0809E154: .4byte 0x02014438
_0809E158: .4byte 0x02023C68

	thumb_func_start sub_0809E15C
sub_0809E15C: @ 0x0809E15C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	lsls r4, r6, #6
	ldr r7, _0809E254 @ =0x02023C64
	adds r0, r4, r7
	ldr r5, _0809E258 @ =0x020144E0
	ldrb r2, [r5]
	movs r1, #2
	bl PutNumberOrBlank
	adds r0, r7, #6
	mov r8, r0
	adds r0, r4, r0
	ldrb r2, [r5, #2]
	movs r1, #2
	bl PutNumberOrBlank
	movs r1, #0x14
	adds r1, r1, r7
	mov sl, r1
	adds r0, r4, r1
	ldrb r2, [r5, #0xb]
	movs r1, #2
	bl PutNumberOrBlank
	movs r0, #0x1e
	adds r0, r0, r7
	mov sb, r0
	add r4, sb
	ldrb r2, [r5, #0xa]
	adds r0, r4, #0
	movs r1, #2
	bl PutNumberOrBlank
	adds r4, r6, #2
	lsls r4, r4, #6
	adds r0, r4, r7
	ldrb r2, [r5, #3]
	movs r1, #2
	bl PutNumberOrBlank
	add r8, r4
	ldrb r2, [r5, #4]
	mov r0, r8
	movs r1, #2
	bl PutNumberOrBlank
	movs r1, #0xc
	adds r1, r1, r7
	mov r8, r1
	adds r0, r4, r1
	ldrb r2, [r5, #5]
	movs r1, #2
	bl PutNumberOrBlank
	adds r0, r7, #0
	adds r0, #0x12
	adds r0, r4, r0
	ldrb r2, [r5, #6]
	movs r1, #2
	bl PutNumberOrBlank
	adds r0, r7, #0
	adds r0, #0x18
	adds r0, r4, r0
	ldrb r2, [r5, #7]
	movs r1, #2
	bl PutNumberOrBlank
	add sb, r4
	ldrb r2, [r5, #9]
	mov r0, sb
	movs r1, #2
	bl PutNumberOrBlank
	adds r0, r7, #0
	adds r0, #0x24
	adds r4, r4, r0
	ldrb r2, [r5, #8]
	adds r0, r4, #0
	movs r1, #2
	bl PutNumberOrBlank
	adds r6, #4
	lsls r6, r6, #6
	add r8, r6
	ldr r2, [r5, #0x10]
	mov r0, r8
	movs r1, #2
	bl PutNumber
	add sl, r6
	ldrh r2, [r5, #0xc]
	mov r0, sl
	movs r1, #2
	bl PutNumber
	adds r0, r7, #0
	adds r0, #0x1a
	adds r0, r6, r0
	ldrb r2, [r5, #0xe]
	movs r1, #2
	bl PutNumber
	adds r0, r7, #0
	adds r0, #0x20
	adds r6, r6, r0
	ldrb r2, [r5, #0xf]
	adds r0, r6, #0
	movs r1, #2
	bl PutNumber
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809E254: .4byte 0x02023C64
_0809E258: .4byte 0x020144E0

	thumb_func_start sub_0809E25C
sub_0809E25C: @ 0x0809E25C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0
	bl InitBgs
	bl ResetTextFont
	bl ResetText
	ldr r4, _0809E354 @ =0x03002870
	movs r2, #1
	ldrb r0, [r4, #1]
	orrs r0, r2
	movs r3, #2
	orrs r0, r3
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r4, #1]
	adds r1, #0xd
	adds r0, r1, #0
	ldrb r5, [r4, #0xc]
	ands r0, r5
	orrs r0, r2
	strb r0, [r4, #0xc]
	adds r0, r1, #0
	ldrb r2, [r4, #0x10]
	ands r0, r2
	orrs r0, r3
	strb r0, [r4, #0x10]
	ldrb r5, [r4, #0x14]
	ands r1, r5
	strb r1, [r4, #0x14]
	movs r0, #3
	ldrb r1, [r4, #0x18]
	orrs r0, r1
	strb r0, [r4, #0x18]
	bl LoadUiFrameGraphics
	bl EnablePalSync
	ldr r0, _0809E358 @ =0x02022C60
	movs r1, #0
	bl TmFill
	ldr r0, _0809E35C @ =0x02023460
	movs r1, #0
	bl TmFill
	ldr r0, _0809E360 @ =0x02023C60
	movs r1, #0
	bl TmFill
	ldr r0, _0809E364 @ =0x02024460
	movs r1, #0
	bl TmFill
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r2, [r4, #1]
	ands r0, r2
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	movs r0, #2
	str r0, [sp]
	movs r1, #6
	movs r2, #0x1a
	movs r3, #7
	bl DrawUiFrame2
	movs r0, #0xf
	bl EnableBgSync
	ldr r5, _0809E368 @ =0x0201440C
	movs r4, #2
_0809E32C:
	adds r0, r5, #0
	movs r1, #0x1b
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0809E32C
	ldr r0, [r6, #0x30]
	ldr r1, [r6, #0x34]
	bl sub_0809DFC4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809E36C
	adds r0, r6, #0
	movs r1, #0x63
	bl Proc_Goto
	b _0809E38E
	.align 2, 0
_0809E354: .4byte 0x03002870
_0809E358: .4byte 0x02022C60
_0809E35C: .4byte 0x02023460
_0809E360: .4byte 0x02023C60
_0809E364: .4byte 0x02024460
_0809E368: .4byte 0x0201440C
_0809E36C:
	movs r0, #5
	movs r1, #0x11
	bl sub_0809D7B4
	ldr r0, _0809E398 @ =InitPassword
	bl ModifyPassword
	ldr r0, _0809E39C @ =0x0201440C
	ldr r1, _0809E3A0 @ =0x08CC5ACC
	bl PrintPassword
	movs r0, #0
	movs r1, #0
	movs r2, #0xa
	bl StartMuralBackgroundAlt
	str r0, [r6, #0x2c]
_0809E38E:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809E398: .4byte InitPassword
_0809E39C: .4byte 0x0201440C
_0809E3A0: .4byte 0x08CC5ACC

	thumb_func_start sub_0809E3A4
sub_0809E3A4: @ 0x0809E3A4
	bx lr
	.align 2, 0

	thumb_func_start sub_0809E3A8
sub_0809E3A8: @ 0x0809E3A8
	push {lr}
	ldr r0, [r0, #0x2c]
	bl Proc_End
	ldr r2, _0809E3D4 @ =0x03002870
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	pop {r0}
	bx r0
	.align 2, 0
_0809E3D4: .4byte 0x03002870

	thumb_func_start sub_0809E3D8
sub_0809E3D8: @ 0x0809E3D8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	ldr r0, _0809E3F0 @ =0x08CC5AF0
	bl SpawnProcLocking
	str r4, [r0, #0x30]
	str r5, [r0, #0x34]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809E3F0: .4byte 0x08CC5AF0

	thumb_func_start sub_0809E3F4
sub_0809E3F4: @ 0x0809E3F4
	ldr r0, _0809E3FC @ =0x0203E790
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_0809E3FC: .4byte 0x0203E790

	thumb_func_start sub_0809E400
sub_0809E400: @ 0x0809E400
	bx lr
	.align 2, 0

	thumb_func_start SramInit
SramInit: @ 0x0809E404
	push {r4, r5, lr}
	sub sp, #8
	ldr r0, _0809E45C @ =0x12345678
	str r0, [sp]
	ldr r0, _0809E460 @ =0x87654321
	str r0, [sp, #4]
	bl SetSramFastFunc
	ldr r2, _0809E464 @ =0x04000200
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #6
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r5, _0809E468 @ =0x08CE3B58
	ldr r1, [r5]
	ldr r4, _0809E46C @ =0x000073B8
	adds r1, r1, r4
	mov r0, sp
	movs r2, #4
	bl WriteSramFast
	ldr r2, _0809E470 @ =0x03005E70
	ldr r0, [r5]
	adds r0, r0, r4
	add r1, sp, #4
	ldr r3, [r2]
	movs r2, #4
	bl _call_via_r3
	ldr r3, _0809E474 @ =0x0203E79A
	movs r2, #0
	ldr r1, [sp, #4]
	ldr r0, [sp]
	cmp r1, r0
	bne _0809E450
	movs r2, #1
_0809E450:
	strb r2, [r3]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809E45C: .4byte 0x12345678
_0809E460: .4byte 0x87654321
_0809E464: .4byte 0x04000200
_0809E468: .4byte 0x08CE3B58
_0809E46C: .4byte 0x000073B8
_0809E470: .4byte 0x03005E70
_0809E474: .4byte 0x0203E79A

	thumb_func_start IsSramWorking
IsSramWorking: @ 0x0809E478
	ldr r0, _0809E484 @ =0x0203E79A
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
_0809E484: .4byte 0x0203E79A

	thumb_func_start WipeSram
WipeSram: @ 0x0809E488
	push {r4, r5, r6, lr}
	sub sp, #0x40
	movs r1, #1
	rsbs r1, r1, #0
	add r0, sp, #0x3c
_0809E492:
	str r1, [r0]
	subs r0, #4
	cmp r0, sp
	bge _0809E492
	movs r4, #0
	ldr r6, _0809E4BC @ =0x08CE3B58
	ldr r5, _0809E4C0 @ =0x000001FF
_0809E4A0:
	lsls r0, r4, #6
	ldr r1, [r6]
	adds r1, r1, r0
	mov r0, sp
	movs r2, #0x40
	bl WriteAndVerifySramFast
	adds r4, #1
	cmp r4, r5
	ble _0809E4A0
	add sp, #0x40
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809E4BC: .4byte 0x08CE3B58
_0809E4C0: .4byte 0x000001FF

	thumb_func_start Checksum16
Checksum16: @ 0x0809E4C4
	push {r4, lr}
	adds r2, r0, #0
	movs r3, #0
	movs r4, #0
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	cmp r3, r1
	bge _0809E4E4
_0809E4D6:
	ldrh r0, [r2]
	adds r3, r3, r0
	eors r4, r0
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bne _0809E4D6
_0809E4E4:
	adds r0, r3, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start LoadMetaSave
LoadMetaSave: @ 0x0809E4F0
	push {r4, r5, lr}
	sub sp, #0x64
	adds r5, r0, #0
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809E564
	cmp r5, #0
	bne _0809E506
	mov r5, sp
_0809E506:
	ldr r1, _0809E550 @ =0x03005E70
	ldr r0, _0809E554 @ =0x08CE3B58
	ldr r0, [r0]
	ldr r3, [r1]
	adds r1, r5, #0
	movs r2, #0x64
	bl _call_via_r3
	ldr r1, _0809E558 @ =0x0840F430
	adds r0, r5, #0
	bl StringEquals
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809E564
	ldr r1, [r5, #8]
	ldr r0, _0809E55C @ =0x00030317
	cmp r1, r0
	bne _0809E564
	ldr r0, _0809E560 @ =0x0000200A
	ldrh r1, [r5, #0xc]
	cmp r1, r0
	bne _0809E564
	adds r4, r5, #0
	adds r4, #0x60
	adds r0, r5, #0
	movs r1, #0x50
	bl Checksum16
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r4, [r4]
	cmp r4, r0
	bne _0809E564
	movs r0, #1
	b _0809E566
	.align 2, 0
_0809E550: .4byte 0x03005E70
_0809E554: .4byte 0x08CE3B58
_0809E558: .4byte 0x0840F430
_0809E55C: .4byte 0x00030317
_0809E560: .4byte 0x0000200A
_0809E564:
	movs r0, #0
_0809E566:
	add sp, #0x64
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SaveMetaSave
SaveMetaSave: @ 0x0809E570
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x50
	bl Checksum16
	adds r1, r4, #0
	adds r1, #0x60
	strh r0, [r1]
	ldr r0, _0809E594 @ =0x08CE3B58
	ldr r1, [r0]
	adds r0, r4, #0
	movs r2, #0x64
	bl WriteAndVerifySramFast
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809E594: .4byte 0x08CE3B58

	thumb_func_start WriteGlobalSaveInfoNoChecksum
WriteGlobalSaveInfoNoChecksum: @ 0x0809E598
	push {lr}
	ldr r1, _0809E5A8 @ =0x08CE3B58
	ldr r1, [r1]
	movs r2, #0x64
	bl WriteAndVerifySramFast
	pop {r0}
	bx r0
	.align 2, 0
_0809E5A8: .4byte 0x08CE3B58

	thumb_func_start InitGlobalSaveInfo
InitGlobalSaveInfo: @ 0x0809E5AC
	push {r4, lr}
	sub sp, #0x64
	bl WipeSram
	ldr r1, _0809E678 @ =0x0840F430
	mov r0, sp
	bl StringCopy
	ldr r0, _0809E67C @ =0x00030317
	str r0, [sp, #8]
	mov r1, sp
	movs r3, #0
	ldr r0, _0809E680 @ =0x0000200A
	strh r0, [r1, #0xc]
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r1, #0xe]
	ands r0, r2
	strb r0, [r1, #0xe]
	mov r2, sp
	movs r1, #3
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r2, #0xe]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #0xe]
	movs r1, #9
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r2, #0xe]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #0xe]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r2, #0xe]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #0xe]
	mov r1, sp
	movs r0, #0
	strb r0, [r1, #0xe]
	mov r0, sp
	strb r3, [r0, #0xf]
	strb r3, [r0, #0x10]
	ldr r0, [sp, #0x10]
	ldr r1, _0809E684 @ =0xFF0000FF
	ands r0, r1
	str r0, [sp, #0x10]
	mov r0, sp
	adds r0, #0x63
	strb r3, [r0]
	subs r0, #1
	strb r3, [r0]
	mov r1, sp
	movs r0, #0x20
	rsbs r0, r0, #0
	ldrb r2, [r1, #0x13]
	ands r0, r2
	strb r0, [r1, #0x13]
	movs r0, #0
	bl SetLang
	add r3, sp, #0x20
	add r4, sp, #0x40
	add r1, sp, #0x14
	movs r2, #0
	mov r0, sp
	adds r0, #0x1f
_0809E640:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _0809E640
	adds r1, r3, #0
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x1f
_0809E650:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _0809E650
	adds r1, r4, #0
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x1f
_0809E660:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _0809E660
	mov r0, sp
	bl SaveMetaSave
	add sp, #0x64
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809E678: .4byte 0x0840F430
_0809E67C: .4byte 0x00030317
_0809E680: .4byte 0x0000200A
_0809E684: .4byte 0xFF0000FF

	thumb_func_start ResetFe6LinkSaveInfo
ResetFe6LinkSaveInfo: @ 0x0809E688
	push {lr}
	sub sp, #0x28
	add r0, sp, #0x24
	movs r1, #0
	strh r1, [r0]
	ldr r2, _0809E6A8 @ =0x01000012
	mov r1, sp
	bl CpuSet
	mov r0, sp
	bl WriteFe6LinkSaveInfo
	add sp, #0x28
	pop {r0}
	bx r0
	.align 2, 0
_0809E6A8: .4byte 0x01000012

	thumb_func_start EraseBonusContentData
EraseBonusContentData: @ 0x0809E6AC
	push {r4, lr}
	sub sp, #4
	ldr r4, _0809E6D0 @ =0x02020140
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r2, _0809E6D4 @ =0x01000142
	mov r0, sp
	adds r1, r4, #0
	bl CpuSet
	adds r0, r4, #0
	bl SaveBonusContentData
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809E6D0: .4byte 0x02020140
_0809E6D4: .4byte 0x01000142

	thumb_func_start SramOffsetToAddr
SramOffsetToAddr: @ 0x0809E6D8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _0809E6E8 @ =0x08CE3B58
	ldr r1, [r1]
	adds r1, r1, r0
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0809E6E8: .4byte 0x08CE3B58

	thumb_func_start SramAddrToOffset
SramAddrToOffset: @ 0x0809E6EC
	ldr r1, _0809E6F8 @ =0x08CE3B58
	ldr r1, [r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bx lr
	.align 2, 0
_0809E6F8: .4byte 0x08CE3B58

	thumb_func_start ReadSaveBlockInfo
ReadSaveBlockInfo: @ 0x0809E6FC
	push {r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	bne _0809E70A
	mov r4, sp
_0809E70A:
	ldr r2, _0809E738 @ =0x03005E70
	ldr r0, _0809E73C @ =0x08CE3B58
	lsls r1, r5, #4
	adds r1, #0x64
	ldr r0, [r0]
	adds r0, r0, r1
	ldr r3, [r2]
	adds r1, r4, #0
	movs r2, #0x10
	bl _call_via_r3
	ldr r0, _0809E740 @ =0x0000200A
	ldrh r1, [r4, #4]
	cmp r1, r0
	bne _0809E794
	cmp r5, #6
	bhi _0809E794
	lsls r0, r5, #2
	ldr r1, _0809E744 @ =_0809E748
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809E738: .4byte 0x03005E70
_0809E73C: .4byte 0x08CE3B58
_0809E740: .4byte 0x0000200A
_0809E744: .4byte _0809E748
_0809E748: @ jump table
	.4byte _0809E764 @ case 0
	.4byte _0809E764 @ case 1
	.4byte _0809E764 @ case 2
	.4byte _0809E76C @ case 3
	.4byte _0809E76C @ case 4
	.4byte _0809E774 @ case 5
	.4byte _0809E77C @ case 6
_0809E764:
	ldr r1, _0809E768 @ =0x00011217
	b _0809E77E
	.align 2, 0
_0809E768: .4byte 0x00011217
_0809E76C:
	ldr r1, _0809E770 @ =0x00020509
	b _0809E77E
	.align 2, 0
_0809E770: .4byte 0x00020509
_0809E774:
	ldr r1, _0809E778 @ =0x00020112
	b _0809E77E
	.align 2, 0
_0809E778: .4byte 0x00020112
_0809E77C:
	ldr r1, _0809E790 @ =0x00020223
_0809E77E:
	ldr r0, [r4]
	cmp r0, r1
	bne _0809E794
	adds r0, r4, #0
	bl VerifySaveBlockChecksum
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0809E796
	.align 2, 0
_0809E790: .4byte 0x00020223
_0809E794:
	movs r0, #0
_0809E796:
	add sp, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start WriteSaveBlockInfo
WriteSaveBlockInfo: @ 0x0809E7A0
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	movs r7, #0
	movs r5, #0
	ldr r0, _0809E7D0 @ =0x0000200A
	strh r0, [r4, #4]
	adds r0, r6, #0
	bl GetSaveWriteAddr
	strh r0, [r4, #8]
	cmp r6, #6
	bgt _0809E826
	ldrb r0, [r4, #6]
	cmp r0, #2
	beq _0809E7F4
	cmp r0, #2
	bgt _0809E7D4
	cmp r0, #0
	beq _0809E7DE
	cmp r0, #1
	beq _0809E7E8
	b _0809E826
	.align 2, 0
_0809E7D0: .4byte 0x0000200A
_0809E7D4:
	cmp r0, #3
	beq _0809E800
	cmp r0, #0xff
	beq _0809E808
	b _0809E826
_0809E7DE:
	ldr r0, _0809E7E4 @ =0x00000D8C
	strh r0, [r4, #0xa]
	b _0809E80E
	.align 2, 0
_0809E7E4: .4byte 0x00000D8C
_0809E7E8:
	ldr r0, _0809E7F0 @ =0x00001F2C
	strh r0, [r4, #0xa]
	b _0809E80E
	.align 2, 0
_0809E7F0: .4byte 0x00001F2C
_0809E7F4:
	ldr r0, _0809E7FC @ =0x00000874
	strh r0, [r4, #0xa]
	b _0809E80E
	.align 2, 0
_0809E7FC: .4byte 0x00000874
_0809E800:
	movs r0, #0xc0
	lsls r0, r0, #4
	strh r0, [r4, #0xa]
	b _0809E80E
_0809E808:
	strh r5, [r4, #0xa]
	strh r5, [r4, #8]
	strh r5, [r4, #4]
_0809E80E:
	adds r0, r4, #0
	bl PopulateSaveBlockChecksum
	ldr r0, _0809E82C @ =0x08CE3B58
	lsls r2, r6, #4
	adds r2, #0x64
	ldr r1, [r0]
	adds r1, r1, r2
	adds r0, r4, #0
	movs r2, #0x10
	bl WriteAndVerifySramFast
_0809E826:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809E82C: .4byte 0x08CE3B58

	thumb_func_start EraseSaveBlockInfo
EraseSaveBlockInfo: @ 0x0809E830
	push {r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	cmp r4, #6
	bgt _0809E85C
	add r0, sp, #0x10
	ldr r2, _0809E864 @ =0x0000FFFF
	adds r1, r2, #0
	strh r1, [r0]
	ldr r2, _0809E868 @ =0x01000008
	mov r1, sp
	bl CpuSet
	ldr r1, _0809E86C @ =0x08CE3B58
	lsls r0, r4, #4
	adds r0, #0x64
	ldr r1, [r1]
	adds r1, r1, r0
	mov r0, sp
	movs r2, #0x10
	bl WriteAndVerifySramFast
_0809E85C:
	add sp, #0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809E864: .4byte 0x0000FFFF
_0809E868: .4byte 0x01000008
_0809E86C: .4byte 0x08CE3B58

	thumb_func_start GetSaveWriteAddr
GetSaveWriteAddr: @ 0x0809E870
	cmp r0, #6
	bhi _0809E914
	lsls r0, r0, #2
	ldr r1, _0809E880 @ =_0809E884
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809E880: .4byte _0809E884
_0809E884: @ jump table
	.4byte _0809E8A0 @ case 0
	.4byte _0809E8B4 @ case 1
	.4byte _0809E8C8 @ case 2
	.4byte _0809E8DC @ case 3
	.4byte _0809E8E8 @ case 4
	.4byte _0809E8F8 @ case 5
	.4byte _0809E90C @ case 6
_0809E8A0:
	ldr r0, _0809E8AC @ =0x08CE3B58
	ldr r0, [r0]
	ldr r1, _0809E8B0 @ =0x00003F2C
	adds r0, r0, r1
	b _0809E916
	.align 2, 0
_0809E8AC: .4byte 0x08CE3B58
_0809E8B0: .4byte 0x00003F2C
_0809E8B4:
	ldr r0, _0809E8C0 @ =0x08CE3B58
	ldr r0, [r0]
	ldr r1, _0809E8C4 @ =0x00004CB8
	adds r0, r0, r1
	b _0809E916
	.align 2, 0
_0809E8C0: .4byte 0x08CE3B58
_0809E8C4: .4byte 0x00004CB8
_0809E8C8:
	ldr r0, _0809E8D4 @ =0x08CE3B58
	ldr r0, [r0]
	ldr r1, _0809E8D8 @ =0x00005A44
	adds r0, r0, r1
	b _0809E916
	.align 2, 0
_0809E8D4: .4byte 0x08CE3B58
_0809E8D8: .4byte 0x00005A44
_0809E8DC:
	ldr r0, _0809E8E4 @ =0x08CE3B58
	ldr r0, [r0]
	adds r0, #0xd4
	b _0809E916
	.align 2, 0
_0809E8E4: .4byte 0x08CE3B58
_0809E8E8:
	ldr r0, _0809E8F4 @ =0x08CE3B58
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	adds r0, r0, r1
	b _0809E916
	.align 2, 0
_0809E8F4: .4byte 0x08CE3B58
_0809E8F8:
	ldr r0, _0809E904 @ =0x08CE3B58
	ldr r0, [r0]
	ldr r1, _0809E908 @ =0x000067D0
	adds r0, r0, r1
	b _0809E916
	.align 2, 0
_0809E904: .4byte 0x08CE3B58
_0809E908: .4byte 0x000067D0
_0809E90C:
	ldr r0, _0809E910 @ =0x0E007400
	b _0809E916
	.align 2, 0
_0809E910: .4byte 0x0E007400
_0809E914:
	movs r0, #0
_0809E916:
	bx lr

	thumb_func_start GetSaveReadAddr
GetSaveReadAddr: @ 0x0809E918
	push {lr}
	sub sp, #0x10
	adds r1, r0, #0
	mov r0, sp
	bl ReadSaveBlockInfo
	mov r0, sp
	ldrh r0, [r0, #8]
	bl SramOffsetToAddr
	add sp, #0x10
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0809E934
sub_0809E934: @ 0x0809E934
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_08079930
	adds r5, r0, #0
	bl sub_08079938
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl WriteAndVerifySramFast
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0809E954
sub_0809E954: @ 0x0809E954
	push {r4, r5, lr}
	adds r4, r0, #0
	bl GetPermanentFlagBits
	adds r5, r0, #0
	bl sub_0807992C
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl WriteAndVerifySramFast
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0809E974
sub_0809E974: @ 0x0809E974
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0809E998 @ =0x03005E70
	bl sub_08079930
	adds r5, r0, #0
	bl sub_08079938
	adds r2, r0, #0
	ldr r3, [r4]
	adds r0, r6, #0
	adds r1, r5, #0
	bl _call_via_r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809E998: .4byte 0x03005E70

	thumb_func_start sub_0809E99C
sub_0809E99C: @ 0x0809E99C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0809E9C0 @ =0x03005E70
	bl GetPermanentFlagBits
	adds r5, r0, #0
	bl sub_0807992C
	adds r2, r0, #0
	ldr r3, [r4]
	adds r0, r6, #0
	adds r1, r5, #0
	bl _call_via_r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809E9C0: .4byte 0x03005E70

	thumb_func_start sub_0809E9C4
sub_0809E9C4: @ 0x0809E9C4
	push {r4, lr}
	adds r4, r0, #0
	bl GetConvoyItemArray
	adds r1, r4, #0
	movs r2, #0xc8
	bl WriteAndVerifySramFast
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0809E9DC
sub_0809E9DC: @ 0x0809E9DC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0809E9F8 @ =0x03005E70
	bl GetConvoyItemArray
	adds r1, r0, #0
	ldr r3, [r4]
	adds r0, r5, #0
	movs r2, #0xc8
	bl _call_via_r3
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809E9F8: .4byte 0x03005E70

	thumb_func_start sub_0809E9FC
sub_0809E9FC: @ 0x0809E9FC
	push {r4, r5, lr}
	sub sp, #0x64
	movs r4, #0
	mov r0, sp
	bl LoadMetaSave
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809EA4C
	mov r0, sp
	bl MetaSave_CountCompletedPlaythroughs
	adds r5, r0, #0
	bl CheckLinkedToFE6
	rsbs r1, r0, #0
	orrs r1, r0
	asrs r4, r1, #0x1f
	movs r0, #2
	ands r4, r0
	mov r0, sp
	ldrb r1, [r0, #0xe]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809EA4C
	movs r0, #0xc
	ands r0, r1
	cmp r0, #0
	beq _0809EA3A
	movs r4, #0xf
_0809EA3A:
	movs r2, #0x10
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0809EA46
	orrs r4, r2
_0809EA46:
	cmp r5, #4
	ble _0809EA4C
	orrs r4, r2
_0809EA4C:
	adds r0, r4, #0
	add sp, #0x64
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0809EA58
sub_0809EA58: @ 0x0809EA58
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl LoadMetaSave
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809EA6C
	movs r0, #0
	b _0809EA74
_0809EA6C:
	mov r0, sp
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1f
_0809EA74:
	add sp, #0x64
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0809EA7C
sub_0809EA7C: @ 0x0809EA7C
	movs r0, #1
	bx lr

	thumb_func_start IsExtraLinkArenaEnabled
IsExtraLinkArenaEnabled: @ 0x0809EA80
	push {r4, lr}
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809EA94
	movs r0, #0
	b _0809EAB0
_0809EA90:
	movs r0, #1
	b _0809EAB0
_0809EA94:
	movs r4, #0
_0809EA96:
	adds r0, r4, #0
	bl IsGameSaveNotFirstChapter
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809EA90
	adds r4, #1
	cmp r4, #2
	ble _0809EA96
	bl IsMultiArenaSaveReady
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_0809EAB0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0809EAB8
sub_0809EAB8: @ 0x0809EAB8
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl LoadMetaSave
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809EAD8
	mov r1, sp
	movs r0, #3
	ldrb r1, [r1, #0xe]
	ands r0, r1
	cmp r0, #0
	beq _0809EAD8
	movs r0, #1
	b _0809EADA
_0809EAD8:
	movs r0, #0
_0809EADA:
	add sp, #0x64
	pop {r1}
	bx r1

	thumb_func_start IsExtraSupportViewerEnabled
IsExtraSupportViewerEnabled: @ 0x0809EAE0
	push {r4, lr}
	movs r0, #0
	bl MetaSave_HasMetAnyCharacter
	adds r4, r0, #0
	bl WasGameBeatenAtLeastOnce
	ands r0, r4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetRankDataValidBitMap
GetRankDataValidBitMap: @ 0x0809EAFC
	push {r4, lr}
	sub sp, #0x94
	movs r4, #0
	bl WasGameBeatenAtLeastOnce
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809EB10
	movs r0, #0
	b _0809EB70
_0809EB10:
	mov r0, sp
	bl LoadAndVerfyRankData
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809EB6E
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _0809EB28
	movs r4, #1
_0809EB28:
	mov r0, sp
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _0809EB36
	movs r0, #2
	orrs r4, r0
_0809EB36:
	add r0, sp, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _0809EB44
	movs r0, #4
	orrs r4, r0
_0809EB44:
	add r0, sp, #0x48
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _0809EB52
	movs r0, #8
	orrs r4, r0
_0809EB52:
	add r0, sp, #0x60
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _0809EB60
	movs r0, #0x10
	orrs r4, r0
_0809EB60:
	add r0, sp, #0x78
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _0809EB6E
	movs r0, #0x20
	orrs r4, r0
_0809EB6E:
	adds r0, r4, #0
_0809EB70:
	add sp, #0x94
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0809EB78
sub_0809EB78: @ 0x0809EB78
	push {r4, lr}
	ldr r4, _0809EBB4 @ =0x02020140
	adds r0, r4, #0
	bl LoadBonusContentData
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809EBB8
	movs r3, #0
	adds r1, r4, #0
	movs r2, #0x1f
_0809EB8E:
	ldrb r0, [r1]
	cmp r0, #0
	beq _0809EBA2
	ldrb r0, [r1, #1]
	cmp r0, #0
	bne _0809EB9C
	movs r3, #1
_0809EB9C:
	cmp r0, #2
	bne _0809EBA2
	movs r3, #1
_0809EBA2:
	adds r1, #0x14
	subs r2, #1
	cmp r2, #0
	bge _0809EB8E
	cmp r3, #0
	beq _0809EBB8
	movs r0, #1
	b _0809EBBA
	.align 2, 0
_0809EBB4: .4byte 0x02020140
_0809EBB8:
	movs r0, #0
_0809EBBA:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start GetUnitsAverageSupportValue
GetUnitsAverageSupportValue: @ 0x0809EBC0
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	ldr r7, _0809EBF0 @ =0x08CE3B5C
	ldr r0, [r7]
	cmp r0, #0
	beq _0809EC1C
	movs r6, #0
	adds r5, r7, #0
	adds r3, r7, #4
	adds r4, r7, #0
_0809EBD4:
	ldr r0, [r4]
	cmp r0, r2
	bne _0809EBE0
	ldr r0, [r3]
	cmp r0, r1
	bne _0809EBEC
_0809EBE0:
	ldr r0, [r4]
	cmp r0, r1
	bne _0809EBF4
	ldr r0, [r3]
	cmp r0, r2
	beq _0809EBFA
_0809EBEC:
	movs r0, #2
	b _0809EC1E
	.align 2, 0
_0809EBF0: .4byte 0x08CE3B5C
_0809EBF4:
	ldr r0, [r3]
	cmp r0, r2
	bne _0809EC00
_0809EBFA:
	ldr r0, [r4]
	cmp r0, r1
	bne _0809EBEC
_0809EC00:
	ldr r0, [r3]
	cmp r0, r1
	bne _0809EC0C
	ldr r0, [r5]
	cmp r0, r2
	bne _0809EBEC
_0809EC0C:
	adds r6, #8
	adds r5, #8
	adds r3, #8
	adds r4, #8
	adds r0, r6, r7
	ldr r0, [r0]
	cmp r0, #0
	bne _0809EBD4
_0809EC1C:
	movs r0, #3
_0809EC1E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start GetTotalAverageSupportValue
GetTotalAverageSupportValue: @ 0x0809EC24
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _0809EC2C @ =0x08C9F9F4
	b _0809EC3C
	.align 2, 0
_0809EC2C: .4byte 0x08C9F9F4
_0809EC30:
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	bl GetUnitsAverageSupportValue
	adds r5, r5, r0
	adds r4, #0x14
_0809EC3C:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0809EC30
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetTotalGlobalSupportValue
GetTotalGlobalSupportValue: @ 0x0809EC4C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x64
	adds r4, r0, #0
	movs r5, #0
	cmp r4, #0
	bne _0809EC60
	mov r4, sp
	mov r0, sp
	bl LoadMetaSave
_0809EC60:
	movs r0, #0
	adds r7, r4, #0
	adds r7, #0x20
	movs r6, #3
_0809EC68:
	movs r2, #0
	adds r4, r0, #1
	adds r0, r7, r0
	ldrb r3, [r0]
_0809EC70:
	lsls r1, r2, #1
	adds r0, r3, #0
	asrs r0, r1
	ands r0, r6
	adds r5, r5, r0
	adds r2, #1
	cmp r2, #3
	ble _0809EC70
	adds r0, r4, #0
	cmp r0, #0x1f
	ble _0809EC68
	adds r0, r5, #0
	add sp, #0x64
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start GetTotalSupportCollection
GetTotalSupportCollection: @ 0x0809EC90
	push {r4, r5, lr}
	movs r0, #0
	bl GetTotalGlobalSupportValue
	adds r4, r0, #0
	bl GetTotalAverageSupportValue
	adds r5, r0, #0
	cmp r4, #0
	ble _0809ECB6
	movs r0, #0x64
	muls r0, r4, r0
	adds r1, r5, #0
	bl __divsi3
	cmp r0, #0
	bne _0809ECB6
	movs r4, #1
	b _0809ECC2
_0809ECB6:
	movs r0, #0x64
	muls r0, r4, r0
	adds r1, r5, #0
	bl __divsi3
	adds r4, r0, #0
_0809ECC2:
	cmp r4, #0x64
	ble _0809ECC8
	movs r4, #0x64
_0809ECC8:
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start GetGlobalBestSupport
GetGlobalBestSupport: @ 0x0809ECD0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x68
	adds r3, r0, #0
	adds r7, r1, #0
	adds r4, r2, #0
	movs r6, #0
	ldr r5, _0809ECF4 @ =0x08C9F9F4
	cmp r4, #0
	bne _0809ECEE
	mov r4, sp
	mov r0, sp
	str r3, [sp, #0x64]
	bl LoadMetaSave
	ldr r3, [sp, #0x64]
_0809ECEE:
	adds r4, #0x20
	b _0809ECFC
	.align 2, 0
_0809ECF4: .4byte 0x08C9F9F4
_0809ECF8:
	adds r6, #1
	adds r5, #0x14
_0809ECFC:
	ldrb r0, [r5]
	cmp r0, #0
	beq _0809ED18
	adds r1, r0, #0
	cmp r1, r3
	bne _0809ED0E
	ldrb r0, [r5, #1]
	cmp r0, r7
	beq _0809ED18
_0809ED0E:
	cmp r1, r7
	bne _0809ECF8
	ldrb r0, [r5, #1]
	cmp r0, r3
	bne _0809ECF8
_0809ED18:
	asrs r1, r6, #2
	movs r2, #3
	ands r6, r2
	lsls r0, r6, #1
	adds r1, r4, r1
	ldrb r1, [r1]
	asrs r1, r0
	adds r0, r1, #0
	ands r0, r2
	add sp, #0x68
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetGlobalSupportListFromSave
GetGlobalSupportListFromSave: @ 0x0809ED34
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x78
	mov sb, r0
	adds r6, r1, #0
	mov sl, r2
	ldr r1, _0809ED74 @ =0x08BDCE4C
	mov r7, sb
	subs r7, #1
	movs r0, #0x34
	adds r2, r7, #0
	muls r2, r0, r2
	str r2, [sp, #0x64]
	adds r0, r1, #0
	adds r0, #0x2c
	adds r2, r2, r0
	mov r8, r2
	ldr r0, [r2]
	cmp r0, #0
	bne _0809ED78
	movs r0, #0
	movs r1, #6
_0809ED66:
	strb r0, [r6]
	adds r6, #1
	subs r1, #1
	cmp r1, #0
	bge _0809ED66
	b _0809EE3A
	.align 2, 0
_0809ED74: .4byte 0x08BDCE4C
_0809ED78:
	movs r5, #0
	ldr r4, _0809EE00 @ =0x08C9F9F4
	mov r3, sl
	cmp r3, #0
	bne _0809ED8A
	mov sl, sp
	mov r0, sp
	bl LoadMetaSave
_0809ED8A:
	ldrb r0, [r4]
	str r7, [sp, #0x70]
	cmp r0, #0
	beq _0809EE1A
	mov r7, r8
	str r7, [sp, #0x6c]
	ldr r0, [sp, #0x64]
	str r0, [sp, #0x68]
_0809ED9A:
	ldrb r0, [r4]
	cmp r0, sb
	beq _0809EDB0
	ldrb r0, [r4, #1]
	adds r1, r5, #1
	mov ip, r1
	adds r2, r4, #0
	adds r2, #0x14
	str r2, [sp, #0x74]
	cmp r0, sb
	bne _0809EE10
_0809EDB0:
	asrs r2, r5, #2
	adds r0, r5, #0
	movs r3, #3
	ands r0, r3
	lsls r0, r0, #1
	mov r8, r0
	movs r1, #0
	ldr r7, [sp, #0x6c]
	ldr r0, [r7]
	adds r5, #1
	mov ip, r5
	adds r3, r4, #0
	adds r3, #0x14
	str r3, [sp, #0x74]
	ldrb r0, [r0, #0x15]
	cmp r1, r0
	bge _0809EE10
	ldr r0, _0809EE04 @ =0x08BDCE78
	ldr r5, [sp, #0x68]
	adds r3, r5, r0
	mov r0, sl
	adds r0, #0x20
	adds r5, r0, r2
_0809EDDE:
	ldr r2, [r3]
	adds r0, r2, r1
	ldrb r0, [r0]
	ldrb r7, [r4]
	cmp r7, r0
	beq _0809EDF0
	ldrb r7, [r4, #1]
	cmp r7, r0
	bne _0809EE08
_0809EDF0:
	adds r1, r6, r1
	ldrb r0, [r5]
	mov r2, r8
	asrs r0, r2
	movs r3, #3
	ands r0, r3
	strb r0, [r1]
	b _0809EE10
	.align 2, 0
_0809EE00: .4byte 0x08C9F9F4
_0809EE04: .4byte 0x08BDCE78
_0809EE08:
	adds r1, #1
	ldrb r2, [r2, #0x15]
	cmp r1, r2
	blt _0809EDDE
_0809EE10:
	mov r5, ip
	ldr r4, [sp, #0x74]
	ldrb r0, [r4]
	cmp r0, #0
	bne _0809ED9A
_0809EE1A:
	movs r0, #0x34
	ldr r5, [sp, #0x70]
	muls r0, r5, r0
	ldr r1, _0809EE4C @ =0x08BDCE4C
	adds r1, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r1, [r0, #0x15]
	cmp r1, #6
	bgt _0809EE3A
	movs r2, #0
_0809EE30:
	adds r0, r6, r1
	strb r2, [r0]
	adds r1, #1
	cmp r1, #6
	ble _0809EE30
_0809EE3A:
	add sp, #0x78
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809EE4C: .4byte 0x08BDCE4C

	thumb_func_start UpdateBestGlobalSupportValue
UpdateBestGlobalSupportValue: @ 0x0809EE50
	push {r4, r5, r6, r7, lr}
	sub sp, #0x64
	adds r5, r0, #0
	adds r4, r1, #0
	movs r6, #3
	ands r6, r2
	mov r0, sp
	bl LoadMetaSave
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809EEC0
	movs r3, #0
	ldr r2, _0809EE70 @ =0x08C9F9F4
	add r7, sp, #0x20
	b _0809EE78
	.align 2, 0
_0809EE70: .4byte 0x08C9F9F4
_0809EE74:
	adds r3, #1
	adds r2, #0x14
_0809EE78:
	ldrb r0, [r2]
	cmp r0, #0
	beq _0809EE94
	adds r1, r0, #0
	cmp r1, r5
	bne _0809EE8A
	ldrb r0, [r2, #1]
	cmp r0, r4
	beq _0809EE94
_0809EE8A:
	cmp r1, r4
	bne _0809EE74
	ldrb r0, [r2, #1]
	cmp r0, r5
	bne _0809EE74
_0809EE94:
	asrs r0, r3, #2
	movs r4, #3
	ands r3, r4
	lsls r1, r3, #1
	adds r3, r7, r0
	ldrb r2, [r3]
	adds r0, r2, #0
	asrs r0, r1
	ands r0, r4
	cmp r0, r6
	bge _0809EEC0
	adds r0, r4, #0
	lsls r0, r1
	bics r2, r0
	lsls r6, r1
	adds r0, r2, r6
	strb r0, [r3]
	mov r0, sp
	bl SaveMetaSave
	movs r0, #1
	b _0809EEC2
_0809EEC0:
	movs r0, #0
_0809EEC2:
	add sp, #0x64
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start MetaSave_SetMetCharacter
MetaSave_SetMetCharacter: @ 0x0809EECC
	push {r4, r5, lr}
	sub sp, #0x64
	adds r4, r0, #0
	adds r5, r1, #0
	movs r3, #0
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r4, r0
	bgt _0809EF0C
	cmp r5, #0
	bne _0809EEEC
	mov r5, sp
	mov r0, sp
	bl LoadMetaSave
	movs r3, #1
_0809EEEC:
	asrs r0, r4, #3
	adds r2, r5, #0
	adds r2, #0x40
	adds r2, r2, r0
	movs r1, #7
	ands r1, r4
	movs r0, #1
	lsls r0, r1
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	cmp r3, #0
	beq _0809EF0C
	adds r0, r5, #0
	bl SaveMetaSave
_0809EF0C:
	add sp, #0x64
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start MetaSave_HasMetCharacter
MetaSave_HasMetCharacter: @ 0x0809EF14
	push {r4, r5, lr}
	sub sp, #0x64
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r5, r0
	bgt _0809EF4A
	cmp r4, #0
	bne _0809EF30
	mov r4, sp
	mov r0, sp
	bl LoadMetaSave
_0809EF30:
	asrs r0, r5, #3
	adds r1, r4, #0
	adds r1, #0x40
	adds r1, r1, r0
	movs r0, #7
	ands r0, r5
	ldrb r1, [r1]
	asrs r1, r0
	adds r0, r1, #0
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0809EF4E
_0809EF4A:
	movs r0, #0
	b _0809EF50
_0809EF4E:
	movs r0, #1
_0809EF50:
	add sp, #0x64
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start MetaSave_HasMetAnyCharacter
MetaSave_HasMetAnyCharacter: @ 0x0809EF58
	push {r4, lr}
	sub sp, #0x64
	adds r4, r0, #0
	cmp r4, #0
	bne _0809EF6A
	mov r4, sp
	mov r0, sp
	bl LoadMetaSave
_0809EF6A:
	movs r1, #0
	adds r2, r4, #0
	adds r2, #0x40
_0809EF70:
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809EF7C
	movs r0, #1
	b _0809EF84
_0809EF7C:
	adds r1, #1
	cmp r1, #0x1f
	ble _0809EF70
	movs r0, #0
_0809EF84:
	add sp, #0x64
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0809EF8C
sub_0809EF8C: @ 0x0809EF8C
	bx lr
	.align 2, 0

	thumb_func_start sub_0809EF90
sub_0809EF90: @ 0x0809EF90
	bx lr
	.align 2, 0

	thumb_func_start WasGameBeatenAtLeastOnce
WasGameBeatenAtLeastOnce: @ 0x0809EF94
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl LoadMetaSave
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809EFB4
	mov r1, sp
	movs r0, #1
	ldrb r1, [r1, #0xe]
	ands r0, r1
	cmp r0, #0
	beq _0809EFB4
	movs r0, #1
	b _0809EFB6
_0809EFB4:
	movs r0, #0
_0809EFB6:
	add sp, #0x64
	pop {r1}
	bx r1

	thumb_func_start CheckLinkedToFE6
CheckLinkedToFE6: @ 0x0809EFBC
	push {r4, lr}
	sub sp, #0x88
	add r4, sp, #0x24
	adds r0, r4, #0
	bl LoadMetaSave
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809EFE4
	adds r0, r4, #0
	bl MetaSave_CountCompletedPlaythroughs
	cmp r0, #9
	ble _0809EFDC
	movs r0, #2
	b _0809EFF8
_0809EFDC:
	cmp r0, #7
	ble _0809EFE4
	movs r0, #1
	b _0809EFF8
_0809EFE4:
	mov r0, sp
	bl ReadFe6LinkSaveInfo
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809EFF4
	movs r0, #0
	b _0809EFF8
_0809EFF4:
	mov r0, sp
	ldrh r0, [r0, #0x20]
_0809EFF8:
	add sp, #0x88
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start ReadFe6LinkSaveInfo
ReadFe6LinkSaveInfo: @ 0x0809F000
	push {r4, lr}
	sub sp, #0x24
	adds r4, r0, #0
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809F04C
	cmp r4, #0
	bne _0809F016
	mov r4, sp
_0809F016:
	ldr r1, _0809F040 @ =0x03005E70
	ldr r0, _0809F044 @ =0x08CE3B58
	ldr r0, [r0]
	ldr r2, _0809F048 @ =0x000070D8
	adds r0, r0, r2
	ldr r3, [r1]
	adds r1, r4, #0
	movs r2, #0x24
	bl _call_via_r3
	adds r0, r4, #0
	movs r1, #0x22
	bl Checksum16
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r4, [r4, #0x22]
	cmp r4, r0
	bne _0809F04C
	movs r0, #1
	b _0809F04E
	.align 2, 0
_0809F040: .4byte 0x03005E70
_0809F044: .4byte 0x08CE3B58
_0809F048: .4byte 0x000070D8
_0809F04C:
	movs r0, #0
_0809F04E:
	add sp, #0x24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start WriteFe6LinkSaveInfo
WriteFe6LinkSaveInfo: @ 0x0809F058
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x22
	bl Checksum16
	strh r0, [r4, #0x22]
	ldr r0, _0809F07C @ =0x08CE3B58
	ldr r1, [r0]
	ldr r0, _0809F080 @ =0x000070D8
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #0x24
	bl WriteAndVerifySramFast
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809F07C: .4byte 0x08CE3B58
_0809F080: .4byte 0x000070D8

	thumb_func_start sub_0809F084
sub_0809F084: @ 0x0809F084
	push {lr}
	sub sp, #4
	adds r1, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r2, _0809F09C @ =0x01000009
	mov r0, sp
	bl CpuFastSet
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0809F09C: .4byte 0x01000009

	thumb_func_start sub_0809F0A0
sub_0809F0A0: @ 0x0809F0A0
	asrs r2, r1, #5
	lsls r2, r2, #2
	adds r0, r0, r2
	ldr r0, [r0]
	movs r2, #0x1f
	ands r2, r1
	movs r1, #1
	lsls r1, r2
	ands r0, r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr

	thumb_func_start sub_0809F0B8
sub_0809F0B8: @ 0x0809F0B8
	asrs r2, r1, #5
	lsls r2, r2, #2
	adds r0, r0, r2
	movs r2, #0x1f
	ands r2, r1
	movs r3, #1
	lsls r3, r2
	ldr r1, [r0]
	orrs r1, r3
	str r1, [r0]
	bx lr
	.align 2, 0

	thumb_func_start sub_0809F0D0
sub_0809F0D0: @ 0x0809F0D0
	strh r1, [r0, #0x20]
	bx lr

	thumb_func_start sub_0809F0D4
sub_0809F0D4: @ 0x0809F0D4
	ldrh r0, [r0, #0x20]
	bx lr

	thumb_func_start LoadAndVerfyRankData
LoadAndVerfyRankData: @ 0x0809F0D8
	push {r4, r5, lr}
	adds r5, r0, #0
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809F12C
	cmp r5, #0
	bne _0809F0EC
	ldr r5, _0809F11C @ =0x02020140
_0809F0EC:
	ldr r1, _0809F120 @ =0x03005E70
	ldr r0, _0809F124 @ =0x08CE3B58
	ldr r0, [r0]
	ldr r2, _0809F128 @ =0x00007044
	adds r0, r0, r2
	ldr r3, [r1]
	adds r1, r5, #0
	movs r2, #0x94
	bl _call_via_r3
	adds r4, r5, #0
	adds r4, #0x90
	adds r0, r5, #0
	movs r1, #0x90
	bl Checksum16
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r4, [r4]
	cmp r4, r0
	bne _0809F12C
	movs r0, #1
	b _0809F12E
	.align 2, 0
_0809F11C: .4byte 0x02020140
_0809F120: .4byte 0x03005E70
_0809F124: .4byte 0x08CE3B58
_0809F128: .4byte 0x00007044
_0809F12C:
	movs r0, #0
_0809F12E:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start LoadBonusContentData
LoadBonusContentData: @ 0x0809F134
	push {r4, r5, lr}
	adds r5, r0, #0
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809F188
	cmp r5, #0
	bne _0809F148
	ldr r5, _0809F178 @ =0x02020140
_0809F148:
	ldr r1, _0809F17C @ =0x03005E70
	ldr r0, _0809F180 @ =0x08CE3B58
	ldr r0, [r0]
	ldr r2, _0809F184 @ =0x00007134
	adds r0, r0, r2
	movs r2, #0xa1
	lsls r2, r2, #2
	ldr r3, [r1]
	adds r1, r5, #0
	bl _call_via_r3
	movs r1, #0xa0
	lsls r1, r1, #2
	adds r4, r5, r1
	adds r0, r5, #0
	bl Checksum16
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r4, [r4]
	cmp r4, r0
	bne _0809F188
	movs r0, #1
	b _0809F18A
	.align 2, 0
_0809F178: .4byte 0x02020140
_0809F17C: .4byte 0x03005E70
_0809F180: .4byte 0x08CE3B58
_0809F184: .4byte 0x00007134
_0809F188:
	movs r0, #0
_0809F18A:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start SaveBonusContentData
SaveBonusContentData: @ 0x0809F190
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0xa0
	lsls r4, r4, #2
	adds r1, r4, #0
	bl Checksum16
	adds r4, r5, r4
	strh r0, [r4]
	ldr r0, _0809F1BC @ =0x08CE3B58
	ldr r1, [r0]
	ldr r0, _0809F1C0 @ =0x00007134
	adds r1, r1, r0
	movs r2, #0xa1
	lsls r2, r2, #2
	adds r0, r5, #0
	bl WriteAndVerifySramFast
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809F1BC: .4byte 0x08CE3B58
_0809F1C0: .4byte 0x00007134

	thumb_func_start SaveRankings
SaveRankings: @ 0x0809F1C4
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x90
	bl Checksum16
	adds r1, r4, #0
	adds r1, #0x90
	strh r0, [r1]
	ldr r0, _0809F1EC @ =0x08CE3B58
	ldr r1, [r0]
	ldr r0, _0809F1F0 @ =0x00007044
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #0x94
	bl WriteAndVerifySramFast
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809F1EC: .4byte 0x08CE3B58
_0809F1F0: .4byte 0x00007044

	thumb_func_start EraseSaveRankData
EraseSaveRankData: @ 0x0809F1F4
	push {lr}
	sub sp, #0x98
	add r0, sp, #0x94
	movs r1, #0
	strh r1, [r0]
	ldr r2, _0809F214 @ =0x0100004A
	mov r1, sp
	bl CpuSet
	mov r0, sp
	bl SaveRankings
	add sp, #0x98
	pop {r0}
	bx r0
	.align 2, 0
_0809F214: .4byte 0x0100004A

	thumb_func_start GetNextChapterMode
GetNextChapterMode: @ 0x0809F218
	ldr r0, _0809F220 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	subs r0, #1
	bx lr
	.align 2, 0
_0809F220: .4byte 0x0202BBF8

	thumb_func_start sub_0809F224
sub_0809F224: @ 0x0809F224
	push {r4, r5, r6, r7, lr}
	sub sp, #0x98
	adds r6, r0, #0
	adds r7, r1, #0
	adds r5, r2, #0
	add r0, sp, #0x94
	movs r4, #0
	strh r4, [r0]
	ldr r2, _0809F25C @ =0x0100000C
	adds r1, r6, #0
	bl CpuSet
	mov r0, sp
	adds r0, #0x96
	strh r4, [r0]
	ldr r2, _0809F260 @ =0x0100004A
	mov r1, sp
	bl CpuSet
	mov r0, sp
	bl LoadAndVerfyRankData
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809F264
	movs r0, #0
	b _0809F280
	.align 2, 0
_0809F25C: .4byte 0x0100000C
_0809F260: .4byte 0x0100004A
_0809F264:
	lsls r0, r5, #1
	adds r0, r0, r5
	adds r0, r7, r0
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r1, r6, #0
	mov r3, sp
	adds r0, r3, r2
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	movs r0, #1
_0809F280:
	add sp, #0x98
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start SaveNewRankData
SaveNewRankData: @ 0x0809F288
	push {r4, r5, r6, lr}
	sub sp, #0x94
	adds r6, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	mov r0, sp
	bl LoadAndVerfyRankData
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809F2BE
	lsls r1, r4, #1
	adds r1, r1, r4
	adds r1, r5, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	mov r2, sp
	adds r1, r2, r0
	adds r0, r6, #0
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	mov r0, sp
	bl SaveRankings
_0809F2BE:
	add sp, #0x94
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start JudgeGameRankSaveData
JudgeGameRankSaveData: @ 0x0809F2C8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldrb r2, [r5]
	lsls r0, r2, #0x1f
	cmp r0, #0
	beq _0809F376
	ldrb r1, [r4]
	lsls r0, r1, #0x1c
	lsrs r1, r0, #0x1d
	lsls r0, r2, #0x1c
	lsrs r0, r0, #0x1d
	cmp r1, r0
	bgt _0809F376
	cmp r1, r0
	bne _0809F380
	ldrb r0, [r4, #0x17]
	cmp r0, #0
	beq _0809F2F4
	ldrb r2, [r5, #0x17]
	cmp r0, r2
	bne _0809F376
_0809F2F4:
	ldrh r0, [r4, #2]
	lsls r1, r0, #0x11
	lsrs r1, r1, #0x18
	ldrh r2, [r5, #2]
	lsls r0, r2, #0x11
	lsrs r0, r0, #0x18
	cmp r1, r0
	bgt _0809F376
	ldrb r0, [r4, #7]
	lsrs r2, r0, #5
	ldr r0, [r4, #8]
	ldr r1, _0809F37C @ =0x001FFFFF
	ands r0, r1
	lsls r3, r0, #3
	orrs r3, r2
	ldrb r0, [r5, #7]
	lsrs r2, r0, #5
	ldr r0, [r5, #8]
	ands r0, r1
	lsls r0, r0, #3
	orrs r0, r2
	cmp r3, r0
	bgt _0809F376
	cmp r3, r0
	bne _0809F380
	ldr r0, [r4, #4]
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x16
	lsls r3, r0, #3
	subs r3, r3, r0
	lsls r3, r3, #5
	adds r3, r3, r0
	lsls r3, r3, #4
	ldrb r2, [r4, #6]
	lsls r1, r2, #0x19
	lsrs r1, r1, #0x1a
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r3, r3, r0
	ldrh r4, [r4, #6]
	lsls r0, r4, #0x13
	lsrs r0, r0, #0x1a
	adds r3, r3, r0
	ldr r0, [r5, #4]
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x16
	lsls r2, r0, #3
	subs r2, r2, r0
	lsls r2, r2, #5
	adds r2, r2, r0
	lsls r2, r2, #4
	ldrb r0, [r5, #6]
	lsls r1, r0, #0x19
	lsrs r1, r1, #0x1a
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r2, r2, r0
	ldrh r5, [r5, #6]
	lsls r0, r5, #0x13
	lsrs r0, r0, #0x1a
	adds r2, r2, r0
	cmp r3, r2
	bge _0809F380
_0809F376:
	movs r0, #1
	b _0809F382
	.align 2, 0
_0809F37C: .4byte 0x001FFFFF
_0809F380:
	movs r0, #0
_0809F382:
	pop {r4, r5}
	pop {r1}
	bx r1

