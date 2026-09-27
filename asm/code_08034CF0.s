	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08034CF0
sub_08034CF0: @ 0x08034CF0
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0
