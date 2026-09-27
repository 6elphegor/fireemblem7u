	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08054EBC
sub_08054EBC: @ 0x08054EBC
	push {lr}
	bl AnimUpdateAll
	pop {r0}
	bx r0
	.align 2, 0
