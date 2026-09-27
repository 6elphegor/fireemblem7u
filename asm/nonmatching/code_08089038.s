	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08089038
sub_08089038: @ 0x08089038
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #0
	beq _080890DC
	ldr r0, _080890D8 @ =0x03002870
	mov ip, r0
	movs r0, #0x20
	mov r1, ip
	ldrb r1, [r1, #1]
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, ip
	strb r0, [r2, #1]
	mov r0, ip
	adds r0, #0x2d
	movs r2, #0
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x31
	movs r0, #0x38
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2c
	movs r3, #0xf0
	strb r3, [r0]
	subs r1, #1
	movs r0, #0x98
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2f
	strb r2, [r0]
	adds r0, #4
	strb r2, [r0]
	subs r0, #5
	strb r3, [r0]
	adds r1, #2
	movs r0, #0x20
	strb r0, [r1]
	adds r1, #2
	movs r0, #1
	ldrb r3, [r1]
	orrs r0, r3
	movs r4, #2
	orrs r0, r4
	movs r3, #4
	orrs r0, r3
	movs r2, #8
	orrs r0, r2
	movs r5, #0x10
	orrs r0, r5
	strb r0, [r1]
	mov r6, ip
	adds r6, #0x35
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r7, [r6]
	ands r0, r7
	orrs r0, r4
	orrs r0, r3
	orrs r0, r2
	orrs r0, r5
	strb r0, [r6]
	mov r5, ip
	adds r5, #0x36
	ldrb r0, [r5]
	ands r1, r0
	orrs r1, r4
	orrs r1, r3
	orrs r1, r2
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r5]
	b _0808913C
	.align 2, 0
_080890D8: .4byte 0x03002870
_080890DC:
	ldr r1, _08089144 @ =0x03002870
	mov ip, r1
	movs r0, #0x20
	ldrb r3, [r1, #1]
	orrs r0, r3
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r6, ip
	strb r0, [r6, #1]
	mov r0, ip
	adds r0, #0x2d
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x31
	movs r0, #0x38
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	adds r1, #4
	movs r0, #1
	ldrb r7, [r1]
	orrs r0, r7
	movs r5, #2
	orrs r0, r5
	movs r4, #4
	orrs r0, r4
	movs r3, #8
	orrs r0, r3
	movs r2, #0x10
	orrs r0, r2
	strb r0, [r1]
	adds r1, #2
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r6, [r1]
	ands r0, r6
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	orrs r0, r2
	strb r0, [r1]
_0808913C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08089144: .4byte 0x03002870
