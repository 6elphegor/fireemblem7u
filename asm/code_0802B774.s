	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802B774
sub_0802B774: @ 0x0802B774
	push {r4, r5, lr}
	ldr r0, _0802B7D0 @ =0x0203A514
	ldr r5, [r0]
	ldr r4, _0802B7D4 @ =0x08B942B8
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
	bl DisplayFrozenUiHand
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
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802B7D0: .4byte 0x0203A514
_0802B7D4: .4byte 0x08B942B8
