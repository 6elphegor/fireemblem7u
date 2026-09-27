	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08086EEC
sub_08086EEC: @ 0x08086EEC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r0, _08086F48 @ =0x08CC2E88
	bl InitTextList
	adds r0, r6, #0
	bl ChapterStatus_SetupFont
	adds r0, r6, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r0, r6, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_08086C10
	ldr r4, _08086F4C @ =0x02023608
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r2, [r0]
	adds r0, r4, #0
	movs r1, #2
	bl PutNumber
	ldr r0, _08086F50 @ =0x0202BBF8
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _08086F54
	adds r0, r4, #0
	adds r0, #0xa
	movs r1, #2
	movs r2, #0x14
	bl PutSpecialChar
	adds r0, r4, #0
	adds r0, #0xc
	movs r1, #2
	movs r2, #0x14
	bl PutSpecialChar
	b _08086F64
	.align 2, 0
_08086F48: .4byte 0x08CC2E88
_08086F4C: .4byte 0x02023608
_08086F50: .4byte 0x0202BBF8
_08086F54:
	adds r0, r4, #0
	adds r0, #0xc
	adds r1, r6, #0
	adds r1, #0x30
	ldrb r2, [r1]
	movs r1, #2
	bl PutNumber
_08086F64:
	adds r7, r6, #0
	adds r7, #0x2c
	movs r0, #1
	strb r0, [r7]
	ldr r0, _08086FE4 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x8c
	ldrh r0, [r0]
	bl DecodeMsg
	adds r5, r0, #0
	ldr r0, _08086FE8 @ =0x020040BC
	mov r8, r0
	movs r0, #0x70
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	subs r1, #2
	mov r0, r8
	movs r2, #0
	adds r3, r5, #0
	bl Text_InsertDrawString
	adds r0, r5, #0
	bl sub_08086960
	adds r5, r0, #0
	cmp r5, #0
	beq _08086FC4
	mov r4, r8
	adds r4, #8
	movs r0, #0x6e
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	adds r3, r5, #0
	bl Text_InsertDrawString
	movs r0, #2
	strb r0, [r7]
_08086FC4:
	ldrb r7, [r7]
	cmp r7, #2
	bne _08086FF0
	ldr r4, _08086FEC @ =0x02022E62
	mov r0, r8
	adds r1, r4, #0
	bl PutText
	mov r0, r8
	adds r0, #8
	adds r4, #0x80
	adds r1, r4, #0
	bl PutText
	b _08086FF8
	.align 2, 0
_08086FE4: .4byte 0x0202BBF8
_08086FE8: .4byte 0x020040BC
_08086FEC: .4byte 0x02022E62
_08086FF0:
	ldr r1, _08087024 @ =0x02022EA2
	mov r0, r8
	bl PutText
_08086FF8:
	adds r1, r6, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	cmp r0, #0
	beq _0808700E
	ldr r0, _08087028 @ =0x02022C92
	ldrb r2, [r1]
	adds r2, #1
	movs r1, #2
	bl PutNumberOrBlank
_0808700E:
	bl sub_08086EA8
	movs r0, #1
	bl EnableBgSync
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08087024: .4byte 0x02022EA2
_08087028: .4byte 0x02022C92
