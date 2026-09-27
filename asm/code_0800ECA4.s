	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800ECA4
sub_0800ECA4: @ 0x0800ECA4
	push {lr}
	bl Event00_
	pop {r1}
	bx r1
	.align 2, 0
