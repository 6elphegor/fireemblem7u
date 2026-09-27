	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807AE64
sub_0807AE64: @ 0x0807AE64
	push {lr}
	movs r0, #0x91
	bl ClearFlag
	pop {r0}
	bx r0
