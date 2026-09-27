	.include "macro.inc"

	.syntax unified

	thumb_func_start MenuScroll_Loop
MenuScroll_Loop: @ 0x080901EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r4, r0, #0
	ldrh r0, [r4, #0x38]
	ldrh r1, [r4, #0x36]
	adds r0, r0, r1
	mov sb, r0
	adds r0, r4, #0
	adds r0, #0x34
	ldrh r2, [r4, #0x32]
	ldrb r0, [r0]
	cmp r2, r0
	bhi _08090210
	b _08090422
_08090210:
	movs r6, #0
	adds r0, r4, #0
	adds r0, #0x2d
	mov sl, r0
	adds r3, r4, #0
	adds r3, #0x3a
	str r3, [sp, #0x14]
	adds r5, r4, #0
	adds r5, #0x3b
	str r5, [sp, #0x18]
	ldrb r0, [r0]
	cmp r6, r0
	bge _0809024C
_0809022A:
	ldrh r1, [r4, #0x2a]
	adds r0, r4, #0
	adds r0, #0x2c
	lsls r2, r6, #3
	ldrb r0, [r0]
	adds r2, r0, r2
	mov r3, sb
	str r3, [sp]
	movs r0, #4
	ldr r3, _08090334 @ =0x08CC41C4
	bl PutSpriteExt
	adds r6, #1
	mov r5, sl
	ldrb r5, [r5]
	cmp r6, r5
	blt _0809022A
_0809024C:
	cmp r6, #0
	bne _08090252
	b _080903D0
_08090252:
	mov r6, sl
	ldrb r6, [r6]
	lsls r7, r6, #0x13
	ldrh r0, [r4, #0x2e]
	str r0, [sp, #0xc]
	ldrh r5, [r4, #0x32]
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r6, [r0]
	str r0, [sp, #0x10]
	movs r1, #0x2c
	adds r1, r1, r4
	mov r8, r1
	cmp r5, r6
	bhi _08090272
	b _080903A4
_08090272:
	adds r0, r7, #0
	adds r1, r5, #0
	bl __udivsi3
	str r0, [sp, #4]
	adds r0, r7, #0
	muls r0, r6, r0
	adds r1, r5, #0
	bl __udivsi3
	str r0, [sp, #8]
	ldr r2, [sp, #0xc]
	cmp r2, #0
	beq _080902B2
	ldrh r3, [r4, #0x2a]
	ldr r5, _08090338 @ =0x00002001
	adds r1, r3, r5
	mov r6, r8
	ldrb r2, [r6]
	subs r2, #8
	ldr r3, _0809033C @ =0x08CC4270
	ldr r5, [sp, #0x14]
	ldrb r5, [r5]
	lsrs r0, r5, #3
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	mov r6, sb
	str r6, [sp]
	movs r0, #4
	bl PutSpriteExt
_080902B2:
	movs r6, #0
	ldr r0, [sp, #8]
	lsrs r5, r0, #0x13
	cmp r6, r5
	bhs _080902E8
	ldr r1, [sp, #4]
	ldr r2, [sp, #0xc]
	adds r0, r1, #0
	muls r0, r2, r0
	lsrs r7, r0, #0x14
_080902C6:
	ldrh r1, [r4, #0x2a]
	adds r1, #1
	mov r3, r8
	ldrb r3, [r3]
	adds r2, r3, r7
	lsls r0, r6, #3
	adds r2, r2, r0
	ldr r0, _08090340 @ =0x08CC421C
	ldr r3, [r0, #0x20]
	mov r0, sb
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
	adds r6, #1
	cmp r6, r5
	blo _080902C6
_080902E8:
	ldrh r1, [r4, #0x2e]
	lsrs r0, r1, #4
	ldr r2, [sp, #0x10]
	ldrb r2, [r2]
	adds r0, r2, r0
	ldrh r3, [r4, #0x32]
	cmp r0, r3
	bne _08090344
	mov r5, sl
	ldrb r5, [r5]
	lsls r0, r5, #3
	ldr r2, [sp, #4]
	ldr r3, [sp, #0xc]
	adds r1, r2, #0
	muls r1, r3, r1
	lsrs r2, r1, #0x14
	lsls r3, r6, #3
	adds r1, r2, r3
	subs r0, r0, r1
	cmp r0, #0
	beq _080903A4
	ldrh r1, [r4, #0x2a]
	adds r1, #1
	mov r5, r8
	ldrb r5, [r5]
	adds r2, r5, r2
	adds r2, r2, r3
	ldr r3, _08090340 @ =0x08CC421C
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	mov r6, sb
	str r6, [sp]
	movs r0, #4
	bl PutSpriteExt
	b _080903A4
	.align 2, 0
_08090334: .4byte 0x08CC41C4
_08090338: .4byte 0x00002001
_0809033C: .4byte 0x08CC4270
_08090340: .4byte 0x08CC421C
_08090344:
	ldr r0, [sp, #8]
	lsrs r5, r0, #0x10
	movs r0, #7
	ands r5, r0
	cmp r5, #0
	beq _0809037A
	ldrh r1, [r4, #0x2a]
	adds r1, #1
	ldr r3, [sp, #4]
	ldr r0, [sp, #0xc]
	adds r2, r3, #0
	muls r2, r0, r2
	lsrs r2, r2, #0x14
	mov r3, r8
	ldrb r3, [r3]
	adds r2, r3, r2
	lsls r0, r6, #3
	adds r2, r2, r0
	ldr r3, _08090434 @ =0x08CC421C
	lsls r0, r5, #2
	adds r0, r0, r3
	ldr r3, [r0]
	mov r5, sb
	str r5, [sp]
	movs r0, #4
	bl PutSpriteExt
_0809037A:
	ldrh r1, [r4, #0x2a]
	adds r1, #1
	mov r6, sl
	ldrb r6, [r6]
	lsls r2, r6, #3
	mov r0, r8
	ldrb r0, [r0]
	adds r2, r0, r2
	adds r2, #1
	ldr r3, _08090438 @ =0x08CC4270
	ldr r5, [sp, #0x18]
	ldrb r5, [r5]
	lsrs r0, r5, #3
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	mov r6, sb
	str r6, [sp]
	movs r0, #4
	bl PutSpriteExt
_080903A4:
	ldrh r1, [r4, #0x2a]
	mov r0, r8
	ldrb r2, [r0]
	subs r2, #8
	ldr r3, _0809043C @ =0x08CC41CC
	mov r5, sb
	str r5, [sp]
	movs r0, #4
	bl PutSpriteExt
	ldrh r1, [r4, #0x2a]
	mov r6, sl
	ldrb r6, [r6]
	lsls r2, r6, #3
	mov r0, r8
	ldrb r0, [r0]
	adds r2, r0, r2
	ldr r3, _08090440 @ =0x08CC41D4
	str r5, [sp]
	movs r0, #4
	bl PutSpriteExt
_080903D0:
	ldrh r1, [r4, #0x30]
	ldrh r0, [r4, #0x2e]
	cmp r1, r0
	beq _080903F8
	cmp r1, r0
	bls _080903E4
	ldr r1, [sp, #0x14]
	ldrb r0, [r1]
	adds r0, #3
	strb r0, [r1]
_080903E4:
	ldrh r2, [r4, #0x30]
	ldrh r3, [r4, #0x2e]
	cmp r2, r3
	bhs _080903F4
	ldr r5, [sp, #0x18]
	ldrb r0, [r5]
	adds r0, #3
	strb r0, [r5]
_080903F4:
	ldrh r0, [r4, #0x2e]
	strh r0, [r4, #0x30]
_080903F8:
	ldr r6, [sp, #0x14]
	ldrb r0, [r6]
	adds r0, #1
	movs r1, #0
	strb r0, [r6]
	ldr r2, [sp, #0x18]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r3, [r6]
	lsrs r0, r3, #3
	cmp r0, #5
	bls _08090414
	strb r1, [r6]
_08090414:
	ldr r5, [sp, #0x18]
	ldrb r5, [r5]
	lsrs r0, r5, #3
	cmp r0, #5
	bls _08090422
	ldr r6, [sp, #0x18]
	strb r1, [r6]
_08090422:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090434: .4byte 0x08CC421C
_08090438: .4byte 0x08CC4270
_0809043C: .4byte 0x08CC41CC
_08090440: .4byte 0x08CC41D4
