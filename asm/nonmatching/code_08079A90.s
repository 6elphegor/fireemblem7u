	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079A90
sub_08079A90: @ 0x08079A90
	push {lr}
	movs r0, #0x8f
	bl SetFlag
	pop {r0}
	bx r0
