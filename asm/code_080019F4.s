	.include "macro.inc"

	.syntax unified

	thumb_func_start RefreshKeyStFromKeys
RefreshKeyStFromKeys: @ 0x080019F4
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	adds r0, r1, #0
	adds r1, r7, #4
	strh r0, [r1]
	ldr r0, [r7]
	ldr r1, [r7]
	ldrh r2, [r0, #0xa]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1, #4]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0xa]
	ldr r0, [r7]
	adds r1, r7, #4
	ldrh r2, [r0, #4]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #4]
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r7]
	ldr r3, [r7]
	ldrh r2, [r2, #4]
	ldrh r3, [r3, #0xa]
	eors r2, r3
	ldr r3, [r7]
	ldrh r3, [r3, #4]
	adds r4, r3, #0
	ands r2, r4
	ldrh r3, [r1, #6]
	movs r4, #0
	ands r3, r4
	adds r4, r3, #0
	adds r3, r2, #0
	orrs r4, r3
	adds r3, r4, #0
	strh r3, [r1, #6]
	adds r1, r2, #0
	movs r2, #0
	bics r1, r2
	ldrh r2, [r0, #8]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #8]
	ldr r0, [r7]
	ldrh r1, [r0, #8]
	cmp r1, #0
	beq _08001A88
	ldr r0, [r7]
	ldr r1, [r7]
	ldrh r2, [r0, #0xc]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1, #4]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0xc]
_08001A88:
	ldr r0, [r7]
	ldrh r1, [r0, #0xe]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0xe]
	ldr r0, [r7]
	ldrh r1, [r0, #4]
	cmp r1, #0
	bne _08001AD0
	ldr r0, [r7]
	ldrh r1, [r0, #0xc]
	cmp r1, #0
	beq _08001AD0
	ldr r0, [r7]
	ldr r1, [r7]
	ldrh r2, [r1, #0xa]
	ldr r3, _08001B34 @ =0x00000303
	adds r1, r2, #0
	ands r1, r3
	ldrh r0, [r0, #0xc]
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	cmp r0, r1
	bne _08001AD0
	ldr r0, [r7]
	ldr r1, [r7]
	ldrh r2, [r0, #0xe]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1, #0xa]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0xe]
_08001AD0:
	ldr r0, [r7]
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _08001B38
	ldr r0, [r7]
	ldr r1, [r7]
	ldrh r0, [r0, #4]
	ldrh r1, [r1, #0xa]
	cmp r0, r1
	bne _08001B38
	ldr r1, [r7]
	ldr r0, [r7]
	ldr r1, [r7]
	ldrb r2, [r1, #2]
	subs r1, r2, #1
	ldrb r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #2]
	ldr r0, [r7]
	ldrb r1, [r0, #2]
	cmp r1, #0
	bne _08001B32
	ldr r0, [r7]
	ldr r1, [r7]
	ldrh r2, [r0, #6]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1, #4]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #6]
	ldr r0, [r7]
	ldr r1, [r7]
	ldrb r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1, #1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #2]
_08001B32:
	b _08001B4E
	.align 2, 0
_08001B34: .4byte 0x00000303
_08001B38:
	ldr r0, [r7]
	ldr r1, [r7]
	ldrb r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #2]
_08001B4E:
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r7]
	ldrh r1, [r1, #4]
	ldrh r2, [r2, #0x10]
	eors r1, r2
	ldr r2, [r7]
	ldrh r2, [r2, #4]
	adds r3, r2, #0
	ands r1, r3
	ldrh r2, [r0, #0x10]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x10]
	adds r0, r7, #4
	ldrh r1, [r0]
	ldr r2, _08001B94 @ =0x000003F3
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0
	beq _08001B98
	ldr r0, [r7]
	ldrh r1, [r0, #0x12]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x12]
	b _08001BBC
	.align 2, 0
_08001B94: .4byte 0x000003F3
_08001B98:
	ldr r0, [r7]
	ldrh r1, [r0, #0x12]
	ldr r0, _08001BC4 @ =0x0000FFFE
	cmp r1, r0
	bhi _08001BBC
	ldr r1, [r7]
	ldr r0, [r7]
	ldr r1, [r7]
	ldrh r2, [r1, #0x12]
	adds r1, r2, #1
	ldrh r2, [r0, #0x12]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x12]
_08001BBC:
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001BC4: .4byte 0x0000FFFE
