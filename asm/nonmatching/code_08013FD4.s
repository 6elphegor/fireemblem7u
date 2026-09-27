	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08013FD4
sub_08013FD4: @ 0x08013FD4
	push {lr}
	movs r0, #0x40
	bl StartFadeFromBlack
	pop {r0}
	bx r0
