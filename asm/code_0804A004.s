	.include "macro.inc"

	.syntax unified

	thumb_func_start DisplayFrozenUiHand
DisplayFrozenUiHand: @ 0x0804A004
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r2, r1, #0
	subs r4, #0xc
	ldr r3, _0804A024 @ =0x08B9A860
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	adds r1, r4, #0
	bl PutSprite
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804A024: .4byte 0x08B9A860
