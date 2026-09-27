	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08094A20
sub_08094A20: @ 0x08094A20
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov r8, r0
	ldr r6, _08094A88 @ =0x020129A8
	adds r5, r6, #0
	movs r4, #7
_08094A30:
	adds r0, r5, #0
	bl ClearText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _08094A30
	ldr r0, _08094A8C @ =0x000010F4
	bl DecodeMsg
	adds r1, r6, #0
	adds r6, #8
	ldr r5, _08094A90 @ =0x02023D82
	movs r7, #0
	str r7, [sp]
	str r0, [sp, #4]
	adds r0, r1, #0
	adds r1, r5, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	mov r0, r8
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	beq _08094A98
	ldr r0, _08094A94 @ =0x000010F9
	bl DecodeMsg
	adds r2, r6, #0
	adds r6, #8
	adds r1, r5, #0
	adds r1, #0x80
	str r7, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	b _08094AB4
	.align 2, 0
_08094A88: .4byte 0x020129A8
_08094A8C: .4byte 0x000010F4
_08094A90: .4byte 0x02023D82
_08094A94: .4byte 0x000010F9
_08094A98:
	ldr r0, _08094BA8 @ =0x000010F8
	bl DecodeMsg
	adds r2, r6, #0
	adds r6, #8
	adds r1, r5, #0
	adds r1, #0x80
	str r4, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
_08094AB4:
	ldr r0, _08094BAC @ =0x000010FB
	bl DecodeMsg
	adds r1, r6, #0
	adds r6, #8
	ldr r7, _08094BB0 @ =0x02023E82
	movs r5, #0
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r1, #0
	adds r1, r7, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	ldr r0, _08094BB4 @ =0x000010FC
	bl DecodeMsg
	adds r2, r6, #0
	adds r6, #8
	adds r1, r7, #0
	adds r1, #0x80
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	ldr r0, _08094BB8 @ =0x000010FD
	bl DecodeMsg
	adds r2, r6, #0
	adds r6, #8
	adds r1, r7, #0
	subs r1, #0xf4
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	ldr r0, _08094BBC @ =0x000010FE
	bl DecodeMsg
	adds r2, r6, #0
	adds r6, #8
	adds r1, r7, #0
	subs r1, #0x74
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	ldr r0, _08094BC0 @ =0x000010FF
	bl DecodeMsg
	adds r2, r6, #0
	adds r6, #8
	adds r1, r7, #0
	adds r1, #0xc
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	ldr r0, _08094BC4 @ =0x00001107
	bl DecodeMsg
	adds r2, r6, #0
	adds r6, #8
	adds r1, r7, #0
	adds r1, #0x8c
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	mov r1, r8
	ldr r0, [r1, #4]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r4, r0, #0
	movs r0, #0x38
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	adds r0, r6, #0
	ldr r2, _08094BC8 @ =0xFFFFFE0A
	adds r1, r7, r2
	str r5, [sp]
	str r4, [sp, #4]
	movs r2, #0
	bl PutDrawText
	ldr r1, _08094BCC @ =0xFFFFFE02
	adds r0, r7, r1
	movs r1, #3
	movs r2, #0x24
	bl PutSpecialChar
	ldr r2, _08094BD0 @ =0xFFFFFE04
	adds r0, r7, r2
	movs r1, #3
	movs r2, #0x25
	bl PutSpecialChar
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08094BA8: .4byte 0x000010F8
_08094BAC: .4byte 0x000010FB
_08094BB0: .4byte 0x02023E82
_08094BB4: .4byte 0x000010FC
_08094BB8: .4byte 0x000010FD
_08094BBC: .4byte 0x000010FE
_08094BC0: .4byte 0x000010FF
_08094BC4: .4byte 0x00001107
_08094BC8: .4byte 0xFFFFFE0A
_08094BCC: .4byte 0xFFFFFE02
_08094BD0: .4byte 0xFFFFFE04
