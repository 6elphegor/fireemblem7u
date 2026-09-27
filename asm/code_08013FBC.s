	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08013FBC
sub_08013FBC: @ 0x08013FBC
	push {lr}
	movs r0, #0x10
	bl StartFadeFromBlack
	pop {r0}
	bx r0
