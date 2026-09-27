	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802AEE0
sub_0802AEE0: @ 0x0802AEE0
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r7, #0
	ldr r0, _0802B01C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x20
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0802AF2C
	adds r6, r5, #0
	adds r6, #0x41
	ldrb r0, [r6]
	cmp r0, #1
	bne _0802AF2C
	adds r4, r5, #0
	adds r4, #0x42
	ldrb r2, [r4]
	adds r0, r5, #0
	movs r1, #0
	bl TradeMenu_GetAdjustedRow
	adds r1, r0, #0
	cmp r1, #0
	bge _0802AF14
	b _0802B014
_0802AF14:
	strb r7, [r6]
	strb r1, [r4]
	movs r7, #1
	ldr r0, _0802B020 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802AF2C
	ldr r0, _0802B024 @ =0x00000387
	bl m4aSongNumStart
_0802AF2C:
	ldr r0, _0802B01C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0802AF72
	adds r6, r5, #0
	adds r6, #0x41
	ldrb r0, [r6]
	cmp r0, #0
	bne _0802AF72
	adds r4, r5, #0
	adds r4, #0x42
	ldrb r2, [r4]
	adds r0, r5, #0
	movs r1, #1
	bl TradeMenu_GetAdjustedRow
	adds r1, r0, #0
	cmp r1, #0
	blt _0802B014
	movs r0, #1
	strb r0, [r6]
	strb r1, [r4]
	movs r7, #1
	ldr r0, _0802B020 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802AF72
	ldr r0, _0802B024 @ =0x00000387
	bl m4aSongNumStart
_0802AF72:
	ldr r0, _0802B01C @ =0x08B857F8
	ldr r1, [r0]
	ldrh r2, [r1, #6]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _0802AFBC
	adds r4, r5, #0
	adds r4, #0x42
	ldrb r0, [r4]
	cmp r0, #0
	bne _0802AFA2
	ldrh r1, [r1, #8]
	cmp r2, r1
	bne _0802B014
	adds r0, r5, #0
	adds r0, #0x41
	ldrb r1, [r0]
	adds r0, r5, #0
	movs r2, #4
	bl TradeMenu_GetAdjustedRow
	adds r0, #1
	strb r0, [r4]
_0802AFA2:
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
	movs r7, #1
	ldr r0, _0802B020 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802AFBC
	ldr r0, _0802B028 @ =0x00000386
	bl m4aSongNumStart
_0802AFBC:
	ldr r0, _0802B01C @ =0x08B857F8
	ldr r4, [r0]
	ldrh r1, [r4, #6]
	mov ip, r1
	movs r0, #0x80
	mov r6, ip
	ands r0, r6
	cmp r0, #0
	beq _0802B014
	adds r2, r5, #0
	adds r2, #0x42
	ldrb r3, [r2]
	adds r1, r5, #0
	adds r1, #0x41
	ldrb r6, [r1]
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #1
	adds r0, #1
	adds r0, r3, r0
	subs r1, #0xd
	adds r1, r1, r0
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0802AFFA
	ldrh r4, [r4, #8]
	cmp ip, r4
	bne _0802B014
	movs r0, #0xff
	strb r0, [r2]
_0802AFFA:
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	movs r7, #1
	ldr r0, _0802B020 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802B014
	ldr r0, _0802B028 @ =0x00000386
	bl m4aSongNumStart
_0802B014:
	adds r0, r7, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802B01C: .4byte 0x08B857F8
_0802B020: .4byte 0x0202BBF8
_0802B024: .4byte 0x00000387
_0802B028: .4byte 0x00000386
