	.include "macro.inc"

	.syntax unified

	thumb_func_start TactInfo_CheckParticipantDialogue
TactInfo_CheckParticipantDialogue: @ 0x080A6CD0
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, _080A6CE8 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #1
	bne _080A6CEC
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	b _080A6D52
	.align 2, 0
_080A6CE8: .4byte 0x0202BBF8
_080A6CEC:
	movs r0, #0
	bl InitBgs
	bl ApplySystemObjectsGraphics
	ldr r0, _080A6D5C @ =0x03002870
	mov ip, r0
	mov r1, ip
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r3, #0x10
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	movs r0, #1
	mov r1, ip
	ldrb r1, [r1, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	orrs r0, r3
	mov r2, ip
	strb r0, [r2, #1]
	ldr r2, _080A6D60 @ =0x00000794
	ldr r3, _080A6D64 @ =0x06016000
	movs r0, #0xd
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0x38
	movs r1, #0x20
	bl StartBoxDialogueExt
	movs r0, #0xf0
	bl SetDialogueBoxConfig
	movs r0, #2
	bl SetTalkChoiceResult
_080A6D52:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A6D5C: .4byte 0x03002870
_080A6D60: .4byte 0x00000794
_080A6D64: .4byte 0x06016000
