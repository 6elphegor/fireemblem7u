	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_ClearSkipFadeToPrep
EvtCmd_ClearSkipFadeToPrep: @ 0x0800B73C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x4c
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r6, #1
	rsbs r6, r6, #0
	cmp r0, r6
	beq _0800B758
	bl UnlockBmDisplay
	bl ReleaseMus
_0800B758:
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800B784
	ldr r0, _0800B780 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	bne _0800B7C4
	adds r0, r4, #0
	bl Event_FadeOutOfSkip
	b _0800B7C4
	.align 2, 0
_0800B780: .4byte 0x0202BBF8
_0800B784:
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, r6
	bne _0800B7AC
	ldr r0, _0800B7A8 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _0800B7C4
	adds r0, r4, #0
	bl StartMidLockingFadeToBlack
	b _0800B7C4
	.align 2, 0
_0800B7A8: .4byte 0x0202BBF8
_0800B7AC:
	ldr r0, _0800B7CC @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	bne _0800B7C4
	adds r0, r4, #0
	bl Event_FadeOutOfSkip
_0800B7C4:
	movs r0, #2
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800B7CC: .4byte 0x0202BBF8
