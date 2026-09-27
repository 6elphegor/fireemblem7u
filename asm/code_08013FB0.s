	.include "macro.inc"

	.syntax unified

	thumb_func_start StartFastFadeToBlack
StartFastFadeToBlack: @ 0x08013FB0
	push {lr}
	movs r0, #0x40
	bl StartFadeToBlack
	pop {r0}
	bx r0
