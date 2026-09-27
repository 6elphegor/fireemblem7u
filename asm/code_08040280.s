	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08040280
sub_08040280: @ 0x08040280
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r1
	mov sl, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	adds r1, r3, #0
	movs r2, #0
	ldr r4, _080402B8 @ =0x0203DB68
_0804029C:
	lsls r0, r2, #4
	adds r0, r0, r4
	ldr r0, [r0]
	lsrs r0, r0, #5
	cmp r0, r1
	bhs _080402BC
	adds r7, r2, #0
	movs r2, #9
	lsls r3, r3, #5
	str r3, [sp, #4]
	cmp r2, r7
	ble _0804032E
	b _080402C8
	.align 2, 0
_080402B8: .4byte 0x0203DB68
_080402BC:
	adds r2, #1
	cmp r2, #9
	ble _0804029C
	movs r0, #1
	rsbs r0, r0, #0
	b _08040392
_080402C8:
	ldr r6, _080403A4 @ =0x0203DB68
	lsls r1, r2, #4
	adds r4, r1, r6
	subs r2, #1
	mov r8, r2
	lsls r5, r2, #4
	adds r5, r5, r6
	ldrb r0, [r5]
	lsls r2, r0, #0x1e
	lsrs r2, r2, #0x1e
	movs r0, #4
	rsbs r0, r0, #0
	ldrb r3, [r4]
	ands r0, r3
	orrs r0, r2
	strb r0, [r4]
	ldr r3, [r5]
	lsrs r3, r3, #5
	lsls r3, r3, #5
	ldr r0, [r4]
	movs r2, #0x1f
	ands r0, r2
	orrs r0, r3
	str r0, [r4]
	movs r2, #0xc
	ldrb r0, [r5]
	ands r2, r0
	movs r0, #0xd
	rsbs r0, r0, #0
	ldrb r3, [r4]
	ands r0, r3
	orrs r0, r2
	strb r0, [r4]
	movs r3, #0x10
	ldrb r5, [r5]
	ands r3, r5
	movs r2, #0x11
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r3
	strb r0, [r4]
	adds r0, r6, #0
	subs r0, #0xc
	adds r0, r1, r0
	adds r6, #4
	adds r1, r1, r6
	bl SioStrCpy
	mov r2, r8
	cmp r2, r7
	bgt _080402C8
_0804032E:
	ldr r5, _080403A4 @ =0x0203DB68
	lsls r1, r7, #4
	adds r4, r1, r5
	movs r3, #3
	ldr r2, [sp]
	ands r2, r3
	movs r0, #4
	rsbs r0, r0, #0
	ldrb r6, [r4]
	ands r0, r6
	orrs r0, r2
	strb r0, [r4]
	ldr r0, [r4]
	movs r2, #0x1f
	ands r0, r2
	ldr r2, [sp, #4]
	orrs r0, r2
	str r0, [r4]
	mov r6, sb
	ands r6, r3
	lsls r2, r6, #2
	movs r0, #0xd
	rsbs r0, r0, #0
	ldrb r3, [r4]
	ands r0, r3
	orrs r0, r2
	movs r2, #1
	mov r6, sl
	ands r6, r2
	lsls r3, r6, #4
	movs r2, #0x11
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r3
	strb r0, [r4]
	ldr r0, _080403A8 @ =0x08B98AEC
	ldr r0, [r0]
	movs r2, #6
	ldrsb r2, [r0, r2]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	subs r0, r0, r2
	ldr r2, _080403AC @ =0x0203D9AD
	adds r0, r0, r2
	adds r5, #4
	adds r1, r1, r5
	bl SioStrCpy
	adds r0, r7, #0
_08040392:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080403A4: .4byte 0x0203DB68
_080403A8: .4byte 0x08B98AEC
_080403AC: .4byte 0x0203D9AD
