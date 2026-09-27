	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080101CC
sub_080101CC: @ 0x080101CC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	ldr r2, [r6, #0x38]
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r2, r1
	ldr r4, _080102E4 @ =0x0001FFFF
	ands r0, r4
	lsrs r0, r0, #5
	str r0, [sp, #4]
	ldr r1, [r6, #0x3c]
	adds r0, r1, #1
	movs r3, #0xf
	ands r0, r3
	lsls r0, r0, #0xc
	ldr r5, [sp, #4]
	orrs r5, r0
	str r5, [sp, #4]
	ands r2, r4
	lsrs r7, r2, #5
	ands r1, r3
	lsls r1, r1, #0xc
	orrs r7, r1
	ldr r1, [r6, #0x30]
	adds r4, r6, #0
	adds r4, #0x48
	ldr r2, [r6, #0x34]
	ldrh r0, [r4]
	adds r2, r0, r2
	ldr r5, _080102E8 @ =0x08B905E8
	str r7, [sp]
	movs r0, #4
	adds r3, r5, #0
	bl PutSpriteExt
	ldr r0, [r6, #0x44]
	subs r0, #2
	lsls r0, r0, #3
	ldr r1, [r6, #0x30]
	adds r1, r1, r0
	ldr r2, [r6, #0x34]
	ldrh r3, [r4]
	adds r2, r3, r2
	adds r0, r7, #4
	str r0, [sp]
	movs r0, #4
	adds r3, r5, #0
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	ldrh r0, [r4]
	adds r0, #0x18
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	adds r0, r7, #0
	adds r0, #0xd
	str r0, [sp]
	movs r0, #4
	adds r3, r5, #0
	bl PutSpriteExt
	ldr r0, [r6, #0x44]
	subs r0, #2
	lsls r0, r0, #3
	ldr r1, [r6, #0x30]
	adds r1, r1, r0
	ldrh r0, [r4]
	adds r0, #0x18
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	adds r0, r7, #0
	adds r0, #0x11
	str r0, [sp]
	movs r0, #4
	adds r3, r5, #0
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	ldrh r0, [r4]
	adds r0, #8
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	ldr r5, _080102EC @ =0x08B905B0
	adds r0, r7, #6
	str r0, [sp]
	movs r0, #4
	adds r3, r5, #0
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	ldrh r0, [r4]
	adds r0, #0x10
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	adds r0, r7, #0
	adds r0, #0xb
	str r0, [sp]
	movs r0, #4
	adds r3, r5, #0
	bl PutSpriteExt
	ldr r0, [r6, #0x44]
	subs r0, #1
	lsls r0, r0, #3
	ldr r1, [r6, #0x30]
	adds r1, r1, r0
	ldrh r0, [r4]
	adds r0, #8
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	adds r0, r7, #0
	adds r0, #0xa
	str r0, [sp]
	movs r0, #4
	adds r3, r5, #0
	bl PutSpriteExt
	ldr r0, [r6, #0x44]
	subs r0, #1
	lsls r0, r0, #3
	ldr r1, [r6, #0x30]
	adds r1, r1, r0
	ldrh r0, [r4]
	adds r0, #0x10
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	adds r0, r7, #0
	adds r0, #0xc
	str r0, [sp]
	movs r0, #4
	adds r3, r5, #0
	bl PutSpriteExt
	movs r5, #2
	b _0801030E
	.align 2, 0
_080102E4: .4byte 0x0001FFFF
_080102E8: .4byte 0x08B905E8
_080102EC: .4byte 0x08B905B0
_080102F0:
	lsls r0, r5, #3
	ldr r1, [r6, #0x30]
	adds r1, r1, r0
	adds r0, r6, #0
	adds r0, #0x48
	ldr r2, [r6, #0x34]
	ldrh r0, [r0]
	adds r2, r0, r2
	adds r0, r7, #2
	str r0, [sp]
	movs r0, #4
	ldr r3, _0801034C @ =0x08B905E8
	bl PutSpriteExt
	adds r5, #2
_0801030E:
	ldr r0, [r6, #0x44]
	subs r0, #2
	cmp r5, r0
	blt _080102F0
	ldr r0, [r6, #0x44]
	subs r0, #1
	movs r1, #0x48
	adds r1, r1, r6
	mov sl, r1
	cmp r5, r0
	bge _08010348
_08010324:
	lsls r0, r5, #3
	ldr r1, [r6, #0x30]
	adds r1, r1, r0
	ldr r2, [r6, #0x34]
	mov r3, sl
	ldrh r3, [r3]
	adds r2, r3, r2
	adds r0, r7, #2
	str r0, [sp]
	movs r0, #4
	ldr r3, _08010350 @ =0x08B905B0
	bl PutSpriteExt
	adds r5, #1
	ldr r0, [r6, #0x44]
	subs r0, #1
	cmp r5, r0
	blt _08010324
_08010348:
	movs r5, #2
	b _08010374
	.align 2, 0
_0801034C: .4byte 0x08B905E8
_08010350: .4byte 0x08B905B0
_08010354:
	lsls r0, r5, #3
	ldr r1, [r6, #0x30]
	adds r1, r1, r0
	mov r2, sl
	ldrh r0, [r2]
	adds r0, #0x18
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	adds r0, r7, #0
	adds r0, #0xf
	str r0, [sp]
	movs r0, #4
	ldr r3, _08010454 @ =0x08B905E8
	bl PutSpriteExt
	adds r5, #2
_08010374:
	ldr r0, [r6, #0x44]
	subs r0, #2
	cmp r5, r0
	blt _08010354
	movs r5, #1
	ldr r0, [r6, #0x44]
	subs r0, #2
	cmp r5, r0
	bge _080103CE
	mov sb, sl
	movs r3, #8
	adds r3, r3, r7
	mov r8, r3
_0801038E:
	lsls r4, r5, #3
	ldr r1, [r6, #0x30]
	adds r1, r1, r4
	mov r2, sb
	ldrh r0, [r2]
	adds r0, #8
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	mov r3, r8
	str r3, [sp]
	movs r0, #4
	ldr r3, _08010454 @ =0x08B905E8
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, r1, r4
	mov r2, sb
	ldrh r0, [r2]
	adds r0, #0x10
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	mov r3, r8
	str r3, [sp]
	movs r0, #4
	ldr r3, _08010454 @ =0x08B905E8
	bl PutSpriteExt
	adds r5, #2
	ldr r0, [r6, #0x44]
	subs r0, #2
	cmp r5, r0
	blt _0801038E
_080103CE:
	ldr r0, [r6, #0x44]
	subs r0, #1
	cmp r5, r0
	bge _0801041A
	mov r8, sl
	ldr r0, _08010458 @ =0x08B905B0
	mov sb, r0
	adds r7, #8
_080103DE:
	lsls r4, r5, #3
	ldr r1, [r6, #0x30]
	adds r1, r1, r4
	mov r2, r8
	ldrh r0, [r2]
	adds r0, #8
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	str r7, [sp]
	movs r0, #4
	mov r3, sb
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, r1, r4
	mov r3, r8
	ldrh r0, [r3]
	adds r0, #0x10
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	str r7, [sp]
	movs r0, #4
	mov r3, sb
	bl PutSpriteExt
	adds r5, #1
	ldr r0, [r6, #0x44]
	subs r0, #1
	cmp r5, r0
	blt _080103DE
_0801041A:
	ldr r4, [sp, #4]
	movs r7, #8
	movs r5, #2
_08010420:
	ldr r1, [r6, #0x30]
	adds r1, r1, r7
	mov r2, sl
	ldrh r0, [r2]
	adds r0, #8
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	str r4, [sp]
	movs r0, #0
	ldr r3, _0801045C @ =0x08B905F8
	bl PutSpriteExt
	adds r4, #4
	adds r7, #0x20
	subs r5, #1
	cmp r5, #0
	bge _08010420
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08010454: .4byte 0x08B905E8
_08010458: .4byte 0x08B905B0
_0801045C: .4byte 0x08B905F8
