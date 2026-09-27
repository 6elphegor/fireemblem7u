	.include "macro.inc"

	.syntax unified

	thumb_func_start SaveDrawCursor_Loop
SaveDrawCursor_Loop: @ 0x080A5D2C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r1, _080A5DA4 @ =0x08418DA0
	add r0, sp, #4
	movs r2, #8
	bl memcpy
	ldrh r0, [r7, #0x2a]
	adds r0, #1
	strh r0, [r7, #0x2a]
	adds r2, r7, #0
	adds r2, #0x2c
	ldrb r0, [r2]
	cmp r0, #3
	bhi _080A5D58
	adds r0, #1
	strb r0, [r2]
_080A5D58:
	adds r0, r7, #0
	adds r0, #0x31
	ldrb r1, [r0]
	mov sl, r0
	cmp r1, #0
	beq _080A5E34
	adds r1, r7, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	mov r8, r0
	adds r0, r7, #0
	adds r0, #0x2d
	ldrb r3, [r0]
	mov sb, r1
	mov ip, r0
	adds r4, r7, #0
	adds r4, #0x30
	adds r5, r7, #0
	adds r5, #0x2e
	ldrb r2, [r2]
	cmp r2, #3
	bhi _080A5D92
	ldrb r0, [r4]
	add r0, r8
	lsrs r0, r0, #1
	mov r8, r0
	ldrb r1, [r5]
	adds r0, r1, r3
	lsrs r3, r0, #1
_080A5D92:
	adds r0, r7, #0
	adds r0, #0x35
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	bne _080A5DA8
	adds r0, r3, #0
	adds r0, #0x86
	b _080A5DAC
	.align 2, 0
_080A5DA4: .4byte 0x08418DA0
_080A5DA8:
	adds r0, r3, #0
	adds r0, #0xb0
_080A5DAC:
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	mov r1, sb
	ldrb r0, [r1]
	strb r0, [r4]
	mov r1, ip
	ldrb r0, [r1]
	strb r0, [r5]
	ldrb r0, [r2]
	cmp r0, #0
	bne _080A5E08
	ldrh r2, [r7, #0x2a]
	lsrs r0, r2, #3
	movs r5, #7
	ands r0, r5
	add r0, sp
	adds r0, #4
	ldrb r2, [r0]
	add r2, r8
	ldr r0, _080A5E04 @ =0x08CE41AC
	mov sb, r0
	movs r4, #0x80
	lsls r4, r4, #5
	str r4, [sp]
	movs r0, #4
	adds r1, r3, #0
	mov r3, sb
	bl PutSpriteExt
	orrs r6, r4
	ldrh r1, [r7, #0x2a]
	lsrs r0, r1, #3
	ands r0, r5
	add r0, sp
	adds r0, #4
	ldrb r2, [r0]
	add r2, r8
	str r4, [sp]
	movs r0, #4
	adds r1, r6, #0
	mov r3, sb
	bl PutSpriteExt
	b _080A5E28
	.align 2, 0
_080A5E04: .4byte 0x08CE41AC
_080A5E08:
	ldrh r2, [r7, #0x2a]
	lsrs r0, r2, #3
	movs r1, #7
	ands r0, r1
	add r0, sp
	adds r0, #4
	ldrb r2, [r0]
	add r2, r8
	ldr r3, _080A5E30 @ =0x08CE41AC
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #4
	bl PutSpriteExt
_080A5E28:
	adds r1, r7, #0
	adds r1, #0x2c
	movs r0, #0
	b _080A5E3E
	.align 2, 0
_080A5E30: .4byte 0x08CE41AC
_080A5E34:
	ldrb r2, [r2]
	cmp r2, #4
	bne _080A5E40
	movs r0, #0
	mov r1, sl
_080A5E3E:
	strb r0, [r1]
_080A5E40:
	adds r4, r7, #0
	adds r4, #0x33
	ldrb r0, [r4]
	cmp r0, #0
	beq _080A5E60
	adds r0, r7, #0
	adds r0, #0x32
	ldrb r2, [r0]
	ldr r3, _080A5E88 @ =0x08CE41AC
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #6
	bl PutSpriteExt
_080A5E60:
	adds r1, r7, #0
	adds r1, #0x34
	ldrb r0, [r1]
	cmp r0, #0
	beq _080A5E6E
	movs r0, #0
	strb r0, [r4]
_080A5E6E:
	movs r0, #0
	mov r2, sl
	strb r0, [r2]
	movs r0, #1
	strb r0, [r1]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A5E88: .4byte 0x08CE41AC
