	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800AF5C
sub_0800AF5C: @ 0x0800AF5C
	push {lr}
	movs r1, #3
	bl StartEventInternal
	pop {r1}
	bx r1
