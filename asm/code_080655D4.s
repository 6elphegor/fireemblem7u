	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080655D4
sub_080655D4: @ 0x080655D4
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0
