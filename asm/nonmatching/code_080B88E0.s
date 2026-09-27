	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B88E0
sub_080B88E0: @ 0x080B88E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	bl InitCharacterEndingText
	adds r0, r7, #0
	bl CharacterEnding_LoadUnitBattleStats
	ldr r4, _080B8B50 @ =0x08CEE858
	ldr r0, [r4]
	movs r1, #0
	bl TmFill
	ldr r0, [r4, #4]
	movs r1, #0
	bl TmFill
	ldr r0, [r4, #8]
	movs r1, #0
	bl TmFill
	ldr r0, [r4, #8]
	ldr r1, _080B8B54 @ =0x085DD840
	ldr r5, _080B8B58 @ =0x0000C280
	adds r2, r5, #0
	bl TmApplyTsa_thm
	ldr r0, [r4, #4]
	ldr r1, _080B8B5C @ =0x085DD38C
	adds r2, r5, #0
	bl TmApplyTsa_thm
	ldr r0, [r7, #0x38]
	ldrb r0, [r0, #1]
	bl GetPidTitleTextId
	bl DecodeMsg
	adds r5, r0, #0
	movs r0, #0x78
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	ldr r6, _080B8B60 @ =0x08CEE868
	ldr r0, [r6]
	adds r0, #0x28
	ldr r1, [r4]
	adds r1, #0xc2
	movs r2, #0
	mov r8, r2
	str r2, [sp]
	str r5, [sp, #4]
	bl PutDrawText
	ldr r0, _080B8B64 @ =0x000012AB
	bl DecodeMsg
	adds r2, r0, #0
	ldr r0, [r6]
	adds r0, #0x38
	ldr r1, [r4]
	ldr r5, _080B8B68 @ =0x00000442
	adds r1, r1, r5
	mov r3, r8
	str r3, [sp]
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	ldr r0, _080B8B6C @ =0x000012AC
	mov sl, r0
	bl DecodeMsg
	adds r2, r0, #0
	ldr r0, [r6]
	adds r0, #0x38
	ldr r1, [r4]
	adds r1, r1, r5
	mov r3, r8
	str r3, [sp]
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0x20
	bl PutDrawText
	ldr r0, _080B8B70 @ =0x000012AD
	mov sb, r0
	bl DecodeMsg
	adds r2, r0, #0
	ldr r0, [r6]
	adds r0, #0x38
	ldr r1, [r4]
	adds r1, r1, r5
	mov r3, r8
	str r3, [sp]
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0x40
	bl PutDrawText
	ldrh r0, [r7, #0x3c]
	bl CountDigits
	lsls r0, r0, #1
	adds r0, r0, r5
	ldr r1, [r4]
	adds r1, r1, r0
	ldrh r2, [r7, #0x3c]
	adds r0, r1, #0
	movs r1, #2
	bl PutNumber
	adds r5, r7, #0
	adds r5, #0x40
	ldrh r0, [r5]
	bl CountDigits
	lsls r0, r0, #1
	ldr r1, _080B8B74 @ =0x0000044A
	adds r0, r0, r1
	ldr r1, [r4]
	adds r1, r1, r0
	ldrh r2, [r5]
	adds r0, r1, #0
	movs r1, #2
	bl PutNumber
	adds r5, #4
	ldrh r0, [r5]
	bl CountDigits
	lsls r0, r0, #1
	ldr r2, _080B8B78 @ =0x00000452
	adds r0, r0, r2
	ldr r1, [r4]
	adds r1, r1, r0
	ldrh r2, [r5]
	adds r0, r1, #0
	movs r1, #2
	bl PutNumber
	ldr r0, [r7, #0x38]
	ldrb r0, [r0, #2]
	bl GetPidTitleTextId
	bl DecodeMsg
	adds r5, r0, #0
	movs r0, #0x78
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	ldr r0, [r6]
	adds r0, #0x30
	ldr r1, [r4]
	ldr r2, _080B8B7C @ =0x0000045C
	adds r1, r1, r2
	mov r2, r8
	str r2, [sp]
	str r5, [sp, #4]
	movs r2, #0
	bl PutDrawText
	ldr r0, _080B8B64 @ =0x000012AB
	bl DecodeMsg
	adds r2, r0, #0
	ldr r0, [r6]
	adds r0, #0x40
	ldr r1, [r4]
	adds r1, #0x62
	mov r3, r8
	str r3, [sp]
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	mov r0, sl
	bl DecodeMsg
	adds r2, r0, #0
	ldr r0, [r6]
	adds r0, #0x40
	ldr r1, [r4]
	adds r1, #0x62
	mov r3, r8
	str r3, [sp]
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0x20
	bl PutDrawText
	mov r0, sb
	bl DecodeMsg
	adds r2, r0, #0
	ldr r0, [r6]
	adds r0, #0x40
	ldr r1, [r4]
	adds r1, #0x62
	mov r3, r8
	str r3, [sp]
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0x40
	bl PutDrawText
	ldrh r0, [r7, #0x3e]
	bl CountDigits
	lsls r0, r0, #1
	adds r0, #0x62
	ldr r1, [r4]
	adds r1, r1, r0
	ldrh r2, [r7, #0x3e]
	adds r0, r1, #0
	movs r1, #2
	bl PutNumber
	adds r5, r7, #0
	adds r5, #0x42
	ldrh r0, [r5]
	bl CountDigits
	lsls r0, r0, #1
	adds r0, #0x6a
	ldr r1, [r4]
	adds r1, r1, r0
	ldrh r2, [r5]
	adds r0, r1, #0
	movs r1, #2
	bl PutNumber
	adds r5, #4
	ldrh r0, [r5]
	bl CountDigits
	lsls r0, r0, #1
	adds r0, #0x72
	ldr r1, [r4]
	adds r1, r1, r0
	ldrh r2, [r5]
	adds r0, r1, #0
	movs r1, #2
	bl PutNumber
	mov r0, r8
	str r0, [r7, #0x34]
	ldr r2, _080B8B80 @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x45
	mov r1, r8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r5, _080B8B84 @ =0x08BDCE4C
	ldr r0, [r7, #0x38]
	ldrb r0, [r0, #1]
	subs r0, #1
	movs r4, #0x34
	muls r0, r4, r0
	adds r0, r0, r5
	ldrh r1, [r0, #6]
	movs r2, #0x98
	lsls r2, r2, #1
	ldr r0, _080B8B88 @ =0x00000503
	str r0, [sp]
	movs r0, #0
	movs r3, #0x30
	bl StartBmFace
	ldr r0, [r7, #0x38]
	ldrb r0, [r0, #2]
	subs r0, #1
	muls r0, r4, r0
	adds r0, r0, r5
	ldrh r1, [r0, #6]
	movs r2, #0xd0
	lsls r2, r2, #1
	ldr r0, _080B8B8C @ =0x00000502
	str r0, [sp]
	movs r0, #1
	movs r3, #0x30
	bl StartBmFace
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B8B50: .4byte 0x08CEE858
_080B8B54: .4byte 0x085DD840
_080B8B58: .4byte 0x0000C280
_080B8B5C: .4byte 0x085DD38C
_080B8B60: .4byte 0x08CEE868
_080B8B64: .4byte 0x000012AB
_080B8B68: .4byte 0x00000442
_080B8B6C: .4byte 0x000012AC
_080B8B70: .4byte 0x000012AD
_080B8B74: .4byte 0x0000044A
_080B8B78: .4byte 0x00000452
_080B8B7C: .4byte 0x0000045C
_080B8B80: .4byte 0x03002870
_080B8B84: .4byte 0x08BDCE4C
_080B8B88: .4byte 0x00000503
_080B8B8C: .4byte 0x00000502
