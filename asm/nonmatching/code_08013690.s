	.include "macro.inc"

	.syntax unified

	thumb_func_start SetPalFadeStClkEnd
SetPalFadeStClkEnd: @ 0x08013690
	push {r4, r5, lr}
	adds r4, r1, #0
	adds r5, r2, #0
	bl SetPalFadeStClkEnd1
	adds r0, r4, #0
	bl SetPalFadeStClkEnd2
	adds r0, r5, #0
	bl SetPalFadeStClkEnd3
	pop {r4, r5}
	pop {r0}
	bx r0
