	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802B5E8
sub_0802B5E8: @ 0x0802B5E8
	push {r4, r5, r6, lr}
	ldr r4, [r0, #0x14]
	adds r5, r4, #0
	adds r5, #0x45
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _0802B614
	adds r2, r4, #0
	adds r2, #0x47
	adds r1, r4, #0
	adds r1, #0x46
	ldrb r3, [r1]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #1
	ldrb r2, [r2]
	adds r0, r2, r0
	subs r1, #0x12
	adds r1, r1, r0
	movs r0, #1
	strb r0, [r1]
_0802B614:
	bl CloseHelpBox
	ldr r6, _0802B674 @ =0x08B942B8
	adds r2, r4, #0
	adds r2, #0x42
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r3, [r0]
	lsls r1, r3, #2
	adds r1, r1, r3
	ldrb r2, [r2]
	adds r1, r2, r1
	lsls r1, r1, #2
	adds r1, r1, r6
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r3, #2
	ldrsh r1, [r1, r3]
	lsls r1, r1, #3
	bl PutUiHand
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _0802B66E
	adds r2, r4, #0
	adds r2, #0x44
	adds r0, r4, #0
	adds r0, #0x43
	ldrb r3, [r0]
	lsls r1, r3, #2
	adds r1, r1, r3
	ldrb r2, [r2]
	adds r1, r2, r1
	lsls r1, r1, #2
	adds r1, r1, r6
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r3, #2
	ldrsh r1, [r1, r3]
	lsls r1, r1, #3
	bl DisplayFrozenUiHand
_0802B66E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802B674: .4byte 0x08B942B8
