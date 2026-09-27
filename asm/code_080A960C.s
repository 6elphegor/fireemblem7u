	.include "macro.inc"

	.syntax unified

	thumb_func_start SysGrayBox_Loop
SysGrayBox_Loop: @ 0x080A960C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r0, [sp, #4]
	movs r1, #0
_080A961C:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, #0x2c
	ldr r2, [sp, #4]
	adds r5, r2, r0
	movs r0, #0
	ldrsb r0, [r5, r0]
	adds r1, #1
	str r1, [sp, #0xc]
	cmp r0, #0
	bne _080A9636
	b _080A9930
_080A9636:
	ldr r1, [r2, #0x60]
	movs r0, #0xf
	ands r1, r0
	lsls r1, r1, #0xc
	ldr r0, [r2, #0x5c]
	adds r0, r0, r1
	ldrh r3, [r5, #8]
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldrb r0, [r5, #1]
	ldr r1, _080A98B4 @ =0x000001FF
	ldrh r2, [r5, #2]
	ands r1, r2
	movs r2, #0xff
	ldrh r3, [r5, #4]
	ands r2, r3
	mov r3, r8
	str r3, [sp]
	ldr r3, _080A98B8 @ =0x08B905B0
	bl PutSpriteExt
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldrb r2, [r5, #6]
	subs r2, #1
	lsls r2, r2, #3
	adds r1, r1, r2
	ldr r3, _080A98B4 @ =0x000001FF
	ands r1, r3
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r1, r2
	movs r2, #0xff
	ldrh r3, [r5, #4]
	ands r2, r3
	mov r3, r8
	str r3, [sp]
	ldr r3, _080A98B8 @ =0x08B905B0
	bl PutSpriteExt
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldrb r2, [r5, #6]
	subs r2, #1
	lsls r2, r2, #3
	adds r1, r1, r2
	ldr r3, _080A98B4 @ =0x000001FF
	ands r1, r3
	movs r2, #0xc0
	lsls r2, r2, #6
	adds r1, r1, r2
	movs r3, #4
	ldrsh r2, [r5, r3]
	ldrb r3, [r5, #7]
	subs r3, #1
	lsls r3, r3, #3
	adds r2, r2, r3
	movs r3, #0xff
	ands r2, r3
	mov r3, r8
	str r3, [sp]
	ldr r3, _080A98B8 @ =0x08B905B0
	bl PutSpriteExt
	ldrb r0, [r5, #1]
	ldr r1, _080A98B4 @ =0x000001FF
	ldrh r2, [r5, #2]
	ands r1, r2
	movs r3, #0x80
	lsls r3, r3, #6
	adds r1, r1, r3
	movs r3, #4
	ldrsh r2, [r5, r3]
	ldrb r3, [r5, #7]
	subs r3, #1
	lsls r3, r3, #3
	adds r2, r2, r3
	movs r3, #0xff
	ands r2, r3
	mov r3, r8
	str r3, [sp]
	ldr r3, _080A98B8 @ =0x08B905B0
	bl PutSpriteExt
	movs r7, #1
	ldrb r0, [r5, #6]
	subs r0, #4
	cmp r7, r0
	bge _080A974C
	ldr r0, _080A98B4 @ =0x000001FF
	mov sl, r0
	ldr r1, _080A98BC @ =0x08B90608
	mov sb, r1
	mov r6, r8
	adds r6, #1
_080A96FC:
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	lsls r4, r7, #3
	adds r1, r1, r4
	mov r3, sl
	ands r1, r3
	movs r2, #0xff
	ldrh r3, [r5, #4]
	ands r2, r3
	str r6, [sp]
	mov r3, sb
	bl PutSpriteExt
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	adds r1, r1, r4
	mov r3, sl
	ands r1, r3
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r1, r2
	movs r3, #4
	ldrsh r2, [r5, r3]
	ldrb r3, [r5, #7]
	subs r3, #1
	lsls r3, r3, #3
	adds r2, r2, r3
	movs r3, #0xff
	ands r2, r3
	str r6, [sp]
	mov r3, sb
	bl PutSpriteExt
	adds r7, #4
	ldrb r0, [r5, #6]
	subs r0, #4
	cmp r7, r0
	blt _080A96FC
_080A974C:
	ldrb r0, [r5, #6]
	subs r0, #2
	cmp r7, r0
	bge _080A97B0
	ldr r0, _080A98B4 @ =0x000001FF
	mov sl, r0
	ldr r1, _080A98C0 @ =0x08B905E8
	mov sb, r1
	mov r6, r8
	adds r6, #1
_080A9760:
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	lsls r4, r7, #3
	adds r1, r1, r4
	mov r3, sl
	ands r1, r3
	movs r2, #0xff
	ldrh r3, [r5, #4]
	ands r2, r3
	str r6, [sp]
	mov r3, sb
	bl PutSpriteExt
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	adds r1, r1, r4
	mov r3, sl
	ands r1, r3
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r1, r2
	movs r3, #4
	ldrsh r2, [r5, r3]
	ldrb r3, [r5, #7]
	subs r3, #1
	lsls r3, r3, #3
	adds r2, r2, r3
	movs r3, #0xff
	ands r2, r3
	str r6, [sp]
	mov r3, sb
	bl PutSpriteExt
	adds r7, #2
	ldrb r0, [r5, #6]
	subs r0, #2
	cmp r7, r0
	blt _080A9760
_080A97B0:
	ldrb r0, [r5, #6]
	subs r0, #1
	cmp r7, r0
	bge _080A9814
	ldr r0, _080A98B4 @ =0x000001FF
	mov sl, r0
	ldr r1, _080A98B8 @ =0x08B905B0
	mov sb, r1
	mov r6, r8
	adds r6, #1
_080A97C4:
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	lsls r4, r7, #3
	adds r1, r1, r4
	mov r3, sl
	ands r1, r3
	movs r2, #0xff
	ldrh r3, [r5, #4]
	ands r2, r3
	str r6, [sp]
	mov r3, sb
	bl PutSpriteExt
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	adds r1, r1, r4
	mov r3, sl
	ands r1, r3
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r1, r2
	movs r3, #4
	ldrsh r2, [r5, r3]
	ldrb r3, [r5, #7]
	subs r3, #1
	lsls r3, r3, #3
	adds r2, r2, r3
	movs r3, #0xff
	ands r2, r3
	str r6, [sp]
	mov r3, sb
	bl PutSpriteExt
	adds r7, #1
	ldrb r0, [r5, #6]
	subs r0, #1
	cmp r7, r0
	blt _080A97C4
_080A9814:
	movs r7, #1
	ldrb r0, [r5, #7]
	subs r0, #1
	cmp r7, r0
	blt _080A9820
	b _080A9930
_080A9820:
	ldr r0, _080A98B4 @ =0x000001FF
	mov sl, r0
	movs r1, #0xff
	mov sb, r1
	mov r2, r8
	adds r2, #9
	str r2, [sp, #8]
_080A982E:
	ldrb r0, [r5, #1]
	mov r1, sl
	ldrh r3, [r5, #2]
	ands r1, r3
	movs r3, #4
	ldrsh r2, [r5, r3]
	lsls r4, r7, #3
	adds r2, r2, r4
	mov r3, sb
	ands r2, r3
	ldr r3, [sp, #8]
	str r3, [sp]
	ldr r3, _080A98B8 @ =0x08B905B0
	bl PutSpriteExt
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldrb r2, [r5, #6]
	subs r2, #1
	lsls r2, r2, #3
	adds r1, r1, r2
	mov r3, sl
	ands r1, r3
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r1, r2
	movs r3, #4
	ldrsh r2, [r5, r3]
	adds r2, r2, r4
	mov r3, sb
	ands r2, r3
	ldr r3, [sp, #8]
	str r3, [sp]
	ldr r3, _080A98B8 @ =0x08B905B0
	bl PutSpriteExt
	movs r6, #1
	ldrb r0, [r5, #6]
	subs r0, #4
	adds r7, #1
	cmp r6, r0
	bge _080A98EA
_080A9884:
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	lsls r2, r6, #3
	adds r1, r1, r2
	mov r3, sl
	ands r1, r3
	movs r3, #4
	ldrsh r2, [r5, r3]
	adds r2, r2, r4
	mov r3, sb
	ands r2, r3
	mov r3, r8
	adds r3, #5
	str r3, [sp]
	ldr r3, _080A98BC @ =0x08B90608
	bl PutSpriteExt
	adds r6, #4
	ldrb r0, [r5, #6]
	subs r0, #4
	cmp r6, r0
	blt _080A9884
	b _080A98EA
	.align 2, 0
_080A98B4: .4byte 0x000001FF
_080A98B8: .4byte 0x08B905B0
_080A98BC: .4byte 0x08B90608
_080A98C0: .4byte 0x08B905E8
_080A98C4:
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	lsls r2, r6, #3
	adds r1, r1, r2
	mov r3, sl
	ands r1, r3
	movs r3, #4
	ldrsh r2, [r5, r3]
	adds r2, r2, r4
	mov r3, sb
	ands r2, r3
	mov r3, r8
	adds r3, #5
	str r3, [sp]
	ldr r3, _080A98F4 @ =0x08B905E8
	bl PutSpriteExt
	adds r6, #2
_080A98EA:
	ldrb r0, [r5, #6]
	subs r0, #2
	cmp r6, r0
	blt _080A98C4
	b _080A991E
	.align 2, 0
_080A98F4: .4byte 0x08B905E8
_080A98F8:
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	lsls r2, r6, #3
	adds r1, r1, r2
	mov r3, sl
	ands r1, r3
	movs r3, #4
	ldrsh r2, [r5, r3]
	adds r2, r2, r4
	mov r3, sb
	ands r2, r3
	mov r3, r8
	adds r3, #5
	str r3, [sp]
	ldr r3, _080A9948 @ =0x08B905B0
	bl PutSpriteExt
	adds r6, #1
_080A991E:
	ldrb r0, [r5, #6]
	subs r0, #1
	cmp r6, r0
	blt _080A98F8
	ldrb r0, [r5, #7]
	subs r0, #1
	cmp r7, r0
	bge _080A9930
	b _080A982E
_080A9930:
	ldr r1, [sp, #0xc]
	cmp r1, #3
	bgt _080A9938
	b _080A961C
_080A9938:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A9948: .4byte 0x08B905B0
