	.include "macro.inc"

	.syntax unified

	thumb_func_start GetPalFadeStClkEnd1
GetPalFadeStClkEnd1: @ 0x08013664
	push {lr}
	bl GetPalFadeSt
	ldrh r0, [r0, #0x2a]
	pop {r1}
	bx r1
