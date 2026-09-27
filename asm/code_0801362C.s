	.include "macro.inc"

	.syntax unified

	thumb_func_start SetPalFadeStClkEnd1
SetPalFadeStClkEnd1: @ 0x0801362C
	push {r4, lr}
	adds r4, r0, #0
	bl GetPalFadeSt
	strh r4, [r0, #0x2a]
	pop {r4}
	pop {r0}
	bx r0
