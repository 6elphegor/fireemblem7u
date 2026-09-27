	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08030CAC
sub_08030CAC: @ 0x08030CAC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r6, _08030D44 @ =0x0202BBB8
	movs r0, #0x16
	ldrsh r1, [r6, r0]
	ldr r0, _08030D48 @ =0x0202E3E8
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r0, r1, r0
	movs r3, #0x14
	ldrsh r2, [r6, r3]
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r7, [r0]
	ldr r0, _08030D4C @ =0x0202E3DC
	ldr r0, [r0]
	adds r1, r1, r0
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r0, [r0]
	bl GetUnit
	bl GetPlayerSelectKind
	cmp r0, #4
	bne _08030CE4
	movs r7, #0
_08030CE4:
	bl HandlePlayerMapCursor
	ldr r0, [r4, #0x3c]
	lsls r0, r0, #4
	movs r5, #0xc
	ldrsh r1, [r6, r5]
	subs r5, r0, r1
	ldr r0, [r4, #0x40]
	lsls r0, r0, #4
	movs r2, #0xe
	ldrsh r1, [r6, r2]
	subs r2, r0, r1
	adds r1, r5, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08030D20
	adds r0, r2, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bhi _08030D20
	subs r2, #0xc
	ldr r3, _08030D50 @ =0x08B905B8
	movs r0, #6
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	bl PutSprite
_08030D20:
	ldr r0, _08030D54 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08030D74
	cmp r7, #0
	beq _08030D58
	ldr r0, [r4, #0x54]
	bl EndSpriteAnim
	adds r0, r4, #0
	bl Proc_Break
	bl EndSubtitleHelp
	b _08030DEE
	.align 2, 0
_08030D44: .4byte 0x0202BBB8
_08030D48: .4byte 0x0202E3E8
_08030D4C: .4byte 0x0202E3DC
_08030D50: .4byte 0x08B905B8
_08030D54: .4byte 0x08B857F8
_08030D58:
	ldr r0, _08030D70 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08030DEE
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _08030DEE
	.align 2, 0
_08030D70: .4byte 0x0202BBF8
_08030D74:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08030DAC
	ldr r0, [r4, #0x54]
	bl EndSpriteAnim
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
	bl EndSubtitleHelp
	ldr r0, _08030DA4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08030DEE
	ldr r0, _08030DA8 @ =0x0000038B
	bl m4aSongNumStart
	b _08030DEE
	.align 2, 0
_08030DA4: .4byte 0x0202BBF8
_08030DA8: .4byte 0x0000038B
_08030DAC:
	lsls r0, r7, #0x18
	asrs r3, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x4a
	movs r5, #0
	ldrsh r2, [r1, r5]
	adds r6, r0, #0
	adds r5, r1, #0
	cmp r3, r2
	beq _08030DCE
	ldr r0, [r4, #0x54]
	movs r1, #0
	cmp r3, #0
	bne _08030DCA
	movs r1, #1
_08030DCA:
	bl SetSpriteAnimId
_08030DCE:
	ldr r0, [r4, #0x54]
	ldr r3, _08030DF8 @ =0x0202BBB8
	movs r2, #0x20
	ldrsh r1, [r3, r2]
	movs r4, #0xc
	ldrsh r2, [r3, r4]
	subs r1, r1, r2
	movs r4, #0x22
	ldrsh r2, [r3, r4]
	movs r4, #0xe
	ldrsh r3, [r3, r4]
	subs r2, r2, r3
	bl DisplaySpriteAnim
	asrs r0, r6, #0x18
	strh r0, [r5]
_08030DEE:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08030DF8: .4byte 0x0202BBB8
