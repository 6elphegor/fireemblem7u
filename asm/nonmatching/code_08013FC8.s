	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSlowFadeFromBlack
StartSlowFadeFromBlack: @ 0x08013FC8
	push {lr}
	movs r0, #4
	bl StartFadeFromBlack
	pop {r0}
	bx r0
