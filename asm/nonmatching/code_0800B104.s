	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800B104
sub_0800B104: @ 0x0800B104
	push {lr}
	bl UnlockGame
	pop {r0}
	bx r0
	.align 2, 0
