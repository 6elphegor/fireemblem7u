	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08065E48
sub_08065E48: @ 0x08065E48
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0
