	.include "macro.inc"

	.syntax unified

	thumb_func_start DisplayFrozenUiHandExt
DisplayFrozenUiHandExt: @ 0x0804A1E8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	subs r4, #0xc
	ldr r3, _0804A20C @ =0x08B9A860
	lsls r2, r2, #0xf
	lsrs r2, r2, #0x14
	str r2, [sp]
	movs r0, #3
	adds r1, r4, #0
	adds r2, r5, #0
	bl PutSprite
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804A20C: .4byte 0x08B9A860
