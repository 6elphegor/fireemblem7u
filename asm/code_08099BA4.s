	.include "macro.inc"

	.syntax unified

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
	bl DecodeMsg
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
	bl DecodeMsg
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
	bl DecodeMsg
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
	bl DecodeMsg
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
	bl DecodeMsg
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
	bl DecodeMsg
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
	bl DecodeMsg
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
	bl DecodeMsg
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
	bl DecodeMsg
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
	bl DecodeMsg
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
	bl DecodeMsg
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
	bl DecodeMsg
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
	bl DecodeMsg
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
	bl DecodeMsg
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
	bl DecodeMsg
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
