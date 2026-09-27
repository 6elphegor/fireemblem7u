	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802B8AC
sub_0802B8AC: @ 0x0802B8AC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x48
	ldrb r0, [r0]
	cmp r0, #4
	beq _0802B8C4
	ldr r0, _0802B8E0 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r0, [r0, #8]
	cmp r0, #0
	bne _0802B8C4
	b _0802BA40
_0802B8C4:
	ldr r0, _0802B8E4 @ =0x0203A514
	ldr r0, [r0]
	adds r0, #0x48
	ldrb r0, [r0]
	subs r0, #2
	cmp r0, #6
	bls _0802B8D4
	b _0802BA40
_0802B8D4:
	lsls r0, r0, #2
	ldr r1, _0802B8E8 @ =_0802B8EC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802B8E0: .4byte 0x08B857F8
_0802B8E4: .4byte 0x0203A514
_0802B8E8: .4byte _0802B8EC
_0802B8EC: @ jump table
	.4byte _0802B908 @ case 0
	.4byte _0802B94C @ case 1
	.4byte _0802B9F0 @ case 2
	.4byte _0802B9C0 @ case 3
	.4byte _0802BA40 @ case 4
	.4byte _0802BA40 @ case 5
	.4byte _0802BA00 @ case 6
_0802B908:
	ldr r0, _0802B924 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x10
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0802B928
	movs r0, #0xc8
	bl SetkeyStIgnoredMask
	adds r0, r4, #0
	bl sub_0802B870
	b _0802BA40
	.align 2, 0
_0802B924: .4byte 0x08B857F8
_0802B928:
	ldr r0, _0802B948 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802B93C
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_0802B93C:
	adds r0, r4, #0
	movs r1, #0x65
	bl Proc_Goto
	movs r0, #1
	b _0802BA42
	.align 2, 0
_0802B948: .4byte 0x0202BBF8
_0802B94C:
	ldr r0, _0802B998 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x91
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0802B99C
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802BA40
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r0, r4, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r4, #0
	adds r1, #0x42
	ldrb r1, [r1]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x6b
	bne _0802B99C
	movs r0, #0xc8
	bl SetkeyStIgnoredMask
	adds r0, r4, #0
	bl SetTradeMenuTutStatus4
	b _0802BA40
	.align 2, 0
_0802B998: .4byte 0x08B857F8
_0802B99C:
	ldr r0, _0802B9BC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802B9B0
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_0802B9B0:
	adds r0, r4, #0
	bl sub_0802B870
	movs r0, #1
	b _0802BA42
	.align 2, 0
_0802B9BC: .4byte 0x0202BBF8
_0802B9C0:
	ldr r0, _0802B9D8 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0802B9DC
	adds r0, r4, #0
	bl sub_0802B898
	b _0802BA40
	.align 2, 0
_0802B9D8: .4byte 0x08B857F8
_0802B9DC:
	ldr r0, _0802B9FC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802B9F0
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_0802B9F0:
	adds r0, r4, #0
	bl sub_0802B884
	movs r0, #1
	b _0802BA42
	.align 2, 0
_0802B9FC: .4byte 0x0202BBF8
_0802BA00:
	ldr r0, _0802BA18 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0802BA1C
	movs r0, #0
	bl SetkeyStIgnoredMask
	b _0802BA40
	.align 2, 0
_0802BA18: .4byte 0x08B857F8
_0802BA1C:
	ldr r0, _0802BA3C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802BA30
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_0802BA30:
	adds r0, r4, #0
	bl sub_0802B898
	movs r0, #1
	b _0802BA42
	.align 2, 0
_0802BA3C: .4byte 0x0202BBF8
_0802BA40:
	movs r0, #0
_0802BA42:
	pop {r4}
	pop {r1}
	bx r1
