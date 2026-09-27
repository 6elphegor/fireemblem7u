	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802B288
sub_0802B288: @ 0x0802B288
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_0802B8AC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802B2EC
	ldr r4, _0802B2E8 @ =0x08B942B8
	adds r2, r5, #0
	adds r2, #0x42
	adds r0, r5, #0
	adds r0, #0x41
	ldrb r3, [r0]
	lsls r1, r3, #2
	adds r1, r1, r3
	ldrb r2, [r2]
	adds r1, r2, r1
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r3, #2
	ldrsh r1, [r1, r3]
	lsls r1, r1, #3
	bl PutUiHand
	adds r2, r5, #0
	adds r2, #0x44
	adds r0, r5, #0
	adds r0, #0x43
	ldrb r3, [r0]
	lsls r1, r3, #2
	adds r1, r1, r3
	ldrb r2, [r2]
	adds r1, r2, r1
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r3, #2
	ldrsh r1, [r1, r3]
	lsls r1, r1, #3
	bl DisplayFrozenUiHand
	b _0802B3B2
	.align 2, 0
_0802B2E8: .4byte 0x08B942B8
_0802B2EC:
	adds r0, r5, #0
	bl sub_0802AEE0
	ldr r4, _0802B364 @ =0x08B942B8
	adds r2, r5, #0
	adds r2, #0x42
	adds r0, r5, #0
	adds r0, #0x41
	ldrb r3, [r0]
	lsls r1, r3, #2
	adds r1, r1, r3
	ldrb r2, [r2]
	adds r1, r2, r1
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r3, #2
	ldrsh r1, [r1, r3]
	lsls r1, r1, #3
	bl PutUiHand
	adds r0, r5, #0
	adds r0, #0x44
	adds r2, r5, #0
	adds r2, #0x43
	ldrb r3, [r2]
	lsls r1, r3, #2
	adds r1, r1, r3
	ldrb r0, [r0]
	adds r1, r0, r1
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r3, #2
	ldrsh r1, [r1, r3]
	lsls r1, r1, #3
	bl DisplayFrozenUiHand
	ldr r0, _0802B368 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802B374
	adds r0, r5, #0
	bl sub_0802B02C
	ldr r0, _0802B36C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802B38E
	ldr r0, _0802B370 @ =0x0000038A
	b _0802B38A
	.align 2, 0
_0802B364: .4byte 0x08B942B8
_0802B368: .4byte 0x08B857F8
_0802B36C: .4byte 0x0202BBF8
_0802B370: .4byte 0x0000038A
_0802B374:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0802B3A0
	ldr r0, _0802B398 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802B38E
	ldr r0, _0802B39C @ =0x0000038B
_0802B38A:
	bl m4aSongNumStart
_0802B38E:
	adds r0, r5, #0
	bl Proc_Break
	b _0802B3B2
	.align 2, 0
_0802B398: .4byte 0x0202BBF8
_0802B39C: .4byte 0x0000038B
_0802B3A0:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802B3B2
	ldr r0, _0802B3B8 @ =0x08B943B0
	adds r1, r5, #0
	bl Proc_StartBlocking
_0802B3B2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802B3B8: .4byte 0x08B943B0
