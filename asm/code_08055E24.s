	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08055E24
sub_08055E24: @ 0x08055E24
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0
