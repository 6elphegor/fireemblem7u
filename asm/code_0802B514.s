	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802B514
sub_0802B514: @ 0x0802B514
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	ldr r4, [r0, #0x14]
	adds r0, r4, #0
	bl sub_0802AEE0
	adds r6, r4, #0
	adds r6, #0x41
	ldrb r7, [r6]
	lsls r5, r7, #2
	adds r1, r4, #0
	adds r1, #0x2c
	adds r1, r1, r5
	ldr r1, [r1]
	movs r2, #0x42
	adds r2, r2, r4
	mov r8, r2
	ldrb r3, [r2]
	lsls r2, r3, #1
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r2, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802B566
	ldr r0, _0802B5E0 @ =0x08B942B8
	adds r1, r5, r7
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r3, #0
	ldrsh r0, [r1, r3]
	lsls r0, r0, #3
	movs r3, #2
	ldrsh r1, [r1, r3]
	lsls r1, r1, #3
	bl StartItemHelpBox
_0802B566:
	ldr r0, _0802B5E4 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0802B57C
	mov r0, sb
	bl Proc_Break
_0802B57C:
	ldr r5, _0802B5E0 @ =0x08B942B8
	ldrb r0, [r6]
	lsls r1, r0, #2
	adds r1, r1, r0
	mov r2, r8
	ldrb r2, [r2]
	adds r1, r2, r1
	lsls r1, r1, #2
	adds r1, r1, r5
	movs r3, #0
	ldrsh r0, [r1, r3]
	lsls r0, r0, #3
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	bl PutUiHand
	adds r0, r4, #0
	adds r0, #0x45
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0802B5D2
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
	adds r1, r1, r5
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r3, #2
	ldrsh r1, [r1, r3]
	lsls r1, r1, #3
	bl DisplayFrozenUiHand
_0802B5D2:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802B5E0: .4byte 0x08B942B8
_0802B5E4: .4byte 0x08B857F8
