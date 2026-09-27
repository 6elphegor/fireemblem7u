	.include "macro.inc"

	.syntax unified

	thumb_func_start SioTeamList_8043D8C
SioTeamList_8043D8C: @ 0x0803E930
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r0, [r7, #0x40]
	mov sb, r0
	ldr r1, [r7, #0x2c]
	str r1, [sp, #4]
	ldr r0, _0803E974 @ =0x08B98BDC
	bl IsKeyInputSequenceComplete
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803E97C
	ldr r0, _0803E978 @ =0x0203DA78
	mov r2, sb
	lsls r1, r2, #1
	add r1, sb
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0x80
	ldrb r1, [r1, #0x13]
	ands r0, r1
	cmp r0, #0
	bne _0803E97C
	adds r0, r7, #0
	movs r1, #8
	bl Proc_Goto
	b _0803EE24
	.align 2, 0
_0803E974: .4byte 0x08B98BDC
_0803E978: .4byte 0x0203DA78
_0803E97C:
	ldr r1, [sp, #4]
	adds r1, #0x44
	movs r0, #0
	strb r0, [r1]
	adds r1, r7, #0
	adds r1, #0x48
	ldr r0, [r7, #0x40]
	ldrb r3, [r1]
	subs r0, r0, r3
	lsls r0, r0, #4
	adds r0, #0x28
	ldr r2, [sp, #4]
	str r0, [r2, #0x48]
	adds r0, r7, #0
	adds r0, #0x4c
	movs r2, #0
	ldrsb r2, [r0, r2]
	mov sl, r1
	str r0, [sp, #8]
	cmp r2, #0
	ble _0803E9DE
	adds r4, r7, #0
	adds r4, #0x4a
	ldrh r0, [r4]
	subs r0, #4
	strh r0, [r4]
	ldr r3, [sp, #8]
	ldrb r0, [r3]
	subs r0, #1
	strb r0, [r3]
	ldrh r2, [r4]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r0, [r7, #0x30]
	cmp r0, #0
	beq _0803E9CE
	movs r1, #4
	bl sub_0803DBC8
_0803E9CE:
	movs r0, #4
	bl ScrollMultiArenaTeamSprites
	ldr r1, [r7, #0x40]
	mov r0, sl
	ldrb r0, [r0]
	subs r1, r1, r0
	b _0803EA1C
_0803E9DE:
	cmp r2, #0
	bge _0803EA3A
	adds r4, r7, #0
	adds r4, #0x4a
	ldrh r0, [r4]
	adds r0, #4
	strh r0, [r4]
	ldr r1, [sp, #8]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrh r2, [r4]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r0, [r7, #0x30]
	cmp r0, #0
	beq _0803EA0C
	movs r1, #4
	rsbs r1, r1, #0
	bl sub_0803DBC8
_0803EA0C:
	movs r0, #4
	rsbs r0, r0, #0
	bl ScrollMultiArenaTeamSprites
	ldr r1, [r7, #0x40]
	mov r2, sl
	ldrb r2, [r2]
	subs r1, r1, r2
_0803EA1C:
	lsls r1, r1, #4
	adds r1, #0x28
	movs r0, #0x50
	bl PutUiHand
	ldr r0, [r7, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4]
	adds r1, #0x28
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl UpdateLinkArenaMenuScrollBar
	b _0803EE24
_0803EA3A:
	ldr r1, [r7, #0x40]
	mov r3, sl
	ldrb r3, [r3]
	subs r1, r1, r3
	lsls r1, r1, #4
	adds r1, #0x28
	movs r0, #0x50
	bl PutUiHand
	ldr r0, _0803EA78 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	bne _0803EA5C
	b _0803EC76
_0803EA5C:
	adds r0, r7, #0
	adds r0, #0x52
	ldrb r1, [r0]
	subs r1, #1
	adds r4, r0, #0
	cmp r1, #7
	bls _0803EA6C
	b _0803EC76
_0803EA6C:
	lsls r0, r1, #2
	ldr r1, _0803EA7C @ =_0803EA80
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803EA78: .4byte 0x08B857F8
_0803EA7C: .4byte _0803EA80
_0803EA80: @ jump table
	.4byte _0803EAA0 @ case 0
	.4byte _0803EAD0 @ case 1
	.4byte _0803EAF8 @ case 2
	.4byte _0803EB24 @ case 3
	.4byte _0803EB88 @ case 4
	.4byte _0803EB96 @ case 5
	.4byte _0803EC76 @ case 6
	.4byte _0803EBE4 @ case 7
_0803EAA0:
	ldr r0, _0803EAC8 @ =0x0203DA78
	mov r2, sb
	lsls r1, r2, #1
	add r1, sb
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0x80
	ldrb r1, [r1, #0x13]
	ands r0, r1
	cmp r0, #0
	bne _0803EAB8
	b _0803EBDC
_0803EAB8:
	movs r0, #2
	bl SioPlaySoundEffect
	ldr r1, _0803EACC @ =0x0203D90C
	ldr r0, [r7, #0x40]
	strb r0, [r1, #3]
	b _0803EAE8
	.align 2, 0
_0803EAC8: .4byte 0x0203DA78
_0803EACC: .4byte 0x0203D90C
_0803EAD0:
	movs r0, #2
	bl SioPlaySoundEffect
	ldr r2, _0803EAF0 @ =0x0203D90C
	ldr r1, _0803EAF4 @ =0x0203DA78
	mov r3, sb
	lsls r0, r3, #1
	add r0, sb
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0, #0x13]
	strb r0, [r2, #3]
_0803EAE8:
	adds r0, r7, #0
	bl Proc_Break
	b _0803EE24
	.align 2, 0
_0803EAF0: .4byte 0x0203D90C
_0803EAF4: .4byte 0x0203DA78
_0803EAF8:
	ldr r0, _0803EB20 @ =0x0203DA78
	mov r2, sb
	lsls r1, r2, #1
	add r1, sb
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0x80
	ldrb r1, [r1, #0x13]
	ands r0, r1
	cmp r0, #0
	bne _0803EBDC
	movs r0, #2
	bl SioPlaySoundEffect
	adds r0, r7, #0
	movs r1, #4
	bl Proc_Goto
	b _0803EE24
	.align 2, 0
_0803EB20: .4byte 0x0203DA78
_0803EB24:
	ldr r0, [r7, #0x38]
	cmp r0, #1
	bgt _0803EB2C
	b _0803EC76
_0803EB2C:
	movs r0, #2
	bl SioPlaySoundEffect
	adds r0, r7, #0
	adds r0, #0x53
	mov r3, sb
	strb r3, [r0]
	mov r1, sl
	ldrb r1, [r1]
	subs r2, r3, r1
	lsls r2, r2, #4
	adds r2, #0x28
	movs r0, #0x27
	str r0, [sp]
	adds r0, r7, #0
	movs r1, #0x50
	movs r3, #0x88
	bl StartSioHold
	str r0, [r7, #0x30]
	mov r1, sb
	adds r1, #1
	ldr r0, [r7, #0x38]
	cmp r1, r0
	bge _0803EB70
	ldr r0, _0803EB6C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x80
	ldrh r2, [r1, #6]
	orrs r0, r2
	b _0803EB7A
	.align 2, 0
_0803EB6C: .4byte 0x08B857F8
_0803EB70:
	ldr r0, _0803EB84 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x40
	ldrh r3, [r1, #6]
	orrs r0, r3
_0803EB7A:
	strh r0, [r1, #6]
	movs r0, #5
	strb r0, [r4]
	b _0803EC76
	.align 2, 0
_0803EB84: .4byte 0x08B857F8
_0803EB88:
	movs r0, #2
	bl SioPlaySoundEffect
	adds r0, r7, #0
	bl SioTeamList_SwapTeams
	b _0803EC76
_0803EB96:
	ldr r0, _0803EBD8 @ =0x0203DA78
	mov r2, sb
	lsls r1, r2, #1
	add r1, sb
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0x80
	ldrb r1, [r1, #0x13]
	ands r0, r1
	cmp r0, #0
	bne _0803EBDC
	movs r0, #2
	bl SioPlaySoundEffect
	mov r0, sb
	mov r3, sl
	ldrb r3, [r3]
	subs r2, r0, r3
	lsls r2, r2, #4
	adds r2, #0x28
	movs r0, #0x27
	str r0, [sp]
	adds r0, r7, #0
	movs r1, #0x50
	movs r3, #0x88
	bl StartSioHold
	str r0, [r7, #0x30]
	adds r0, r7, #0
	movs r1, #7
	bl Proc_Goto
	b _0803EC76
	.align 2, 0
_0803EBD8: .4byte 0x0203DA78
_0803EBDC:
	movs r0, #0
	bl SioPlaySoundEffect
	b _0803EC76
_0803EBE4:
	movs r0, #2
	bl SioPlaySoundEffect
	mov r0, sb
	lsls r4, r0, #1
	add r4, sb
	lsls r4, r4, #3
	ldr r0, _0803ECA0 @ =0x0203DA78
	adds r4, r4, r0
	movs r1, #0x53
	adds r1, r1, r7
	mov r8, r1
	ldrb r0, [r1]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	subs r1, r1, r0
	ldr r6, _0803ECA4 @ =0x0203DC4C
	adds r1, r1, r6
	adds r0, r4, #0
	bl SioStrCpy
	ldr r5, _0803ECA8 @ =0x0203D90C
	adds r0, r5, #6
	mov r2, r8
	ldrb r2, [r2]
	adds r0, r2, r0
	ldrb r1, [r4, #0x13]
	strb r1, [r0]
	mov r3, r8
	ldrb r3, [r3]
	lsls r0, r3, #3
	adds r5, #0x64
	adds r0, r0, r5
	bl ClearText
	mov r0, r8
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r5
	lsls r2, r1, #1
	adds r2, r2, r1
	adds r2, #5
	lsls r3, r1, #2
	adds r3, r3, r1
	lsls r3, r3, #2
	subs r3, r3, r1
	adds r3, r3, r6
	movs r1, #0xa
	str r1, [sp]
	movs r1, #1
	bl PutDrawTextCentered
	bl sub_0803E904
	adds r1, r7, #0
	adds r1, #0x5c
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803EC6A
	ldr r1, [sp, #4]
	ldr r0, [r1, #0x40]
	cmp r0, #0
	bne _0803EC6A
	movs r0, #8
	str r0, [r1, #0x40]
_0803EC6A:
	movs r0, #0
	str r0, [r7, #0x44]
	adds r0, r7, #0
	movs r1, #6
	bl Proc_Goto
_0803EC76:
	ldr r0, _0803ECAC @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0803ECCA
	movs r0, #1
	bl SioPlaySoundEffect
	adds r1, r7, #0
	adds r1, #0x52
	ldrb r0, [r1]
	cmp r0, #5
	bne _0803ECB0
	movs r0, #4
	strb r0, [r1]
	ldr r0, [r7, #0x30]
	bl Proc_End
	b _0803EE24
	.align 2, 0
_0803ECA0: .4byte 0x0203DA78
_0803ECA4: .4byte 0x0203DC4C
_0803ECA8: .4byte 0x0203D90C
_0803ECAC: .4byte 0x08B857F8
_0803ECB0:
	cmp r0, #8
	beq _0803ECBE
	adds r0, r7, #0
	movs r1, #2
	bl Proc_Goto
	b _0803ECCA
_0803ECBE:
	movs r0, #0
	str r0, [r7, #0x44]
	adds r0, r7, #0
	movs r1, #6
	bl Proc_Goto
_0803ECCA:
	ldr r0, _0803ED74 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0803ED06
	adds r0, r7, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803ED06
	ldr r0, _0803ED78 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0803ECF8
	ldr r0, _0803ED7C @ =0x0000038A
	bl m4aSongNumStart
_0803ECF8:
	ldr r1, _0803ED80 @ =0x0203D90C
	movs r0, #0
	strb r0, [r1, #3]
	adds r0, r7, #0
	movs r1, #9
	bl Proc_Goto
_0803ED06:
	ldr r0, _0803ED74 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x40
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0803ED8E
	mov r2, sl
	ldrb r0, [r2]
	cmp r0, #0
	beq _0803ED84
	ldr r0, [r7, #0x40]
	ldrb r3, [r2]
	subs r0, r0, r3
	cmp r0, #1
	bgt _0803ED84
	adds r4, r7, #0
	adds r4, #0x4a
	ldrh r0, [r4]
	subs r0, #4
	strh r0, [r4]
	ldr r0, [r7, #0x30]
	cmp r0, #0
	beq _0803ED3C
	movs r1, #4
	bl sub_0803DBC8
_0803ED3C:
	movs r0, #4
	bl ScrollMultiArenaTeamSprites
	mov r1, sl
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	movs r0, #3
	ldr r2, [sp, #8]
	strb r0, [r2]
	ldr r0, [r7, #0x40]
	subs r0, #1
	str r0, [r7, #0x40]
	ldrh r2, [r4]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r0, [r7, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4]
	adds r1, #0x28
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl UpdateLinkArenaMenuScrollBar
	b _0803ED8E
	.align 2, 0
_0803ED74: .4byte 0x08B857F8
_0803ED78: .4byte 0x0202BBF8
_0803ED7C: .4byte 0x0000038A
_0803ED80: .4byte 0x0203D90C
_0803ED84:
	ldr r0, [r7, #0x40]
	cmp r0, #0
	ble _0803ED8E
	subs r0, #1
	str r0, [r7, #0x40]
_0803ED8E:
	ldr r0, _0803EE08 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x80
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0803EE18
	ldr r1, [r7, #0x38]
	cmp r1, #6
	ble _0803EE0C
	mov r3, sl
	ldrb r2, [r3]
	adds r0, r2, #6
	cmp r0, r1
	bge _0803EE0C
	ldr r0, [r7, #0x40]
	subs r0, r0, r2
	cmp r0, #3
	ble _0803EE0C
	adds r4, r7, #0
	adds r4, #0x4a
	ldrh r0, [r4]
	adds r0, #4
	strh r0, [r4]
	ldr r0, [r7, #0x30]
	cmp r0, #0
	beq _0803EDCC
	movs r1, #4
	rsbs r1, r1, #0
	bl sub_0803DBC8
_0803EDCC:
	movs r0, #4
	rsbs r0, r0, #0
	bl ScrollMultiArenaTeamSprites
	mov r1, sl
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #0xfd
	ldr r2, [sp, #8]
	strb r0, [r2]
	ldr r0, [r7, #0x40]
	adds r0, #1
	str r0, [r7, #0x40]
	ldrh r2, [r4]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r0, [r7, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4]
	adds r1, #0x28
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl UpdateLinkArenaMenuScrollBar
	b _0803EE18
	.align 2, 0
_0803EE08: .4byte 0x08B857F8
_0803EE0C:
	subs r0, r1, #1
	ldr r1, [r7, #0x40]
	cmp r1, r0
	bge _0803EE18
	adds r0, r1, #1
	str r0, [r7, #0x40]
_0803EE18:
	ldr r0, [r7, #0x40]
	cmp sb, r0
	beq _0803EE24
	movs r0, #3
	bl SioPlaySoundEffect
_0803EE24:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
