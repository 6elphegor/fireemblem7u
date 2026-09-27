	.include "macro.inc"

	.syntax unified

	thumb_func_start MsgExpand
MsgExpand: @ 0x08012CBC
	push {r4, r5, lr}
	ldr r5, _08012CD4 @ =0x0202A9B4
	movs r0, #0x80
	lsls r0, r0, #3
	adds r4, r5, r0
	ldr r0, _08012CD8 @ =0xFFFFFC00
	adds r1, r5, r0
	adds r0, r5, #0
	bl StringCopy
	b _08012DB8
	.align 2, 0
_08012CD4: .4byte 0x0202A9B4
_08012CD8: .4byte 0xFFFFFC00
_08012CDC:
	adds r0, r1, #0
	cmp r0, #0x1f
	bhi _08012CE6
	strb r1, [r4]
	b _08012D86
_08012CE6:
	cmp r0, #0x80
	beq _08012CEE
	strb r1, [r4]
	b _08012D86
_08012CEE:
	adds r5, #1
	ldrb r0, [r5]
	subs r0, #0x12
	cmp r0, #0x10
	bhi _08012D7C
	lsls r0, r0, #2
	ldr r1, _08012D04 @ =_08012D08
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08012D04: .4byte _08012D08
_08012D08: @ jump table
	.4byte _08012D4C @ case 0
	.4byte _08012D50 @ case 1
	.4byte _08012D54 @ case 2
	.4byte _08012D58 @ case 3
	.4byte _08012D7C @ case 4
	.4byte _08012D7C @ case 5
	.4byte _08012D7C @ case 6
	.4byte _08012D7C @ case 7
	.4byte _08012D7C @ case 8
	.4byte _08012D7C @ case 9
	.4byte _08012D7C @ case 10
	.4byte _08012D7C @ case 11
	.4byte _08012D7C @ case 12
	.4byte _08012D7C @ case 13
	.4byte _08012D5C @ case 14
	.4byte _08012D7C @ case 15
	.4byte _08012D62 @ case 16
_08012D4C:
	movs r1, #0
	b _08012D8C
_08012D50:
	movs r1, #1
	b _08012D8C
_08012D54:
	movs r1, #2
	b _08012D8C
_08012D58:
	movs r1, #3
	b _08012D8C
_08012D5C:
	bl GetTacticianName
	b _08012D6C
_08012D62:
	ldr r0, _08012D78 @ =0x0203A85C
	ldrh r0, [r0, #6]
	movs r1, #0
	bl GetItemNameWithArticle
_08012D6C:
	adds r1, r0, #0
	adds r0, r4, #0
	bl StringCopy
	b _08012DA6
	.align 2, 0
_08012D78: .4byte 0x0203A85C
_08012D7C:
	movs r0, #0x80
	strb r0, [r4]
	adds r4, #1
	ldrb r0, [r5]
	strb r0, [r4]
_08012D86:
	adds r5, #1
	adds r4, #1
	b _08012DB8
_08012D8C:
	ldr r0, _08012DCC @ =0x0202BBF8
	adds r0, #0x1c
	adds r0, r1, r0
	ldrb r0, [r0]
	bl GetCharacterData
	ldrh r0, [r0]
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StringCopy
_08012DA6:
	ldrb r0, [r4]
	adds r1, r5, #1
	cmp r0, #0
	beq _08012DB6
_08012DAE:
	adds r4, #1
	ldrb r0, [r4]
	cmp r0, #0
	bne _08012DAE
_08012DB6:
	adds r5, r1, #0
_08012DB8:
	ldrb r1, [r5]
	cmp r1, #0
	bne _08012CDC
	movs r0, #0
	strb r0, [r4]
	ldr r0, _08012DD0 @ =0x0202ADB4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08012DCC: .4byte 0x0202BBF8
_08012DD0: .4byte 0x0202ADB4
