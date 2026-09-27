	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806D250
sub_0806D250: @ 0x0806D250
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldrb r0, [r1]
	cmp r0, #0
	beq _0806D266
	b _0806D378
_0806D266:
	adds r1, r7, #4
	ldr r0, [r7]
	bl sub_0806CFFC
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	bne _0806D278
	b _0806D378
_0806D278:
	adds r0, r7, #4
	ldrh r1, [r0]
	lsls r0, r1, #0x17
	lsrs r1, r0, #0x17
	adds r0, r7, #4
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, r7, #6
	ldrh r1, [r0]
	movs r0, #0xff
	ands r1, r0
	adds r0, r7, #6
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3f
	ldrb r0, [r1]
	cmp r0, #6
	beq _0806D2BA
	b _0806D2BC
_0806D2BA:
	b _0806D33C
_0806D2BC:
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	cmp r1, #0
	bne _0806D2C6
	b _0806D33C
_0806D2C6:
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	movs r0, #0xb
	ldrsb r0, [r1, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0x80
	beq _0806D2D8
	b _0806D33C
_0806D2D8:
	ldr r0, _0806D334 @ =0x0202BBF8
	ldrb r1, [r0, #0xd]
	cmp r1, #0
	beq _0806D33C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4e
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x52
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	asrs r1, r0, #4
	adds r0, r1, #0
	adds r0, #8
	asrs r1, r0, #4
	adds r2, r1, #0
	lsls r0, r2, #2
	ldr r2, _0806D338 @ =0x0202E3EC
	ldr r1, [r2]
	adds r0, r0, r1
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x4c
	movs r4, #0
	ldrsh r1, [r2, r4]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x50
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r1, r1, r2
	asrs r2, r1, #4
	adds r1, r2, #0
	adds r1, #8
	asrs r2, r1, #4
	ldr r1, [r0]
	adds r0, r2, r1
	ldrb r1, [r0]
	cmp r1, #0
	bne _0806D33C
	b _0806D378
	.align 2, 0
_0806D334: .4byte 0x0202BBF8
_0806D338: .4byte 0x0202E3EC
_0806D33C:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3f
	ldrb r0, [r1]
	cmp r0, #7
	bne _0806D364
	adds r0, r7, #6
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r1, r0
	adds r0, r7, #6
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_0806D364:
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	adds r2, r7, #4
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r3, r7, #6
	movs r4, #0
	ldrsh r2, [r3, r4]
	bl DisplaySpriteAnim
_0806D378:
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
