	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSlowFadeToBlack
StartSlowFadeToBlack: @ 0x08013FA4
	push {lr}
	movs r0, #4
	bl StartFadeToBlack
	pop {r0}
	bx r0
