	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08054E00
sub_08054E00: @ 0x08054E00
	push {lr}
	strh r1, [r0, #6]
	strh r2, [r0, #8]
	bl sub_08054C8C
	pop {r0}
	bx r0
	.align 2, 0
