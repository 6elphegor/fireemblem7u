	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080093CC
sub_080093CC: @ 0x080093CC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	mov sb, r3
	adds r0, r6, #0
	bl Text_GetCursor
	adds r4, r0, #0
	movs r0, #0x10
	adds r0, r0, r4
	mov r8, r0
	ldrh r0, [r7]
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r6, #0
	mov r1, r8
	ldr r2, [sp, #0x1c]
	bl Text_InsertDrawString
	adds r4, #0x38
	ldrh r0, [r7, #8]
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r6, #0
	adds r1, r4, #0
	ldr r2, [sp, #0x1c]
	bl Text_InsertDrawString
	adds r0, r6, #0
	adds r1, r5, #0
	bl PutText
	movs r0, #1
	bl TalkBgSync
	ldr r0, _08009474 @ =0x08B90B0C
	ldr r1, [sp, #0x20]
	bl Proc_StartBlocking
	adds r1, r0, #0
	mov r3, sb
	strh r3, [r1, #0x2a]
	ldr r0, _08009478 @ =0x02022C60
	subs r5, r5, r0
	asrs r5, r5, #1
	movs r0, #0x1f
	ands r0, r5
	lsls r0, r0, #3
	ldr r2, _0800947C @ =0x03002870
	ldrh r3, [r2, #0x1c]
	subs r0, r0, r3
	add r0, r8
	strh r0, [r1, #0x2c]
	cmp r5, #0
	bge _08009448
	adds r5, #0x1f
_08009448:
	asrs r0, r5, #5
	lsls r0, r0, #3
	ldrh r2, [r2, #0x1e]
	subs r0, r0, r2
	strh r0, [r1, #0x2e]
	str r7, [r1, #0x34]
	mov r1, sb
	lsls r0, r1, #3
	adds r0, r0, r7
	subs r0, #8
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _08009466
	bl _call_via_r0
_08009466:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08009474: .4byte 0x08B90B0C
_08009478: .4byte 0x02022C60
_0800947C: .4byte 0x03002870
