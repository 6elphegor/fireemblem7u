	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A79A4
sub_080A79A4: @ 0x080A79A4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r5, r0, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A7A2A
	movs r4, #0
	ldr r0, [r5, #0x40]
	cmp r4, r0
	bge _080A7A2A
	ldr r0, _080A7A90 @ =0x080C5A48
	mov r8, r0
	movs r6, #0
_080A79C4:
	ldrh r7, [r5, #0x3e]
	lsrs r3, r7, #4
	ldr r0, [r5, #0x44]
	muls r0, r4, r0
	adds r3, r3, r0
	adds r3, #0x28
	ldr r1, [r5, #0x34]
	lsls r1, r1, #0xc
	movs r0, #0xff
	ands r3, r0
	lsls r0, r3, #1
	add r0, r8
	movs r7, #0
	ldrsh r2, [r0, r7]
	movs r0, #0x46
	muls r0, r2, r0
	adds r1, r1, r0
	ldr r2, [r5, #0x38]
	lsls r2, r2, #0xc
	adds r3, #0x40
	lsls r3, r3, #1
	add r3, r8
	movs r0, #0
	ldrsh r3, [r3, r0]
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #2
	adds r2, r2, r0
	asrs r2, r2, #0xc
	subs r2, #0x10
	ldr r0, _080A7A94 @ =0x0201E8D4
	adds r0, r6, r0
	lsls r1, r1, #4
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl sub_08054E10
	ldrh r7, [r5, #0x3e]
	lsrs r1, r7, #4
	ldr r0, [r5, #0x44]
	muls r0, r4, r0
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_080A793C
	adds r6, #0x38
	adds r4, #1
	ldr r0, [r5, #0x40]
	cmp r4, r0
	blt _080A79C4
_080A7A2A:
	movs r0, #0x3e
	ldrsh r1, [r5, r0]
	movs r0, #0xb0
	lsls r0, r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #2
	movs r2, #0
	movs r3, #0
	bl BgAffinRotScaling
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #2
	bl BgAffinScaling
	movs r7, #0x34
	ldrsh r1, [r5, r7]
	movs r0, #0x38
	ldrsh r2, [r5, r0]
	movs r0, #0x4c
	str r0, [sp]
	movs r0, #2
	movs r3, #0x4c
	bl BgAffinAnchoring
	ldr r4, _080A7A98 @ =0x02000001
	ldr r0, [r5, #0x48]
	str r0, [sp]
	movs r0, #8
	movs r1, #8
	movs r2, #0x10
	movs r3, #0x10
	bl sub_080A86A0
	strb r0, [r4]
	adds r2, r5, #0
	adds r2, #0x4c
	ldrb r0, [r2]
	cmp r0, #0
	bne _080A7AA0
	ldr r0, [r5, #0x48]
	adds r0, #8
	str r0, [r5, #0x48]
	ldr r1, _080A7A9C @ =0x000003FF
	cmp r0, r1
	ble _080A7AAE
	movs r0, #1
	b _080A7AAC
	.align 2, 0
_080A7A90: .4byte 0x080C5A48
_080A7A94: .4byte 0x0201E8D4
_080A7A98: .4byte 0x02000001
_080A7A9C: .4byte 0x000003FF
_080A7AA0:
	ldr r0, [r5, #0x48]
	subs r0, #8
	str r0, [r5, #0x48]
	cmp r0, #0
	bgt _080A7AAE
	movs r0, #0
_080A7AAC:
	strb r0, [r2]
_080A7AAE:
	adds r1, r5, #0
	adds r1, #0x4e
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080A7AD6
	adds r0, r5, #0
	adds r0, #0x4d
	movs r1, #1
	ldrb r0, [r0]
	ands r1, r0
	lsls r1, r1, #4
	adds r1, #0x68
	movs r2, #0xbc
	lsls r2, r2, #4
	movs r0, #0x6c
	bl DisplayFrozenUiHandExt
	b _080A7AEA
_080A7AD6:
	adds r0, r5, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, #0x68
	movs r2, #0xbc
	lsls r2, r2, #4
	movs r0, #0x6c
	bl DisplayUiHandExt
_080A7AEA:
	ldr r3, _080A7B68 @ =0x08CE483C
	movs r4, #0xb0
	lsls r4, r4, #8
	str r4, [sp]
	movs r0, #0xd
	movs r1, #0
	movs r2, #8
	bl PutSpriteExt
	ldr r3, _080A7B6C @ =0x08CE4856
	str r4, [sp]
	movs r0, #0xd
	movs r1, #0x14
	movs r2, #0x1c
	bl PutSpriteExt
	ldr r3, _080A7B70 @ =0x08CE489C
	str r4, [sp]
	movs r0, #0xd
	movs r1, #0x28
	movs r2, #0x40
	bl PutSpriteExt
	ldr r0, [r5, #0x2c]
	asrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080A7B32
	ldr r3, _080A7B74 @ =0x08CE487C
	str r4, [sp]
	movs r0, #0xd
	movs r1, #8
	movs r2, #0x82
	bl PutSpriteExt
_080A7B32:
	ldr r0, [r5, #0x2c]
	cmp r0, #0
	beq _080A7B3C
	adds r0, #1
	str r0, [r5, #0x2c]
_080A7B3C:
	ldr r3, _080A7B78 @ =0x08CE48A4
	movs r0, #0xa0
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #0xd
	movs r1, #0x6c
	movs r2, #0x18
	bl PutSpriteExt
	ldr r0, [r5, #0x30]
	bl sub_080A73F8
	ldr r0, [r5, #0x30]
	adds r0, #1
	str r0, [r5, #0x30]
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A7B68: .4byte 0x08CE483C
_080A7B6C: .4byte 0x08CE4856
_080A7B70: .4byte 0x08CE489C
_080A7B74: .4byte 0x08CE487C
_080A7B78: .4byte 0x08CE48A4
