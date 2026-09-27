	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802B134
sub_0802B134: @ 0x0802B134
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_0802B8AC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802B170
	ldr r2, _0802B16C @ =0x08B942B8
	adds r3, r4, #0
	adds r3, #0x42
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r4, [r0]
	lsls r1, r4, #2
	adds r1, r1, r4
	ldrb r3, [r3]
	adds r1, r3, r1
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r5, #0
	ldrsh r0, [r1, r5]
	lsls r0, r0, #3
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	bl PutUiHand
	b _0802B216
	.align 2, 0
_0802B16C: .4byte 0x08B942B8
_0802B170:
	adds r0, r4, #0
	bl sub_0802AEE0
	ldr r0, _0802B1C8 @ =0x08B942B8
	adds r3, r4, #0
	adds r3, #0x42
	adds r2, r4, #0
	adds r2, #0x41
	ldrb r5, [r2]
	lsls r1, r5, #2
	adds r1, r1, r5
	ldrb r3, [r3]
	adds r1, r3, r1
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r5, #2
	ldrsh r1, [r1, r5]
	lsls r1, r1, #3
	bl PutUiHand
	ldr r0, _0802B1CC @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802B1D8
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _0802B1D0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802B216
	ldr r0, _0802B1D4 @ =0x0000038A
	bl m4aSongNumStart
	b _0802B216
	.align 2, 0
_0802B1C8: .4byte 0x08B942B8
_0802B1CC: .4byte 0x08B857F8
_0802B1D0: .4byte 0x0202BBF8
_0802B1D4: .4byte 0x0000038A
_0802B1D8:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0802B204
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	ldr r0, _0802B1FC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802B216
	ldr r0, _0802B200 @ =0x0000038B
	bl m4aSongNumStart
	b _0802B216
	.align 2, 0
_0802B1FC: .4byte 0x0202BBF8
_0802B200: .4byte 0x0000038B
_0802B204:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802B216
	ldr r0, _0802B21C @ =0x08B943B0
	adds r1, r4, #0
	bl Proc_StartBlocking
_0802B216:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802B21C: .4byte 0x08B943B0
