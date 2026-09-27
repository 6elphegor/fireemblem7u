	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B8654
sub_080B8654: @ 0x080B8654
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov r8, r0
	bl InitCharacterEndingText
	mov r0, r8
	bl CharacterEnding_LoadUnitBattleStats
	ldr r7, _080B86B4 @ =0x08CEE858
	ldr r0, [r7]
	movs r1, #0
	bl TmFill
	ldr r0, [r7, #4]
	movs r1, #0
	bl TmFill
	ldr r0, [r7, #8]
	movs r1, #0
	bl TmFill
	ldr r0, [r7, #8]
	ldr r1, _080B86B8 @ =0x085DCF50
	ldr r4, _080B86BC @ =0x0000C280
	adds r2, r4, #0
	bl TmApplyTsa_thm
	ldr r0, [r7, #4]
	ldr r1, _080B86C0 @ =0x085DCA9C
	adds r2, r4, #0
	bl TmApplyTsa_thm
	mov r1, r8
	ldr r0, [r1, #0x38]
	ldrb r4, [r0, #1]
	cmp r4, #0xcd
	bne _080B8714
	bl GetGameOverallRank
	cmp r0, #3
	ble _080B86C8
	ldr r0, _080B86C4 @ =0x00001074
	bl DecodeMsg
	b _080B86DE
	.align 2, 0
_080B86B4: .4byte 0x08CEE858
_080B86B8: .4byte 0x085DCF50
_080B86BC: .4byte 0x0000C280
_080B86C0: .4byte 0x085DCA9C
_080B86C4: .4byte 0x00001074
_080B86C8:
	cmp r0, #1
	ble _080B86D8
	ldr r0, _080B86D4 @ =0x00001076
	bl DecodeMsg
	b _080B86DE
	.align 2, 0
_080B86D4: .4byte 0x00001076
_080B86D8:
	ldr r0, _080B8708 @ =0x00001078
	bl DecodeMsg
_080B86DE:
	bl MsgExpand
	adds r6, r0, #0
	movs r0, #0x78
	adds r1, r6, #0
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	ldr r0, _080B870C @ =0x08CEE868
	ldr r0, [r0]
	adds r0, #0x28
	ldr r1, _080B8710 @ =0x08CEE858
	ldr r1, [r1]
	adds r1, #0xc2
	movs r2, #0
	str r2, [sp]
	str r6, [sp, #4]
	bl PutDrawText
	b _080B8828
	.align 2, 0
_080B8708: .4byte 0x00001078
_080B870C: .4byte 0x08CEE868
_080B8710: .4byte 0x08CEE858
_080B8714:
	ldrb r0, [r0, #1]
	bl GetPidTitleTextId
	bl DecodeMsg
	adds r6, r0, #0
	movs r0, #0x78
	adds r1, r6, #0
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	ldr r5, _080B8858 @ =0x08CEE868
	ldr r0, [r5]
	adds r0, #0x28
	ldr r1, [r7]
	adds r1, #0xc2
	movs r4, #0
	str r4, [sp]
	str r6, [sp, #4]
	movs r2, #0
	bl PutDrawText
	ldr r0, _080B885C @ =0x000012AB
	bl DecodeMsg
	adds r2, r0, #0
	ldr r0, [r5]
	adds r0, #0x40
	ldr r1, [r7]
	adds r1, #0x62
	str r4, [sp]
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	ldr r0, _080B8860 @ =0x000012AC
	bl DecodeMsg
	adds r2, r0, #0
	ldr r0, [r5]
	adds r0, #0x40
	ldr r1, [r7]
	adds r1, #0x62
	str r4, [sp]
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0x20
	bl PutDrawText
	ldr r0, _080B8864 @ =0x000012AD
	bl DecodeMsg
	adds r2, r0, #0
	ldr r0, [r5]
	adds r0, #0x40
	ldr r1, [r7]
	adds r1, #0x62
	str r4, [sp]
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0x40
	bl PutDrawText
	mov r1, r8
	ldrh r0, [r1, #0x3c]
	bl CountDigits
	lsls r0, r0, #1
	adds r0, #0x62
	ldr r1, [r7]
	adds r1, r1, r0
	mov r4, r8
	ldrh r2, [r4, #0x3c]
	adds r0, r1, #0
	movs r1, #2
	bl PutNumber
	adds r4, #0x40
	ldrh r0, [r4]
	bl CountDigits
	lsls r0, r0, #1
	adds r0, #0x6a
	ldr r1, [r7]
	adds r1, r1, r0
	ldrh r2, [r4]
	adds r0, r1, #0
	movs r1, #2
	bl PutNumber
	adds r4, #4
	ldrh r0, [r4]
	bl CountDigits
	lsls r0, r0, #1
	adds r0, #0x72
	ldr r1, [r7]
	adds r1, r1, r0
	ldrh r2, [r4]
	adds r0, r1, #0
	movs r1, #2
	bl PutNumber
	ldr r2, _080B8868 @ =0x08BDCE4C
	mov r1, r8
	ldr r0, [r1, #0x38]
	ldrb r1, [r0, #1]
	subs r1, #1
	movs r0, #0x34
	muls r0, r1, r0
	adds r0, r0, r2
	ldrh r1, [r0, #6]
	movs r2, #0xd0
	lsls r2, r2, #1
	ldr r0, _080B886C @ =0x00000502
	str r0, [sp]
	movs r0, #0
	movs r3, #0x38
	bl StartBmFace
	mov r4, r8
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _080B8828
	movs r0, #0x16
	bl ArchivePalette
	movs r3, #0x80
	lsls r3, r3, #0xf
	movs r0, #0xc0
	movs r1, #0xc0
	movs r2, #0xc0
	bl WriteFadedPaletteFromArchive
_080B8828:
	movs r2, #0
	mov r0, r8
	str r2, [r0, #0x34]
	ldr r3, _080B8870 @ =0x03002870
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r4, [r1]
	ands r0, r4
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B8858: .4byte 0x08CEE868
_080B885C: .4byte 0x000012AB
_080B8860: .4byte 0x000012AC
_080B8864: .4byte 0x000012AD
_080B8868: .4byte 0x08BDCE4C
_080B886C: .4byte 0x00000502
_080B8870: .4byte 0x03002870
