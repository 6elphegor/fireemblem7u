	.include "macro.inc"

	.syntax unified

	thumb_func_start StartMidFadeFromBlack
StartMidFadeFromBlack: @ 0x08013FBC
	push {lr}
	movs r0, #0x10
	bl StartFadeFromBlack
	pop {r0}
	bx r0
