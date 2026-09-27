	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806B8DC
sub_0806B8DC: @ 0x0806B8DC
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0
