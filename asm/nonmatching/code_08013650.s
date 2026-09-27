	.include "macro.inc"

	.syntax unified

	thumb_func_start SetPalFadeStClkEnd3
SetPalFadeStClkEnd3: @ 0x08013650
	push {r4, lr}
	adds r4, r0, #0
	bl GetPalFadeSt
	adds r0, #0x8a
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
