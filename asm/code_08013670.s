	.include "macro.inc"

	.syntax unified

	thumb_func_start GetPalFadeStClkEnd2
GetPalFadeStClkEnd2: @ 0x08013670
	push {lr}
	bl GetPalFadeSt
	adds r0, #0x5a
	ldrh r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
