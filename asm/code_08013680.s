	.include "macro.inc"

	.syntax unified

	thumb_func_start GetPalFadeStClkEnd3
GetPalFadeStClkEnd3: @ 0x08013680
	push {lr}
	bl GetPalFadeSt
	adds r0, #0x8a
	ldrh r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
