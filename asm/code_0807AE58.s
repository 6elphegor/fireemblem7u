	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807AE58
sub_0807AE58: @ 0x0807AE58
	push {lr}
	movs r0, #0x91
	bl SetFlag
	pop {r0}
	bx r0
