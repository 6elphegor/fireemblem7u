	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08047420
sub_08047420: @ 0x08047420
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _080474C0 @ =0x08B9A1E0
	bl Proc_StartBlocking
	adds r0, #0x64
	movs r3, #0
	strh r4, [r0]
	ldr r0, _080474C4 @ =0x03002870
	mov ip, r0
	movs r2, #1
	ldrb r0, [r0, #1]
	orrs r0, r2
	movs r1, #2
	mov r8, r1
	mov r1, r8
	orrs r0, r1
	movs r6, #4
	orrs r0, r6
	movs r5, #8
	orrs r0, r5
	movs r4, #0x10
	orrs r0, r4
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	mov r0, ip
	adds r0, #0x2f
	strb r3, [r0]
	adds r0, #4
	strb r3, [r0]
	adds r1, #0x2e
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	mov r7, ip
	adds r7, #0x35
	ldrb r0, [r7]
	orrs r2, r0
	mov r1, r8
	orrs r2, r1
	orrs r2, r6
	orrs r2, r5
	orrs r2, r4
	mov r3, ip
	adds r3, #0x36
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r3]
	movs r0, #0x20
	orrs r2, r0
	strb r2, [r7]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080474C0: .4byte 0x08B9A1E0
_080474C4: .4byte 0x03002870
