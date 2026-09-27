	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802D368
sub_0802D368: @ 0x0802D368
	push {lr}
	movs r0, #0
	bl SetOnHBlankB
	pop {r0}
	bx r0
