	.include "macro.inc"

	.syntax unified

	thumb_func_start ShopTryMoveHand
ShopTryMoveHand: @ 0x080B209C
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	adds r0, r2, #0
	adds r1, r7, #0
	adds r1, #8
	strb r0, [r1]
	ldr r0, [r7]
	cmp r0, #0
	bge _080B20B8
	movs r0, #0
	str r0, [r7]
_080B20B8:
	ldr r0, [r7]
	ldr r1, [r7, #4]
	cmp r0, r1
	blt _080B20C6
	ldr r0, [r7, #4]
	subs r1, r0, #1
	str r1, [r7]
_080B20C6:
	ldr r0, [r7]
	str r0, [r7, #0xc]
	ldr r1, _080B2110 @ =0x08B857F8
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r2, #0x40
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B211C
	ldr r0, [r7]
	cmp r0, #0
	bne _080B2114
	adds r0, r7, #0
	adds r0, #8
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	beq _080B210E
	ldr r1, _080B2110 @ =0x08B857F8
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #0x40
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B210E
	ldr r0, [r7, #4]
	subs r1, r0, #1
	str r1, [r7]
_080B210E:
	b _080B211A
	.align 2, 0
_080B2110: .4byte 0x08B857F8
_080B2114:
	ldr r0, [r7]
	subs r1, r0, #1
	str r1, [r7]
_080B211A:
	b _080B216E
_080B211C:
	ldr r1, _080B2164 @ =0x08B857F8
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r2, #0x80
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B216E
	ldr r1, [r7, #4]
	subs r0, r1, #1
	ldr r1, [r7]
	cmp r1, r0
	bne _080B2168
	adds r0, r7, #0
	adds r0, #8
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	beq _080B2162
	ldr r1, _080B2164 @ =0x08B857F8
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #0x80
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B2162
	movs r0, #0
	str r0, [r7]
_080B2162:
	b _080B216E
	.align 2, 0
_080B2164: .4byte 0x08B857F8
_080B2168:
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
_080B216E:
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	cmp r0, r1
	beq _080B218E
	ldr r1, _080B2194 @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _080B218E
	ldr r1, _080B2198 @ =0x00000386
	adds r0, r1, #0
	bl m4aSongNumStart
_080B218E:
	ldr r1, [r7]
	adds r0, r1, #0
	b _080B219C
	.align 2, 0
_080B2194: .4byte 0x0202BBF8
_080B2198: .4byte 0x00000386
_080B219C:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1
