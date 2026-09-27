	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800F418
sub_0800F418: @ 0x0800F418
	push {lr}
	bl EndWM
	movs r0, #0
	pop {r1}
	bx r1
