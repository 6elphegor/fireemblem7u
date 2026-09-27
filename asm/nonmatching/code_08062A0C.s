	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08062A0C
sub_08062A0C: @ 0x08062A0C
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0
