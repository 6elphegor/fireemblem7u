	.include "macro.inc"

	.syntax unified

	thumb_func_start StartPalFadeToBlack
StartPalFadeToBlack: @ 0x08013AC8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r3, r2, #0
	ldr r0, _08013AE0 @ =0x08B92A28
	adds r1, r4, #0
	adds r2, r5, #0
	bl StartPalFade
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08013AE0: .4byte 0x08B92A28
