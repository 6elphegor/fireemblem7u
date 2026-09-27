	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806342C
sub_0806342C: @ 0x0806342C
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0
