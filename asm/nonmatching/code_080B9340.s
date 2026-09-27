	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B9340
sub_080B9340: @ 0x080B9340
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r0, [sp, #8]
	adds r4, r1, #0
	movs r0, #0
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #9
	bl __modsi3
	mov sl, r0
	lsls r4, r4, #1
	movs r0, #0x1f
	ands r4, r0
	lsls r5, r4, #5
	lsls r0, r4, #6
	ldr r1, _080B93FC @ =0x02023460
	adds r0, r0, r1
	movs r1, #0x1f
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #2
	bl EnableBgSync
	ldr r2, _080B9400 @ =0x08CEEBA4
	mov sb, r2
	mov r3, sl
	lsls r7, r3, #3
	ldr r0, [r2]
	adds r0, r0, r7
	bl ClearText
	adds r6, r7, #0
	adds r6, #0x48
	mov r1, sb
	ldr r0, [r1]
	adds r0, r0, r6
	bl ClearText
	movs r0, #1
	rsbs r0, r0, #0
	ldr r2, [sp, #8]
	cmp r2, r0
	bne _080B9408
	bl GetGameTotalTurnCount
	adds r4, r0, #0
	ldr r0, _080B9404 @ =0x000012D1
	bl DecodeMsg
	adds r2, r0, #0
	mov r3, sb
	ldr r0, [r3]
	adds r0, r0, r6
	adds r1, r5, #0
	adds r1, #0x10
	lsls r1, r1, #1
	ldr r3, _080B93FC @ =0x02023460
	adds r1, r1, r3
	ldr r3, [sp, #0xc]
	str r3, [sp]
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	adds r0, r5, #0
	adds r0, #0x17
	lsls r0, r0, #1
	ldr r1, _080B93FC @ =0x02023460
	adds r0, r0, r1
	movs r1, #2
	adds r2, r4, #0
	bl PutNumber
	mov r2, sb
	ldr r0, [r2]
	adds r0, #0x90
	adds r1, r5, #0
	adds r1, #0x18
	lsls r1, r1, #1
	ldr r3, _080B93FC @ =0x02023460
	adds r1, r1, r3
	bl PutText
	movs r0, #0
	b _080B9638
	.align 2, 0
_080B93FC: .4byte 0x02023460
_080B9400: .4byte 0x08CEEBA4
_080B9404: .4byte 0x000012D1
_080B9408:
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _080B9410
	b _080B9636
_080B9410:
	ldr r0, [r0]
	lsls r0, r0, #0x19
	lsrs r6, r0, #0x19
	adds r0, r6, #0
	bl GetChapterInfo
	adds r1, r0, #0
	movs r2, #0
	ldr r0, _080B9440 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _080B942A
	movs r2, #1
_080B942A:
	adds r0, r1, #0
	adds r0, #0x84
	adds r0, r0, r2
	ldrb r0, [r0]
	lsrs r0, r0, #1
	mov r8, r0
	cmp r6, #0
	bne _080B9448
	ldr r0, _080B9444 @ =0x00001187
	b _080B9456
	.align 2, 0
_080B9440: .4byte 0x0202BBF8
_080B9444: .4byte 0x00001187
_080B9448:
	cmp r6, #0
	blt _080B9484
	cmp r6, #0x2f
	bgt _080B9484
	cmp r6, #0x2e
	blt _080B9484
	ldr r0, _080B947C @ =0x00001186
_080B9456:
	bl DecodeMsg
	adds r2, r0, #0
	mov r1, sb
	ldr r0, [r1]
	adds r0, r0, r7
	adds r1, r5, #3
	lsls r1, r1, #1
	ldr r3, _080B9480 @ =0x02023460
	adds r1, r1, r3
	ldr r3, [sp, #0xc]
	str r3, [sp]
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	adds r4, r7, #0
	b _080B9542
	.align 2, 0
_080B947C: .4byte 0x00001186
_080B9480: .4byte 0x02023460
_080B9484:
	ldr r1, _080B94E8 @ =0x08CEEBA4
	ldr r0, [r1]
	adds r0, #0x98
	lsls r4, r4, #5
	adds r1, r4, #3
	lsls r1, r1, #1
	ldr r2, _080B94EC @ =0x02023460
	mov sb, r2
	add r1, sb
	bl PutText
	movs r7, #0
	adds r5, r4, #0
	mov r3, r8
	cmp r3, #9
	ble _080B94A6
	movs r7, #1
_080B94A6:
	adds r0, r7, #2
	adds r0, #3
	adds r0, r5, r0
	lsls r0, r0, #1
	add r0, sb
	movs r1, #2
	mov r2, r8
	bl PutNumber
	cmp r6, #0x19
	bne _080B94F4
	ldr r0, _080B94F0 @ =0x00001189
	bl DecodeMsg
	adds r3, r0, #0
	mov r0, sl
	lsls r4, r0, #3
	ldr r1, _080B94E8 @ =0x08CEEBA4
	ldr r0, [r1]
	adds r0, r0, r4
	adds r1, r7, #3
	adds r1, #3
	adds r1, r5, r1
	lsls r1, r1, #1
	add r1, sb
	movs r2, #0
	str r2, [sp]
	str r3, [sp, #4]
	movs r2, #2
	movs r3, #0
	bl PutDrawText
	b _080B9542
	.align 2, 0
_080B94E8: .4byte 0x08CEEBA4
_080B94EC: .4byte 0x02023460
_080B94F0: .4byte 0x00001189
_080B94F4:
	adds r0, r6, #0
	bl GetChapterInfo
	adds r1, r0, #0
	movs r2, #0
	ldr r0, _080B9560 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _080B9508
	movs r2, #1
_080B9508:
	adds r0, r1, #0
	adds r0, #0x84
	adds r0, r0, r2
	movs r1, #1
	ldrb r0, [r0]
	ands r1, r0
	mov r2, sl
	lsls r4, r2, #3
	cmp r1, #0
	beq _080B9542
	ldr r0, _080B9564 @ =0x00001188
	bl DecodeMsg
	adds r3, r0, #0
	ldr r1, _080B9568 @ =0x08CEEBA4
	ldr r0, [r1]
	adds r0, r0, r4
	adds r1, r7, #3
	adds r1, #3
	adds r1, r5, r1
	lsls r1, r1, #1
	add r1, sb
	movs r2, #0
	str r2, [sp]
	str r3, [sp, #4]
	movs r2, #2
	movs r3, #0
	bl PutDrawText
_080B9542:
	cmp r6, #0x2f
	bgt _080B956C
	cmp r6, #0x2e
	blt _080B956C
	ldr r2, [sp, #8]
	ldm r2!, {r0}
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x17
	ldr r0, [r2]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x17
	adds r7, r7, r0
	movs r3, #1
	str r3, [sp, #0xc]
	b _080B9574
	.align 2, 0
_080B9560: .4byte 0x0202BBF8
_080B9564: .4byte 0x00001188
_080B9568: .4byte 0x08CEEBA4
_080B956C:
	ldr r1, [sp, #8]
	ldr r0, [r1]
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x17
_080B9574:
	cmp r6, #0x19
	bne _080B95CC
	movs r0, #0x19
	bl GetChapterInfo
	adds r2, r0, #0
	ldr r0, _080B95C0 @ =0x0202BBF8
	movs r1, #0
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _080B958C
	movs r1, #2
_080B958C:
	adds r0, r2, #0
	adds r0, #0x74
	adds r0, r0, r1
	ldrh r0, [r0]
	bl DecodeMsg
	adds r3, r0, #0
	ldr r0, _080B95C4 @ =0x08CEEBA4
	adds r1, r4, #0
	adds r1, #0x48
	ldr r0, [r0]
	adds r0, r0, r1
	adds r1, r5, #0
	adds r1, #8
	adds r1, #3
	lsls r1, r1, #1
	ldr r2, _080B95C8 @ =0x02023460
	adds r1, r1, r2
	movs r2, #0
	str r2, [sp]
	str r3, [sp, #4]
	movs r3, #0
	bl PutDrawText
	b _080B960E
	.align 2, 0
_080B95C0: .4byte 0x0202BBF8
_080B95C4: .4byte 0x08CEEBA4
_080B95C8: .4byte 0x02023460
_080B95CC:
	adds r0, r6, #0
	bl GetChapterInfo
	adds r2, r0, #0
	ldr r0, _080B9648 @ =0x0202BBF8
	movs r1, #0
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _080B95E0
	movs r1, #2
_080B95E0:
	adds r0, r2, #0
	adds r0, #0x74
	adds r0, r0, r1
	ldrh r0, [r0]
	bl DecodeMsg
	adds r3, r0, #0
	ldr r0, _080B964C @ =0x08CEEBA4
	adds r1, r4, #0
	adds r1, #0x48
	ldr r0, [r0]
	adds r0, r0, r1
	adds r1, r5, #5
	adds r1, #3
	lsls r1, r1, #1
	ldr r2, _080B9650 @ =0x02023460
	adds r1, r1, r2
	movs r2, #0
	str r2, [sp]
	str r3, [sp, #4]
	movs r3, #0
	bl PutDrawText
_080B960E:
	adds r0, r5, #0
	adds r0, #0x14
	adds r0, #3
	lsls r0, r0, #1
	ldr r4, _080B9650 @ =0x02023460
	adds r0, r0, r4
	movs r1, #2
	adds r2, r7, #0
	bl PutNumber
	ldr r0, _080B964C @ =0x08CEEBA4
	ldr r0, [r0]
	adds r0, #0x90
	adds r1, r5, #0
	adds r1, #0x15
	adds r1, #3
	lsls r1, r1, #1
	adds r1, r1, r4
	bl PutText
_080B9636:
	ldr r0, [sp, #0xc]
_080B9638:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B9648: .4byte 0x0202BBF8
_080B964C: .4byte 0x08CEEBA4
_080B9650: .4byte 0x02023460
