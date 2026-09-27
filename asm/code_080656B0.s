	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080656B0
sub_080656B0: @ 0x080656B0
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0
