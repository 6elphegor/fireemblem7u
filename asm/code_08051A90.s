	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08051A90
sub_08051A90: @ 0x08051A90
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0
