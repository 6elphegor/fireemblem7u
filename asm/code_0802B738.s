	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802B738
sub_0802B738: @ 0x0802B738
	push {r4, lr}
	ldr r0, _0802B76C @ =0x0203A514
	ldr r0, [r0]
	ldr r2, _0802B770 @ =0x08B942B8
	adds r3, r0, #0
	adds r3, #0x42
	adds r0, #0x41
	ldrb r4, [r0]
	lsls r1, r4, #2
	adds r1, r1, r4
	ldrb r3, [r3]
	adds r1, r3, r1
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r4, #2
	ldrsh r1, [r1, r4]
	lsls r1, r1, #3
	bl DisplayFrozenUiHand
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802B76C: .4byte 0x0203A514
_0802B770: .4byte 0x08B942B8
