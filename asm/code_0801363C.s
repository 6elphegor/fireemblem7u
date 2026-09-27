	.include "macro.inc"

	.syntax unified

	thumb_func_start SetPalFadeStClkEnd2
SetPalFadeStClkEnd2: @ 0x0801363C
	push {r4, lr}
	adds r4, r0, #0
	bl GetPalFadeSt
	adds r0, #0x5a
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
