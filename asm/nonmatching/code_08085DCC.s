	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08085DCC
sub_08085DCC: @ 0x08085DCC
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r1, #0
	str r1, [r7, #0x58]
	adds r0, #0x56
	strb r1, [r0]
	subs r0, #6
	strb r1, [r0]
	adds r1, r7, #0
	adds r1, #0x57
	movs r0, #0xff
	strb r0, [r1]
	adds r5, r7, #0
	adds r5, #0x2c
	adds r0, r5, #0
	movs r1, #9
	bl InitText
	adds r4, r7, #0
	adds r4, #0x34
	adds r0, r4, #0
	movs r1, #8
	bl InitText
	adds r0, r7, #0
	bl StartGreenText
	adds r0, r5, #0
	bl ClearText
	adds r0, r4, #0
	bl ClearText
	ldr r6, _08085E54 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r6, r0]
	bl GetChapterInfo
	adds r0, #0x8e
	ldrh r0, [r0]
	bl DecodeMsg
	adds r4, r0, #0
	movs r0, #0x48
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0
	adds r3, r4, #0
	bl Text_InsertDrawString
	movs r0, #0xe
	ldrsb r0, [r6, r0]
	bl GetChapterInfo
	adds r0, #0x90
	ldrb r0, [r0]
	cmp r0, #4
	bls _08085E48
	b _08085F60
_08085E48:
	lsls r0, r0, #2
	ldr r1, _08085E58 @ =_08085E5C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08085E54: .4byte 0x0202BBF8
_08085E58: .4byte _08085E5C
_08085E5C: @ jump table
	.4byte _08085E70 @ case 0
	.4byte _08085E78 @ case 1
	.4byte _08085ECC @ case 2
	.4byte _08085E70 @ case 3
	.4byte _08085E70 @ case 4
_08085E70:
	adds r1, r7, #0
	adds r1, #0x44
	movs r0, #0
	b _08085F5E
_08085E78:
	adds r4, r7, #0
	adds r4, #0x34
	ldr r0, _08085EAC @ =0x0000128D
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x10
	movs r2, #0
	bl Text_InsertDrawString
	ldr r0, _08085EB0 @ =0x0202BBF8
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _08085EB8
	ldr r0, _08085EB4 @ =0x0000127C
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x28
	movs r2, #1
	bl Text_InsertDrawString
	b _08085F58
	.align 2, 0
_08085EAC: .4byte 0x0000128D
_08085EB0: .4byte 0x0202BBF8
_08085EB4: .4byte 0x0000127C
_08085EB8:
	movs r0, #0x80
	bl CountUnitsByFaction
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x30
	movs r2, #2
	bl Text_InsertDrawNumberOrBlank
	b _08085F58
_08085ECC:
	ldr r5, _08085F04 @ =0x0202BBF8
	ldrh r4, [r5, #0x10]
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	adds r0, #0x91
	ldrb r0, [r0]
	subs r0, #1
	cmp r4, r0
	blt _08085F0C
	ldr r0, _08085F08 @ =0x0000128E
	bl DecodeMsg
	adds r5, r0, #0
	adds r4, r7, #0
	adds r4, #0x34
	movs r0, #0x40
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #4
	adds r3, r5, #0
	bl Text_InsertDrawString
	b _08085F58
	.align 2, 0
_08085F04: .4byte 0x0202BBF8
_08085F08: .4byte 0x0000128E
_08085F0C:
	adds r4, r7, #0
	adds r4, #0x34
	ldrh r3, [r5, #0x10]
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #2
	bl Text_InsertDrawNumberOrBlank
	ldr r0, _08085F68 @ =0x000012B0
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x13
	movs r2, #0
	bl Text_InsertDrawString
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	adds r0, #0x91
	ldrb r3, [r0]
	subs r3, #1
	adds r0, r4, #0
	movs r1, #0x22
	movs r2, #2
	bl Text_InsertDrawNumberOrBlank
	ldr r0, _08085F6C @ =0x0000128F
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x2b
	movs r2, #0
	bl Text_InsertDrawString
_08085F58:
	adds r1, r7, #0
	adds r1, #0x44
	movs r0, #1
_08085F5E:
	strh r0, [r1]
_08085F60:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08085F68: .4byte 0x000012B0
_08085F6C: .4byte 0x0000128F
