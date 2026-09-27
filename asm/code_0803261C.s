	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803261C
sub_0803261C: @ 0x0803261C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r6, r0, #0
	movs r1, #0
	ldr r0, _080326C0 @ =0x0202BBF8
	adds r0, #0x42
	mov r8, r0
	ldrb r2, [r0]
	lsls r0, r2, #0x1a
	cmp r0, #0
	bge _08032638
	movs r1, #5
_08032638:
	ldr r4, _080326C4 @ =0x08B905F8
	lsls r5, r1, #0xc
	movs r0, #0xa0
	lsls r0, r0, #2
	adds r0, r5, r0
	str r0, [sp]
	movs r0, #2
	movs r1, #0x38
	adds r2, r6, #0
	adds r3, r4, #0
	bl PutSprite
	movs r0, #0xa1
	lsls r0, r0, #2
	adds r0, r5, r0
	str r0, [sp]
	movs r0, #2
	movs r1, #0x58
	adds r2, r6, #0
	adds r3, r4, #0
	bl PutSprite
	movs r0, #0xa2
	lsls r0, r0, #2
	adds r0, r5, r0
	str r0, [sp]
	movs r0, #2
	movs r1, #0x78
	adds r2, r6, #0
	adds r3, r4, #0
	bl PutSprite
	ldr r4, _080326C8 @ =0x08B905B8
	movs r0, #0xa3
	lsls r0, r0, #2
	adds r0, r5, r0
	str r0, [sp]
	movs r0, #2
	movs r1, #0x98
	adds r2, r6, #0
	adds r3, r4, #0
	bl PutSprite
	ldr r7, _080326CC @ =0x08B905D0
	ldr r0, _080326D0 @ =0x0000028E
	adds r0, r5, r0
	str r0, [sp]
	movs r0, #2
	movs r1, #0xa8
	adds r2, r6, #0
	adds r3, r7, #0
	bl PutSprite
	mov r3, r8
	ldrb r3, [r3]
	lsls r0, r3, #0x1a
	cmp r0, #0
	blt _080326D8
	ldr r0, _080326D4 @ =0x0000028F
	adds r0, r5, r0
	str r0, [sp]
	movs r0, #2
	movs r1, #0xb0
	adds r2, r6, #0
	adds r3, r4, #0
	bl PutSprite
	b _080326FE
	.align 2, 0
_080326C0: .4byte 0x0202BBF8
_080326C4: .4byte 0x08B905F8
_080326C8: .4byte 0x08B905B8
_080326CC: .4byte 0x08B905D0
_080326D0: .4byte 0x0000028E
_080326D4: .4byte 0x0000028F
_080326D8:
	ldr r0, _0803270C @ =0x00000292
	adds r0, r5, r0
	str r0, [sp]
	movs r0, #2
	movs r1, #0xb0
	adds r2, r6, #0
	adds r3, r4, #0
	bl PutSprite
	movs r0, #0xa5
	lsls r0, r0, #2
	adds r0, r5, r0
	str r0, [sp]
	movs r0, #2
	movs r1, #0xc0
	adds r2, r6, #0
	adds r3, r7, #0
	bl PutSprite
_080326FE:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803270C: .4byte 0x00000292
