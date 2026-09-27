	.include "macro.inc"

	.syntax unified

	thumb_func_start StartFastFadeFromBlack
StartFastFadeFromBlack: @ 0x08013FD4
	push {lr}
	movs r0, #0x40
	bl StartFadeFromBlack
	pop {r0}
	bx r0
