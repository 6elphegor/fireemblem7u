	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08069D0C
sub_08069D0C: @ 0x08069D0C
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0
