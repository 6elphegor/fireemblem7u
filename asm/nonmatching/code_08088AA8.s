	.include "macro.inc"

	.syntax unified

	thumb_func_start YesNoChoice_Loop_KeyHandler
YesNoChoice_Loop_KeyHandler: @ 0x08088AA8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r1, _08088AD4 @ =0x08B857F8
	ldr r0, [r1]
	ldrh r2, [r0, #8]
	movs r0, #2
	ands r0, r2
	adds r5, r1, #0
	cmp r0, #0
	beq _08088AE0
	ldr r0, _08088AD8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08088ACE
	ldr r0, _08088ADC @ =0x0000038B
	bl m4aSongNumStart
_08088ACE:
	movs r0, #0
	b _08088B00
	.align 2, 0
_08088AD4: .4byte 0x08B857F8
_08088AD8: .4byte 0x0202BBF8
_08088ADC: .4byte 0x0000038B
_08088AE0:
	movs r6, #1
	adds r0, r6, #0
	ands r0, r2
	cmp r0, #0
	beq _08088B14
	ldr r0, _08088B0C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08088AFC
	ldr r0, _08088B10 @ =0x0000038A
	bl m4aSongNumStart
_08088AFC:
	movs r1, #0x2a
	ldrsh r0, [r4, r1]
_08088B00:
	bl SetTalkChoiceResult
	adds r0, r4, #0
	bl Proc_Break
	b _08088B7A
	.align 2, 0
_08088B0C: .4byte 0x0202BBF8
_08088B10: .4byte 0x0000038A
_08088B14:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _08088B36
	ldrh r2, [r4, #0x2a]
	cmp r2, #2
	bne _08088B36
	ldr r0, _08088B80 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08088B34
	ldr r0, _08088B84 @ =0x00000387
	bl m4aSongNumStart
_08088B34:
	strh r6, [r4, #0x2a]
_08088B36:
	ldr r1, [r5]
	movs r0, #0x10
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08088B5E
	ldrh r0, [r4, #0x2a]
	cmp r0, #1
	bne _08088B5E
	ldr r0, _08088B80 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08088B5A
	ldr r0, _08088B84 @ =0x00000387
	bl m4aSongNumStart
_08088B5A:
	movs r0, #2
	strh r0, [r4, #0x2a]
_08088B5E:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	movs r1, #0x2a
	ldrsh r2, [r4, r1]
	subs r2, #1
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r0, r0, r1
	subs r0, #4
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	bl PutUiHand
_08088B7A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08088B80: .4byte 0x0202BBF8
_08088B84: .4byte 0x00000387
