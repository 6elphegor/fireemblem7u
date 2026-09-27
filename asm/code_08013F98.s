	.include "macro.inc"

	.syntax unified

	thumb_func_start StartMidFadeToBlack
StartMidFadeToBlack: @ 0x08013F98
	push {lr}
	movs r0, #0x10
	bl StartFadeToBlack
	pop {r0}
	bx r0
