	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08040634
sub_08040634: @ 0x08040634
	push {lr}
	bl SioReleaseIrq
	pop {r0}
	bx r0
	.align 2, 0
