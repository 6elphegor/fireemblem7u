	.include "macro.inc"

	.syntax unified

	thumb_func_start BanimUpdateSpriteRotScale
BanimUpdateSpriteRotScale: @ 0x08067444
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r6, r1, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	adds r7, r0, #0
	ldr r1, _080675BC @ =0xFFFF0000
	ldr r0, [sp, #4]
	ands r0, r1
	str r0, [sp, #4]
	lsls r3, r3, #0x10
	mov sb, r3
	mov r0, r8
	orrs r0, r3
	str r0, [sp]
	ldr r4, _080675C0 @ =0xFFFF0004
	adds r1, r6, #0
	stm r1!, {r4}
	mov r0, sp
	movs r2, #1
	movs r3, #2
	bl ObjAffineSet
	adds r5, r6, #0
	adds r5, #0xc
	str r4, [r6, #0xc]
	adds r1, r6, #0
	adds r1, #0x10
	mov r0, sp
	movs r2, #1
	movs r3, #2
	bl ObjAffineSet
	ldrh r1, [r5, #4]
	rsbs r0, r1, #0
	strh r0, [r5, #4]
	ldrh r2, [r5, #6]
	rsbs r0, r2, #0
	strh r0, [r5, #6]
	adds r5, #0xc
	str r4, [r6, #0x18]
	adds r1, r6, #0
	adds r1, #0x1c
	mov r0, sp
	movs r2, #1
	movs r3, #2
	bl ObjAffineSet
	ldrh r3, [r5, #8]
	rsbs r0, r3, #0
	strh r0, [r5, #8]
	ldrh r1, [r5, #0xa]
	rsbs r0, r1, #0
	strh r0, [r5, #0xa]
	adds r5, #0xc
	str r4, [r6, #0x24]
	adds r1, r6, #0
	adds r1, #0x28
	mov r0, sp
	movs r2, #1
	movs r3, #2
	bl ObjAffineSet
	ldrh r2, [r5, #4]
	rsbs r0, r2, #0
	strh r0, [r5, #4]
	ldrh r3, [r5, #6]
	rsbs r0, r3, #0
	strh r0, [r5, #6]
	ldrh r1, [r5, #8]
	rsbs r0, r1, #0
	strh r0, [r5, #8]
	ldrh r2, [r5, #0xa]
	rsbs r0, r2, #0
	strh r0, [r5, #0xa]
	adds r6, #0x30
	ldr r0, [r7]
	cmp r0, #1
	beq _0806759C
	mov r3, r8
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	mov r0, sb
	asrs r5, r0, #0x10
_080674F6:
	ldr r2, [r7]
	movs r0, #0x80
	lsls r0, r0, #0x15
	ands r0, r2
	rsbs r0, r0, #0
	asrs r1, r0, #0x1f
	movs r0, #0x80
	lsls r0, r0, #0x12
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #0x16
	ands r0, r2
	cmp r0, #0
	beq _08067518
	movs r3, #0x80
	lsls r3, r3, #0x13
	adds r1, r1, r3
_08067518:
	ldr r0, _080675C4 @ =0xC1FFFFFF
	ands r0, r2
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r1, r3
	adds r0, r0, r1
	str r0, [r6]
	ldrh r0, [r7, #4]
	strh r0, [r6, #4]
	adds r0, r2, #0
	bl GetAnimSpriteRotScaleX
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x11
	lsls r1, r4, #8
	adds r0, r1, #0
	mov r1, r8
	bl Div
	subs r1, r4, r0
	movs r2, #6
	ldrsh r0, [r7, r2]
	subs r4, r0, r1
	lsls r1, r0, #8
	adds r0, r1, #0
	mov r1, r8
	bl Div
	adds r1, r0, #0
	movs r3, #6
	ldrsh r0, [r7, r3]
	subs r1, r0, r1
	subs r4, r4, r1
	strh r4, [r6, #6]
	ldr r0, [r7]
	bl GetAnimSpriteRotScaleY
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x11
	lsls r1, r4, #8
	adds r0, r1, #0
	adds r1, r5, #0
	bl Div
	subs r1, r4, r0
	movs r2, #8
	ldrsh r0, [r7, r2]
	subs r4, r0, r1
	lsls r1, r0, #8
	adds r0, r1, #0
	adds r1, r5, #0
	bl Div
	adds r1, r0, #0
	movs r3, #8
	ldrsh r0, [r7, r3]
	subs r1, r0, r1
	subs r4, r4, r1
	strh r4, [r6, #8]
	adds r6, #0xc
	adds r7, #0xc
	ldr r0, [r7]
	cmp r0, #1
	bne _080674F6
_0806759C:
	ldr r0, [r7]
	str r0, [r6]
	ldrh r0, [r7, #4]
	strh r0, [r6, #4]
	ldrh r0, [r7, #6]
	strh r0, [r6, #6]
	ldrh r0, [r7, #8]
	strh r0, [r6, #8]
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080675BC: .4byte 0xFFFF0000
_080675C0: .4byte 0xFFFF0004
_080675C4: .4byte 0xC1FFFFFF
