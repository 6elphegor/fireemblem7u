	.include "macro.inc"

	.syntax unified

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
