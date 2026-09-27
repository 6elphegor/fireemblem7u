	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080698AC
sub_080698AC: @ 0x080698AC
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0
