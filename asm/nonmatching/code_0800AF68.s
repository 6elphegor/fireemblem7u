	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800AF68
sub_0800AF68: @ 0x0800AF68
	push {lr}
	bl StartEventInternal
	pop {r1}
	bx r1
	.align 2, 0
